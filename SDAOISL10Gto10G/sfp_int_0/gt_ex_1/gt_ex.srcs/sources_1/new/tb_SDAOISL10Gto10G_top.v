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
  - Rev 2.7 (2026-11-06 19:40 KST) : [3-Mode Full Verification: Mode 0 Clean, Mode 1 FEC Repair, Mode 2 ARQ 5th-Retransmission & Reorder Recovery]
    Configured Mode 2 (CH_ERROR_MODE=2) with 'ARQ_HOLDOFF_TICKS = 16'd8000' and a
    simultaneous-push/pop-safe GRP2->GRP4 Frame Context FIFO gating 'injector_frame_err_en'
    at frame boundaries ('frame_start_en_d0') so only DAT2 Packet A receives the 48-word
    'error.mem' mask on Attempts 1..5 while Attempt 6 (5th Retransmission) and all other
    frames pass through a clean channel.
  - Rev 2.8 (2026-11-06 20:15 KST) : [Audit Final Freeze Refinements - Independent RX Reorder Slot Tag Readback & Mode 1 Active Injection/FEC PASS Criteria]
    1. [Auditor Point 3 Fix]: Recorded the actual RX-decoded 'grp7_rx_txfn'
       ('u_fso_ethernet_deframer.rx_txfn') and 'fso_seq' tag at the Reorder Buffer write
       stream ('rx_reorder_slot_tag_txfn[0:15]' and 'rx_reorder_slot_tag_fso_seq[0:15]')
       without referencing 'dat1_b_txfn', and loaded 'chk_reorder_slot_txfn' from
       'rx_reorder_slot_tag_txfn[dat1_b_slot_idx]' so slot identity is verified
       independently against 'dat1_b_txfn'.
    2. [Auditor Point 5 Fix]: Split Mode 0 and Mode 1 PASS criteria into
       'mode0_clean_pass_ok' (requiring 0 injected frames/words and 0 FEC repair counts)
       and 'mode1_fec_repair_pass_ok' (explicitly requiring 'total_inj_frames_with_err > 0',
       'total_inj_corrupted_words > 0', and 'grp6_rs_repaired_syms > 0' alongside 0 CRC
       failures so an inactive injector can never falsely pass Mode 1).
    3. [Auditor Points 2, 4, & 7]: Clarified console report terminology for
       'RS_DecRepairedSyms', 'LOOPBACK_ARQ_DIRECT=1 (Local RX CRC Feedback Loopback)',
       and timer configuration differences (500 cycles in Mode 0/1 vs 8,000 cycles in Mode 2).
===========================================================================
*/

