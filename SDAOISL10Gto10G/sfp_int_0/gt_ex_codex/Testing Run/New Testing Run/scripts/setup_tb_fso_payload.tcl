# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_fso_payload/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_fso_payload/gen_tdata} {/tb_fso_payload/target_frame_size} {/tb_fso_payload/seg_tdata} {/tb_fso_payload/u_fso_payload/inj_tdata} {/tb_fso_payload/u_fso_payload/state} {/tb_fso_payload/u_fso_payload/crc_tdata} {/tb_fso_payload/ddr4_addr} {/tb_fso_payload/ddr4_delete_req} {/tb_fso_payload/ddr4_read_req} {/tb_fso_payload/ddr4_write_req} {/tb_fso_payload/fifo_data_tdata} {/tb_fso_payload/payload_cycle_cnt} {/tb_fso_payload/frame_id} {/tb_fso_payload/rx_frame_idx} {/tb_fso_payload/f1_crc32} {/tb_fso_payload/f2_crc32} {/tb_fso_payload/f2_word1_data} {/tb_fso_payload/gen_tkeep} {/tb_fso_payload/retx_data_tdata} {/tb_fso_payload/frame1_word_cnt} {/tb_fso_payload/frame2_word_cnt} {/tb_fso_payload/retx_word_cnt} {/tb_fso_payload/f2_word25_fcs} {/tb_fso_payload/frame_type_str} {/tb_fso_payload/trigger} {/tb_fso_payload/in_byte_cnt} {/tb_fso_payload/out_byte_cnt} {/tb_fso_payload/f1_pkt_hdr} {/tb_fso_payload/f1_pld_hdr} {/tb_fso_payload/f2_pld_hdr}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_fso_payload.wcfg}
# This script does not run the simulation.
