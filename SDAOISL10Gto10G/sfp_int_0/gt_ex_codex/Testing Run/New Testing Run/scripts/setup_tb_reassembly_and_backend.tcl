# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_reassembly_and_backend/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_reassembly_and_backend/reassembled_eth_tdata} {/tb_reassembly_and_backend/s_axis_fso_tdata} {/tb_reassembly_and_backend/reassembled_pkt_bytes} {/tb_reassembly_and_backend/reassembled_pkt_cnt} {/tb_reassembly_and_backend/w} {/tb_reassembly_and_backend/eth_out_words} {/tb_reassembly_and_backend/xgmii_pkt_words} {/tb_reassembly_and_backend/pc2_xgmii_txc} {/tb_reassembly_and_backend/pc2_xgmii_txd} {/tb_reassembly_and_backend/in_xgmii_frame}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_reassembly_and_backend.wcfg}
# This script does not run the simulation.
