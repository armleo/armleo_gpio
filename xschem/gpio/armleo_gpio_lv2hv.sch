v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 310 -30 310 -0 { lab=VSSH}
N 310 0 310 70 { lab=VSSH}
N 310 -370 310 -330 { lab=VDDH}
N 220 -300 270 -300 { lab=N1}
N 310 -300 480 -300 { lab=VDDH}
N 40 -60 140 -60 { lab=VSSH}
N 140 -60 140 30 { lab=VSSH}
N 40 30 140 30 { lab=VSSH}
N -50 -60 0 -60 { lab=A}
N 180 -300 180 -160 { lab=Y}
N 220 -300 220 -120 { lab=N1}
N 40 -120 220 -120 { lab=N1}
N -100 -300 40 -300 { lab=VDDH}
N 40 -360 40 -330 { lab=VDDH}
N 40 -360 310 -360 { lab=VDDH}
N 480 -360 480 -300 { lab=VDDH}
N 310 -360 480 -360 { lab=VDDH}
N 40 -30 40 30 { lab=VSSH}
N 140 30 310 30 { lab=VSSH}
N 40 -150 40 -120 { lab=N1}
N 40 -120 40 -90 { lab=N1}
N 0 -180 0 -60 { lab=A}
N 40 -270 40 -210 { lab=N2}
N 80 -300 180 -300 { lab=Y}
N 40 -180 140 -180 { lab=VDDH}
N 140 -220 140 -180 { lab=VDDH}
N 310 -270 310 -240 { lab=#net1}
N 350 -60 420 -60 { lab=A_N}
N 200 -60 310 -60 { lab=VSSH}
N 200 -60 200 30 { lab=VSSH}
N 310 -180 310 -90 { lab=Y}
N 180 -160 310 -160 { lab=Y}
N 280 -240 280 -210 { lab=VDDH}
N 280 -210 310 -210 { lab=VDDH}
N 350 -210 350 -60 { lab=A_N}
N 250 -130 310 -130 { lab=Y}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 330 -60 2 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/ipin.sym} -120 -160 0 0 {name=p1 lab=A}
C {devices/iopin.sym} 310 -370 0 0 {name=p2 lab=VDDH}
C {devices/iopin.sym} 310 70 0 0 {name=p3 lab=VSSH}
C {devices/opin.sym} 250 -130 0 0 {name=p4 lab=Y}
C {devices/lab_wire.sym} 420 -60 0 0 {name=l2 sig_type=std_logic lab=A_N}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 20 -60 0 0 {name=M5
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_wire.sym} -90 -300 0 0 {name=l4 sig_type=std_logic lab=VDDH}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 60 -300 2 0 {name=M4
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 290 -300 0 0 {name=M7
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 20 -180 0 0 {name=M9
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_wire.sym} 140 -220 0 0 {name=l5 sig_type=std_logic lab=VDDH}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 330 -210 2 0 {name=M11
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_wire.sym} 280 -240 0 0 {name=l6 sig_type=std_logic lab=VDDH}
C {devices/lab_wire.sym} -50 -60 0 0 {name=l7 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 100 -120 0 0 {name=l8 sig_type=std_logic lab=N1}
C {devices/lab_wire.sym} 40 -240 0 0 {name=l9 sig_type=std_logic lab=N2}
C {devices/ipin.sym} -120 -130 0 0 {name=p7 lab=A_N}
