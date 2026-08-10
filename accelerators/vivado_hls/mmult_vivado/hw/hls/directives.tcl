# Copyright (c) 2011-2026 Columbia University, System Level Design Group
# SPDX-License-Identifier: Apache-2.0

# User-defined configuration ports
# <<--directives-param-->>
set_directive_interface -mode ap_none "top" conf_info_N
set_directive_interface -mode ap_none "top" conf_info_SHIFT

# Insert here any custom directive
set_directive_dataflow "top/go"
