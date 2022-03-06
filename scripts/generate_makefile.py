def_target = "uncompress Makefile"

def define_component_targets(all_targets, component, lvs_tb, module="gpio"):
	all_targets.append(f"xschem/{module}/results/{component}.drcrpt")
	all_targets.append(f"xschem/{module}/results/{component}.lvsrpt")
	all_targets.append(f"xschem/{module}/results/{component}.pexspice")
	
	return f"""

CLEAN_TARGETS+=
.PRECIOUS: {module}/netlists/{component}.spice
xschem/{module}/netlists/{component}.spice: xschem/{module}/{component}.sch {def_target}
	$(CHECKS)
	cd xschem \\
		&& xschem --rcfile ${{PDK_ROOT}}/sky130A/libs.tech/xschem/xschemrc -q -n {module}/{component}.sch -o {module}/netlists/ \\
	&& cd -
	

.PRECIOUS: xschem/{module}/results/{component}.drcrpt
xschem/{module}/results/{component}.drcrpt: gds/user_analog_project_wrapper.gds  {def_target} scripts/magic_drc.tcl
	$(CHECKS)
	cd temp && \\
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \\
		TOP_CELL={component} \\
		OUTPUT_RPT_FILE=../xschem/{module}/results/{component}.drcrpt \\
		magic -rcfile ${{PDK_ROOT}}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_drc.tcl\\
	&& cd -

.PRECIOUS: xschem/{module}/results/{component}.lvsspice
xschem/{module}/results/{component}.lvsspice: gds/user_analog_project_wrapper.gds {def_target}  scripts/magic_lvs.tcl
	$(CHECKS)
	cd temp && \\
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \\
		TOP_CELL={component} \\
		OUTPUT_FILE=../xschem/{module}/results/{component}.lvsspice \\
		magic -rcfile ${{PDK_ROOT}}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_lvs.tcl\\
	&& cd -

.PRECIOUS: xschem/{module}/results/{component}.lvsrpt
xschem/{module}/results/{component}.lvsrpt: xschem/{module}/results/{component}.lvsspice xschem/{module}/netlists/{lvs_tb}.spice {def_target}
	$(CHECKS)
	cd temp && \\
		netgen -batch lvs \\
			"../xschem/{module}/results/{component}.lvsspice {component}" \\
			"../xschem/{module}/netlists/{lvs_tb}.spice {component}" \\
			${{PDK_ROOT}}/sky130A/libs.tech/netgen/sky130A_setup.tcl ../xschem/{module}/results/{component}.lvsrpt \\
	&& cd -

.PRECIOUS: xschem/{module}/results/{component}.pexspice
xschem/{module}/results/{component}.pexspice: gds/user_analog_project_wrapper.gds {def_target} scripts/magic_pex.tcl 
	$(CHECKS)
	cd temp && \\
		MAGIC_GDS_FILE=../gds/user_analog_project_wrapper.gds \\
		TOP_CELL={component} \\
		OUTPUT_FILE=../xschem/{module}/results/{component}.pexspice \\
		magic -rcfile ${{PDK_ROOT}}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../scripts/magic_pex.tcl\\
	&& cd -

	"""


def define_testbench_targets(all_targets, tb_name, dut_name, module="gpio"):
	all_targets.append(f"xschem/{module}/results/{tb_name}.simlog")
	
	return f"""
	
.PRECIOUS: {module}/netlists/{tb_name}.spice
xschem/{module}/netlists/{tb_name}.spice: xschem/{module}/testbenches/{tb_name}.sch {def_target}
	$(CHECKS)
	cd xschem \\
		&& xschem --rcfile ${{PDK_ROOT}}/sky130A/libs.tech/xschem/xschemrc -q -n {module}/testbenches/{tb_name}.sch -o {module}/netlists/ \\
	&& cd -

.PRECIOUS: xschem/{module}/results/{tb_name}.simlog
xschem/{module}/results/{tb_name}.simlog: xschem/{module}/netlists/{tb_name}.spice  {def_target}
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/{module}/results/{tb_name}.raw" -o "../xschem/{module}/results/{tb_name}.simlog" "../xschem/{module}/netlists/{tb_name}.spice"
	cd -

.PRECIOUS: xschem/{module}/netlists/{tb_name}.pexspice
xschem/{module}/netlists/{tb_name}.pexspice: xschem/{module}/results/{dut_name}.pexspice xschem/{module}/netlists/{tb_name}.spice {def_target}
	python3 scripts/make_pextb.py {dut_name} xschem/{module}/results/{dut_name}.pexspice xschem/{module}/netlists/{tb_name}.spice xschem/{module}/netlists/{tb_name}.pexspice

.PRECIOUS: xschem/{module}/results/{tb_name}.pexsimlog
xschem/{module}/results/{tb_name}.pexsimlog: xschem/{module}/netlists/{tb_name}.pexspice  {def_target}
	$(CHECKS)
	cd xschem
	ngspice -r "../xschem/{module}/results/{tb_name}.pexraw" -o "../xschem/{module}/results/{tb_name}.pexsimlog" "../xschem/{module}/netlists/{tb_name}.pexspice"
	cd -
	"""

