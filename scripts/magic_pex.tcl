gds read $::env(MAGIC_GDS_FILE)
load $::env(TOP_CELL)
select top cell
extract all
#ext2sim labels on
#ext2sim
#shell mv $::env(TOP_CELL).ext.nodes $::env(TOP_CELL).nodes
#extresist $::env(TOP_CELL)
ext2spice cthresh 0
ext2spice rthresh 0
ext2spice subcircuit off
ext2spice subcircuit top off
#ext2spice extresist on
ext2spice -f ngspice -o $::env(OUTPUT_FILE)

exit
