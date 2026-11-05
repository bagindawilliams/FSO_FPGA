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
  - Rev 2.4 (2026-11-06 00:10 KST) : [Audit Priority 1 & 2 Closure - Full XGMII Egress Checker, Segment/CRC/MGMT/IDLE Contract & Clock/Pause Telemetry]
    1. Set default baseline to 'CH_ERROR_MODE = 0' (Clean Channel) with 2 x 2,000-byte
       Jumbo packets (4,000 MAC bytes = 1,000 32-bit words) and widened
       'grp1_seg_active_bytes' to 14 bits ([13:0]) matching 'u_dut.seg_valid_bytes',
       verifying the exact 4-segment sequence (1,900B, 100B, 1,900B, 100B).
    2. Retained the reassembly diagnostic scoreboard (2 x 502 words = 2,008B/pkt) and
       added a full post-backend XGMII Egress Checker on 'pc2_xgmii_txd[31:0]' and
       'pc2_xgmii_txc[3:0]' verifying: /S/ + SFD preamble (8B), 1,000 MAC words
       (4,000B, 0 mismatches), /T/ termination word (32'h0707_07FD, 4'b1111), and at
       least 3 full idle cycles (32'h0707_0707, 4'b1111) before the next /S/.
    3. Added event-driven OISL CRC counters sampled on 'hdr_check_done' and
       'pld_check_done', explicit MGMT event & 5,000,000.0 m range verification,
       explicit TX/RX IDLE observation, LPC 259-word burst continuity checks, and
       live measurements of 'tx0_clk'/'rx0_clk' periods and 'rx_fso_valid_out' pauses.
  - Rev 2.5 (2026-11-06 00:35 KST) : [Post-Lock 2-Packet Trigger Gating & Post-DATA IDLE Continuation]
    Gated 'u_dut.gen_sim_mode.trigger_en' so the ingress generator emits strictly
    'TARGET_JUMBO_PKTS' (2 x 2,000B = 4 segments: 1,900B, 100B, 1,900B, 100B) after
    GTH RX gearbox lock ('rx_block_locked'), allowing 'sda_encoder' to naturally
    transmit continuous IDLE frames before and after the 2 Jumbo packets so RX IDLE
    frames ('rx_idle_frame_cnt >= 1') are observed and push the final packet through
    CDC 3 / Demux 128 to XGMII egress.
  - Rev 2.6 (2026-11-06 00:40 KST) : [Audit Final Freeze Closure - Per-Event MGMT Check, Clock Tolerance, IPG Span & Partial-Frame Log Evidence]
    1. Verified 'grp7_mgmt_range_meters' on EVERY 'grp7_mgmt_valid' event and
       accumulated 'mgmt_range_mismatch_cnt' (requiring 0 mismatches for PASS) so an
       earlier mismatch can never be overwritten by a later valid event.
    2. Added IP-configuration clock period tolerance checks ('clock_freq_tolerance_ok':
       tx0_clk and rx0_clk within 3.103 ns +/- 0.010 ns; clk_logic within 5.000 ns +/-
       0.010 ns), labeled the 3-cycle post-/T/ check as 'xgmii_min3_idle_verified_pkts',
       and measured the full inter-packet idle span ('inter_pkt1_to_pkt2_idle_cycles').
    3. Logged and reported the exact identity of any in-flight partial frame at
       simulation stop ('last_hdr_done_txfn', 'last_hdr_done_type_str', and
       'grp7_cdc4_pld_clk_cnt'/478) when 'rx_hdr_crc_pass_cnt > rx_pld_crc_pass_cnt',
       and updated report terminology to "Stimulus FCS Marker Preservation".
===========================================================================
*/

