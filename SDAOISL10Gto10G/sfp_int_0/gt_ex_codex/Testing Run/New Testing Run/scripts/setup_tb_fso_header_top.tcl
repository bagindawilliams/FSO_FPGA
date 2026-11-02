# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_fso_header_top/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_fso_header_top/trigger_header_gen} {/tb_fso_header_top/system_busy} {/tb_fso_header_top/rxfn_in} {/tb_fso_header_top/txfn_in} {/tb_fso_header_top/ack_in} {/tb_fso_header_top/frame_type_in} {/tb_fso_header_top/fcch_opcode_in} {/tb_fso_header_top/fcch_pl_in} {/tb_fso_header_top/tod_seconds_in} {/tb_fso_header_top/ts_applies_in} {/tb_fso_header_top/tx_ts_in} {/tb_fso_header_top/final_header_byte} {/tb_fso_header_top/byte_tracker} {/tb_fso_header_top/u_dut/u_crc_16/crc_out} {/tb_fso_header_top/u_dut/u_crc_16/count} {/tb_fso_header_top/u_dut/u_crc_16/R} {/tb_fso_header_top/u_dut/u_crc_16/state} {/tb_fso_header_top/u_dut/u_header_gen/full_header_reg} {/tb_fso_header_top/u_dut/u_header_gen/header_byte_out} {/tb_fso_header_top/u_dut/u_header_gen/header_en_out} {/tb_fso_header_top/total_hdr_bytes} {/tb_fso_header_top/frame_id} {/tb_fso_header_top/frame_type_str} {/tb_fso_header_top/scenario_id} {/tb_fso_header_top/out_byte_cnt} {/tb_fso_header_top/error_cnt}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_fso_header_top.wcfg}
# This script does not run the simulation.
