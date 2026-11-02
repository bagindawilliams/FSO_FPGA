# Read an existing recording; no simulation is started.
set db {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/simulation/demo_release/runs/xsim_20261101_170951_6SojfL/export/xsim/tb_etri_main.wdb}
if {![file exists $db]} {error "Missing WDB: $db. See WAVEFORM_INDEX.csv; no substitute recording is selected."}
load_feature simulator
open_wave_database $db
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_SDAOISL10Gto10G_top__tb_etri_main__historical.wcfg}
puts "HISTORICAL_RECORDING actual_top=tb_etri_main; not current-baseline acceptance"
