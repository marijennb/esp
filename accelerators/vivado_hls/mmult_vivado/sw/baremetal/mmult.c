/* Copyright (c) 2011-2026 Columbia University, System Level Design Group */
/* SPDX-License-Identifier: Apache-2.0 */

#include <stdio.h>
#include <stdint.h>

#ifndef __riscv
#include <stdlib.h>
#endif

#include <esp_accelerator.h>
#include <esp_probe.h>
#include <fixed_point.h>

typedef int8_t token_t;

/*
 * Accelerator identification
 */
#define SLD_MMULT 0x04a
#define DEV_NAME  "sld,mmult_vivado"

/*
 * MMULT parameters
 */
#define N       32
#define SHIFT   8

/*
 * User-defined MMULT registers
 */
#define MMULT_SHIFT_REG 0x40
#define MMULT_N_REG     0x44

/*
 * Scatter/gather configuration
 */
#define CHUNK_SHIFT 20
#define CHUNK_SIZE  BIT(CHUNK_SHIFT)

#define NCHUNK(_sz) \
    (((_sz) % CHUNK_SIZE == 0) ? \
     ((_sz) / CHUNK_SIZE) : \
     ((_sz) / CHUNK_SIZE) + 1)

/*
 * Number of token_t elements in one DMA beat.
 *
 * On Ibex:
 *
 *   sizeof(void *) = 4
 *   sizeof(token_t) = 1
 *
 * therefore:
 *
 *   VALUES_PER_WORD = 4
 */
static unsigned dma_values_per_word(void)
{
    return sizeof(void *) / sizeof(token_t);
}

/*
 * Saturate a signed 32-bit value to int8_t.
 */
static token_t saturate_int8(int32_t x)
{
    if (x > 127)
        return 127;

    if (x < -128)
        return -128;

    return (token_t)x;
}

/*
 * ------------------------------------------------------------------
 * Create ordinary A and B matrices.
 * ------------------------------------------------------------------
 *
 * We deliberately choose:
 *
 *      A = 16 * I
 *
 * and
 *
 *      B[r][c] = 16 * (((r + c) % 7) + 1)
 *
 * With SHIFT = 8:
 *
 *      C = (A * B) >> 8
 *
 * Since A is 16*I:
 *
 *      A * B = 16 * B
 *
 * and B itself contains 16*pattern:
 *
 *      C = (16 * 16 * pattern) >> 8
 *        = pattern
 *
 * Therefore the expected result contains small values 1..7.
 */
static void make_matrices(token_t *A, token_t *B)
{
    int r;
    int c;

    for (r = 0; r < N; r++) {
        for (c = 0; c < N; c++) {

            A[r * N + c] = 0;

            B[r * N + c] =
                (token_t)(16 * (((r + c) % 7) + 1));
        }
    }

    for (r = 0; r < N; r++)
        A[r * N + r] = 16;
}

/*
 * ------------------------------------------------------------------
 * Produce the input layout expected by the current HLS accelerator.
 * ------------------------------------------------------------------
 *
 * There are N*N chunks.
 *
 * For output C[row][col], chunk = row*N + col.
 *
 * Each chunk contains:
 *
 *      A[row][0]
 *      A[row][1]
 *      ...
 *      A[row][N-1]
 *
 *      B[0][col]
 *      B[1][col]
 *      ...
 *      B[N-1][col]
 *
 * Therefore:
 *
 *      elements per chunk = 2*N
 *
 *      total input elements
 *          = N*N*(2*N)
 *          = 2*N^3
 *
 * For N=32:
 *
 *      1024 chunks
 *      64 bytes/chunk
 *      65536 input bytes
 */
static void pack_accelerator_input(
    token_t *input,
    const token_t *A,
    const token_t *B)
{
    int row;
    int col;
    int k;

    for (row = 0; row < N; row++) {

        for (col = 0; col < N; col++) {

            unsigned chunk = row * N + col;

            unsigned base =
                chunk * (2 * N);

            /*
             * First half:
             * row from A
             */
            for (k = 0; k < N; k++) {
                input[base + k] =
                    A[row * N + k];
            }

            /*
             * Second half:
             * column from B
             */
            for (k = 0; k < N; k++) {
                input[base + N + k] =
                    B[k * N + col];
            }
        }
    }
}

/*
 * ------------------------------------------------------------------
 * Software GEMM golden model.
 * ------------------------------------------------------------------
 */
static void compute_gold(
    const token_t *A,
    const token_t *B,
    token_t *gold)
{
    int row;
    int col;
    int k;

    for (row = 0; row < N; row++) {

        for (col = 0; col < N; col++) {

            int32_t acc = 0;

            for (k = 0; k < N; k++) {

                acc +=
                    (int32_t)A[row * N + k] *
                    (int32_t)B[k * N + col];
            }

            /*
             * Same fixed-point scaling used by hardware.
             */
            acc >>= SHIFT;

            gold[row * N + col] =
                saturate_int8(acc);
        }
    }
}

