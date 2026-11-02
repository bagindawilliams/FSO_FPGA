set db {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/simulation/demo_release/runs/xsim_20261101_170951_6SojfL/export/xsim/tb_etri_main.wdb}
if {![file exists $db]} {error "Missing historical main WDB: $db"}
load_feature simulator
open_wave_database $db
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_etri_main__170951_historical.wcfg}
puts "HISTORICAL main170951; not acceptance of restored CDC source"