module tb_SDAOISL10Gto10G_top();

    // =========================================================================
    // 1. TOP-LEVEL SIMULATION PARAMETERS
    // =========================================================================
    parameter SIM_MODE             = 1;     // 1 = Internal Packet Gen & XGMII Direct Mode
    parameter CH_ERROR_MODE        = 0;     // 0 = Clean Baseline, 1 = Reduced Mask (max_error=18), 2 = Full 48-Word error.mem
    parameter TARGET_JUMBO_PKTS    = 2;     // Number of 2000-Byte Jumbo packets to verify at PC 2 (4,000 MAC Bytes)
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
    // 4. CLOCK GENERATORS & LIVE TOP-LEVEL CLOCK PERIOD SAMPLERS
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

    // Live Post-Lock Clock Period & Frequency Measurements
    real last_tx0_edge_ns          = 0.0;
    real last_rx0_edge_ns          = 0.0;
    real last_200m_edge_ns         = 0.0;
    real measured_tx0_period_ns    = 0.0;
    real measured_rx0_period_ns    = 0.0;
    real measured_200m_period_ns   = 0.0;
    real measured_tx0_mhz          = 0.0;
    real measured_rx0_mhz          = 0.0;
    real measured_200m_mhz         = 0.0;
    reg  tx0_clk_sampled           = 1'b0;
    reg  rx0_clk_sampled           = 1'b0;
    reg  clk_200m_sampled          = 1'b0;
    real d_tx0_ns, d_rx0_ns, d_200m_ns;

    always @(posedge clk_tx) begin
        if (u_dut.rst_n && u_dut.gth_tx_ready) begin
            if (last_tx0_edge_ns > 0.0) begin
                d_tx0_ns        = $realtime - last_tx0_edge_ns;
                tx0_clk_sampled <= 1'b1;
                if ((d_tx0_ns - measured_tx0_period_ns > 0.0001) || (measured_tx0_period_ns - d_tx0_ns > 0.0001)) begin
                    measured_tx0_period_ns = d_tx0_ns;
                    if (d_tx0_ns > 0.0) measured_tx0_mhz = 1000.0 / d_tx0_ns;
                end
            end
            last_tx0_edge_ns = $realtime;
        end
    end

    always @(posedge clk_rx) begin
        if (u_dut.rst_n && u_dut.gth_rx_ready) begin
            if (last_rx0_edge_ns > 0.0) begin
                d_rx0_ns        = $realtime - last_rx0_edge_ns;
                rx0_clk_sampled <= 1'b1;
                if ((d_rx0_ns - measured_rx0_period_ns > 0.0001) || (measured_rx0_period_ns - d_rx0_ns > 0.0001)) begin
                    measured_rx0_period_ns = d_rx0_ns;
                    if (d_rx0_ns > 0.0) measured_rx0_mhz = 1000.0 / d_rx0_ns;
                end
            end
            last_rx0_edge_ns = $realtime;
        end
    end

    always @(posedge clk_200m) begin
        if (u_dut.rst_n) begin
            if (last_200m_edge_ns > 0.0) begin
                d_200m_ns        = $realtime - last_200m_edge_ns;
                clk_200m_sampled <= 1'b1;
                if ((d_200m_ns - measured_200m_period_ns > 0.0001) || (measured_200m_period_ns - d_200m_ns > 0.0001)) begin
                    measured_200m_period_ns = d_200m_ns;
                    if (d_200m_ns > 0.0) measured_200m_mhz = 1000.0 / d_200m_ns;
                end
            end
            last_200m_edge_ns = $realtime;
        end
    end

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
    // [Rev 2.4] Widened to full 14-bit port width matching u_dut.seg_valid_bytes
    wire [13:0] grp1_seg_active_bytes  = u_dut.seg_valid_bytes;

    reg  [15:0] grp1_pc1_clk_cnt       = 16'd0; // 1..500 Clocks
    reg  [15:0] grp1_pc1_byte_cnt      = 16'd0; // 4..2000 Bytes
    reg  [15:0] grp1_seg_clk_cnt       = 16'd0; // 1..475 Clocks
    reg  [15:0] grp1_seg_byte_cnt      = 16'd0; // 4..1900 Bytes
    reg  [15:0] grp1_seg_frame_id      = 16'd0;

    // Segment Sequence Verifier: Checks 1900B, 100B, 1900B, 100B across the 2 Jumbo packets
    integer     gen_pkt_completed_cnt  = 0;
    integer     seg_completed_cnt      = 0;
    integer     seg_size_mismatch_cnt  = 0;
    reg  [13:0] seg_observed_bytes [0:3];
    initial begin
        seg_observed_bytes[0] = 14'd0;
        seg_observed_bytes[1] = 14'd0;
        seg_observed_bytes[2] = 14'd0;
        seg_observed_bytes[3] = 14'd0;
    end

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid) begin
            if (grp1_pc1_clk_cnt == 16'd500) begin
                grp1_pc1_clk_cnt  <= 16'd1;
                grp1_pc1_byte_cnt <= 16'd4;
            end else begin
                grp1_pc1_clk_cnt  <= grp1_pc1_clk_cnt + 16'd1;
                grp1_pc1_byte_cnt <= grp1_pc1_byte_cnt + 16'd4;
            end
            if (grp1_pc1_gen_last)
                gen_pkt_completed_cnt <= gen_pkt_completed_cnt + 1;
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

            if (grp1_seg_last) begin
                if (seg_completed_cnt < 4) begin
                    seg_observed_bytes[seg_completed_cnt] <= grp1_seg_active_bytes;
                    if (((seg_completed_cnt % 2 == 0) && (grp1_seg_active_bytes !== 14'd1900)) ||
                        ((seg_completed_cnt % 2 == 1) && (grp1_seg_active_bytes !== 14'd100))) begin
                        seg_size_mismatch_cnt <= seg_size_mismatch_cnt + 1;
                    end
                end
                seg_completed_cnt <= seg_completed_cnt + 1;
            end
        end else if (!u_dut.seg_axis_tvalid) begin
            grp1_seg_clk_cnt  <= 16'd0;
            grp1_seg_byte_cnt <= 16'd0;
        end
    end

    // [Rev 2.5] Gate ingress generator so it starts after GTH RX block lock (ensuring
    // initial IDLE frames are received across the locked link) and stops after emitting
    // strictly TARGET_JUMBO_PKTS (2 x 2,000B = 4 segments), allowing post-DATA IDLE
    // continuation frames to flush the pipeline cleanly.
    initial begin
        force u_dut.gen_sim_mode.trigger_en = 1'b0;
        wait(u_dut.rst_n && gth_link_up && rx_block_locked);
        // Allow at least 2 IDLE frames to be transmitted & received after rx_block_locked
        repeat (1600) @(posedge clk_tx);
        release u_dut.gen_sim_mode.trigger_en;

        // Once the 2nd 2,000-byte Jumbo packet begins its final beat, deassert trigger_en
        // so packet_gen_inst stops at exactly 2 packets (4,000 MAC bytes = 4 segments).
        wait(gen_pkt_completed_cnt == 1 && u_dut.gen_sim_mode.gen_axis_tvalid &&
             u_dut.gen_sim_mode.gen_axis_tready && u_dut.gen_sim_mode.gen_axis_tlast);
        force u_dut.gen_sim_mode.trigger_en = 1'b0;
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
    integer     tx_idle_frame_cnt      = 0;
    integer     tx_data_frame_cnt      = 0;
    integer     tx_mgmt_frame_cnt      = 0;

    always @(posedge clk_tx) begin
        if (grp2_hdr_valid) begin
            if (grp2_hdr_clk_cnt == 8'd0) begin
                case (grp2_tx_frame_type)
                    2'b00: tx_idle_frame_cnt <= tx_idle_frame_cnt + 1;
                    2'b01: tx_data_frame_cnt <= tx_data_frame_cnt + 1;
                    2'b10: tx_mgmt_frame_cnt <= tx_mgmt_frame_cnt + 1;
                endcase
            end
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

    // Observational Measurement of rx_fso_valid_out Pauses
    reg          rx_fso_stream_started      = 1'b0;
    reg          rx_fso_valid_d1            = 1'b0;
    integer      rx_fso_valid_words_total   = 0;
    integer      rx_fso_valid_pause_events  = 0;
    integer      rx_fso_valid_pause_cycles  = 0;

    // -------------------------------------------------------------------------
    // GROUP 6: RX CDC 3 & 200 MHz FEC CORE (DEMUX 128, LPC DEC, DESCRAMBLER, RS)
    // -------------------------------------------------------------------------
    wire         grp6_cdc3_valid       = u_dut.sda_decoder_inst.core_dv;
    wire [127:0] grp6_cdc3_data        = u_dut.sda_decoder_inst.core_data;
    wire [11:0]  grp6_cdc3_byte_cnt    = u_dut.sda_decoder_inst.u_cdc_rx_3.frame_byte_cnt; // 1..3117 Bytes
    wire [15:0]  grp6_cdc3_clk_cnt     = u_dut.sda_decoder_inst.u_cdc_rx_3.out_clk_cnt;    // 1..499 Clocks
    wire [71:0]  grp6_rx_preamble_72b  = u_dut.sda_decoder_inst.u_core_rx.preamble_extracted;
    wire         grp6_rx_preamble_lock = rx_preamble_locked;
    wire         grp6_rx_lpc_in_dv     = u_dut.sda_decoder_inst.u_core_rx.lpc_valid_raw;
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

    // Verify 259-word contiguous burst contract into LPC Decoder
    integer      lpc_burst_word_idx        = 0;
    integer      lpc_completed_bursts      = 0;
    integer      lpc_intra_burst_gap_cnt   = 0;

    always @(posedge clk_200m) begin
        if (!u_dut.rst_n) begin
            grp6_rs_pld_clk_cnt     <= 9'd0;
            grp6_rs_pld_byte_cnt    <= 12'd0;
            lpc_burst_word_idx      <= 0;
            lpc_completed_bursts    <= 0;
            lpc_intra_burst_gap_cnt <= 0;
        end else begin
            if (grp6_rs_pld_dv) begin
                grp6_rs_pld_clk_cnt  <= grp6_rs_pld_clk_cnt + 9'd1;
                grp6_rs_pld_byte_cnt <= grp6_rs_pld_byte_cnt + 12'd8;
            end else begin
                grp6_rs_pld_clk_cnt  <= 9'd0;
                grp6_rs_pld_byte_cnt <= 12'd0;
            end

            if (grp6_rx_lpc_in_dv) begin
                if (lpc_burst_word_idx == 258) begin
                    lpc_burst_word_idx   <= 0;
                    lpc_completed_bursts <= lpc_completed_bursts + 1;
                end else begin
                    lpc_burst_word_idx   <= lpc_burst_word_idx + 1;
                end
            end else if (lpc_burst_word_idx > 0 && lpc_burst_word_idx < 259) begin
                lpc_intra_burst_gap_cnt <= lpc_intra_burst_gap_cnt + 1;
            end
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
    wire         grp7_hdr_check_done   = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.hdr_check_done;
    wire         grp7_pld_check_done   = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.pld_check_done;
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

    // Event-Driven OISL CRC, MGMT (with per-event mismatch check) & In-Flight Partial Frame Tracker
    integer      rx_hdr_crc_pass_cnt      = 0;
    integer      rx_hdr_crc_fail_cnt      = 0;
    integer      rx_pld_crc_pass_cnt      = 0;
    integer      rx_pld_crc_fail_cnt      = 0;
    integer      rx_idle_frame_cnt        = 0;
    integer      rx_data_frame_cnt        = 0;
    integer      rx_mgmt_frame_cnt        = 0;
    integer      mgmt_valid_event_cnt     = 0;
    integer      mgmt_range_mismatch_cnt  = 0;
    reg  [63:0]  mgmt_captured_range      = 64'd0;
    reg  [15:0]  last_hdr_done_txfn       = 16'd0;
    reg  [31:0]  last_hdr_done_type_str   = "NONE";

    always @(posedge clk_rx) begin
        if (!u_dut.rst_n) begin
            grp7_defr_clk_cnt       <= 9'd0;
            grp7_defr_byte_cnt      <= 12'd0;
            rx_hdr_crc_pass_cnt     <= 0;
            rx_hdr_crc_fail_cnt     <= 0;
            rx_pld_crc_pass_cnt     <= 0;
            rx_pld_crc_fail_cnt     <= 0;
            rx_idle_frame_cnt       <= 0;
            rx_data_frame_cnt       <= 0;
            rx_mgmt_frame_cnt       <= 0;
            mgmt_valid_event_cnt    <= 0;
            mgmt_range_mismatch_cnt <= 0;
            mgmt_captured_range     <= 64'd0;
            last_hdr_done_txfn      <= 16'd0;
            last_hdr_done_type_str  <= "NONE";
        end else begin
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

            // Event-driven Header CRC-16 check & in-flight frame identity capture
            if (grp7_hdr_check_done) begin
                last_hdr_done_txfn     <= grp7_rx_txfn;
                last_hdr_done_type_str <= grp7_rx_frame_str;
                if (grp7_hdr_crc16_ok === 1'b1) rx_hdr_crc_pass_cnt <= rx_hdr_crc_pass_cnt + 1;
                else                            rx_hdr_crc_fail_cnt <= rx_hdr_crc_fail_cnt + 1;
            end

            // Event-driven Payload CRC-32 check & Frame Type classification
            if (grp7_pld_check_done) begin
                if (grp7_pld_crc32_ok === 1'b1) begin
                    rx_pld_crc_pass_cnt <= rx_pld_crc_pass_cnt + 1;
                    case (grp7_rx_frame_type)
                        2'b00: rx_idle_frame_cnt <= rx_idle_frame_cnt + 1;
                        2'b01: rx_data_frame_cnt <= rx_data_frame_cnt + 1;
                        2'b10: rx_mgmt_frame_cnt <= rx_mgmt_frame_cnt + 1;
                    endcase
                end else begin
                    rx_pld_crc_fail_cnt <= rx_pld_crc_fail_cnt + 1;
                end
            end

            // [Rev 2.6] Check MGMT range value on EVERY grp7_mgmt_valid event
            if (grp7_mgmt_valid) begin
                mgmt_valid_event_cnt <= mgmt_valid_event_cnt + 1;
                mgmt_captured_range  <= grp7_mgmt_range_meters;
                if ((^grp7_mgmt_range_meters === 1'bx) || (grp7_mgmt_range_meters !== 64'h4153_12D0_0000_0000)) begin
                    mgmt_range_mismatch_cnt <= mgmt_range_mismatch_cnt + 1;
                    $display(" [MGMT ERROR] Event #%0d at %0.1f ns had invalid range: 0x%016X",
                             mgmt_valid_event_cnt + 1, $realtime, grp7_mgmt_range_meters);
                end
            end
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
    // [Rev 2.2 & Rev 2.6] DUAL SCOREBOARD:
    //   1. Diagnostic Reassembly Scoreboard (2 x 502 words = 2,008B/pkt)
    //   2. Primary Post-Backend XGMII Egress Checker on pc2_xgmii_txd / pc2_xgmii_txc
    //      (Verifies /S/ + SFD, 1,000 MAC words = 4,000B, /T/ 0x070707FD + >=3 full
    //       idle cycles 0x07070707 per packet AND measures total inter-packet idle span)
    // =========================================================================
    reg [31:0] scb_fifo [0:16383];
    integer    scb_wr_ptr        = 0;
    integer    scb_rd_ptr        = 0;
    integer    scb_matched_words = 0;
    integer    scb_error_words   = 0;

    always @(posedge clk_tx) begin
        if (grp1_pc1_gen_valid) begin
            scb_fifo[scb_wr_ptr] <= grp1_pc1_gen_data;
            scb_wr_ptr           <= scb_wr_ptr + 1;
        end
    end

    // 1. Diagnostic Reassembly Monitor (502 words = 2,008B per packet)
    integer reasm_pkt_502_cnt = 0;
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
                    $fatal(1, "[SCOREBOARD FATAL] Reassembly Word #%0d Mismatch! Expected=0x%08X, Got=0x%08X",
                           scb_rd_ptr, scb_fifo[scb_rd_ptr], grp8_reasm_eth_data);
                end
                scb_rd_ptr <= scb_rd_ptr + 1;
            end

            if (grp8_reasm_clk_cnt == 16'd11) grp8_captured_ascii[95:64] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd12) grp8_captured_ascii[63:32] <= grp8_reasm_eth_data;
            if (grp8_reasm_clk_cnt == 16'd13) grp8_captured_ascii[31:0]  <= grp8_reasm_eth_data;
            if (grp8_reasm_eth_last) begin
                grp8_captured_fcs <= grp8_reasm_eth_data;
                if (grp8_reasm_clk_cnt == 16'd501)
                    reasm_pkt_502_cnt <= reasm_pkt_502_cnt + 1;
            end
        end else begin
            grp8_reasm_clk_cnt  <= 16'd0;
            grp8_reasm_byte_cnt <= 16'd0;
        end
    end

    // 2. Primary Post-Backend XGMII Egress Checker (pc2_xgmii_txd & pc2_xgmii_txc)
    localparam [2:0] XG_IDLE  = 3'd0;
    localparam [2:0] XG_SFD   = 3'd1;
    localparam [2:0] XG_DATA  = 3'd2;
    localparam [2:0] XG_TERM  = 3'd3;
    localparam [2:0] XG_IPG   = 3'd4;

    reg  [2:0]  xg_state                        = XG_IDLE;
    integer     xgmii_rd_ptr                    = 0;
    integer     xgmii_pkt_word_idx              = 0;
    integer     xgmii_mac_words_ok              = 0; // Expected: 1,000 words (4,000 MAC bytes) across 2 packets
    integer     xgmii_mac_word_errors           = 0;
    integer     xgmii_ctrl_errors               = 0;
    integer     xgmii_ipg_full_idle_cnt         = 0; // Counts mandatory 3 full idle cycles in XG_IPG
    integer     xgmii_min3_idle_verified_pkts   = 0; // Counts packets passing the >=3 full idle cycles check
    integer     inter_pkt_idle_acc              = 0; // Accumulates ALL full idle cycles between Pkt 1 /T/ and Pkt 2 /S/
    integer     inter_pkt1_to_pkt2_idle_cycles  = 0; // Latched total full idle cycles between Packet 1 and Packet 2
    integer     xgmii_pkt_completed_cnt         = 0;
    reg  [95:0] xgmii_captured_ascii            = 96'd0;
    reg  [31:0] xgmii_captured_fcs              = 32'd0;
    wire [31:0] xgmii_min_ipg_observed          = xgmii_min3_idle_verified_pkts;

    always @(posedge clk_rx) begin
        if (!u_dut.rst_n) begin
            rx_fso_stream_started     <= 1'b0;
            rx_fso_valid_d1           <= 1'b0;
            rx_fso_valid_words_total  <= 0;
            rx_fso_valid_pause_events <= 0;
            rx_fso_valid_pause_cycles <= 0;
        end else begin
            rx_fso_valid_d1 <= rx_fso_valid_out;
            if (rx_fso_valid_out) begin
                rx_fso_stream_started    <= 1'b1;
                rx_fso_valid_words_total <= rx_fso_valid_words_total + 1;
            end else if (rx_fso_stream_started && (xgmii_pkt_completed_cnt < TARGET_JUMBO_PKTS)) begin
                rx_fso_valid_pause_cycles <= rx_fso_valid_pause_cycles + 1;
                if (rx_fso_valid_d1)
                    rx_fso_valid_pause_events <= rx_fso_valid_pause_events + 1;
            end
        end
    end

    always @(posedge clk_rx) begin
        if (!u_dut.rst_n) begin
            xg_state                       <= XG_IDLE;
            xgmii_rd_ptr                   <= 0;
            xgmii_pkt_word_idx             <= 0;
            xgmii_mac_words_ok             <= 0;
            xgmii_mac_word_errors          <= 0;
            xgmii_ctrl_errors              <= 0;
            xgmii_ipg_full_idle_cnt        <= 0;
            xgmii_min3_idle_verified_pkts  <= 0;
            inter_pkt_idle_acc             <= 0;
            inter_pkt1_to_pkt2_idle_cycles <= 0;
            xgmii_pkt_completed_cnt        <= 0;
            xgmii_captured_ascii           <= 96'd0;
            xgmii_captured_fcs             <= 32'd0;
        end else begin
            case (xg_state)
                XG_IDLE: begin
                    if (pc2_xgmii_txc == 4'b1111 && pc2_xgmii_txd == 32'h0707_0707) begin
                        // Valid XGMII idle word; accumulate if between Packet 1 and Packet 2
                        if (xgmii_pkt_completed_cnt == 1)
                            inter_pkt_idle_acc <= inter_pkt_idle_acc + 1;
                    end else if (pc2_xgmii_txc == 4'b0001 && pc2_xgmii_txd == 32'h5555_55FB) begin
                        // Valid /S/ Start of Packet delimiter + 3 Preamble bytes
                        if (xgmii_pkt_completed_cnt == 1)
                            inter_pkt1_to_pkt2_idle_cycles <= inter_pkt_idle_acc;
                        xg_state <= XG_SFD;
                    end else begin
                        xgmii_ctrl_errors <= xgmii_ctrl_errors + 1;
                        $fatal(1, "[XGMII FATAL] Unexpected word during IDLE: txd=0x%08X, txc=0x%X", pc2_xgmii_txd, pc2_xgmii_txc);
                    end
                end

                XG_SFD: begin
                    // Expect 4 Preamble bytes + SFD (0xD5) at MSB lane [31:24] with txc == 4'b0000
                    if (pc2_xgmii_txc == 4'b0000 && pc2_xgmii_txd == 32'hD555_5555) begin
                        xg_state           <= XG_DATA;
                        xgmii_pkt_word_idx <= 0;
                    end else begin
                        xgmii_ctrl_errors <= xgmii_ctrl_errors + 1;
                        $fatal(1, "[XGMII FATAL] Invalid SFD word: txd=0x%08X, txc=0x%X", pc2_xgmii_txd, pc2_xgmii_txc);
                    end
                end

                XG_DATA: begin
                    // Expect 500 contiguous 32-bit MAC data words (2,000 MAC bytes) with txc == 4'b0000
                    if (pc2_xgmii_txc !== 4'b0000) begin
                        xgmii_ctrl_errors <= xgmii_ctrl_errors + 1;
                        $fatal(1, "[XGMII FATAL] Control character asserted inside MAC payload at word %0d: txd=0x%08X, txc=0x%X",
                               xgmii_pkt_word_idx, pc2_xgmii_txd, pc2_xgmii_txc);
                    end
                    if (pc2_xgmii_txd === scb_fifo[xgmii_rd_ptr]) begin
                        xgmii_mac_words_ok <= xgmii_mac_words_ok + 1;
                    end else begin
                        xgmii_mac_word_errors <= xgmii_mac_word_errors + 1;
                        $fatal(1, "[XGMII FATAL] Egress MAC Word #%0d Mismatch! Expected=0x%08X, Got=0x%08X",
                               xgmii_rd_ptr, scb_fifo[xgmii_rd_ptr], pc2_xgmii_txd);
                    end

                    if (xgmii_pkt_word_idx == 9)   xgmii_captured_ascii[95:64] <= pc2_xgmii_txd;
                    if (xgmii_pkt_word_idx == 10)  xgmii_captured_ascii[63:32] <= pc2_xgmii_txd;
                    if (xgmii_pkt_word_idx == 11)  xgmii_captured_ascii[31:0]  <= pc2_xgmii_txd;
                    if (xgmii_pkt_word_idx == 499) xgmii_captured_fcs          <= pc2_xgmii_txd;

                    xgmii_rd_ptr <= xgmii_rd_ptr + 1;
                    if (xgmii_pkt_word_idx == 499) begin
                        xg_state <= XG_TERM;
                    end else begin
                        xgmii_pkt_word_idx <= xgmii_pkt_word_idx + 1;
                    end
                end

                XG_TERM: begin
                    // Cycle 1 after last data word must be /T/ + 3 idle chars: 0x070707FD, txc=4'b1111
                    if (pc2_xgmii_txc == 4'b1111 && pc2_xgmii_txd == 32'h0707_07FD) begin
                        xg_state                <= XG_IPG;
                        xgmii_ipg_full_idle_cnt <= 0;
                        if (xgmii_pkt_completed_cnt == 0)
                            inter_pkt_idle_acc <= 0;
                    end else begin
                        xgmii_ctrl_errors <= xgmii_ctrl_errors + 1;
                        $fatal(1, "[XGMII FATAL] Expected /T/ termination (0x070707FD, 4'b1111), got txd=0x%08X, txc=0x%X",
                               pc2_xgmii_txd, pc2_xgmii_txc);
                    end
                end

                XG_IPG: begin
                    // Must observe at least 3 full idle cycles (0x07070707, 4'b1111) before next /S/
                    if (pc2_xgmii_txc == 4'b1111 && pc2_xgmii_txd == 32'h0707_0707) begin
                        xgmii_ipg_full_idle_cnt <= xgmii_ipg_full_idle_cnt + 1;
                        if (xgmii_pkt_completed_cnt == 0)
                            inter_pkt_idle_acc <= inter_pkt_idle_acc + 1;
                        if (xgmii_ipg_full_idle_cnt == 2) begin
                            // 3rd full idle cycle completed -> mandatory minimum 3-idle IPG contract verified
                            xgmii_min3_idle_verified_pkts <= xgmii_min3_idle_verified_pkts + 1;
                            xgmii_pkt_completed_cnt       <= xgmii_pkt_completed_cnt + 1;
                            xg_state                      <= XG_IDLE;
                        end
                    end else begin
                        xgmii_ctrl_errors <= xgmii_ctrl_errors + 1;
                        $fatal(1, "[XGMII FATAL] Premature /S/ or non-idle word during 3-cycle IPG_WAIT (cycle %0d): txd=0x%08X, txc=0x%X",
                               xgmii_ipg_full_idle_cnt + 1, pc2_xgmii_txd, pc2_xgmii_txc);
                    end
                end

                default: xg_state <= XG_IDLE;
            endcase
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
                $display(" [GRP4 TX MONITOR INTERVAL] Frame %0d -> Interval = %0.6f us | Rate = %0.3f Mbps",
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
            $display(" [%0.1f ns] [GRP8 REASSEMBLY] Jumbo Packet #%0d Reassembled (%0dB MAC + 8B Preamble = 2008B / 502W) | ASCII=\"%s\" | StimulusFCS=0x%08X",
                     $realtime, grp8_reasm_pkt_cnt, grp8_reasm_pkt_bytes, grp8_captured_ascii, grp8_reasm_eth_data);
        end
    end

    // Watchdog Timeout Guard (Enforces $fatal if link or packets stall)
    initial begin
        #500000; // 500 us maximum simulation watchdog
        $fatal(1, "[WATCHDOG FATAL] Simulation timed out before completing %0d Jumbo packets!", TARGET_JUMBO_PKTS);
    end

    // =========================================================================
    // 7. MAIN SIMULATION SEQUENCE & FINAL ETRI SCOREBOARD REPORT (REV 2.6)
    // =========================================================================
    reg clock_freq_tolerance_ok;

    initial begin
        $display("\n================================================================================");
        $display(" STARTING SDAOISL10Gto10G_top FULL END-TO-END SIMULATION (PC 1 -> FPGA -> PC 2)");
        $display(" -> SIM_MODE          : %0d (Internal 2000B Jumbo Traffic Generator)", SIM_MODE);
        $display(" -> CH_ERROR_MODE     : %0d (0=Clean Baseline, 1=Reduced Mask max_error=18, 2=Full 48-Word error.mem)", CH_ERROR_MODE);
        $display(" -> TARGET_JUMBO_PKTS : %0d Packets (2 x 2,000B = 4,000 MAC Bytes / 1,000 Words)", TARGET_JUMBO_PKTS);
        $display("================================================================================\n");

        wait(gth_link_up == 1'b1);
        $display(" [%0.1f ns] [STAGE 1] GTH 10.3125 Gbps Serial Transceiver Link Up Achieved!", $realtime);

        wait(rx_block_locked == 1'b1);
        $display(" [%0.1f ns] [STAGE 2] 64B/66B RX Gearbox Sync Header (2'b01) Locked!", $realtime);

        wait(rx_preamble_locked == 1'b1);
        $display(" [%0.1f ns] [STAGE 3] SDA OISL 72-bit Preamble (72'h77AD5B5843641E2E26) Locked!\n", $realtime);

        // Wait until TARGET_JUMBO_PKTS full 2,000-Byte Ethernet Jumbo frames complete XGMII Egress (/T/ + 3 Idle Cycles)
        // AND at least 1 IDLE frame and 1 MGMT frame are verified at the receiver
        wait(xgmii_pkt_completed_cnt >= TARGET_JUMBO_PKTS && mgmt_valid_event_cnt >= 1 && rx_idle_frame_cnt >= 1);
        repeat (50) @(posedge clk_rx);

        // Verify measured clock periods against IP configuration tolerances:
        // - tx0_clk & rx0_clk : 322.265625 MHz -> 3.103 ns +/- 0.010 ns
        // - clk_logic         : 200.000000 MHz -> 5.000 ns +/- 0.010 ns
        clock_freq_tolerance_ok = tx0_clk_sampled && rx0_clk_sampled && clk_200m_sampled &&
                                  (measured_tx0_period_ns  >= 3.093 && measured_tx0_period_ns  <= 3.113) &&
                                  (measured_rx0_period_ns  >= 3.093 && measured_rx0_period_ns  <= 3.113) &&
                                  (measured_200m_period_ns >= 4.990 && measured_200m_period_ns <= 5.010);

        $display("\n================================================================================");
        $display(" SDAOISL10Gto10G_top END-TO-END VERIFICATION REPORT (SDA OISL v2.1.2 - REV 2.6)");
        $display("================================================================================");
        $display(" 1. Measured Top-Level Clocks      : tx0_clk = %0.6f MHz (%0.3f ns) | rx0_clk = %0.6f MHz (%0.3f ns) | clk_logic = %0.6f MHz (%0.3f ns) [IP_Tol_OK=%0b]",
                 measured_tx0_mhz, measured_tx0_period_ns, measured_rx0_mhz, measured_rx0_period_ns, measured_200m_mhz, measured_200m_period_ns, clock_freq_tolerance_ok);
        $display(" 2. Optical Link & Preamble Status : gth_link_up=%0b | rx_block_locked=%0b | Preamble=0x%018X (Locked=%0b)",
                 gth_link_up, rx_block_locked, grp6_rx_preamble_72b, rx_preamble_locked);
        $display(" 3. RX GTH Pause & LPC Burst Check : rx_fso_valid_out Words=%0d (PauseEvents=%0d, PauseCycles=%0d) | LPC 259W Bursts=%0d (IntraBurstGaps=%0d)",
                 rx_fso_valid_words_total, rx_fso_valid_pause_events, rx_fso_valid_pause_cycles, lpc_completed_bursts, lpc_intra_burst_gap_cnt);
        $display(" 4. Ingress Segmentation (14-bit)  : Segments=%0d [Seg0..3 = %0dB, %0dB, %0dB, %0dB] (Expected: 1900, 100, 1900, 100 | Mismatches=%0d)",
                 seg_completed_cnt, seg_observed_bytes[0], seg_observed_bytes[1], seg_observed_bytes[2], seg_observed_bytes[3], seg_size_mismatch_cnt);
        $display(" 5. Frame Types & Event-Driven CRC : TX[IDLE=%0d, DATA=%0d, MGMT=%0d] | RX[IDLE=%0d, DATA=%0d, MGMT=%0d] | HdrCRC Pass=%0d (Fail=%0d) | PldCRC Pass=%0d (Fail=%0d)",
                 tx_idle_frame_cnt, tx_data_frame_cnt, tx_mgmt_frame_cnt,
                 rx_idle_frame_cnt, rx_data_frame_cnt, rx_mgmt_frame_cnt,
                 rx_hdr_crc_pass_cnt, rx_hdr_crc_fail_cnt, rx_pld_crc_pass_cnt, rx_pld_crc_fail_cnt);
        if (rx_hdr_crc_pass_cnt > rx_pld_crc_pass_cnt) begin
            $display("    -> In-Flight Partial Frame     : Header #%0d (TXFN=%0d, Type=\"%s\") completed Header CRC-16; Payload in flight at word %0d/478 at stop",
                     rx_hdr_crc_pass_cnt, last_hdr_done_txfn, last_hdr_done_type_str, grp7_cdc4_pld_clk_cnt);
        end
        $display(" 6. MGMT 5000 km Ranging (All Evts): Last=0x%016X (ValidEvents=%0d, RangeMismatches=%0d; Note: replay MGMT events emitted without suppression)",
                 mgmt_captured_range, mgmt_valid_event_cnt, mgmt_range_mismatch_cnt);
        $display(" 7. Reassembly Diagnostic Check    : %0d / %0d Packets (502W = 2008B/pkt) | Matched=%0d Words (%0dB MAC) | Errors=%0d",
                 reasm_pkt_502_cnt, TARGET_JUMBO_PKTS, scb_matched_words, scb_matched_words * 4, scb_error_words);
        $display(" 8. PC 2 XGMII Egress Verification : %0d / %0d Packets (/S/..500W../T/+3Idle) | Matched=%0d / %0d Words (%0dB MAC) | WordErr=%0d | CtrlErr=%0d | Min3IdleAfterT_Verified=%0d/%0d Pkts | Pkt1ToPkt2FullIdleCycles=%0d",
                 xgmii_pkt_completed_cnt, TARGET_JUMBO_PKTS, xgmii_mac_words_ok, TARGET_JUMBO_PKTS * 500,
                 xgmii_mac_words_ok * 4, xgmii_mac_word_errors, xgmii_ctrl_errors,
                 xgmii_min3_idle_verified_pkts, TARGET_JUMBO_PKTS, inter_pkt1_to_pkt2_idle_cycles);
        $display(" 9. Stimulus Marker Preservation   : ASCII Tag = \"%s\" | Stimulus FCS Marker = 0x%08X",
                 xgmii_captured_ascii, xgmii_captured_fcs);

        if (gth_link_up && rx_block_locked && rx_preamble_locked &&
            clock_freq_tolerance_ok &&
            (lpc_intra_burst_gap_cnt == 0) &&
            (seg_completed_cnt == 4) && (seg_size_mismatch_cnt == 0) &&
            (tx_idle_frame_cnt >= 1) && (rx_idle_frame_cnt >= 1) &&
            (rx_data_frame_cnt >= 4) && (rx_mgmt_frame_cnt >= 1) &&
            (mgmt_valid_event_cnt >= 1) && (mgmt_range_mismatch_cnt == 0) &&
            (mgmt_captured_range == 64'h4153_12D0_0000_0000) &&
            (rx_hdr_crc_pass_cnt >= 6) && (rx_pld_crc_pass_cnt >= 6) &&
            ((CH_ERROR_MODE != 0) || ((rx_hdr_crc_fail_cnt == 0) && (rx_pld_crc_fail_cnt == 0))) &&
            (reasm_pkt_502_cnt == TARGET_JUMBO_PKTS) &&
            (scb_matched_words == TARGET_JUMBO_PKTS * 500) && (scb_error_words == 0) &&
            (xgmii_pkt_completed_cnt == TARGET_JUMBO_PKTS) &&
            (xgmii_mac_words_ok == TARGET_JUMBO_PKTS * 500) &&
            (xgmii_mac_word_errors == 0) && (xgmii_ctrl_errors == 0) &&
            (xgmii_min3_idle_verified_pkts == TARGET_JUMBO_PKTS) &&
            (inter_pkt1_to_pkt2_idle_cycles >= 3) &&
            (xgmii_captured_ascii == "Kookmin FSO ") &&
            (xgmii_captured_fcs == 32'hDEAD_BEEF)) begin
            $display("--------------------------------------------------------------------------------");
            $display(" FINAL VERDICT: [PASS] TOP-LEVEL END-TO-END BASELINE VERIFIED (2x2000B XGMII EGRESS, 1900/100 SEGMENTS, IDLE, MGMT 5000KM & OISL CRCS)!");
        end else begin
            $fatal(1, "FINAL VERDICT: [FAIL] Top-level XGMII egress, segmentation, MGMT, IDLE, clock tolerance, or CRC verification failed!");
        end
        $display("================================================================================\n");
        $finish;
    end

endmodule