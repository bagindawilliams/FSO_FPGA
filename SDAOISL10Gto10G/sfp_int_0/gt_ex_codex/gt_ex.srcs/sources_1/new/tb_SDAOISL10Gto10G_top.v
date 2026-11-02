`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_SDAOISL10Gto10G_top
Description  : Grand Top-Level End-to-End Verification Testbench for the 
               Complete SDA OISL 10G-to-10G Optical Communication System 
               (SDAOISL10Gto10G_top.v).

               END-TO-END SIGNAL FLOW & 8 WAVEFORM GROUPS (PC 1 -> PC 2):
               - GRP1 : PC 1 Ingress Packet Gen, XGMII RX & 1900B Segmentation
               - GRP2 : TX FSO Framer, Table 2-10 Header (16B) & Table 2-18 Payload (1912B)
               - GRP3 : TX CDC 1 & 200 MHz FEC Core (RS GF 0x187 + 25b Scrambler + LPC)
               - GRP4 : TX MUX Gearbox 128 (Preamble 72'h77AD5B5843641E2E26), CDC 2 & Error Inject
               - GRP5 : GTH 64B/66B Optical Transceiver Serial Loopback (TXP[1] -> RXP[1])
               - GRP6 : RX CDC 3 & 200 MHz FEC Core (Demux 128, LPC Dec, Descrambler, RS Dec)
               - GRP7 : RX CDC 4, Deframer (CRC-16/32 Check) & Closed-Loop Selective Repeat ARQ
               - GRP8 : RX Ethernet Reassembly (Table 2-18) & PC 2 10G XGMII Egress Back-End

Revision History:
  - Rev 1.0 (Initial) : End-to-end top-level loopback testbench.
  - Rev 2.0 (2026-10-27 16:14 KST) : [Full SDA OISL v2.1.2 & ETRI Audit Compliance]
    1. Organized all internal & external signals into 8 structured stage groups 
       (GRP1..GRP8) with dedicated byte counters (*_byte_cnt) and clock cycle 
       counters (*_clk_cnt) at every single pipeline stage.
    2. Added configurable CH_ERROR_MODE (0 = Clean Channel, 1 = Correctable 
       RS/LPC Errors <= 8 symbols, 2 = Full 48-word error.mem burst) to verify 
       both FEC symbol repair and closed-loop ARQ retransmission.
    3. Added automatic self-checking scoreboard verifying Preamble 
       72'h77AD5B5843641E2E26 lock, 2.493600 us frame timing, Table 2-18 
       continuation reassembly, ASCII payload tag ("Kookmin FSO "), and final 
       PC 2 Ethernet FCS (32'hDEADBEEF).
  - Rev 2.2 (2026-10-28 14:55 KST) : [Audit Compliance Updates]
    1. Matched GTH_REFCLK_HALF to exact 3.200 ns (156.25 MHz reference clock,
       6.400 ns period matching SDAOISL10Gto10G.xdc).
    2. Added a full word-by-word / byte-by-byte Scoreboard Queue (scb_fifo) that
       records every single ingress Ethernet word generated at PC 1 and verifies
       100% bit-exact equality against every reassembled Ethernet word at PC 2.
    3. Enforced strict failure assertions ($fatal) on any byte mismatch, CRC failure,
       or simulation watchdog timeout.
  - Rev 2.3 (2026-10-29 01:49 KST) : [Unified 2000B Jumbo (DAT1+DAT2) + IDLE + MGMT 5000km]
    1. Preserved all original descriptions, section headers, and Rev 1.0/2.0/2.2 logs.
    2. Added automatic 1-cycle 'mgmt_trigger_1hz' injection and ASCII frame type 
       indicators (grp2_tx_frame_str & grp7_rx_frame_str: "IDLE", "DAT1", "DAT2", 
       "MGMT") + extracted 64-bit IEEE-754 Range probe (grp7_mgmt_range_meters = 
       64'h4153_12D0_0000_0000) so the Grand Top simulation visibly verifies all 4 
       SDA OISL frame types in a single run.
===========================================================================
*/

// REPORT11-TB01, 2026-11-01T17:02:51.414999+09:00: Optional external acceptance monitor.
// Historical probes and stimulus are retained. The external profile owns final
// completion and watchdog; it checks XGMII bytes, MGMT, ARQ drain and cadence.
// REPORT24-TOP01, 2026-11-02 KST: explicit original-TB basic report profile.
// BASIC_REPORT=1 selects one generator trigger, clean channel and16-frame ARQ
// holdoff. Legacy defaults remain available with BASIC_REPORT=0. Input scoreboard
// counts accepted handshakes; the report profile additionally checks XGMII bytes.
module tb_SDAOISL10Gto10G_top();
    parameter BASIC_REPORT = 0;
    parameter REPORT_EXTERNAL_COMPLETION = 0;

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
        .SIM_MODE (SIM_MODE),
        .ARQ_SIM_SCALE_ENABLE(BASIC_REPORT ? 0 : (SIM_MODE != 0)),
        .ARQ_HOLDOFF_CFG(BASIC_REPORT ? 8'd1 : 8'd255)
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
    defparam u_dut.sda_encoder_inst.u_error_injector.SIM_MODE  = (BASIC_REPORT || CH_ERROR_MODE == 0) ? 0 : 1;
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

    // Internal Domain Clocks Probed for Stage-Accurate Counters
    wire clk_200m = u_dut.clk_logic;
    wire clk_tx   = u_dut.tx0_clk;
    wire clk_rx   = u_dut.rx0_clk;

    // =========================================================================
    // 5. STAGE-BY-STAGE WAVEFORM GROUPS WITH BYTE & CLOCK COUNTERS (GRP1..GRP8)
    // =========================================================================

    // -------------------------------------------------------------------------
    // GROUP 1: PC 1 INGRESS PACKET GEN, XGMII RX & 1900B SEGMENTATION (clk_tx)
    // -------------------------------------------------------------------------
    wire        grp1_pc1_gen_valid     = u_dut.gen_sim_mode.gen_axis_tvalid && u_dut.gen_sim_mode.gen_axis_tready;
    wire [31:0] grp1_pc1_gen_data      = u_dut.gen_sim_mode.gen_axis_tdata;
    wire        grp1_pc1_gen_last      = u_dut.gen_sim_mode.gen_axis_tlast;
    wire [31:0] grp1_pc1_xgmii_rxd     = u_dut.xgmii_txd_in;
    wire [3:0]  grp1_pc1_xgmii_rxc     = u_dut.xgmii_txc_in;
    wire        grp1_seg_valid         = u_dut.seg_axis_tvalid && u_dut.seg_axis_tready;
    wire [31:0] grp1_seg_data          = u_dut.seg_axis_tdata;
    wire        grp1_seg_last          = u_dut.seg_axis_tlast;
    wire [10:0] grp1_seg_active_bytes  = u_dut.seg_valid_bytes;

    reg  [15:0] grp1_pc1_clk_cnt       = 16'd0; // 1..500 Clocks
    reg  [15:0] grp1_pc1_byte_cnt      = 16'd0; // 4..2000 Bytes
    reg  [15:0] grp1_seg_clk_cnt       = 16'd0; // 1..475 Clocks
    reg  [15:0] grp1_seg_byte_cnt      = 16'd0; // 4..1900 Bytes
    reg  [15:0] grp1_seg_frame_id      = 16'd0;

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid && u_dut.gen_sim_mode.gen_axis_tready) begin
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

    // -------------------------------------------------------------------------
    // GROUP 2: TX FSO FRAMER (16B HEADER + 1912B PAYLOAD) & ARQ TX (clk_tx)
    // -------------------------------------------------------------------------
    wire [15:0] grp2_tx_txfn           = u_dut.sda_encoder_inst.u_eth_fso_framer.tx_txfn_out;
    wire [1:0]  grp2_tx_frame_type     = u_dut.sda_encoder_inst.u_eth_fso_framer.frame_type_out;
    wire [1:0]  grp2_payload_mux_sel   = u_dut.sda_encoder_inst.u_eth_fso_framer.payload_mux_sel;
    wire        grp2_hdr_valid         = u_dut.sda_encoder_inst.framer_hdr_tvalid;
    wire [7:0]  grp2_hdr_data          = u_dut.sda_encoder_inst.framer_hdr_tdata;
    wire        grp2_pld_valid         = u_dut.sda_encoder_inst.framer_fso_tvalid && u_dut.sda_encoder_inst.framer_fso_tready;
    wire [31:0] grp2_pld_data          = u_dut.sda_encoder_inst.framer_fso_tdata;
    wire        grp2_pld_last          = u_dut.sda_encoder_inst.framer_fso_tlast;
    wire        grp2_in_cont           = u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.u_fso_payload.in_continuation;

    reg  [31:0] grp2_tx_frame_str;
    always @(*) begin
        case (grp2_tx_frame_type)
            2'b00:   grp2_tx_frame_str = "IDLE";
            2'b01:   grp2_tx_frame_str = grp2_in_cont ? "DAT2" : "DAT1";
            2'b10:   grp2_tx_frame_str = "MGMT";
            default: grp2_tx_frame_str = "RSVD";
        endcase
    end

    reg  [7:0]  grp2_hdr_clk_cnt       = 8'd0;  // 1..16 Clocks
    reg  [7:0]  grp2_hdr_byte_cnt      = 8'd0;  // 1..16 Bytes
    reg  [15:0] grp2_pld_clk_cnt       = 16'd0; // 1..478 Clocks
    reg  [15:0] grp2_pld_byte_cnt      = 16'd0; // 4..1912 Bytes

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

    // -------------------------------------------------------------------------
    // GROUP 3: TX CDC 1 & 200 MHz FEC CORE (RS GF 0x187 + SCRAMBLER + LPC)
    // -------------------------------------------------------------------------
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

    reg  [8:0]  grp3_scr_clk_cnt       = 9'd0;  // 1..259 Clocks
    reg  [11:0] grp3_scr_byte_cnt      = 12'd0; // 8..2072 Bytes
    reg  [8:0]  grp3_lpc_clk_cnt       = 9'd0;  // 1..259 Clocks
    reg  [11:0] grp3_lpc_byte_cnt      = 12'd0; // 12..3108 Bytes

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

    // -------------------------------------------------------------------------
    // GROUP 4: TX MUX GEARBOX 128 (PREAMBLE 72b), CDC 2 & ERROR INJECTOR
    // -------------------------------------------------------------------------
    wire [71:0]  grp4_preamble_72b     = u_dut.sda_encoder_inst.preamble_data;
    wire         grp4_gb128_valid      = u_dut.sda_encoder_inst.gb_valid;
    wire [127:0] grp4_gb128_data       = u_dut.sda_encoder_inst.gb_data;
    wire [15:0]  grp4_gb128_keep       = u_dut.sda_encoder_inst.gb_keep;
    wire         grp4_cdc2_valid       = u_dut.sda_encoder_inst.cdc2_valid;
    wire [31:0]  grp4_cdc2_data        = u_dut.sda_encoder_inst.cdc2_data;
    wire         grp4_tx_fso_valid     = tx_fso_valid_out;
    wire [31:0]  grp4_tx_fso_data      = tx_fso_data_out;
    wire [7:0]   grp4_tx_byte_stream   = u_dut.sda_encoder_inst.u_error_injector.byte_out;
    wire [11:0]  grp4_tx_byte_cnt      = u_dut.sda_encoder_inst.u_error_injector.frame_byte_cnt; // 1..3117 Bytes
    wire [15:0]  grp4_tx_clk_cnt       = u_dut.sda_encoder_inst.u_error_injector.out_clk_cnt;    // 1..780 Clocks
    wire [31:0]  grp4_tx_frame_id      = u_dut.sda_encoder_inst.u_error_injector.frame_out_id;
    wire [15:0]  grp4_corrupted_words  = u_dut.sda_encoder_inst.u_error_injector.corrupted_word_cnt;

    // -------------------------------------------------------------------------
    // GROUP 5: GTH 64B/66B OPTICAL TRANSCEIVER SERIAL LOOPBACK (10.3125 Gbps)
    // -------------------------------------------------------------------------
    wire [31:0]  grp5_gt_txdata        = u_dut.gt_txdata_int;
    wire [5:0]   grp5_gt_txheader      = u_dut.gt_txheader_int;
    wire [6:0]   grp5_gt_txsequence    = u_dut.gt_txsequence_int;
    wire         grp5_gth_link_up      = gth_link_up;
    wire         grp5_rx_block_locked  = rx_block_locked;
    wire         grp5_rx_fso_valid     = rx_fso_valid_out;
    wire [31:0]  grp5_rx_fso_data      = rx_fso_data_out;
    wire [7:0]   grp5_rx_byte_stream   = u_dut.u_gth64b66b_rx.byte_out;
    wire [11:0]  grp5_rx_byte_cnt      = u_dut.u_gth64b66b_rx.frame_byte_cnt; // 1..3117 Bytes
    wire [15:0]  grp5_rx_clk_cnt       = u_dut.u_gth64b66b_rx.out_clk_cnt;    // 1..780 Clocks
    wire [31:0]  grp5_rx_frame_id      = u_dut.u_gth64b66b_rx.frame_out_id;

    // -------------------------------------------------------------------------
    // GROUP 6: RX CDC 3 & 200 MHz FEC CORE (DEMUX 128, LPC DEC, DESCRAMBLER, RS)
    // -------------------------------------------------------------------------
    wire         grp6_cdc3_valid       = u_dut.sda_decoder_inst.core_dv;
    wire [127:0] grp6_cdc3_data        = u_dut.sda_decoder_inst.core_data;
    wire [11:0]  grp6_cdc3_byte_cnt    = u_dut.sda_decoder_inst.u_cdc_rx_3.frame_byte_cnt; // 1..3117 Bytes
    wire [15:0]  grp6_cdc3_clk_cnt     = u_dut.sda_decoder_inst.u_cdc_rx_3.out_clk_cnt;    // 1..499 Clocks
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

    reg  [8:0]   grp6_rs_pld_clk_cnt   = 9'd0;  // 1..239 Clocks
    reg  [11:0]  grp6_rs_pld_byte_cnt  = 12'd0; // 8..1912 Bytes

    always @(posedge clk_200m) begin
        if (grp6_rs_pld_dv) begin
            grp6_rs_pld_clk_cnt  <= grp6_rs_pld_clk_cnt + 9'd1;
            grp6_rs_pld_byte_cnt <= grp6_rs_pld_byte_cnt + 12'd8;
        end else begin
            grp6_rs_pld_clk_cnt  <= 9'd0;
            grp6_rs_pld_byte_cnt <= 12'd0;
        end
    end

    // -------------------------------------------------------------------------
    // GROUP 7: RX CDC 4, DEFRAMER (CRC-16/32), MGMT & CLOSED-LOOP ARQ (clk_rx)
    // -------------------------------------------------------------------------
    wire         grp7_cdc4_hdr_dv      = rx_dec_hdr_tvalid;
    wire [7:0]   grp7_cdc4_hdr_data    = rx_dec_hdr_tdata;
    wire [4:0]   grp7_cdc4_hdr_byte_cnt= u_dut.sda_decoder_inst.u_cdc_rx_4.out_hdr_byte_cnt; // 1..16 Bytes
    wire         grp7_cdc4_pld_dv      = rx_dec_pld_tvalid;
    wire [31:0]  grp7_cdc4_pld_data    = rx_dec_pld_tdata;
    wire [8:0]   grp7_cdc4_pld_clk_cnt = u_dut.sda_decoder_inst.u_cdc_rx_4.out_pld_word_cnt; // 1..478 Clocks
    wire [11:0]  grp7_cdc4_pld_byte_cnt= grp7_cdc4_pld_dv ? ({3'd0, grp7_cdc4_pld_clk_cnt} << 2) : 12'd0; // 4..1912 Bytes
    wire         grp7_hdr_crc16_ok     = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.hdr_crc_ok;
    wire         grp7_pld_crc32_ok     = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.pld_crc_ok;
    wire [15:0]  grp7_rx_txfn          = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.rx_txfn;
    wire [1:0]   grp7_rx_frame_type    = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.rx_frame_type;
    wire [63:0]  grp7_mgmt_range_meters= u_dut.sda_decoder_inst.u_fso_ethernet_deframer.mgmt_range_meters;
    wire         grp7_mgmt_valid       = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.mgmt_telemetry_valid;
    wire [15:0]  grp7_arq_fb_rxfn      = u_dut.arq_fb_rxfn;
    wire         grp7_arq_fb_ack       = u_dut.arq_fb_ack;
    wire         grp7_arq_fb_valid     = u_dut.arq_fb_ack_valid;
    wire         grp7_deframed_valid   = u_dut.sda_decoder_inst.deframed_data_tvalid;
    wire [31:0]  grp7_deframed_data    = u_dut.sda_decoder_inst.deframed_data_tdata;
    wire         grp7_deframed_last    = u_dut.sda_decoder_inst.deframed_data_tlast;

    reg  [31:0]  grp7_rx_frame_str;
    always @(*) begin
        case (grp7_rx_frame_type)
            2'b00:   grp7_rx_frame_str = "IDLE";
            2'b01:   grp7_rx_frame_str = "DATA";
            2'b10:   grp7_rx_frame_str = "MGMT";
            default: grp7_rx_frame_str = "RSVD";
        endcase
    end

    reg  [8:0]   grp7_defr_clk_cnt     = 9'd0;  // 1..477 Clocks
    reg  [11:0]  grp7_defr_byte_cnt    = 12'd0; // 4..1908 Bytes

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

    // -------------------------------------------------------------------------
    // GROUP 8: RX ETHERNET REASSEMBLY & PC 2 10G XGMII EGRESS BACK-END (clk_rx)
    // -------------------------------------------------------------------------
    wire         grp8_reasm_eth_valid  = u_dut.reassembled_eth_tvalid;
    wire [31:0]  grp8_reasm_eth_data   = u_dut.reassembled_eth_tdata;
    wire         grp8_reasm_eth_last   = u_dut.reassembled_eth_tlast;
    wire [15:0]  grp8_reasm_pkt_bytes  = u_dut.sda_decoder_inst.u_ethernet_frame_reassembly.reassembled_pkt_bytes;
    wire [15:0]  grp8_reasm_pkt_cnt    = u_dut.sda_decoder_inst.u_ethernet_frame_reassembly.reassembled_pkt_cnt;
    wire [31:0]  grp8_pc2_xgmii_txd    = pc2_xgmii_txd;
    wire [3:0]   grp8_pc2_xgmii_txc    = pc2_xgmii_txc;
    wire [15:0]  grp8_pc2_byte_cnt     = u_dut.back_end_inst.dbg_rx_eth_byte_cnt; // 4..2012 Bytes
    wire [15:0]  grp8_pc2_pkt_cnt      = u_dut.back_end_inst.dbg_rx_eth_pkt_cnt;  // 1..N Packets
    wire [15:0]  grp8_pc2_clk_cnt      = grp8_pc2_byte_cnt[15:2];                 // 1..503 Clocks

    reg  [15:0]  grp8_reasm_clk_cnt    = 16'd0; // 1..502 Clocks (2 Preamble + 500 Payload)
    reg  [15:0]  grp8_reasm_byte_cnt   = 16'd0; // 4..2008 Bytes
    reg  [95:0]  grp8_captured_ascii   = 96'd0; // Captures "Kookmin FSO "
    reg  [31:0]  grp8_captured_fcs     = 32'd0; // Captures 0xDEADBEEF

    // =========================================================================
    // [Rev 2.2] FULL WORD-BY-WORD / BYTE-BY-BYTE END-TO-END SCOREBOARD QUEUE
    // =========================================================================
    reg [31:0] scb_fifo [0:16383];
    integer    scb_wr_ptr        = 0;
    integer    scb_rd_ptr        = 0;
    integer    scb_matched_words = 0;
    integer    scb_error_words   = 0;

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid && u_dut.gen_sim_mode.gen_axis_tready) begin
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

            // Words 1..2 are Ethernet Preamble; Words 3..502 are Ethernet Packet (Words 12..14 = ASCII Tag)
            if (grp8_reasm_clk_cnt == 16'd11) grp8_captured_ascii[95:64] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd12) grp8_captured_ascii[63:32] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd13) grp8_captured_ascii[31:0]  <= grp8_reasm_eth_data;
            if (grp8_reasm_eth_last)          grp8_captured_fcs          <= grp8_reasm_eth_data;
        end else begin
            grp8_reasm_clk_cnt  <= 16'd0;
            grp8_reasm_byte_cnt <= 16'd0;
        end
    end

    // [Rev 2.3] Inject 1-cycle MGMT 1Hz trigger right after Jumbo Segment 2 (DAT2) starts
    // so the Grand Top simulation visibly transmits & receives IDLE, DAT1, DAT2, AND MGMT!
    initial begin
        wait(grp1_seg_frame_id == 16'd2);
        @(posedge clk_tx);
        force u_dut.sda_encoder_inst.mgmt_trigger_1hz = 1'b1;
        @(posedge clk_tx);
        release u_dut.sda_encoder_inst.mgmt_trigger_1hz;
    end

    // =========================================================================
    // 6. REAL-TIME SDA OISL TABLE 2-4 METRICS & EVENT TELEMETRY LOGGER
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
                $display(" [HISTORICAL INTERNAL COUNTER, NOT SERIAL DURATION] Frame %0d -> Interval = %0.6f us | Rate = %0.3f Mbps",
                         grp4_tx_frame_id - 1, OISL_Frame_Duration_us, OISL_Effective_Data_Rate_Mbps);
            end
            tx_fso_frame_start_ns = $realtime;
        end
    end

    always @(posedge clk_rx) begin
        if (u_dut.sda_decoder_inst.u_core_rx.preamble_valid) begin
            $display(" [%0.1f ns] [GRP6 RX PREAMBLE] Extracted = 0x%018X | Link Locked = %0b",
                     $realtime, grp6_rx_preamble_72b, grp6_rx_preamble_lock);
        end
        if (grp7_arq_fb_valid) begin
            $display(" [%0.1f ns] [GRP7 ARQ FEEDBACK] RXFN = %0d | Status = %s (hdr_crc_ok=%0b, pld_crc_ok=%0b)",
                     $realtime, grp7_arq_fb_rxfn, grp7_arq_fb_ack ? "ACK (1)" : "NAK (0)",
                     grp7_hdr_crc16_ok, grp7_pld_crc32_ok);
        end
        if (grp8_reasm_eth_valid && grp8_reasm_eth_last) begin
            $display(" [%0.1f ns] [GRP8 PC 2 EGRESS] Reassembled Jumbo Packet #%0d Completed (%0d Bytes + 8B Preamble = 2008B) | ASCII=\"%s\" | FCS=0x%08X",
                     $realtime, grp8_reasm_pkt_cnt, grp8_reasm_pkt_bytes, grp8_captured_ascii, grp8_reasm_eth_data);
        end
    end

    // Watchdog Timeout Guard (Enforces $fatal if link or packets stall)
    initial begin
        if (!REPORT_EXTERNAL_COMPLETION && !BASIC_REPORT) begin
        #500000; // 500 us maximum simulation watchdog
        $fatal(1, "[WATCHDOG FATAL] Simulation timed out before completing %0d Jumbo packets!", TARGET_JUMBO_PKTS);
        end
    end

    // =========================================================================
    // 7. MAIN SIMULATION SEQUENCE & FINAL ETRI SCOREBOARD REPORT
    // =========================================================================
    generate if (!REPORT_EXTERNAL_COMPLETION && !BASIC_REPORT) begin : legacy_completion
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
        $display(" 4. MGMT 5000 km Ranging Recovered : 0x%016X (Expected: 0x415312D000000000)", grp7_mgmt_range_meters);
        $display(" 5. Full Byte Scoreboard Verified  : %0d Words (%0d Bytes) Matched | Errors = %0d",
                 scb_matched_words, scb_matched_words * 4, scb_error_words);
        $display(" 6. Recovered Payload Marker & FCS : ASCII = \"%s\" | FCS = 0x%08X",
                 grp8_captured_ascii, grp8_captured_fcs);
        if (rx_preamble_locked && rx_block_locked &&
            (scb_matched_words == TARGET_JUMBO_PKTS * 500) && (scb_error_words == 0) &&
            (grp8_captured_ascii == "Kookmin FSO ") &&
            (grp8_captured_fcs == 32'hDEAD_BEEF)) begin
            $display("--------------------------------------------------------------------------------");
            $display(" FINAL VERDICT: [PASS] ALL 4 FRAME TYPES (DAT1, DAT2, IDLE, MGMT) VERIFIED!");
        end else begin
            $fatal(1, "FINAL VERDICT: [FAIL] Scoreboard or status check failed!");
        end
        $display("================================================================================\n");
        $finish;
    end

    end endgenerate

    generate if(BASIC_REPORT)begin : basic_report
        reg trigger=0;
        initial begin
            force u_dut.gen_sim_mode.trigger_en=trigger;
            wait(u_dut.rst_n && u_dut.gth_tx_ready);
            #20000;@(negedge clk_tx);trigger=1;@(negedge clk_tx);trigger=0;
        end
        integer input_bytes=0,output_bytes=0,packets=0,segs=0,mgmt=0,acks=0,naks=0,replays=0,outstanding=0;
        integer byte_in_packet=0,preleft=0;reg active=0;reg[7:0]reference_bytes[0:1999];reg[7:0]lane;
        realtime last_packet_ns=0;
        always @(posedge clk_tx)if(u_dut.rst_n)begin
            if(u_dut.gen_sim_mode.gen_axis_tvalid&&u_dut.gen_sim_mode.gen_axis_tready)
              for(integer k=0;k<4;k=k+1)if(u_dut.gen_sim_mode.gen_axis_tkeep[k])begin
                if(input_bytes>=2000)$fatal(1,"REPORT_EXTRA_INPUT");
                reference_bytes[input_bytes]=u_dut.gen_sim_mode.gen_axis_tdata[8*k+:8];input_bytes=input_bytes+1;
              end
            if(u_dut.seg_axis_tvalid&&u_dut.seg_axis_tready&&u_dut.seg_axis_tlast)begin
                if(segs>=2||u_dut.seg_valid_bytes!==((segs==0)?14'd1900:14'd100))$fatal(1,"REPORT_SEGMENT");
                $display("REPORT_SEGMENT index=%0d bytes=%0d",segs,u_dut.seg_valid_bytes);segs=segs+1;
            end
            outstanding=0;
            for(integer k=0;k<4;k=k+1)if(u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_valid[k])outstanding=outstanding+1;
            if(u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.rx_ack_valid_in)begin
                if(u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.rx_ack_in)acks=acks+1;else naks=naks+1;
            end
            if(u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_read_req)replays=replays+1;
            if(u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.drop_del_req)$fatal(1,"REPORT_RETRY_DROP");
        end
        always @(posedge clk_rx)if(u_dut.rst_n)begin
            if(u_dut.sda_decoder_inst.u_fso_ethernet_deframer.mgmt_telemetry_valid)begin
                mgmt=mgmt+1;
                if(mgmt!=1||u_dut.sda_decoder_inst.u_fso_ethernet_deframer.mgmt_range_meters!==64'h415312D000000000)$fatal(1,"REPORT_MGMT");
            end
            for(integer k=0;k<4;k=k+1)begin
                lane=pc2_xgmii_txd[8*k+:8];
                if(pc2_xgmii_txc[k])begin
                    case(lane)
                      8'hfb:begin if(active||packets!=0||k!=0)$fatal(1,"REPORT_XGMII_START");active=1;preleft=7;byte_in_packet=0;end
                      8'hfd:begin if(!active||preleft!=0||byte_in_packet!=2000)$fatal(1,"REPORT_XGMII_LENGTH");active=0;packets=packets+1;last_packet_ns=$realtime;end
                      8'h07:if(active)$fatal(1,"REPORT_IDLE_IN_PACKET");
                      default:$fatal(1,"REPORT_XGMII_CONTROL");
                    endcase
                end else begin
                    if(!active)$fatal(1,"REPORT_XGMII_DATA_OUTSIDE_PACKET");
                    if(preleft>0)begin if(lane!==((preleft==1)?8'hd5:8'h55))$fatal(1,"REPORT_XGMII_PREAMBLE");preleft=preleft-1;end
                    else begin
                        if(output_bytes>=input_bytes||lane!==reference_bytes[output_bytes])$fatal(1,"REPORT_BYTE index=%0d expected=%h actual=%h",output_bytes,reference_bytes[output_bytes],lane);
                        output_bytes=output_bytes+1;byte_in_packet=byte_in_packet+1;
                    end
                end
            end
        end
        initial begin
            wait(packets==1&&mgmt==1&&outstanding==0&&u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.del_q_cnt==0);
            #10000;@(negedge clk_rx);
            if(input_bytes!=2000||output_bytes!=2000||packets!=1||segs!=2||mgmt!=1||outstanding!=0||acks!=3||naks!=0||replays!=0||scb_matched_words!=500)$fatal(1,"REPORT_FINAL");
            $display("AUDIT_PASS REPORT_TOP packet1 bytes2000 segments1900_100 MGMT1 ACK3 replay0 postpacket_ns=%0.3f",$realtime-last_packet_ns);$finish;
        end
        initial begin #500000;$fatal(1,"REPORT_TOP_TIMEOUT in=%0d out=%0d packets=%0d MGMT=%0d",input_bytes,output_bytes,packets,mgmt);end
    end endgenerate


    // BASELINE26-OBS01, 2026-11-02 KST: non-driving accepted-transfer trace.
    // This observes the unchanged BASIC_REPORT scenario; timestamps are in ns.
    generate if (BASIC_REPORT) begin : report26_trace
        integer trace_fd;
        initial begin
            trace_fd=$fopen("report26_stream.tsv","w");
            if (!trace_fd) $fatal(1,"REPORT26_TRACE_OPEN");
            $fdisplay(trace_fd,"boundary\ttime_ns\tdata\tkeep");
        end
        always @(posedge u_dut.sda_encoder_inst.clk_logic) if(u_dut.rst_n && $realtime<100000) begin
            if(u_dut.sda_encoder_inst.gb_valid)
                $fdisplay(trace_fd,"encoder\t%0.3f\t%032h\t%04h",$realtime,u_dut.sda_encoder_inst.gb_data,u_dut.sda_encoder_inst.gb_keep);
            if(u_dut.sda_decoder_inst.core_dv)
                $fdisplay(trace_fd,"cdc3\t%0.3f\t%032h\tffff",$realtime,u_dut.sda_decoder_inst.core_data);
        end
        always @(posedge u_dut.sda_encoder_inst.clk_gth) if(u_dut.rst_n && $realtime<100000) begin
            if(u_dut.sda_encoder_inst.cdc2_valid)
                $fdisplay(trace_fd,"cdc2\t%0.3f\t%08h\tf",$realtime,u_dut.sda_encoder_inst.cdc2_data);
            if(u_dut.tx_fso_valid_out)
                $fdisplay(trace_fd,"tx\t%0.3f\t%08h\tf",$realtime,u_dut.tx_fso_data_out);
        end
        always @(posedge u_dut.sda_decoder_inst.clk_gth) if(u_dut.rst_n) begin
            if(u_dut.sda_decoder_inst.rx_fso_valid_in &&
               (u_dut.sda_decoder_inst.u_cdc_rx_3.fifo_full || u_dut.sda_decoder_inst.u_cdc_rx_3.wr_rst_busy))
                $fatal(1,"REPORT26_CDC3_REJECTED_TRANSFER");
            if($realtime<100000)begin
                if(u_dut.sda_decoder_inst.rx_fso_valid_in)
                    $fdisplay(trace_fd,"rx\t%0.3f\t%08h\tf",$realtime,u_dut.sda_decoder_inst.rx_fso_data_in);
                if(u_dut.sda_decoder_inst.u_cdc_rx_3.fifo_wr_en)
                    $fdisplay(trace_fd,"cdc3_write\t%0.3f\t%08h\tf",$realtime,u_dut.sda_decoder_inst.u_cdc_rx_3.fifo_din);
            end
        end
    end endgenerate
endmodule
