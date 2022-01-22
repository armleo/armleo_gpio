CLEAN_TARGETS=
CHECKS=mkdir -p xschem/gpio/results; mkdir -p temp/;
.ONESHELL:
all: xschem/gpio/results/armleo_gpio.drcrpt \
xschem/gpio/results/armleo_gpio.lvsrpt \
xschem/gpio/results/armleo_gpio.pexspice \
xschem/gpio/results/armleo_gpio_lv2hv.drcrpt \
xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt \
xschem/gpio/results/armleo_gpio_lv2hv.pexspice \
xschem/gpio/results/armleo_gpio_tb.simlog \
xschem/gpio/results/armleo_gpio_worst_tb.simlog \
xschem/gpio/results/armleo_gpio_tb_caravel.simlog \
xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog \
xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog \
lef/armleo_gpio.lef \
lef/armleo_gpio_left.lef


CLEAN_TARGETS+=
.PRECIOUS: gpio/netlists/armleo_gpio.spice
xschem/gpio/netlists/armleo_gpio.spice: xschem/gpio/armleo_gpio.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/armleo_gpio.sch -o gpio/netlists/ \
	&& cd -
	

.PRECIOUS: xschem/gpio/results/armleo_gpio.drcrpt
xschem/gpio/results/armleo_gpio.drcrpt: gds/user_analog_project_wrapper.gds  armleo.mk scripts/magic_drc.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_RPT_FILE=../xschem/gpio/results/armleo_gpio.drcrpt \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_drc.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.lvsspice
xschem/gpio/results/armleo_gpio.lvsspice: gds/user_analog_project_wrapper.gds armleo.mk  scripts/magic_lvs.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio.lvsspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_lvs.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.lvsrpt
xschem/gpio/results/armleo_gpio.lvsrpt: xschem/gpio/results/armleo_gpio.lvsspice xschem/gpio/netlists/armleo_gpio_tb.spice armleo.mk
	$(CHECKS)
	cd temp && \
		netgen -batch lvs \
			"../xschem/gpio/results/armleo_gpio.lvsspice armleo_gpio" \
			"../xschem/gpio/netlists/armleo_gpio_tb.spice armleo_gpio" \
			${PDK_ROOT}/sky130A/libs.tech/netgen/sky130A_setup.tcl ../xschem/gpio/results/armleo_gpio.lvsrpt \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.pexspice
xschem/gpio/results/armleo_gpio.pexspice: gds/user_analog_project_wrapper.gds armleo.mk scripts/magic_pex.tcl 
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio.pexspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_pex.tcl\
	&& cd -

	


CLEAN_TARGETS+=
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv.spice
xschem/gpio/netlists/armleo_gpio_lv2hv.spice: xschem/gpio/armleo_gpio_lv2hv.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/armleo_gpio_lv2hv.sch -o gpio/netlists/ \
	&& cd -
	

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.drcrpt
xschem/gpio/results/armleo_gpio_lv2hv.drcrpt: gds/user_analog_project_wrapper.gds  armleo.mk scripts/magic_drc.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_RPT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.drcrpt \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_drc.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.lvsspice
xschem/gpio/results/armleo_gpio_lv2hv.lvsspice: gds/user_analog_project_wrapper.gds armleo.mk  scripts/magic_lvs.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.lvsspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_lvs.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt
xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt: xschem/gpio/results/armleo_gpio_lv2hv.lvsspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice armleo.mk
	$(CHECKS)
	cd temp && \
		netgen -batch lvs \
			"../xschem/gpio/results/armleo_gpio_lv2hv.lvsspice armleo_gpio_lv2hv" \
			"../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice armleo_gpio_lv2hv" \
			${PDK_ROOT}/sky130A/libs.tech/netgen/sky130A_setup.tcl ../xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.pexspice
xschem/gpio/results/armleo_gpio_lv2hv.pexspice: gds/user_analog_project_wrapper.gds armleo.mk scripts/magic_pex.tcl 
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.pexspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_pex.tcl\
	&& cd -

	

	
.PRECIOUS: gpio/netlists/armleo_gpio_tb.spice
xschem/gpio/netlists/armleo_gpio_tb.spice: xschem/gpio/testbenches/armleo_gpio_tb.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb.simlog
xschem/gpio/results/armleo_gpio_tb.simlog: xschem/gpio/netlists/armleo_gpio_tb.spice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb.raw" -o "../xschem/gpio/results/armleo_gpio_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_tb.pexspice
xschem/gpio/netlists/armleo_gpio_tb.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb.spice armleo.mk
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb.spice xschem/gpio/netlists/armleo_gpio_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb.pexsimlog
xschem/gpio/results/armleo_gpio_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_tb.pexspice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_tb.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_worst_tb.spice
xschem/gpio/netlists/armleo_gpio_worst_tb.spice: xschem/gpio/testbenches/armleo_gpio_worst_tb.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_worst_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_worst_tb.simlog
xschem/gpio/results/armleo_gpio_worst_tb.simlog: xschem/gpio/netlists/armleo_gpio_worst_tb.spice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_worst_tb.raw" -o "../xschem/gpio/results/armleo_gpio_worst_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_worst_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice
xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_worst_tb.spice armleo.mk
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_worst_tb.spice xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog
xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_worst_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_tb_caravel.spice
xschem/gpio/netlists/armleo_gpio_tb_caravel.spice: xschem/gpio/testbenches/armleo_gpio_tb_caravel.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_tb_caravel.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb_caravel.simlog
xschem/gpio/results/armleo_gpio_tb_caravel.simlog: xschem/gpio/netlists/armleo_gpio_tb_caravel.spice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb_caravel.raw" -o "../xschem/gpio/results/armleo_gpio_tb_caravel.simlog" "../xschem/gpio/netlists/armleo_gpio_tb_caravel.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice
xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb_caravel.spice armleo.mk
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb_caravel.spice xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog
xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog: xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb_caravel.pexraw" -o "../xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice: xschem/gpio/testbenches/armleo_gpio_lv2hv_tb_1v8.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_lv2hv_tb_1v8.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog
xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.raw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice: xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice armleo.mk
	python3 scripts/make_pextb.py armleo_gpio_lv2hv xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog
xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexraw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv_tb.spice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice: xschem/gpio/testbenches/armleo_gpio_lv2hv_tb.sch armleo.mk
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_lv2hv_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog
xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb.raw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice: xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice armleo.mk
	python3 scripts/make_pextb.py armleo_gpio_lv2hv xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog
xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice  armleo.mk
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice"
	cd -
	

lef/armleo_gpio.lef: gds/user_analog_project_wrapper.gds armleo.mk scripts/armleo_gpio_lef.tcl
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		MAGIC_LEF_FILE=../lef/armleo_gpio.lef \
		TOP_CELL=armleo_gpio \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/armleo_gpio_lef.tcl\
	&& cd -


lef/armleo_gpio_left.lef: gds/user_analog_project_wrapper.gds armleo.mk scripts/armleo_gpio_left_lef.tcl
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		MAGIC_LEF_FILE=../lef/armleo_gpio_left.lef \
		TOP_CELL=armleo_gpio_left \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/armleo_gpio_left_lef.tcl\
	&& cd -

