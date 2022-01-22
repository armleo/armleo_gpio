v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -30 -50 -30 -20 { lab=GND}
N -350 -110 -270 -110 { lab=VPWR}
N -350 -50 -350 -40 { lab=GND}
N -350 -40 -30 -40 { lab=GND}
N -30 -110 40 -110 { lab=datain}
N 450 -480 660 -480 { lab=#net1}
N 500 -440 500 -420 { lab=GND}
N 450 -460 500 -460 { lab=GND}
N 500 -460 500 -440 { lab=GND}
N -480 -190 -400 -190 { lab=VDDIO}
N -480 -40 -350 -40 { lab=GND}
N -480 -130 -480 -40 { lab=GND}
N 450 -500 500 -500 { lab=VDDIO}
N 500 -530 500 -500 { lab=VDDIO}
N 40 -500 150 -500 { lab=datain}
N 660 -480 720 -480 { lab=#net1}
N 720 -480 720 -260 { lab=#net1}
N 800 -480 800 -260 { lab=#net2}
N 40 -480 70 -480 { lab=datain}
N 40 -500 40 -110 { lab=datain}
C {devices/vsource.sym} -30 -80 0 0 {name=V1 value="0 PULSE(0 vdd_volts 5ns 1ns 1ns 4ns 10ns)"}
C {devices/gnd.sym} -30 -20 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -40 40 0 0 {name=s1 only_toplevel=false value=".temp 125
.param vdd_volts=1.65
.param vddio_volts=3.0


.control
tran 0.01ns 20ns
write
exit
.endc


.param mc_mm_switch=0


.lib \\"/opt/pdk_root/sky130A/libs.tech/ngspice/sky130.lib.spice\\" ss
.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_io/spice/sky130_fd_io.spice\\"
.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice\\"
.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice\\"

"}
C {devices/vsource.sym} -350 -80 0 0 {name=V2 value="vdd_volts"}
C {devices/lab_wire.sym} -290 -110 0 0 {name=l4 sig_type=std_logic lab=VPWR
}
C {devices/lab_wire.sym} 20 -110 0 0 {name=l15 sig_type=std_logic lab=datain}
C {devices/gnd.sym} -30 -20 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -30 -20 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 500 -420 0 0 {name=l6 lab=GND}
C {gpio/armleo_gpio_lv2hv.sym} 300 -480 0 0 {name=x1}
C {devices/vsource.sym} -480 -160 0 0 {name=V3 value="vddio_volts"}
C {devices/lab_wire.sym} -420 -190 0 0 {name=l8 sig_type=std_logic lab=VDDIO
}
C {devices/lab_wire.sym} 500 -530 0 0 {name=l9 sig_type=std_logic lab=VDDIO
}
C {sky130_stdcells/inv_1.sym} 760 -480 0 0 {name=x2 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 760 -410 0 0 {name=x3 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 760 -330 0 0 {name=x4 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 760 -260 0 0 {name=x5 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_8.sym} 110 -480 0 0 {name=x6 VGND=GND VNB=GND VPB=VPWR VPWR=VPWR prefix=sky130_fd_sc_hd__ }
