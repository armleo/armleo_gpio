// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_analog_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user analog project.
 *
 *-------------------------------------------------------------
 */

module user_analog_project_wrapper (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    /* GPIOs.  There are 27 GPIOs, on either side of the analog.
     * These have the following mapping to the GPIO padframe pins
     * and memory-mapped registers, since the numbering remains the
     * same as caravel but skips over the analog I/O:
     *
     * io_in/out/oeb/in_3v3 [26:14]  <--->  mprj_io[37:25]
     * io_in/out/oeb/in_3v3 [13:0]   <--->  mprj_io[13:0]	
     *
     * When the GPIOs are configured by the Management SoC for
     * user use, they have three basic bidirectional controls:
     * in, out, and oeb (output enable, sense inverted).  For
     * analog projects, a 3.3V copy of the signal input is
     * available.  out and oeb must be 1.8V signals.
     */

    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in,
    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in_3v3,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_oeb,

    /* Analog (direct connection to GPIO pad---not for high voltage or
     * high frequency use).  The management SoC must turn off both
     * input and output buffers on these GPIOs to allow analog access.
     * These signals may drive a voltage up to the value of VDDIO
     * (3.3V typical, 5.5V maximum).
     * 
     * Note that analog I/O is not available on the 7 lowest-numbered
     * GPIO pads, and so the analog_io indexing is offset from the
     * GPIO indexing by 7, as follows:
     *
     * gpio_analog/noesd [17:7]  <--->  mprj_io[35:25]
     * gpio_analog/noesd [6:0]   <--->  mprj_io[13:7]	
     *
     */
    
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_analog,
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_noesd,

    /* Analog signals, direct through to pad.  These have no ESD at all,
     * so ESD protection is the responsibility of the designer.
     *
     * user_analog[10:0]  <--->  mprj_io[24:14]
     *
     */
    inout [`ANALOG_PADS-1:0] io_analog,

    /* Additional power supply ESD clamps, one per analog pad.  The
     * high side should be connected to a 3.3-5.5V power supply.
     * The low side should be connected to ground.
     *
     * clamp_high[2:0]   <--->  mprj_io[20:18]
     * clamp_low[2:0]    <--->  mprj_io[20:18]
     *
     */
    inout [2:0] io_clamp_high,
    inout [2:0] io_clamp_low,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

`ifdef POWER_PINS

assign io_clamp_high[2] = vdda2;
assign io_clamp_low[2] = vssa2;

assign io_clamp_high[1] = vdda2;
assign io_clamp_low[1] = vssa2;

assign io_clamp_high[0] = vdda2;
assign io_clamp_low[0] = vssa2;
`endif


wire [27:0] fastio_in;
wire [27:0] fastio_oe_l;
wire [27:0] fastio_out_l;
wire [27:0] fastio_strong_enable;
wire [27:0] fastio_med_enable;
wire [27:0] fastio_pad;

carrack_wrapper wrp (
    `ifdef USE_POWER_PINS
        .vccd1(vccd1),
        .vssd1(vssd1),
    `endif
    
    // Bottom pins connections
    .wb_clk_i (wb_clk_i),
    .wb_rst_i (wb_rst_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i (wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),
    
    
    .user_clock2    (user_clock2),
    .user_irq       (user_irq),
    
    .io_in  (io_in),
    .io_out (io_out),
    .io_oeb (io_oeb),
    
    
    .fastio_in      (fastio_in),
    .fastio_out_l   (fastio_out_l),
    .fastio_oe_l   (fastio_oe_l),
    .fastio_strong_enable(fastio_strong_enable),
    .fastio_med_enable(fastio_med_enable)
);


`define fastio(pad_num) \
armleo_gpio fastio``pad_num`` ( \
    `ifdef USE_POWER_PINS .vddio(vdda2), .vssio(vssa2), .vdd(vccd2), .vss(vssd2), `endif \
    .pad(fastio_pad[pad_num]), \
    .out_l(fastio_out_l[pad_num]), .oe_l(fastio_oe_l[pad_num]), \
    .med_enable(fastio_med_enable[pad_num]),  .strong_enable(fastio_strong_enable[pad_num]), \
    .in(fastio_in[pad_num]) \
);



`fastio(0)
assign fastio_pad[0] = gpio_noesd[0];

`fastio(1)
assign fastio_pad[1] = gpio_noesd[1];

`fastio(2)
assign fastio_pad[2] = gpio_noesd[2];

`fastio(3)
assign fastio_pad[3] = gpio_noesd[3];

`fastio(4)
assign fastio_pad[4] = gpio_noesd[4];

`fastio(5)
assign fastio_pad[5] = gpio_noesd[5];

`fastio(6)
assign fastio_pad[6] = gpio_noesd[6];

`fastio(7)
assign fastio_pad[7] = io_analog[0];

`fastio(8)
assign fastio_pad[8] = io_analog[1];

`fastio(9)
assign fastio_pad[9] = io_analog[2];

`fastio(10)
assign fastio_pad[10] = io_analog[3];

`fastio(11)
assign fastio_pad[11] = io_analog[4];

`fastio(12)
assign fastio_pad[12] = io_analog[5];

`fastio(13)
assign fastio_pad[13] = io_analog[6];

`fastio(14)
assign fastio_pad[14] = io_analog[7];

`fastio(15)
assign fastio_pad[15] = io_analog[8];

`fastio(16)
assign fastio_pad[16] = io_analog[9];

`fastio(17)
assign fastio_pad[17] = io_analog[10];

`fastio(18)
assign fastio_pad[18] = gpio_noesd[7];

`fastio(19)
assign fastio_pad[19] = gpio_noesd[8];

`fastio(20)
assign fastio_pad[20] = gpio_noesd[9];

`fastio(21)
assign fastio_pad[21] = gpio_noesd[10];

`fastio(22)
assign fastio_pad[22] = gpio_noesd[11];

`fastio(23)
assign fastio_pad[23] = gpio_noesd[12];

`fastio(24)
assign fastio_pad[24] = gpio_noesd[13];

`fastio(25)
assign fastio_pad[25] = gpio_noesd[14];

`fastio(26)
assign fastio_pad[26] = gpio_noesd[15];

`fastio(27)
assign fastio_pad[27] = gpio_noesd[16];


endmodule	// user_analog_project_wrapper





(* blackbox *)
module armleo_gpio(
`ifdef USE_POWER_PINS
    inout vdd,
    inout vss,
    inout vddio,
    inout vssio,
`endif
    input out_l,
    input oe_l,
    
    input med_enable,
    input strong_enable,
    
    inout pad,
    
    output in
);

endmodule

(* blackbox *)
module carrack_wrapper(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq,
    
    // Note: fastio_* does not have the same numeration as io_*
    // Note: io_oeb and fastio_oe_l are exclusive
    // Note: io_oeb is low active, fastio_oe_l is high active
    input  [26:0] io_in,
    output [26:0] io_out,
    output [26:0] io_oeb,
    
    input [27:0] fastio_in,
    output [27:0] fastio_oe_l,
    output [27:0] fastio_out_l,
    output [27:0] fastio_strong_enable,
    output [27:0] fastio_med_enable
);

endmodule


