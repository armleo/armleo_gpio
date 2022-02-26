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
lef/armleo_gpio.lef


CLEAN_TARGETS+=
.PRECIOUS: gpio/netlists/armleo_gpio.spice
xschem/gpio/netlists/armleo_gpio.spice: xschem/gpio/armleo_gpio.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/armleo_gpio.sch -o gpio/netlists/ \
	&& cd -
	

.PRECIOUS: xschem/gpio/results/armleo_gpio.drcrpt
xschem/gpio/results/armleo_gpio.drcrpt: gds/user_analog_project_wrapper.gds  uncompress Makefile scripts/magic_drc.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_RPT_FILE=../xschem/gpio/results/armleo_gpio.drcrpt \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_drc.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.lvsspice
xschem/gpio/results/armleo_gpio.lvsspice: gds/user_analog_project_wrapper.gds uncompress Makefile  scripts/magic_lvs.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio.lvsspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_lvs.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.lvsrpt
xschem/gpio/results/armleo_gpio.lvsrpt: xschem/gpio/results/armleo_gpio.lvsspice xschem/gpio/netlists/armleo_gpio_tb.spice uncompress Makefile
	$(CHECKS)
	cd temp && \
		netgen -batch lvs \
			"../xschem/gpio/results/armleo_gpio.lvsspice armleo_gpio" \
			"../xschem/gpio/netlists/armleo_gpio_tb.spice armleo_gpio" \
			${PDK_ROOT}/sky130A/libs.tech/netgen/sky130A_setup.tcl ../xschem/gpio/results/armleo_gpio.lvsrpt \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio.pexspice
xschem/gpio/results/armleo_gpio.pexspice: gds/user_analog_project_wrapper.gds uncompress Makefile scripts/magic_pex.tcl 
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio.pexspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_pex.tcl\
	&& cd -

	


CLEAN_TARGETS+=
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv.spice
xschem/gpio/netlists/armleo_gpio_lv2hv.spice: xschem/gpio/armleo_gpio_lv2hv.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/armleo_gpio_lv2hv.sch -o gpio/netlists/ \
	&& cd -
	

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.drcrpt
xschem/gpio/results/armleo_gpio_lv2hv.drcrpt: gds/user_analog_project_wrapper.gds  uncompress Makefile scripts/magic_drc.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_RPT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.drcrpt \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_drc.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.lvsspice
xschem/gpio/results/armleo_gpio_lv2hv.lvsspice: gds/user_analog_project_wrapper.gds uncompress Makefile  scripts/magic_lvs.tcl
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.lvsspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_lvs.tcl\
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt
xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt: xschem/gpio/results/armleo_gpio_lv2hv.lvsspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice uncompress Makefile
	$(CHECKS)
	cd temp && \
		netgen -batch lvs \
			"../xschem/gpio/results/armleo_gpio_lv2hv.lvsspice armleo_gpio_lv2hv" \
			"../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice armleo_gpio_lv2hv" \
			${PDK_ROOT}/sky130A/libs.tech/netgen/sky130A_setup.tcl ../xschem/gpio/results/armleo_gpio_lv2hv.lvsrpt \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv.pexspice
xschem/gpio/results/armleo_gpio_lv2hv.pexspice: gds/user_analog_project_wrapper.gds uncompress Makefile scripts/magic_pex.tcl 
	$(CHECKS)
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		TOP_CELL=armleo_gpio_lv2hv \
		OUTPUT_FILE=../xschem/gpio/results/armleo_gpio_lv2hv.pexspice \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_pex.tcl\
	&& cd -

	

	
.PRECIOUS: gpio/netlists/armleo_gpio_tb.spice
xschem/gpio/netlists/armleo_gpio_tb.spice: xschem/gpio/testbenches/armleo_gpio_tb.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb.simlog
xschem/gpio/results/armleo_gpio_tb.simlog: xschem/gpio/netlists/armleo_gpio_tb.spice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb.raw" -o "../xschem/gpio/results/armleo_gpio_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_tb.pexspice
xschem/gpio/netlists/armleo_gpio_tb.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb.spice uncompress Makefile
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb.spice xschem/gpio/netlists/armleo_gpio_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb.pexsimlog
xschem/gpio/results/armleo_gpio_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_tb.pexspice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_tb.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_worst_tb.spice
xschem/gpio/netlists/armleo_gpio_worst_tb.spice: xschem/gpio/testbenches/armleo_gpio_worst_tb.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_worst_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_worst_tb.simlog
xschem/gpio/results/armleo_gpio_worst_tb.simlog: xschem/gpio/netlists/armleo_gpio_worst_tb.spice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_worst_tb.raw" -o "../xschem/gpio/results/armleo_gpio_worst_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_worst_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice
xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_worst_tb.spice uncompress Makefile
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_worst_tb.spice xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog
xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_worst_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_worst_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_worst_tb.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_tb_caravel.spice
xschem/gpio/netlists/armleo_gpio_tb_caravel.spice: xschem/gpio/testbenches/armleo_gpio_tb_caravel.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_tb_caravel.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb_caravel.simlog
xschem/gpio/results/armleo_gpio_tb_caravel.simlog: xschem/gpio/netlists/armleo_gpio_tb_caravel.spice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb_caravel.raw" -o "../xschem/gpio/results/armleo_gpio_tb_caravel.simlog" "../xschem/gpio/netlists/armleo_gpio_tb_caravel.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice
xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice: xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb_caravel.spice uncompress Makefile
	python3 scripts/make_pextb.py armleo_gpio xschem/gpio/results/armleo_gpio.pexspice xschem/gpio/netlists/armleo_gpio_tb_caravel.spice xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog
xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog: xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_tb_caravel.pexraw" -o "../xschem/gpio/results/armleo_gpio_tb_caravel.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_tb_caravel.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice: xschem/gpio/testbenches/armleo_gpio_lv2hv_tb_1v8.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_lv2hv_tb_1v8.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog
xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.raw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.simlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice: xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice uncompress Makefile
	python3 scripts/make_pextb.py armleo_gpio_lv2hv xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.spice xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog
xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexraw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb_1v8.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb_1v8.pexspice"
	cd -
	

	
.PRECIOUS: gpio/netlists/armleo_gpio_lv2hv_tb.spice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice: xschem/gpio/testbenches/armleo_gpio_lv2hv_tb.sch uncompress Makefile
	$(CHECKS)
	cd xschem \
		&& xschem --rcfile ${PDK_ROOT}/sky130A/libs.tech/xschem/xschemrc -q -n gpio/testbenches/armleo_gpio_lv2hv_tb.sch -o gpio/netlists/ \
	&& cd -

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog
xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb.raw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb.simlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice"
	cd -

.PRECIOUS: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice
xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice: xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice uncompress Makefile
	python3 scripts/make_pextb.py armleo_gpio_lv2hv xschem/gpio/results/armleo_gpio_lv2hv.pexspice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.spice xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice

.PRECIOUS: xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog
xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog: xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice  uncompress Makefile
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/gpio/results/armleo_gpio_lv2hv_tb.pexraw" -o "../xschem/gpio/results/armleo_gpio_lv2hv_tb.pexsimlog" "../xschem/gpio/netlists/armleo_gpio_lv2hv_tb.pexspice"
	cd -
	

lef/armleo_gpio.lef: gds/user_analog_project_wrapper.gds uncompress Makefile scripts/armleo_gpio_lef.tcl
	cd temp && \
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \
		MAGIC_LEF_FILE=../lef/armleo_gpio.lef \
		TOP_CELL=armleo_gpio \
		magic -rcfile ${PDK_ROOT}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/armleo_gpio_lef.tcl\
	&& cd -


# cannot commit files larger than 100 MB to GitHub
FILE_SIZE_LIMIT_MB = 20

# Commands to be used to compress/uncompress files
# they must operate **in place** (otherwise, modify the target to delete the
# intermediate file/archive)
COMPRESS ?= gzip -n --best
UNCOMPRESS ?= gzip -d
ARCHIVE_EXT ?= gz

# The following variables are to build static pattern rules

# Needed to rebuild archives that were previously split
SPLIT_FILES := $(shell find . -type f -name "*.$(ARCHIVE_EXT).00.split")
SPLIT_FILES_SOURCES := $(basename $(basename $(basename $(SPLIT_FILES))))

# Needed to uncompress the existing archives
ARCHIVES := $(shell find . -type f -name "*.$(ARCHIVE_EXT)")
ARCHIVE_SOURCES := $(basename $(ARCHIVES))

# Needed to compress and split files/archives that are too large
LARGE_FILES := $(shell find ./gds -type f -name "*.gds")
LARGE_FILES += $(shell find ./gds -type f -size +$(FILE_SIZE_LIMIT_MB)M -not -path "./.git/*" -not -path "./gds/*" -not -path "./oas/*" -not -path "./openlane/*")
LARGE_FILES_GZ := $(addsuffix .$(ARCHIVE_EXT), $(LARGE_FILES))
LARGE_FILES_GZ_SPLIT := $(addsuffix .$(ARCHIVE_EXT).00.split, $(LARGE_FILES))
# consider splitting existing archives
LARGE_FILES_GZ_SPLIT += $(addsuffix .00.split, $(ARCHIVES))

#####
$(LARGE_FILES_GZ): %.$(ARCHIVE_EXT): %
	@if ! [ $(suffix $<) = ".$(ARCHIVE_EXT)" ]; then\
		$(COMPRESS) $< > /dev/null &&\
		echo "$< -> $@";\
	fi

$(LARGE_FILES_GZ_SPLIT): %.$(ARCHIVE_EXT).00.split: %.$(ARCHIVE_EXT)
	@if [ -n "$$(find "$<" -prune -size +$(FILE_SIZE_LIMIT_MB)M)" ]; then\
		split $< -b $(FILE_SIZE_LIMIT_MB)M $<. -d &&\
		rm $< &&\
		for file in $$(ls $<.*); do mv "$$file" "$$file.split"; done &&\
		echo -n "$< -> $$(ls $<.*.split)" | tr '\n' ' ' && echo "";\
	fi

# This target compresses all files larger than $(FILE_SIZE_LIMIT_MB) MB
.PHONY: compress
compress: $(LARGE_FILES_GZ) $(LARGE_FILES_GZ_SPLIT)
	@echo "Files larger than $(FILE_SIZE_LIMIT_MB) MBytes are compressed!"



#####
$(ARCHIVE_SOURCES): %: %.$(ARCHIVE_EXT)
	@$(UNCOMPRESS) $<
	@echo "$< -> $@"

.SECONDEXPANSION:
$(SPLIT_FILES_SOURCES): %: $$(sort $$(wildcard %.$(ARCHIVE_EXT).*.split))
	@cat $? > $@.$(ARCHIVE_EXT)
	@rm $?
	@echo "$? -> $@.$(ARCHIVE_EXT)"
	@$(UNCOMPRESS) $@.$(ARCHIVE_EXT)
	@echo "$@.$(ARCHIVE_EXT) -> $@"


.PHONY: uncompress
uncompress: $(SPLIT_FILES_SOURCES) $(ARCHIVE_SOURCES)
	@echo "All files are uncompressed!"
