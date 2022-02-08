# base origin in user_analog_wrapper 246 137

if {[catch {read_lef $::env(MERGED_LEF)} errmsg]} {
    puts stderr $errmsg
    exit 1
}

if {[catch {read_def $::env(CURRENT_DEF)} errmsg]} {
    puts stderr $errmsg
	exit 1
}

ppl::set_hor_length $::env(FP_IO_HLENGTH)
ppl::set_ver_length $::env(FP_IO_VLENGTH)
ppl::set_hor_length_extend $::env(FP_IO_VEXTEND)
ppl::set_ver_length_extend $::env(FP_IO_HEXTEND)
ppl::set_ver_thick_multiplier $::env(FP_IO_VTHICKNESS_MULT)
ppl::set_hor_thick_multiplier $::env(FP_IO_HTHICKNESS_MULT)

## Config
set core_area_x 2540.96
set core_area_y 3195.985

set origin_x 189.52
set origin_y 137

set analog_pin_size 25
lappend analog_pin_size 8.5

set clamp_pin_size 11
lappend clamp_pin_size 8.5

set power_pin_size 24
lappend power_pin_size 8.3

set pin_width 0.56
set pin_length 6.40

# 2917.85000-246


#-------------------------------------
# POWER
#-------------------------------------

place_pin -pin_name "vssd1" -layer met3 -location [list $core_area_x [expr 944.15000 - $origin_y]] -pin_size [list 12.30000 74.00000]

place_pin -pin_name "vccd1" -layer met3 -location [list $core_area_x [expr 3185.92000 - $origin_y]] -pin_size [list 12.30000 74.00000]



#-------------------------------------
# SOUTH
#-------------------------------------

set south_east_pins { wbs_adr_i[11] wbs_dat_i[11] wbs_dat_o[11] wbs_adr_i[12] wbs_dat_i[12] wbs_dat_o[12] wbs_adr_i[13] wbs_dat_i[13] wbs_dat_o[13] wbs_adr_i[14] wbs_dat_i[14] wbs_dat_o[14] wbs_adr_i[15] wbs_dat_i[15] wbs_dat_o[15] wbs_adr_i[16] wbs_dat_i[16] wbs_dat_o[16] wbs_adr_i[17] wbs_dat_i[17] wbs_dat_o[17] wbs_adr_i[18] wbs_dat_i[18] wbs_dat_o[18] wbs_adr_i[19] wbs_dat_i[19] wbs_dat_o[19] wbs_adr_i[20] wbs_dat_i[20] wbs_dat_o[20] wbs_adr_i[21] wbs_dat_i[21] wbs_dat_o[21] wbs_adr_i[22] wbs_dat_i[22] wbs_dat_o[22] wbs_adr_i[23] wbs_dat_i[23] wbs_dat_o[23] wbs_adr_i[24] wbs_dat_i[24] wbs_dat_o[24] wbs_adr_i[25] wbs_dat_i[25] wbs_dat_o[25] wbs_adr_i[26] wbs_dat_i[26] wbs_dat_o[26] wbs_adr_i[27] wbs_dat_i[27] wbs_dat_o[27] wbs_adr_i[28] wbs_dat_i[28] wbs_dat_o[28] wbs_adr_i[29] wbs_dat_i[29] wbs_dat_o[29] wbs_adr_i[30] wbs_dat_i[30] wbs_dat_o[30] wbs_adr_i[31] wbs_dat_i[31] wbs_dat_o[31]

wb_clk_i wb_rst_i wbs_ack_o wbs_cyc_i wbs_stb_i wbs_we_i wbs_adr_i[0] wbs_dat_i[0] wbs_dat_o[0] wbs_sel_i[0]  wbs_adr_i[1] wbs_dat_i[1] wbs_dat_o[1] wbs_sel_i[1] wbs_adr_i[2] wbs_dat_i[2] wbs_dat_o[2] wbs_sel_i[2] wbs_adr_i[3] wbs_dat_i[3] wbs_dat_o[3] wbs_sel_i[3] wbs_adr_i[4] wbs_dat_i[4] wbs_dat_o[4] wbs_adr_i[5] wbs_dat_i[5] wbs_dat_o[5] wbs_adr_i[6] wbs_dat_i[6] wbs_dat_o[6] wbs_adr_i[7] wbs_dat_i[7] wbs_dat_o[7] wbs_adr_i[8] wbs_dat_i[8] wbs_dat_o[8] wbs_adr_i[9] wbs_dat_i[9] wbs_dat_o[9] wbs_adr_i[10] wbs_dat_i[10] wbs_dat_o[10] 

io_in[24] io_out[24] io_oeb[24]
io_in[25] io_out[25] io_oeb[25]
io_in[26] io_out[26] io_oeb[26]

}


