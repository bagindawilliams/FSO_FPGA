# ==============================================================================
# Company      : WiComAI Lab, Kookmin University
# Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
# File Name    : setup_all_25_waveforms.tcl
# Description  : Unified Auto-Grouping Waveform Script for All 25 Testbenches
#                in the SDA OISL 10G-to-10G Optical Communication Project.
#                - Keeps standard default Vivado waveform colors.
#                - Automatically sets Radix (unsigned for counters/indices,
#                  ascii for string tags, hex for data/header/CRC buses).
# Usage        : In Vivado Tcl Console (while any simulation is open), run:
#                  source setup_all_25_waveforms.tcl
# ==============================================================================

# ------------------------------------------------------------------------------
# HELPER PROCEDURE: Safely adds a list of signals into a collapsible Wave Group
#                   with automatic Radix formatting and default Vivado colors.
# ------------------------------------------------------------------------------
proc add_grp_sigs {grp_title top_scope sig_list} {
    set grp_obj [add_wave_group $grp_title]
    foreach s $sig_list {
        set full_path "/${top_scope}/${s}"
        set obj [get_objects -quiet $full_path]
        if {[llength $obj] > 0} {
            set w [add_wave -into $grp_obj $obj]
            set s_low [string tolower $s]
            # Auto-select Radix based on signal name convention (colors untouched)
            if {[string match "*_str*" $s_low] || [string match "*ascii*" $s_low]} {
                set_property radix ascii $w
            } elseif {[string match "time_*" $s_low] || [string match "oisl_*" $s_low] || [string match "measured_*" $s_low]} {
                # Real/floating-point metric signals keep default real format
            } elseif {[string match "*_cnt*" $s_low] || [string match "*_idx*" $s_low] || \
                      [string match "*_index*" $s_low] || [string match "*_bytes*" $s_low] || \
                      [string match "*_words*" $s_low] || [string match "*frame_id*" $s_low] || \
                      [string match "*_size*" $s_low] || [string match "*_disp*" $s_low] || \
                      [string match "*repaired*" $s_low] || [string match "*_pass_*" $s_low] || \
                      [string match "*_ok_*" $s_low] || [string match "*_err_*" $s_low] || \
                      [string match "*tracker*" $s_low] || [string match "*scenario_id*" $s_low] || \
                      [string match "*_sequence*" $s_low] || [string match "*_tod_*" $s_low] || \
                      [string match "*_sec*" $s_low] || [string match "*_picosec*" $s_low]} {
                set_property radix unsigned $w
            } else {
                catch {set_property radix hex $w}
            }
        }
    }
}

# ==============================================================================
# 1. tb_fso_header_top
# ==============================================================================
proc wave_tb_fso_header_top {} {
    set t "tb_fso_header_top"
    add_grp_sigs "1_Clocks_and_Control" $t {clk rst_n scenario_id trigger_header_gen system_busy}
    add_grp_sigs "2_Table_2_9_Header_Inputs" $t {txfn_in rxfn_in ack_in ack_valid_in frame_type_in tx_ts_in tod_seconds_in ts_applies_in fcch_opcode_in fcch_pl_in}
    add_grp_sigs "3_Serialized_16B_Header_and_CRC16_Out" $t {final_header_valid final_header_byte byte_tracker error_cnt}
}

# ==============================================================================
# 2. tb_fso_payload
# ==============================================================================
proc wave_tb_fso_payload {} {
    set t "tb_fso_payload"
    add_grp_sigs "1_PC_Packet_Gen_2000B" $t {clk rst_n trigger target_frame_size gen_tvalid gen_tdata gen_tkeep gen_tlast gen_tready}
    add_grp_sigs "2_FrontEnd_1900B_Segmenter" $t {seg_tvalid seg_tdata seg_tlast seg_tready seg_valid_bytes}
    add_grp_sigs "3_FSO_Payload_1912B_Table_2_18" $t {fifo_data_tvalid fifo_data_tdata fifo_data_tlast fifo_data_tready payload_cycle_cnt frame1_word_cnt frame2_word_cnt f1_pld_hdr f1_pkt_hdr f1_crc32 f2_pld_hdr f2_word1_data f2_word25_fcs f2_crc32}
    add_grp_sigs "4_ARQ_DDR4_Sniffer_and_Retx" $t {ddr4_write_req ddr4_read_req ddr4_delete_req ddr4_addr retx_data_tvalid retx_data_tdata retx_data_tlast retx_word_cnt retx_last_word_crc32}
}

