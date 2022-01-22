gds read $::env(MAGIC_GDS_FILE)
load $::env(TOP_CELL)
select top cell


port makeall
port vss class inout
port vss use ground

port vdd use power
port vdd class inout


port vssio class inout
port vssio use ground

port vddio use power
port vddio class inout


# port pad use analog
port pad class inout


port med_enable use digital
port med_enable class input

port strong_enable use digital
port strong_enable class input

port oe_l use digital
port oe_l class input

port out_l use digital
port out_l class input

port in use digital
port in class output


lef write $::env(MAGIC_LEF_FILE)

exit

