v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -440 -210 -440 -180 { lab=GND}
N -970 -270 -890 -270 { lab=vdd}
N -970 -210 -970 -200 { lab=GND}
N 420 -380 420 -360 { lab=GND}
N 160 -500 220 -500 { lab=vdd}
N 220 -520 220 -500 { lab=vdd}
N 170 -400 170 -380 { lab=GND}
N 160 -400 170 -400 { lab=GND}
N 170 -420 170 -400 { lab=GND}
N 160 -420 170 -420 { lab=GND}
N 160 -480 280 -480 { lab=vddio}
N 280 -500 280 -480 { lab=vddio}
N -870 -270 -790 -270 { lab=vddio}
N -870 -210 -870 -200 { lab=GND}
N -190 -480 -140 -480 { lab=GND}
N -190 -500 -140 -500 { lab=GND}
N -970 -200 -440 -200 { lab=GND}
N -190 -460 -140 -460 { lab=GND}
N -190 -440 -140 -440 { lab=GND}
N 400 -440 420 -440 { lab=esd_c}
N 160 -440 280 -440 { lab=#net1}
N 400 -440 400 -380 { lab=esd_c}
N 280 -380 400 -380 { lab=esd_c}
N -190 -500 -190 -200 { lab=GND}
N -440 -200 -190 -200 { lab=GND}
C {devices/gnd.sym} -440 -180 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -660 -120 0 0 {name=s1 only_toplevel=false value="


.temp 125

.lib \\"/opt/pdk_root/sky130A/libs.tech/ngspice/sky130.lib.spice\\" ss

.param vdd_volts=1.65
.param vddio_volts=3.0


.control
tran 10ns 100us
write gpio/results/armleo_gpio_esd_tb.raw

exit
.endc

.param mc_mm_switch=0

*.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_io/spice/sky130_fd_io.spice\\"
*.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice\\"
*.include \\"/opt/pdk_root/sky130A/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice\\"

.include \\"libs.spice\\"

"}
C {devices/vsource.sym} -970 -240 0 0 {name=V2 value="vdd_volts"}
C {devices/lab_wire.sym} -910 -270 0 0 {name=l4 sig_type=std_logic lab=vdd
}
C {devices/capa.sym} 420 -410 0 0 {name=C1
m=1
value='100p'
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -440 -180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -440 -180 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 420 -360 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 220 -520 0 0 {name=l7 sig_type=std_logic lab=vdd
}
C {devices/gnd.sym} 170 -380 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} 280 -500 0 0 {name=l9 sig_type=std_logic lab=vddio
}
C {devices/vsource.sym} -870 -240 0 0 {name=V3 value="vddio_volts"}
C {devices/lab_wire.sym} -810 -270 0 0 {name=l10 sig_type=std_logic lab=vddio
}
C {gpio/armleo_gpio.sym} 10 -450 0 0 {name=x1}
C {devices/lab_wire.sym} 400 -440 0 0 {name=l26 sig_type=std_logic lab=esd_c
}
C {devices/code_shown.sym} -140 -720 0 0 {name=s3 only_toplevel=false value="

.ic v(esd_c)=-2000
"}
C {devices/res.sym} 280 -410 0 0 {name=R1
value=1500
footprint=1206
device=resistor
m=1}
