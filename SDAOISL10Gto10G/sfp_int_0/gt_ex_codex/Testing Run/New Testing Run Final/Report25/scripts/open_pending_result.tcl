if {![info exists report_run] || ![info exists report_snapshot]} {error "Set report_run and report_snapshot first"}
set base {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_report25/runs}
set wdb [file join $base $report_run runtime_${report_snapshot}.wdb]
set cfg [file join $base $report_run runtime_${report_snapshot}.wcfg]
if {![file exists $wdb] || ![file exists $cfg]} {error "Completed runtime WDB/WCFG not found; setup-only files are not acceptance evidence"}
open_wave_database $wdb
open_wave_config $cfg
