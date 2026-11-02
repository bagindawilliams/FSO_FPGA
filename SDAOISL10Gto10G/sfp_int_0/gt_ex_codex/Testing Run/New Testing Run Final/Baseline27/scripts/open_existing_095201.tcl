set root {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)}
open_wave_database [file join $root audit/20261102_baseline26/runs/20261102_095201/runtime_report26_top.wdb]
set report_offline 1
set report_top tb_SDAOISL10Gto10G_top
set report_parameter BASIC_REPORT
set report_expected 1
source [file join $root audit/20261102_baseline27/scripts/wave_setup.tcl]
