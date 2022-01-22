module tb;


wire in;
wire pad;

wire med_enable = 0;
wire strong_enable = 0;

reg out_l = 0;
reg oe_l = 0;

initial begin
	oe_l = 0;
	out_l = 0;
	#1
	$display(pad);
	#1
	out_l = 1;
	$display(pad);
	#1
	out_l = 0;
	oe_l = 1;
	$display(pad);
	#1
	out_l = 1;
	$display(pad);
	#1
	oe_l = 0;
	$display(pad);
	#1
	$finish;
end

armleo_gpio u0 (
.*
);

endmodule



