`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Comprehensive Verification Testbench for FEC Subsystem.
               Includes RS Encoders and the FEC_MUX integration, upgraded to 
               a full End-to-End Pipeline Verification from CDC 1 to CDC 4.

               Verification Objectives:
               1. Prove RS Parity Generation: Observe the 16 additional
                  parity bytes/words naturally appended to the data.
               2. Prove Mathematical Gap: Demonstrate how the 16-cycle gap 
                  between Header and Payload allows for parity computation.
               3. Prove FEC_MUX Splicing: Validate that the output of FEC_MUX
                  is exactly 259 continuous cycles (Zero-Gap) combining 
                  both Header (32B -> 4 Words) and Payload (255 Words).
               4. Prove End-to-End CDC 1 -> GTH -> CDC 4 Pipeline & RS Limit:
                  Trace the 4 standard SDA OISL frames (DAT1, DAT2, IDLE, MGMT)
                  followed by continuous filler IDLE frames ("FILL") across:
                  CDC 1 -> RS Encoder -> FEC_MUX -> Scrambler -> LPC(24,16) ->
                  Preamble + MUX Gearbox 128 -> CDC 2 -> Error Inject ->
                  GTH 64b/66b -> CDC 3 -> Demux 128 -> LPC Decoder ->
                  Descrambler -> FEC_Demux -> RS Decoder -> CDC 4.

Physical Data Geometry Validated:
               - CDC 1 In (312.5 MHz)  : Header 16B (16 clk), Payload 1912B (478 clk)
               - Input Header (RS In)  : 16 Cycles  x 1 Byte = 16 Bytes or 2 Words
               - Input Payload (RS In) : 239 Cycles x 8 Byte = 1912 Bytes or 239 Words 
               - RS Head Out           : 32 Cycles  x 1 Byte = 32 Bytes or 4 Words
               - RS Load Out           : 255 Cycles x 8 Byte = 2040 Bytes or 255 Words
               - MUX / Scrambler Out   : 259 Cycles x 8 Byte = 2072 Bytes (Continuous Out)
               - LPC(24,16) Out        : 259 Cycles x 12 Byte = 3108 Bytes
               - Gearbox 128 / CDC 2/3 : 9B Preamble + 3108B LPC = 3117 Bytes / Frame
               - RX RS Decoder Out     : Header 16B (2 Words), Payload 1912B (239 Words)
               - CDC 4 Out (312.5 MHz) : Header 16B (16 clk), Payload 1912B (478 clk)

Revision History:
  - Rev 1.0 (Initial) : 259-cycle FEC_MUX + RS(32,16) + 8xRS(255,239) geometry testbench.
  - Rev 2.0 (2026-10-27 15:04 KST) : [ETRI Audit Item 2 & Item 3 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    1. Aligned Header byte injection order with SDA OISL Table 2-10 (Page 25):
       d0 (cycle 1) = TXFN[7:0] (LSB), d1 (cycle 2) = TXFN[15:8] (MSB), and 
       d4 (cycle 5) = {4'b1111, ACK, ACK_valid, FRAME_TYPE[1:0]}.
    2. Added an independent Golden-Vector Syndrome Verifier (u_hdr_synd_chk & 
       u_pld_synd_chk_lane7) that evaluates every encoded 32-Byte Header and 
       255-Byte Payload codeword at all 16 roots alpha^(11*j) (j = 120..135) over 
       GF(2^8) primitive polynomial F(x) = x^8 + x^7 + x^2 + x + 1 (0x187) and 
       verifies that all 16 syndromes equal 128'd0!
  - Rev 3.0 (2026-11-04 00:25 KST) : [Master End-to-End CDC 1 to CDC 4 Pipeline & 3-Mode Error Injection]
    1. Integrated the complete TX-to-RX pipeline from Header/Payload Generator 
       and CDC 1 (312.5 MHz -> 200 MHz) through RS Encoder, FEC_MUX, Scrambler, 
       LPC(24,16), Preamble + MUX Gearbox 128, CDC 2 (200 MHz -> 312.5 MHz), 
       Error Injector, GTH 64b/66b MSB-First Loopback, CDC 3 (312.5 MHz -> 200 MHz), 
       Demux Preamble 128, LPC(24,16) Decoder, Descrambler, FEC_Demux, RS Decoder, 
       and CDC 4 (rx_logic_gth, 200 MHz -> 312.5 MHz).
    2. Added selectable parameter 'ERR_INJECT_MODE' (0 = Raw Bypass, 1 = Within RS 
       Capability <= 8 symbols/lane, 2 = Full 48-word error.mem > 8 symbols on Lane 2).
  - Rev 3.1 (2026-11-04 00:45 KST) : [Eliminated Non-Portable Hierarchical Probes for Original RTL]
    1. Removed hierarchical references to 'u_error_inject.applied_zone', 
       'u_error_inject.applied_mask', and 'u_cdc4.*' so the testbench elaborates 
       cleanly against the original WiComAI Lab RTL in 'gt_ex_code'.
    2. Computed 'err_inj_xor_mask' (via pre-injector vs. post-injector FIFO comparison) 
       and 'err_inj_zone_id' (Zone 1: Bytes 1..60, Zone 2: Active XOR region, 
       Zone 3: Pass-through) directly at the testbench port boundary.
- Rev 3.2 (2026-11-05 18:15 KST) : [Audit 5 Full Production Chain & Per-Codeword/Lane Oracle]
    1. Replaced all internal testbench datapath emulators ('cdc2_byte_fifo',
       'cdc3_byte_fifo', 'demux_mon_fifo', and the 200 MHz bypass scheduler) with
       the actual verified production modules:
       x_gth_logic (CDC 1, Rev 2.2) -> core_tx -> preamble_gen + mux_gearbox_128 ->
       x_logic_gth (CDC 2, Rev 2.5) -> error_inject (Rev 0.05, safe_words=15, max_error=47) ->
       gth64b66b_tx (Rev 3.4) + fso_gth_core_wrapper (Rev 2.1) + gth64b66b_rx (Rev 3.4) ->
       rx_gth_logic (CDC 3, Rev 2.5) -> core_rx (with demux_preamble_128 Rev 2.1) ->
       rx_logic_gth (CDC 4, Rev 2.3).
    2. Added explicit stage byte/word counters across the 4 target frames (64B Header +
       7,648B Payload = 7,712B Info -> 8,288B RS -> 12,432B LPC + 36B Preamble =
       12,468B Transport -> >= 12B follow-on in CDC 3 -> 64B Header + 7,648B Payload
       at CDC 4), while tagging Frames 5 & 6 as "FILL" so decoded filler frames are
       tracked separately from the 4 target frames.
    3. Implemented an independent 'error.mem' Zone Oracle (240B Zone 1, 768B Zone 2
       mask positions, 11,460B Zone 3) and three valid-aligned comparison points
       (Post-Injector vs. Post-CDC 3 transport; TX Codeword vs. RX RS Decoder Input
       per frame/lane; Pre-CDC 1 Info vs. Post-CDC 4 Output per frame/lane), enforcing
       0 output mismatches on every codeword/lane with <= 8 input symbol errors.
  - Rev 3.3 (2026-11-05 19:00 KST) : [Audit Final Freeze Closure - Checker]
    1. Fixed 'total_pld_byte_mismatches' accumulation inside the 4-byte loop using a
       blocking per-word temporary counter ('word32_byte_err_tmp') and added an
       automated cross-check ('lane_mismatch_sum_ok') verifying that the sum of
       per-lane byte mismatches across all 4 frames equals 'total_pld_byte_mismatches'.
    2. Split X/Z protocol checking into single-driver per-domain counters
       ('xz_violation_gth_cnt' and 'xz_violation_logic_cnt') that verify both control
       signals (every post-reset cycle) and active data buses (when valid is high).
    3. Expanded TX Golden-Vector Syndrome verification across ALL 8 payload lanes
       ('u_pld_synd_chk_lane[0..7]'), restricted pass counting strictly to the first
       4 target frames ('hdr_synd_frame_idx < 4' and 'pld_synd_frame_idx < 4'), and
       latched any target-frame syndrome failure permanently ('hdr_synd_target_fail_cnt'
       and 'pld_synd_target_fail_cnt') so filler frames can never mask a target failure.
    4. Added explicit per-codeword symbol completeness counters ('cw_hdr_rx_sym_cnt[0..3]'
       == 32 and 'cw_pld_rx_lane_sym_cnt[0..3][0..7]' == 255) and per-frame CDC 4 output
       completeness counters ('cdc4_hdr_frame_bytes[0..3]' == 16 and
       'cdc4_pld_frame_words[0..3]' == 478) into the PASS criteria.
    5. Standardized all console report strings to 100% English per ETRI handover
       requirements, including explicit reporting of "mismatched 32-bit payload words
       containing erroneous bytes at the CDC 4 output", minimum required (12B) vs.
       observed follow-on bytes at CDC 3, and the exact test-vector scope.
===========================================================================
*/

module tb_FEC_RS #(
    // =====================================================================
    // SELECT SIMULATION MODE HERE (0 or 1):
    //   SIM_MODE = 0 : Full-Chain Clean Mode (Bypass error.mem -> 0 mismatches required)
    //   SIM_MODE = 1 : Original 48-Word error.mem Mode (safe_words=15, max_error=47)
    // =====================================================================
    parameter integer SIM_MODE        = 0,
    parameter integer ERR_INJECT_MODE = SIM_MODE
)();

    localparam integer INJ_SIM_MODE   = (ERR_INJECT_MODE == 0) ? 0 : 1;
    localparam integer INJ_SAFE_WORDS = 15;
    localparam integer INJ_MAX_ERROR  = 47; // Always uses full 48-entry (192B) original error.mem
    localparam [11:0]  ZONE2_END_BYTE = 12'd60 + ((INJ_MAX_ERROR + 1) * 4); // Byte 252

    // =======================================================
    // 1. SYSTEM CLOCKS, GTH REFCLK (156.25 MHz) & WATCHDOG
    // =======================================================
    reg  clk;             // 200.0 MHz Baseband Logic Clock (Period: 5.0 ns)
    reg  clk_gth;         // 312.5 MHz Stream / Framer Clock (Period: 3.2 ns)
    reg  clk_100_freerun; // 100.0 MHz GTH Free-Running DRP/Reset Clock (Period: 10.0 ns)
    reg  gt_refclk_p;     // 156.25 MHz GTH Reference Clock per .xci (Period: 6.4 ns, #3.2)
    wire gt_refclk_n = ~gt_refclk_p;

    reg  sys_rst_n;       // GTH Transceiver Subsystem Reset
    reg  rst_n;           // Baseband & CDC Datapath Reset
    reg  cdc2_en;

    wire clk_logic = clk;

    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk;
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;
    end

    initial begin
        clk_100_freerun = 1'b0;
        forever #5.0 clk_100_freerun = ~clk_100_freerun;
    end

    initial begin
        gt_refclk_p = 1'b0;
        forever #3.2 gt_refclk_p = ~gt_refclk_p; // Exact 156.250000 MHz per gth_fso_64b66b.xci
    end

    initial begin
        #600000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_FEC_RS did not complete within 600 us!\n");
    end

    // Readable ASCII Mode Banner for Waveform Display
    wire [127:0] err_inj_mode_str = (INJ_SIM_MODE == 0) ? "MODE0_CLEAN_0ERR" : "MODE1_ORIG_48WRD";

    // =======================================================
    // 2. STAGE 1: UPSTREAM TEST-VECTOR GENERATOR -> PRODUCTION CDC 1 (312.5 MHz)
    //    Note: Generates deterministic SDA OISL test vectors with DAT1/DAT2/IDLE/MGMT
    //          markers and pre-assigned CRC/FCS constants to verify baseband + transport
    //          preservation and recovery. Dynamic CRC/FCS and PRBS IDLE generation are
    //          verified in the framer and top-level integration testbenches.
    // =======================================================
    // Table 2-14 LSB-Packed Telemetry Vector (5,000,000.0 m = 64'h4153_12D0_0000_0000)
    wire [255:0] mgmt_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    reg         cdc1_hdr_in_valid = 1'b0;
    reg  [7:0]  cdc1_hdr_in_data  = 8'd0;
    reg         cdc1_pld_in_valid = 1'b0;
    reg  [31:0] cdc1_pld_in_data  = 32'd0;
    wire        cdc1_ready;
    reg  [3:0]  cdc1_in_frame_id  = 4'd0; // 1=DAT1, 2=DAT2, 3=IDLE, 4=MGMT, 0=FILL
    reg  [31:0] cdc1_in_frame_str = "WAIT";

    reg  [4:0]  r_cdc1_hdr_in_clk = 5'd0;
    reg  [8:0]  r_cdc1_pld_in_clk = 9'd0;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            r_cdc1_hdr_in_clk <= 5'd0;
            r_cdc1_pld_in_clk <= 9'd0;
        end else begin
            r_cdc1_hdr_in_clk <= cdc1_hdr_in_valid ? (r_cdc1_hdr_in_clk + 5'd1) : 5'd0;
            r_cdc1_pld_in_clk <= cdc1_pld_in_valid ? (r_cdc1_pld_in_clk + 9'd1) : 9'd0;
        end
    end
    wire [4:0]  cdc1_hdr_in_clk_cnt  = cdc1_hdr_in_valid ? (r_cdc1_hdr_in_clk + 5'd1) : 5'd0;              // 1..16 Clocks
    wire [4:0]  cdc1_hdr_in_byte_cnt = cdc1_hdr_in_clk_cnt;                                                // 1..16 Bytes
    wire [8:0]  cdc1_pld_in_clk_cnt  = cdc1_pld_in_valid ? (r_cdc1_pld_in_clk + 9'd1) : 9'd0;              // 1..478 Clocks
    wire [11:0] cdc1_pld_in_byte_cnt = cdc1_pld_in_valid ? ({3'd0, cdc1_pld_in_clk_cnt} * 12'd4) : 12'd0;  // 4..1912 Bytes

    // Deterministic Table 2-10 Header & Table 2-18/2-14 Payload Test Vectors
    function [7:0] get_oisl_header_byte(input integer f_idx, input integer b_idx);
        reg [7:0] txfn_lsb;
        begin
            txfn_lsb = f_idx[7:0];
            case (b_idx)
                1:  get_oisl_header_byte = txfn_lsb; // d0: TXFN[7:0] (LSB)
                2:  get_oisl_header_byte = 8'h00;    // d1: TXFN[15:8] (MSB)
                3:  get_oisl_header_byte = 8'hCD;    // d2: RXFN[7:0] (0xABCD)
                4:  get_oisl_header_byte = 8'hAB;    // d3: RXFN[15:8]
                5:  get_oisl_header_byte = (f_idx == 1 || f_idx == 2) ? 8'hFD :
                                           (f_idx == 4)               ? 8'hF2 : 8'hF0; // d4: Frame Type
                6:  get_oisl_header_byte = 8'h55;    // d5: TX_TS[7:0]
                7:  get_oisl_header_byte = 8'h44;    // d6: TX_TS[15:8]
                8:  get_oisl_header_byte = 8'h33;    // d7: TX_TS[23:16]
                9:  get_oisl_header_byte = 8'h22;    // d8: TX_TS[31:24]
                10: get_oisl_header_byte = 8'h11;    // d9: TX_TS[39:32]
                11: get_oisl_header_byte = 8'hF2;    // d10: Reserved=11, TOD_SECONDS=50
                12: get_oisl_header_byte = 8'h8A;    // d11: Reserved=1, TS_applies=0, FCCH=0xA
                13: get_oisl_header_byte = 8'h88;    // d12: FCCH_PL[7:0]
                14: get_oisl_header_byte = 8'h99;    // d13: FCCH_PL[15:8]
                15: get_oisl_header_byte = 8'h0F;    // d14: CRC-16[15:8] (MSB)
                16: get_oisl_header_byte = 8'h28;    // d15: CRC-16[7:0]  (LSB)
                default: get_oisl_header_byte = 8'h55;
            endcase
        end
    endfunction

    function [63:0] get_oisl_payload_word64(input integer f_idx, input integer w_idx);
        begin
            if (f_idx == 1) begin
                // Frame 1 (DAT1): First 1,900B of 2,000B Jumbo Packet + "Kookmin FSO "
                if      (w_idx == 1)   get_oisl_payload_word64 = 64'hAB00_0000_CDEF_07D0;
                else if (w_idx == 2)   get_oisl_payload_word64 = 64'hAABB_CCDD_EEFF_1122;
                else if (w_idx == 7)   get_oisl_payload_word64 = 64'h4B6F_6F6B_6D69_6E20; // "Kookmin "
                else if (w_idx == 8)   get_oisl_payload_word64 = 64'h4653_4F20_AAAA_000E; // "FSO "
                else if (w_idx == 239) get_oisl_payload_word64 = 64'hAAAA_01DC_C320_0001; // CRC-32 Tail
                else                   get_oisl_payload_word64 = {32'hAAAA_0000 + w_idx[31:0], 32'hBBBB_0000 + w_idx[31:0]};
            end else if (f_idx == 2) begin
                // Frame 2 (DAT2): Table 2-18 Continuation (0xAB004064) + 100B Data (FCS 0xDEADBEEF) + 1,804B Zero Pad
                if      (w_idx == 1)   get_oisl_payload_word64 = 64'hAB00_4064_AAAA_0001;
                else if (w_idx == 13)  get_oisl_payload_word64 = 64'hAAAA_0018_DEAD_BEEF; // 100th Byte Eth FCS at 32b Word 26
                else if (w_idx == 239) get_oisl_payload_word64 = 64'h0000_0000_C320_0002; // CRC-32 Tail
                else if (w_idx > 13)   get_oisl_payload_word64 = 64'd0;                   // 1,804B Zero Padding
                else                   get_oisl_payload_word64 = {32'hAAAA_0100 + w_idx[31:0], 32'hBBBB_0100 + w_idx[31:0]};
            end else if (f_idx == 4) begin
                // Frame 4 (MGMT): Table 2-14 Satellite Range 5,000 km (0x415312D000000000)
                if      (w_idx == 1)   get_oisl_payload_word64 = {mgmt_vec[31:0],    mgmt_vec[63:32]};
                else if (w_idx == 2)   get_oisl_payload_word64 = {mgmt_vec[95:64],   mgmt_vec[127:96]};
                else if (w_idx == 3)   get_oisl_payload_word64 = {mgmt_vec[159:128], mgmt_vec[191:160]};
                else if (w_idx == 4)   get_oisl_payload_word64 = {mgmt_vec[223:192], mgmt_vec[255:224]};
                else if (w_idx == 239) get_oisl_payload_word64 = 64'h0000_0000_C320_0004;
                else                   get_oisl_payload_word64 = 64'd0;
            end else begin
                // Frame 3 (IDLE) & Post-Frame-4 Continuous Filler IDLEs ("FILL", f_idx = 5, 6)
                if      (w_idx == 239) get_oisl_payload_word64 = 64'h1D1E_1D1E_C320_0000 + f_idx[7:0];
                else                   get_oisl_payload_word64 = 64'h1D1E_1D1E_1D1E_1D1E ^ {48'd0, w_idx[15:0]};
            end
        end
    endfunction

    // =======================================================
    // 3. PRODUCTION DATAPATH WIRES (CDC 1 -> GTH -> CDC 4)
    // =======================================================
    // Stage 1: CDC 1 (x_gth_logic: 312.5 MHz -> 200.0 MHz) Outputs
    wire        en_head;
    wire [7:0]  header_in;
    wire        en_load;
    wire [63:0] payload_in;

    // Stage 2: core_tx Internal & Output Probes (200.0 MHz)
    wire        lpc_dv;
    wire [95:0] lpc_data_out;
    wire        rs_head_dv   = u_core_tx.encoder_dv;
    wire [7:0]  rs_head_out  = u_core_tx.rs_head;
    wire        rs_load_dv   = u_core_tx.rs_load_dv;
    wire [63:0] rs_load_out  = u_core_tx.rs_load;
    wire        mux_dv       = u_core_tx.mux_dv;
    wire [63:0] mux_data_out = u_core_tx.mux_data;
    wire        scr_dv       = u_core_tx.scrambler_dv;
    wire [63:0] scr_data_out = u_core_tx.scrambler;

    // Stage 3: Preamble Generator & MUX Gearbox 128 (200.0 MHz)
    wire [71:0]  preamble_72b;
    wire         gbx_dv;
    wire [127:0] gbx_data_out;
    wire [15:0]  gbx_keep_out;

    // Stage 4 & 5: CDC 2 (x_logic_gth) & Error Injector (312.5 MHz)
    wire         cdc2_out_valid;
    wire [31:0]  cdc2_out_data;
    wire         err_inj_out_valid;
    wire [31:0]  err_inj_out_data;

    // Stage 6: GTH 64B/66B TX -> GTH Serial Loopback Wrapper -> GTH 64B/66B RX
    wire         txp_out;
    wire         txn_out;
    wire         rxp_in = txp_out;
    wire         rxn_in = txn_out;
    wire         tx0_clk;
    wire         rx0_clk;
    wire         gth_tx_ready;
    wire         gth_rx_ready;
    wire         gth_link_up;
    wire         tx_stall_out;
    wire [31:0]  gt_txdata;
    wire [5:0]   gt_txheader;
    wire [6:0]   gt_txsequence;
    wire [31:0]  gt_rxdata;
    wire [1:0]   gt_rxdatavalid;
    wire [5:0]   gt_rxheader;
    wire [1:0]   gt_rxheadervalid;
    wire [1:0]   gt_rxstartofseq;
    wire         gt_rxgearboxslip;
    wire         rx_block_locked;
    wire         gth_rx_valid;
    wire [31:0]  gth_rx_data;

    // Compatibility aliases for waveform scripts
    wire         gth_tx_valid     = gth_tx_ready;
    wire [31:0]  gth_tx_line_data = gt_txdata;

    // Stage 7: CDC 3 (rx_gth_logic: 312.5 MHz -> 200.0 MHz)
    wire         cdc3_out_valid;
    wire [127:0] cdc3_out_data;

    // Stage 8: core_rx (Demux 128 -> LPC Dec -> Descrambler -> FEC_Demux -> RS Decoders)
    wire         rx_rs_hdr_out_valid;
    wire [7:0]   rx_rs_hdr_out_data;
    wire         rx_rs_pld_out_valid;
    wire [63:0]  rx_rs_pld_out_data;
    wire         rx_preamble_locked;

    // Internal Stage Probes inside u_core_rx for Waveform & Codeword Comparison Point 2
    wire [71:0]  rx_preamble_extracted = u_core_rx.preamble_extracted;
    wire         rx_preamble_valid     = u_core_rx.preamble_valid;
    wire         rx_demux_lpc_valid    = u_core_rx.lpc_valid_raw;
    wire [95:0]  rx_demux_lpc_data     = u_core_rx.lpc_data_raw;
    wire         rx_lpc_dec_out_valid  = u_core_rx.lpc_dv;
    wire [63:0]  rx_lpc_dec_out_data   = u_core_rx.lpc;
    wire         rx_desc_out_valid     = u_core_rx.descrambler_dv;
    wire [63:0]  rx_desc_out_data      = u_core_rx.descrambled_data;
    wire         rx_rs_hdr_in_valid    = u_core_rx.rs_head_dv;
    wire [7:0]   rx_rs_hdr_in_data     = u_core_rx.rs_head;
    wire         rx_rs_pld_in_valid    = u_core_rx.rs_load_dv;
    wire [63:0]  rx_rs_pld_in_data     = u_core_rx.rs_load;

    // Stage 9: CDC 4 (rx_logic_gth: 200.0 MHz -> 312.5 MHz)
    wire         cdc4_hdr_out_valid;
    wire [7:0]   cdc4_hdr_out_data;
    wire         cdc4_pld_out_valid;
    wire [31:0]  cdc4_pld_out_data;

    // =======================================================
    // 4. PRODUCTION MODULE INSTANTIATIONS (NO BYPASS ARRAYS)
    // =======================================================

    // 4.1 Clock Domain Crossing 1 (x_gth_logic: 312.5 MHz -> 200.0 MHz)
    x_gth_logic u_cdc1 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (cdc1_hdr_in_valid),
        .en_load    (cdc1_pld_in_valid),
        .header_in  (cdc1_hdr_in_data),
        .payload_in (cdc1_pld_in_data),
        .cdc_ready  (cdc1_ready),
        .header_dv  (en_head),
        .header     (header_in),
        .payload_dv (en_load),
        .payload    (payload_in)
    );

    // 4.2 Transmit Baseband FEC Core (RS(32,16) + 8xRS(255,239) + FEC_MUX + Scrambler + LPC(24,16))
    core_tx u_core_tx (
        .clk        (clk),
        .rst_n      (rst_n),
        .en_head    (en_head),
        .en_load    (en_load),
        .header     (header_in),
        .payload    (payload_in),
        .flag       (lpc_dv),
        .data_out   (lpc_data_out)
    );

    // [Rev 2.0 & Rev 3.3] Independent Golden-Vector Syndrome Checkers over GF(0x187), roots j=120..135
    // Evaluates Header RS(32,16) AND all 8 Payload RS(255,239) Lanes (Lanes 0..7)
    wire         hdr_synd_done;
    wire [127:0] hdr_syndrome_vec;
    wire [7:0]   pld_lane_synd_done;
    wire [127:0] pld_lane_syndrome_vec [0:7];

    syndrome_unit #(.max(31)) u_hdr_synd_chk (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (rs_head_dv),
        .data_in  (rs_head_out),
        .flag     (hdr_synd_done),
        .syndrome (hdr_syndrome_vec)
    );

    genvar g_lane;
    generate
        for (g_lane = 0; g_lane < 8; g_lane = g_lane + 1) begin : gen_pld_synd_chk_all_lanes
            syndrome_unit #(.max(254)) u_pld_synd_chk_lane (
                .clk      (clk),
                .rst_n    (rst_n),
                .en       (rs_load_dv),
                .data_in  (rs_load_out[8 * g_lane +: 8]),
                .flag     (pld_lane_synd_done[g_lane]),
                .syndrome (pld_lane_syndrome_vec[g_lane])
            );
        end
    endgenerate

    wire         pld_synd_done    = pld_lane_synd_done[7];
    wire [127:0] pld_syndrome_vec = pld_lane_syndrome_vec[7];
    wire         pld_all8_lanes_synd_zero = (pld_lane_syndrome_vec[0] == 128'd0) &&
                                            (pld_lane_syndrome_vec[1] == 128'd0) &&
                                            (pld_lane_syndrome_vec[2] == 128'd0) &&
                                            (pld_lane_syndrome_vec[3] == 128'd0) &&
                                            (pld_lane_syndrome_vec[4] == 128'd0) &&
                                            (pld_lane_syndrome_vec[5] == 128'd0) &&
                                            (pld_lane_syndrome_vec[6] == 128'd0) &&
                                            (pld_lane_syndrome_vec[7] == 128'd0);

    // 4.3 TX 72-bit Preamble Generator (72'h77AD5B5843641E2E26) & 128-bit MUX Gearbox (3,117B)
    preamble_gen u_preamble_gen (
        .preamble_out (preamble_72b)
    );

    mux_gearbox_128 u_mux_gearbox (
        .clk           (clk),
        .rst_n         (rst_n),
        .preamble_data (preamble_72b),
        .lpc_data      (lpc_data_out),
        .lpc_valid     (lpc_dv),
        .cdc_data      (gbx_data_out),
        .cdc_valid     (gbx_dv),
        .cdc_keep      (gbx_keep_out)
    );

    // 4.4 Clock Domain Crossing 2 (x_logic_gth: 200.0 MHz 128b -> 312.5 MHz 32b)
    x_logic_gth u_cdc2 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en         (cdc2_en),
        .data_in    (gbx_data_out),
        .data_in_dv (gbx_dv),
        .cdc_keep   (gbx_keep_out),
        .flag       (cdc2_out_valid),
        .data_out   (cdc2_out_data)
    );

    // 4.5 Channel Error Injector (Original 48-Word error.mem when INJ_SIM_MODE = 1)
    error_inject #(
        .SIM_MODE   (INJ_SIM_MODE),
        .safe_words (INJ_SAFE_WORDS),
        .max_error  (INJ_MAX_ERROR)
    ) u_error_inject (
        .clk        (clk_gth),
        .rst_n      (rst_n),
        .en         (cdc2_out_valid),
        .data_in    (cdc2_out_data),
        .flag       (err_inj_out_valid),
        .data_out   (err_inj_out_data)
    );

    // 4.6 GTH 64B/66B TX Adapter + GTH Serial Transceiver Core Wrapper + GTH 64B/66B RX Adapter
    gth64b66b_tx u_gth64b66b_tx (
        .clk_312_5         (clk_gth),
        .clk_gth           (tx0_clk),
        .rst_n             (sys_rst_n),
        .gth_tx_ready      (gth_tx_ready),
        .up_data_in        (err_inj_out_data),
        .up_valid_in       (err_inj_out_valid),
        .tx_stall_out      (tx_stall_out),
        .gt_txdata_out     (gt_txdata),
        .gt_txheader_out   (gt_txheader),
        .gt_txsequence_out (gt_txsequence)
    );

    fso_gth_core_wrapper u_fso_gth_core (
        .clk_100_freerun      (clk_100_freerun),
        .sys_rst_n            (sys_rst_n),
        .gt_refclk_p          (gt_refclk_p),
        .gt_refclk_n          (gt_refclk_n),
        .txp_out              (txp_out),
        .txn_out              (txn_out),
        .rxp_in               (rxp_in),
        .rxn_in               (rxn_in),
        .tx0_clk              (tx0_clk),
        .rx0_clk              (rx0_clk),
        .gth_tx_ready         (gth_tx_ready),
        .gth_rx_ready         (gth_rx_ready),
        .gth_link_up          (gth_link_up),
        .gt_txdata_in         (gt_txdata),
        .gt_txheader_in       (gt_txheader),
        .gt_txsequence_in     (gt_txsequence),
        .gt_rxdata_out        (gt_rxdata),
        .gt_rxdatavalid_out   (gt_rxdatavalid),
        .gt_rxheader_out      (gt_rxheader),
        .gt_rxheadervalid_out (gt_rxheadervalid),
        .gt_rxstartofseq_out  (gt_rxstartofseq),
        .gt_rxgearboxslip_in  (gt_rxgearboxslip)
    );

    gth64b66b_rx u_gth64b66b_rx (
        .clk_gth              (rx0_clk),
        .clk_312_5            (clk_gth),
        .rst_n                (sys_rst_n),
        .gth_rx_ready         (gth_rx_ready),
        .gt_rxdata_in         (gt_rxdata),
        .gt_rxdatavalid_in    (gt_rxdatavalid),
        .gt_rxheader_in       (gt_rxheader),
        .gt_rxheadervalid_in  (gt_rxheadervalid),
        .gt_rxgearboxslip_out (gt_rxgearboxslip),
        .rx_block_locked      (rx_block_locked),
        .down_data            (gth_rx_data),
        .down_dv              (gth_rx_valid)
    );

    // 4.7 Clock Domain Crossing 3 (rx_gth_logic: 312.5 MHz 32b -> 200.0 MHz 128b with 25/64 Pacing)
    rx_gth_logic u_cdc3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (gth_rx_valid),
        .data_in   (gth_rx_data),
        .flag      (cdc3_out_valid),
        .data_out  (cdc3_out_data)
    );

    // 4.8 Receive Baseband FEC Core (Demux 128 + Preamble Dec + LPC Dec + Descrambler + FEC_Demux + RS Decoders)
    core_rx u_core_rx (
        .clk         (clk),
        .rst_n       (rst_n),
        .en          (cdc3_out_valid),
        .data_in     (cdc3_out_data),
        .header_dv   (rx_rs_hdr_out_valid),
        .header      (rx_rs_hdr_out_data),
        .payload_dv  (rx_rs_pld_out_valid),
        .payload     (rx_rs_pld_out_data),
        .link_locked (rx_preamble_locked)
    );

    // 4.9 Clock Domain Crossing 4 (rx_logic_gth: 200.0 MHz -> 312.5 MHz)
    rx_logic_gth u_cdc4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (rx_rs_hdr_out_valid),
        .en_load    (rx_rs_pld_out_valid),
        .header_in  (rx_rs_hdr_out_data),
        .payload_in (rx_rs_pld_out_data),
        .header_dv  (cdc4_hdr_out_valid),
        .header     (cdc4_hdr_out_data),
        .payload_dv (cdc4_pld_out_valid),
        .payload    (cdc4_pld_out_data)
    );

    // =======================================================
    // 5. GTH INITIALIZATION & 6-FRAME UPSTREAM STIMULUS (4 TARGET + 2 FILLER)
    // =======================================================
    integer gth_f, gth_w;
    reg [63:0] cur_pld64;
    reg [3:0]  raw_frame_seq = 4'd0;
    reg [3:0]  frame_id      = 4'd0;

    initial begin
        sys_rst_n     = 1'b0;
        rst_n         = 1'b0;
        cdc2_en       = 1'b0;
        raw_frame_seq = 4'd0;
        frame_id      = 4'd0;

        #100;
        sys_rst_n = 1'b1;
        $display("\n[%0.1f ns] STEP 1: System Reset Released. Waiting for GTH QPLL0 & CDR Lock...", $realtime);

        wait(gth_link_up == 1'b1);
        $display("[%0.1f ns] STEP 2: GTH Link Up Achieved! Waiting for 64B/66B RX Gearbox Block Lock...", $realtime);

        wait(rx_block_locked == 1'b1);
        $display("[%0.1f ns] STEP 3: 64B/66B RX Gearbox Locked! Releasing Baseband & CDC Reset...", $realtime);

        #100;
        rst_n   = 1'b1;
        cdc2_en = 1'b1;

        wait(!u_cdc1.head_wr_rst_busy && !u_cdc1.load_wr_rst_busy &&
             !u_cdc2.wr_rst_busy      && !u_cdc3.wr_rst_busy      &&
             !u_cdc4.head_rd_rst_busy && !u_cdc4.load_rd_rst_busy);
        repeat (10) @(posedge clk_gth);
        $display("[%0.1f ns] STEP 4: All CDC FIFOs Ready! Streaming 4 Target Frames (DAT1, DAT2, IDLE, MGMT) + 2 Filler IDLE Frames...\n", $realtime);

        // Stream 4 Target Frames (gth_f = 1..4) + 2 Filler IDLE Frames (gth_f = 5..6)
        // Paced at 478 active + 301 gap = 779 clk_gth cycles (2,492.8 ns) per frame
        for (gth_f = 1; gth_f <= 6; gth_f = gth_f + 1) begin
            wait(cdc1_ready == 1'b1);
            for (gth_w = 1; gth_w <= 478; gth_w = gth_w + 1) begin
                @(posedge clk_gth);
                raw_frame_seq     <= gth_f[3:0];
                frame_id          <= (gth_f <= 4) ? gth_f[3:0] : 4'd0;
                cdc1_in_frame_id  <= (gth_f <= 4) ? gth_f[3:0] : 4'd0;
                cdc1_in_frame_str <= (gth_f == 1) ? "DAT1" :
                                     (gth_f == 2) ? "DAT2" :
                                     (gth_f == 3) ? "IDLE" :
                                     (gth_f == 4) ? "MGMT" : "FILL";
                if (gth_w <= 16) begin
                    cdc1_hdr_in_valid <= 1'b1;
                    cdc1_hdr_in_data  <= get_oisl_header_byte(gth_f, gth_w);
                end else begin
                    cdc1_hdr_in_valid <= 1'b0;
                    cdc1_hdr_in_data  <= 8'd0;
                end

                cdc1_pld_in_valid <= 1'b1;
                cur_pld64         = get_oisl_payload_word64(gth_f, (gth_w + 1) / 2);
                cdc1_pld_in_data  <= (gth_w[0] == 1'b1) ? cur_pld64[63:32] : cur_pld64[31:0];
            end
            @(posedge clk_gth);
            cdc1_hdr_in_valid <= 1'b0;
            cdc1_hdr_in_data  <= 8'd0;
            cdc1_pld_in_valid <= 1'b0;
            cdc1_pld_in_data  <= 32'd0;
            cdc1_in_frame_str <= "WAIT";
            repeat (301) @(posedge clk_gth);
        end
    end

    // =======================================================
    // 6. COMPLETE ZERO-LAG WAVEFORM COUNTERS (CLOCK, WORD, & BYTE)
    // =======================================================
    reg [31:0] mux_frame_type_str;
    always @(*) begin
        if      (frame_id == 4'd1)      mux_frame_type_str = "DAT1";
        else if (frame_id == 4'd2)      mux_frame_type_str = "DAT2";
        else if (frame_id == 4'd3)      mux_frame_type_str = "IDLE";
        else if (frame_id == 4'd4)      mux_frame_type_str = "MGMT";
        else if (raw_frame_seq >= 4'd5) mux_frame_type_str = "FILL";
        else                            mux_frame_type_str = "DONE";
    end

    // --- 6.1 TX RS ENCODER INPUT TRACKERS (200 MHz from u_cdc1) ---
    reg [4:0] r_tx_hdr_in_cnt = 5'd0;
    reg [8:0] r_tx_pld_in_cnt = 9'd0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_tx_hdr_in_cnt <= 5'd0;
            r_tx_pld_in_cnt <= 9'd0;
        end else begin
            r_tx_hdr_in_cnt <= en_head ? (r_tx_hdr_in_cnt + 5'd1) : 5'd0;
            r_tx_pld_in_cnt <= en_load ? (r_tx_pld_in_cnt + 9'd1) : 9'd0;
        end
    end

    wire [4:0]  tx_rs_hdr_in_clk_cnt  = en_head ? (r_tx_hdr_in_cnt + 5'd1) : 5'd0;               // 1..16 Clocks
    wire [2:0]  tx_rs_hdr_in_word_cnt = en_head ? ((r_tx_hdr_in_cnt >> 3) + 3'd1) : 3'd0;        // 1..2 Words
    wire [4:0]  tx_rs_hdr_in_byte_cnt = tx_rs_hdr_in_clk_cnt;                                    // 1..16 Bytes
    wire [4:0]  in_header_byte_idx    = tx_rs_hdr_in_byte_cnt;
    wire [2:0]  in_header_word_idx    = tx_rs_hdr_in_word_cnt;

    wire [8:0]  tx_rs_pld_in_clk_cnt  = en_load ? (r_tx_pld_in_cnt + 9'd1) : 9'd0;               // 1..239 Clocks
    wire [8:0]  tx_rs_pld_in_word_cnt = tx_rs_pld_in_clk_cnt;                                    // 1..239 Words
    wire [11:0] tx_rs_pld_in_byte_cnt = en_load ? ({3'd0, tx_rs_pld_in_clk_cnt} * 12'd8) : 12'd0;// 8..1912 Bytes
    wire [8:0]  in_payload_word_idx   = tx_rs_pld_in_word_cnt;
    wire [11:0] in_payload_byte_idx   = tx_rs_pld_in_byte_cnt;

    // --- 6.2 TX RS ENCODER OUTPUT TRACKERS ---
    reg [5:0] r_rs_head_cnt = 6'd0;
    reg [8:0] r_rs_load_cnt = 9'd0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_rs_head_cnt <= 6'd0;
            r_rs_load_cnt <= 9'd0;
        end else begin
            r_rs_head_cnt <= rs_head_dv ? (r_rs_head_cnt + 6'd1) : 6'd0;
            r_rs_load_cnt <= rs_load_dv ? (r_rs_load_cnt + 9'd1) : 9'd0;
        end
    end
    wire [5:0]  tx_rs_hdr_out_clk_cnt  = rs_head_dv ? (r_rs_head_cnt + 6'd1) : 6'd0;             // 1..32 Clocks
    wire [2:0]  tx_rs_hdr_out_word_cnt = rs_head_dv ? ((r_rs_head_cnt >> 3) + 3'd1) : 3'd0;      // 1..4 Words
    wire [5:0]  tx_rs_hdr_out_byte_cnt = tx_rs_hdr_out_clk_cnt;                                  // 1..32 Bytes
    wire [5:0]  rs_head_out_byte_idx   = tx_rs_hdr_out_byte_cnt;
    wire [2:0]  rs_head_out_word_idx   = tx_rs_hdr_out_word_cnt;

    wire [8:0]  tx_rs_pld_out_clk_cnt  = rs_load_dv ? (r_rs_load_cnt + 9'd1) : 9'd0;             // 1..255 Clocks
    wire [8:0]  tx_rs_pld_out_word_cnt = tx_rs_pld_out_clk_cnt;                                  // 1..255 Words
    wire [11:0] tx_rs_pld_out_byte_cnt = rs_load_dv ? ({3'd0, tx_rs_pld_out_clk_cnt} * 12'd8) : 12'd0; // 8..2040 Bytes
    wire [8:0]  rs_load_out_word_idx   = tx_rs_pld_out_word_cnt;
    wire [11:0] rs_load_out_byte_idx   = tx_rs_pld_out_byte_cnt;

    // --- 6.3 FEC MUX, SCRAMBLER, LPC ENCODER, & GEARBOX 128 COUNTERS ---
    reg [8:0]  r_mux_cnt   = 9'd0;
    reg [8:0]  r_scr_cnt   = 9'd0;
    reg [8:0]  r_lpc_cnt   = 9'd0;
    reg [7:0]  r_gbx_cnt   = 8'd0;
    reg [11:0] r_gbx_bytes = 12'd0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_mux_cnt   <= 9'd0;
            r_scr_cnt   <= 9'd0;
            r_lpc_cnt   <= 9'd0;
            r_gbx_cnt   <= 8'd0;
            r_gbx_bytes <= 12'd0;
        end else begin
            r_mux_cnt <= mux_dv ? (r_mux_cnt + 9'd1) : 9'd0;
            r_scr_cnt <= scr_dv ? (r_scr_cnt + 9'd1) : 9'd0;
            r_lpc_cnt <= lpc_dv ? (r_lpc_cnt + 9'd1) : 9'd0;
            if (gbx_dv) begin
                if (gbx_keep_out == 16'h1FFF) begin
                    r_gbx_cnt   <= 8'd0;
                    r_gbx_bytes <= 12'd0;
                end else begin
                    r_gbx_cnt   <= r_gbx_cnt + 8'd1;
                    r_gbx_bytes <= r_gbx_bytes + 12'd16;
                end
            end else begin
                r_gbx_cnt   <= 8'd0;
                r_gbx_bytes <= 12'd0;
            end
        end
    end

    wire [8:0]  fec_mux_out_clk_cnt    = mux_dv ? (r_mux_cnt + 9'd1) : 9'd0;                       // 1..259 Clocks
    wire [11:0] fec_mux_out_byte_cnt   = mux_dv ? ({3'd0, fec_mux_out_clk_cnt} * 12'd8) : 12'd0;   // 8..2072 Bytes
    wire [8:0]  mux_out_word_idx       = fec_mux_out_clk_cnt;
    wire [11:0] mux_out_byte_idx       = fec_mux_out_byte_cnt;

    wire [8:0]  scrambler_out_clk_cnt  = scr_dv ? (r_scr_cnt + 9'd1) : 9'd0;                       // 1..259 Clocks
    wire [11:0] scrambler_out_byte_cnt = scr_dv ? ({3'd0, scrambler_out_clk_cnt} * 12'd8) : 12'd0; // 8..2072 Bytes

    wire [8:0]  lpc_enc_out_clk_cnt    = lpc_dv ? (r_lpc_cnt + 9'd1) : 9'd0;                       // 1..259 Clocks
    wire [11:0] lpc_enc_out_byte_cnt   = lpc_dv ? ({3'd0, lpc_enc_out_clk_cnt} * 12'd12) : 12'd0;  // 12..3108 Bytes

    wire [7:0]  gearbox_out_clk_cnt    = gbx_dv ? (r_gbx_cnt + 8'd1) : 8'd0;                       // 1..195 Clocks
    wire [11:0] gearbox_out_byte_cnt   = gbx_dv ? (r_gbx_bytes + ((gbx_keep_out == 16'h1FFF) ? 12'd13 : 12'd16)) : 12'd0; // 16..3117 Bytes

    // --- 6.4 CDC 2, ERROR INJECTOR, GTH TX/RX & TABLE 2-4 METRICS (312.5 MHz) ---
    reg  [15:0] r_cdc2_byte_acc = 16'd0;
    reg  [15:0] r_inj_byte_acc  = 16'd0;
    reg  [15:0] r_gth_byte_acc  = 16'd0;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            r_cdc2_byte_acc <= 16'd0;
            r_inj_byte_acc  <= 16'd0;
            r_gth_byte_acc  <= 16'd0;
        end else begin
            if (cdc2_out_valid)    r_cdc2_byte_acc <= (r_cdc2_byte_acc + 16'd4 >= 16'd3117) ? ((r_cdc2_byte_acc + 16'd4) - 16'd3117) : (r_cdc2_byte_acc + 16'd4);
            if (err_inj_out_valid) r_inj_byte_acc  <= (r_inj_byte_acc  + 16'd4 >= 16'd3117) ? ((r_inj_byte_acc  + 16'd4) - 16'd3117) : (r_inj_byte_acc  + 16'd4);
            if (gth_rx_valid)      r_gth_byte_acc  <= (r_gth_byte_acc  + 16'd4 >= 16'd3117) ? ((r_gth_byte_acc  + 16'd4) - 16'd3117) : (r_gth_byte_acc  + 16'd4);
        end
    end

    wire [11:0] cdc2_out_byte_cnt    = cdc2_out_valid    ? ((r_cdc2_byte_acc + 16'd4 >= 16'd3117) ? 12'd3117 : (r_cdc2_byte_acc[11:0] + 12'd4)) : 12'd0;
    wire [9:0]  cdc2_out_clk_cnt     = cdc2_out_valid    ? ((r_cdc2_byte_acc >> 2) + 10'd1) : 10'd0;
    wire [11:0] err_inj_out_byte_cnt = err_inj_out_valid ? ((r_inj_byte_acc  + 16'd4 >= 16'd3117) ? 12'd3117 : (r_inj_byte_acc[11:0]  + 12'd4)) : 12'd0;
    wire [9:0]  err_inj_out_clk_cnt  = err_inj_out_valid ? ((r_inj_byte_acc  >> 2) + 10'd1) : 10'd0;
    wire [11:0] gth_rx_out_byte_cnt  = gth_rx_valid      ? ((r_gth_byte_acc  + 16'd4 >= 16'd3117) ? 12'd3117 : (r_gth_byte_acc[11:0]  + 12'd4)) : 12'd0;
    wire [9:0]  gth_rx_out_clk_cnt   = gth_rx_valid      ? ((r_gth_byte_acc  >> 2) + 10'd1) : 10'd0;

    // Pre-injector clean word FIFO for independent XOR verification
    reg [31:0] inj_clean_word_fifo [0:8191];
    integer    inj_clean_wr_ptr = 0;
    integer    inj_clean_rd_ptr = 0;

    wire [31:0] err_inj_xor_mask = err_inj_out_valid ? (err_inj_out_data ^ inj_clean_word_fifo[inj_clean_rd_ptr]) : 32'd0;
    wire [1:0]  err_inj_zone_id  = !err_inj_out_valid                  ? 2'd0 :
                                   (err_inj_out_byte_cnt <= 12'd60)    ? 2'd1 :
                                   ((INJ_SIM_MODE == 1) && (err_inj_out_byte_cnt <= ZONE2_END_BYTE)) ? 2'd2 : 2'd3;
    wire [63:0] err_inj_zone_str = (err_inj_zone_id == 2'd1) ? "ZONE1_OK" :
                                   (err_inj_zone_id == 2'd2) ? "ZONE2_XO" :
                                   (err_inj_zone_id == 2'd3) ? "ZONE3_OK" : "IDLE    ";

    // SDA OISL Table 2-4 Reference Line Rate Metrics
    real OISL_Frame_Duration_us        = 2.493600;
    real OISL_Effective_Data_Rate_Mbps = 6121.270452;
    real OISL_Frame_Rate_kHz           = 401.026628;
    real OISL_FCCH_Mbps                = 6.416426;

    // --- 6.5 RX DEMUX 128, LPC DECODER, & DESCRAMBLER COUNTERS (200 MHz inside u_core_rx) ---
    reg [8:0] r_rx_demux_cnt   = 9'd0;
    reg [8:0] r_rx_lpc_dec_cnt = 9'd0;
    reg [8:0] r_rx_desc_cnt    = 9'd0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_rx_demux_cnt   <= 9'd0;
            r_rx_lpc_dec_cnt <= 9'd0;
            r_rx_desc_cnt    <= 9'd0;
        end else begin
            r_rx_demux_cnt   <= rx_demux_lpc_valid   ? (r_rx_demux_cnt   + 9'd1) : 9'd0;
            r_rx_lpc_dec_cnt <= rx_lpc_dec_out_valid ? (r_rx_lpc_dec_cnt + 9'd1) : 9'd0;
            r_rx_desc_cnt    <= rx_desc_out_valid    ? (r_rx_desc_cnt    + 9'd1) : 9'd0;
        end
    end

    wire [8:0]  rx_lpc_dec_in_clk_cnt   = rx_demux_lpc_valid   ? (r_rx_demux_cnt + 9'd1) : 9'd0;                   // 1..259 Clocks
    wire [11:0] rx_lpc_dec_in_byte_cnt  = rx_demux_lpc_valid   ? ({3'd0, rx_lpc_dec_in_clk_cnt} * 12'd12) : 12'd0; // 12..3108 Bytes

    wire [8:0]  rx_lpc_dec_out_clk_cnt  = rx_lpc_dec_out_valid ? (r_rx_lpc_dec_cnt + 9'd1) : 9'd0;                 // 1..259 Clocks
    wire [11:0] rx_lpc_dec_out_byte_cnt = rx_lpc_dec_out_valid ? ({3'd0, rx_lpc_dec_out_clk_cnt} * 12'd8) : 12'd0; // 8..2072 Bytes

    wire [8:0]  rx_desc_out_clk_cnt     = rx_desc_out_valid    ? (r_rx_desc_cnt + 9'd1) : 9'd0;                    // 1..259 Clocks
    wire [11:0] rx_desc_out_byte_cnt    = rx_desc_out_valid    ? ({3'd0, rx_desc_out_clk_cnt} * 12'd8) : 12'd0;    // 8..2072 Bytes

    // --- 6.6 RX RS DECODER INPUT & OUTPUT COUNTERS ---
    reg [5:0] r_rx_rs_hdr_in_cnt  = 6'd0;
    reg [5:0] r_rx_rs_hdr_out_cnt = 6'd0;
    reg [8:0] r_rx_rs_pld_in_cnt  = 9'd0;
    reg [8:0] r_rx_rs_pld_out_cnt = 9'd0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_rx_rs_hdr_in_cnt  <= 6'd0;
            r_rx_rs_hdr_out_cnt <= 6'd0;
            r_rx_rs_pld_in_cnt  <= 9'd0;
            r_rx_rs_pld_out_cnt <= 9'd0;
        end else begin
            r_rx_rs_hdr_in_cnt  <= rx_rs_hdr_in_valid  ? (r_rx_rs_hdr_in_cnt  + 6'd1) : 6'd0;
            r_rx_rs_hdr_out_cnt <= rx_rs_hdr_out_valid ? (r_rx_rs_hdr_out_cnt + 6'd1) : 6'd0;
            r_rx_rs_pld_in_cnt  <= rx_rs_pld_in_valid  ? (r_rx_rs_pld_in_cnt  + 9'd1) : 9'd0;
            r_rx_rs_pld_out_cnt <= rx_rs_pld_out_valid ? (r_rx_rs_pld_out_cnt + 9'd1) : 9'd0;
        end
    end

    wire [5:0]  rx_rs_hdr_in_clk_cnt   = rx_rs_hdr_in_valid  ? (r_rx_rs_hdr_in_cnt + 6'd1)        : 6'd0; // 1..32 Clocks
    wire [2:0]  rx_rs_hdr_in_word_cnt  = rx_rs_hdr_in_valid  ? ((r_rx_rs_hdr_in_cnt >> 3) + 3'd1) : 3'd0; // 1..4 Words
    wire [5:0]  rx_rs_hdr_in_byte_cnt  = rx_rs_hdr_in_clk_cnt;                                            // 1..32 Bytes

    wire [5:0]  rx_rs_hdr_out_clk_cnt  = rx_rs_hdr_out_valid ? (r_rx_rs_hdr_out_cnt + 6'd1)        : 6'd0;// 1..16 Clocks
    wire [2:0]  rx_rs_hdr_out_word_cnt = rx_rs_hdr_out_valid ? ((r_rx_rs_hdr_out_cnt >> 3) + 3'd1) : 3'd0;// 1..2 Words
    wire [5:0]  rx_rs_hdr_out_byte_cnt = rx_rs_hdr_out_clk_cnt;                                           // 1..16 Bytes

    wire [8:0]  rx_rs_pld_in_clk_cnt   = rx_rs_pld_in_valid  ? (r_rx_rs_pld_in_cnt + 9'd1) : 9'd0;        // 1..255 Clocks
    wire [8:0]  rx_rs_pld_in_word_cnt  = rx_rs_pld_in_clk_cnt;                                            // 1..255 Words
    wire [11:0] rx_rs_pld_in_byte_cnt  = rx_rs_pld_in_valid  ? ({3'd0, rx_rs_pld_in_clk_cnt} * 12'd8) : 12'd0; // 8..2040 Bytes

    wire [8:0]  rx_rs_pld_out_clk_cnt  = rx_rs_pld_out_valid ? (r_rx_rs_pld_out_cnt + 9'd1) : 9'd0;       // 1..239 Clocks
    wire [8:0]  rx_rs_pld_out_word_cnt = rx_rs_pld_out_clk_cnt;                                           // 1..239 Words
    wire [11:0] rx_rs_pld_out_byte_cnt = rx_rs_pld_out_valid ? ({3'd0, rx_rs_pld_out_clk_cnt} * 12'd8) : 12'd0;// 8..1912 Bytes

    // --- 6.7 CDC 4 OUTPUT COUNTERS & FIELD EXTRACTORS (312.5 MHz) ---
    reg [4:0]  r_cdc4_hdr_out_cnt = 5'd0;
    reg [8:0]  r_cdc4_pld_out_cnt = 9'd0;
    reg [3:0]  cdc4_out_frame_seq = 4'd0;
    reg        cdc4_pld_dv_d1     = 1'b0;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            r_cdc4_hdr_out_cnt <= 5'd0;
            r_cdc4_pld_out_cnt <= 9'd0;
            cdc4_out_frame_seq <= 4'd0;
            cdc4_pld_dv_d1     <= 1'b0;
        end else begin
            r_cdc4_hdr_out_cnt <= cdc4_hdr_out_valid ? (r_cdc4_hdr_out_cnt + 5'd1) : 5'd0;
            r_cdc4_pld_out_cnt <= cdc4_pld_out_valid ? (r_cdc4_pld_out_cnt + 9'd1) : 9'd0;
            cdc4_pld_dv_d1     <= cdc4_pld_out_valid;
            if (cdc4_pld_out_valid && !cdc4_pld_dv_d1)
                cdc4_out_frame_seq <= cdc4_out_frame_seq + 4'd1;
        end
    end

    wire [4:0]  cdc4_hdr_out_clk_cnt  = cdc4_hdr_out_valid ? (r_cdc4_hdr_out_cnt + 5'd1) : 5'd0;            // 1..16 Clocks
    wire [4:0]  cdc4_hdr_out_byte_cnt = cdc4_hdr_out_clk_cnt;                                               // 1..16 Bytes
    wire [8:0]  cdc4_pld_out_clk_cnt  = cdc4_pld_out_valid ? (r_cdc4_pld_out_cnt + 9'd1) : 9'd0;            // 1..478 Clocks
    wire [11:0] cdc4_pld_out_byte_cnt = cdc4_pld_out_valid ? ({1'd0, cdc4_pld_out_clk_cnt, 2'b00}) : 12'd0; // 4..1912 Bytes

    wire [3:0]  cur_cdc4_seq       = (cdc4_pld_out_valid && !cdc4_pld_dv_d1) ? (cdc4_out_frame_seq + 4'd1) : cdc4_out_frame_seq;
    wire [3:0]  cdc4_out_frame_id  = (cdc4_hdr_out_valid || cdc4_pld_out_valid) ? ((cur_cdc4_seq <= 4'd4) ? cur_cdc4_seq : 4'd0) : 4'd0;
    wire [31:0] cdc4_out_frame_str = !(cdc4_hdr_out_valid || cdc4_pld_out_valid) ? "WAIT" :
                                     (cur_cdc4_seq == 4'd1) ? "DAT1" :
                                     (cur_cdc4_seq == 4'd2) ? "DAT2" :
                                     (cur_cdc4_seq == 4'd3) ? "IDLE" :
                                     (cur_cdc4_seq == 4'd4) ? "MGMT" : "FILL";

    // Port-Aligned SDA OISL Field Extractors at CDC 4 Output
    reg  [7:0]  cdc4_hdr_buf [0:15];
    reg  [15:0] cdc4_TXFN        = 16'd0;
    reg  [1:0]  cdc4_FRAME_TYPE  = 2'd0;
    reg  [15:0] cdc4_HDR_CRC16   = 16'd0;
    reg  [95:0] cdc4_ASCII_TAG   = 96'd0;
    reg  [31:0] cdc4_ETH_FCS     = 32'd0;
    reg  [63:0] cdc4_MGMT_RANGE  = 64'd0;
    reg  [3:0]  mgmt_lo4_lat     = 4'd0;
    reg  [31:0] mgmt_mid32_lat   = 32'd0;

    always @(posedge clk_gth) if (rst_n) begin
        if (cdc4_hdr_out_valid) begin
            cdc4_hdr_buf[cdc4_hdr_out_byte_cnt - 5'd1] <= cdc4_hdr_out_data;
            if (cdc4_hdr_out_byte_cnt == 5'd2)  cdc4_TXFN       <= {cdc4_hdr_out_data, cdc4_hdr_buf[0]};
            if (cdc4_hdr_out_byte_cnt == 5'd5)  cdc4_FRAME_TYPE <= cdc4_hdr_out_data[1:0];
            if (cdc4_hdr_out_byte_cnt == 5'd16) cdc4_HDR_CRC16  <= {cdc4_hdr_buf[14], cdc4_hdr_out_data};
        end
        if (cdc4_pld_out_valid) begin
            if (cdc4_pld_out_clk_cnt == 9'd13 && cur_cdc4_seq == 4'd1) cdc4_ASCII_TAG[95:64] <= cdc4_pld_out_data;
            if (cdc4_pld_out_clk_cnt == 9'd14 && cur_cdc4_seq == 4'd1) cdc4_ASCII_TAG[63:32] <= cdc4_pld_out_data;
            if (cdc4_pld_out_clk_cnt == 9'd15 && cur_cdc4_seq == 4'd1) cdc4_ASCII_TAG[31:0]  <= cdc4_pld_out_data;
            if (cdc4_pld_out_clk_cnt == 9'd26 && cur_cdc4_seq == 4'd2) cdc4_ETH_FCS          <= cdc4_pld_out_data;
            if (cdc4_pld_out_clk_cnt == 9'd3)                          mgmt_lo4_lat          <= cdc4_pld_out_data[31:28];
            if (cdc4_pld_out_clk_cnt == 9'd4)                          mgmt_mid32_lat        <= cdc4_pld_out_data;
            if (cdc4_pld_out_clk_cnt == 9'd5  && cur_cdc4_seq == 4'd4) cdc4_MGMT_RANGE       <= {cdc4_pld_out_data[27:0], mgmt_mid32_lat, mgmt_lo4_lat};
        end
    end

    // =======================================================
    // 7. EXPLICIT STAGE BYTE COUNTERS, INDEPENDENT ZONE ORACLE,
    //    AND 3-POINT PER-CODEWORD/LANE SCOREBOARD (AUDIT SEC. 3-6)
    // =======================================================
    wire [3:0]  rs_max_correctable_symbols = 4'd8; // Mathematical limit E = (255-239)/2 = 8 symbols/lane

    // --- 7.1 Explicit Stage Byte/Word Counters for the 4 Target Frames ---
    integer stg_cdc1_in_hdr_bytes      = 0; // Target: 64B (4 x 16B)
    integer stg_cdc1_in_pld_words32    = 0; // Target: 1,912W = 7,648B (4 x 478W)
    integer stg_rs_mux_out_bytes       = 0; // Target: 8,288B (4 x 2,072B)
    integer stg_lpc_out_bytes          = 0; // Target: 12,432B (4 x 3,108B)
    integer stg_gbx_out_bytes          = 0; // Target: 12,468B (4 x 3,117B = 36B Pre + 12,432B LPC)
    integer stg_cdc2_out_target_bytes  = 0; // Target: 12,468B
    integer stg_gth_rx_target_bytes    = 0; // Target: 12,468B
    integer stg_cdc3_target_bytes      = 0; // Target: 12,468B
    integer stg_cdc3_follow_on_bytes   = 0; // Min required: 12B (to complete 780th word = 12,480B)
    integer stg_cdc3_total_words128    = 0; // Min required: 780 words (128-bit)
    integer stg_demux_preamble_bytes   = 0; // Target: 36B (4 x 9B)
    integer stg_demux_lpc_bytes        = 0; // Target: 12,432B (4 x 3,108B)
    integer stg_cdc4_target_hdr_bytes  = 0; // Target: 64B (4 x 16B)
    integer stg_cdc4_target_pld_words  = 0; // Target: 1,912W = 7,648B (4 x 478W)
    integer stg_cdc4_filler_hdr_bytes  = 0; // Separate counter for decoded "FILL" frames
    integer stg_cdc4_filler_pld_words  = 0; // Separate counter for decoded "FILL" frames

    // [Rev 3.3 - Audit Sec. 4.2] Separated single-driver X/Z protocol monitors per clock domain
    // Checks both control signals (every active post-reset cycle) and data buses (when valid is high)
    integer     xz_violation_gth_cnt        = 0;
    integer     xz_violation_logic_cnt      = 0;
    wire [31:0] xz_protocol_violation_cnt   = xz_violation_gth_cnt + xz_violation_logic_cnt;

    wire ctrl_xz_gth   = (^ {cdc1_ready, cdc1_hdr_in_valid, cdc1_pld_in_valid,
                             cdc2_out_valid, err_inj_out_valid, gth_rx_valid,
                             cdc4_hdr_out_valid, cdc4_pld_out_valid} === 1'bx);
    wire data_xz_gth   = (cdc1_hdr_in_valid && (^cdc1_hdr_in_data  === 1'bx)) ||
                         (cdc1_pld_in_valid && (^cdc1_pld_in_data  === 1'bx)) ||
                         (cdc2_out_valid    && (^cdc2_out_data     === 1'bx)) ||
                         (err_inj_out_valid && (^err_inj_out_data  === 1'bx)) ||
                         (gth_rx_valid      && (^gth_rx_data       === 1'bx)) ||
                         (cdc4_hdr_out_valid&& (^cdc4_hdr_out_data === 1'bx)) ||
                         (cdc4_pld_out_valid&& (^cdc4_pld_out_data === 1'bx));

    wire ctrl_xz_logic = (^ {en_head, en_load, rs_head_dv, rs_load_dv, mux_dv, scr_dv,
                             lpc_dv, gbx_dv, cdc3_out_valid, rx_preamble_valid,
                             rx_preamble_locked, rx_demux_lpc_valid, rx_lpc_dec_out_valid,
                             rx_desc_out_valid, rx_rs_hdr_in_valid, rx_rs_pld_in_valid,
                             rx_rs_hdr_out_valid, rx_rs_pld_out_valid} === 1'bx);
    wire data_xz_logic = (en_head             && (^header_in                      === 1'bx)) ||
                         (en_load             && (^payload_in                     === 1'bx)) ||
                         (mux_dv              && (^mux_data_out                   === 1'bx)) ||
                         (lpc_dv              && (^lpc_data_out                   === 1'bx)) ||
                         (gbx_dv              && ((^gbx_data_out === 1'bx) || (^gbx_keep_out === 1'bx))) ||
                         (cdc3_out_valid      && (^cdc3_out_data                  === 1'bx)) ||
                         (rx_preamble_valid   && (^rx_preamble_extracted          === 1'bx)) ||
                         (rx_demux_lpc_valid  && (^rx_demux_lpc_data              === 1'bx)) ||
                         (rx_rs_hdr_in_valid  && (^rx_rs_hdr_in_data              === 1'bx)) ||
                         (rx_rs_pld_in_valid  && (^rx_rs_pld_in_data              === 1'bx)) ||
                         (rx_rs_hdr_out_valid && (^rx_rs_hdr_out_data             === 1'bx)) ||
                         (rx_rs_pld_out_valid && (^rx_rs_pld_out_data             === 1'bx));

    // --- 7.2 Independent error.mem Zone Oracle & Separate Counters (Audit Sec. 5) ---
    reg [31:0] oracle_mask_mem [0:47];
    initial $readmemh("error.mem", oracle_mask_mem);

    integer oracle_zone1_bytes           = 0; // Expected: 240B across 4 target frames (4 x 60B)
    integer zone2_mask_positions_applied = 0; // Expected: 768B across 4 target frames (4 x 192B)
    integer oracle_zone3_bytes           = 0; // Expected: 11,460B across 4 target frames (4 x 2,865B)
    integer inj_changed_words_cnt        = 0; // Target 32b words where applied XOR mask != 0
    integer inj_changed_bytes_cnt        = 0; // Target bytes where applied XOR byte != 0
    integer inj_flipped_bits_cnt         = 0; // Target bits where applied XOR bit == 1
    integer inj_oracle_mismatch_cnt      = 0; // Mismatches against independent zone/mask oracle

    // --- 7.3 Comparison Point 1: Post-Injector -> Post-GTH / Post-CDC 3 Transport ---
    reg [7:0] post_inj_target_bytes [0:16383];
    integer   post_inj_byte_wr              = 0;
    integer   transport_target_mismatch_cnt = 0;

    integer   lane_k, bit_k, abs_b_inj, frame_b_pos, mask_off, mask_addr;
    reg [31:0] exp_oracle_mask;
    reg [7:0]  mask_byte_cur;
    integer    word_changed_flag;
    integer    cdc3_word_mismatch_tmp;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            stg_cdc1_in_hdr_bytes        <= 0;
            stg_cdc1_in_pld_words32      <= 0;
            stg_cdc2_out_target_bytes    <= 0;
            stg_gth_rx_target_bytes      <= 0;
            inj_clean_wr_ptr             <= 0;
            inj_clean_rd_ptr             <= 0;
            post_inj_byte_wr             <= 0;
            oracle_zone1_bytes           <= 0;
            zone2_mask_positions_applied <= 0;
            oracle_zone3_bytes           <= 0;
            inj_changed_words_cnt        <= 0;
            inj_changed_bytes_cnt        <= 0;
            inj_flipped_bits_cnt         <= 0;
            inj_oracle_mismatch_cnt      <= 0;
            xz_violation_gth_cnt         <= 0;
        end else begin
            // Check clk_gth control & active data buses for X/Z on every cycle
            if (ctrl_xz_gth || data_xz_gth)
                xz_violation_gth_cnt <= xz_violation_gth_cnt + 1;

            // Track Pre-CDC 1 Target Information (Frames 1..4 only)
            if (cdc1_hdr_in_valid && (cdc1_in_frame_id >= 4'd1 && cdc1_in_frame_id <= 4'd4))
                stg_cdc1_in_hdr_bytes <= stg_cdc1_in_hdr_bytes + 1;
            if (cdc1_pld_in_valid && (cdc1_in_frame_id >= 4'd1 && cdc1_in_frame_id <= 4'd4))
                stg_cdc1_in_pld_words32 <= stg_cdc1_in_pld_words32 + 1;

            // Record clean words entering u_error_inject
            if (cdc2_out_valid) begin
                inj_clean_word_fifo[inj_clean_wr_ptr] <= cdc2_out_data;
                inj_clean_wr_ptr                      <= inj_clean_wr_ptr + 1;
                if (stg_cdc2_out_target_bytes + 4 <= 12468)
                    stg_cdc2_out_target_bytes <= stg_cdc2_out_target_bytes + 4;
                else if (stg_cdc2_out_target_bytes < 12468)
                    stg_cdc2_out_target_bytes <= 12468;
            end

            // Evaluate Independent Zone Oracle & Capture Post-Injector Stream on err_inj_out_valid
            if (err_inj_out_valid) begin
                exp_oracle_mask   = 32'd0;
                word_changed_flag = 0;

                for (lane_k = 0; lane_k < 4; lane_k = lane_k + 1) begin
                    abs_b_inj   = post_inj_byte_wr + lane_k;
                    frame_b_pos = (abs_b_inj % 3117) + 1; // 1..3117

                    // Determine expected mask byte from independent oracle
                    if (frame_b_pos >= 61 && frame_b_pos <= 252) begin
                        mask_off  = frame_b_pos - 61;
                        mask_addr = mask_off / 4;
                        if (INJ_SIM_MODE == 1)
                            mask_byte_cur = oracle_mask_mem[mask_addr][31 - 8 * (mask_off % 4) -: 8];
                        else
                            mask_byte_cur = 8'h00;
                    end else begin
                        mask_byte_cur = 8'h00;
                    end
                    exp_oracle_mask[31 - 8 * lane_k -: 8] = mask_byte_cur;

                    // Accumulate 4-Frame Target Zone & Change Counters (strictly for bytes 0..12467)
                    if (abs_b_inj < 12468) begin
                        post_inj_target_bytes[abs_b_inj] <= err_inj_out_data[31 - 8 * lane_k -: 8];
                        if (frame_b_pos <= 60)
                            oracle_zone1_bytes = oracle_zone1_bytes + 1;
                        else if (frame_b_pos <= 252)
                            zone2_mask_positions_applied = zone2_mask_positions_applied + 1;
                        else
                            oracle_zone3_bytes = oracle_zone3_bytes + 1;

                        if (mask_byte_cur != 8'h00) begin
                            inj_changed_bytes_cnt = inj_changed_bytes_cnt + 1;
                            word_changed_flag     = 1;
                            for (bit_k = 0; bit_k < 8; bit_k = bit_k + 1) begin
                                if (mask_byte_cur[bit_k])
                                    inj_flipped_bits_cnt = inj_flipped_bits_cnt + 1;
                            end
                        end
                    end
                end

                if (post_inj_byte_wr < 12468 && word_changed_flag != 0)
                    inj_changed_words_cnt <= inj_changed_words_cnt + 1;

                // Verify u_error_inject output matches clean_word ^ exp_oracle_mask
                if (err_inj_out_data !== (inj_clean_word_fifo[inj_clean_rd_ptr] ^ exp_oracle_mask))
                    inj_oracle_mismatch_cnt <= inj_oracle_mismatch_cnt + 1;

                inj_clean_rd_ptr <= inj_clean_rd_ptr + 1;
                post_inj_byte_wr <= post_inj_byte_wr + 4;
            end

            // Track GTH RX Target Bytes
            if (gth_rx_valid) begin
                if (stg_gth_rx_target_bytes + 4 <= 12468)
                    stg_gth_rx_target_bytes <= stg_gth_rx_target_bytes + 4;
                else if (stg_gth_rx_target_bytes < 12468)
                    stg_gth_rx_target_bytes <= 12468;
            end
        end
    end

    // Compare CDC 3 128-bit Output against Post-Injector Reference (Comparison Point 1)
    integer b_c3;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stg_rs_mux_out_bytes          <= 0;
            stg_lpc_out_bytes             <= 0;
            stg_gbx_out_bytes             <= 0;
            stg_cdc3_target_bytes         <= 0;
            stg_cdc3_follow_on_bytes      <= 0;
            stg_cdc3_total_words128       <= 0;
            stg_demux_preamble_bytes      <= 0;
            stg_demux_lpc_bytes           <= 0;
            transport_target_mismatch_cnt <= 0;
            xz_violation_logic_cnt        <= 0;
        end else begin
            // Check clk_logic control & active data buses for X/Z on every cycle
            if (ctrl_xz_logic || data_xz_logic)
                xz_violation_logic_cnt <= xz_violation_logic_cnt + 1;

            if (mux_dv && (stg_rs_mux_out_bytes < 8288))
                stg_rs_mux_out_bytes <= stg_rs_mux_out_bytes + 8;
            if (lpc_dv && (stg_lpc_out_bytes < 12432))
                stg_lpc_out_bytes <= stg_lpc_out_bytes + 12;
            if (gbx_dv && (stg_gbx_out_bytes < 12468))
                stg_gbx_out_bytes <= stg_gbx_out_bytes + ((gbx_keep_out == 16'h1FFF) ? 13 : 16);

            if (cdc3_out_valid) begin
                cdc3_word_mismatch_tmp = 0;
                for (b_c3 = 0; b_c3 < 16; b_c3 = b_c3 + 1) begin
                    if (((stg_cdc3_total_words128 * 16) + b_c3) < 12468) begin
                        if ((^cdc3_out_data[127 - 8 * b_c3 -: 8] === 1'bx) ||
                            (cdc3_out_data[127 - 8 * b_c3 -: 8] !== post_inj_target_bytes[(stg_cdc3_total_words128 * 16) + b_c3])) begin
                            cdc3_word_mismatch_tmp = cdc3_word_mismatch_tmp + 1;
                        end
                    end
                end
                transport_target_mismatch_cnt <= transport_target_mismatch_cnt + cdc3_word_mismatch_tmp;
                stg_cdc3_total_words128       <= stg_cdc3_total_words128 + 1;

                if (stg_cdc3_target_bytes + 16 <= 12468) begin
                    stg_cdc3_target_bytes <= stg_cdc3_target_bytes + 16;
                end else if (stg_cdc3_target_bytes < 12468) begin
                    // 780th word straddles 4 target bytes (12464..12467) + 12 follow-on bytes
                    stg_cdc3_target_bytes    <= 12468;
                    stg_cdc3_follow_on_bytes <= stg_cdc3_follow_on_bytes + 12;
                end else begin
                    stg_cdc3_follow_on_bytes <= stg_cdc3_follow_on_bytes + 16;
                end
            end

            if (rx_preamble_valid && (stg_demux_preamble_bytes < 36))
                stg_demux_preamble_bytes <= stg_demux_preamble_bytes + 9;
            if (rx_demux_lpc_valid && (stg_demux_lpc_bytes < 12432))
                stg_demux_lpc_bytes <= stg_demux_lpc_bytes + 12;
        end
    end

    // --- 7.4 Comparison Point 2 (Codeword TX -> RX RS Decoder Input with Per-Codeword Completeness) &
    //         Comparison Point 3 (Pre-CDC 1 Info -> Post-CDC 4 Output per Frame/Lane) ---
    reg  [7:0]  tx_hdr_cw_queue   [0:511];
    reg  [63:0] tx_pld_cw_queue   [0:2047];
    integer     tx_hdr_cw_wr = 0, rx_hdr_cw_rd = 0;
    integer     tx_pld_cw_wr = 0, rx_pld_cw_rd = 0;

    // Live per-frame waveform counters for current RX frame
    reg  [4:0]  rs_hdr_symbol_err_cnt   = 5'd0;
    reg  [4:0]  rs_lane0_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane1_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane2_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane3_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane4_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane5_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane6_symbol_err_cnt = 5'd0;
    reg  [4:0]  rs_lane7_symbol_err_cnt = 5'd0;

    // Per-frame (0..3) and per-lane (0..7) Codeword Completeness, Error, & Decoded Mismatch Tables
    integer     cw_hdr_tx_sym_cnt        [0:3];
    integer     cw_hdr_rx_sym_cnt        [0:3];
    integer     cw_pld_tx_sym_cnt        [0:3];
    integer     cw_pld_rx_lane_sym_cnt   [0:3][0:7];
    integer     cw_hdr_err_table         [0:3];
    integer     cw_pld_lane_err_table    [0:3][0:7];
    integer     cdc4_hdr_frame_bytes     [0:3];
    integer     cdc4_pld_frame_words     [0:3];
    integer     cdc4_hdr_mismatch_table  [0:3];
    integer     cdc4_pld_lane_mismatch   [0:3][0:7];

    integer     f_init, l_init;
    initial begin
        for (f_init = 0; f_init < 4; f_init = f_init + 1) begin
            cw_hdr_tx_sym_cnt[f_init]       = 0;
            cw_hdr_rx_sym_cnt[f_init]       = 0;
            cw_pld_tx_sym_cnt[f_init]       = 0;
            cw_hdr_err_table[f_init]        = 0;
            cdc4_hdr_frame_bytes[f_init]    = 0;
            cdc4_pld_frame_words[f_init]    = 0;
            cdc4_hdr_mismatch_table[f_init] = 0;
            for (l_init = 0; l_init < 8; l_init = l_init + 1) begin
                cw_pld_rx_lane_sym_cnt[f_init][l_init] = 0;
                cw_pld_lane_err_table[f_init][l_init]  = 0;
                cdc4_pld_lane_mismatch[f_init][l_init] = 0;
            end
        end
    end

    wire        rs_all_lanes_within_t8_limit = (rs_lane0_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane1_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane2_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane3_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane4_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane5_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane6_symbol_err_cnt <= 5'd8) &&
                                               (rs_lane7_symbol_err_cnt <= 5'd8);

    wire [63:0] rs_lane_status_str = rs_all_lanes_within_t8_limit ? "ALL_<=8 " : "EXCEEDS8";

    integer     cur_tx_f, cur_cw_f, cur_cw_l;
    always @(posedge clk) if (rst_n) begin
        // Record TX RS Codewords (32B Header & 255x64b Payload per frame) & Completeness
        if (rs_head_dv) begin
            cur_tx_f = tx_hdr_cw_wr / 32;
            if (cur_tx_f < 4)
                cw_hdr_tx_sym_cnt[cur_tx_f] = cw_hdr_tx_sym_cnt[cur_tx_f] + 1;
            tx_hdr_cw_queue[tx_hdr_cw_wr] = rs_head_out;
            tx_hdr_cw_wr                  = tx_hdr_cw_wr + 1;
        end
        if (rs_load_dv) begin
            cur_tx_f = tx_pld_cw_wr / 255;
            if (cur_tx_f < 4)
                cw_pld_tx_sym_cnt[cur_tx_f] = cw_pld_tx_sym_cnt[cur_tx_f] + 1;
            tx_pld_cw_queue[tx_pld_cw_wr] = rs_load_out;
            tx_pld_cw_wr                  = tx_pld_cw_wr + 1;
        end

        // Comparison Point 2A: Count symbol errors & completeness entering RX RS(32,16) Header Decoder
        if (rx_rs_hdr_in_valid) begin
            cur_cw_f = rx_hdr_cw_rd / 32;
            if (rx_rs_hdr_in_clk_cnt == 6'd1)
                rs_hdr_symbol_err_cnt = (rx_rs_hdr_in_data !== tx_hdr_cw_queue[rx_hdr_cw_rd]) ? 5'd1 : 5'd0;
            else if (rx_rs_hdr_in_data !== tx_hdr_cw_queue[rx_hdr_cw_rd])
                rs_hdr_symbol_err_cnt = rs_hdr_symbol_err_cnt + 5'd1;

            if (cur_cw_f < 4) begin
                cw_hdr_rx_sym_cnt[cur_cw_f] = cw_hdr_rx_sym_cnt[cur_cw_f] + 1;
                if (rx_rs_hdr_in_data !== tx_hdr_cw_queue[rx_hdr_cw_rd])
                    cw_hdr_err_table[cur_cw_f] = cw_hdr_err_table[cur_cw_f] + 1;
            end
            rx_hdr_cw_rd = rx_hdr_cw_rd + 1;
        end

        // Comparison Point 2B: Count symbol errors & completeness per lane (Lanes 0..7) entering RX RS(255,239) Payload Decoder
        if (rx_rs_pld_in_valid) begin
            cur_cw_f = rx_pld_cw_rd / 255;
            if (rx_rs_pld_in_clk_cnt == 9'd1) begin
                rs_lane0_symbol_err_cnt = (rx_rs_pld_in_data[7:0]   !== tx_pld_cw_queue[rx_pld_cw_rd][7:0])   ? 5'd1 : 5'd0;
                rs_lane1_symbol_err_cnt = (rx_rs_pld_in_data[15:8]  !== tx_pld_cw_queue[rx_pld_cw_rd][15:8])  ? 5'd1 : 5'd0;
                rs_lane2_symbol_err_cnt = (rx_rs_pld_in_data[23:16] !== tx_pld_cw_queue[rx_pld_cw_rd][23:16]) ? 5'd1 : 5'd0;
                rs_lane3_symbol_err_cnt = (rx_rs_pld_in_data[31:24] !== tx_pld_cw_queue[rx_pld_cw_rd][31:24]) ? 5'd1 : 5'd0;
                rs_lane4_symbol_err_cnt = (rx_rs_pld_in_data[39:32] !== tx_pld_cw_queue[rx_pld_cw_rd][39:32]) ? 5'd1 : 5'd0;
                rs_lane5_symbol_err_cnt = (rx_rs_pld_in_data[47:40] !== tx_pld_cw_queue[rx_pld_cw_rd][47:40]) ? 5'd1 : 5'd0;
                rs_lane6_symbol_err_cnt = (rx_rs_pld_in_data[55:48] !== tx_pld_cw_queue[rx_pld_cw_rd][55:48]) ? 5'd1 : 5'd0;
                rs_lane7_symbol_err_cnt = (rx_rs_pld_in_data[63:56] !== tx_pld_cw_queue[rx_pld_cw_rd][63:56]) ? 5'd1 : 5'd0;
            end else begin
                if (rx_rs_pld_in_data[7:0]   !== tx_pld_cw_queue[rx_pld_cw_rd][7:0])   rs_lane0_symbol_err_cnt = rs_lane0_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[15:8]  !== tx_pld_cw_queue[rx_pld_cw_rd][15:8])  rs_lane1_symbol_err_cnt = rs_lane1_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[23:16] !== tx_pld_cw_queue[rx_pld_cw_rd][23:16]) rs_lane2_symbol_err_cnt = rs_lane2_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[31:24] !== tx_pld_cw_queue[rx_pld_cw_rd][31:24]) rs_lane3_symbol_err_cnt = rs_lane3_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[39:32] !== tx_pld_cw_queue[rx_pld_cw_rd][39:32]) rs_lane4_symbol_err_cnt = rs_lane4_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[47:40] !== tx_pld_cw_queue[rx_pld_cw_rd][47:40]) rs_lane5_symbol_err_cnt = rs_lane5_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[55:48] !== tx_pld_cw_queue[rx_pld_cw_rd][55:48]) rs_lane6_symbol_err_cnt = rs_lane6_symbol_err_cnt + 5'd1;
                if (rx_rs_pld_in_data[63:56] !== tx_pld_cw_queue[rx_pld_cw_rd][63:56]) rs_lane7_symbol_err_cnt = rs_lane7_symbol_err_cnt + 5'd1;
            end

            if (cur_cw_f < 4) begin
                for (cur_cw_l = 0; cur_cw_l < 8; cur_cw_l = cur_cw_l + 1) begin
                    cw_pld_rx_lane_sym_cnt[cur_cw_f][cur_cw_l] = cw_pld_rx_lane_sym_cnt[cur_cw_f][cur_cw_l] + 1;
                    if (rx_rs_pld_in_data[8 * cur_cw_l +: 8] !== tx_pld_cw_queue[rx_pld_cw_rd][8 * cur_cw_l +: 8])
                        cw_pld_lane_err_table[cur_cw_f][cur_cw_l] = cw_pld_lane_err_table[cur_cw_f][cur_cw_l] + 1;
                end
            end
            rx_pld_cw_rd = rx_pld_cw_rd + 1;
        end
    end

    // Comparison Point 3: Compare Pre-CDC 1 Reference vs. Post-CDC 4 Output (312.5 MHz)
    integer decoded_hdr_ok_cnt        = 0;
    integer decoded_pld_ok_cnt        = 0; // Counts intact 32-bit payload words out of 1,912
    integer total_hdr_info_mismatches = 0;
    integer total_pld_info_mismatches = 0; // Counts mismatched 32-bit payload words out of 1,912
    integer total_pld_byte_mismatches = 0; // Counts mismatched payload bytes across all 8 lanes

    integer cdc4_f_idx, cdc4_hdr_b_idx, cdc4_pld_w32_idx, cdc4_pld_w64_idx;
    reg [7:0]  exp_hdr_b;
    reg [63:0] exp_pld_w64;
    reg [31:0] exp_pld_w32;
    integer    b32_lane;
    integer    word32_byte_err_tmp;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            stg_cdc4_target_hdr_bytes <= 0;
            stg_cdc4_target_pld_words <= 0;
            stg_cdc4_filler_hdr_bytes <= 0;
            stg_cdc4_filler_pld_words <= 0;
            decoded_hdr_ok_cnt        <= 0;
            decoded_pld_ok_cnt        <= 0;
            total_hdr_info_mismatches <= 0;
            total_pld_info_mismatches <= 0;
            total_pld_byte_mismatches <= 0;
        end else begin
            // 1. CDC 4 Header Output Check (Target Frames 1..4 vs Filler Frames 5+)
            if (cdc4_hdr_out_valid) begin
                if (stg_cdc4_target_hdr_bytes < 64) begin
                    cdc4_f_idx     = (stg_cdc4_target_hdr_bytes / 16) + 1; // 1..4
                    cdc4_hdr_b_idx = (stg_cdc4_target_hdr_bytes % 16) + 1; // 1..16
                    exp_hdr_b      = get_oisl_header_byte(cdc4_f_idx, cdc4_hdr_b_idx);

                    cdc4_hdr_frame_bytes[cdc4_f_idx - 1] = cdc4_hdr_frame_bytes[cdc4_f_idx - 1] + 1;
                    if (cdc4_hdr_out_data === exp_hdr_b) begin
                        decoded_hdr_ok_cnt <= decoded_hdr_ok_cnt + 1;
                    end else begin
                        total_hdr_info_mismatches               <= total_hdr_info_mismatches + 1;
                        cdc4_hdr_mismatch_table[cdc4_f_idx - 1] = cdc4_hdr_mismatch_table[cdc4_f_idx - 1] + 1;
                    end
                    stg_cdc4_target_hdr_bytes <= stg_cdc4_target_hdr_bytes + 1;
                end else begin
                    // Tagged as post-target FILLER header byte (never fails 4-frame target scoreboard)
                    stg_cdc4_filler_hdr_bytes <= stg_cdc4_filler_hdr_bytes + 1;
                end
            end

            // 2. CDC 4 Payload Output Check (Target Frames 1..4 = 1,912 words 32-bit vs Filler Frames 5+)
            if (cdc4_pld_out_valid) begin
                if (stg_cdc4_target_pld_words < 1912) begin
                    cdc4_f_idx       = (stg_cdc4_target_pld_words / 478) + 1; // 1..4
                    cdc4_pld_w32_idx = (stg_cdc4_target_pld_words % 478);     // 0..477
                    cdc4_pld_w64_idx = (cdc4_pld_w32_idx / 2) + 1;            // 1..239
                    exp_pld_w64      = get_oisl_payload_word64(cdc4_f_idx, cdc4_pld_w64_idx);
                    exp_pld_w32      = (cdc4_pld_w32_idx[0] == 1'b0) ? exp_pld_w64[63:32] : exp_pld_w64[31:0];

                    cdc4_pld_frame_words[cdc4_f_idx - 1] = cdc4_pld_frame_words[cdc4_f_idx - 1] + 1;
                    if (cdc4_pld_out_data === exp_pld_w32) begin
                        decoded_pld_ok_cnt <= decoded_pld_ok_cnt + 1;
                    end else begin
                        total_pld_info_mismatches <= total_pld_info_mismatches + 1;
                    end

                    // [Rev 3.3 - Audit Sec. 4.1] Accumulate per-byte errors in blocking temporary
                    // 'word32_byte_err_tmp' before updating 'total_pld_byte_mismatches' once per clock
                    word32_byte_err_tmp = 0;
                    for (b32_lane = 0; b32_lane < 4; b32_lane = b32_lane + 1) begin
                        if (cdc4_pld_out_data[8 * b32_lane +: 8] !== exp_pld_w32[8 * b32_lane +: 8]) begin
                            word32_byte_err_tmp = word32_byte_err_tmp + 1;
                            if (cdc4_pld_w32_idx[0] == 1'b0)
                                cdc4_pld_lane_mismatch[cdc4_f_idx - 1][4 + b32_lane] =
                                    cdc4_pld_lane_mismatch[cdc4_f_idx - 1][4 + b32_lane] + 1;
                            else
                                cdc4_pld_lane_mismatch[cdc4_f_idx - 1][b32_lane] =
                                    cdc4_pld_lane_mismatch[cdc4_f_idx - 1][b32_lane] + 1;
                        end
                    end
                    total_pld_byte_mismatches <= total_pld_byte_mismatches + word32_byte_err_tmp;

                    stg_cdc4_target_pld_words <= stg_cdc4_target_pld_words + 1;
                end else begin
                    // Tagged as post-target FILLER payload word (never fails 4-frame target scoreboard)
                    stg_cdc4_filler_pld_words <= stg_cdc4_filler_pld_words + 1;
                end
            end
        end
    end

    // [Rev 2.0 & Rev 3.3 - Audit Sec. 4.3 & 4.4] Syndrome Verification Counters
    // Strictly indexed to Target Frames 0..3 (Frames 1..4) with permanent failure latching
    integer hdr_synd_frame_idx       = 0;
    integer pld_synd_frame_idx       = 0;
    integer hdr_synd_pass_cnt        = 0;
    integer pld_synd_pass_cnt        = 0; // Payload Lane 7 zero-syndrome passes (0..4)
    integer pld_synd_all8_pass_cnt   = 0; // All 8 Payload Lanes (0..7) zero-syndrome passes (0..4)
    integer hdr_synd_target_fail_cnt = 0;
    integer pld_synd_target_fail_cnt = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hdr_synd_frame_idx       <= 0;
            pld_synd_frame_idx       <= 0;
            hdr_synd_pass_cnt        <= 0;
            pld_synd_pass_cnt        <= 0;
            pld_synd_all8_pass_cnt   <= 0;
            hdr_synd_target_fail_cnt <= 0;
            pld_synd_target_fail_cnt <= 0;
        end else begin
            if (hdr_synd_done) begin
                if (hdr_synd_frame_idx < 4) begin
                    if (hdr_syndrome_vec == 128'd0)
                        hdr_synd_pass_cnt <= hdr_synd_pass_cnt + 1;
                    else
                        hdr_synd_target_fail_cnt <= hdr_synd_target_fail_cnt + 1;
                end
                hdr_synd_frame_idx <= hdr_synd_frame_idx + 1;
            end
            if (pld_synd_done) begin
                if (pld_synd_frame_idx < 4) begin
                    if (pld_syndrome_vec == 128'd0)
                        pld_synd_pass_cnt <= pld_synd_pass_cnt + 1;
                    if (pld_all8_lanes_synd_zero)
                        pld_synd_all8_pass_cnt <= pld_synd_all8_pass_cnt + 1;
                    else
                        pld_synd_target_fail_cnt <= pld_synd_target_fail_cnt + 1;
                end
                pld_synd_frame_idx <= pld_synd_frame_idx + 1;
            end
        end
    end

    // =======================================================
    // 8. SIMULATION TERMINATION & 100% ENGLISH ETRI AUDIT REPORT
    // =======================================================
    integer rpt_f, rpt_l;
    integer within_t8_codewords_tested   = 0;
    integer within_t8_codewords_healed   = 0;
    integer within_t8_uncorrected_fails  = 0;
    integer exceeds_t8_codewords_cnt     = 0;
    integer exceeds_t8_residual_bytes    = 0;
    integer sum_lane_byte_mismatches     = 0;
    reg     codeword_completeness_ok;
    reg     lane_mismatch_sum_ok;
    reg     stage_geometry_ok;

    initial begin
        // Wait until all 4 Target Frames (64B Header & 1,912W 32-bit Payload) exit CDC 4
        wait(stg_cdc4_target_hdr_bytes == 64 && stg_cdc4_target_pld_words == 1912);
        wait(cdc4_pld_out_valid == 1'b0);
        #500;

        // Evaluate Per-Codeword Completeness, Recovery Contract & Lane Sum Cross-Check (Audit Sec. 4 & 5)
        within_t8_codewords_tested  = 0;
        within_t8_codewords_healed  = 0;
        within_t8_uncorrected_fails = 0;
        exceeds_t8_codewords_cnt    = 0;
        exceeds_t8_residual_bytes   = 0;
        sum_lane_byte_mismatches    = 0;
        codeword_completeness_ok    = 1'b1;

        for (rpt_f = 0; rpt_f < 4; rpt_f = rpt_f + 1) begin
            // Verify full symbol/word completeness for Frame rpt_f before evaluating error counts
            if ((cw_hdr_tx_sym_cnt[rpt_f]     != 32)  ||
                (cw_hdr_rx_sym_cnt[rpt_f]     != 32)  ||
                (cw_pld_tx_sym_cnt[rpt_f]     != 255) ||
                (cdc4_hdr_frame_bytes[rpt_f]  != 16)  ||
                (cdc4_pld_frame_words[rpt_f]  != 478)) begin
                codeword_completeness_ok = 1'b0;
            end

            // Check Header RS(32,16) Codeword for Frame rpt_f
            if (cw_hdr_err_table[rpt_f] <= 8) begin
                within_t8_codewords_tested = within_t8_codewords_tested + 1;
                if (cdc4_hdr_mismatch_table[rpt_f] == 0)
                    within_t8_codewords_healed = within_t8_codewords_healed + 1;
                else
                    within_t8_uncorrected_fails = within_t8_uncorrected_fails + 1;
            end else begin
                exceeds_t8_codewords_cnt  = exceeds_t8_codewords_cnt + 1;
                exceeds_t8_residual_bytes = exceeds_t8_residual_bytes + cdc4_hdr_mismatch_table[rpt_f];
            end

            // Check 8 Parallel RS(255,239) Payload Codeword Lanes for Frame rpt_f
            for (rpt_l = 0; rpt_l < 8; rpt_l = rpt_l + 1) begin
                if (cw_pld_rx_lane_sym_cnt[rpt_f][rpt_l] != 255)
                    codeword_completeness_ok = 1'b0;

                sum_lane_byte_mismatches = sum_lane_byte_mismatches + cdc4_pld_lane_mismatch[rpt_f][rpt_l];

                if (cw_pld_lane_err_table[rpt_f][rpt_l] <= 8) begin
                    within_t8_codewords_tested = within_t8_codewords_tested + 1;
                    if (cdc4_pld_lane_mismatch[rpt_f][rpt_l] == 0)
                        within_t8_codewords_healed = within_t8_codewords_healed + 1;
                    else
                        within_t8_uncorrected_fails = within_t8_uncorrected_fails + 1;
                end else begin
                    exceeds_t8_codewords_cnt  = exceeds_t8_codewords_cnt + 1;
                    exceeds_t8_residual_bytes = exceeds_t8_residual_bytes + cdc4_pld_lane_mismatch[rpt_f][rpt_l];
                end
            end
        end

        lane_mismatch_sum_ok = (sum_lane_byte_mismatches == total_pld_byte_mismatches);

        stage_geometry_ok = (stg_cdc1_in_hdr_bytes        == 64)    &&
                            (stg_cdc1_in_pld_words32      == 1912)  &&
                            (stg_rs_mux_out_bytes         == 8288)  &&
                            (stg_lpc_out_bytes            == 12432) &&
                            (stg_gbx_out_bytes            == 12468) &&
                            (stg_cdc2_out_target_bytes    == 12468) &&
                            (stg_gth_rx_target_bytes      == 12468) &&
                            (stg_cdc3_target_bytes        == 12468) &&
                            (stg_cdc3_follow_on_bytes     >= 12)    &&
                            (stg_cdc3_total_words128      >= 780)   &&
                            (stg_demux_preamble_bytes     == 36)    &&
                            (stg_demux_lpc_bytes          == 12432) &&
                            (stg_cdc4_target_hdr_bytes    == 64)    &&
                            (stg_cdc4_target_pld_words    == 1912)  &&
                            (rx_preamble_locked           == 1'b1)  &&
                            (hdr_synd_pass_cnt            == 4)     &&
                            (pld_synd_pass_cnt            == 4)     &&
                            (pld_synd_all8_pass_cnt       == 4)     &&
                            (hdr_synd_target_fail_cnt     == 0)     &&
                            (pld_synd_target_fail_cnt     == 0)     &&
                            (oracle_zone1_bytes           == 240)   &&
                            (zone2_mask_positions_applied == 768)   &&
                            (oracle_zone3_bytes           == 11460) &&
                            (inj_oracle_mismatch_cnt      == 0)     &&
                            (transport_target_mismatch_cnt == 0)    &&
                            (xz_protocol_violation_cnt    == 0)     &&
                            codeword_completeness_ok                &&
                            lane_mismatch_sum_ok;

        $display("\n======================================================================");
        $display(" FULL-CHAIN CDC 1 -> GTH -> CDC 4 & FEC RS INTEGRATION REPORT (REV 3.3)");
        $display("======================================================================");
        $display(" -> Active Simulation Mode            : SIM_MODE = %0d (%s)", INJ_SIM_MODE, err_inj_mode_str);
        $display(" -> Test Vector Scope                 : Deterministic DAT1/DAT2/IDLE/MGMT vectors across production baseband + GTH transport");
        $display(" -> Pre-CDC 1 Info In (4 Frames)      : %0dB Header + %0dW (%0dB) Payload = %0dB Total (Exp: 64B + 7648B = 7712B)",
                 stg_cdc1_in_hdr_bytes, stg_cdc1_in_pld_words32, stg_cdc1_in_pld_words32 * 4,
                 stg_cdc1_in_hdr_bytes + (stg_cdc1_in_pld_words32 * 4));
        $display(" -> TX FEC_MUX / LPC / Gearbox 128    : RS=%0dB (Exp:8288B) | LPC=%0dB (Exp:12432B) | Stream=%0dB (Exp:12468B)",
                 stg_rs_mux_out_bytes, stg_lpc_out_bytes, stg_gbx_out_bytes);
        $display(" -> TX RS Zero-Syndrome (Target Fr1-4): Header=%0d/4 (Fails:%0d) | Payload Lane7=%0d/4 | All 8 Payload Lanes (32 CWs)=%0d/4 (Fails:%0d)",
                 hdr_synd_pass_cnt, hdr_synd_target_fail_cnt, pld_synd_pass_cnt, pld_synd_all8_pass_cnt, pld_synd_target_fail_cnt);
        $display(" -> Injector Zone Oracle (4 Frames)   : Zone1=%0dB (Exp:240B) | Zone2_MaskPos=%0dB (Exp:768B) | Zone3=%0dB (Exp:11460B)",
                 oracle_zone1_bytes, zone2_mask_positions_applied, oracle_zone3_bytes);
        $display(" -> Injector Actual Changes Applied   : ChangedWords=%0d | ChangedBytes=%0d | FlippedBits=%0d | OracleMismatch=%0d",
                 inj_changed_words_cnt, inj_changed_bytes_cnt, inj_flipped_bits_cnt, inj_oracle_mismatch_cnt);
        $display(" -> Point 1 (Injector -> GTH/CDC 3)   : Target=%0dB (Exp:12468B) | MinRequiredFollowOn=12B (780W=12480B) | ObservedFollowOnAtReport=%0dB (Words128=%0d) | TransportMismatch=%0d",
                 stg_cdc3_target_bytes, stg_cdc3_follow_on_bytes, stg_cdc3_total_words128, transport_target_mismatch_cnt);
        $display(" -> Core RX Demux 128 Target Output   : Preambles=%0dB (Exp:36B, Lock=%0b) | LPC=%0dB (Exp:12432B)",
                 stg_demux_preamble_bytes, rx_preamble_locked, stg_demux_lpc_bytes);
        $display(" -> Codeword Symbol Completeness      : Complete=%0b (Each Frame: 32B Hdr CW, 8x255B Pld CW, 16B CDC4 Hdr, 478W CDC4 Pld)",
                 codeword_completeness_ok);
        $display(" -> X/Z Protocol & Bus Check          : TotalViolations=%0d (clk_gth=%0d, clk_logic=%0d)",
                 xz_protocol_violation_cnt, xz_violation_gth_cnt, xz_violation_logic_cnt);
        $display("----------------------------------------------------------------------");
        $display(" POINT 2 & 3 PER-FRAME / PER-LANE CODEWORD ERROR & DECODED INFO TABLE:");
        for (rpt_f = 0; rpt_f < 4; rpt_f = rpt_f + 1) begin
            $display("   [Frame %0d] Hdr CW(%2dB) Err: %2d/32B -> CDC4 Hdr(%2dB) Mismatch: %2d/16B | Pld CW(255B/L) Err [L0..L7]: [%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d] -> CDC4 Byte Mismatch [L0..L7]: [%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d]",
                     rpt_f + 1, cw_hdr_rx_sym_cnt[rpt_f], cw_hdr_err_table[rpt_f],
                     cdc4_hdr_frame_bytes[rpt_f], cdc4_hdr_mismatch_table[rpt_f],
                     cw_pld_lane_err_table[rpt_f][0], cw_pld_lane_err_table[rpt_f][1],
                     cw_pld_lane_err_table[rpt_f][2], cw_pld_lane_err_table[rpt_f][3],
                     cw_pld_lane_err_table[rpt_f][4], cw_pld_lane_err_table[rpt_f][5],
                     cw_pld_lane_err_table[rpt_f][6], cw_pld_lane_err_table[rpt_f][7],
                     cdc4_pld_lane_mismatch[rpt_f][0], cdc4_pld_lane_mismatch[rpt_f][1],
                     cdc4_pld_lane_mismatch[rpt_f][2], cdc4_pld_lane_mismatch[rpt_f][3],
                     cdc4_pld_lane_mismatch[rpt_f][4], cdc4_pld_lane_mismatch[rpt_f][5],
                     cdc4_pld_lane_mismatch[rpt_f][6], cdc4_pld_lane_mismatch[rpt_f][7]);
        end
        $display("----------------------------------------------------------------------");
        $display(" -> Codewords Within RS Limit (<=8)   : %0d / %0d Healed to 0 Mismatches (Uncorrected <=8 Failures: %0d)",
                 within_t8_codewords_healed, within_t8_codewords_tested, within_t8_uncorrected_fails);
        $display(" -> Codewords Exceeding RS Limit (>8) : %0d Lanes (Residual Info Byte Mismatches on >8 Lanes: %0d)",
                 exceeds_t8_codewords_cnt, exceeds_t8_residual_bytes);
        $display(" -> Point 3 (CDC 4 Target Output)     : Header=%0d/64B Intact (Mismatch:%0d) | Payload=%0d/1912W Intact (%0d mismatched 32-bit payload words containing %0d erroneous bytes at the CDC 4 output; LaneSumMatch=%0b)",
                 decoded_hdr_ok_cnt, total_hdr_info_mismatches, decoded_pld_ok_cnt,
                 total_pld_info_mismatches, total_pld_byte_mismatches, lane_mismatch_sum_ok);
        $display(" -> Post-Target Filler Decoded (FILL) : %0d Header Bytes, %0d Payload Words (Tracked Separately)",
                 stg_cdc4_filler_hdr_bytes, stg_cdc4_filler_pld_words);
        $display(" -> CDC 4 Extracted Test Markers      : ASCII=\"%s\" | FCS=0x%08X | MGMT_RANGE=0x%016X",
                 cdc4_ASCII_TAG, cdc4_ETH_FCS, cdc4_MGMT_RANGE);

        if (INJ_SIM_MODE == 0) begin
            if (stage_geometry_ok &&
                (total_hdr_info_mismatches == 0) &&
                (total_pld_info_mismatches == 0) &&
                (total_pld_byte_mismatches == 0) &&
                (cdc4_ASCII_TAG  == "Kookmin FSO ") &&
                (cdc4_ETH_FCS    == 32'hDEAD_BEEF)  &&
                (cdc4_MGMT_RANGE == 64'h4153_12D0_0000_0000)) begin
                $display(" -> RESULT: [PASS] Full-chain clean mode verified: 4 target test-vector frames (DAT1, DAT2, IDLE, MGMT), 64B header and 7,648B (1,912W) payload matched with 0 mismatches.");
            end else begin
                $fatal(1, " -> RESULT: [FAIL] Full-chain clean mode verification failed!");
            end
        end else begin
            if (stage_geometry_ok &&
                (inj_changed_bytes_cnt > 0) &&
                (within_t8_uncorrected_fails == 0) &&
                (total_hdr_info_mismatches == 0)) begin
                $display(" -> RESULT: [PASS] Injection and transport verification passed; FEC recovery reported per codeword (%0d/%0d codewords with <=8 symbol errors healed to 0 mismatches; %0d codewords with >8 symbol errors reported separately with %0d mismatched 32-bit payload words containing %0d erroneous bytes at the CDC 4 output).",
                         within_t8_codewords_healed, within_t8_codewords_tested,
                         exceeds_t8_codewords_cnt, total_pld_info_mismatches, total_pld_byte_mismatches);
            end else begin
                $fatal(1, " -> RESULT: [FAIL] Full-chain error.mem mode failed transport, geometry, completeness, or <=8 codeword recovery check!");
            end
        end
        $display("======================================================================\n");
        $finish;
    end

endmodule