# ==============================================================================
# 3. tb_idle_MGMT
# ==============================================================================
proc wave_tb_idle_MGMT {} {
    set t "tb_idle_MGMT"
    add_grp_sigs "1_Clocks_MUX_and_PNT_Inputs" $t {clk rst_n payload_mux_sel txfn_in mgmt_trigger_1hz rx_phy_ts_sec rx_phy_ts_picosec tx_phy_ts_sec tx_phy_ts_picosec range_meters range_ts_sec range_ts_picosec ts_valid}
    add_grp_sigs "2_Path00_IDLE_25b_PRBS_1912B" $t {idle_tvalid idle_tdata idle_tlast idle_tready idle_crc_cnt idle_first_word_txfn0 idle_first_word_txfn1}
    add_grp_sigs "3_Path10_MGMT_Table_2_14_1912B" $t {mgmt_tvalid mgmt_tdata mgmt_tlast mgmt_tready mgmt_crc_cnt}
    add_grp_sigs "4_Arbitrated_FSO_MUX_Out" $t {m_axis_fso_tvalid m_axis_fso_tdata m_axis_fso_tlast m_axis_fso_tready}
}

# ==============================================================================
# 4. tb_FEC_RS
# ==============================================================================
proc wave_tb_FEC_RS {} {
    set t "tb_FEC_RS"
    add_grp_sigs "1_Clocks_and_Frame_FSM" $t {clk rst_n tb_state frame_id mux_frame_type_str cycle_cnt}
    add_grp_sigs "2_Unencoded_Header_16B_and_Payload_1912B" $t {en_head header_in in_header_byte_idx in_header_word_idx en_load payload_in in_payload_word_idx in_payload_byte_idx}
    add_grp_sigs "3_RS_32_16_and_8xRS_255_239_Out" $t {rs_head_dv rs_head_out rs_head_out_byte_idx rs_head_out_word_idx rs_load_dv rs_load_out rs_load_out_word_idx rs_load_out_byte_idx}
    add_grp_sigs "4_FEC_MUX_259W_and_GF0x187_Syndrome" $t {mux_dv mux_data_out mux_out_word_idx mux_out_byte_idx hdr_synd_done hdr_syndrome_vec pld_synd_done pld_syndrome_vec hdr_synd_pass_cnt pld_synd_pass_cnt}
}

# ==============================================================================
# 5. tb_Scrambler_LPC
# ==============================================================================
proc wave_tb_Scrambler_LPC {} {
    set t "tb_Scrambler_LPC"
    add_grp_sigs "1_Clocks_and_Frame_FSM" $t {clk rst_n tb_state frame_id frame_type_str cycle_cnt}
    add_grp_sigs "2_FEC_MUX_Input_2072B" $t {mux_dv mux_data in_mux_word_idx in_mux_byte_idx}
    add_grp_sigs "3_Scrambler_25b_Seed_0x0000007" $t {scr_dv scr_data scr_state_25b scr_prbs_mask_64b out_scr_word_idx out_scr_byte_idx}
    add_grp_sigs "4_LPC_24_16_3108B_and_Disparity" $t {lpc_dv lpc_data out_lpc_word_idx out_lpc_byte_idx lpc3_running_disp lpc2_running_disp lpc1_running_disp lpc0_running_disp}
    add_grp_sigs "5_Loopback_SelfCheck_Out" $t {rx_lpc_dec_dv rx_lpc_dec_data rx_desc_dv rx_desc_data loopback_ok_cnt loopback_err_cnt}
}

