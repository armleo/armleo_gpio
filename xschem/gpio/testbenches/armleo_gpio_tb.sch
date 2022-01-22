v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -440 -210 -440 -180 { lab=GND}
N -970 -270 -890 -270 { lab=vdd}
N -970 -210 -970 -200 { lab=GND}
N -440 -270 -370 -270 { lab=datain}
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
N -530 -340 -460 -340 { lab=oe}
N -530 -260 -530 -200 { lab=GND}
N -530 -340 -530 -320 { lab=oe}
N 140 -1430 200 -1430 { lab=vdd}
N 200 -1450 200 -1430 { lab=vdd}
N 150 -1330 150 -1310 { lab=GND}
N 140 -1330 150 -1330 { lab=GND}
N 150 -1350 150 -1330 { lab=GND}
N 140 -1350 150 -1350 { lab=GND}
N 140 -1410 260 -1410 { lab=vdd}
N 260 -1430 260 -1410 { lab=vdd}
N 380 -1310 380 -1290 { lab=GND}
N -190 -480 -140 -480 { lab=datain}
N -190 -500 -140 -500 { lab=oe}
N -220 -1410 -160 -1410 { lab=datain}
N -220 -1430 -160 -1430 { lab=oe}
N 140 -1370 380 -1370 { lab=pad_1v8}
N 160 -440 420 -440 { lab=pad}
N -970 -200 -440 -200 { lab=GND}
N -610 -340 -610 -200 { lab=GND}
N -190 -460 -140 -460 { lab=med_enable}
N -610 -400 -560 -400 { lab=med_enable}
N -220 -1390 -160 -1390 { lab=med_enable}
N -760 -460 -650 -460 { lab=strong_enable}
N -190 -440 -140 -440 { lab=strong_enable}
N -760 -400 -760 -200 { lab=GND}
N -220 -1370 -160 -1370 { lab=strong_enable}
C {devices/vsource.sym} -530 -290 0 0 {name=V1 value="0 PULSE(0 vdd_volts 0 1ns 1ns 39ns 80ns)"}
C {devices/gnd.sym} -440 -180 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -660 -120 0 0 {name=s1 only_toplevel=false value="

.temp -40

.lib \\"/opt/pdk_root/sky130A/libs.tech/ngspice/sky130.lib.spice\\" ff

.param vdd_volts=1.95
.param vddio_volts=3.6


*.temp 125

*.lib \\"/opt/pdk_root/sky130A/libs.tech/ngspice/sky130.lib.spice\\" ss

*.param vdd_volts=1.65
*.param vddio_volts=3.0


.param cload=6pf
*.param cload=12pf


.control
tran 500ps 240ns
write gpio/results/armleo_gpio_tb_6pf_best.raw

echo \\"Starting 12pf test\\"

alterparam cload=12pf
reset
tran 500ps 240ns
write gpio/results/armleo_gpio_tb_12pf_best.raw


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
C {devices/lab_wire.sym} -390 -270 0 0 {name=l15 sig_type=std_logic lab=datain}
C {devices/capa.sym} 420 -410 0 0 {name=C1
m=1
value='cload'
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
C {devices/lab_wire.sym} 400 -440 0 0 {name=l26 sig_type=std_logic lab=pad
}
C {devices/vsource.sym} -440 -240 0 0 {name=V4 value="0 PULSE(0 vdd_volts 10ns 1ns 1ns 19ns 40ns)"}
C {devices/lab_wire.sym} -480 -340 0 0 {name=l39 sig_type=std_logic lab=oe}
C {devices/lab_wire.sym} -190 -500 0 0 {name=l40 sig_type=std_logic lab=oe}
C {devices/lab_wire.sym} -190 -480 0 0 {name=l37 sig_type=std_logic lab=datain}
C {devices/lab_wire.sym} 200 -1450 0 0 {name=l24 sig_type=std_logic lab=vdd
}
C {devices/gnd.sym} 150 -1310 0 0 {name=l38 lab=GND}
C {gpio/armleo_gpio.sym} -10 -1380 0 0 {name=x8}
C {devices/lab_wire.sym} -220 -1430 0 0 {name=l46 sig_type=std_logic lab=oe}
C {devices/lab_wire.sym} 360 -1370 0 0 {name=l47 sig_type=std_logic lab=pad_1v8
}
C {devices/lab_wire.sym} -220 -1410 0 0 {name=l51 sig_type=std_logic lab=datain}
C {devices/capa.sym} 380 -1340 0 0 {name=C2
m=1
value='cload'
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 380 -1290 0 0 {name=l53 lab=GND}
C {devices/code_shown.sym} -430 -1920 0 0 {name=s2 only_toplevel=false value="

.measure tran trise_weak_1v8 TRIG v(pad_1v8) val=vdd_volts*0.1 RISE=1 TARG v(pad_1v8) val=vdd_volts*0.9 RISE=1
.measure tran tfall_weak_1v8 TRIG v(pad_1v8) val=vdd_volts*0.9 FALL=1 TARG v(pad_1v8) val=vdd_volts*0.1 FALL=1
.measure tran tdelay0_weak_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=1 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=1
.measure tran tdelay1_weak_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=2 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=2

.measure tran trise_med_1v8 TRIG v(pad_1v8) val=vdd_volts*0.1 RISE=2 TARG v(pad_1v8) val=vdd_volts*0.9 RISE=2
.measure tran tfall_med_1v8 TRIG v(pad_1v8) val=vdd_volts*0.9 FALL=2 TARG v(pad_1v8) val=vdd_volts*0.1 FALL=2
.measure tran tdelay0_med_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=5 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=3
.measure tran tdelay1_med_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=6 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=4


.measure tran trise_strong_1v8 TRIG v(pad_1v8) val=vdd_volts*0.1 RISE=3 TARG v(pad_1v8) val=vdd_volts*0.9 RISE=3
.measure tran tfall_strong_1v8 TRIG v(pad_1v8) val=vdd_volts*0.9 FALL=3 TARG v(pad_1v8) val=vdd_volts*0.1 FALL=3
.measure tran tdelay0_strong_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=9 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=5
.measure tran tdelay1_strong_1v8 TRIG v(datain) val=vdd_volts*0.5 CROSS=10 TARG v(pad_1v8) val=vdd_volts*0.5 CROSS=6



.ic v(pad_1v8)=0
"}
C {devices/code_shown.sym} -420 -1080 0 0 {name=s3 only_toplevel=false value="

.measure tran trise_weak TRIG v(pad) val=vddio_volts*0.1 RISE=1 TARG v(pad) val=vddio_volts*0.9 RISE=1
.measure tran tfall_weak TRIG v(pad) val=vddio_volts*0.9 FALL=1 TARG v(pad) val=vddio_volts*0.1 FALL=1
.measure tran tdelay0_weak TRIG v(datain) val=vdd_volts*0.5 CROSS=1 TARG v(pad) val=vddio_volts*0.5 CROSS=1
.measure tran tdelay1_weak TRIG v(datain) val=vdd_volts*0.5 CROSS=2 TARG v(pad) val=vddio_volts*0.5 CROSS=2


.measure tran trise_med TRIG v(pad) val=vddio_volts*0.1 RISE=2 TARG v(pad) val=vddio_volts*0.9 RISE=2
.measure tran tfall_med TRIG v(pad) val=vddio_volts*0.9 FALL=2 TARG v(pad) val=vddio_volts*0.1 FALL=2
.measure tran tdelay0_med TRIG v(datain) val=vdd_volts*0.5 CROSS=5 TARG v(pad) val=vddio_volts*0.5 CROSS=3
.measure tran tdelay1_med TRIG v(datain) val=vdd_volts*0.5 CROSS=6 TARG v(pad) val=vddio_volts*0.5 CROSS=4


.measure tran trise_strong TRIG v(pad) val=vddio_volts*0.1 RISE=3 TARG v(pad) val=vddio_volts*0.9 RISE=3
.measure tran tfall_strong TRIG v(pad) val=vddio_volts*0.9 FALL=3 TARG v(pad) val=vddio_volts*0.1 FALL=3
.measure tran tdelay0_strong TRIG v(datain) val=vdd_volts*0.5 CROSS=9 TARG v(pad) val=vddio_volts*0.5 CROSS=5
.measure tran tdelay1_strong TRIG v(datain) val=vdd_volts*0.5 CROSS=10 TARG v(pad) val=vddio_volts*0.5 CROSS=6




.ic v(pad)=0
"}
C {devices/lab_wire.sym} 260 -1430 0 0 {name=l11 sig_type=std_logic lab=vdd
}
C {devices/vsource.sym} -610 -370 0 0 {name=V5 value="0 PULSE(0 vdd_volts 80ns 1ns 1ns 159ns 240ns)"}
C {devices/lab_wire.sym} -560 -400 0 0 {name=l12 sig_type=std_logic lab=med_enable}
C {devices/lab_wire.sym} -190 -460 0 0 {name=l13 sig_type=std_logic lab=med_enable}
C {devices/lab_wire.sym} -220 -1390 0 0 {name=l14 sig_type=std_logic lab=med_enable}
C {devices/lab_wire.sym} -650 -460 0 0 {name=l16 sig_type=std_logic lab=strong_enable}
C {devices/vsource.sym} -760 -430 0 0 {name=V6 value="0 PULSE(0 vdd_volts 120ns 1ns 1ns 159ns 240ns)"}
C {devices/lab_wire.sym} -190 -440 0 0 {name=l17 sig_type=std_logic lab=strong_enable}
C {devices/lab_wire.sym} -220 -1370 0 0 {name=l18 sig_type=std_logic lab=strong_enable}
