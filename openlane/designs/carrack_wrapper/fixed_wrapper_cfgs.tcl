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

# DON'T TOUCH THE FOLLOWING SECTIONS

# This makes sure that the core rings are outside the boundaries
# of your block.
# set ::env(MAGIC_ZEROIZE_ORIGIN) 0

# Area Configurations. DON'T TOUCH.
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2540.96 3195.985"

set ::env(RUN_CVC) 0

#set ::env(BOTTOM_MARGIN_MULT) 20
#set ::env(TOP_MARGIN_MULT) 20
#set ::env(LEFT_MARGIN_MULT) 100
#set ::env(RIGHT_MARGIN_MULT) 100

set ::env(BOTTOM_MARGIN_MULT) 1
set ::env(TOP_MARGIN_MULT) 1
set ::env(LEFT_MARGIN_MULT) 1
set ::env(RIGHT_MARGIN_MULT) 1

# set ::env(VDD_NETS) "vccd1"
# set ::env(GND_NETS) "vssd1"
# set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
# set ::env(GLB_RT_MAXLAYER) 6

# Pin Configurations. DON'T TOUCH
#set ::unit 2.4
#set ::env(FP_IO_VLENGTH) $::unit
#set ::env(FP_IO_HLENGTH) $::unit

#set ::env(FP_IO_VTHICKNESS_MULT) 4
#set ::env(FP_IO_HTHICKNESS_MULT) 4

# Power & Pin Configurations. DON'T TOUCH.
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"


# Workaround for LI1 not dense enough
# set ::env(DECAP_CELL) {sky130_ef_sc_hd__decap_12 sky130_fd_sc_hd__decap_8 sky130_fd_sc_hd__decap_4 sky130_fd_sc_hd__decap_3}

