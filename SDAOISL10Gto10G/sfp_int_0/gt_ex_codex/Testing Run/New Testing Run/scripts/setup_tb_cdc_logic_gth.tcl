# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_cdc_logic_gth_verified/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_cdc_logic_gth_verified/frame_id} {/tb_cdc_logic_gth_verified/cdc_keep} {/tb_cdc_logic_gth_verified/data_in} {/tb_cdc_logic_gth_verified/in_byte_cnt} {/tb_cdc_logic_gth_verified/data_out} {/tb_cdc_logic_gth_verified/u_cdc2/frame_byte_cnt} {/tb_cdc_logic_gth_verified/u_cdc2/frame_out_id} {/tb_cdc_logic_gth_verified/OISL_Effective_Data_Rate_Mbps} {/tb_cdc_logic_gth_verified/OISL_FCCH_Mbps} {/tb_cdc_logic_gth_verified/OISL_Frame_Duration_us} {/tb_cdc_logic_gth_verified/OISL_Frame_Rate_kHz} {/tb_cdc_logic_gth_verified/time_end} {/tb_cdc_logic_gth_verified/time_start} {/tb_cdc_logic_gth_verified/iw} {/tb_cdc_logic_gth_verified/ow} {/tb_cdc_logic_gth_verified/prev_frame_id} {/tb_cdc_logic_gth_verified/frame_byte_cnt} {/tb_cdc_logic_gth_verified/cycle_cnt} {/tb_cdc_logic_gth_verified/ST_DONE} {/tb_cdc_logic_gth_verified/ST_GAP} {/tb_cdc_logic_gth_verified/ST_STREAM} {/tb_cdc_logic_gth_verified/tb_state} {/tb_cdc_logic_gth_verified/byte_out} {/tb_cdc_logic_gth_verified/frame_out_id} {/tb_cdc_logic_gth_verified/measured_byte_time_ns} {/tb_cdc_logic_gth_verified/measured_gth_period_ns}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_cdc_logic_gth.wcfg}
# This script does not run the simulation.
