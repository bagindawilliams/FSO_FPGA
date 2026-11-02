# Set report_run to the absolute run directory and report_snapshot to the snapshot name.
if {![info exists report_run] || ![info exists report_snapshot]} {error "Set report_run and report_snapshot first; consult the reviewed run index."}
set db [file join $report_run ${report_snapshot}.wdb]
set cfg [file join $report_run ${report_snapshot}.wcfg]
foreach f [list $db $cfg] {if {![file exists $f]} {error "Missing recorded result: $f"}}
open_wave_database $db
open_wave_config $cfg
puts "Opened existing evidence only; no simulation rerun. Validate run status before using screenshots."
