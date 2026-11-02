set wdb {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_report24/runs/20261102_075031/report_rs_clean.wdb}
set wcfg {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/Report25/report_rs_clean.wcfg}
if {![file exists $wdb] || ![file exists $wcfg]} {error "Recorded WDB/WCFG not found"}
open_wave_database $wdb
open_wave_config $wcfg