# ==============================================================================
# 6. tb_mux_gearbox
# ==============================================================================
proc wave_tb_mux_gearbox {} {
    set t "tb_mux_gearbox"
    add_grp_sigs "1_Clocks_and_Frame_FSM" $t {clk rst_n global_clk_cnt tb_state frame_id frame_type_str cycle_cnt}
    add_grp_sigs "2_Preamble_72b_and_LPC_96b_In" $t {preamble_data lpc_valid lpc_data track_lpc_bytes}
    add_grp_sigs "3_MUX_Gearbox_128b_Out_3117B" $t {cdc_valid cdc_data cdc_keep gearbox_out_byte_cnt preamble_msb_pass_cnt frame_3117b_pass_cnt}
}

# ==============================================================================
# 7. tb_x_gth_logic (CDC 1 TX)
# ==============================================================================
proc wave_tb_x_gth_logic {} {
    set t "tb_x_gth_logic"
    add_grp_sigs "1_Write_Domain_312M5_In" $t {clk_gth rst_n cdc_ready tb_state current_frame_id mux_frame_type_str en_head header_in header_byte_index en_load payload_in payload_word_index}
    add_grp_sigs "2_Read_Domain_200M_Out_Latency2" $t {clk_logic header_dv header_out out_header_byte_idx verified_header_bytes hdr_crc16_tail_ok_cnt payload_dv payload_out out_payload_word_idx verified_payload_words pld_crc32_tail_ok_cnt}
}

# ==============================================================================
# 8. tb_cdc_logic_gth (CDC 2 TX)
# ==============================================================================
proc wave_tb_cdc_logic_gth {} {
    set t "tb_cdc_logic_gth"
    add_grp_sigs "1_Data_In_from_MUX_200M" $t {clk_logic rst_n en data_in_dv data_in cdc_keep frame_id in_clk_cnt in_byte_cnt}
    add_grp_sigs "2_Data_Out_from_CDC2_312M5_3117B" $t {clk_gth flag data_out byte_out out_clk_cnt frame_byte_cnt frame_out_id}
    add_grp_sigs "3_SDA_OISL_Table_2_4_Metrics" $t {time_start time_end OISL_Frame_Duration_us OISL_Effective_Data_Rate_Mbps OISL_Frame_Rate_kHz OISL_FCCH_Mbps}
}

# ==============================================================================
# 9. tb_eth_rx_front_end_top
# ==============================================================================
proc wave_tb_eth_rx_front_end_top {} {
    set t "tb_eth_rx_front_end_top"
    add_grp_sigs "1_PC1_Jumbo_Packet_Gen" $t {clk rst_n trigger target_frame_size gen_tvalid gen_tdata gen_tkeep gen_tlast gen_tready}
    add_grp_sigs "2_XGMII_32b_Link" $t {xgmii_txd xgmii_txc}
    add_grp_sigs "3_FrontEnd_1900B_Segmenter_Out" $t {fso_valid fso_data_out fso_last fso_ready payload_cycle_cnt seg_valid_bytes completed_seg_cnt fcs_verified_cnt}
}

# ==============================================================================
# 10. tb_mux_eth_32
# ==============================================================================
proc wave_tb_mux_eth_32 {} {
    set t "tb_mux_eth_32"
    add_grp_sigs "1_Reassembled_Stream_and_Preamble_In" $t {clk rst_n preamble_sfd asm_valid_in asm_data_in asm_last_in}
    add_grp_sigs "2_Prepended_Ethernet_Frame_Out" $t {eth_valid_out eth_data_out eth_last_out out_word_cnt err_cnt}
}