/*
 * ------------------------------------------------------------------
 * Validate full N*N output.
 * ------------------------------------------------------------------
 */
static unsigned validate(
    const token_t *out,
    const token_t *gold)
{
    unsigned errors = 0;

    int row;
    int col;

    for (row = 0; row < N; row++) {

        for (col = 0; col < N; col++) {

            unsigned idx =
                row * N + col;

            if (out[idx] != gold[idx]) {

                /*
                 * Limit Transcript spam.
                 */
                if (errors < 20) {

                    printf(
                        "Mismatch C[%d][%d]: HW=%d GOLD=%d\n",
                        row,
                        col,
                        (int)out[idx],
                        (int)gold[idx]);
                }

                errors++;
            }
        }
    }

    return errors;
}

int main(int argc, char *argv[])
{
    struct esp_device *espdevs;
    struct esp_device *dev;

    token_t *mem;
    token_t *input;
    token_t *output;

    token_t *A;
    token_t *B;
    token_t *gold;

    unsigned **ptable;

    unsigned values_per_word;

    unsigned input_elements;
    unsigned output_elements;

    unsigned input_elements_adj;
    unsigned output_elements_adj;

    unsigned input_size;
    unsigned output_size;
    unsigned mem_size;

    unsigned output_offset;

    unsigned done;
    unsigned errors;

    unsigned coherence;

    int ndev;
    int i;

    printf("\n");
    printf("========================================\n");
    printf(" MMULT bare-metal RTL test\n");
    printf(" N     = %d\n", N);
    printf(" SHIFT = %d\n", SHIFT);
    printf("========================================\n");

    /*
     * --------------------------------------------------------------
     * Calculate accelerator buffer geometry.
     * --------------------------------------------------------------
     *
     * Current accelerator:
     *
     *   N*N chunks
     *   2*N values per chunk
     */
    input_elements =
        N * N * (2 * N);

    output_elements =
        N * N;

    values_per_word =
        dma_values_per_word();

    if (values_per_word == 0) {

        input_elements_adj =
            input_elements;

        output_elements_adj =
            output_elements;
    }
    else {

        input_elements_adj =
            round_up(
                input_elements,
                values_per_word);

        output_elements_adj =
            round_up(
                output_elements,
                values_per_word);
    }

    input_size =
        input_elements_adj *
        sizeof(token_t);

    output_size =
        output_elements_adj *
        sizeof(token_t);

    /*
     * Offset is in token_t elements.
     */
    output_offset =
        input_elements_adj;

    mem_size =
        input_size +
        output_size;

    printf("Input elements : %u\n",
            input_elements);

    printf("Input bytes    : %u\n",
            input_size);

    printf("Output elements: %u\n",
            output_elements);

    printf("Output bytes   : %u\n",
            output_size);

    printf("Total bytes    : %u\n",
            mem_size);

    printf("Chunks         : %d\n",
           N * N);

    printf("Values/chunk   : %d\n",
           2 * N);

    printf("DMA words/chunk: %d\n",
           (2 * N) / values_per_word);

    /*
     * For N=32 we expect:
     *
     * input  = 65536 bytes
     * output = 1024 bytes
     * total  = 66560 bytes
     */
    printf("\nScanning device tree...\n");

    /*
     * --------------------------------------------------------------
     * Find MMULT.
     * --------------------------------------------------------------
     */
    ndev = probe(
        &espdevs,
        VENDOR_SLD,
        SLD_MMULT,
        DEV_NAME);

    if (ndev == 0) {

        printf(
            "ERROR: MMULT accelerator not found\n");

        return 1;
    }

    printf(
        "Found %d MMULT accelerator(s)\n",
        ndev);

    /*
     * Use first MMULT accelerator.
     */
    dev = &espdevs[0];

    /*
     * --------------------------------------------------------------
     * Verify DMA scatter/gather support.
     * --------------------------------------------------------------
     */
    if (ioread32(
            dev,
            PT_NCHUNK_MAX_REG) == 0) {

        printf(
            "ERROR: scatter/gather DMA disabled\n");

        return 1;
    }

    if (ioread32(
            dev,
            PT_NCHUNK_MAX_REG)
        < NCHUNK(mem_size)) {

        printf(
            "ERROR: not enough TLB entries\n");

        return 1;
    }

    /*
     * --------------------------------------------------------------
     * Allocate memory.
     * --------------------------------------------------------------
     */
    mem =
        aligned_malloc(mem_size);

    A =
        aligned_malloc(
            N * N * sizeof(token_t));

    B =
        aligned_malloc(
            N * N * sizeof(token_t));

    gold =
        aligned_malloc(
            N * N * sizeof(token_t));

    ptable =
        aligned_malloc(
            NCHUNK(mem_size) *
            sizeof(unsigned *));

    if (!mem ||
        !A ||
        !B ||
        !gold ||
        !ptable) {

        printf(
            "ERROR: aligned_malloc failed\n");

        return 1;
    }

    input =
        &mem[0];

    output =
        &mem[output_offset];

    printf(
        "memory buffer = %p\n",
        mem);

    printf(
        "output        = %p\n",
        output);

    /*
     * --------------------------------------------------------------
     * Build accelerator page table.
     * --------------------------------------------------------------
     */
    for (i = 0; i < NCHUNK(mem_size); i++) {
        ptable[i] =
            (unsigned *)
            &mem[
                i *
                (CHUNK_SIZE /
                sizeof(token_t))
            ];
    }

    printf(
        "ptable        = %p\n",
        ptable);

    printf(
        "nchunk        = %lu\n",
        NCHUNK(mem_size));

    /*
     * --------------------------------------------------------------
     * Generate input.
     * --------------------------------------------------------------
     */
    printf("\nGenerating matrices...\n");

    make_matrices(A, B);

    pack_accelerator_input(
        input,
        A,
        B);

    compute_gold(
        A,
        B,
        gold);

    /*
     * Fill output with recognizable garbage.
     *
     * If store() never runs, this remains -99.
     */
    for (i = 0; i < output_elements_adj; i++) {
        output[i] = (token_t)-99;
    }

    /*
     * --------------------------------------------------------------
     * Configure ESP accelerator socket.
     *
     * Only ACC_COH_NONE while debugging RTL.
     * --------------------------------------------------------------
     */
    coherence =
        ACC_COH_NONE;

    printf(
        "Configuring ESP DMA...\n");

    iowrite32(
        dev,
        COHERENCE_REG,
        coherence);

    /*
     * Ibex is RV32, therefore uintptr_t is 32 bits.
     *
     * This avoids the pointer-size warning from:
     *
     *   (unsigned long long)ptable
     */
    iowrite32(
        dev,
        PT_ADDRESS_REG,
        (uint32_t)(uintptr_t)ptable);

    iowrite32(
        dev,
        PT_NCHUNK_REG,
        NCHUNK(mem_size));

    iowrite32(
        dev,
        PT_SHIFT_REG,
        CHUNK_SHIFT);

    iowrite32(
        dev,
        SRC_OFFSET_REG,
        0x0);

    iowrite32(
        dev,
        DST_OFFSET_REG,
        0x0);

    /*
     * --------------------------------------------------------------
     * Accelerator-specific registers.
     * --------------------------------------------------------------
     */
    printf(
        "Writing N=%d SHIFT=%d\n",
        N,
        SHIFT);

    iowrite32(
        dev,
        MMULT_N_REG,
        N);

    iowrite32(
        dev,
        MMULT_SHIFT_REG,
        SHIFT);

    /*
     * Ensure CPU stores have reached memory.
     */
    esp_flush(coherence);

    /*
     * --------------------------------------------------------------
     * START.
     * --------------------------------------------------------------
     */
    printf("\nStarting MMULT...\n");

    iowrite32(
        dev,
        CMD_REG,
        CMD_MASK_START);

    /*
     * --------------------------------------------------------------
     * Poll until done.
     * --------------------------------------------------------------
     */
    done = 0;

    while (!done) {

        done =
            ioread32(
                dev,
                STATUS_REG);

        done &=
            STATUS_MASK_DONE;
    }

    /*
     * Clear start command.
     */
    iowrite32(
        dev,
        CMD_REG,
        0x0);

    printf(
        "MMULT completed!\n");

    /*
     * --------------------------------------------------------------
     * Validate.
     * --------------------------------------------------------------
     */
    printf(
        "Validating %d outputs...\n",
        N * N);

    errors =
        validate(
            output,
            gold);

    if (errors == 0) {

        printf("\n");
        printf("=========================\n");
        printf(" MMULT TEST PASSED\n");
        printf("=========================\n");
    }
    else {

        printf("\n");
        printf("=========================\n");
        printf(" MMULT TEST FAILED\n");
        printf(" errors = %u / %d\n",
                errors,
                N * N);
        printf("=========================\n");
    }

    /*
     * Print first row for easy Transcript inspection.
     */
    printf("\nFirst output row:\n");

    for (i = 0; i < N; i++)
        printf("%d ", (int)output[i]);

    printf("\n");

    printf("Expected first row:\n");

    for (i = 0; i < N; i++)
        printf("%d ", (int)gold[i]);

    printf("\n");

    /*
     * --------------------------------------------------------------
     * Cleanup.
     * --------------------------------------------------------------
     */
    aligned_free(ptable);

    aligned_free(mem);

    aligned_free(A);

    aligned_free(B);

    aligned_free(gold);

    return errors ? 1 : 0;
}
