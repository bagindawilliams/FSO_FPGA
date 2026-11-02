# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_Scrambler_LPC/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_Scrambler_LPC/frame_id} {/tb_Scrambler_LPC/lpc_data} {/tb_Scrambler_LPC/mux_data} {/tb_Scrambler_LPC/rx_desc_data} {/tb_Scrambler_LPC/rx_lpc_dec_data} {/tb_Scrambler_LPC/scr_data} {/tb_Scrambler_LPC/loopback_ok_cnt} {/tb_Scrambler_LPC/cycle_cnt} {/tb_Scrambler_LPC/scr_prbs_mask_64b} {/tb_Scrambler_LPC/ST_DONE} {/tb_Scrambler_LPC/ST_GAP} {/tb_Scrambler_LPC/ST_STREAM} {/tb_Scrambler_LPC/frame_type_str} {/tb_Scrambler_LPC/ref_rd_ptr} {/tb_Scrambler_LPC/ref_wr_ptr} {/tb_Scrambler_LPC/scr_state_25b} {/tb_Scrambler_LPC/tb_state} {/tb_Scrambler_LPC/in_mux_byte_idx} {/tb_Scrambler_LPC/in_mux_word_idx} {/tb_Scrambler_LPC/lpc0_running_disp} {/tb_Scrambler_LPC/lpc1_running_disp} {/tb_Scrambler_LPC/lpc2_running_disp} {/tb_Scrambler_LPC/lpc3_running_disp} {/tb_Scrambler_LPC/out_lpc_byte_idx} {/tb_Scrambler_LPC/out_lpc_word_idx} {/tb_Scrambler_LPC/out_scr_byte_idx} {/tb_Scrambler_LPC/out_scr_word_idx} {/tb_Scrambler_LPC/loopback_err_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_Scrambler_LPC.wcfg}
# This script does not run the simulation.
