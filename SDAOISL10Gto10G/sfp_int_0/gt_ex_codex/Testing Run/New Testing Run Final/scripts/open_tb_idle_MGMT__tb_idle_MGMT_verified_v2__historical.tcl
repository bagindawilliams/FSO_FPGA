# Read an existing recording; no simulation is started.
set db {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261101_module16_idle_v2/build/focused_20261101_184302_067679_tb_idle_MGMT_verified_v2.wdb}
if {![file exists $db]} {error "Missing WDB: $db. See WAVEFORM_INDEX.csv; no substitute recording is selected."}
load_feature simulator
open_wave_database $db
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_idle_MGMT__tb_idle_MGMT_verified_v2__historical.wcfg}
puts "HISTORICAL_RECORDING actual_top=tb_idle_MGMT_verified_v2; not current-baseline acceptance"
