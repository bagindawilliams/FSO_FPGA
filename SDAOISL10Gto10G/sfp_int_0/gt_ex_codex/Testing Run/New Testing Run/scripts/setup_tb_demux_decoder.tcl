# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_demux_decoder/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_demux_decoder/cdc_data_in} {/tb_demux_decoder/in_byte_cnt} {/tb_demux_decoder/demux_frame_id} {/tb_demux_decoder/word128_tmp} {/tb_demux_decoder/abs_b} {/tb_demux_decoder/frame_type_str} {/tb_demux_decoder/i} {/tb_demux_decoder/k} {/tb_demux_decoder/preamble_extracted} {/tb_demux_decoder/lpc_data_out} {/tb_demux_decoder/out_byte_cnt} {/tb_demux_decoder/lpc_out_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_demux_decoder.wcfg}
# This script does not run the simulation.
