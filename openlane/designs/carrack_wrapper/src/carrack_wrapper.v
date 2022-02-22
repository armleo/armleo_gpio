

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



wire med_ctrl;
wire strong_ctrl;

assign fastio_med_enable[25:0] = {26{med_ctrl}};
assign fastio_strong_enable[25:0] = {26{strong_ctrl}};


// -------------------------------
//  fastio[2:0]
// -------------------------------

assign fastio_oe_l[0]   = oe_ctrl[0];   assign fastio_out_l[0]  = out_ctrl[0];      // fastio[0]
assign fastio_oe_l[1]   = 0;            assign oe_ctrl[0]       = fastio_in[1];     // fastio[1] OE[0]
assign fastio_oe_l[2]   = 0;            assign out_ctrl[0]      = fastio_in[2];     // fastio[2] OUT[0]


// -------------------------------
//  med_ctrl / strong_ctrl
// -------------------------------

assign fastio_oe_l[3]   = 0;            assign med_ctrl         = fastio_in[3];     // fastio[3] med_ctrl
assign fastio_oe_l[4]   = 0;            assign strong_ctrl      = fastio_in[4];     // fastio[4] strong_ctrl


// -------------------------------
//  fastio[7:5]
// -------------------------------

assign fastio_oe_l[5]   = oe_ctrl[1];   assign fastio_out_l[5]  = out_ctrl[1];      // fastio[5]
assign fastio_oe_l[6]   = 0;            assign oe_ctrl[1]       = fastio_in_l[6];   // fastio[6] OE[1]
assign fastio_oe_l[7]   = 0;            assign out_ctrl[1]      = fastio_in_l[7];   // fastio[7] OUT[1]


// -------------------------------
//  fastio[10:8]
// -------------------------------

assign fastio_oe_l[8]   = oe_ctrl[2];   assign fastio_out_l[8]  = out_ctrl[2];      // fastio[8]
assign fastio_oe_l[9]   = 0;            assign oe_ctrl[2]       = fastio_in_l[9];   // fastio[9] OE[2]
assign fastio_oe_l[10]  = 0;            assign out_ctrl[2]      = fastio_in_l[10];  // fastio[10] OUT[2]


// -------------------------------
//  fastio[13:11]
// -------------------------------

assign fastio_oe_l[11]  = oe_ctrl[3];  assign fastio_out_l[11]= out_ctrl[3];        // fastio[11]
assign fastio_oe_l[12]  = 0;           assign oe_ctrl[3]      = fastio_in_l[12];    // fastio[12] OE[3]
assign fastio_oe_l[13]  = 0;           assign out_ctrl[3]     = fastio_in_l[13];    // fastio[13] OUT[3]


// -------------------------------
//  fastio[16:14]
// -------------------------------

assign fastio_oe_l[14]  = oe_ctrl[4];  assign fastio_out_l[14]= out_ctrl[4];        // fastio[14]
assign fastio_oe_l[15]  = 0;           assign oe_ctrl[4]      = fastio_in_l[15];    // fastio[15] OE[4]
assign fastio_oe_l[16]  = 0;           assign out_ctrl[4]     = fastio_in_l[16];    // fastio[16] OUT[4]


// -------------------------------
//  fastio[19:17]
// -------------------------------

assign fastio_oe_l[17]  = oe_ctrl[5];  assign fastio_out_l[17]= out_ctrl[5];        // fastio[17]
assign fastio_oe_l[18]  = 0;           assign oe_ctrl[5]      = fastio_in_l[18];    // fastio[18] OE[5]
assign fastio_oe_l[19]  = 0;           assign out_ctrl[5]     = fastio_in_l[19];    // fastio[19] OUT[5]


// -------------------------------
//  fastio[22:20]
// -------------------------------

assign fastio_oe_l[20]  = oe_ctrl[6];  assign fastio_out_l[20]= out_ctrl[6];        // fastio[20]
assign fastio_oe_l[21]  = 0;           assign oe_ctrl[6]      = fastio_in_l[21];    // fastio[21] OE[6]
assign fastio_oe_l[22]  = 0;           assign out_ctrl[6]     = fastio_in_l[22];    // fastio[22] OUT[6]





// -------------------------------
//  fastio[25:23]
// -------------------------------

assign fastio_oe_l[23]  = oe_ctrl[7];  assign fastio_out_l[23]= out_ctrl[7];        // fastio[23]
assign fastio_oe_l[24]  = 0;           assign oe_ctrl[7]      = fastio_in_l[24];    // fastio[24] OE[7]
assign fastio_oe_l[25]  = 0;           assign out_ctrl[7]     = fastio_in_l[25];    // fastio[25] OUT[7]




assign fastio_med_enable[27:26] = {2{med_ctrl}};
assign fastio_strong_enable[27:26] = {2{strong_ctrl}};


assign io_out = 0;
assign io_oeb[26:0] = ~(32'h0);

// TODO: Connect io_out to the same fastio_out_l;
// TODO: Connect io_oeb of the same pins to (A AND out_ctrl)


// TODO:
// assign fastio_out_l[24] = user_clock2;
// TODO: Connect one wb clk
`endif

endmodule

