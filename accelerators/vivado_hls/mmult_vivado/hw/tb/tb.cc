// Copyright (c) 2011-2026 Columbia University, System Level Design Group
// SPDX-License-Identifier: Apache-2.0
#include "../inc/espacc_config.h"
#include "../inc/espacc.h"

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {

    printf("=== MMULT TEST === \n");

    /* <<- Params ->> */
	const unsigned N = 32;
	const unsigned SHIFT = 8;
    printf("Params:\n");
    printf("N: %u\n", N);
    printf("SHIFT: %u\n", SHIFT);
    printf("DMA_SIZE: %u\n", DMA_SIZE);
    printf("DATA_BITWIDTH: %u\n", DATA_BITWIDTH);
    printf("VALUES_PER_WORD: %u\n", VALUES_PER_WORD);


    /* <<- Memory Geometry ->> */
    /*
    * Every input chunk contains:
    *   N row elements from A
    *   N col elements from B
    * Therefore:
    *   2*N values per chunk.
    * And we have N*N chunks.
    */
    const unsigned input_values = round_up(2 * N, VALUES_PER_WORD);
    const unsigned input_chunks = N * N;
    const unsigned input_elements = input_values * input_chunks;
    const unsigned dma_in_size = input_elements / VALUES_PER_WORD;

    /*
    * Output contains N rows, each containing N elements
    */
    const unsigned output_values = round_up(N, VALUES_PER_WORD);
    const unsigned output_elements = output_values * N;
    const unsigned dma_out_size = output_elements / VALUES_PER_WORD;

    // Complete shared DMA memory
    const unsigned dma_size = dma_in_size + dma_out_size;
    // const unsigned in_words_adj = round_up(2 * N, VALUES_PER_WORD);
    // const unsigned out_words_adj = round_up(N * N, VALUES_PER_WORD);
    // const unsigned dma_in_size = in_words_adj / VALUES_PER_WORD;
    // const unsigned dma_out_size = out_words_adj / VALUES_PER_WORD;
    // const unsigned dma_size = dma_in_size + dma_out_size;

    // printf("Params:\n");
    // printf("N: %u\n", N);
    // printf("SHIFT: %u\n", SHIFT);

    dma_word_t *mem = (dma_word_t*) malloc(dma_size * sizeof(dma_word_t));
    word_t *A = (word_t*) malloc(N * N * sizeof(word_t));
    word_t *B = (word_t*) malloc(N * N * sizeof(word_t));
    word_t *C_hw = (word_t*) malloc(N * N * sizeof(word_t));
    word_t *C_gold = (word_t*) malloc(N * N * sizeof(word_t));

    if (!mem || !A || !B || !C_hw || !C_gold) {
        printf("Allocation failed!\n");
        return 1;
    }

    /*
     * Clear DMA memory first.
     */
    for (unsigned i = 0; i < dma_size; i++) {
        for (unsigned j = 0; j < VALUES_PER_WORD; j++) {
            mem[i].word[j] = 0;
        }
    }

    // Prepare input data
    for (unsigned i = 0; i < N * N; i++) {
        A[i] = i + 1;
        B[i] = 1;
    }

    // Compute golden output
gold_i:
    for (unsigned i = 0; i < N; i++) {
gold_j:
        for (unsigned j = 0; j < N; j++) {
            ap_int<32> acc = 0;
gold_k:
            for (unsigned k = 0; k < N; k++) {
                 acc += (ap_int<32>)A[i * N + k] *
                            (ap_int<32>)B[k * N + j];
            }
            ap_int<32> scaled = acc >> SHIFT;

            // Saturate to INT8 range
            if (scaled > 127) {
                scaled = 127;
            }
            else if (scaled < -128) {
                scaled = -128;

            }
            C_gold[i * N + j] = (word_t) scaled;
        }
    }

    // Pack DMA memory
    word_t *input_buffer = (word_t*) malloc(input_elements * sizeof(word_t));

    if (!input_buffer) {
        printf("Input buffer allocation failed!\n");
        return 1;
    }

    // Clear padding
    for (unsigned i = 0; i < input_elements; i++) {
        input_buffer[i] = 0;
    }

pack_rows:
    for (unsigned row = 0; row < N; row++) {
pack_cols:
        for (unsigned col = 0; col < N; col++) {
            const unsigned chunk = row * N + col;
            const unsigned base = chunk * input_values;
            // First N values: A[row,:]
            for (unsigned k = 0; k < N; k++) {

                input_buffer[base + k] = A[row * N + k];
            }
            // Next N values: B[:,col]
            for (unsigned k = 0; k < N; k++) {
                input_buffer[base + N + k] = B[k * N + col];
            }
        }
    }

    // Pack scalar input_buffer into dma_word_t memory
pack_dma:
    for (unsigned i = 0; i < dma_in_size; i++)
        for (unsigned k = 0; k < VALUES_PER_WORD; k++)
            mem[i].word[k] = input_buffer[i * VALUES_PER_WORD + k];

    // for (unsigned i = 0; i < N * N; i++) {
    //     input_buffer[i] = A[i];
    //     input_buffer[N * N + i] = B[i];
    // }
    // // Put A and B into DRAM
    // for (unsigned i = 0; i < dma_in_size; i++) {
    //     for (unsigned k = 0; k < VALUES_PER_WORD; k++) {
    //         mem[i].word[k] = input_buffer[i * VALUES_PER_WORD + k];
    //     }
    // }

    // Run accelerator
    dma_info_t load;
    dma_info_t store;

    top(mem,
        mem,
        /* <<- Args ->> */
        N,
        SHIFT,
        load,
        store);

    // Read outputs
    uint32_t out_offset = dma_in_size;
    for (unsigned row = 0; row < N; row++) {
        const unsigned row_dma_offset =
            out_offset + row *(
                output_values
                / VALUES_PER_WORD);

        for (unsigned i = 0;
                i < output_values / VALUES_PER_WORD; i++)
        {
            for (unsigned k = 0; k < VALUES_PER_WORD; k++)
            {
                const unsigned col = i * VALUES_PER_WORD + k;
                if (col < N) {
                    C_hw[row * N + col] = mem[row_dma_offset + i].word[k];
                }
            }
        }
    }

    // for(unsigned i = 0; i < dma_out_size; i++) {
    //     for(unsigned k = 0; k < VALUES_PER_WORD; k++) {
	   //      C_hw[i * VALUES_PER_WORD + k] = mem[out_offset + i].word[k];
    //     }
    // }

    // Compare against golden model
    int errors = 0;
compare:
    for (unsigned i = 0; i < N * N; i++) {
        if (C_hw[i] != C_gold[i]) {
            if (errors < 20) {
                const unsigned row = i / N;
                const unsigned col = i % N;
                printf(
                    "Mismatch @ [%u][%u] (index %u): "
                    "HW=%d GOLD=%d\n",
                    row,
                    col,
                    i,
                    (int) C_hw[i],
                    (int) C_gold[i]
                );
            }
            errors++;
        }
    }
    printf("\n");

    // for(unsigned i = 0; i < 1; i++) {
    //     for(unsigned j = 0; j < N * N; j++) {
    //         if (C_hw[i * out_words_adj + j] != C_gold[i * out_words_adj + j]) {
    //             printf("Mismatch @ %u: HW=%d GOLD=%d\n",
    //                 j,
    //                 (int)C_hw[i * out_words_adj + j],
    //                 (int)C_gold[i * out_words_adj + j]);
    //                 errors++;
    //         }
    //     }
    // }

    if (errors) {
        std::cout << "Test FAILED with " << errors << " errors." << std::endl;
        return 0;
    }
    else {
        std::cout << "Test PASSED." << std::endl;
    }


    // Free memory
    free(mem);
    free(A);
    free(B);
    free(C_hw);
    free(C_gold);
    free(input_buffer);

    return 0;
}