module tb_SDAOISL10Gto10G_top();

    // =========================================================================
    // 1. TOP-LEVEL SIMULATION PARAMETERS
    //    - CH_ERROR_MODE = 0 : Raw / Clean Channel Baseline (ARQ_HOLDOFF_TICKS=500)
    //    - CH_ERROR_MODE = 1 : Correctable FEC Channel (max_error=18, <=8 RS syms/lane, ARQ_HOLDOFF_TICKS=500)
    //    - CH_ERROR_MODE = 2 : Uncorrectable RS on DAT2_A (Attempts 1..5) -> Recovered
    //                          by Closed-Loop ARQ & Reorder RAM on 5th Retransmission (Attempt 6, ARQ_HOLDOFF_TICKS=8000)
    // =========================================================================
    parameter SIM_MODE             = 1;     // 1 = Internal Packet Gen & XGMII Direct Mode
    parameter CH_ERROR_MODE        = 0;     // Select 0, 1, or 2
    parameter TARGET_JUMBO_PKTS    = 2;     // Number of 2000-Byte Jumbo packets to verify at PC 2 (4,000 MAC Bytes)
    parameter real GTH_REFCLK_HALF = 3.200; // [Rev 2.2] Exact 3.200 ns half-period (156.25 MHz RefClk)

    localparam LOOPBACK_ARQ_DIRECT_CFG   = 1; // 1 = Single-FPGA Optical Loopback (Local RX CRC feedback)
    // Mode-specific ARQ holdoff timer:
    // - Mode 0 & Mode 1 retain exact baseline 16'd500 ticks
    // - Mode 2 uses 16'd8000 ticks (~24.82 us > ~13.5 us loopback RTT) so every replay is causally triggered by NAK
    localparam [15:0] ACTIVE_ARQ_HOLDOFF_TICKS = (CH_ERROR_MODE == 2) ? 16'd8000 : 16'd500;

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
        .SIM_MODE            (SIM_MODE),
        .LOOPBACK_ARQ_DIRECT (LOOPBACK_ARQ_DIRECT_CFG),
        .ARQ_HOLDOFF_TICKS   (ACTIVE_ARQ_HOLDOFF_TICKS)
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
    wire        grp2_tx_trigger_gen    = u_dut.sda_encoder_inst.u_eth_fso_framer.tx_trigger_gen;
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
            2'b01:   grp2_tx_frame_str = (grp2_payload_mux_sel == 2'b11) ? "RETX" : (grp2_in_cont ? "DAT2" : "DAT1");
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
    wire         inj_frame_start_en_d0 = u_dut.sda_encoder_inst.u_error_injector.frame_start_en_d0;
    wire [15:0]  inj_last_frame_corrupted_words = u_dut.sda_encoder_inst.u_error_injector.last_frame_corrupted_words;
    wire         inj_last_frame_done_pulse      = u_dut.sda_encoder_inst.u_error_injector.last_frame_done_pulse;

    // =========================================================================
    // [Rev 2.7 & Rev 2.8] GRP2 -> GRP4 FRAME CONTEXT FIFO, PER-FRAME INJECTOR GATING,
    //                     CAUSAL NAK->REPLAY TRACKER, 478W REPLAY VERIFIER & RAM CLEANUP
    // =========================================================================
    reg [15:0] ctx_fifo_txfn      [0:127];
    reg [1:0]  ctx_fifo_ftype     [0:127];
    reg [1:0]  ctx_fifo_mux_sel   [0:127];
    reg        ctx_fifo_is_target [0:127];
    reg [3:0]  ctx_fifo_attempt   [0:127];
    reg        ctx_fifo_err_en    [0:127];

    integer    ctx_wr_ptr                     = 0;
    integer    ctx_rd_ptr                     = 0;
    integer    ctx_done_ptr                   = 0;
    integer    ctx_fifo_count                 = 0;
    integer    ctx_push_total_cnt             = 0;
    integer    ctx_pop_total_cnt              = 0;
    integer    ctx_done_total_cnt             = 0;
    integer    ctx_fifo_overflow_err          = 0;
    integer    ctx_fifo_underflow_err         = 0;

    // Dynamic DATA Segment TXFN & Target Lifecycle Trackers
    integer    new_data_seg_cnt               = 0;
    reg [15:0] dat1_a_txfn                    = 16'd0;
    reg [15:0] target_txfn                    = 16'd0; // 2nd new DATA segment (DAT2 Packet A)
    reg [15:0] dat1_b_txfn                    = 16'd0; // 3rd new DATA segment (DAT1 Packet B)
    reg [15:0] dat2_b_txfn                    = 16'd0; // 4th new DATA segment (DAT2 Packet B)
    reg        target_txfn_valid              = 1'b0;
    reg        dat1_b_txfn_valid              = 1'b0;
    reg        dat2_b_txfn_valid              = 1'b0;

    reg [1:0]  target_track_idx               = 2'd0;
    reg [3:0]  target_phys_slot               = 4'd0;
    reg [15:0] target_recorded_ram_addr       = 16'd0;
    reg        target_ram_write_verified      = 1'b0;
    integer    target_ram_read_addr_match_cnt = 0;
    integer    target_ram_addr_mismatch_cnt   = 0;
    reg        target_ram_delete_verified     = 1'b0;

    integer    target_tx_attempt_cnt          = 0; // Expected in Mode 2: 6 (1 Initial + 5 Retx)
    integer    target_retx_event_cnt          = 0; // Expected in Mode 2: 5
    integer    post_ack_target_replay_cnt     = 0; // Expected in Mode 2: 0

    // Causal NAK -> Replay Pairing Trackers (Auditor Detail 2)
    reg        target_nak_awaiting_replay     = 1'b0;
    integer    target_tx_nak_received_cnt     = 0; // Expected in Mode 2: 5
    integer    target_causal_nak_replay_pairs = 0; // Expected in Mode 2: 5
    integer    target_unpaired_replay_err     = 0; // Expected in Mode 2: 0
    integer    target_timeout_before_nak_err  = 0; // Expected in Mode 2: 0
    reg        target_tx_ack_processed        = 1'b0;
    integer    target_drop_err_cnt            = 0;

    // 478-Word Target Payload Reference & Replay Comparator
    reg [31:0] target_init_payload_mem [0:477];
    integer    target_init_words_captured     = 0;
    integer    target_cur_pld_word_idx        = 0;
    reg        capturing_target_init_pld      = 1'b0;
    reg        checking_target_replay_pld     = 1'b0;
    integer    target_replay_words_checked    = 0; // Expected in Mode 2: 5 x 478 = 2,390 words
    integer    target_replay_word_mismatches  = 0;

    // Per-Frame Injector Verification Counters across Mode 0, Mode 1, & Mode 2 (Auditor Point 5)
    reg        tb_mode2_frame_err_en          = 1'b0;
    reg [15:0] cur_inj_txfn                   = 16'd0;
    reg        cur_inj_is_target              = 1'b0;
    reg [3:0]  cur_inj_attempt                = 4'd0;
    integer    total_inj_frames_with_err      = 0; // Mode 0: 0 | Mode 1: >0 | Mode 2: 5
    integer    total_inj_corrupted_words      = 0; // Mode 0: 0 | Mode 1: >0 | Mode 2: 162
    integer    target_inj_corrupted_frames    = 0; // Expected in Mode 2: 5 (Attempts 1..5, 36 or 27 words)
    integer    target_inj_clean_retx5_ok      = 0; // Expected in Mode 2: 1 (Attempt 6, 0 corrupted words)
    integer    non_target_inj_leak_err        = 0; // Expected in Mode 2: 0

    wire       ctx_push_now = u_dut.rst_n && grp2_tx_trigger_gen;
    wire       ctx_pop_now  = u_dut.rst_n && inj_frame_start_en_d0;

    // Immediate combinational mux on frame_start_en_d0 so byte 1 of the new frame already sees its enable
    wire       next_pop_err_en            = (ctx_fifo_count > 0) ? ctx_fifo_err_en[ctx_rd_ptr] : 1'b0;
    wire       tb_mode2_frame_err_en_wire = inj_frame_start_en_d0 ? next_pop_err_en : tb_mode2_frame_err_en;

    // Apply hierarchical override ONLY in CH_ERROR_MODE == 2 to gate channel error injection per frame
    initial begin
        if (CH_ERROR_MODE == 2) begin
            force u_dut.sda_encoder_inst.injector_frame_err_en = tb_mode2_frame_err_en_wire;
        end
    end

    // Controller internal probes for causal NAK->replay pairing and RAM cleanup verification
    wire [2:0]  arq_ctrl_state          = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.state;
    wire [1:0]  arq_ctrl_target_idx     = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.target_index;
    wire [3:0]  arq_ctrl_alloc_slot     = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.alloc_phys_slot;
    wire [15:0] arq_ctrl_global_txfn    = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.global_txfn;
    wire        arq_ctrl_rx_valid       = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.rx_ack_valid_in;
    wire        arq_ctrl_rx_ack         = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.rx_ack_in;
    wire [15:0] arq_ctrl_rx_rxfn        = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.rx_rxfn_in;
    wire        arq_ctrl_ack_hit        = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.ack_hit_found;
    wire [1:0]  arq_ctrl_ack_hit_idx    = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.ack_hit_index;
    wire        arq_ctrl_drop_del_req   = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.drop_del_req;
    wire [1:0]  arq_ctrl_drop_idx       = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.drop_index;
    wire        arq_ctrl_timer_tick_en  = u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.timer_tick_en;

    reg         push_is_target_tmp;
    reg  [3:0]  push_attempt_tmp;
    reg         push_err_en_tmp;

    always @(posedge clk_tx) begin
        if (!u_dut.rst_n) begin
            ctx_wr_ptr                     <= 0;
            ctx_rd_ptr                     <= 0;
            ctx_done_ptr                   <= 0;
            ctx_fifo_count                 <= 0;
            ctx_push_total_cnt             <= 0;
            ctx_pop_total_cnt              <= 0;
            ctx_done_total_cnt             <= 0;
            ctx_fifo_overflow_err          <= 0;
            ctx_fifo_underflow_err         <= 0;
            new_data_seg_cnt               <= 0;
            dat1_a_txfn                    <= 16'd0;
            target_txfn                    <= 16'd0;
            dat1_b_txfn                    <= 16'd0;
            dat2_b_txfn                    <= 16'd0;
            target_txfn_valid              <= 1'b0;
            dat1_b_txfn_valid              <= 1'b0;
            dat2_b_txfn_valid              <= 1'b0;
            target_track_idx               <= 2'd0;
            target_phys_slot               <= 4'd0;
            target_recorded_ram_addr       <= 16'd0;
            target_ram_write_verified      <= 1'b0;
            target_ram_read_addr_match_cnt <= 0;
            target_ram_addr_mismatch_cnt   <= 0;
            target_ram_delete_verified     <= 1'b0;
            target_tx_attempt_cnt          <= 0;
            target_retx_event_cnt          <= 0;
            post_ack_target_replay_cnt     <= 0;
            target_nak_awaiting_replay     <= 1'b0;
            target_tx_nak_received_cnt     <= 0;
            target_causal_nak_replay_pairs <= 0;
            target_unpaired_replay_err     <= 0;
            target_timeout_before_nak_err  <= 0;
            target_tx_ack_processed        <= 1'b0;
            target_drop_err_cnt            <= 0;
            target_init_words_captured     <= 0;
            target_cur_pld_word_idx        <= 0;
            capturing_target_init_pld      <= 1'b0;
            checking_target_replay_pld     <= 1'b0;
            target_replay_words_checked    <= 0;
            target_replay_word_mismatches  <= 0;
            tb_mode2_frame_err_en          <= 1'b0;
            cur_inj_txfn                   <= 16'd0;
            cur_inj_is_target              <= 1'b0;
            cur_inj_attempt                <= 4'd0;
            total_inj_frames_with_err      <= 0;
            total_inj_corrupted_words      <= 0;
            target_inj_corrupted_frames    <= 0;
            target_inj_clean_retx5_ok      <= 0;
            non_target_inj_leak_err        <= 0;
        end else begin
            // 1. Record target tracker index & physical slot when S_EXEC_DATA (3'd4) fires for 2nd new DATA segment
            if ((arq_ctrl_state == 3'd4) && (new_data_seg_cnt == 1)) begin
                target_track_idx <= arq_ctrl_target_idx;
                target_phys_slot <= arq_ctrl_alloc_slot;
            end

            // 2. Check for autonomous timer expiration BEFORE NAK arrives on target tracker slot
            if ((CH_ERROR_MODE == 2) && target_txfn_valid && !target_tx_ack_processed &&
                u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_valid[target_track_idx] &&
                (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_txfn[target_track_idx] == target_txfn)) begin
                if ((u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_timer[target_track_idx] == 16'd1) &&
                    arq_ctrl_timer_tick_en &&
                    !(arq_ctrl_ack_hit && (arq_ctrl_ack_hit_idx == target_track_idx) && (arq_ctrl_rx_ack == 1'b0))) begin
                    target_timeout_before_nak_err <= target_timeout_before_nak_err + 1;
                    $display(" [%0.1f ns] [MODE2 ERROR] Target TXFN=%0d timer expired by timeout before NAK arrived!",
                             $realtime, target_txfn);
                end
            end

            // 3. Causal Pairing Step A: Capture incoming NAK or ACK for target_txfn at u_arq_tx_controller
            if (target_txfn_valid && arq_ctrl_rx_valid && arq_ctrl_ack_hit && (arq_ctrl_rx_rxfn == target_txfn)) begin
                if (arq_ctrl_rx_ack == 1'b0) begin
                    // Verify timer was still positive when NAK arrived
                    if (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_timer[arq_ctrl_ack_hit_idx] == 16'd0)
                        target_timeout_before_nak_err <= target_timeout_before_nak_err + 1;
                    if (target_nak_awaiting_replay)
                        target_unpaired_replay_err <= target_unpaired_replay_err + 1;
                    target_nak_awaiting_replay <= 1'b1;
                    target_tx_nak_received_cnt <= target_tx_nak_received_cnt + 1;
                    if (CH_ERROR_MODE == 2) begin
                        $display(" [%0.1f ns] [MODE2 TX TRACKER NAK #%0d] Target TXFN=%0d NAK processed (TimerRemaining=%0d cycles)",
                                 $realtime, target_tx_nak_received_cnt + 1, target_txfn,
                                 u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_timer[arq_ctrl_ack_hit_idx]);
                    end
                end else begin
                    // Target ACK processed! Verify it occurred on Retransmission #5 (track_retx == 5) with positive timer
                    if ((u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_retx[arq_ctrl_ack_hit_idx] == 3'd5) &&
                        (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_timer[arq_ctrl_ack_hit_idx] > 16'd0)) begin
                        target_tx_ack_processed <= 1'b1;
                    end
                    if (CH_ERROR_MODE == 2) begin
                        $display(" [%0.1f ns] [MODE2 TX TRACKER ACK] Target TXFN=%0d ACK processed on RetxCount=%0d (TimerRemaining=%0d cycles)",
                                 $realtime, target_txfn,
                                 u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_retx[arq_ctrl_ack_hit_idx],
                                 u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_timer[arq_ctrl_ack_hit_idx]);
                    end
                end
            end

            // 4. Causal Pairing Step B: Pair S_EXEC_RETX (3'd2) execution for target_txfn with preceding NAK
            if (target_txfn_valid && (arq_ctrl_state == 3'd2) &&
                (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_txfn[arq_ctrl_target_idx] == target_txfn)) begin
                if (target_nak_awaiting_replay) begin
                    target_nak_awaiting_replay     <= 1'b0;
                    target_causal_nak_replay_pairs <= target_causal_nak_replay_pairs + 1;
                end else begin
                    target_unpaired_replay_err <= target_unpaired_replay_err + 1;
                end
            end

            // 5. Verify target_txfn is never dropped due to retry exhaustion
            if (target_txfn_valid && arq_ctrl_drop_del_req &&
                (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_txfn[arq_ctrl_drop_idx] == target_txfn)) begin
                target_drop_err_cnt <= target_drop_err_cnt + 1;
            end

            // 6. Verify Actual RAM Address Mapping (Write -> 5x Read -> Delete) across Controller & Payload Wrapper
            if (u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_delete_req && target_ram_write_verified &&
                (u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_addr == target_recorded_ram_addr) &&
                u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.ddr4_delete_req &&
                (u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.ddr4_addr == target_recorded_ram_addr)) begin
                target_ram_delete_verified <= 1'b1;
                if (CH_ERROR_MODE == 2) begin
                    $display(" [%0.1f ns] [MODE2 RAM CLEANUP] Verified ddr4_delete_req for Target TXFN=%0d at RAM Addr=0x%04X",
                             $realtime, target_txfn, target_recorded_ram_addr);
                end
            end

            // 7. Context FIFO Push on 1-cycle grp2_tx_trigger_gen & Pop on 1-cycle inj_frame_start_en_d0
            push_is_target_tmp = 1'b0;
            push_attempt_tmp   = 4'd0;
            push_err_en_tmp    = (CH_ERROR_MODE == 1) ? 1'b1 : 1'b0;

            if (ctx_push_now) begin
                if (grp2_payload_mux_sel == 2'b01) begin
                    // New DATA segment transmission
                    new_data_seg_cnt <= new_data_seg_cnt + 1;
                    if (new_data_seg_cnt == 0) begin
                        dat1_a_txfn <= grp2_tx_txfn;
                        capturing_target_init_pld  <= 1'b0;
                        checking_target_replay_pld <= 1'b0;
                    end else if (new_data_seg_cnt == 1) begin
                        // 2nd new DATA segment = DAT2 Packet A (Target Frame!)
                        target_txfn               <= grp2_tx_txfn;
                        target_txfn_valid         <= 1'b1;
                        target_tx_attempt_cnt     <= 1;
                        push_is_target_tmp        = 1'b1;
                        push_attempt_tmp          = 4'd1;
                        push_err_en_tmp           = (CH_ERROR_MODE == 0) ? 1'b0 : 1'b1;
                        capturing_target_init_pld <= 1'b1;
                        checking_target_replay_pld<= 1'b0;
                        target_cur_pld_word_idx   <= 0;
                        if (u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_write_req &&
                            u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.ddr4_write_req) begin
                            target_recorded_ram_addr  <= u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_addr;
                            target_ram_write_verified <= 1'b1;
                        end
                        if (CH_ERROR_MODE == 2) begin
                            $display(" [%0.1f ns] [MODE2 TARGET SELECTED] DAT2 Packet A assigned TXFN=%0d (Attempt #1, RAM_Addr=0x%04X, InjectErr=%0b)",
                                     $realtime, grp2_tx_txfn, u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_addr, push_err_en_tmp);
                        end
                    end else if (new_data_seg_cnt == 2) begin
                        dat1_b_txfn                <= grp2_tx_txfn;
                        dat1_b_txfn_valid          <= 1'b1;
                        capturing_target_init_pld  <= 1'b0;
                        checking_target_replay_pld <= 1'b0;
                    end else if (new_data_seg_cnt == 3) begin
                        dat2_b_txfn                <= grp2_tx_txfn;
                        dat2_b_txfn_valid          <= 1'b1;
                        capturing_target_init_pld  <= 1'b0;
                        checking_target_replay_pld <= 1'b0;
                    end
                end else if ((grp2_payload_mux_sel == 2'b11) && target_txfn_valid && (grp2_tx_txfn == target_txfn)) begin
                    // Retransmission (Replay) of Target Frame (DAT2 Packet A)
                    target_tx_attempt_cnt      <= target_tx_attempt_cnt + 1;
                    target_retx_event_cnt      <= target_retx_event_cnt + 1;
                    if (target_tx_ack_processed)
                        post_ack_target_replay_cnt <= post_ack_target_replay_cnt + 1;
                    push_is_target_tmp         = 1'b1;
                    push_attempt_tmp           = target_tx_attempt_cnt[3:0] + 4'd1;
                    // Inject error on Attempts 1..5 (Initial + Retx 1..4); Clean on Attempt 6 (Retx 5)!
                    push_err_en_tmp            = (CH_ERROR_MODE == 2) ? ((target_tx_attempt_cnt + 1) <= 5) :
                                                 ((CH_ERROR_MODE == 1) ? 1'b1 : 1'b0);
                    capturing_target_init_pld  <= 1'b0;
                    checking_target_replay_pld <= 1'b1;
                    target_cur_pld_word_idx    <= 0;

                    // Verify ddr4_read_req and ddr4_addr match recorded RAM address
                    if (u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_read_req &&
                        u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.ddr4_read_req &&
                        (u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_addr == target_recorded_ram_addr) &&
                        (u_dut.sda_encoder_inst.u_eth_fso_framer.u_fso_payload_top.ddr4_addr == target_recorded_ram_addr)) begin
                        target_ram_read_addr_match_cnt <= target_ram_read_addr_match_cnt + 1;
                    end else begin
                        target_ram_addr_mismatch_cnt <= target_ram_addr_mismatch_cnt + 1;
                    end
                    if (CH_ERROR_MODE == 2) begin
                        $display(" [%0.1f ns] [MODE2 TARGET REPLAY #%0d] TXFN=%0d (Attempt #%0d, RAM_Addr=0x%04X, InjectErr=%0b)",
                                 $realtime, target_retx_event_cnt + 1, grp2_tx_txfn, target_tx_attempt_cnt + 1,
                                 u_dut.sda_encoder_inst.u_eth_fso_framer.ddr4_addr, push_err_en_tmp);
                    end
                end else begin
                    capturing_target_init_pld  <= 1'b0;
                    checking_target_replay_pld <= 1'b0;
                end

                // Write frame context entry into FIFO
                ctx_fifo_txfn[ctx_wr_ptr]      <= grp2_tx_txfn;
                ctx_fifo_ftype[ctx_wr_ptr]     <= grp2_tx_frame_type;
                ctx_fifo_mux_sel[ctx_wr_ptr]   <= grp2_payload_mux_sel;
                ctx_fifo_is_target[ctx_wr_ptr] <= push_is_target_tmp;
                ctx_fifo_attempt[ctx_wr_ptr]   <= push_attempt_tmp;
                ctx_fifo_err_en[ctx_wr_ptr]    <= push_err_en_tmp;
                ctx_wr_ptr                     <= (ctx_wr_ptr + 1) % 128;
                ctx_push_total_cnt             <= ctx_push_total_cnt + 1;
            end

            if (ctx_pop_now) begin
                tb_mode2_frame_err_en <= next_pop_err_en;
                cur_inj_txfn          <= (ctx_fifo_count > 0) ? ctx_fifo_txfn[ctx_rd_ptr]      : 16'd0;
                cur_inj_is_target     <= (ctx_fifo_count > 0) ? ctx_fifo_is_target[ctx_rd_ptr] : 1'b0;
                cur_inj_attempt       <= (ctx_fifo_count > 0) ? ctx_fifo_attempt[ctx_rd_ptr]   : 4'd0;
                ctx_rd_ptr            <= (ctx_rd_ptr + 1) % 128;
                ctx_pop_total_cnt     <= ctx_pop_total_cnt + 1;
            end

            // Simultaneous Push & Pop Safe Count Update
            if (ctx_push_now && !ctx_pop_now) begin
                if (ctx_fifo_count >= 128) ctx_fifo_overflow_err <= ctx_fifo_overflow_err + 1;
                ctx_fifo_count <= ctx_fifo_count + 1;
            end else if (!ctx_push_now && ctx_pop_now) begin
                if (ctx_fifo_count == 0) ctx_fifo_underflow_err <= ctx_fifo_underflow_err + 1;
                ctx_fifo_count <= ctx_fifo_count - 1;
            end else if (ctx_push_now && ctx_pop_now) begin
                if (ctx_fifo_count == 0) ctx_fifo_underflow_err <= ctx_fifo_underflow_err + 1;
                // ctx_fifo_count unchanged on simultaneous push & pop
            end

            // 8. Verify 478-word payload equality across all 5 target replays at GRP2
            if (grp2_pld_valid) begin
                if (capturing_target_init_pld) begin
                    if (target_cur_pld_word_idx < 478) begin
                        target_init_payload_mem[target_cur_pld_word_idx] <= grp2_pld_data;
                        target_init_words_captured <= target_init_words_captured + 1;
                    end
                    target_cur_pld_word_idx <= target_cur_pld_word_idx + 1;
                    if (grp2_pld_last) capturing_target_init_pld <= 1'b0;
                end else if (checking_target_replay_pld) begin
                    if (target_cur_pld_word_idx < 478) begin
                        if (grp2_pld_data !== target_init_payload_mem[target_cur_pld_word_idx])
                            target_replay_word_mismatches <= target_replay_word_mismatches + 1;
                        target_replay_words_checked <= target_replay_words_checked + 1;
                    end
                    target_cur_pld_word_idx <= target_cur_pld_word_idx + 1;
                    if (grp2_pld_last) checking_target_replay_pld <= 1'b0;
                end
            end

            // 9. Verify completed frame's corrupted_word_cnt snapshot on inj_last_frame_done_pulse
            //    Across all modes (Auditor Point 5), accumulate total_inj_frames_with_err and
            //    total_inj_corrupted_words so Mode 0 proves 0 injections and Mode 1 proves active injections.
            if (inj_last_frame_done_pulse) begin
                if (inj_last_frame_corrupted_words > 16'd0) begin
                    total_inj_frames_with_err <= total_inj_frames_with_err + 1;
                    total_inj_corrupted_words <= total_inj_corrupted_words + inj_last_frame_corrupted_words;
                end
                if (CH_ERROR_MODE == 2) begin
                    if (ctx_fifo_is_target[ctx_done_ptr]) begin
                        if (ctx_fifo_attempt[ctx_done_ptr] <= 4'd5) begin
                            if ((inj_last_frame_corrupted_words == 16'd36) ||
                                (inj_last_frame_corrupted_words == 16'd27))
                                target_inj_corrupted_frames <= target_inj_corrupted_frames + 1;
                        end else if (ctx_fifo_attempt[ctx_done_ptr] == 4'd6) begin
                            if (inj_last_frame_corrupted_words == 16'd0)
                                target_inj_clean_retx5_ok <= target_inj_clean_retx5_ok + 1;
                        end
                    end else begin
                        if (inj_last_frame_corrupted_words != 16'd0)
                            non_target_inj_leak_err <= non_target_inj_leak_err + 1;
                    end
                end
                ctx_done_ptr       <= (ctx_done_ptr + 1) % 128;
                ctx_done_total_cnt <= ctx_done_total_cnt + 1;
            end
        end
    end

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
    wire         grp7_deframed_ready   = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.m_axis_fso_tready;
    wire [31:0]  grp7_deframed_data    = u_dut.sda_decoder_inst.deframed_data_tdata;
    wire         grp7_deframed_last    = u_dut.sda_decoder_inst.deframed_data_tlast;

    // Proven Reorder Buffer internal probes (identical to Rev 2.7)
    wire         rx_reorder_in_tvalid  = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.s_axis_data_tvalid;
    wire [31:0]  rx_reorder_in_tdata   = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.s_axis_data_tdata;
    wire [15:0]  rx_reorder_slot_valid = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.slot_valid;
    wire [15:0]  rx_reorder_exp_txfn   = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.expected_txfn;
    wire [15:0]  rx_reorder_ooo_cnt    = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.out_of_order_buffered_cnt;
    wire [15:0]  rx_reorder_in_ord_cnt = u_dut.sda_decoder_inst.u_fso_ethernet_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.in_order_drained_cnt;

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

    // Event-Driven OISL CRC, MGMT & Mode 2 Target/Reorder Checkpoint Trackers
    integer      rx_hdr_crc_pass_cnt         = 0;
    integer      rx_hdr_crc_fail_cnt         = 0;
    integer      rx_pld_crc_pass_cnt         = 0;
    integer      rx_pld_crc_fail_cnt         = 0;
    integer      rx_idle_frame_cnt           = 0;
    integer      rx_data_frame_cnt           = 0;
    integer      rx_mgmt_frame_cnt           = 0;
    integer      mgmt_valid_event_cnt        = 0;
    integer      mgmt_range_mismatch_cnt     = 0;
    reg  [63:0]  mgmt_captured_range         = 64'd0;
    reg  [15:0]  last_hdr_done_txfn          = 16'd0;
    reg  [31:0]  last_hdr_done_type_str      = "NONE";

    // [Rev 2.8 - Auditor Point 3 Fix]: Independent RX-Side Per-Slot Tag Table (0..15)
    // Records the RX-decoded 'grp7_rx_txfn' (from u_fso_ethernet_deframer.rx_txfn),
    // 'fso_seq', and word count written into each Reorder RAM slot [0..15] without
    // referencing 'dat1_b_txfn'.
    reg  [15:0]  cur_rx_reorder_wr_txfn      = 16'd0;
    reg  [15:0]  rx_reorder_slot_tag_txfn    [0:15];
    reg  [9:0]   rx_reorder_slot_tag_fso_seq [0:15];
    reg  [9:0]   rx_reorder_slot_word_cnt    [0:15];
    integer      s_idx;

    // Mode 2 Target RX CRC & Reorder Checkpoint State (Auditor Detail 1 & Point 3)
    integer      target_rx_crc_fail_cnt      = 0; // Expected in Mode 2: 5
    reg          target_retx5_rx_crc_passed  = 1'b0;
    reg          dat1_b_rx_crc_passed        = 1'b0;
    reg          dat1_b_wait_slot_active     = 1'b0;
    integer      dat1_b_wait_cycles          = 0;
    integer      reorder_chk_timeout_err     = 0;
    reg          reorder_chk_captured        = 1'b0;
    reg          chk_reorder_slot_valid_bit  = 1'b0;
    reg  [15:0]  chk_reorder_slot_txfn       = 16'd0;
    reg  [9:0]   chk_reorder_slot_fso_seq    = 10'd0;
    reg  [9:0]   chk_reorder_slot_words      = 10'd0;
    integer      chk_reorder_ooo_cnt         = 0;
    reg  [15:0]  chk_reorder_expected_txfn   = 16'd0;
    integer      chk_defr_words_before_rec   = 0;
    integer      chk_reasm_pkts_before_rec   = 0;
    integer      pre_recovery_leakage_err    = 0;
    integer      defr_data_words_to_reasm_cnt= 0; // Expected: 4 x 477 = 1,908 words
    integer      defr_drained_seg_cnt        = 0; // Expected: 4 segments
    reg  [9:0]   defr_drained_fso_seq [0:3];

    // Forward declaration of reasm_pkt_502_cnt for pre-recovery check
    integer      reasm_pkt_502_cnt           = 0;

    wire [3:0]   dat1_b_slot_idx        = dat1_b_txfn[3:0];
    wire         dat1_b_in_reorder_slot = dat1_b_txfn_valid &&
                                          (rx_reorder_slot_valid[dat1_b_slot_idx] === 1'b1) &&
                                          (rx_reorder_slot_word_cnt[dat1_b_slot_idx] == 10'd477);

    always @(posedge clk_rx) begin
        if (!u_dut.rst_n) begin
            grp7_defr_clk_cnt            <= 9'd0;
            grp7_defr_byte_cnt           <= 12'd0;
            rx_hdr_crc_pass_cnt          <= 0;
            rx_hdr_crc_fail_cnt          <= 0;
            rx_pld_crc_pass_cnt          <= 0;
            rx_pld_crc_fail_cnt          <= 0;
            rx_idle_frame_cnt            <= 0;
            rx_data_frame_cnt            <= 0;
            rx_mgmt_frame_cnt            <= 0;
            mgmt_valid_event_cnt         <= 0;
            mgmt_range_mismatch_cnt      <= 0;
            mgmt_captured_range          <= 64'd0;
            last_hdr_done_txfn           <= 16'd0;
            last_hdr_done_type_str       <= "NONE";
            cur_rx_reorder_wr_txfn       <= 16'd0;
            target_rx_crc_fail_cnt       <= 0;
            target_retx5_rx_crc_passed   <= 1'b0;
            dat1_b_rx_crc_passed         <= 1'b0;
            dat1_b_wait_slot_active      <= 1'b0;
            dat1_b_wait_cycles           <= 0;
            reorder_chk_timeout_err      <= 0;
            reorder_chk_captured         <= 1'b0;
            chk_reorder_slot_valid_bit   <= 1'b0;
            chk_reorder_slot_txfn        <= 16'd0;
            chk_reorder_slot_fso_seq     <= 10'd0;
            chk_reorder_slot_words       <= 10'd0;
            chk_reorder_ooo_cnt          <= 0;
            chk_reorder_expected_txfn    <= 16'd0;
            chk_defr_words_before_rec    <= 0;
            chk_reasm_pkts_before_rec    <= 0;
            pre_recovery_leakage_err     <= 0;
            defr_data_words_to_reasm_cnt <= 0;
            defr_drained_seg_cnt         <= 0;
            for (s_idx = 0; s_idx < 16; s_idx = s_idx + 1) begin
                rx_reorder_slot_tag_txfn[s_idx]    <= 16'd0;
                rx_reorder_slot_tag_fso_seq[s_idx] <= 10'd0;
                rx_reorder_slot_word_cnt[s_idx]    <= 10'd0;
            end
        end else begin
            if (grp7_deframed_valid && grp7_deframed_ready) begin
                if ((defr_data_words_to_reasm_cnt % 477) == 0) begin
                    grp7_defr_clk_cnt  <= 9'd1;
                    grp7_defr_byte_cnt <= 12'd4;
                    if (defr_drained_seg_cnt < 4)
                        defr_drained_fso_seq[defr_drained_seg_cnt] <= grp7_deframed_data[23:14];
                end else begin
                    grp7_defr_clk_cnt  <= grp7_defr_clk_cnt + 9'd1;
                    grp7_defr_byte_cnt <= grp7_defr_byte_cnt + 12'd4;
                end
                if (grp7_deframed_last)
                    defr_drained_seg_cnt <= defr_drained_seg_cnt + 1;
                defr_data_words_to_reasm_cnt <= defr_data_words_to_reasm_cnt + 1;
            end else if (!grp7_deframed_valid) begin
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
                        2'b01: begin
                            rx_data_frame_cnt <= rx_data_frame_cnt + 1;
                            // Latch the RX-decoded TXFN for the verified DATA stream entering u_arq_rx_reorder
                            cur_rx_reorder_wr_txfn                      <= grp7_rx_txfn;
                            rx_reorder_slot_word_cnt[grp7_rx_txfn[3:0]] <= 10'd0;
                        end
                        2'b10: rx_mgmt_frame_cnt <= rx_mgmt_frame_cnt + 1;
                    endcase

                    if (target_txfn_valid && (grp7_rx_txfn == target_txfn)) begin
                        target_retx5_rx_crc_passed <= 1'b1;
                    end
                    if ((CH_ERROR_MODE == 2) && dat1_b_txfn_valid && (grp7_rx_txfn == dat1_b_txfn) && !reorder_chk_captured) begin
                        dat1_b_rx_crc_passed    <= 1'b1;
                        dat1_b_wait_slot_active <= 1'b1;
                        dat1_b_wait_cycles      <= 0;
                    end
                end else begin
                    rx_pld_crc_fail_cnt <= rx_pld_crc_fail_cnt + 1;
                    if (target_txfn_valid && (grp7_rx_txfn == target_txfn)) begin
                        target_rx_crc_fail_cnt <= target_rx_crc_fail_cnt + 1;
                    end
                end
            end

            // [Rev 2.8 - Auditor Point 3 Fix]: Record actual RX-decoded slot tag (cur_rx_reorder_wr_txfn)
            // and fso_seq as words stream into u_arq_rx_reorder on rx_reorder_in_tvalid
            if (rx_reorder_in_tvalid) begin
                if (rx_reorder_slot_word_cnt[cur_rx_reorder_wr_txfn[3:0]] == 10'd0) begin
                    rx_reorder_slot_tag_txfn[cur_rx_reorder_wr_txfn[3:0]]    <= cur_rx_reorder_wr_txfn;
                    rx_reorder_slot_tag_fso_seq[cur_rx_reorder_wr_txfn[3:0]] <= rx_reorder_in_tdata[23:14];
                end
                rx_reorder_slot_word_cnt[cur_rx_reorder_wr_txfn[3:0]] <= rx_reorder_slot_word_cnt[cur_rx_reorder_wr_txfn[3:0]] + 10'd1;
            end

            // [Auditor Detail 1 & Point 3]: Wait for DAT1_B to finish writing into Reorder RAM (<=600 cycles after pld_check_done)
            // and snapshot the independently recorded RX slot tag from rx_reorder_slot_tag_txfn[dat1_b_slot_idx]!
            if (dat1_b_wait_slot_active) begin
                if (dat1_b_in_reorder_slot) begin
                    dat1_b_wait_slot_active    <= 1'b0;
                    reorder_chk_captured       <= 1'b1;
                    chk_reorder_slot_valid_bit <= rx_reorder_slot_valid[dat1_b_slot_idx];
                    chk_reorder_slot_txfn      <= rx_reorder_slot_tag_txfn[dat1_b_slot_idx];
                    chk_reorder_slot_fso_seq   <= rx_reorder_slot_tag_fso_seq[dat1_b_slot_idx];
                    chk_reorder_slot_words     <= rx_reorder_slot_word_cnt[dat1_b_slot_idx];
                    chk_reorder_ooo_cnt        <= rx_reorder_ooo_cnt;
                    chk_reorder_expected_txfn  <= rx_reorder_exp_txfn;
                    chk_defr_words_before_rec  <= defr_data_words_to_reasm_cnt;
                    chk_reasm_pkts_before_rec  <= reasm_pkt_502_cnt;
                    $display(" [%0.1f ns] [MODE2 REORDER CHECKPOINT] Slot[%0d] Valid=%0b | RecordedSlotTXFN=%0d (Exp:%0d), SlotFsoSeq=%0d, Words=%0d | ExpectedTXFN=%0d | WordsToReasm=%0d (Exp:477) | PktsOut=%0d",
                             $realtime, dat1_b_slot_idx, rx_reorder_slot_valid[dat1_b_slot_idx],
                             rx_reorder_slot_tag_txfn[dat1_b_slot_idx], dat1_b_txfn,
                             rx_reorder_slot_tag_fso_seq[dat1_b_slot_idx], rx_reorder_slot_word_cnt[dat1_b_slot_idx],
                             rx_reorder_exp_txfn, defr_data_words_to_reasm_cnt, reasm_pkt_502_cnt);
                end else if (dat1_b_wait_cycles >= 600) begin
                    dat1_b_wait_slot_active <= 1'b0;
                    reorder_chk_timeout_err <= reorder_chk_timeout_err + 1;
                end else begin
                    dat1_b_wait_cycles <= dat1_b_wait_cycles + 1;
                end
            end

            // Continuous pre-recovery leakage guard while DAT2_A (target_txfn) has not yet passed CRC-32
            if ((CH_ERROR_MODE == 2) && target_txfn_valid && !target_retx5_rx_crc_passed) begin
                if ((defr_data_words_to_reasm_cnt > 477) || (reasm_pkt_502_cnt > 0))
                    pre_recovery_leakage_err <= pre_recovery_leakage_err + 1;
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
    // 7. MAIN SIMULATION SEQUENCE & FINAL ETRI SCOREBOARD REPORT (REV 2.8)
    // =========================================================================
    reg clock_freq_tolerance_ok;
    reg mode0_clean_pass_ok;
    reg mode1_fec_repair_pass_ok;
    reg mode2_arq_recovery_pass_ok;
    reg active_mode_pass_ok;

    initial begin
        $display("\n================================================================================");
        $display(" STARTING SDAOISL10Gto10G_top FULL END-TO-END SIMULATION (PC 1 -> FPGA -> PC 2)");
        $display(" -> SIM_MODE            : %0d (Internal 2000B Jumbo Traffic Generator)", SIM_MODE);
        $display(" -> CH_ERROR_MODE       : %0d (0=Clean Baseline, 1=FEC Repair max_error=18, 2=ARQ 5th-Retx Recovery on DAT2_A)", CH_ERROR_MODE);
        $display(" -> LOOPBACK_ARQ_DIRECT : %0d (1=Local RX CRC Feedback Loopback)", LOOPBACK_ARQ_DIRECT_CFG);
        $display(" -> ARQ_HOLDOFF_TICKS   : %0d clk_tx cycles (Mode 0/1 Baseline=500, Mode 2 NAK-Driven=8000)", ACTIVE_ARQ_HOLDOFF_TICKS);
        $display(" -> TARGET_JUMBO_PKTS   : %0d Packets (2 x 2,000B = 4,000 MAC Bytes / 1,000 Words)", TARGET_JUMBO_PKTS);
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

        if (CH_ERROR_MODE == 2) begin
            // Wait until Attempt 6 ACK and ddr4_delete_req cleanup complete, then observe for 1 full holdoff interval (8,500 clk_tx cycles)
            wait(target_tx_ack_processed && target_ram_delete_verified);
            repeat (8500) @(posedge clk_tx);
        end else begin
            // Preserve exact 50-cycle post-completion window for Mode 0 & Mode 1 baseline
            repeat (50) @(posedge clk_rx);
        end

        // Verify measured clock periods against IP configuration tolerances:
        // - tx0_clk & rx0_clk : 322.265625 MHz -> 3.103 ns +/- 0.010 ns
        // - clk_logic         : 200.000000 MHz -> 5.000 ns +/- 0.010 ns
        clock_freq_tolerance_ok = tx0_clk_sampled && rx0_clk_sampled && clk_200m_sampled &&
                                  (measured_tx0_period_ns  >= 3.093 && measured_tx0_period_ns  <= 3.113) &&
                                  (measured_rx0_period_ns  >= 3.093 && measured_rx0_period_ns  <= 3.113) &&
                                  (measured_200m_period_ns >= 4.990 && measured_200m_period_ns <= 5.010);

        // [Rev 2.8 - Auditor Point 5 Fix]: Separate Mode 0 vs Mode 1 PASS criteria
        mode0_clean_pass_ok      = (rx_hdr_crc_fail_cnt       == 0)     &&
                                   (rx_pld_crc_fail_cnt       == 0)     &&
                                   (total_inj_frames_with_err == 0)     &&
                                   (total_inj_corrupted_words == 0)     &&
                                   (grp6_lpc_repaired_bits    == 16'd0) &&
                                   (grp6_rs_repaired_syms     == 12'd0);

        mode1_fec_repair_pass_ok = (rx_hdr_crc_fail_cnt       == 0)     &&
                                   (rx_pld_crc_fail_cnt       == 0)     &&
                                   (total_inj_frames_with_err >  0)     &&
                                   (total_inj_corrupted_words >  0)     &&
                                   (grp6_rs_repaired_syms     >  12'd0);

        mode2_arq_recovery_pass_ok = target_txfn_valid && dat1_b_txfn_valid && dat2_b_txfn_valid &&
                                     (rx_hdr_crc_fail_cnt             == 0)      &&
                                     (rx_pld_crc_fail_cnt             == 5)      &&
                                     (target_rx_crc_fail_cnt          == 5)      &&
                                     (target_tx_attempt_cnt           == 6)      &&
                                     (target_retx_event_cnt           == 5)      &&
                                     (target_tx_nak_received_cnt      == 5)      &&
                                     (target_causal_nak_replay_pairs  == 5)      &&
                                     (target_nak_awaiting_replay      == 1'b0)   &&
                                     (target_unpaired_replay_err      == 0)      &&
                                     (target_timeout_before_nak_err   == 0)      &&
                                     (target_init_words_captured      == 478)    &&
                                     (target_replay_words_checked     == 2390)   &&
                                     (target_replay_word_mismatches   == 0)      &&
                                     (target_inj_corrupted_frames     == 5)      &&
                                     (target_inj_clean_retx5_ok       == 1)      &&
                                     (non_target_inj_leak_err         == 0)      &&
                                     (ctx_fifo_overflow_err           == 0)      &&
                                     (ctx_fifo_underflow_err          == 0)      &&
                                     (reorder_chk_captured            == 1'b1)   &&
                                     (reorder_chk_timeout_err         == 0)      &&
                                     (chk_reorder_slot_valid_bit      == 1'b1)   &&
                                     (chk_reorder_slot_txfn           == dat1_b_txfn) &&
                                     (chk_reorder_slot_fso_seq        == 10'd2)  &&
                                     (chk_reorder_slot_words          == 10'd477)&&
                                     (chk_reorder_ooo_cnt             >= 1)      &&
                                     (chk_reorder_expected_txfn       == target_txfn) &&
                                     (chk_defr_words_before_rec       == 477)    &&
                                     (chk_reasm_pkts_before_rec       == 0)      &&
                                     (pre_recovery_leakage_err        == 0)      &&
                                     (defr_drained_seg_cnt            == 4)      &&
                                     (defr_data_words_to_reasm_cnt    == 1908)   &&
                                     (defr_drained_fso_seq[0]         == 10'd0)  &&
                                     (defr_drained_fso_seq[1]         == 10'd1)  &&
                                     (defr_drained_fso_seq[2]         == 10'd2)  &&
                                     (defr_drained_fso_seq[3]         == 10'd3)  &&
                                     (target_retx5_rx_crc_passed      == 1'b1)   &&
                                     (target_tx_ack_processed         == 1'b1)   &&
                                     (target_ram_write_verified       == 1'b1)   &&
                                     (target_ram_read_addr_match_cnt  == 5)      &&
                                     (target_ram_addr_mismatch_cnt    == 0)      &&
                                     (target_ram_delete_verified      == 1'b1)   &&
                                     (target_drop_err_cnt             == 0)      &&
                                     (post_ack_target_replay_cnt      == 0)      &&
                                     (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.track_valid[target_track_idx] == 1'b0) &&
                                     (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.slot_busy_bitmap[target_phys_slot] == 1'b0) &&
                                     (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.slot_del_pending[target_phys_slot] == 1'b0) &&
                                     (u_dut.sda_encoder_inst.u_eth_fso_framer.u_arq_tx_controller.del_q_cnt == 5'd0) &&
                                     (rx_reorder_slot_valid           == 16'd0);

        active_mode_pass_ok = (CH_ERROR_MODE == 2) ? mode2_arq_recovery_pass_ok :
                              ((CH_ERROR_MODE == 1) ? mode1_fec_repair_pass_ok : mode0_clean_pass_ok);

        $display("\n================================================================================");
        $display(" SDAOISL10Gto10G_top END-TO-END VERIFICATION REPORT (SDA OISL v2.1.2 - REV 2.8)");
        $display("================================================================================");
        $display(" 1. Measured Top-Level Clocks      : tx0_clk = %0.6f MHz (%0.3f ns) | rx0_clk = %0.6f MHz (%0.3f ns) | clk_logic = %0.6f MHz (%0.3f ns) [IP_Tol_OK=%0b]",
                 measured_tx0_mhz, measured_tx0_period_ns, measured_rx0_mhz, measured_rx0_period_ns, measured_200m_mhz, measured_200m_period_ns, clock_freq_tolerance_ok);
        $display(" 2. Optical Link & Preamble Status : gth_link_up=%0b | rx_block_locked=%0b | Preamble=0x%018X (Locked=%0b) | LoopbackDirect=%0d",
                 gth_link_up, rx_block_locked, grp6_rx_preamble_72b, rx_preamble_locked, LOOPBACK_ARQ_DIRECT_CFG);
        $display(" 3. RX GTH Pause & LPC Burst Check : rx_fso_valid_out Words=%0d (PauseEvents=%0d, PauseCycles=%0d) | LPC 259W Bursts=%0d (IntraBurstGaps=%0d)",
                 rx_fso_valid_words_total, rx_fso_valid_pause_events, rx_fso_valid_pause_cycles, lpc_completed_bursts, lpc_intra_burst_gap_cnt);
        $display(" 4. Ingress Segmentation (14-bit)  : Segments=%0d [Seg0..3 = %0dB, %0dB, %0dB, %0dB] (Expected: 1900, 100, 1900, 100 | Mismatches=%0d)",
                 seg_completed_cnt, seg_observed_bytes[0], seg_observed_bytes[1], seg_observed_bytes[2], seg_observed_bytes[3], seg_size_mismatch_cnt);
        $display(" 5. Frame Types & Event-Driven CRC : TX[IDLE=%0d, DATA=%0d, MGMT=%0d] | RX[IDLE=%0d, DATA=%0d, MGMT=%0d] | HdrCRC Pass=%0d (Fail=%0d) | PldCRC Pass=%0d (Fail=%0d) [HoldoffTicks=%0d]",
                 tx_idle_frame_cnt, tx_data_frame_cnt, tx_mgmt_frame_cnt,
                 rx_idle_frame_cnt, rx_data_frame_cnt, rx_mgmt_frame_cnt,
                 rx_hdr_crc_pass_cnt, rx_hdr_crc_fail_cnt, rx_pld_crc_pass_cnt, rx_pld_crc_fail_cnt, ACTIVE_ARQ_HOLDOFF_TICKS);
        if (rx_hdr_crc_pass_cnt > (rx_pld_crc_pass_cnt + rx_pld_crc_fail_cnt)) begin
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
        if (CH_ERROR_MODE == 2) begin
            $display("10. Channel Error & FEC Telemetry  : CH_ERROR_MODE=%0d | InjFrames=%0d (InjWords=%0d) | LPC_DecRepairedBits=%0d | RS_DecRepairedSyms=%0d | TargetInj=%0d/5 (CleanRetx5=%0d/1, Leak=%0d) | CtxFIFO Push=%0d, Pop=%0d (Ovfl=%0d, Udfl=%0d)",
                     CH_ERROR_MODE, total_inj_frames_with_err, total_inj_corrupted_words,
                     grp6_lpc_repaired_bits, grp6_rs_repaired_syms,
                     target_inj_corrupted_frames, target_inj_clean_retx5_ok, non_target_inj_leak_err,
                     ctx_push_total_cnt, ctx_pop_total_cnt, ctx_fifo_overflow_err, ctx_fifo_underflow_err);
            $display("11. Mode 2 Target ARQ & Replay     : TargetTXFN=%0d (DAT2_A) | Attempts=%0d (Init+5Retx) | CausalNAK->ReplayPairs=%0d/5 (TimeoutErr=%0d, UnpairedErr=%0d) | ReplayWords=%0d/2390 (Mismatch=%0d)",
                     target_txfn, target_tx_attempt_cnt, target_causal_nak_replay_pairs,
                     target_timeout_before_nak_err, target_unpaired_replay_err,
                     target_replay_words_checked, target_replay_word_mismatches);
            $display("12. Mode 2 Reorder & RAM Cleanup   : Slot[%0d] Valid=%0b (RecordedSlotTXFN=%0d vs ExpDAT1_B=%0d, SlotFsoSeq=%0d, SlotWords=%0d) while ExpTXFN=%0d & ReasmIn=%0dW (LeakErr=%0d) | RAM_Addr=0x%04X (Wr=%0b, RdMatch=%0d/5, Del=%0b, DropErr=%0d, PostAckReplay=%0d)",
                     dat1_b_slot_idx, chk_reorder_slot_valid_bit, chk_reorder_slot_txfn, dat1_b_txfn,
                     chk_reorder_slot_fso_seq, chk_reorder_slot_words,
                     chk_reorder_expected_txfn, chk_defr_words_before_rec, pre_recovery_leakage_err,
                     target_recorded_ram_addr, target_ram_write_verified, target_ram_read_addr_match_cnt,
                     target_ram_delete_verified, target_drop_err_cnt, post_ack_target_replay_cnt);
        end else begin
            $display("10. Channel Error & FEC Telemetry  : CH_ERROR_MODE=%0d | InjFrames=%0d (InjWords=%0d) | LPC_DecRepairedBits=%0d | RS_DecRepairedSyms=%0d | CtxFIFO Push=%0d, Pop=%0d (Ovfl=%0d, Udfl=%0d)",
                     CH_ERROR_MODE, total_inj_frames_with_err, total_inj_corrupted_words,
                     grp6_lpc_repaired_bits, grp6_rs_repaired_syms,
                     ctx_push_total_cnt, ctx_pop_total_cnt, ctx_fifo_overflow_err, ctx_fifo_underflow_err);
        end

        if (gth_link_up && rx_block_locked && rx_preamble_locked &&
            clock_freq_tolerance_ok &&
            (lpc_intra_burst_gap_cnt == 0) &&
            (seg_completed_cnt == 4) && (seg_size_mismatch_cnt == 0) &&
            (tx_idle_frame_cnt >= 1) && (rx_idle_frame_cnt >= 1) &&
            (rx_data_frame_cnt >= 4) && (rx_mgmt_frame_cnt >= 1) &&
            (mgmt_valid_event_cnt >= 1) && (mgmt_range_mismatch_cnt == 0) &&
            (mgmt_captured_range == 64'h4153_12D0_0000_0000) &&
            (rx_hdr_crc_pass_cnt >= 6) && (rx_pld_crc_pass_cnt >= 6) &&
            active_mode_pass_ok &&
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
            $display(" FINAL VERDICT: [PASS] TOP-LEVEL END-TO-END VERIFIED (CH_ERROR_MODE=%0d, 2x2000B XGMII EGRESS, 1900/100 SEGMENTS, IDLE, MGMT 5000KM & OISL CRCS)!", CH_ERROR_MODE);
        end else begin
            $display(" [DIAGNOSTIC FAIL BREAKDOWN] active_mode_ok=%0b (m0=%0b, m1=%0b, m2=%0b) | inj_frames=%0d | inj_words=%0d | slot_txfn=%0d (exp %0d)",
                     active_mode_pass_ok, mode0_clean_pass_ok, mode1_fec_repair_pass_ok, mode2_arq_recovery_pass_ok,
                     total_inj_frames_with_err, total_inj_corrupted_words, chk_reorder_slot_txfn, dat1_b_txfn);
            $fatal(1, "FINAL VERDICT: [FAIL] Top-level XGMII egress, segmentation, MGMT, IDLE, clock tolerance, CRC, or Mode 2 ARQ recovery verification failed!");
        end
        $display("================================================================================\n");
        $finish;
    end

endmodule