# ==============================================================================
# 11. tb_arq_tx_controller
# ==============================================================================
proc wave_tb_arq_tx_controller {} {
    set t "tb_arq_tx_controller"
    add_grp_sigs "1_Clocks_and_Traffic_Monitors" $t {clk rst_n fso_data_valid mgmt_tick_1hz header_gen_busy}
    add_grp_sigs "2_RX_ACK_NAK_Feedback_In" $t {rx_ack_valid_in rx_rxfn_in rx_ack_in}
    add_grp_sigs "3_Framer_and_MUX_Commands_Out" $t {tx_trigger_gen tx_txfn_out tx_frame_type payload_mux_sel tx_stall_mac}
    add_grp_sigs "4_ARQ_DDR4_RAM_and_Counters" $t {ddr4_write_req ddr4_read_req ddr4_delete_req ddr4_addr write_req_cnt retx_req_cnt delete_req_cnt mgmt_tx_cnt}
}

# ==============================================================================
# 12. tb_cdc3_rx_gth_logic
# ==============================================================================
proc wave_tb_cdc3_rx_gth_logic {} {
    set t "tb_cdc3_rx_gth_logic"
    add_grp_sigs "1_Data_In_from_GTH_RX_312M5" $t {clk_gth rst_n gth_rx_dv gth_rx_data in_byte_stream in_clk_cnt in_byte_cnt in_frame_id}
    add_grp_sigs "2_Data_Out_from_CDC3_200M_128b" $t {clk_logic cdc3_flag_out cdc3_data_out out_clk_cnt out_word128_cnt out_byte_stream out_frame_byte_cnt out_total_bytes out_frame_id}
    add_grp_sigs "3_SDA_OISL_Table_2_4_Metrics" $t {time_start time_end OISL_Frame_Duration_us OISL_Effective_Data_Rate_Mbps OISL_Frame_Rate_kHz OISL_FCCH_Mbps}
}

# ==============================================================================
# 13. tb_demux_decoder
# ==============================================================================
proc wave_tb_demux_decoder {} {
    set t "tb_demux_decoder"
    add_grp_sigs "1_CDC3_128b_Input" $t {clk rst_n cdc_valid_in cdc_data_in}
    add_grp_sigs "2_Extracted_72b_Preamble_and_Lock" $t {preamble_valid preamble_extracted link_locked}
    add_grp_sigs "3_Extracted_96b_LPC_Out_3108B" $t {lpc_valid_out lpc_data_out lpc_out_cnt}
}

# ==============================================================================
# 14. tb_error_inject
# ==============================================================================
proc wave_tb_error_inject {} {
    set t "tb_error_inject"
    add_grp_sigs "1_Data_In_from_CDC2_312M5" $t {clk_gth rst_n cdc2_flag_in cdc2_data_in in_byte_stream in_clk_cnt in_byte_cnt in_frame_id}
    add_grp_sigs "2_Data_Out_from_Error_Inject_to_GTH" $t {gth_tx_valid_out gth_tx_data_out err_mask_applied corrupted_word_cnt out_byte_stream out_clk_cnt frame_byte_cnt frame_out_id}
    add_grp_sigs "3_SDA_OISL_Table_2_4_Metrics" $t {time_start time_end OISL_Frame_Duration_us OISL_Effective_Data_Rate_Mbps OISL_Frame_Rate_kHz OISL_FCCH_Mbps}
}

# ==============================================================================
# 15. tb_fso_gth_bridge_hotswap
# ==============================================================================
proc wave_tb_fso_gth_bridge_hotswap {} {
    set t "tb_fso_gth_bridge_hotswap"
    add_grp_sigs "1_Clocks_Reset_and_Lock_Status" $t {clk_312_5 clk_100_drp gt_refclk_p sys_rst_n gth_link_up rx_block_locked}
    add_grp_sigs "2_FSO_TX_Input_and_Serial_Fiber" $t {fso_tx_en fso_tx_data txp_out txn_out rxp_in rxn_in}
    add_grp_sigs "3_FSO_RX_Recovered_Output" $t {fso_rx_valid fso_rx_data rx_word_cnt}
}

