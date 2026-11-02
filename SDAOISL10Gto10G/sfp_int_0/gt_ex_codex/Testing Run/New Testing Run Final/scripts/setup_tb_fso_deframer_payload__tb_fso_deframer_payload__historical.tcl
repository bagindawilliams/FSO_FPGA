# New simulation only: exact tested top/profile required.
foreach path {{/tb_fso_deframer_payload/clk} {/tb_fso_deframer_payload/rst_n} {/tb_fso_deframer_payload/m_axis_pld_tdata} {/tb_fso_deframer_payload/payload_in} {/tb_fso_deframer_payload/pld_crc_ok} {/tb_fso_deframer_payload/pld_check_done} {/tb_fso_deframer_payload/hdr_crc_ok} {/tb_fso_deframer_payload/rx_txfn} {/tb_fso_deframer_payload/drained_word_cnt} {/tb_fso_deframer_payload/in_byte_cnt} {/tb_fso_deframer_payload/frame_id} {/tb_fso_deframer_payload/calculated_crc32} {/tb_fso_deframer_payload/received_crc32} {/tb_fso_deframer_payload/frame_type_str} {/tb_fso_deframer_payload/out_byte_cnt} {/tb_fso_deframer_payload/mgmt_lsb_vec} {/tb_fso_deframer_payload/payload_dv} {/tb_fso_deframer_payload/m_axis_pld_tvalid} {/tb_fso_deframer_payload/m_axis_pld_tlast}} {
 if {![llength [get_objects -quiet $path]]} {error "Unresolved waveform object: $path. Wrong top/profile; do not ignore."}
 log_wave [get_objects $path]
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_fso_deframer_payload__tb_fso_deframer_payload__historical.wcfg}
