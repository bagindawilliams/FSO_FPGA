# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_fso_deframer_payload/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_fso_deframer_payload/m_axis_pld_tdata} {/tb_fso_deframer_payload/payload_in} {/tb_fso_deframer_payload/pld_crc_ok} {/tb_fso_deframer_payload/pld_check_done} {/tb_fso_deframer_payload/hdr_crc_ok} {/tb_fso_deframer_payload/rx_txfn} {/tb_fso_deframer_payload/drained_word_cnt} {/tb_fso_deframer_payload/in_byte_cnt} {/tb_fso_deframer_payload/frame_id} {/tb_fso_deframer_payload/calculated_crc32} {/tb_fso_deframer_payload/received_crc32} {/tb_fso_deframer_payload/frame_type_str} {/tb_fso_deframer_payload/out_byte_cnt} {/tb_fso_deframer_payload/mgmt_lsb_vec}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_fso_deframer_payload.wcfg}
# This script does not run the simulation.