set start_x [expr 257.03000 - $origin_x]
set current_x $start_x

foreach pin $south_east_pins {
	place_pin -pin_name $pin -layer met2 -location [list $current_x 0] -pin_size [list $pin_width $pin_length]
	set current_x [expr $current_x + 5.91]
}



set south_west_pins {
	io_in[0] io_out[0] io_oeb[0]
	io_in[1] io_out[1] io_oeb[1]
	io_in[2] io_out[2] io_oeb[2]
	io_in[3] io_out[3] io_oeb[3]
	io_in[4] io_out[4] io_oeb[4]
}

set start_x [expr 2710 - $origin_x]
set current_x $start_x

foreach pin $south_west_pins {
	place_pin -pin_name $pin -layer met2 -location [list $current_x 0] -pin_size [list $pin_width $pin_length]
	set current_x [expr $current_x - 5.91]
}



#-------------------------------------
# EAST
#-------------------------------------

set east_pins {
	io_in[5] io_out[5] io_oeb[5]
	user_irq[2] user_irq[1] user_irq[0] user_clock2
	
}

set start_y 240.76000
set current_y [expr $start_y - $origin_y]

foreach pin $east_pins {
	place_pin -pin_name $pin -layer met3 -location [list $core_area_x $current_y] -pin_size [list $pin_length $pin_width]
	set current_y [expr $current_y + 5.91]
}



set east_pins_2 {
	io_in[6] io_out[6] io_oeb[6]
}

set start_y [expr 464.05000 - $origin_y]
set current_y $start_y


foreach pin $east_pins_2 {
	place_pin -pin_name $pin -layer met3 -location [list $core_area_x $current_y] -pin_size [list $pin_length $pin_width]
	set current_y [expr $current_y + 5.91]
}




set fastio_bases [list 1318.11500 1540.22500 1766.33500 1998.44500 2220.55500 2442.66500 2889.77500 3255.27000]

set fastio_idx 0

foreach fastio_base_offseted $fastio_bases {
	set fastio_base [expr $fastio_base_offseted - $origin_y]

	place_pin -pin_name fastio_oe_l[$fastio_idx] -layer met2 \
		-location [list $core_area_x [expr $fastio_base+9.51]] -pin_size [list $pin_length 1]
	place_pin -pin_name fastio_out_l[$fastio_idx] -layer met2 \
		-location [list $core_area_x [expr $fastio_base+11.27]] -pin_size [list $pin_length 1]
	place_pin -pin_name fastio_med_enable[$fastio_idx] -layer met2 \
		-location [list $core_area_x [expr $fastio_base + 42.69 + (1.48 / 2)]] -pin_size [list $pin_length 1.48]
	place_pin -pin_name fastio_strong_enable[$fastio_idx] -layer met2 \
		-location [list $core_area_x [expr $fastio_base + 59.24 + (1.48 / 2)]] -pin_size [list $pin_length 1.48]
	place_pin -pin_name fastio_in[$fastio_idx] -layer met2 \
		-location [list $core_area_x [expr $fastio_base + 67.005 + 0.28]] -pin_size [list $pin_length 0.56000]
	incr fastio_idx
}


set gpio_bases [list 1364.16000 1586.27000 1812.38000 2044.49000 2266.60000 2488.71000 2935.82000]

set gpio_idx 7

foreach gpio_base_offseted $gpio_bases {
	set gpio_base [expr $gpio_base_offseted - $origin_y]

	place_pin -pin_name io_in[$gpio_idx] -layer met3 \
		-location [list $core_area_x [expr $gpio_base + 0]] -pin_size [list $pin_length 0.56]
	place_pin -pin_name io_out[$gpio_idx] -layer met3 \
		-location [list $core_area_x [expr $gpio_base + 5.91]] -pin_size [list $pin_length 0.56]
	place_pin -pin_name io_oeb[$gpio_idx] -layer met3 \
		-location [list $core_area_x [expr $gpio_base + 5.91 + 5.91]] -pin_size [list $pin_length 0.56]
	
	incr gpio_idx
}


