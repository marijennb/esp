// Copyright (c) 2011-2026 Columbia University, System Level Design Group
// SPDX-License-Identifier: Apache-2.0
#ifndef __ESP_CFG_000_H__
#define __ESP_CFG_000_H__

#include "libesp.h"
#include "mmult_vivado.h"

typedef int8_t token_t;

/* <<--params-def-->> */
#define N 32
#define SHIFT 8

/* <<--params-->> */
const int32_t N = N;
const int32_t SHIFT = SHIFT;

#define NACC 1

struct mmult_vivado_access mmult_cfg_000[] = {{
    /* <<--descriptor-->> */
		.N = N,
		.SHIFT = SHIFT,
    .src_offset    = 0,
    .dst_offset    = 0,
    .esp.coherence = ACC_COH_NONE,
    .esp.p2p_store = 0,
    .esp.p2p_nsrcs = 0,
    .esp.p2p_srcs  = {"", "", "", ""},
}};

esp_thread_info_t cfg_000[] = {{
    .run       = true,
    .devname   = "mmult_vivado.0",
    .ioctl_req = MMULT_VIVADO_IOC_ACCESS,
    .esp_desc  = &(mmult_cfg_000[0].esp),
}};

#endif /* __ESP_CFG_000_H__ */
