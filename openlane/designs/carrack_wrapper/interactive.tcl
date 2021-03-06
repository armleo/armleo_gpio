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

package require openlane
set script_dir [file dirname [file normalize [info script]]]

prep -design $script_dir -tag carrack_wrapper_empty -overwrite
set save_path $script_dir/../..

verilog_elaborate

init_floorplan

place_io

# This creates a placed IO saved to save_def

set_def $::env(SAVE_DEF)

# making it "empty"
remove_nets -input $::env(CURRENT_DEF)
remove_components -input $::env(CURRENT_DEF)

set ::env(SAVE_DEF) $script_dir/or_ioplaced.def

# Do place pins and save to save_def
try_catch openroad -exit $script_dir/or_ioplace.tcl |& tee $::env(TERMINAL_OUTPUT) ioPlacer_log_file_tag.log

set ::env(CURRENT_DEF) $::env(SAVE_DEF)

remove_nets -input $::env(CURRENT_DEF)
remove_components -input $::env(CURRENT_DEF)

puts $::env(CURRENT_DEF)


# remove nets from pins
# exec -- "sed" "-i" "s/ + NET zero_ / /g" "$::env(CURRENT_DEF)"
# exec -- "sed" "-i" "s/ + NET one_ / /g" "$::env(CURRENT_DEF)"
# exec python3 pin_net_assign_reset.py $::env(CURRENT_DEF)
 
puts "Copying def to: $script_dir/carrack_wrapper.fp.def"
file copy -force $::env(CURRENT_DEF) "$script_dir/carrack_wrapper.fp.def"

set_def $::env(CURRENT_DEF)

# rename "duplicate" pins
#exec /bin/bash $script_dir/../../utils/rename_pins.sh $::env(SAVE_DEF) "io_analog_1_4,io_analog_1_5,io_analog_1_6,vdda1_1,vdda1_2,vdda1_3,vdda2_1,vssa1_1,vssa1_2,vssa1_3,vssa2_1,vccd1_1,vccd2_1,vssd1_1,vssd2_1" "io_analog\[4\],io_analog\[5\],io_analog\[6\],vdda1,vdda1,vdda1,vdda2,vssa1,vssa1,vssa1,vssa2,vccd1,vccd2,vssd1,vssd2"

run_magic

run_magic_drc

# set ::env(magic_result_file_tag) $script_dir/outputs/user_analog_project_wrapper_empty

#save_views       -lef_path $::env(magic_result_file_tag).lef \
#    -def_path $::env(CURRENT_DEF) \
#    -gds_path $::env(magic_result_file_tag).gds \
#    -mag_path $::env(magic_result_file_tag).mag \
#    -save_path $save_path \
#    -tag $::env(RUN_TAG)

# produce "obstructed" LEF to be used for routing
#set gap 0.4
#set llx [expr [lindex $::env(DIE_AREA) 0]-$gap]
#set lly [expr [lindex $::env(DIE_AREA) 1]-$gap]
#set urx [expr [lindex $::env(DIE_AREA) 2]+$gap]
#set ury [expr [lindex $::env(DIE_AREA) 3]+$gap]
#exec python3 $script_dir/rectify.py $llx $lly $urx $ury \
#    < $::env(magic_result_file_tag).lef \
#    | python3 $::env(OPENLANE_ROOT)/scripts/obs.py {*}$::env(DIE_AREA) li1 met1 met2 met3 \
#    | python3 $::env(OPENLANE_ROOT)/scripts/obs.py -42.88 -37.53 2962.50 3557.21 met4 met5 \
#    > $::env(magic_result_file_tag).obstructed.lef
#file copy -force $::env(magic_result_file_tag).obstructed.lef $save_path/lef
