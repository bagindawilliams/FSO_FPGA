# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_eth_rx_front_end_top/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_eth_rx_front_end_top/gen_tdata} {/tb_eth_rx_front_end_top/gen_tkeep} {/tb_eth_rx_front_end_top/target_frame_size} {/tb_eth_rx_front_end_top/trigger} {/tb_eth_rx_front_end_top/xgmii_txc} {/tb_eth_rx_front_end_top/xgmii_txd} {/tb_eth_rx_front_end_top/u_front_end_dut/parsed_tdata} {/tb_eth_rx_front_end_top/fso_data_out} {/tb_eth_rx_front_end_top/payload_cycle_cnt} {/tb_eth_rx_front_end_top/completed_seg_cnt} {/tb_eth_rx_front_end_top/fcs_verified_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_eth_rx_front_end_top.wcfg}
# This script does not run the simulation.
