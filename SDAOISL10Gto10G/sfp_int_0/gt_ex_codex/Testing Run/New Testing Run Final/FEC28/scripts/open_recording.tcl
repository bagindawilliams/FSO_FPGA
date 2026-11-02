if {![info exists fec_run]} {error "Set fec_run to the completed run directory name"}
set base {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_fec28/runs}
set db [file join $base $fec_run runtime_report28_rs_original.wdb]
set cfg [file join $base $fec_run runtime_report28_rs_original.wcfg]
if {![file exists $db] || ![file exists $cfg]} {error "Matching completed runtime WDB/WCFG missing"}
open_wave_database $db
open_wave_config $cfg
