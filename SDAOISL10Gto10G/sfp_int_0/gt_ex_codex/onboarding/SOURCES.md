# Inventaris source dan hierarki statis

Dihasilkan dari XPR utama dan pencarian instansiasi leksikal; bukan hasil elaborasi. Kedua cabang generate disertakan. AutoDisabled/UserDisabled tetap dicatat di project_sources.tsv. Tidak terjangkau berarti tidak ditemukan pada penelusuran top ini, bukan bukti file tidak dipakai oleh TB, script, atau proyek lain.

## Instansiasi kandidat dari top

| Parent | Instance | Module |
|---|---|---|
| SDAOISL10Gto10G_top | autorun_inst | autorun |
| SDAOISL10Gto10G_top | back_end_inst | eth_tx_back_end_top |
| SDAOISL10Gto10G_top | clk_wiz_0_inst | clk_wiz_0 |
| SDAOISL10Gto10G_top | front_end_inst | eth_rx_front_end_top |
| SDAOISL10Gto10G_top | packet_gen_inst | eth_axis_packet_gen |
| SDAOISL10Gto10G_top | sda_decoder_inst | sda_decoder |
| SDAOISL10Gto10G_top | sda_encoder_inst | sda_encoder |
| SDAOISL10Gto10G_top | sys_clk_inst | IBUFGDS |
| SDAOISL10Gto10G_top | u_fso_gth_core | fso_gth_core_wrapper |
| SDAOISL10Gto10G_top | u_gth64b66b_rx | gth64b66b_rx |
| SDAOISL10Gto10G_top | u_gth64b66b_tx | gth64b66b_tx |
| SDAOISL10Gto10G_top | xgmii_encoder_inst | xgmii_tx_encoder |
| chien_search | gf_1 | multiplier |
| chien_search | gf_2 | multiplier |
| chien_search | gf_3 | multiplier |
| chien_search | gf_4 | multiplier |
| chien_search | gf_5 | multiplier |
| chien_search | gf_6 | multiplier |
| chien_search | gf_7 | multiplier |
| chien_search | gf_8 | multiplier |
| core_rx | demux_inst | demux_preamble_128 |
| core_rx | descrambler_inst | descrambler |
| core_rx | fec_demux_inst | FEC_Demux |
| core_rx | lpc_dec_top_inst | lpc_dec_top |
| core_rx | preamble_sda_decoder_inst | preamble_sda_decoder |
| core_rx | rs_decoder_64_inst | rs_decoder_64 |
| core_rx | rs_decoder_inst | rs_decoder |
| core_tx | lpc_top_inst | lpc_top |
| core_tx | rs_enc_header_inst | rs_encoder |
| core_tx | rs_encoder_64_inst | rs_encoder_64 |
| core_tx | scrambler_inst | scrambler |
| core_tx | u_fec_mux | FEC_MUX |
| deframer | u_arq_rx_controller | arq_rx_controller |
| deframer | u_deframer_header | deframer_header |
| deframer | u_deframer_payload | deframer_payload |
| deframer | u_frame_demultiplexer | frame_demultiplexer |
| deframer_header | u_crc16_checker | fso_crc_16_checker |
| deframer_header | u_header_parser | header_parser |
| deframer_payload | u_crc32_checker | fso_crc_32_checker |
| eth_rx_front_end_top | physical_mac_rx_inst | eth_10g_pcs_pma_rx_0 |
| eth_rx_front_end_top | u_preamble_remover | eth_preamble_remover |
| eth_rx_front_end_top | u_rx_parser | xgmii_rx_parser |
| eth_rx_front_end_top | u_segmenter | packaging_and_segmentation |
| eth_tx_back_end_top | physical_mac_tx_inst | eth_10g_pcs_pma_tx_0 |
| eth_tx_back_end_top | u_formatter | xgmii_tx_formatter |
| eth_tx_back_end_top | u_packing | eth_mac_packing_tx |
| ethernet_frame_reassembly | u_eth_preamble_gen | eth_preamble_gen |
| ethernet_frame_reassembly | u_mux_eth_32 | mux_eth_32 |
| ethernet_fso_framer | u_arq_tx_controller | arq_tx_controller |
| ethernet_fso_framer | u_fso_header_top | fso_header_top |
| ethernet_fso_framer | u_fso_payload_top | fso_payload_top |
| euclid_proc | gf_B | multiplier |
| euclid_proc | gf_B1 | multiplier |
| euclid_proc | gf_B10 | multiplier |
| euclid_proc | gf_B11 | multiplier |
| euclid_proc | gf_B12 | multiplier |
| euclid_proc | gf_B13 | multiplier |
| euclid_proc | gf_B14 | multiplier |
| euclid_proc | gf_B15 | multiplier |
| euclid_proc | gf_B16 | multiplier |
| euclid_proc | gf_B2 | multiplier |
| euclid_proc | gf_B3 | multiplier |
| euclid_proc | gf_B4 | multiplier |
| euclid_proc | gf_B5 | multiplier |
| euclid_proc | gf_B6 | multiplier |
| euclid_proc | gf_B7 | multiplier |
| euclid_proc | gf_B8 | multiplier |
| euclid_proc | gf_B9 | multiplier |
| euclid_proc | gf_D | multiplier |
| euclid_proc | gf_D0 | multiplier |
| euclid_proc | gf_D1 | multiplier |
| euclid_proc | gf_D10 | multiplier |
| euclid_proc | gf_D11 | multiplier |
| euclid_proc | gf_D12 | multiplier |
| euclid_proc | gf_D13 | multiplier |
| euclid_proc | gf_D14 | multiplier |
| euclid_proc | gf_D15 | multiplier |
| euclid_proc | gf_D2 | multiplier |
| euclid_proc | gf_D3 | multiplier |
| euclid_proc | gf_D4 | multiplier |
| euclid_proc | gf_D5 | multiplier |
| euclid_proc | gf_D6 | multiplier |
| euclid_proc | gf_D7 | multiplier |
| euclid_proc | gf_D8 | multiplier |
| euclid_proc | gf_D9 | multiplier |
| euclid_proc | gf_X0 | multiplier |
| euclid_proc | gf_X00 | multiplier |
| euclid_proc | gf_X1 | multiplier |
| euclid_proc | gf_X10 | multiplier |
| euclid_proc | gf_X11 | multiplier |
| euclid_proc | gf_X12 | multiplier |
| euclid_proc | gf_X13 | multiplier |
| euclid_proc | gf_X14 | multiplier |
| euclid_proc | gf_X16 | multiplier |
| euclid_proc | gf_X2 | multiplier |
| euclid_proc | gf_X3 | multiplier |
| euclid_proc | gf_X4 | multiplier |
| euclid_proc | gf_X5 | multiplier |
| euclid_proc | gf_X6 | multiplier |
| euclid_proc | gf_X7 | multiplier |
| euclid_proc | gf_X8 | multiplier |
| euclid_proc | gf_X9 | multiplier |
| euclid_proc | gf_Y0 | multiplier |
| euclid_proc | gf_Y1 | multiplier |
| euclid_proc | gf_Y10 | multiplier |
| euclid_proc | gf_Y11 | multiplier |
| euclid_proc | gf_Y12 | multiplier |
| euclid_proc | gf_Y13 | multiplier |
| euclid_proc | gf_Y14 | multiplier |
| euclid_proc | gf_Y15 | multiplier |
| euclid_proc | gf_Y2 | multiplier |
| euclid_proc | gf_Y3 | multiplier |
| euclid_proc | gf_Y4 | multiplier |
| euclid_proc | gf_Y5 | multiplier |
| euclid_proc | gf_Y6 | multiplier |
| euclid_proc | gf_Y7 | multiplier |
| euclid_proc | gf_Y8 | multiplier |
| euclid_proc | gf_Y9 | multiplier |
| euclid_proc | invert_0 | inverter |
| forney_math | gf_0 | multiplier |
| forney_math | gf_1 | multiplier |
| forney_math | gf_2 | multiplier |
| forney_math | gf_3 | multiplier |
| forney_math | gf_4 | multiplier |
| forney_math | gf_5 | multiplier |
| forney_math | gf_6 | multiplier |
| forney_math | gf_7 | multiplier |
| forney_math | gf_d0 | multiplier |
| forney_math | invert_0 | inverter |
| frame_demultiplexer | u_arq_rx_reorder | arq_rx_reorder_ddr4_wrapper |
| frame_demultiplexer | u_idle_discard | idle_discard |
| frame_demultiplexer | u_mgmt_extraction | mgmt_extraction |
| fso_ethernet_deframer | u_deframer | deframer |
| fso_gth_core_wrapper | u_bufg_gt_rx | BUFG_GT |
| fso_gth_core_wrapper | u_bufg_gt_tx | BUFG_GT |
| fso_gth_core_wrapper | u_gth_fso_64b66b | gth_fso_64b66b |
| fso_gth_core_wrapper | u_ibufds_gte3_refclk | IBUFDS_GTE3 |
| fso_header_top | u_crc_16 | fso_crc_16 |
| fso_header_top | u_header_gen | header_generator |
| fso_idle_generator | fifo_idle | fso_axis_fifo |
| fso_idle_generator | u_fso_crc_32_idle | fso_crc_32 |
| fso_payload | fifo_data | fso_axis_fifo |
| fso_payload | u_arq_ddr4_wrapper | arq_ddr4_wrapper |
| fso_payload | u_fso_crc_32 | fso_crc_32 |
| fso_payload_top | u_fso_idle_generator | fso_idle_generator |
| fso_payload_top | u_fso_payload | fso_payload |
| fso_payload_top | u_fso_payload_mux | fso_payload_mux |
| fso_payload_top | u_mgmt_telemetry_generator | mgmt_telemetry_generator |
| lpc_dec_top | lpc_dec_0 | lpc_dec |
| lpc_dec_top | lpc_dec_1 | lpc_dec |
| lpc_dec_top | lpc_dec_2 | lpc_dec |
| lpc_dec_top | lpc_dec_3 | lpc_dec |
| lpc_top | lpc_0 | lpc |
| lpc_top | lpc_1 | lpc |
| lpc_top | lpc_2 | lpc |
| lpc_top | lpc_3 | lpc |
| mgmt_telemetry_generator | fifo_mgmt | fso_axis_fifo |
| mgmt_telemetry_generator | u_fso_crc_32_mgmt | fso_crc_32 |
| rs_decoder | bram_rs_inst | bram_rs |
| rs_decoder | chien_search_inst | chien_search |
| rs_decoder | euclid_proc_inst | euclid_proc |
| rs_decoder | forney_math_inst | forney_math |
| rs_decoder | syndrome_unit_inst | syndrome_unit |
| rs_decoder_64 | rs_decoder_0 | rs_decoder |
| rs_decoder_64 | rs_decoder_1 | rs_decoder |
| rs_decoder_64 | rs_decoder_2 | rs_decoder |
| rs_decoder_64 | rs_decoder_3 | rs_decoder |
| rs_decoder_64 | rs_decoder_4 | rs_decoder |
| rs_decoder_64 | rs_decoder_5 | rs_decoder |
| rs_decoder_64 | rs_decoder_6 | rs_decoder |
| rs_decoder_64 | rs_decoder_7 | rs_decoder |
| rs_encoder | gf_0 | multiplier |
| rs_encoder | gf_1 | multiplier |
| rs_encoder | gf_2 | multiplier |
| rs_encoder | gf_3 | multiplier |
| rs_encoder | gf_4 | multiplier |
| rs_encoder | gf_5 | multiplier |
| rs_encoder | gf_6 | multiplier |
| rs_encoder | gf_7 | multiplier |
| rs_encoder | gf_8 | multiplier |
| rs_encoder | gf_9 | multiplier |
| rs_encoder | gf_a | multiplier |
| rs_encoder | gf_b | multiplier |
| rs_encoder | gf_c | multiplier |
| rs_encoder | gf_d | multiplier |
| rs_encoder | gf_e | multiplier |
| rs_encoder | gf_f | multiplier |
| rs_encoder_64 | rs_encoder_0 | rs_encoder |
| rs_encoder_64 | rs_encoder_1 | rs_encoder |
| rs_encoder_64 | rs_encoder_2 | rs_encoder |
| rs_encoder_64 | rs_encoder_3 | rs_encoder |
| rs_encoder_64 | rs_encoder_4 | rs_encoder |
| rs_encoder_64 | rs_encoder_5 | rs_encoder |
| rs_encoder_64 | rs_encoder_6 | rs_encoder |
| rs_encoder_64 | rs_encoder_7 | rs_encoder |
| rx_gth_logic | u_async_fifo_rx3 | cross_gth_logic |
| rx_logic_gth | cross_head_inst | cross_logic_gth_head |
| rx_logic_gth | cross_load_inst | cross_logic_gth_load |
| sda_decoder | u_cdc_rx_3 | rx_gth_logic |
| sda_decoder | u_cdc_rx_4 | rx_logic_gth |
| sda_decoder | u_core_rx | core_rx |
| sda_decoder | u_ethernet_frame_reassembly | ethernet_frame_reassembly |
| sda_decoder | u_fso_ethernet_deframer | fso_ethernet_deframer |
| sda_encoder | u_cdc_tx_1 | x_gth_logic |
| sda_encoder | u_cdc_tx_2 | x_logic_gth |
| sda_encoder | u_encoder_fec | core_tx |
| sda_encoder | u_error_injector | error_inject |
| sda_encoder | u_eth_fso_framer | ethernet_fso_framer |
| sda_encoder | u_mux_gearbox | mux_gearbox_128 |
| sda_encoder | u_preamble_gen | preamble_gen |
| syndrome_unit | gf_0 | multiplier |
| syndrome_unit | gf_1 | multiplier |
| syndrome_unit | gf_2 | multiplier |
| syndrome_unit | gf_3 | multiplier |
| syndrome_unit | gf_4 | multiplier |
| syndrome_unit | gf_5 | multiplier |
| syndrome_unit | gf_6 | multiplier |
| syndrome_unit | gf_7 | multiplier |
| syndrome_unit | gf_8 | multiplier |
| syndrome_unit | gf_9 | multiplier |
| syndrome_unit | gf_a | multiplier |
| syndrome_unit | gf_b | multiplier |
| syndrome_unit | gf_c | multiplier |
| syndrome_unit | gf_d | multiplier |
| syndrome_unit | gf_e | multiplier |
| syndrome_unit | gf_f | multiplier |
| x_gth_logic | cross_head_inst | cross_gth_logic_head |
| x_gth_logic | cross_load_inst | cross_gth_logic_load |
| x_logic_gth | u_async_fifo | cross_logic_gth |