# ==============================================================================
# 16. tb_gth64b66b_loopback
# ==============================================================================
proc wave_tb_gth64b66b_loopback {} {
    set t "tb_gth64b66b_loopback"
    add_grp_sigs "1_TX_Stream_from_Error_Inject_312M5" $t {clk_312_5 sys_rst_n err_flag err_data tx_byte_stream tx_clk_cnt tx_byte_cnt tx_frame_id}
    add_grp_sigs "2_GTH_64B66B_Gearbox_and_Serial_10G3125" $t {tx0_clk rx0_clk gth_link_up rx_block_locked gt_txdata gt_txheader gt_txsequence txp_out rxp_in gt_rxdata gt_rxdatavalid gt_rxheader gt_rxheadervalid gt_rxgearboxslip}
    add_grp_sigs "3_RX_Recovered_Stream_to_CDC3_312M5" $t {rx_down_dv rx_down_data rx_byte_stream rx_clk_cnt rx_byte_cnt rx_frame_id}
    add_grp_sigs "4_SDA_OISL_Table_2_4_Metrics" $t {time_start time_end OISL_Frame_Duration_us OISL_Effective_Data_Rate_Mbps OISL_Frame_Rate_kHz OISL_FCCH_Mbps}
}

# ==============================================================================
# 17. tb_demux_preamble_128
# ==============================================================================
proc wave_tb_demux_preamble_128 {} {
    set t "tb_demux_preamble_128"
    add_grp_sigs "1_GTH_RX_and_CDC3_128b_In" $t {clk_gth clk_logic rst_n gth_rx_dv gth_rx_data cdc3_flag_out cdc3_data_out}
    add_grp_sigs "2_Preamble_72b_Extractor_and_Lock" $t {preamble_valid preamble_extracted link_locked_out locked_frame_cnt preamble_match_cnt}
    add_grp_sigs "3_Contiguous_96b_LPC_Burst_3108B" $t {lpc_valid_out lpc_data_out out_lpc_word_cnt out_lpc_byte_cnt lpc_byte_stream lpc_byte_idx demux_frame_id lpc_total_bytes}
}

# ==============================================================================
# 18. tb_lpc_dec_descrambler
# ==============================================================================
proc wave_tb_lpc_dec_descrambler {} {
    set t "tb_lpc_dec_descrambler"
    add_grp_sigs "1_Golden_TX_Scrambler_and_LPC" $t {clk rst_n tx_mux_dv tx_mux_data tx_scr_dv tx_scr_data tx_scr_state_25b tx_lpc_dv tx_lpc_data tx_lpc3_running_disp}
    add_grp_sigs "2_Noisy_Channel_and_RX_LPC_Dec" $t {full_96b_err_mask noisy_lpc_in rx_lpc_dec_dv rx_lpc_dec_data rx_lpc3_running_disp total_corrected_bits}
    add_grp_sigs "3_RX_25b_Descrambler_Out_2072B" $t {rx_desc_dv rx_desc_data rx_desc_state_25b byte_stream_out frame_byte_idx desc_frame_id matched_words mismatched_words}
}

# ==============================================================================
# 19. tb_FEC_Demux
# ==============================================================================
proc wave_tb_FEC_Demux {} {
    set t "tb_FEC_Demux"
    add_grp_sigs "1_Descrambled_64b_Input_2072B" $t {clk rst_n tb_state frame_id cycle_cnt desc_dv desc_data}
    add_grp_sigs "2_Demuxed_8b_RS_Header_32B" $t {rs_head_dv rs_head_out out_hdr_byte_cnt total_hdr_bytes_out}
    add_grp_sigs "3_Demuxed_64b_RS_Payload_2040B" $t {rs_load_dv rs_load_out out_pld_word_cnt out_pld_byte_cnt total_pld_words_out}
}

