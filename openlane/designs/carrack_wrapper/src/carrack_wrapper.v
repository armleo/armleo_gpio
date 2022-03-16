

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

`ifdef EMPTY_WRAPPER
// We are creating following net to force yosys to actually process this module. Otherwise it generates an empty synthesis netlist
(* keep *) wire some_net = 0;
`endif

`ifndef EMPTY_WRAPPER

localparam OEB_INPUT = 1;
localparam OEB_OUTPUT = 0;


// ---------------------------------
//
//    RIGHT-BOTTOM
//
// ---------------------------------


// FASTIO[0] <- DUT
// Covers GPIOs functionality and GPIO ESD + caravel ESD protection.
assign io_oeb[0] = OEB_INPUT;
assign io_oeb[1] = OEB_INPUT;
assign fastio_med_enable[0] = io_in[0];
assign fastio_strong_enable[0] = io_in[1];


assign io_oeb[2] = OEB_INPUT;
assign io_oeb[3] = OEB_INPUT;
assign fastio_out_l[0] = io_in[2];
assign fastio_oe_l[0] = io_in[3];
assign io_oeb[7] = OEB_INPUT; // Disable drivers on fastio[0] which is the same as io_*[7]


assign io_oeb[4] = OEB_OUTPUT;
assign io_out[4] = fastio_in[0];


// Uses io[4:0] and [7], skipped over 5,6
// fastio[0] which is io[7]

// ---------------------------------
//
//    RIGHT
//
// ---------------------------------


// Drive FASTIO under speed to see it's perfomance
assign io_oeb[5] = OEB_INPUT;
assign fastio_oe_l[1] = io_in[5];
assign fastio_out_l[1] = wb_clk_i;
assign fastio_med_enable[1] = io_in[0];
assign fastio_strong_enable[1] = io_in[1];
assign io_oeb[8] = OEB_INPUT; // fastio[1] is same as io_oeb[8]


// Drive ordinary GPIO to see if wb_clk_i is active
assign io_oeb[6] = OEB_OUTPUT; // Output
assign io_out[6] = wb_clk_i;
// No fastio attached to 6th


// Uses io[5:8], skipped 7 as it was used above
// fastio[1] which is the same as io[8]

// ---------------------------------
//
//    TOP-RIGHT
//
// ---------------------------------

// DONE: Drive top with wb_clk_i
// Drive fastio[7], its first io_analog[0]

assign fastio_oe_l[6] = 0;
assign io_oeb[13] = OEB_INPUT;
assign fastio_oe_l[7] = io_in[13];
assign fastio_out_l[7] = wb_clk_i;
assign fastio_med_enable[7] = io_in[0];
assign fastio_strong_enable[7] = io_in[1];

assign fastio_oe_l[5] = 0;
assign io_oeb[12] = OEB_OUTPUT;
assign io_out[12] = fastio_in[7];

// use io_in[1:0] for strength control

// Uses io[13:12]
// fastio [7] which is the same as io_analog[0]




// ---------------------------------
//
//    TOP
//
// ---------------------------------

// DONE: Drive fastio using fastio

// DUT is fastio[14]

assign fastio_oe_l[14] = fastio_in[9];
assign fastio_out_l[14] = fastio_in[10];
assign fastio_med_enable[14] = fastio_in[11];
assign fastio_strong_enable[14] = fastio_in[12];

assign fastio_oe_l[12:9] = 0; // As inputs

assign fastio_oe_l[13] = io_in[11];
assign fastio_out_l[13] = fastio_in[14];
assign fastio_med_enable[13] = io_in[0];
assign fastio_med_enable[13] = io_in[1];

assign io_out[10] = fastio_in[14];
assign io_oeb[10] = OEB_OUTPUT;
assign fastio_oe_l[3] = 0;

assign io_oeb[11] = OEB_INPUT;
assign fastio_oe_l[4] = 0;


// Uses [10:11] <=> fastio[3:4], fastio[9:14]

// fastio[8, 15:17] is unused
assign fastio_out_l[8] = 0;


assign fastio_out_l[15:17] = 0;

// ---------------------------------
//
//    LEFT - TOP
//
// ---------------------------------

// DONE: Drive fastio on the left using fastio

// io[18] == fastio[22]
// io[17] == fastio[21]
// io[16] == fastio[20]
// io[15] == fastio[19]
// io[14] == fastio[18]

assign io_oeb[18] = OEB_INPUT;
assign io_oeb[17] = OEB_INPUT;
assign io_oeb[16] = OEB_INPUT;
assign io_oeb[15] = OEB_INPUT;
assign fastio_oe_l[22:19] = 0;


assign fastio_oe_l[18] = fastio_in[19];
assign fastio_out_l[18] = fastio_in[20];
assign fastio_med_enable[18] = fastio_in[21];
assign fastio_strong_enable[18] = fastio_in[22];

assign io_oeb[14] = OEB_INPUT; // same as fastio[18]

// io[20] == fastio[24]

assign io_oeb[20] = OEB_OUTPUT;
assign fastio_oe_l[24] = 0;
assign io_out[20] = fastio_in[18];
// Uses fastio[18:22];



// io[19] == fastio[23] <- unused
assign io_oeb[19] = OEB_INPUT;
assign fastio_oe_l[23] = 0;





// ---------------------------------
//
//    LEFT
//
// ---------------------------------


// ---------------------------------
// DONE: Drive top fastio using gpio on left
// ---------------------------------

assign io_oeb[21] = OEB_OUTPUT;
assign io_out[21] = fastio_in[27];
assign fastio_oe_l[25] = 0;

assign io_oeb[22] = OEB_INPUT;
assign fastio_oe_l[26] = 0;
assign fastio_oe_l[27] = io_in[22];
assign io_oeb[23] = OEB_INPUT; // fastio[27] 's caravel driver need to be disabled

assign io_oeb[24] = OEB_INPUT; // No fastio
assign fastio_med_enable[27] = io_in[24];

assign io_oeb[25] = OEB_INPUT; // No fastio
assign fastio_strong_enable[27] = io_in[25];

assign io_oeb[26] = OEB_INPUT; // No fastio
assign fastio_out_l[27] = io_in[26];


// Uses io[21:26] pins, fastio[26:27]

// TODO: Check every io_oeb*
// TODO: Check every fastio_oe_l*

`endif

endmodule

