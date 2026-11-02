open_project -read_only {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.xpr}
puts "ONBOARD_TOP=[get_property top [get_filesets sources_1]]"
puts "ONBOARD_PART=[get_property part [current_project]]"
puts "ONBOARD_GENERIC=[get_property generic [get_filesets sources_1]]"
foreach f [get_files -compile_order sources -used_in synthesis] {puts "ONBOARD_SOURCE=$f"}
foreach ip [get_ips] {puts "ONBOARD_IP=$ip"}
close_project
exit