# ==============================================================================
# 20. tb_rs_decoder_rx
# ==============================================================================
proc wave_tb_rs_decoder_rx {} {
    set t "tb_rs_decoder_rx"
    add_grp_sigs "1_TX_RS_Encoder_and_Error_Injection" $t {clk rst_n tx_hdr_en tx_hdr_in enc_hdr_dv noisy_hdr_in tx_pld_en tx_pld_in enc_pld_dv noisy_pld_in}
    add_grp_sigs "2_RX_RS_32_16_Header_Decoder_16B" $t {dec_hdr_dv dec_hdr_out repaired_hdr_bytes hdr_ok_cnt hdr_err_cnt}
    add_grp_sigs "3_RX_8xRS_255_239_Payload_Decoder_1912B" $t {dec_pld_dv dec_pld_out total_repaired_pld_bytes fso_payload_header fso_packet_header fso_crc32_out pld_byte_stream pld_byte_cnt rs_frame_id pld_ok_cnt pld_err_cnt}
}

# ==============================================================================
# 21. tb_cdc4_logic_gth
# ==============================================================================
proc wave_tb_cdc4_logic_gth {} {
    set t "tb_cdc4_logic_gth"
    add_grp_sigs "1_Write_Domain_from_CoreRX_200M" $t {clk_logic rst_n en_head header_in en_load payload_in}
    add_grp_sigs "2_Read_Domain_to_Deframer_312M5" $t {clk_gth header_dv header_out out_hdr_byte_cnt payload_dv payload_out out_pld_word_cnt cdc4_frame_id out_pld_total_bytes}
    add_grp_sigs "3_Extracted_SDA_OISL_Markers" $t {cdc4_TXFN cdc4_FRAME_TYPE cdc4_HDR_CRC16 cdc4_FSO_PLD_HDR cdc4_FSO_PKT_HDR cdc4_ASCII_TAG cdc4_ETH_FCS cdc4_MGMT_RANGE cdc4_PLD_CRC32}
}

# ==============================================================================
# 22. tb_fso_deframer_payload
# ==============================================================================
proc wave_tb_fso_deframer_payload {} {
    set t "tb_fso_deframer_payload"
    add_grp_sigs "1_Payload_478W_Input_and_Context" $t {clk rst_n rx_txfn hdr_crc_ok payload_dv payload_in}
    add_grp_sigs "2_ZeroInit_CRC32_Check_and_477W_Drain" $t {pld_check_done pld_crc_ok calculated_crc32 received_crc32 m_axis_pld_tvalid m_axis_pld_tdata m_axis_pld_tlast drained_word_cnt}
}

# ==============================================================================
# 23. tb_fso_ethernet_deframer
# ==============================================================================
proc wave_tb_fso_ethernet_deframer {} {
    set t "tb_fso_ethernet_deframer"
    add_grp_sigs "1_CDC4_Header_16B_and_Payload_1912B_In" $t {clk rst_n s_axis_hdr_tvalid s_axis_hdr_tdata s_axis_fso_tvalid s_axis_fso_tdata}
    add_grp_sigs "2_Header_Parser_CRC_and_ARQ_Feedback" $t {hdr_crc_ok pld_crc_ok rx_txfn rx_frame_type local_fb_ack_valid local_fb_rxfn local_fb_ack expected_txfn}
    add_grp_sigs "3_InOrder_DATA_Drain_and_MGMT_Range" $t {m_axis_fso_tvalid m_axis_fso_tdata m_axis_fso_tlast drained_data_frames mgmt_telemetry_valid mgmt_range_meters}
}

# ==============================================================================
# 24. tb_reassembly_and_backend (and bonus tb_eth_tx_back_end_top)
# ==============================================================================
proc wave_tb_reassembly_and_backend {} {
    set t "tb_reassembly_and_backend"
    add_grp_sigs "1_InOrder_1908B_FSO_DATA_In" $t {clk rst_n s_axis_fso_tvalid s_axis_fso_tdata s_axis_fso_tlast s_axis_fso_tready}
    add_grp_sigs "2_Reassembled_Ethernet_2008B_Out" $t {reassembled_eth_tvalid reassembled_eth_tdata reassembled_eth_tlast reassembled_pkt_bytes reassembled_pkt_cnt eth_out_words captured_last_eth_fcs}
    add_grp_sigs "3_PC2_10G_XGMII_Egress_2012B" $t {pc2_xgmii_txd pc2_xgmii_txc xgmii_pkt_words}
}

