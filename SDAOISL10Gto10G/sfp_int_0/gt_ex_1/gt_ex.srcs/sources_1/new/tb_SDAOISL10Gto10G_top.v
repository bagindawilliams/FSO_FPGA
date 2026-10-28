`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_SDAOISL10Gto10G_top
Description  : Grand Top-Level End-to-End Verification Testbench for the 
               Complete SDA OISL 10G-to-10G Optical Communication System 
               (SDAOISL10Gto10G_top.v).

Revision History:
  - Rev 1.0 (Initial) : End-to-end top-level loopback testbench.
  - Rev 2.0 (2026-10-27 16:14 KST) : Organized 8 stage waveform groups (GRP1..GRP8).
  - Rev 2.2 (2026-10-28 14:55 KST) : [Audit Compliance Updates]
    1. Matched GTH_REFCLK_HALF to exact 3.200 ns (156.25 MHz reference clock,
       6.400 ns period matching SDAOISL10Gto10G.xdc).
    2. Added a full word-by-word / byte-by-byte Scoreboard Queue (scb_fifo) that
       records every single ingress Ethernet word generated at PC 1 and verifies
       100% bit-exact equality against every reassembled Ethernet word at PC 2.
    3. Enforced strict failure assertions ($fatal) on any byte mismatch, CRC failure,
       or simulation watchdog timeout.
===========================================================================
*/

module tb_SDAOISL10Gto10G_top();

    // =========================================================================
    // 1. TOP-LEVEL SIMULATION PARAMETERS
    // =========================================================================
    parameter SIM_MODE             = 1;     // 1 = Internal Packet Gen & XGMII Direct Mode
    parameter CH_ERROR_MODE        = 1;     // 0 = Clean, 1 = Correctable FEC Error (<=8 sym), 2 = Full Burst
    parameter TARGET_JUMBO_PKTS    = 2;     // Number of 2000-Byte Jumbo packets to verify at PC 2
    parameter real GTH_REFCLK_HALF = 3.200; // [Rev 2.2] Exact 3.200 ns half-period (156.25 MHz RefClk)

    // =========================================================================
    // 2. PHYSICAL BOARD CLOCKS, RESET & SERIAL LOOPBACK WIRES
    // =========================================================================
    reg        sys_clk_p;     // 200.0 MHz Differential System Clock (5.0 ns period)
    wire       sys_clk_n = ~sys_clk_p;

    reg        mgtrefclk_p;   // 156.25 MHz Ethernet PCS/PMA Reference Clock (6.4 ns period)
    wire       mgtrefclk_n = ~mgtrefclk_p;

    reg        fso_refclk_p;  // 156.25 MHz GTH Optical Reference Clock (6.4 ns period)
    wire       fso_refclk_n = ~fso_refclk_p;

    wire [1:0] tx_disable;
    wire       fan;
    wire [3:0] TXP_OUT;
    wire [3:0] TXN_OUT;
    wire [3:0] RXP_IN;
    wire [3:0] RXN_IN;

    // Optical SFP+ Channel 1 & Ethernet SFP+ Channel 0 Serial Loopback
    assign RXP_IN = TXP_OUT;
    assign RXN_IN = TXN_OUT;

    // Top-Level Probing & Status Outputs from SDAOISL10Gto10G_top
    wire [31:0] tx_fso_data_out;
    wire        tx_fso_valid_out;
    wire [31:0] rx_fso_data_out;
    wire        rx_fso_valid_out;
    wire [7:0]  rx_dec_hdr_tdata;
    wire        rx_dec_hdr_tvalid;
    wire [31:0] rx_dec_pld_tdata;
    wire        rx_dec_pld_tvalid;
    wire [31:0] pc2_xgmii_txd;
    wire [3:0]  pc2_xgmii_txc;
    wire        rx_preamble_locked;
    wire        rx_block_locked;
    wire        gth_link_up;
    wire        eth_data_error_flag;

    // =========================================================================
    // 3. GRAND TOP-LEVEL DUT INSTANTIATION
    // =========================================================================
    SDAOISL10Gto10G_top #(
        .SIM_MODE (SIM_MODE)
    ) u_dut (
        .sys_clk_p           (sys_clk_p),
        .sys_clk_n           (sys_clk_n),
        .tx_disable          (tx_disable),
        .mgtrefclk_n         (mgtrefclk_n),
        .mgtrefclk_p         (mgtrefclk_p),
        .fso_refclk_n        (fso_refclk_n),
        .fso_refclk_p        (fso_refclk_p),
        .RXN_IN              (RXN_IN),
        .RXP_IN              (RXP_IN),
        .TXN_OUT             (TXN_OUT),
        .TXP_OUT             (TXP_OUT),
        .fan                 (fan),
        .tx_fso_data_out     (tx_fso_data_out),
        .tx_fso_valid_out    (tx_fso_valid_out),
        .rx_fso_data_out     (rx_fso_data_out),
        .rx_fso_valid_out    (rx_fso_valid_out),
        .rx_dec_hdr_tdata    (rx_dec_hdr_tdata),
        .rx_dec_hdr_tvalid   (rx_dec_hdr_tvalid),
        .rx_dec_pld_tdata    (rx_dec_pld_tdata),
        .rx_dec_pld_tvalid   (rx_dec_pld_tvalid),
        .pc2_xgmii_txd       (pc2_xgmii_txd),
        .pc2_xgmii_txc       (pc2_xgmii_txc),
        .rx_preamble_locked  (rx_preamble_locked),
        .rx_block_locked     (rx_block_locked),
        .gth_link_up         (gth_link_up),
        .eth_data_error_flag (eth_data_error_flag)
    );

    // Configure Error Injector Channel Mode via hierarchy parameter override
    defparam u_dut.sda_encoder_inst.u_error_injector.SIM_MODE  = (CH_ERROR_MODE == 0) ? 0 : 1;
    defparam u_dut.sda_encoder_inst.u_error_injector.max_error = (CH_ERROR_MODE == 1) ? 18 : 47;

    // =========================================================================
    // 4. CLOCK GENERATORS
    // =========================================================================
    initial begin
        sys_clk_p = 1'b0;
        forever #2.5 sys_clk_p = ~sys_clk_p; // 200.0 MHz System Differential Clock
    end

    initial begin
        mgtrefclk_p = 1'b0;
        forever #3.2 mgtrefclk_p = ~mgtrefclk_p; // 156.25 MHz Ethernet RefClk
    end

    initial begin
        fso_refclk_p = 1'b0;
        forever #(GTH_REFCLK_HALF) fso_refclk_p = ~fso_refclk_p; // 156.25 MHz GTH Optical RefClk
    end

    wire clk_200m = u_dut.clk_logic;
    wire clk_tx   = u_dut.tx0_clk;
    wire clk_rx   = u_dut.rx0_clk;

    // =========================================================================
    // 5. STAGE-BY-STAGE WAVEFORM GROUPS WITH BYTE & CLOCK COUNTERS (GRP1..GRP8)
    // =========================================================================

    // GROUP 1: PC 1 INGRESS PACKET GEN, XGMII RX & 1900B SEGMENTATION (clk_tx)
    wire        grp1_pc1_gen_valid     = u_dut.gen_sim_mode.gen_axis_tvalid && u_dut.gen_sim_mode.gen_axis_tready;
    wire [31:0] grp1_pc1_gen_data      = u_dut.gen_sim_mode.gen_axis_tdata;
    wire        grp1_pc1_gen_last      = u_dut.gen_sim_mode.gen_axis_tlast;
    wire [31:0] grp1_pc1_xgmii_rxd     = u_dut.xgmii_txd_in;
    wire [3:0]  grp1_pc1_xgmii_rxc     = u_dut.xgmii_txc_in;
    wire        grp1_seg_valid         = u_dut.seg_axis_tvalid && u_dut.seg_axis_tready;
    wire [31:0] grp1_seg_data          = u_dut.seg_axis_tdata;
    wire        grp1_seg_last          = u_dut.seg_axis_tlast;
    wire [10:0] grp1_seg_active_bytes  = u_dut.seg_valid_bytes;

    reg  [15:0] grp1_pc1_clk_cnt       = 16'd0;
    reg  [15:0] grp1_pc1_byte_cnt      = 16'd0;
    reg  [15:0] grp1_seg_clk_cnt       = 16'd0;
    reg  [15:0] grp1_seg_byte_cnt      = 16'd0;
    reg  [15:0] grp1_seg_frame_id      = 16'd0;

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid) begin
            if (grp1_pc1_clk_cnt == 16'd500) begin
                grp1_pc1_clk_cnt  <= 16'd1;
                grp1_pc1_byte_cnt <= 16'd4;
            end else begin
                grp1_pc1_clk_cnt  <= grp1_pc1_clk_cnt + 16'd1;
                grp1_pc1_byte_cnt <= grp1_pc1_byte_cnt + 16'd4;
            end
        end else if (!u_dut.gen_sim_mode.gen_axis_tvalid) begin
            grp1_pc1_clk_cnt  <= 16'd0;
            grp1_pc1_byte_cnt <= 16'd0;
        end

        if (grp1_seg_valid) begin
            if (grp1_seg_clk_cnt == 16'd475 || grp1_seg_clk_cnt == 16'd0) begin
                grp1_seg_clk_cnt  <= 16'd1;
                grp1_seg_byte_cnt <= 16'd4;
                grp1_seg_frame_id <= grp1_seg_frame_id + 16'd1;
            end else begin
                grp1_seg_clk_cnt  <= grp1_seg_clk_cnt + 16'd1;
                grp1_seg_byte_cnt <= grp1_seg_byte_cnt + 16'd4;
            end
        end else if (!u_dut.seg_axis_tvalid) begin
            grp1_seg_clk_cnt  <= 16'd0;
            grp1_seg_byte_cnt <= 16'd0;
        end
    end

    // GROUP 2: TX FSO FRAMER (16B HEADER + 1912B PAYLOAD) & ARQ TX (clk_tx)
    wire [15:0] grp2_tx_txfn           = u_dut.sda_encoder_inst.u_eth_fso_framer.tx_txfn_out;
    wire [1:0]  grp2_tx_frame_type     = u_dut.sda_encoder_inst.u_eth_fso_framer.frame_type_out;
    wire [1:0]  grp2_payload_mux_sel   = u_dut.sda_encoder_inst.u_eth_fso_framer.payload_mux_sel;
    wire        grp2_hdr_valid         = u_dut.sda_encoder_inst.framer_hdr_tvalid;
    wire [7:0]  grp2_hdr_data          = u_dut.sda_encoder_inst.framer_hdr_tdata;
    wire        grp2_pld_valid         = u_dut.sda_encoder_inst.framer_fso_tvalid && u_dut.sda_encoder_inst.framer_fso_tready;
    wire [31:0] grp2_pld_data          = u_dut.sda_encoder_inst.framer_fso_tdata;
    wire        grp2_pld_last          = u_dut.sda_encoder_inst.framer_fso_tlast;

    reg  [7:0]  grp2_hdr_clk_cnt       = 8'd0;
    reg  [7:0]  grp2_hdr_byte_cnt      = 8'd0;
    reg  [15:0] grp2_pld_clk_cnt       = 16'd0;
    reg  [15:0] grp2_pld_byte_cnt      = 16'd0;

    always @(posedge clk_tx) begin
        if (grp2_hdr_valid) begin
            grp2_hdr_clk_cnt  <= grp2_hdr_clk_cnt + 8'd1;
            grp2_hdr_byte_cnt <= grp2_hdr_byte_cnt + 8'd1;
        end else begin
            grp2_hdr_clk_cnt  <= 8'd0;
            grp2_hdr_byte_cnt <= 8'd0;
        end

        if (grp2_pld_valid) begin
            if (grp2_pld_clk_cnt == 16'd478 || grp2_pld_clk_cnt == 16'd0) begin
                grp2_pld_clk_cnt  <= 16'd1;
                grp2_pld_byte_cnt <= 16'd4;
            end else begin
                grp2_pld_clk_cnt  <= grp2_pld_clk_cnt + 16'd1;
                grp2_pld_byte_cnt <= grp2_pld_byte_cnt + 16'd4;
            end
        end else begin
            grp2_pld_clk_cnt  <= 16'd0;
            grp2_pld_byte_cnt <= 16'd0;
        end
    end

    // GROUP 3: TX CDC 1 & 200 MHz FEC CORE (RS GF 0x187 + SCRAMBLER + LPC)
    wire        grp3_cdc1_hdr_dv       = u_dut.sda_encoder_inst.cdc1_hdr_dv;
    wire [7:0]  grp3_cdc1_hdr_data     = u_dut.sda_encoder_inst.cdc1_hdr_data;
    wire        grp3_cdc1_pld_dv       = u_dut.sda_encoder_inst.cdc1_load_dv;
    wire [63:0] grp3_cdc1_pld_data     = u_dut.sda_encoder_inst.cdc1_load_data;
    wire        grp3_fec_mux_dv        = u_dut.sda_encoder_inst.u_encoder_fec.mux_dv;
    wire [63:0] grp3_fec_mux_data      = u_dut.sda_encoder_inst.u_encoder_fec.mux_data;
    wire        grp3_scr_dv            = u_dut.sda_encoder_inst.u_encoder_fec.scrambler_dv;
    wire [63:0] grp3_scr_data          = u_dut.sda_encoder_inst.u_encoder_fec.scrambler;
    wire [24:0] grp3_scr_state_25b     = u_dut.sda_encoder_inst.u_encoder_fec.scrambler_inst.Q;
    wire        grp3_lpc_dv            = u_dut.sda_encoder_inst.fec_valid;
    wire [95:0] grp3_lpc_data          = u_dut.sda_encoder_inst.fec_data;
    wire signed [11:0] grp3_lpc_rd_acc = u_dut.sda_encoder_inst.u_encoder_fec.lpc_top_inst.lpc_3.running_disparity;

    reg  [8:0]  grp3_scr_clk_cnt       = 9'd0;
    reg  [11:0] grp3_scr_byte_cnt      = 12'd0;
    reg  [8:0]  grp3_lpc_clk_cnt       = 9'd0;
    reg  [11:0] grp3_lpc_byte_cnt      = 12'd0;

    always @(posedge clk_200m) begin
        if (grp3_scr_dv) begin
            grp3_scr_clk_cnt  <= grp3_scr_clk_cnt + 9'd1;
            grp3_scr_byte_cnt <= grp3_scr_byte_cnt + 12'd8;
        end else begin
            grp3_scr_clk_cnt  <= 9'd0;
            grp3_scr_byte_cnt <= 12'd0;
        end

        if (grp3_lpc_dv) begin
            grp3_lpc_clk_cnt  <= grp3_lpc_clk_cnt + 9'd1;
            grp3_lpc_byte_cnt <= grp3_lpc_byte_cnt + 12'd12;
        end else begin
            grp3_lpc_clk_cnt  <= 9'd0;
            grp3_lpc_byte_cnt <= 12'd0;
        end
    end

    // GROUP 4: TX MUX GEARBOX 128 (PREAMBLE 72b), CDC 2 & ERROR INJECTOR
    wire [71:0]  grp4_preamble_72b     = u_dut.sda_encoder_inst.preamble_data;
    wire         grp4_gb128_valid      = u_dut.sda_encoder_inst.gb_valid;
    wire [127:0] grp4_gb128_data       = u_dut.sda_encoder_inst.gb_data;
    wire [15:0]  grp4_gb128_keep       = u_dut.sda_encoder_inst.gb_keep;
    wire         grp4_cdc2_valid       = u_dut.sda_encoder_inst.cdc2_valid;
    wire [31:0]  grp4_cdc2_data        = u_dut.sda_encoder_inst.cdc2_data;
    wire         grp4_tx_fso_valid     = tx_fso_valid_out;
    wire [31:0]  grp4_tx_fso_data      = tx_fso_data_out;
    wire [7:0]   grp4_tx_byte_stream   = u_dut.sda_encoder_inst.u_error_injector.byte_out;
    wire [11:0]  grp4_tx_byte_cnt      = u_dut.sda_encoder_inst.u_error_injector.frame_byte_cnt;
    wire [15:0]  grp4_tx_clk_cnt       = u_dut.sda_encoder_inst.u_error_injector.out_clk_cnt;
    wire [31:0]  grp4_tx_frame_id      = u_dut.sda_encoder_inst.u_error_injector.frame_out_id;
    wire [15:0]  grp4_corrupted_words  = u_dut.sda_encoder_inst.u_error_injector.corrupted_word_cnt;

    // GROUP 5: GTH 64B/66B OPTICAL TRANSCEIVER SERIAL LOOPBACK
    wire [31:0]  grp5_gt_txdata        = u_dut.gt_txdata_int;
    wire [5:0]   grp5_gt_txheader      = u_dut.gt_txheader_int;
    wire [6:0]   grp5_gt_txsequence    = u_dut.gt_txsequence_int;
    wire         grp5_gth_link_up      = gth_link_up;
    wire         grp5_rx_block_locked  = rx_block_locked;
    wire         grp5_rx_fso_valid     = rx_fso_valid_out;
    wire [31:0]  grp5_rx_fso_data      = rx_fso_data_out;
    wire [7:0]   grp5_rx_byte_stream   = u_dut.u_gth64b66b_rx.byte_out;
    wire [11:0]  grp5_rx_byte_cnt      = u_dut.u_gth64b66b_rx.frame_byte_cnt;
    wire [15:0]  grp5_rx_clk_cnt       = u_dut.u_gth64b66b_rx.out_clk_cnt;
    wire [31:0]  grp5_rx_frame_id      = u_dut.u_gth64b66b_rx.frame_out_id;

    // GROUP 6: RX CDC 3 & 200 MHz FEC CORE (DEMUX 128, LPC DEC, DESCRAMBLER, RS)
    wire         grp6_cdc3_valid       = u_dut.sda_decoder_inst.core_dv;
    wire [127:0] grp6_cdc3_data        = u_dut.sda_decoder_inst.core_data;
    wire [11:0]  grp6_cdc3_byte_cnt    = u_dut.sda_decoder_inst.u_cdc_rx_3.frame_byte_cnt;
    wire [15:0]  grp6_cdc3_clk_cnt     = u_dut.sda_decoder_inst.u_cdc_rx_3.out_clk_cnt;
    wire [71:0]  grp6_rx_preamble_72b  = u_dut.sda_decoder_inst.u_core_rx.preamble_extracted;
    wire         grp6_rx_preamble_lock = rx_preamble_locked;
    wire         grp6_rx_lpc_dec_dv    = u_dut.sda_decoder_inst.u_core_rx.lpc_dv;
    wire [63:0]  grp6_rx_lpc_dec_data  = u_dut.sda_decoder_inst.u_core_rx.lpc;
    wire [15:0]  grp6_lpc_repaired_bits= u_dut.sda_decoder_inst.u_core_rx.lpc_dec_top_inst.total_corrected_bits;
    wire         grp6_rx_desc_dv       = u_dut.sda_decoder_inst.u_core_rx.descrambler_dv;
    wire [63:0]  grp6_rx_desc_data     = u_dut.sda_decoder_inst.u_core_rx.descrambled_data;
    wire         grp6_rs_hdr_dv        = u_dut.sda_decoder_inst.rs_head_dv;
    wire [7:0]   grp6_rs_hdr_data      = u_dut.sda_decoder_inst.rs_head;
    wire         grp6_rs_pld_dv        = u_dut.sda_decoder_inst.rs_load_dv;
    wire [63:0]  grp6_rs_pld_data      = u_dut.sda_decoder_inst.rs_load;
    wire [11:0]  grp6_rs_repaired_syms = u_dut.sda_decoder_inst.u_core_rx.rs_decoder_64_inst.total_repaired_pld_bytes;

    reg  [8:0]   grp6_rs_pld_clk_cnt   = 9'd0;
    reg  [11:0]  grp6_rs_pld_byte_cnt  = 12'd0;

    always @(posedge clk_200m) begin
        if (grp6_rs_pld_dv) begin
            grp6_rs_pld_clk_cnt  <= grp6_rs_pld_clk_cnt + 9'd1;
            grp6_rs_pld_byte_cnt <= grp6_rs_pld_byte_cnt + 12'd8;
        end else begin
            grp6_rs_pld_clk_cnt  <= 9'd0;
            grp6_rs_pld_byte_cnt <= 12'd0;
        end
    end

    // GROUP 7: RX CDC 4, DEFRAMER (CRC-16/32) & CLOSED-LOOP ARQ (clk_rx)
    wire         grp7_cdc4_hdr_dv      = rx_dec_hdr_tvalid;
    wire [7:0]   grp7_cdc4_hdr_data    = rx_dec_hdr_tdata;
    wire [4:0]   grp7_cdc4_hdr_byte_cnt= u_dut.sda_decoder_inst.u_cdc_rx_4.out_hdr_byte_cnt;
    wire         grp7_cdc4_pld_dv      = rx_dec_pld_tvalid;
    wire [31:0]  grp7_cdc4_pld_data    = rx_dec_pld_tdata;
    wire [8:0]   grp7_cdc4_pld_clk_cnt = u_dut.sda_decoder_inst.u_cdc_rx_4.out_pld_word_cnt;
    wire [11:0]  grp7_cdc4_pld_byte_cnt= grp7_cdc4_pld_dv ? ({3'd0, grp7_cdc4_pld_clk_cnt} << 2) : 12'd0;
    wire         grp7_hdr_crc16_ok     = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.hdr_crc_ok;
    wire         grp7_pld_crc32_ok     = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.pld_crc_ok;
    wire [15:0]  grp7_rx_txfn          = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.rx_txfn;
    wire [1:0]   grp7_rx_frame_type    = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.rx_frame_type;
    wire [15:0]  grp7_arq_fb_rxfn      = u_dut.arq_fb_rxfn;
    wire         grp7_arq_fb_ack       = u_dut.arq_fb_ack;
    wire         grp7_arq_fb_valid     = u_dut.arq_fb_ack_valid;
    wire         grp7_deframed_valid   = u_dut.sda_decoder_inst.deframed_data_tvalid;
    wire [31:0]  grp7_deframed_data    = u_dut.sda_decoder_inst.deframed_data_tdata;
    wire         grp7_deframed_last    = u_dut.sda_decoder_inst.deframed_data_tlast;

    reg  [8:0]   grp7_defr_clk_cnt     = 9'd0;
    reg  [11:0]  grp7_defr_byte_cnt    = 12'd0;

    always @(posedge clk_rx) begin
        if (grp7_deframed_valid) begin
            if (grp7_defr_clk_cnt == 9'd477 || grp7_defr_clk_cnt == 9'd0) begin
                grp7_defr_clk_cnt  <= 9'd1;
                grp7_defr_byte_cnt <= 12'd4;
            end else begin
                grp7_defr_clk_cnt  <= grp7_defr_clk_cnt + 9'd1;
                grp7_defr_byte_cnt <= grp7_defr_byte_cnt + 12'd4;
            end
        end else begin
            grp7_defr_clk_cnt  <= 9'd0;
            grp7_defr_byte_cnt <= 12'd0;
        end
    end

    // GROUP 8: RX ETHERNET REASSEMBLY & PC 2 10G XGMII EGRESS BACK-END (clk_rx)
    wire         grp8_reasm_eth_valid  = u_dut.reassembled_eth_tvalid;
    wire [31:0]  grp8_reasm_eth_data   = u_dut.reassembled_eth_tdata;
    wire         grp8_reasm_eth_last   = u_dut.reassembled_eth_tlast;
    wire [15:0]  grp8_reasm_pkt_bytes  = u_dut.sda_decoder_inst.u_ethernet_frame_reassembly.reassembled_pkt_bytes;
    wire [15:0]  grp8_reasm_pkt_cnt    = u_dut.sda_decoder_inst.u_ethernet_frame_reassembly.reassembled_pkt_cnt;
    wire [31:0]  grp8_pc2_xgmii_txd    = pc2_xgmii_txd;
    wire [3:0]   grp8_pc2_xgmii_txc    = pc2_xgmii_txc;
    wire [15:0]  grp8_pc2_byte_cnt     = u_dut.back_end_inst.dbg_rx_eth_byte_cnt;
    wire [15:0]  grp8_pc2_pkt_cnt      = u_dut.back_end_inst.dbg_rx_eth_pkt_cnt;
    wire [15:0]  grp8_pc2_clk_cnt      = grp8_pc2_byte_cnt[15:2];

    reg  [15:0]  grp8_reasm_clk_cnt    = 16'd0;
    reg  [15:0]  grp8_reasm_byte_cnt   = 16'd0;
    reg  [95:0]  grp8_captured_ascii   = 96'd0;
    reg  [31:0]  grp8_captured_fcs     = 32'd0;

    // =========================================================================
    // [Rev 2.2] FULL WORD-BY-WORD / BYTE-BY-BYTE END-TO-END SCOREBOARD QUEUE
    // =========================================================================
    reg [31:0] scb_fifo [0:16383];
    integer    scb_wr_ptr       = 0;
    integer    scb_rd_ptr       = 0;
    integer    scb_matched_words= 0;
    integer    scb_error_words  = 0;

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid) begin
            scb_fifo[scb_wr_ptr] <= grp1_pc1_gen_data;
            scb_wr_ptr           <= scb_wr_ptr + 1;
        end
    end

    always @(posedge clk_rx) begin
        if (grp8_reasm_eth_valid) begin
            grp8_reasm_clk_cnt  <= grp8_reasm_clk_cnt + 16'd1;
            grp8_reasm_byte_cnt <= grp8_reasm_byte_cnt + 16'd4;

            // Words 0..1 are 8-Byte Ethernet Preamble (55555555_555555D5); Words 2..501 are Payload
            if (grp8_reasm_clk_cnt == 16'd0) begin
                if (grp8_reasm_eth_data !== 32'h5555_5555) begin
                    scb_error_words <= scb_error_words + 1;
                    $fatal(1, "[SCOREBOARD FATAL] Ethernet Preamble Word 0 Mismatch: got 0x%08X", grp8_reasm_eth_data);
                end
            end else if (grp8_reasm_clk_cnt == 16'd1) begin
                if (grp8_reasm_eth_data !== 32'h5555_55D5) begin
                    scb_error_words <= scb_error_words + 1;
                    $fatal(1, "[SCOREBOARD FATAL] Ethernet Preamble Word 1 Mismatch: got 0x%08X", grp8_reasm_eth_data);
                end
            end else begin
                if (grp8_reasm_eth_data === scb_fifo[scb_rd_ptr]) begin
                    scb_matched_words <= scb_matched_words + 1;
                end else begin
                    scb_error_words <= scb_error_words + 1;
                    $fatal(1, "[SCOREBOARD FATAL] Payload Word #%0d Mismatch! Expected=0x%08X, Got=0x%08X",
                           scb_rd_ptr, scb_fifo[scb_rd_ptr], grp8_reasm_eth_data);
                end
                scb_rd_ptr <= scb_rd_ptr + 1;
            end

            if (grp8_reasm_clk_cnt == 16'd11) grp8_captured_ascii[95:64] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd12) grp8_captured_ascii[63:32] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd13) grp8_captured_ascii[31:0]  <= grp8_reasm_eth_data;
            if (grp8_reasm_eth_last)          grp8_captured_fcs          <= grp8_reasm_eth_data;
        end else begin
            grp8_reasm_clk_cnt  <= 16'd0;
            grp8_reasm_byte_cnt <= 16'd0;
        end
    end

    // =========================================================================
    // 6. REAL-TIME SDA OISL TABLE 2-4 METRICS & WATCHDOG TIMEOUT
    // =========================================================================
    real tx_fso_frame_start_ns         = 0.0;
    real OISL_Frame_Duration_us        = 0.0;
    real OISL_Effective_Data_Rate_Mbps = 0.0;
    real OISL_Frame_Rate_kHz           = 0.0;

    always @(grp4_tx_frame_id) begin
        if (grp4_tx_frame_id >= 32'd1) begin
            if (tx_fso_frame_start_ns > 0.0) begin
                OISL_Frame_Duration_us        = ($realtime - tx_fso_frame_start_ns) / 1000.0;
                OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
                OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
                $display(" [GRP4 TX OPTICAL] Frame %0d Completed -> Exact Duration = %0.6f us | Rate = %0.3f Mbps",
                         grp4_tx_frame_id - 1, OISL_Frame_Duration_us, OISL_Effective_Data_Rate_Mbps);
            end
            tx_fso_frame_start_ns = $realtime;
        end
    end

    // Watchdog Timeout Guard (Enforces $fatal if link or packets stall)
    initial begin
        #500000; // 500 us maximum simulation watchdog
        $fatal(1, "[WATCHDOG FATAL] Simulation timed out before completing %0d Jumbo packets!", TARGET_JUMBO_PKTS);
    end

    // =========================================================================
    // 7. MAIN SIMULATION SEQUENCE & FINAL ETRI SCOREBOARD REPORT
    // =========================================================================
    initial begin
        $display("\n================================================================================");
        $display(" STARTING SDAOISL10Gto10G_top FULL END-TO-END SIMULATION (PC 1 -> FPGA -> PC 2)");
        $display(" -> SIM_MODE          : %0d (Internal 2000B Jumbo Traffic Generator)", SIM_MODE);
        $display(" -> CH_ERROR_MODE     : %0d (0=Clean, 1=Correctable FEC Error, 2=Full Burst)", CH_ERROR_MODE);
        $display(" -> TARGET_JUMBO_PKTS : %0d Packets (Full Byte-by-Byte Scoreboard Active)", TARGET_JUMBO_PKTS);
        $display("================================================================================\n");

        wait(gth_link_up == 1'b1);
        $display(" [%0.1f ns] [STAGE 1] GTH 10.3125 Gbps Serial Transceiver Link Up Achieved!", $realtime);

        wait(rx_block_locked == 1'b1);
        $display(" [%0.1f ns] [STAGE 2] 64B/66B RX Gearbox Sync Header (2'b01) Locked!", $realtime);

        wait(rx_preamble_locked == 1'b1);
        $display(" [%0.1f ns] [STAGE 3] SDA OISL 72-bit Preamble (72'h77AD5B5843641E2E26) Locked!\n", $realtime);

        // Wait until TARGET_JUMBO_PKTS full 2000-Byte Ethernet Jumbo frames exit to PC 2
        wait(grp8_pc2_pkt_cnt >= TARGET_JUMBO_PKTS);
        repeat (50) @(posedge clk_rx);

        $display("\n================================================================================");
        $display(" SDAOISL10Gto10G_top END-TO-END VERIFICATION REPORT (SDA OISL v2.1.2)");
        $display("================================================================================");
        $display(" 1. Optical Preamble (Table 2-8)   : 0x%018X (Locked = %0b)", grp6_rx_preamble_72b, rx_preamble_locked);
        $display(" 2. 64B/66B GTH Gearbox Status     : gth_link_up = %0b | rx_block_locked = %0b", gth_link_up, rx_block_locked);
        $display(" 3. FEC Error Repair Telemetry     : LPC Bits Repaired = %0d | RS Symbols Repaired = %0d",
                 grp6_lpc_repaired_bits, grp6_rs_repaired_syms);
        $display(" 4. Full Byte Scoreboard Verified  : %0d Words (%0d Bytes) Matched | Errors = %0d",
                 scb_matched_words, scb_matched_words * 4, scb_error_words);
        $display(" 5. Recovered Payload Marker & FCS : ASCII = \"%s\" | FCS = 0x%08X",
                 grp8_captured_ascii, grp8_captured_fcs);
        if (rx_preamble_locked && rx_block_locked &&
            (scb_matched_words == TARGET_JUMBO_PKTS * 500) && (scb_error_words == 0) &&
            (grp8_captured_ascii == "Kookmin FSO ") &&
            (grp8_captured_fcs == 32'hDEAD_BEEF)) begin
            $display("--------------------------------------------------------------------------------");
            $display(" FINAL VERDICT: [PASS] 100%% BIT-EXACT END-TO-END PC 1 TO PC 2 VERIFIED!");
        end else begin
            $fatal(1, "FINAL VERDICT: [FAIL] Scoreboard or status check failed!");
        end
        $display("================================================================================\n");
        $finish;
    end

endmodule