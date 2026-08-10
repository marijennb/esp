// Copyright (c) 2011-2026 Columbia University, System Level Design Group
// SPDX-License-Identifier: Apache-2.0
#include "../inc/espacc_config.h"
#include "../inc/espacc.h"
#include "hls_stream.h"
#include "hls_math.h"
#include <cstring>

const int TILE = 32;

/*
* Loads words input data from DRAM into local buffer.
* @param _inbuff: Local input buffer.
* @param in1: Pointer to external memory (DRAM);
*               data comes in packed format (dma_word_t)
* @param N: GEMM parameter, number of elements
* @param SHIFT: GEMM parameter -- shift width
* @param load_ctrl: Controls signals for the DMA engine ie:
*   tells where and how much to read
* @param chunk: Current chunk
* @param batch: Current batch
*/
void load(word_t _inbuff[SIZE_IN_CHUNK_DATA],
            dma_word_t *in1,
            /* <<--compute-params-->> */
            const unsigned N,
            dma_info_t &load_ctrl,
            int chunk, int batch)
{
load_data:
    // Load 2 * N elements at a time
    const unsigned elements = round_up(2 * N, VALUES_PER_WORD);

    // Each chunk is flattened.
    // chunk = row * N + col
    // There are N * N chunks per matrix multiplication
    const unsigned index = elements * (batch * N * N + chunk);

    // Compute number of DMA packets
    unsigned dma_length = elements / VALUES_PER_WORD;
    unsigned dma_index = index / VALUES_PER_WORD;

    printf(
        "LOAD Chunk: %d, Elements: %u, DMA Length: %u, DMA Index: %u\n\n",
        chunk,
        elements,
        dma_length,
        dma_index
    );

    // Configure DMA
    load_ctrl.index = dma_index;
    load_ctrl.length = dma_length;
    load_ctrl.size = SIZE_WORD_T;
    load_ctrl.user = 0;

    // Load packed DMA words and unpack them into
    // 8-bit word values
    for (unsigned i = 0; i < dma_length; i++) {
    load_label0:
        // Load the entire dma_word_t...
        dma_word_t temp = in1[dma_index + i];
        // ..and unpack locally
        for(unsigned j = 0; j < VALUES_PER_WORD; j++) {
            // Elements may contain padding due to round_up(),
            // so only copy actual matrix elements
            const unsigned local_index = i * VALUES_PER_WORD + j;

            if (local_index < 2 * N) {
                _inbuff[local_index] = temp.word[j];
            }
        }
    }
}


/*
* Stores one whole row of C.
* @param _outbuff: contains [0...N-1] row elements from C
* @param N: GEMM parameter, number of elements
* @param store_ctrl: Controls signals for the DMA engine ie:
*   tells where and how much to read
* @param chunk: output row number
* @param batch: current batch
*/
void store(word_t _outbuff[SIZE_OUT_CHUNK_DATA],
            dma_word_t *out,
            /* <<--compute-params-->> */
            const unsigned N,
            dma_info_t &store_ctrl,
            int chunk,
            int batch)
{
store_data:
    // Padded input elements in one chunk
    const unsigned input_length = round_up(2* N, VALUES_PER_WORD);

    // We have N*N input chunks
    const unsigned input_region_size = input_length * N * N;

    // Number of elements in one output row
    const unsigned output_length = round_up(N, VALUES_PER_WORD);

    // Output C starts immediately after all input chunks
    const unsigned index = input_region_size + output_length
                            * (batch * N + chunk);


    // const unsigned length = round_up(N, VALUES_PER_WORD) / 32;
    // const unsigned store_offset = round_up(2 * N * N, VALUES_PER_WORD) * 1;
    // const unsigned out_offset = store_offset;
    // const unsigned index = out_offset + length * (batch * 32 + chunk);
    // const unsigned index = out_offset + length * (batch * 1 + chunk);

    unsigned dma_length = output_length / VALUES_PER_WORD;
    unsigned dma_index = index / VALUES_PER_WORD;

    printf(
        "STORE Row = %d, Elements = %u, DMA Length = %u, DMA Index = %u\n\n",
        chunk,
        output_length,
        dma_length,
        dma_index
    );

    store_ctrl.index = dma_index;
    store_ctrl.length = dma_length;
    store_ctrl.size = SIZE_WORD_T;
    store_ctrl.user = 0;

    // Pack one complete output row into DMA words
    for (unsigned i = 0; i < dma_length; i++) {
store_label1:
        dma_word_t temp;
        for(unsigned j = 0; j < VALUES_PER_WORD; j++) {
            const unsigned local_index = i * VALUES_PER_WORD + j;

            if (local_index < N) {
                temp.word[j] = _outbuff[local_index];
            }
            else {
                temp.word[j] = 0;
            }
        }
        out[dma_index + i] = temp;
    }
}


