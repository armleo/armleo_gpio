

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

assign fastio_oe_l[19:0] = 0;
assign fastio_oe_l[27:21] = 0;

assign fastio_out_l[19:0] = 0;
assign fastio_out_l[27:21] = 0;

assign fastio_strong_enable[19:0] = 0;
assign fastio_strong_enable[27:21] = 0;

assign fastio_med_enable[19:0] = 0;
assign fastio_med_enable[27:21] = 0;

assign io_out = 0;
assign io_oeb = ~(32'h0);


// [20 is DUT for test chip)
buf input18_to_output_buffer(fastio_out_l[20], fastio_in[18]);
buf input19_to_oe_buffer(fastio_oe_l[20], fastio_in[19]);
buf input20_to_med_buffer(fastio_strong_enable[20], fastio_in[21]);
buf input21_to_strong_buffer(fastio_med_enable[20], fastio_in[22]);
buf input23_to_io_oeb(io_oeb[16], fastio_in[23]);

endmodule

