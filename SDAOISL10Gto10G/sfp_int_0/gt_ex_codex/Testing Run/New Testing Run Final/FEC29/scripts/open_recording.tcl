set report_base {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_fec28/runs/20261102_104414}
set db [file join $report_base runtime_report28_rs_original.wdb]
if {![file exists $db]} {error "Run104414 WDB missing"}
open_wave_database $db
set report_top tb_RS
set report_parameter CHANNEL_ERROR
set report_expected 1
set report_offline 1
source {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_fec29/scripts/wave_setup.tcl}
