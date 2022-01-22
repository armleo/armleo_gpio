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
N -480 -190 -400 -190 { lab=VDDIO}
N -480 -40 -350 -40 { lab=GND}
N -480 -130 -480 -40 { lab=GND}
N 40 -520 150 -520 { lab=datain}
N 40 -520 40 -110 { lab=datain}
N 560 -500 770 -500 { lab=#net1}
N 610 -460 610 -440 { lab=GND}
N 560 -480 610 -480 { lab=GND}
N 610 -480 610 -460 { lab=GND}
N 560 -520 610 -520 { lab=VDDIO}
N 610 -550 610 -520 { lab=VDDIO}
N 150 -520 260 -520 { lab=datain}
N 770 -500 830 -500 { lab=#net1}
N 830 -500 830 -280 { lab=#net1}
N 910 -500 910 -280 { lab=#net2}
N 150 -500 180 -500 { lab=datain}
N 150 -520 150 -500 { lab=datain}
C {devices/vsource.sym} -30 -80 0 0 {name=V1 value="0 PULSE(0 vdd_volts 5ns 1ns 1ns 4ns 10ns)"}
C {devices/gnd.sym} -30 -20 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -80 90 0 0 {name=s1 only_toplevel=false value=".temp 125
.param vdd_volts=1.65
.param vddio_volts=1.65


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
C {devices/vsource.sym} -480 -160 0 0 {name=V3 value="vddio_volts"}
C {devices/lab_wire.sym} -420 -190 0 0 {name=l8 sig_type=std_logic lab=VDDIO
}
C {devices/gnd.sym} 610 -440 0 0 {name=l7 lab=GND}
C {gpio/armleo_gpio_lv2hv.sym} 410 -500 0 0 {name=x6}
C {devices/lab_wire.sym} 610 -550 0 0 {name=l10 sig_type=std_logic lab=VDDIO
}
C {sky130_stdcells/inv_1.sym} 870 -500 0 0 {name=x7 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 870 -430 0 0 {name=x8 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 870 -350 0 0 {name=x9 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_1.sym} 870 -280 0 0 {name=x10 VGND=VGND VNB=VGND VPB=VDDIO VPWR=VDDIO prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_8.sym} 220 -500 0 0 {name=x11 VGND=GND VNB=GND VPB=VPWR VPWR=VPWR prefix=sky130_fd_sc_hd__ }
