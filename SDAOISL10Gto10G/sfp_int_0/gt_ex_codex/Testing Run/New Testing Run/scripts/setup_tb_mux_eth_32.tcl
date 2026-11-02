# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_mux_eth_32/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_mux_eth_32/asm_data_in} {/tb_mux_eth_32/in_byte_cnt} {/tb_mux_eth_32/i} {/tb_mux_eth_32/preamble_sfd} {/tb_mux_eth_32/eth_data_out} {/tb_mux_eth_32/out_byte_cnt} {/tb_mux_eth_32/out_word_cnt} {/tb_mux_eth_32/err_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_mux_eth_32.wcfg}
# This script does not run the simulation.
