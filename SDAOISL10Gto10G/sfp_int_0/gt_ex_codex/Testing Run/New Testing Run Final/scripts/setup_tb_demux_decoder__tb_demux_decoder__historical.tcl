# New simulation only: exact tested top/profile required.
foreach path {{/tb_demux_decoder/clk} {/tb_demux_decoder/rst_n} {/tb_demux_decoder/cdc_data_in} {/tb_demux_decoder/in_byte_cnt} {/tb_demux_decoder/demux_frame_id} {/tb_demux_decoder/word128_tmp} {/tb_demux_decoder/abs_b} {/tb_demux_decoder/frame_type_str} {/tb_demux_decoder/i} {/tb_demux_decoder/k} {/tb_demux_decoder/preamble_extracted} {/tb_demux_decoder/lpc_data_out} {/tb_demux_decoder/out_byte_cnt} {/tb_demux_decoder/lpc_out_cnt} {/tb_demux_decoder/cdc_valid_in} {/tb_demux_decoder/preamble_valid} {/tb_demux_decoder/lpc_valid_out} {/tb_demux_decoder/link_locked} {/tb_demux_decoder/locked_frame_cnt}} {
 if {![llength [get_objects -quiet $path]]} {error "Unresolved waveform object: $path. Wrong top/profile; do not ignore."}
 log_wave [get_objects $path]
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_demux_decoder__tb_demux_decoder__historical.wcfg}
