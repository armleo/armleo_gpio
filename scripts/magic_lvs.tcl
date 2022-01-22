gds read $::env(MAGIC_GDS_FILE)
load $::env(TOP_CELL)
select top cell
extract all
ext2spice lvs
ext2spice subcircuit off
ext2spice -o $::env(OUTPUT_FILE)

exit
