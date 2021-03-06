# SPDX-FileCopyrightText: 2021 Anish Singhani
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) accelerator_top

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/accelerator/accelerator_top.v"

set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"
set ::env(CLOCK_PERIOD) "38"


set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(SYNTH_MAX_FANOUT) 5
set ::env(FP_CORE_UTIL) 22
set ::env(PL_TARGET_DENSITY) 0.26
set ::env(CELL_PAD) 4
set ::env(SYNTH_NO_FLAT) 0

set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1

set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) 90
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) 90
set ::env(GLB_RESIZER_SETUP_MAX_BUFFER_PERCENT) 90
set ::env(PL_RESIZER_SETUP_MAX_BUFFER_PERCENT) 90

set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) 0.4
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.9
set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 1.0

set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) 0.4
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.9
set ::env(GLB_RESIZER_MAX_SLEW_MARGIN) 1.0

set ::env(ROUTING_CORES) 16


# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
set ::env(GLB_RT_MAXLAYER) 5

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1