proc wave_tb_eth_tx_back_end_top {} {
    set t "tb_eth_tx_back_end_top"
    add_grp_sigs "1_Reassembled_Ethernet_Input_2008B" $t {clk rst_n en data_in}
    add_grp_sigs "2_PC2_10G_XGMII_Egress_Output" $t {xgmii_txd xgmii_txc}
}

# ==============================================================================
# 25. tb_SDAOISL10Gto10G_top (Grand Top-Level 8-Group End-to-End Testbench)
# ==============================================================================
proc wave_tb_SDAOISL10Gto10G_top {} {
    set t "tb_SDAOISL10Gto10G_top"
    add_grp_sigs "GRP1_PC1_INGRESS_FRONT_END" $t {
        clk_tx grp1_pc1_gen_valid grp1_pc1_gen_data grp1_pc1_gen_last
        grp1_pc1_clk_cnt grp1_pc1_byte_cnt grp1_pc1_xgmii_rxd grp1_pc1_xgmii_rxc
        grp1_seg_valid grp1_seg_data grp1_seg_last grp1_seg_clk_cnt
        grp1_seg_byte_cnt grp1_seg_active_bytes grp1_seg_frame_id
    }
    add_grp_sigs "GRP2_TX_FSO_FRAMER_ARQ" $t {
        clk_tx grp2_tx_txfn grp2_tx_frame_type grp2_payload_mux_sel
        grp2_hdr_valid grp2_hdr_data grp2_hdr_clk_cnt grp2_hdr_byte_cnt
        grp2_pld_valid grp2_pld_data grp2_pld_last grp2_pld_clk_cnt grp2_pld_byte_cnt
    }
    add_grp_sigs "GRP3_TX_CDC1_FEC_CORE_200M" $t {
        clk_200m grp3_cdc1_hdr_dv grp3_cdc1_hdr_data grp3_cdc1_pld_dv grp3_cdc1_pld_data
        grp3_fec_mux_dv grp3_fec_mux_data grp3_scr_dv grp3_scr_data grp3_scr_state_25b
        grp3_scr_clk_cnt grp3_scr_byte_cnt grp3_lpc_dv grp3_lpc_data grp3_lpc_rd_acc
        grp3_lpc_clk_cnt grp3_lpc_byte_cnt
    }
    add_grp_sigs "GRP4_TX_GEARBOX128_CDC2_ERRINJ" $t {
        clk_200m clk_tx grp4_preamble_72b grp4_gb128_valid grp4_gb128_data grp4_gb128_keep
        grp4_cdc2_valid grp4_cdc2_data grp4_tx_fso_valid grp4_tx_fso_data
        grp4_tx_byte_stream grp4_tx_clk_cnt grp4_tx_byte_cnt grp4_tx_frame_id grp4_corrupted_words
    }
    add_grp_sigs "GRP5_GTH_64B66B_OPTICAL_LOOPBACK" $t {
        clk_tx clk_rx grp5_gth_link_up grp5_rx_block_locked
        grp5_gt_txdata grp5_gt_txheader grp5_gt_txsequence TXP_OUT RXP_IN
        grp5_rx_fso_valid grp5_rx_fso_data grp5_rx_byte_stream grp5_rx_clk_cnt
        grp5_rx_byte_cnt grp5_rx_frame_id
    }
    add_grp_sigs "GRP6_RX_CDC3_FEC_CORE_200M" $t {
        clk_200m grp6_cdc3_valid grp6_cdc3_data grp6_cdc3_clk_cnt grp6_cdc3_byte_cnt
        grp6_rx_preamble_72b grp6_rx_preamble_lock grp6_rx_lpc_dec_dv grp6_rx_lpc_dec_data
        grp6_lpc_repaired_bits grp6_rx_desc_dv grp6_rx_desc_data
        grp6_rs_hdr_dv grp6_rs_hdr_data grp6_rs_pld_dv grp6_rs_pld_data
        grp6_rs_repaired_syms grp6_rs_pld_clk_cnt grp6_rs_pld_byte_cnt
    }
    add_grp_sigs "GRP7_RX_CDC4_DEFRAMER_ARQ" $t {
        clk_rx grp7_cdc4_hdr_dv grp7_cdc4_hdr_data grp7_cdc4_hdr_byte_cnt
        grp7_cdc4_pld_dv grp7_cdc4_pld_data grp7_cdc4_pld_clk_cnt grp7_cdc4_pld_byte_cnt
        grp7_hdr_crc16_ok grp7_pld_crc32_ok grp7_rx_txfn grp7_rx_frame_type
        grp7_arq_fb_valid grp7_arq_fb_rxfn grp7_arq_fb_ack
        grp7_deframed_valid grp7_deframed_data grp7_deframed_last
        grp7_defr_clk_cnt grp7_defr_byte_cnt
    }
    add_grp_sigs "GRP8_PC2_REASSEMBLY_EGRESS_BACKEND" $t {
        clk_rx grp8_reasm_eth_valid grp8_reasm_eth_data grp8_reasm_eth_last
        grp8_reasm_clk_cnt grp8_reasm_byte_cnt grp8_reasm_pkt_bytes grp8_reasm_pkt_cnt
        grp8_captured_ascii grp8_captured_fcs
        grp8_pc2_xgmii_txd grp8_pc2_xgmii_txc grp8_pc2_clk_cnt grp8_pc2_byte_cnt grp8_pc2_pkt_cnt
    }
}

