set report_base {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_baseline27/runs/20261102_102343}
set report_db [file join $report_base runtime_report27_top.wdb]
set report_cfg [file join $report_base runtime_report27_top.wcfg]
if {![file exists $report_db] || ![file exists $report_cfg]} {error "Matching run102343 WDB/WCFG not found"}
open_wave_database $report_db
open_wave_config $report_cfg
