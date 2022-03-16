# SPDX-FileCopyrightText: 2020 Efabless Corporation
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
source $script_dir/../carrack_wrapper/fixed_wrapper_cfgs.tcl


set ::env(CURRENT_SDC) $::env(BASE_SDC_FILE)
set ::env(DESIGN_NAME) carrack_wrapper

# set ::env(PL_BASIC_PLACEMENT) 1

set ::env(FP_DEF_TEMPLATE) $script_dir/../carrack_wrapper/carrack_wrapper.fp.def

# set ::env(FP_DEF_TEMPLATE) $script_dir/4-ioPlacer.def
#set ::env(BOTTOM_MARGIN_MULT) 200
#set ::env(TOP_MARGIN_MULT) 200
#set ::env(LEFT_MARGIN_MULT) 300
#set ::env(RIGHT_MARGIN_MULT) 300

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET)  "wb_clk_i"

set ::env(CLOCK_PERIOD) "100"

# Note: Dont have vccd1/vssd1 in verilog

set ::env(VERILOG_FILES) "\
	$script_dir/../carrack_wrapper/src/carrack_wrapper.v"
