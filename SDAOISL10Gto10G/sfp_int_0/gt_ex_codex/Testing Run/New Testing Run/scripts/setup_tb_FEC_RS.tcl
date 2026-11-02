# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_FEC_RS/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_FEC_RS/header_in} {/tb_FEC_RS/in_header_byte_idx} {/tb_FEC_RS/in_header_word_idx} {/tb_FEC_RS/payload_in} {/tb_FEC_RS/in_payload_byte_idx} {/tb_FEC_RS/in_payload_word_idx} {/tb_FEC_RS/rs_head_out_byte_idx} {/tb_FEC_RS/rs_head_out_word_idx} {/tb_FEC_RS/rs_head_out} {/tb_FEC_RS/rs_load_out_byte_idx} {/tb_FEC_RS/rs_load_out_word_idx} {/tb_FEC_RS/rs_load_out} {/tb_FEC_RS/frame_id} {/tb_FEC_RS/mux_data_out} {/tb_FEC_RS/mux_out_byte_idx} {/tb_FEC_RS/mux_out_word_idx} {/tb_FEC_RS/cycle_cnt} {/tb_FEC_RS/mux_frame_type_str} {/tb_FEC_RS/cur_mux_cnt} {/tb_FEC_RS/cur_rs_head_cnt} {/tb_FEC_RS/cur_rs_load_cnt} {/tb_FEC_RS/r_mux_cnt} {/tb_FEC_RS/r_rs_head_cnt} {/tb_FEC_RS/r_rs_load_cnt} {/tb_FEC_RS/ST_DONE} {/tb_FEC_RS/ST_FRAME_GAP} {/tb_FEC_RS/ST_HEAD} {/tb_FEC_RS/ST_LOAD} {/tb_FEC_RS/ST_MATH_GAP} {/tb_FEC_RS/tb_state} {/tb_FEC_RS/hdr_synd_pass_cnt} {/tb_FEC_RS/hdr_synd_done} {/tb_FEC_RS/hdr_syndrome_vec} {/tb_FEC_RS/pld_synd_pass_cnt} {/tb_FEC_RS/pld_synd_done} {/tb_FEC_RS/pld_syndrome_vec}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_FEC_RS.wcfg}
# This script does not run the simulation.
