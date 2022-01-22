proc magic::drc_save_report {{cellname ""} {outfile ""}} {

    if {$outfile == ""} {set outfile "drc.out"}

    set fout [open $outfile w]
    set oscale [cif scale out]

    # magic::suspendall

    if {$cellname == ""} {
	select top cell
        set cellname [cellname list self]
	set origname ""
    } else {
	set origname [cellname list self]
	puts stdout "loading $cellname\n"
	flush stdout

	load $cellname
	select top cell
    }

    drc check
    set count [drc list count]

    puts $fout "$cellname $count"
    puts $fout "----------------------------------------"
    set drcresult [drc listall why]
    foreach {errtype coordlist} $drcresult {
	puts $fout $errtype
	puts $fout "----------------------------------------"
	foreach coord $coordlist {
	    set bllx [expr {$oscale * [lindex $coord 0]}]
	    set blly [expr {$oscale * [lindex $coord 1]}]
	    set burx [expr {$oscale * [lindex $coord 2]}]
	    set bury [expr {$oscale * [lindex $coord 3]}]
	    set coords [format " %.3f %.3f %.3f %.3f" $bllx $blly $burx $bury]
	    puts $fout "$coords"
	}
	puts $fout "----------------------------------------"
    }
    puts $fout ""

    if {$origname != ""} {
	load $origname
    }

    # magic::resumeall

    close $fout
    puts stdout "done with $outfile\n"
    flush stdout
}



gds read $::env(MAGIC_GDS_FILE)
load $::env(TOP_CELL)
select top cell
drc euclidean on
drc style drc(full)
drc catchup
magic::drc_save_report $::env(TOP_CELL) $::env(OUTPUT_RPT_FILE)

exit

