# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_eth_tx_back_end_top_verified/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_eth_tx_back_end_top_verified/iw} {/tb_eth_tx_back_end_top_verified/ow} {/tb_eth_tx_back_end_top_verified/packets} {/tb_eth_tx_back_end_top_verified/data_in} {/tb_eth_tx_back_end_top_verified/in_byte_cnt} {/tb_eth_tx_back_end_top_verified/in_word_cnt} {/tb_eth_tx_back_end_top_verified/inside_packet} {/tb_eth_tx_back_end_top_verified/i} {/tb_eth_tx_back_end_top_verified/txn_unused} {/tb_eth_tx_back_end_top_verified/txp_unused} {/tb_eth_tx_back_end_top_verified/xgmii_byte_cnt} {/tb_eth_tx_back_end_top_verified/xgmii_word_cnt} {/tb_eth_tx_back_end_top_verified/raw_xgmii_idx} {/tb_eth_tx_back_end_top_verified/xgmii_active} {/tb_eth_tx_back_end_top_verified/xgmii_txc} {/tb_eth_tx_back_end_top_verified/xgmii_txd}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_eth_tx_back_end_top.wcfg}
# This script does not run the simulation.
