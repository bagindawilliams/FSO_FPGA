# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_x_gth_logic/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_x_gth_logic/header_in} {/tb_x_gth_logic/payload_in} {/tb_x_gth_logic/header_byte_index} {/tb_x_gth_logic/payload_word_index} {/tb_x_gth_logic/ST_INIT} {/tb_x_gth_logic/current_frame_id} {/tb_x_gth_logic/mux_frame_type_str} {/tb_x_gth_logic/header_out} {/tb_x_gth_logic/payload_out} {/tb_x_gth_logic/out_header_byte_idx} {/tb_x_gth_logic/out_payload_word_idx} {/tb_x_gth_logic/ST_DONE} {/tb_x_gth_logic/ST_STREAM} {/tb_x_gth_logic/tb_state} {/tb_x_gth_logic/hdr_crc16_tail_ok_cnt} {/tb_x_gth_logic/out_header_cnt_reg} {/tb_x_gth_logic/verified_header_bytes} {/tb_x_gth_logic/out_payload_cnt_reg} {/tb_x_gth_logic/pld_crc32_tail_ok_cnt} {/tb_x_gth_logic/verified_payload_words}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_x_gth_logic.wcfg}
# This script does not run the simulation.
