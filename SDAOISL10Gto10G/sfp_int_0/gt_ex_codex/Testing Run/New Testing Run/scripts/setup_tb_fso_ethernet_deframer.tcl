# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_fso_ethernet_deframer/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_fso_ethernet_deframer/hdr_crc_ok} {/tb_fso_ethernet_deframer/s_axis_hdr_tdata} {/tb_fso_ethernet_deframer/m_axis_fso_tdata} {/tb_fso_ethernet_deframer/s_axis_fso_tdata} {/tb_fso_ethernet_deframer/local_fb_ack} {/tb_fso_ethernet_deframer/rx_fcch_op} {/tb_fso_ethernet_deframer/rx_fcch_pl} {/tb_fso_ethernet_deframer/rx_frame_type} {/tb_fso_ethernet_deframer/rx_tx_ts} {/tb_fso_ethernet_deframer/local_fb_rxfn} {/tb_fso_ethernet_deframer/peer_rxfn_out} {/tb_fso_ethernet_deframer/peer_ack_out} {/tb_fso_ethernet_deframer/pld_crc_ok} {/tb_fso_ethernet_deframer/expected_txfn} {/tb_fso_ethernet_deframer/rx_txfn} {/tb_fso_ethernet_deframer/drained_data_frames} {/tb_fso_ethernet_deframer/mgmt_lsb_vec} {/tb_fso_ethernet_deframer/mgmt_range_meters}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_fso_ethernet_deframer.wcfg}
# This script does not run the simulation.