#-------------------------------------
# TOP
#-------------------------------------




set fastio_bases [list 2612.00000 2308.90500 2048.40000 1567.77500 1059.75500 802.46000 581.86000 329.99000 241.89000]


foreach fastio_base_offseted $fastio_bases {
	set fastio_base [expr $fastio_base_offseted - $origin_x]

	place_pin -pin_name fastio_oe_l[$fastio_idx] -layer met2 \
		-location [list [expr $fastio_base+9.51] $core_area_y] -pin_size [list 1 $pin_length]
	place_pin -pin_name fastio_out_l[$fastio_idx] -layer met2 \
		-location [list [expr $fastio_base+11.27] $core_area_y] -pin_size [list 1 $pin_length]
	place_pin -pin_name fastio_med_enable[$fastio_idx] -layer met2 \
		-location [list [expr $fastio_base + 42.69 + (1.48 / 2)] $core_area_y] -pin_size [list 1.48 $pin_length]
	place_pin -pin_name fastio_strong_enable[$fastio_idx] -layer met2 \
		-location [list [expr $fastio_base + 59.24 + (1.48 / 2)] $core_area_y] -pin_size [list 1.48 $pin_length]
	place_pin -pin_name fastio_in[$fastio_idx] -layer met2 \
		-location [list [expr $fastio_base + 67.005 + 0.28] $core_area_y] -pin_size [list 0.56000 $pin_length]
	incr fastio_idx
}


#-------------------------------------
# WEST
#-------------------------------------



set fastio_bases [list 3255.60500 2523.70500 2307.59500 2091.48500 1875.37500 1659.26500 1443.15500 1228.04500 589.93500 373.82500 265.65000]



foreach fastio_base_offseted $fastio_bases {
	set fastio_base [expr $fastio_base_offseted - $origin_x + 88.24000 - 35.72]

	place_pin -pin_name fastio_oe_l[$fastio_idx] -layer met2 \
		-location [list 0 [expr $fastio_base+9.01 + (1.0 / 2)]] -pin_size [list $pin_length 1]
	place_pin -pin_name fastio_out_l[$fastio_idx] -layer met2 \
		-location [list 0 [expr $fastio_base + 10.77 + (1.0 / 2)]] -pin_size [list $pin_length 1]
	place_pin -pin_name fastio_med_enable[$fastio_idx] -layer met2 \
		-location [list 0 [expr $fastio_base + 42.69 + (1.48 / 2)]] -pin_size [list $pin_length 1.48]
	place_pin -pin_name fastio_strong_enable[$fastio_idx] -layer met2 \
		-location [list 0 [expr $fastio_base + 59.24 + (1.48 / 2)]] -pin_size [list $pin_length 1.48]
	place_pin -pin_name fastio_in[$fastio_idx] -layer met2 \
		-location [list 0 [expr $fastio_base + 67.115 + (0.56 / 2)]] -pin_size [list $pin_length 0.56]
	incr fastio_idx
}


set gpio_bases [list 2540.20000 2324.09000 2107.98000 1891.87000 1675.76000 1459.65000 1244.54000 606.43000 390.32000 174.21000]

set gpio_idx 14

foreach gpio_base_offseted $gpio_bases {
	set gpio_base [expr $gpio_base_offseted - $origin_y]

	place_pin -pin_name io_in[$gpio_idx] -layer met3 \
		-location [list 0 [expr $gpio_base + 0]] -pin_size [list $pin_length 0.56]
	place_pin -pin_name io_out[$gpio_idx] -layer met3 \
		-location [list 0 [expr $gpio_base - 5.91]] -pin_size [list $pin_length 0.56]
	place_pin -pin_name io_oeb[$gpio_idx] -layer met3 \
		-location [list 0 [expr $gpio_base - 5.91 - 5.91]] -pin_size [list $pin_length 0.56]
	
	incr gpio_idx
}


write_def $::env(SAVE_DEF)
