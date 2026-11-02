# New simulation only: exact tested top/profile required.
foreach path {{/tb_FEC_Demux/clk} {/tb_FEC_Demux/rst_n} {/tb_FEC_Demux/frame_id} {/tb_FEC_Demux/desc_data} {/tb_FEC_Demux/cycle_cnt} {/tb_FEC_Demux/ST_DONE} {/tb_FEC_Demux/ST_GAP} {/tb_FEC_Demux/ST_STREAM} {/tb_FEC_Demux/tb_state} {/tb_FEC_Demux/rs_head_out} {/tb_FEC_Demux/rs_load_out} {/tb_FEC_Demux/out_hdr_byte_cnt} {/tb_FEC_Demux/total_hdr_bytes_out} {/tb_FEC_Demux/out_pld_byte_cnt} {/tb_FEC_Demux/out_pld_word_cnt} {/tb_FEC_Demux/total_pld_words_out} {/tb_FEC_Demux/desc_dv} {/tb_FEC_Demux/rs_head_dv} {/tb_FEC_Demux/rs_load_dv}} {
 if {![llength [get_objects -quiet $path]]} {error "Unresolved waveform object: $path. Wrong top/profile; do not ignore."}
 log_wave [get_objects $path]
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_FEC_Demux__tb_FEC_Demux__historical.wcfg}
