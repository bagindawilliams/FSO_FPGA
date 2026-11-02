# Read an existing recording; no simulation is started.
set db {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261101_module13/build/modules_20261101_180405_651227_tb_mux_eth_32.wdb}
if {![file exists $db]} {error "Missing WDB: $db. See WAVEFORM_INDEX.csv; no substitute recording is selected."}
load_feature simulator
open_wave_database $db
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_mux_eth_32__tb_mux_eth_32__historical.wcfg}
puts "HISTORICAL_RECORDING actual_top=tb_mux_eth_32; not current-baseline acceptance"