/*
* Does the matrix multiplication operation.
* @param _inbuff: contains [0...N-1] row elements from A
*                          [N...2*N-1] col elements from B
* @param N: GEMM parameter, number of elements
* @param SHIFT: GEMM parameter -- shift width
* @param _outbuff: contains the result of A[k]*B[k]
*/
void compute(word_t _inbuff[SIZE_IN_CHUNK_DATA],
             /* <<--compute-params-->> */
            const unsigned N,
            const unsigned SHIFT,
            word_t _outbuff[SIZE_OUT_CHUNK_DATA])
{
    word_t *A_row = &_inbuff[0];
    word_t *B_col = &_inbuff[N];

    ap_int<32> acc = 0;

compute_k:
    for (unsigned k = 0; k < N; k++) {
#pragma HLS PIPELINE II = 1
        acc += (ap_int<32>)A_row[k] *
                        (ap_int<32>)B_col[k];
    }
    // Scale accumulated result
    ap_int<32> scaled = acc >> SHIFT;
    // Saturate to INT8 range
    if (scaled > 127) {
        scaled = 127;
    }
    else if (scaled < -128) {
        scaled = -128;

    }
    // One call of compute() produces one C element
    _outbuff[0] = (word_t) scaled;
}

// TODO: Add function docs
void top(dma_word_t *out, dma_word_t *in1,
        /* <<--params-->> */
        const unsigned conf_info_N,
        const unsigned conf_info_SHIFT,
        dma_info_t &load_ctrl, dma_info_t &store_ctrl)
{
    /* <<--local-params-->> */
    const unsigned N = conf_info_N;
    const unsigned SHIFT = conf_info_SHIFT;

    // Batching
batching:
    for (unsigned batch = 0; batch < 1; batch++)
    {

    // One output row at a time
rows:
        for (unsigned row = 0; row < N; row++) {
            // Holds complete output row
            word_t _outbuff[SIZE_OUT_CHUNK_DATA];
go:
            for (unsigned col = 0; col < N; col++) {
                word_t _inbuff[SIZE_IN_CHUNK_DATA];
                word_t temp_out[SIZE_OUT_CHUNK_DATA];

                // Flatten (row,col) into one chunk
                const unsigned input_chunk = row * N + col;

                // Load A[row, :] and B[:, col]
                load(_inbuff,
                    in1,
                    N,
                    load_ctrl,
                    input_chunk,
                    batch
                );

                // Compute one dot product
                compute(
                    _inbuff,
                    N,
                    SHIFT,
                    temp_out
                );
                // Collect current result into the complete
                // output row
                _outbuff[col] = temp_out[0];
            }
store_result:
            // Store only after all N columns are computed,
            // i.e. store a whole row
            store(
                _outbuff,
                out,
                N,
                store_ctrl,
                row,
                batch
            );

        }
    }
}

    // go:
    //     for (int c = 0; c < 32; c++)
    //     {
    //         word_t _inbuff[SIZE_IN_CHUNK_DATA];
    //         word_t _outbuff[SIZE_OUT_CHUNK_DATA];

    //         load(_inbuff, in1,
    //              /* <<--args-->> */
    //                 N,
    //                 SHIFT,
    //                 load_ctrl,
    //                 c,
    //                 b);
    //         compute(_inbuff,
    //             /* <<--args-->> */
    //                 N,
    //                 SHIFT,
    //                 _outbuff);
    //         store(_outbuff, out,
    //             /* <<--args-->> */
    //                 N,
    //                 // SHIFT,
    //                 store_ctrl,
    //                 c,
    //                 b);
    //     }