## Modul terdaftar XPR tetapi tidak terjangkau dari top

- `assembler` — `gt_ex.srcs/sources_1/new/decoder/assembler.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `assembler_top` — `gt_ex.srcs/sources_1/new/decoder/assembler_top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `combiner` — `gt_ex.srcs/sources_1/new/encoder/combiner.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `crc_16` — `gt_ex.srcs/sources_1/new/encoder/crc_16.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `crc_32` — `gt_ex.srcs/sources_1/new/encoder/crc_32.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `decoder_top` — `gt_ex.srcs/sources_1/new/decoder/decoder_top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `demux_preamble_hotswap` — `gt_ex.srcs/sources_1/new/demux_preamble_hotswap.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `encoder_top` — `gt_ex.srcs/sources_1/new/encoder/encoder_top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `error_inject_hotswap` — `gt_ex.srcs/sources_1/new/error_inject_hotswap.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `eth_mac_segmenter` — `gt_ex.srcs/sources_1/new/eth_mac_segmenter.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `framer` — `gt_ex.srcs/sources_1/new/encoder/framer.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `framer_top` — `gt_ex.srcs/sources_1/new/encoder/framer_top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `fso_gth_bridge_hotswap` — `gt_ex.srcs/sources_1/new/fso_gth_bridge_hotswap.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_bit_synchronizer` — `imports/gt_example_bit_sync.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_checking_8b10b` — `imports/gt_example_checking_8b10b.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_gtwiz_userclk_rx` — `imports/gt_example_gtwiz_userclk_rx.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_gtwiz_userclk_tx` — `imports/gt_example_gtwiz_userclk_tx.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_init` — `imports/gt_example_init.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_reset_synchronizer` — `imports/gt_example_reset_sync.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_stimulus_8b10b` — `imports/gt_example_stimulus_8b10b.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_top` — `imports/gt_example_top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_top_sim` — `imports/gt_example_top_sim.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_example_wrapper` — `imports/gt_example_wrapper.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `gt_prbs_any` — `imports/gt_prbs_any.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `mac_ip_sniffer` — `gt_ex.srcs/sources_1/new/mac_ip_sniffer.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `packet_rec` — `gt_ex.srcs/sources_1/new/packet_rec.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `packet_send` — `gt_ex.srcs/sources_1/new/packet_send.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `preamble_sda_dec` — `gt_ex.srcs/sources_1/new/preamble_sda_dec.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `separator` — `gt_ex.srcs/sources_1/new/decoder/separator.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `stream_input` — `gt_ex.srcs/sources_1/new/stream_input.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `tb_FEC_Demux` — `gt_ex.srcs/sources_1/new/tb_FEC_Demux.v` (testbench)
- `tb_FEC_RS` — `gt_ex.srcs/sources_1/new/tb_FEC_RS.v` (testbench)
- `tb_SDAOISL10Gto10G_top` — `gt_ex.srcs/sources_1/new/tb_SDAOISL10Gto10G_top.v` (testbench)
- `tb_Scrambler_LPC` — `gt_ex.srcs/sources_1/new/tb_Scrambler_LPC.v` (testbench)
- `tb_arq_tx_controller` — `gt_ex.srcs/sources_1/new/tb_arq_tx_controller.v` (testbench)
- `tb_cdc3_rx_gth_logic` — `gt_ex.srcs/sources_1/new/tb_cdc3_rx_gth_logic.v` (testbench)
- `tb_cdc4_logic_gth` — `gt_ex.srcs/sources_1/new/tb_cdc4_logic_gth.v` (testbench)
- `tb_cdc_logic_gth` — `gt_ex.srcs/sources_1/new/tb_cdc_logic_gth.v` (testbench)
- `tb_demux_decoder` — `gt_ex.srcs/sources_1/new/tb_demux_decoder.v` (testbench)
- `tb_demux_preamble_128` — `gt_ex.srcs/sources_1/new/tb_demux_preamble_128.v` (testbench)
- `tb_demux_preamble_hotswap` — `gt_ex.srcs/sources_1/new/tb_demux_preamble_hotswap.v` (testbench)
- `tb_error_inject` — `gt_ex.srcs/sources_1/new/tb_error_inject.v` (testbench)
- `tb_eth_rx_front_end_top` — `gt_ex.srcs/sources_1/new/tb_eth_rx_front_end_top.v` (testbench)
- `tb_eth_tx_back_end_top` — `gt_ex.srcs/sources_1/new/tb_eth_tx_back_end_top.v` (testbench)
- `tb_fso_deframer_payload` — `gt_ex.srcs/sources_1/new/tb_fso_deframer_payload.v` (testbench)
- `tb_fso_ethernet_deframer` — `gt_ex.srcs/sources_1/new/tb_fso_ethernet_deframer.v` (testbench)
- `tb_fso_gth_bridge_hotswap` — `gt_ex.srcs/sources_1/new/tb_fso_gth_bridge_hotswap.v` (testbench)
- `tb_fso_header_top` — `gt_ex.srcs/sources_1/new/tb_fso_header_top.v` (testbench)
- `tb_fso_payload` — `gt_ex.srcs/sources_1/new/tb_fso_payload.v` (testbench)
- `tb_gth64b66b_loopback` — `gt_ex.srcs/sources_1/new/tb_gth64b66b_loopback.v` (testbench)
- `tb_idle_MGMT` — `gt_ex.srcs/sources_1/new/tb_idle_MGMT.v` (testbench)
- `tb_lpc_dec_descrambler` — `gt_ex.srcs/sources_1/new/tb_lpc_dec_descrambler.v` (testbench)
- `tb_mux_eth_32` — `gt_ex.srcs/sources_1/new/tb_mux_eth_32.v` (testbench)
- `tb_mux_gearbox` — `gt_ex.srcs/sources_1/new/tb_mux_gearbox.v` (testbench)
- `tb_reassembly_and_backend` — `gt_ex.srcs/sources_1/new/tb_reassembly_and_backend.v` (testbench)
- `tb_rs_decoder_rx` — `gt_ex.srcs/sources_1/new/tb_rs_decoder_rx.v` (testbench)
- `tb_top` — `gt_ex.srcs/sources_1/new/tb_top.v` (testbench)
- `tb_x_gth_logic` — `gt_ex.srcs/sources_1/new/tb_x_gth_logic.v` (testbench)
- `top` — `gt_ex.srcs/sources_1/new/top.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `word_align` — `gt_ex.srcs/sources_1/new/word_align.v` (alternatif atau pemakaian lain perlu ditelusuri)
- `xgmii_packet_gen` — `gt_ex.srcs/sources_1/new/xgmii_packet_gen.v` (alternatif atau pemakaian lain perlu ditelusuri)

## Source/XCI/XDC/MEM/TCL di luar daftar langsung XPR

- `File import/Decoder/Assembler/assembler.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/Assembler/assembler_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/Assembler/serdes_assembler.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/Assembler/tb_mux_eth_32.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/CDC/cross_gth_logic.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/CDC/cross_logic_gth_head.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/CDC/cross_logic_gth_load.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/CDC/rx_gth_logic.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/CDC/rx_logic_gth.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/core_rx.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/demux_preamble_128.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/demux_preamble_hotswap.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/lpc_dec.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/lpc_dec_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/mux_eth_32.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/preamble_sda_dec.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/rs_decoder_64.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/separator.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/tb_demux_decoder.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/FEC Decoder/tb_demux_preamble_hotswap.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/XGMII/eth_mac_packing_tx.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/XGMII/eth_preamble_gen.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/XGMII/eth_tx_back_end_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/XGMII/tb_eth_tx_back_end_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/XGMII/xgmii_tx_formatter.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Decoder/decoder_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/CDC/x_gth_logic.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/CDC/x_logic_gth.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/combiner.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/core_tx.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/lpc.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/lpc_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/multiplier.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/rs_encoder.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/rs_encoder_64.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/FEC/scrambler.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/Framer/crc_16.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/Framer/crc_32.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/Framer/framer.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/Framer/framer_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/eth_mac_segmenter.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/eth_preamble_remover.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/eth_rx_front_end_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/preamble_gen.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/tb_eth_rx_front_end_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/tb_eth_rx_hello_world.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/xgmii_packet_gen.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/XGMII/xgmii_rx_parser.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/cross_gth_logic_head.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/cross_gth_logic_load.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/cross_logic_gth.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/delay_combiner.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/encoder_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/mux_gearbox_128.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/serdes_framer.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/Encoder/tb_mux_gearbox.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/memory/alpha_value.mem` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/memory/decimal_value.mem` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/memory/error.mem` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/memory/sample.mem` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/autorun.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/clk_wiz_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/error_inject.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/error_inject_hotswap.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/eth_10g_pcs_pma_rx_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/fso_gth_bridge_hotswap.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/gt.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/gt_vio_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/gth_fso_64b66b.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/packet_rec.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/packet_send.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/stream_input.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/tb_fso_gth_bridge_hotswap.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/tb_top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/old file/word_align.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/reset_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/bram_rs.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/chien_search.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/euclid_proc.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/forney_math.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/inverter.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/multiplier.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/rs_decoder.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/rs_encoder.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/rs_codec/syndrome_unit.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `File import/top.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `allow_unconstrained_pins.tcl` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `gt_ex.cache/ip/2025.2/0/c/0c36f152d6b8a0d7/0c36f152d6b8a0d7.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/c/0c36f152d6b8a0d7/cross_logic_gth_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/c/0c36f152d6b8a0d7/cross_logic_gth_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/c/0c36f152d6b8a0d7/cross_logic_gth_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/c/0c36f152d6b8a0d7/cross_logic_gth_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/e/0eff4f9d6290cd9c/0eff4f9d6290cd9c.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/e/0eff4f9d6290cd9c/bram_rs_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/e/0eff4f9d6290cd9c/bram_rs_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/e/0eff4f9d6290cd9c/bram_rs_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/0/e/0eff4f9d6290cd9c/bram_rs_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/0/20cbc1d7bda8d315/20cbc1d7bda8d315.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/0/20cbc1d7bda8d315/cross_logic_gth_head_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/0/20cbc1d7bda8d315/cross_logic_gth_head_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/0/20cbc1d7bda8d315/cross_logic_gth_head_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/0/20cbc1d7bda8d315/cross_logic_gth_head_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/b/2bebd3a93db824c0/2bebd3a93db824c0.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/b/2bebd3a93db824c0/cross_gth_logic_head_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/b/2bebd3a93db824c0/cross_gth_logic_head_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/b/2bebd3a93db824c0/cross_gth_logic_head_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/2/b/2bebd3a93db824c0/cross_gth_logic_head_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/3/33830fb6c70ba9a5/33830fb6c70ba9a5.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/3/33830fb6c70ba9a5/cross_logic_gth_load_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/3/33830fb6c70ba9a5/cross_logic_gth_load_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/3/33830fb6c70ba9a5/cross_logic_gth_load_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/3/33830fb6c70ba9a5/cross_logic_gth_load_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/b/3b9d7feb0e11d5f8/3b9d7feb0e11d5f8.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/b/3b9d7feb0e11d5f8/eth_10g_pcs_pma_rx_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/b/3b9d7feb0e11d5f8/eth_10g_pcs_pma_rx_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/b/3b9d7feb0e11d5f8/eth_10g_pcs_pma_rx_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/3/b/3b9d7feb0e11d5f8/eth_10g_pcs_pma_rx_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/a/4ae1b6ba2265d9d0/4ae1b6ba2265d9d0.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/a/4ae1b6ba2265d9d0/serdes_assembler_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/a/4ae1b6ba2265d9d0/serdes_assembler_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/a/4ae1b6ba2265d9d0/serdes_assembler_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/a/4ae1b6ba2265d9d0/serdes_assembler_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/f/4f7fc561b936c981/4f7fc561b936c981.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/f/4f7fc561b936c981/reset_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/f/4f7fc561b936c981/reset_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/f/4f7fc561b936c981/reset_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/4/f/4f7fc561b936c981/reset_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/2/625a078b083f244b/625a078b083f244b.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/2/625a078b083f244b/cross_logic_gth_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/2/625a078b083f244b/cross_logic_gth_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/2/625a078b083f244b/cross_logic_gth_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/2/625a078b083f244b/cross_logic_gth_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/c/6cbf73aa89917879/6cbf73aa89917879.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/c/6cbf73aa89917879/u_ila_2_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/c/6cbf73aa89917879/u_ila_2_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/c/6cbf73aa89917879/u_ila_2_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/6/c/6cbf73aa89917879/u_ila_2_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/7/b/7b011055551d8216/7b011055551d8216.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/7/b/7b011055551d8216/gt_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/7/b/7b011055551d8216/gt_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/7/b/7b011055551d8216/gt_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/7/b/7b011055551d8216/gt_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/5/958e9643515af347/958e9643515af347.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/5/958e9643515af347/u_ila_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/5/958e9643515af347/u_ila_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/5/958e9643515af347/u_ila_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/5/958e9643515af347/u_ila_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/b/9b9f3cd600ab249e/9b9f3cd600ab249e.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/b/9b9f3cd600ab249e/dbg_hub_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/b/9b9f3cd600ab249e/dbg_hub_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/b/9b9f3cd600ab249e/dbg_hub_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/9/b/9b9f3cd600ab249e/dbg_hub_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/1/a16c2eafff04cde2/a16c2eafff04cde2.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/1/a16c2eafff04cde2/u_ila_1_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/1/a16c2eafff04cde2/u_ila_1_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/1/a16c2eafff04cde2/u_ila_1_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/1/a16c2eafff04cde2/u_ila_1_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/e/aef436e6938d4b19/aef436e6938d4b19.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/e/aef436e6938d4b19/delay_combiner_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/e/aef436e6938d4b19/delay_combiner_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/e/aef436e6938d4b19/delay_combiner_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/a/e/aef436e6938d4b19/delay_combiner_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/2/b2c27d66709886a0/b2c27d66709886a0.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/2/b2c27d66709886a0/cross_gth_logic_load_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/2/b2c27d66709886a0/cross_gth_logic_load_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/2/b2c27d66709886a0/cross_gth_logic_load_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/2/b2c27d66709886a0/cross_gth_logic_load_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/3/b35bf500b6ca6c94/b35bf500b6ca6c94.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/3/b35bf500b6ca6c94/gth_fso_64b66b_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/3/b35bf500b6ca6c94/gth_fso_64b66b_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/3/b35bf500b6ca6c94/gth_fso_64b66b_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/b/3/b35bf500b6ca6c94/gth_fso_64b66b_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/3/c39397fb7739559d/c39397fb7739559d.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/3/c39397fb7739559d/gt_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/3/c39397fb7739559d/gt_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/3/c39397fb7739559d/gt_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/3/c39397fb7739559d/gt_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/9/c933dad9a6b81285/c933dad9a6b81285.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/9/c933dad9a6b81285/serdes_framer_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/9/c933dad9a6b81285/serdes_framer_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/9/c933dad9a6b81285/serdes_framer_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/9/c933dad9a6b81285/serdes_framer_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/f/cf7307742a5e8fe1/cf7307742a5e8fe1.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/f/cf7307742a5e8fe1/gt_vio_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/f/cf7307742a5e8fe1/gt_vio_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/f/cf7307742a5e8fe1/gt_vio_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/c/f/cf7307742a5e8fe1/gt_vio_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/4/e46543a1f4cb4a37/delay_rs_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/4/e46543a1f4cb4a37/delay_rs_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/4/e46543a1f4cb4a37/delay_rs_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/4/e46543a1f4cb4a37/delay_rs_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/4/e46543a1f4cb4a37/e46543a1f4cb4a37.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/7/e7caec05abe25e2c/clk_wiz_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/7/e7caec05abe25e2c/clk_wiz_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/7/e7caec05abe25e2c/clk_wiz_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/7/e7caec05abe25e2c/clk_wiz_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/e/7/e7caec05abe25e2c/e7caec05abe25e2c.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/7/f70f656fdf3c1507/eth_10g_pcs_pma_tx_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/7/f70f656fdf3c1507/eth_10g_pcs_pma_tx_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/7/f70f656fdf3c1507/eth_10g_pcs_pma_tx_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/7/f70f656fdf3c1507/eth_10g_pcs_pma_tx_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/7/f70f656fdf3c1507/f70f656fdf3c1507.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/8/f8ee2f2745debbbf/cross_gth_logic_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/8/f8ee2f2745debbbf/cross_gth_logic_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/8/f8ee2f2745debbbf/cross_gth_logic_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/8/f8ee2f2745debbbf/cross_gth_logic_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.cache/ip/2025.2/f/8/f8ee2f2745debbbf/f8ee2f2745debbbf.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/bram_rs_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/misc/blk_mem_gen_v8_4.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/sim/bram_rs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/simulation/blk_mem_gen_v8_4.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/bram_rs/synth/bram_rs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_7s_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_7s_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_us_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_us_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_us_plus_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/clk_wiz_0/mmcm_pll_drp_func_us_plus_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/elaborate/configure_gt.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/eth_10g_pcs_pma_rx_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/eth_10g_pcs_pma_rx_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/eth_10g_pcs_pma_rx_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/eth_10g_pcs_pma_rx_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/eth_10g_pcs_pma_rx_0_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/hdl/ten_gig_eth_pcs_pma_v6_0_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/eth_10g_pcs_pma_rx_0_gt.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_bit_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_reset_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/sim/eth_10g_pcs_pma_rx_0_gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/sim/eth_10g_pcs_pma_rx_0_gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/sim/eth_10g_pcs_pma_rx_0_gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/sim/eth_10g_pcs_pma_rx_0_gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/eth_10g_pcs_pma_rx_0_gt_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/ip_0/synth/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_block_32.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_cable_pull_logic.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_ff_synchronizer.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_ff_synchronizer_rst.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_gt_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_gt_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_local_clock_and_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_shared_clock_and_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_sim_speedup_controller.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/eth_10g_pcs_pma_rx_0_support.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_rx_0/synth/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/elaborate/configure_gt.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/eth_10g_pcs_pma_tx_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/eth_10g_pcs_pma_tx_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/eth_10g_pcs_pma_tx_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/eth_10g_pcs_pma_tx_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/eth_10g_pcs_pma_tx_0_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/hdl/ten_gig_eth_pcs_pma_v6_0_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/eth_10g_pcs_pma_tx_0_gt.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_bit_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/hdl/gtwizard_ultrascale_v1_7_reset_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/sim/eth_10g_pcs_pma_tx_0_gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/sim/eth_10g_pcs_pma_tx_0_gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/sim/eth_10g_pcs_pma_tx_0_gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/sim/eth_10g_pcs_pma_tx_0_gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/eth_10g_pcs_pma_tx_0_gt_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/ip_0/synth/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_block_32.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_cable_pull_logic.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_ff_synchronizer.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_ff_synchronizer_rst.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_gt_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_gt_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_local_clock_and_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_shared_clock_and_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_sim_speedup_controller.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/eth_10g_pcs_pma_tx_0_support.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_tx_0/synth/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/gt_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/gt_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/gt_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/gt_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/gt_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_bit_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/hdl/gtwizard_ultrascale_v1_7_reset_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gt_gthe3_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/sim/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt_gthe3_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gt_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt/synth/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/gt_vio_0_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/ltlib_v1_0_vl_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/verilog/ltlib_v1_0_3_lib_fn.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/verilog/ltlib_v1_0_3_ver.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/verilog/xsdbs_v1_0_5_i2x.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/verilog/xsdbs_v1_0_5_in.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/vio_v3_0_27_vio_include.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/vio_v3_0_syn_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/hdl/xsdbs_v1_0_vl_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/sim/gt_vio_0.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gt_vio_0/synth/gt_vio_0.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/gth_fso_64b66b_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/gth_fso_64b66b_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/gth_fso_64b66b_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/gth_fso_64b66b_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/gth_fso_64b66b_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_bit_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/hdl/gtwizard_ultrascale_v1_7_reset_sync.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b_gthe3_channel_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b_gthe3_common_wrapper.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b_gtwizard_gthe3.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b_gtwizard_top.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gth_fso_64b66b_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gtwizard_ultrascale_v1_7_gthe3_channel.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/gth_fso_64b66b/synth/gtwizard_ultrascale_v1_7_gthe3_common.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/hdl/proc_sys_reset_v5_0_vh_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_board.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/reset_0_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/sim/reset_0.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.gen/sources_1/ip/reset_0/synth/reset_0.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_7s_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_7s_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_us_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_us_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_us_plus_mmcm.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/ipstatic/mmcm_pll_drp_func_us_plus_pll.vh` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/mem_init_files/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/mem_init_files/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/mem_init_files/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/mem_init_files/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/modelsim/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/modelsim/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/modelsim/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/modelsim/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/modelsim/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/questa/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/questa/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/questa/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/questa/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/questa/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/riviera/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/riviera/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/riviera/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/riviera/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/riviera/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/vcs/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/vcs/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/vcs/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/vcs/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/vcs/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xcelium/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xcelium/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xcelium/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xcelium/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xcelium/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/cmd.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.ip_user_files/sim_scripts/xsim/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/SDAOISL10Gto10G_top.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/1/91e57dbd3046398a/91e57dbd3046398a.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/1/91e57dbd3046398a/u_ila_1_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/1/91e57dbd3046398a/u_ila_1_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/1/91e57dbd3046398a/u_ila_1_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/1/91e57dbd3046398a/u_ila_1_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/b/9b5d77d2b69b874c/9b5d77d2b69b874c.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/b/9b5d77d2b69b874c/dbg_hub_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/b/9b5d77d2b69b874c/dbg_hub_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/b/9b5d77d2b69b874c/dbg_hub_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/9/b/9b5d77d2b69b874c/dbg_hub_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/d/0/d08862b88f28f858/d08862b88f28f858.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/d/0/d08862b88f28f858/u_ila_2_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/d/0/d08862b88f28f858/u_ila_2_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/d/0/d08862b88f28f858/u_ila_2_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/d/0/d08862b88f28f858/u_ila_2_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/e/2/e29d5a19256ce3c1/e29d5a19256ce3c1.xci` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/e/2/e29d5a19256ce3c1/u_ila_0_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/e/2/e29d5a19256ce3c1/u_ila_0_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/e/2/e29d5a19256ce3c1/u_ila_0_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/impl_1/{/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex/gt_ex.cache/ip}/2025.2/e/2/e29d5a19256ce3c1/u_ila_0_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/synth_1/.Xil/SDAOISL10Gto10G_top_propImpl.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/synth_1/SDAOISL10Gto10G_top.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.runs/synth_1/dont_touch.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/alpha_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/decimal_value.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/error.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/glbl.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/sample.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/tb_cdc3_rx_gth_logic.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/tb_demux_decoder.tcl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/xsim.dir/tb_cdc3_rx_gth_logic_behav/xsim.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.sim/sim_1/behav/xsim/xsim.dir/tb_demux_decoder_behav/xsim.mem` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `gt_ex.srcs/setup_all_25_waveforms.tcl` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `gt_ex.srcs/sim_1/new/setup_all_25_waveforms.tcl` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `gt_ex.srcs/sources_1/new/FEC_separator.v` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `imports/gt_example_top.xdc` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/sim/cross_gth_logic.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic/synth/cross_gth_logic.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/sim/cross_gth_logic_head.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_head/synth/cross_gth_logic_head.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/sim/cross_gth_logic_load.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_gth_logic_load/synth/cross_gth_logic_load.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/sim/cross_logic_gth.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth/synth/cross_logic_gth.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/sim/cross_logic_gth_head.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_head/synth/cross_logic_gth_head.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_clocks.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/sim/cross_logic_gth_load.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/cross_logic_gth_load/synth/cross_logic_gth_load.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/delay_combiner_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/sim/delay_combiner.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/delay_combiner/synth/delay_combiner.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/serdes_assembler_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/sim/serdes_assembler.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_assembler/synth/serdes_assembler.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/hdl/fifo_generator_v13_2_rfs.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/hdl/fifo_generator_v13_2_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/hdl/fifo_generator_v13_2_vhsyn_rfs.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_ooc.xdc` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_sim_netlist.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_sim_netlist.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_stub.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_stub.vhdl` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/serdes_framer_sv.sv` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/sim/serdes_framer.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/simulation/fifo_generator_vlog_beh.v` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `sda_codec_0.gen/sources_1/ip/serdes_framer/synth/serdes_framer.vhd` — produk generated/cache/simulation; ketergantungan transitif mungkin
- `setup_all_25_waveforms.tcl` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/bram_rs.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/clk_wiz_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_gth_logic.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_gth_logic_head.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_gth_logic_load.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_logic_gth.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_logic_gth_head.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/cross_logic_gth_load.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/delay_combiner.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/eth_10g_pcs_pma_rx_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/gt.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/gt_vio_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/gth_fso_64b66b.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/reset_0.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/serdes_assembler.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
- `xci file/serdes_framer.xci` — tidak terdaftar langsung; alternatif/salinan/pemakaian belum diketahui
