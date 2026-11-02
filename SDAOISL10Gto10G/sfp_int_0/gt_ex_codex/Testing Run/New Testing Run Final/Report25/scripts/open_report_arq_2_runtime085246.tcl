set wdb {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_report25/runs/20261102_085246/runtime_report_arq_2.wdb}
set cfg {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/Report25/report_arq_2_runtime085246.wcfg}
if {![file exists $wdb] || ![file exists $cfg]} {error "Missing runtime WDB/WCFG"}
open_wave_database $wdb
open_wave_config $cfg
