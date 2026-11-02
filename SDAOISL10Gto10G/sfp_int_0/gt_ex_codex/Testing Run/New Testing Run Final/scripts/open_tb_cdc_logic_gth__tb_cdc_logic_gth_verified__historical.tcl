# Read an existing recording; no simulation is started.
set db {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261101_module15_extended/build/focused_20261101_183304_140560_tb_cdc_logic_gth_verified.wdb}
if {![file exists $db]} {error "Missing WDB: $db. See WAVEFORM_INDEX.csv; no substitute recording is selected."}
load_feature simulator
open_wave_database $db
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_cdc_logic_gth__tb_cdc_logic_gth_verified__historical.wcfg}
puts "HISTORICAL_RECORDING actual_top=tb_cdc_logic_gth_verified; not current-baseline acceptance"
