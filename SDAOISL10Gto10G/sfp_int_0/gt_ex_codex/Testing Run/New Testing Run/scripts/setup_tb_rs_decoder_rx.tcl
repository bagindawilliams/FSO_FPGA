# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_rs_decoder_rx/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_rs_decoder_rx/fso_packet_header} {/tb_rs_decoder_rx/fso_payload_header} {/tb_rs_decoder_rx/repaired_hdr_bytes} {/tb_rs_decoder_rx/hdr_ok_cnt} {/tb_rs_decoder_rx/hdr_sym_idx} {/tb_rs_decoder_rx/hdr_err_mask} {/tb_rs_decoder_rx/dec_hdr_out} {/tb_rs_decoder_rx/enc_hdr_out} {/tb_rs_decoder_rx/exp_hdr_q} {/tb_rs_decoder_rx/hdr_rd_p} {/tb_rs_decoder_rx/hdr_wr_p} {/tb_rs_decoder_rx/noisy_hdr_in} {/tb_rs_decoder_rx/tx_hdr_in} {/tb_rs_decoder_rx/pld_byte_cnt} {/tb_rs_decoder_rx/total_repaired_pld_bytes} {/tb_rs_decoder_rx/pld_ok_cnt} {/tb_rs_decoder_rx/pld_sym_idx} {/tb_rs_decoder_rx/pld_err_mask} {/tb_rs_decoder_rx/pld_byte_stream} {/tb_rs_decoder_rx/dec_pld_out} {/tb_rs_decoder_rx/enc_pld_out} {/tb_rs_decoder_rx/noisy_pld_in} {/tb_rs_decoder_rx/pld_rd_p} {/tb_rs_decoder_rx/pld_wr_p} {/tb_rs_decoder_rx/tx_pld_in} {/tb_rs_decoder_rx/fso_crc32_out} {/tb_rs_decoder_rx/rs_frame_id} {/tb_rs_decoder_rx/c} {/tb_rs_decoder_rx/f} {/tb_rs_decoder_rx/hdr_err_cnt} {/tb_rs_decoder_rx/pld_err_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_rs_decoder_rx.wcfg}
# This script does not run the simulation.
