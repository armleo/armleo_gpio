
module armleo_gpio(
    `ifdef USE_POWER_PINS
        inout vddio,
        inout vssio,
        inout vdd,
        inout vss,
    `endif
    
    inout pad,
    
    input med_enable,
    input strong_enable,
    
    input out_l,
    input oe_l,
    output in
);

assign pad = oe_l ? out_l : 1'bZ;
assign in = pad;

endmodule




