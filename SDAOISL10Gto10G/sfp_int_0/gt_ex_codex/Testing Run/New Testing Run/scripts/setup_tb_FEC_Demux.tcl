# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_FEC_Demux/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_FEC_Demux/frame_id} {/tb_FEC_Demux/desc_data} {/tb_FEC_Demux/cycle_cnt} {/tb_FEC_Demux/ST_DONE} {/tb_FEC_Demux/ST_GAP} {/tb_FEC_Demux/ST_STREAM} {/tb_FEC_Demux/tb_state} {/tb_FEC_Demux/rs_head_out} {/tb_FEC_Demux/rs_load_out} {/tb_FEC_Demux/out_hdr_byte_cnt} {/tb_FEC_Demux/total_hdr_bytes_out} {/tb_FEC_Demux/out_pld_byte_cnt} {/tb_FEC_Demux/out_pld_word_cnt} {/tb_FEC_Demux/total_pld_words_out}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_FEC_Demux.wcfg}
# This script does not run the simulation.
