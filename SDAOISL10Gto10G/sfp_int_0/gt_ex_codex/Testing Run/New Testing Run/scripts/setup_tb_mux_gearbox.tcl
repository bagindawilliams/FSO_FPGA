# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_mux_gearbox/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_mux_gearbox/lpc_data} {/tb_mux_gearbox/preamble_data} {/tb_mux_gearbox/track_lpc_bytes} {/tb_mux_gearbox/frame_id} {/tb_mux_gearbox/cdc_data} {/tb_mux_gearbox/cdc_keep} {/tb_mux_gearbox/gearbox_out_byte_cnt} {/tb_mux_gearbox/frame_type_str} {/tb_mux_gearbox/r_lpc_byte_cnt} {/tb_mux_gearbox/frame_3117b_pass_cnt} {/tb_mux_gearbox/preamble_msb_pass_cnt} {/tb_mux_gearbox/cycle_cnt} {/tb_mux_gearbox/ST_DONE} {/tb_mux_gearbox/ST_GAP} {/tb_mux_gearbox/ST_STREAM} {/tb_mux_gearbox/tb_state} {/tb_mux_gearbox/r_out_byte_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_mux_gearbox.wcfg}
# This script does not run the simulation.