def define_gds_to_lef(all_targets, component, gds_name, lef_name, script_name="scripts/armleo_gpio_lef.tcl"):
	all_targets.append(f"{lef_name}")
	return f"""
{lef_name}: {gds_name} {def_target} {script_name}
	cd temp && \\
		MAGIC_GDS_FILE=../{gds_name} \\
		MAGIC_LEF_FILE=../{lef_name} \\
		TOP_CELL={component} \\
		magic -rcfile ${{PDK_ROOT}}/sky130A/libs.tech/magic/sky130A.magicrc -dnull -noconsole ../{script_name}\\
	&& cd -
"""

with open("Makefile", "w+") as f:
	all_targets = []
	defs = ""
	defs = defs + (define_component_targets(all_targets, "armleo_gpio", "armleo_gpio_tb")) + "\n"
	defs = defs + (define_component_targets(all_targets, "armleo_gpio_lv2hv", "armleo_gpio_lv2hv_tb")) + "\n"
	
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_tb", "armleo_gpio")) + "\n"
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_worst_tb", "armleo_gpio")) + "\n"
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_tb_caravel", "armleo_gpio")) + "\n"
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_lv2hv_tb_1v8", "armleo_gpio_lv2hv")) + "\n"
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_lv2hv_tb", "armleo_gpio_lv2hv")) + "\n"
	defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_esd_tb", "armleo_gpio")) + "\n"
	defs = defs + (define_gds_to_lef(all_targets, "armleo_gpio", "gds/user_analog_project_wrapper.gds", "lef/armleo_gpio.lef")) + "\n"
	
	#defs = defs + (define_component_targets(all_targets, "opamp", "opamp_tt_tb", "opamp")) + "\n"
	#defs = defs + (define_component_targets(all_targets, "comparator", "comparator_tt_tb", "opamp")) + "\n"
	
	#defs = defs + (define_testbench_targets(all_targets, "opamp_tt_tb", "opamp", "opamp")) + "\n"
	#defs = defs + (define_testbench_targets(all_targets, "opamp_tt_ac_tb", "opamp", "opamp")) + "\n"
	
	
	#defs = defs + (define_testbench_targets(all_targets, "comparator_tt_tb", "comparator", "opamp")) + "\n"
	
	#defs = defs + (define_testbench_targets(all_targets, "current_source", "current_source", "opamp")) + "\n"
	#defs = defs + (define_component_targets(all_targets, "armleo_gpio_lp", "armleo_gpio_lp_tb")) + "\n"
	#defs = defs + (define_testbench_targets(all_targets, "armleo_gpio_lp_tb", "armleo_gpio_lp")) + "\n"
	defs = defs + """
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
# LARGE_FILES += $(shell find ./gds -type f -size +$(FILE_SIZE_LIMIT_MB)M -not -path "./.git/*" -not -path "./gds/*" -not -path "./oas/*" -not -path "./openlane/*")
LARGE_FILES_GZ := $(addsuffix .$(ARCHIVE_EXT), $(LARGE_FILES))
LARGE_FILES_GZ_SPLIT := $(addsuffix .$(ARCHIVE_EXT).00.split, $(LARGE_FILES))
# consider splitting existing archives
LARGE_FILES_GZ_SPLIT += $(addsuffix .00.split, $(ARCHIVES))

#####
$(LARGE_FILES_GZ): %.$(ARCHIVE_EXT): %
	@if ! [ $(suffix $<) = ".$(ARCHIVE_EXT)" ]; then\\
		$(COMPRESS) $< > /dev/null &&\\
		echo "$< -> $@";\\
	fi

$(LARGE_FILES_GZ_SPLIT): %.$(ARCHIVE_EXT).00.split: %.$(ARCHIVE_EXT)
	@if [ -n "$$(find "$<" -prune -size +$(FILE_SIZE_LIMIT_MB)M)" ]; then\\
		split $< -b $(FILE_SIZE_LIMIT_MB)M $<. -d &&\\
		rm $< &&\\
		for file in $$(ls $<.*); do mv "$$file" "$$file.split"; done &&\\
		echo -n "$< -> $$(ls $<.*.split)" | tr '\\n' ' ' && echo "";\\
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
"""
	
	f.write("CLEAN_TARGETS=\nCHECKS=mkdir -p xschem/gpio/results; mkdir -p temp/;\n.ONESHELL:\n");
	f.write("all: ")
	f.write(" \\\n".join(all_targets))
	f.write("\n")
	f.write(defs)
	