# ==============================================================================
# MASTER AUTO-DISPATCHER: Detects the active simulation top module and runs
#                         its corresponding waveform grouping procedure.
# ==============================================================================
set all_supported_tbs {
    tb_SDAOISL10Gto10G_top
    tb_fso_header_top
    tb_fso_payload
    tb_idle_MGMT
    tb_FEC_RS
    tb_Scrambler_LPC
    tb_mux_gearbox
    tb_x_gth_logic
    tb_cdc_logic_gth
    tb_eth_rx_front_end_top
    tb_mux_eth_32
    tb_arq_tx_controller
    tb_cdc3_rx_gth_logic
    tb_demux_decoder
    tb_error_inject
    tb_fso_gth_bridge_hotswap
    tb_gth64b66b_loopback
    tb_demux_preamble_128
    tb_lpc_dec_descrambler
    tb_FEC_Demux
    tb_rs_decoder_rx
    tb_cdc4_logic_gth
    tb_fso_deframer_payload
    tb_fso_ethernet_deframer
    tb_reassembly_and_backend
    tb_eth_tx_back_end_top
}

set detected_tb ""
foreach cand_tb $all_supported_tbs {
    if {[llength [get_objects -quiet "/${cand_tb}/*"]] > 0} {
        set detected_tb $cand_tb
        break
    }
}

if {$detected_tb eq ""} {
    catch {set detected_tb [get_property top [current_fileset -simset]]}
}

if {$detected_tb ne "" && [info procs "wave_${detected_tb}"] ne ""} {
    puts "=================================================================="
    puts " \[AUTO-WAVEFORM\] Detected Active Testbench: $detected_tb"
    puts " \[AUTO-WAVEFORM\] Clearing ungrouped waves and building groups..."
    puts "=================================================================="
    catch {remove_wave [get_waves *]}
    eval "wave_${detected_tb}"
    catch {wv.zoom.full}
    puts " \[AUTO-WAVEFORM\] Waveform Groups for $detected_tb Ready!"
} else {
    puts " \[WARN\] Could not auto-detect active testbench. You can manually call:"
    puts "        wave_<tb_name>  (e.g., wave_tb_SDAOISL10Gto10G_top)"
}