v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {This is High-speed High-load GPIO Driver.

It targets 30mA, <3nS Delay+Rise/Fall, 12pF load, 3.3V/2.5V/1.8V mode w/ Tri-State support.

To implement Tri-State, it was chosen to drive PFET and NFET Gates from different nets,
to allow slew control of PFET/NFET transistor.

pfet_gate = NAND(OUT, OE)

nfet_gate = AND(!OUT, OE) = NOR(OUT, !OE)} 950 -910 0 0 0.4 0.4 {}
T {TX_LOGIC} 90 -400 0 0 0.4 0.4 {}
T {TX_LOGIC_LV2HV} 460 -490 0 0 0.4 0.4 {}
T {RX_HV2LV} 570 -820 0 0 0.4 0.4 {}
T {VDDIO/VSSIO Domain} 1110 -530 0 0 0.4 0.4 {}
T {VDD/VSS Domain + LV2HV shifters} 10 -490 0 0 0.4 0.4 {}
T {Final Stage} 1840 -480 0 0 0.4 0.4 {}
T {M2 Stage} 1510 -480 0 0 0.4 0.4 {}
T {M1 Stage} 1220 -480 0 0 0.4 0.4 {}
T {M2 Stage} 520 -1320 0 0 0.4 0.4 {}
N 250 -990 280 -990 { lab=vddio}
N 320 1000 360 1000 { lab=vssio}
N 250 -1030 280 -1030 { lab=vdd}
N 320 1040 360 1040 { lab=vss}
N 140 -160 190 -160 { lab=n5}
N 140 -200 190 -200 { lab=out_l}
N 140 -260 140 -200 { lab=out_l}
N 140 -260 190 -260 { lab=out_l}
N 60 -300 60 -160 { lab=oe_l}
N 60 -300 190 -300 { lab=oe_l}
N 740 -370 830 -370 { lab=vddio}
N 830 -410 830 -370 { lab=vddio}
N 740 -330 830 -330 { lab=vssio}
N 830 -330 830 -290 { lab=vssio}
N 1610 -300 1840 -300 { lab=m2_weak_pgate}
N 1610 -210 1840 -210 { lab=m2_weak_ngate}
N 740 -750 780 -750 { lab=in}
N 540 -750 660 -750 { lab=esd_pad}
N 1860 -140 1920 -140 { lab=vssio}
N 1920 -180 1920 -140 { lab=vssio}
N 1840 -300 1880 -300 { lab=m2_weak_pgate}
N 1840 -210 1880 -210 { lab=m2_weak_ngate}
N 740 -150 830 -150 { lab=vddio}
N 830 -190 830 -150 { lab=vddio}
N 740 -110 830 -110 { lab=vssio}
N 830 -110 830 -70 { lab=vssio}
N 1920 -270 1920 -240 { lab=pad}
N 1920 -380 1920 -330 { lab=vddio}
N 1920 -300 2030 -300 { lab=vddio}
N 2030 -340 2030 -300 { lab=vddio}
N 1920 -340 2030 -340 { lab=vddio}
N 1920 -260 2030 -260 { lab=pad}
N 1920 -210 2030 -210 { lab=vssio}
N 2030 -210 2030 -160 { lab=vssio}
N 1920 -160 2030 -160 { lab=vssio}
N 1460 -210 1530 -210 { lab=m1_weak_ngate_n}
N 1840 -330 1840 -300 { lab=m2_weak_pgate}
N 1840 -240 1840 -210 { lab=m2_weak_ngate}
N 1350 -210 1350 -170 { lab=m1_weak_ngate_n}
N 1350 -340 1350 -300 { lab=m1_weak_pgate_n}
N 980 -380 980 -350 { lab=weak_pgate}
N 740 -350 980 -350 { lab=weak_pgate}
N 980 -160 980 -130 { lab=weak_ngate}
N 740 -130 980 -130 { lab=weak_ngate}
N -130 -300 60 -300 { lab=oe_l}
N -130 -230 140 -230 { lab=out_l}
N 310 -370 440 -370 { lab=n1}
N 310 -370 310 -280 { lab=n1}
N 310 -150 440 -150 { lab=n3}
N 310 -180 310 -150 { lab=n3}
N 440 -130 440 -80 { lab=n4}
N 360 -150 360 -80 { lab=n3}
N 400 -410 400 -370 { lab=n1}
N 400 -200 400 -150 { lab=n3}
N 440 -80 500 -80 { lab=n4}
N 440 -350 440 -300 { lab=n2}
N 360 -370 360 -300 { lab=n1}
N 440 -300 500 -300 { lab=n2}
N 1320 -210 1380 -210 { lab=m1_weak_ngate_n}
N 1210 -300 1240 -300 { lab=weak_pgate}
N 1210 -210 1240 -210 { lab=weak_ngate}
N 1320 -300 1380 -300 { lab=m1_weak_pgate_n}
N 170 -180 170 -160 { lab=n5}
N 340 -750 360 -750 { lab=pad}
N 340 -830 340 -750 { lab=pad}
N 340 -830 410 -830 { lab=pad}
N 570 -830 570 -750 { lab=esd_pad}
N 470 -830 570 -830 { lab=esd_pad}
N 1380 -300 1530 -300 { lab=m1_weak_pgate_n}
N 1380 -210 1460 -210 { lab=m1_weak_ngate_n}
N 730 110 820 110 { lab=vddio}
N 820 70 820 110 { lab=vddio}
N 730 150 820 150 { lab=vssio}
N 820 150 820 190 { lab=vssio}
N 730 330 820 330 { lab=vddio}
N 820 290 820 330 { lab=vddio}
N 730 370 820 370 { lab=vssio}
N 820 370 820 410 { lab=vssio}
N 970 100 970 130 { lab=med_pgate}
N 730 130 970 130 { lab=med_pgate}
N 970 320 970 350 { lab=med_ngate}
N 730 350 970 350 { lab=med_ngate}
N 430 350 430 400 { lab=n4_med}
N 350 330 350 400 { lab=n3_med}
N 390 70 390 110 { lab=n1_med}
N 390 280 390 330 { lab=n3_med}
N 430 400 490 400 { lab=n4_med}
N 430 130 430 180 { lab=n2_med}
N 350 110 350 180 { lab=n1_med}
N 430 180 490 180 { lab=n2_med}
N 350 110 430 110 { lab=n1_med}
N 350 330 430 330 { lab=n3_med}
N 740 530 830 530 { lab=vddio}
N 830 490 830 530 { lab=vddio}
N 740 570 830 570 { lab=vssio}
N 830 570 830 610 { lab=vssio}
N 740 750 830 750 { lab=vddio}
N 830 710 830 750 { lab=vddio}
N 740 790 830 790 { lab=vssio}
N 830 790 830 830 { lab=vssio}
N 980 520 980 550 { lab=strong_pgate}
N 740 550 980 550 { lab=strong_pgate}
N 980 740 980 770 { lab=strong_ngate}
N 740 770 980 770 { lab=strong_ngate}
N 440 770 440 820 { lab=n4_strong}
N 360 750 360 820 { lab=n3_strong}
N 400 490 400 530 { lab=n1_strong}
N 400 700 400 750 { lab=n3_strong}
N 440 820 500 820 { lab=n4_strong}
N 440 550 440 600 { lab=n2_strong}
N 360 530 360 600 { lab=n1_strong}
N 440 600 500 600 { lab=n2_strong}
N 360 530 440 530 { lab=n1_strong}
N 360 750 440 750 { lab=n3_strong}
N 1540 170 1770 170 { lab=m2_med_pgate}
N 1540 260 1770 260 { lab=m2_med_ngate}
N 1790 330 1850 330 { lab=vssio}
N 1850 290 1850 330 { lab=vssio}
N 1770 170 1810 170 { lab=m2_med_pgate}
N 1770 260 1810 260 { lab=m2_med_ngate}
N 1850 200 1850 230 { lab=pad}
N 1850 90 1850 140 { lab=vddio}
N 1850 170 1960 170 { lab=vddio}
N 1960 130 1960 170 { lab=vddio}
N 1850 130 1960 130 { lab=vddio}
N 1850 210 1960 210 { lab=pad}
N 1850 260 1960 260 { lab=vssio}
N 1960 260 1960 310 { lab=vssio}
N 1850 310 1960 310 { lab=vssio}
N 1390 260 1460 260 { lab=m1_med_ngate_n}
N 1770 140 1770 170 { lab=m2_med_pgate}
N 1770 230 1770 260 { lab=m2_med_ngate}
N 1280 260 1280 300 { lab=m1_med_ngate_n}
N 1280 130 1280 170 { lab=m1_med_pgate_n}
N 1250 260 1310 260 { lab=m1_med_ngate_n}
N 1140 170 1170 170 { lab=med_pgate}
N 1140 260 1170 260 { lab=med_ngate}
N 1250 170 1310 170 { lab=m1_med_pgate_n}
N 1310 170 1460 170 { lab=m1_med_pgate_n}
N 1310 260 1390 260 { lab=m1_med_ngate_n}
N 110 260 160 260 { lab=out_l}
N 110 200 110 260 { lab=out_l}
N 110 200 160 200 { lab=out_l}
N 30 160 160 160 { lab=n5_med}
N -290 200 -250 200 { lab=oe_l}
N -290 240 -250 240 { lab=med_enable}
N 280 280 280 340 { lab=n3_med}
N 280 340 350 340 { lab=n3_med}
N 280 180 350 180 { lab=n1_med}
N 120 680 170 680 { lab=out_l}
N 120 620 120 680 { lab=out_l}
N 120 620 170 620 { lab=out_l}
N 40 580 170 580 { lab=n5_strong}
N -290 620 -250 620 { lab=oe_l}
N -290 660 -250 660 { lab=strong_enable}
N 290 600 360 600 { lab=n1_strong}
N 290 700 400 700 { lab=n3_strong}
N 1600 600 1830 600 { lab=m2_strong_pgate}
N 1600 690 1830 690 { lab=m2_strong_ngate}
N 1850 760 1910 760 { lab=vssio}
N 1910 720 1910 760 { lab=vssio}
N 1830 600 1870 600 { lab=m2_strong_pgate}
N 1830 690 1870 690 { lab=m2_strong_ngate}
N 1910 630 1910 660 { lab=pad}
N 1910 520 1910 570 { lab=vddio}
N 1910 600 2020 600 { lab=vddio}
N 2020 560 2020 600 { lab=vddio}
N 1910 560 2020 560 { lab=vddio}
N 1910 640 2020 640 { lab=pad}
N 1910 690 2020 690 { lab=vssio}
N 2020 690 2020 740 { lab=vssio}
N 1910 740 2020 740 { lab=vssio}
N 1450 690 1520 690 { lab=m1_strong_ngate_n}
N 1830 570 1830 600 { lab=m2_strong_pgate}
N 1830 660 1830 690 { lab=m2_strong_ngate}
N 1340 690 1340 730 { lab=m1_strong_ngate_n}
N 1340 560 1340 600 { lab=m1_strong_pgate_n}
N 1310 690 1370 690 { lab=m1_strong_ngate_n}
N 1200 600 1230 600 { lab=strong_pgate}
N 1200 690 1230 690 { lab=strong_ngate}
N 1310 600 1370 600 { lab=m1_strong_pgate_n}
N 1370 600 1520 600 { lab=m1_strong_pgate_n}
N 1370 690 1450 690 { lab=m1_strong_ngate_n}
N 140 -720 230 -720 { lab=vssio}
N 230 -720 230 -660 { lab=vssio}
N 140 -660 230 -660 { lab=vssio}
N 70 -720 100 -720 { lab=vssio}
N 70 -680 140 -680 { lab=vssio}
N 70 -720 70 -680 { lab=vssio}
N 140 -690 140 -660 { lab=vssio}
N 140 -660 140 -630 { lab=vssio}
N 140 -800 140 -750 { lab=pad}
N 90 -800 140 -800 { lab=pad}
N -40 580 -40 720 { lab=#net1}
N 110 510 110 580 { lab=n5_strong}
N -40 720 170 720 { lab=#net1}
N -130 640 -40 640 { lab=#net1}
N 100 100 100 160 { lab=n5_med}
N -50 300 160 300 { lab=n6_med}
N -50 160 -50 300 { lab=n6_med}
N -130 220 -50 220 { lab=n6_med}
N 40 250 40 300 { lab=n6_med}
C {devices/ipin.sym} -130 -230 0 0 {name=p1 lab=out_l}
C {devices/iopin.sym} 280 -990 0 0 {name=p4 lab=vddio}
C {devices/iopin.sym} 360 1000 0 0 {name=p5 lab=vssio}
C {devices/ipin.sym} -130 -300 0 0 {name=p2 lab=oe_l}
C {devices/opin.sym} 780 -750 0 0 {name=p12 lab=in}
C {devices/iopin.sym} 280 -1030 0 0 {name=p7 lab=vdd}
C {devices/iopin.sym} 360 1040 0 0 {name=p8 lab=vss}
C {devices/iopin.sym} 360 -750 0 0 {name=p6 lab=pad}
C {gpio/armleo_gpio_lv2hv.sym} 590 -350 0 0 {name=x2}
C {devices/lab_pin.sym} 830 -410 0 0 {name=l8 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 830 -290 0 0 {name=l9 sig_type=std_logic lab=vssio}
C {sky130_stdcells/buf_16.sym} 700 -750 0 0 {name=x6 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {devices/lab_pin.sym} 1920 -380 0 0 {name=l35 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 1860 -140 0 0 {name=l36 sig_type=std_logic lab=vssio}
C {devices/lab_pin.sym} 1840 -330 0 0 {name=l37 sig_type=std_logic lab=m2_weak_pgate}
C {devices/lab_pin.sym} 1840 -240 0 0 {name=l38 sig_type=std_logic lab=m2_weak_ngate}
C {devices/lab_pin.sym} 2030 -260 0 0 {name=l39 sig_type=std_logic lab=pad}
C {gpio/armleo_gpio_lv2hv.sym} 590 -130 0 0 {name=x37}
C {devices/lab_pin.sym} 830 -190 0 0 {name=l90 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 830 -70 0 0 {name=l91 sig_type=std_logic lab=vssio}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1900 -300 0 0 {name=M1
L=0.5
W=10
nf=1
mult=3*2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1900 -210 0 0 {name=M2
L=0.5
W=4.5
nf=1
mult=3*2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 980 -380 0 0 {name=l13 sig_type=std_logic lab=weak_pgate}
C {devices/lab_pin.sym} 980 -160 0 0 {name=l14 sig_type=std_logic lab=weak_ngate}
C {devices/lab_pin.sym} 1210 -210 0 0 {name=l15 sig_type=std_logic lab=weak_ngate}
C {devices/lab_pin.sym} 1210 -300 0 0 {name=l16 sig_type=std_logic lab=weak_pgate}
C {devices/lab_pin.sym} 1350 -340 0 0 {name=l20 sig_type=std_logic lab=m1_weak_pgate_n}
C {devices/lab_pin.sym} 1350 -170 0 0 {name=l21 sig_type=std_logic lab=m1_weak_ngate_n}
C {devices/lab_pin.sym} 400 -410 0 0 {name=l2 sig_type=std_logic lab=n1}
C {devices/lab_pin.sym} 400 -200 0 0 {name=l4 sig_type=std_logic lab=n3}
C {devices/lab_pin.sym} 500 -80 0 0 {name=l7 sig_type=std_logic lab=n4}
C {devices/lab_pin.sym} 500 -300 0 0 {name=l11 sig_type=std_logic lab=n2}
C {sky130_stdcells/inv_4.sym} 1280 -210 0 0 {name=x1 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 1280 -300 0 0 {name=x5 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1570 -300 0 0 {name=x3 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1570 -210 0 0 {name=x10 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 400 -80 0 0 {name=x8 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 400 -300 0 0 {name=x12 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 100 -160 0 0 {name=x14 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_4.sym} 250 -280 0 0 {name=x16 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_4.sym} 250 -180 0 0 {name=x17 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 170 -180 0 0 {name=l1 sig_type=std_logic lab=n5}
C {devices/lab_pin.sym} 540 -750 0 0 {name=l5 sig_type=std_logic lab=esd_pad}
C {sky130_fd_pr/res_generic_m1.sym} 440 -830 1 0 {name=R1
W=1
L=10
model=res_generic_l1
mult=1}
C {gpio/armleo_gpio_lv2hv.sym} 580 130 0 0 {name=x4}
C {devices/lab_pin.sym} 820 70 0 0 {name=l3 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 820 190 0 0 {name=l6 sig_type=std_logic lab=vssio}
C {gpio/armleo_gpio_lv2hv.sym} 580 350 0 0 {name=x7}
C {devices/lab_pin.sym} 820 290 0 0 {name=l10 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 820 410 0 0 {name=l12 sig_type=std_logic lab=vssio}
C {devices/lab_pin.sym} 970 100 0 0 {name=l17 sig_type=std_logic lab=med_pgate}
C {devices/lab_pin.sym} 970 320 0 0 {name=l18 sig_type=std_logic lab=med_ngate}
C {devices/lab_pin.sym} 390 70 0 0 {name=l19 sig_type=std_logic lab=n1_med}
C {devices/lab_pin.sym} 390 280 0 0 {name=l22 sig_type=std_logic lab=n3_med}
C {devices/lab_pin.sym} 490 400 0 0 {name=l23 sig_type=std_logic lab=n4_med}
C {devices/lab_pin.sym} 490 180 0 0 {name=l24 sig_type=std_logic lab=n2_med}
C {sky130_stdcells/inv_4.sym} 390 400 0 0 {name=x9 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 390 180 0 0 {name=x11 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {gpio/armleo_gpio_lv2hv.sym} 590 550 0 0 {name=x13}
C {devices/lab_pin.sym} 830 490 0 0 {name=l25 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 830 610 0 0 {name=l26 sig_type=std_logic lab=vssio}
C {gpio/armleo_gpio_lv2hv.sym} 590 770 0 0 {name=x15}
C {devices/lab_pin.sym} 830 710 0 0 {name=l27 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 830 830 0 0 {name=l28 sig_type=std_logic lab=vssio}
C {devices/lab_pin.sym} 980 520 0 0 {name=l29 sig_type=std_logic lab=strong_pgate}
C {devices/lab_pin.sym} 980 740 0 0 {name=l30 sig_type=std_logic lab=strong_ngate}
C {devices/lab_pin.sym} 400 490 0 0 {name=l31 sig_type=std_logic lab=n1_strong}
C {devices/lab_pin.sym} 400 720 0 0 {name=l32 sig_type=std_logic lab=n3_strong}
C {devices/lab_pin.sym} 500 820 0 0 {name=l33 sig_type=std_logic lab=n4_strong}
C {devices/lab_pin.sym} 500 600 0 0 {name=l34 sig_type=std_logic lab=n2_strong}
C {sky130_stdcells/inv_4.sym} 400 820 0 0 {name=x18 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 400 600 0 0 {name=x19 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1850 90 0 0 {name=l40 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 1790 330 0 0 {name=l41 sig_type=std_logic lab=vssio}
C {devices/lab_pin.sym} 1770 140 0 0 {name=l42 sig_type=std_logic lab=m2_med_pgate}
C {devices/lab_pin.sym} 1770 230 0 0 {name=l43 sig_type=std_logic lab=m2_med_ngate}
C {devices/lab_pin.sym} 1960 210 0 0 {name=l44 sig_type=std_logic lab=pad}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1830 170 0 0 {name=M3
L=0.5
W=10
nf=1
mult=3*3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1830 260 0 0 {name=M4
L=0.5
W=4.5
nf=1
mult=3*3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1140 260 0 0 {name=l45 sig_type=std_logic lab=med_ngate}
C {devices/lab_pin.sym} 1140 170 0 0 {name=l46 sig_type=std_logic lab=med_pgate}
C {devices/lab_pin.sym} 1280 130 0 0 {name=l47 sig_type=std_logic lab=m1_med_pgate_n}
C {devices/lab_pin.sym} 1280 300 0 0 {name=l48 sig_type=std_logic lab=m1_med_ngate_n}
C {sky130_stdcells/inv_4.sym} 1210 260 0 0 {name=x20 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 1210 170 0 0 {name=x21 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1500 170 0 0 {name=x22 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1500 260 0 0 {name=x23 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} -10 160 0 0 {name=x24 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_4.sym} 220 180 0 0 {name=x25 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_4.sym} 220 280 0 0 {name=x26 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 100 100 0 0 {name=l49 sig_type=std_logic lab=n5_med}
C {devices/lab_pin.sym} 110 230 0 0 {name=l50 sig_type=std_logic lab=out_l}
C {devices/lab_pin.sym} -290 200 0 0 {name=l51 sig_type=std_logic lab=oe_l}
C {devices/ipin.sym} -290 240 0 0 {name=p3 lab=med_enable}
C {sky130_stdcells/inv_4.sym} 0 580 0 0 {name=x28 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_4.sym} 230 600 0 0 {name=x29 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_4.sym} 230 700 0 0 {name=x30 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 110 510 0 0 {name=l52 sig_type=std_logic lab=n5_strong}
C {devices/lab_pin.sym} 120 650 0 0 {name=l53 sig_type=std_logic lab=out_l}
C {devices/lab_pin.sym} -290 620 0 0 {name=l54 sig_type=std_logic lab=oe_l}
C {devices/ipin.sym} -290 660 0 0 {name=p9 lab=strong_enable}
C {devices/lab_pin.sym} 1910 520 0 0 {name=l67 sig_type=std_logic lab=vddio}
C {devices/lab_pin.sym} 1850 760 0 0 {name=l68 sig_type=std_logic lab=vssio}
C {devices/lab_pin.sym} 1830 570 0 0 {name=l69 sig_type=std_logic lab=m2_strong_pgate}
C {devices/lab_pin.sym} 1830 660 0 0 {name=l70 sig_type=std_logic lab=m2_strong_ngate}
C {devices/lab_pin.sym} 2020 640 0 0 {name=l71 sig_type=std_logic lab=pad}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1890 600 0 0 {name=M7
L=0.5
W=10
nf=1
mult=3*7
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1890 690 0 0 {name=M8
L=0.5
W=4.5
nf=1
mult=3*7
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1200 690 0 0 {name=l72 sig_type=std_logic lab=strong_ngate}
C {devices/lab_pin.sym} 1200 600 0 0 {name=l73 sig_type=std_logic lab=strong_pgate}
C {devices/lab_pin.sym} 1340 560 0 0 {name=l74 sig_type=std_logic lab=m1_strong_pgate_n}
C {devices/lab_pin.sym} 1340 730 0 0 {name=l75 sig_type=std_logic lab=m1_strong_ngate_n}
C {sky130_stdcells/inv_4.sym} 1270 690 0 0 {name=x36 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 1270 600 0 0 {name=x38 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1560 600 0 0 {name=x39 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_16.sym} 1560 690 0 0 {name=x40 VGND=vssio VNB=vssio VPB=vddio VPWR=vddio prefix=sky130_fd_sc_hvl__ }
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 120 -720 0 0 {name=M9
L=0.6
W=5.4
nf=1
mult=12
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=esd_nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 90 -800 0 0 {name=l76 sig_type=std_logic lab=pad}
C {devices/lab_pin.sym} 140 -630 0 0 {name=l77 sig_type=std_logic lab=vssio}
C {sky130_stdcells/nand2_4.sym} -190 220 0 0 {name=x27 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_4.sym} -190 640 0 0 {name=x31 VGND=vss VNB=vss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 40 250 0 0 {name=l78 sig_type=std_logic lab=n6_med}
