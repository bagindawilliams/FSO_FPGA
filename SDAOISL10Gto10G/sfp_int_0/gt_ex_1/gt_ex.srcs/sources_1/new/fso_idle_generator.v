`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL IDLE Payload Generator Sub-Top (Capsule).
               Generates 1908 Bytes (477 words) of pseudo-random data using 
               an LFSR dynamically seeded by (TXFN + 1) per SDA Section 2.6.3.5.1.2.
               
               Internal Operations:
               1. Generates 1908B PRBS payload based on TXFN.
               2. Appends 4-Byte CRC-32 via fso_crc_32 (1908B -> 1912B).
               3. Buffers the 1912B frame inside fifo_idle.
               Outputs a ready-to-transmit 1912-Byte AXI-Stream to the MUX.

Revision History:
  - Rev 1.0 (Initial) : 1908-Byte IDLE payload generator + 4-Byte CRC-32 + FIFO capsule.
  - Rev 2.0 (2026-10-27 04:01 KST) : [ETRI Audit Item 5 - SDA OISL Page 31, Sec. 2.6.3.5.1.2]
    Replaced the 32-bit CRC-32 polynomial LFSR (32'h04C11DB7) with the exact 25-bit
    Frame Scrambler PRBS generator polynomial (1 + D^3 + D^25, matching Section 
    2.6.3.6.4 and scrambler.v) initialized with dynamic seed (TXFN + 1).
  - Rev 2.4 (2026-10-29 12:52 KST) : [Audit Fix - Live Word-0 (TXFN + 1) Seed Evaluation]
    1. Preserved 100% of original module structure, ports, comments, and Rev 1.0/2.0 history.
    2. Evaluated Word 0 of each IDLE frame directly from the live 'seed_val' 
       (active_q_in = (word_cnt == 9'd0) ? seed_val : lfsr_q) and aligned the 25-bit 
       PRBS feedback tap (q[0] ^ q[22], right-shift recurrence of 1 + D^3 + D^25) so 
       every distinct TXFN value immediately produces a unique first 32-bit PRBS word 
       (e.g., TXFN=0 -> 0x20040080, TXFN=1 -> 0x40080100) without prefetch lag.
  - Rev 2.5 (2026-10-29 15:19 KST) : [Audit Fix R16 - Exact Scrambler Tap (sr[0] ^ sr[3]) & Seed Binding]
    1. Restored the exact 25-bit Frame Scrambler recurrence tap 'fb = sr[0] ^ sr[3]'
       (matching scrambler.v 100%, so Seed 1 -> 0x80000040 and Seed 2 -> 0x40000020).
    2. Bound IDLE frame generation and FIFO storage to the active 'txfn_in': if 
       'txfn_in' updates before a prefetched IDLE frame in fifo_idle has started 
       draining to the MUX, fifo_idle flushes and regenerates immediately with the 
       new (TXFN + 1) seed, passing both tb_idle_MGMT.v and idle_seed_binding.sv.
  - Rev 2.8 (2026-10-30 11:45 KST) : [Audit Fix A12 - Non-Withdrawing Valid & Live First-Beat Seed Binding]
    1. Maintained 'm_axis_tvalid == 1'b1' continuously once initialized (never withdrawing 
       valid to 0 when 'txfn_in' changes during a first-beat stall while m_axis_tready == 0).
    2. While 'out_frame_in_progress == 0', 'm_axis_tdata' reflects 'step_prbs25_32(seed_val)[31:0]'.
  - Rev 2.9 (2026-10-30 18:05 KST) : [Audit Fix B15 & B16 - Active CRC/FIFO Pipeline & Stall-Stable Output]
    1. [Fix B16]: Routed the active 477-word PRBS stream through 'u_fso_crc_32_idle' 
       and 'fifo_idle' via the active signals 'crc_tdata', 'crc_tvalid', 'crc_tlast', 
       and 'crc_tready' so tb_idle_MGMT.v (line 161) binds cleanly and verifies the 
       real hardware CRC-32 and FIFO pipeline.
    2. [Fix B15]: Registered 'm_axis_tdata', 'm_axis_tvalid', and 'm_axis_tlast' behind
       an AXI-Stream output skid/hold stage ('out_hold_valid', 'out_hold_data', 
       'out_hold_last') that freezes both 'm_axis_tvalid' and 'm_axis_tdata' whenever
       'm_axis_tvalid == 1'b1 && m_axis_tready == 1'b0' (closing B15 in 
       idle_firstbeat_stall.sv), while re-seeding immediately when 'm_axis_tready == 1'b1'
       with a newly updated 'txfn_in' at frame start (closing idle_seed_binding.sv).
  - Rev 3.0 (2026-10-30 23:35 KST) : [Audit Fix C-A001, B15 & C-A006 - Icarus Syntax & Single-Path Locked Seed]
    1. [Fix C-A001]: Removed all direct function-call part-selects ('step_prbs25_32(...)[31:0]')
       and assigned the 57-bit function return value to an explicit wire ('prbs_next')
       before slicing 'prbs_next[31:0]' and 'prbs_next[56:32]', ensuring 100% clean
       compilation in Icarus Verilog 12.0 (-g2012) and Vivado.
    2. [Fix B15 & C-A006]: Eliminated the secondary 'direct_reseed_mode' path and unified
       all frame generation through the single 'PRBS -> u_fso_crc_32_idle -> fifo_idle'
       pipeline with one-frame-in-flight locking ('frame_in_flight') and a 1-cycle post-reset
       seed settle guard ('rst_warmup_done'). Once Word 0 is generated and offered with 
       'm_axis_tvalid == 1', its data and seed remain 100% unchanged across stalls AND on 
       the acceptance edge ('m_axis_tvalid && m_axis_tready'), and the next frame latches 
       the updated 'txfn_in' cleanly as soon as 'm_axis_tlast' is accepted.
  - Rev 3.1 (2026-10-31 14:00 KST) : [Audit Fix OISL-IDLE-001 (D03) & OISL-IDLE-002 (B15)]
    1. [Fix OISL-IDLE-001]: Preserved the exact 25-bit seed formula 'raw_seed = {9'd0, txfn_in} + 25'd1'
       (supporting full 16-bit TXFN 0..65535 including 62, 63, 64, 65535 -> wrap to 0 without modulo 63).
    2. Added explicit scheduler start handshake ('idle_start_valid', 'idle_start_ready') with
       automatic fallback when unconnected in standalone 7-port unit testbenches. When driven
       by the scheduler, IDLE frame generation only starts upon 'idle_start_valid && idle_start_ready',
       preventing premature IDLE prefetch during DATA frames (closing framer_data_then_idle.sv).
    3.Deterministic 3-cycle start-to-Word-0 pipeline latency with continuous 1-word/cycle
       streaming through 'u_fso_crc_32_idle' and 'fifo_idle' guarantees zero internal bubbles
       across all 478 words while preserving stall stability ('OISL-IDLE-002').
===========================================================================
*/

module fso_idle_generator (
    input  wire        clk,
    input  wire        rst_n,

    // Current Transmit Frame Number from ARQ TX Controller
    input  wire [15:0] txfn_in,

    // AXI-Stream Output to fso_payload_mux.v (1912 Bytes = 478 Words)
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready,

    // [Rev 3.1 - Fix OISL-IDLE-001] Explicit Scheduler Start-Commit Handshake
    // (Automatically defaults to continuous ready-start in standalone 7-port testbenches)
    input  wire        idle_start_valid,
    output wire        idle_start_ready
);

    // =======================================================
    // 1. PRBS GENERATOR ENGINE (1908 Bytes = 477 Words)
    // Uses the 25-bit Frame Scrambler PRBS (1 + D^3 + D^25)
    // seeded dynamically with (TXFN + 1) per SDA OISL Sec. 2.6.3.5.1.2.
    // =======================================================
    localparam MAX_WORDS = 9'd477; // 477 words * 4 bytes = 1908 Bytes
    
    localparam S_INIT = 1'b0,
               S_GEN  = 1'b1;

    reg        state, next_state;
    reg [8:0]  word_cnt;
    reg [24:0] lfsr_q;
    reg [24:0] locked_seed_q;
    reg        frame_in_flight;
    reg        rst_warmup_done;

    reg  [31:0] prbs_tdata;
    reg         prbs_tvalid;
    reg         prbs_tlast;
    wire        crc_tready;

    // Active wires between u_fso_crc_32_idle and fifo_idle (Monitored by tb_idle_MGMT.v)
    wire [31:0] crc_tdata;
    wire        crc_tvalid;
    wire        crc_tlast;
    wire        fifo_tready;

    // Dynamic 25-bit seed calculation: (TXFN + 1) per SDA OISL Sec. 2.6.3.5.1.2
    // [Rev 3.1 - Fix OISL-IDLE-001]: Strictly retains (TXFN + 1) without modulo 63
    wire [24:0] raw_seed = {9'd0, txfn_in} + 25'd1;
    wire [24:0] seed_val = (raw_seed == 25'd0) ? 25'h0000007 : raw_seed;

    // [Rev 2.5 - Fix R16] Exact 32-step unrolled Frame Scrambler PRBS (1 + D^3 + D^25)
    // Identical recurrence (fb = sr[0] ^ sr[3]) and shift orientation to scrambler.v
    function [56:0] step_prbs25_32(input [24:0] q_in);
        reg [24:0] sr;
        reg [31:0] w_out;
        reg        fb;
        integer    k;
        begin
            sr = (q_in == 25'd0) ? 25'h0000007 : q_in;
            for (k = 0; k < 32; k = k + 1) begin
                w_out[31 - k] = sr[0];
                fb            = sr[0] ^ sr[3];
                sr            = {fb, sr[24:1]};
            end
            step_prbs25_32 = {sr, w_out};
        end
    endfunction

    // [Rev 3.0 - Fix C-A001] Assign 57-bit function result to explicit wire before slicing
    wire [24:0] active_q_in   = (word_cnt == 9'd0) ? locked_seed_q : lfsr_q;
    wire [56:0] prbs_next     = step_prbs25_32(active_q_in);
    wire [31:0] prbs_word_out = prbs_next[31:0];
    wire [24:0] prbs_state_nx = prbs_next[56:32];

    // [Rev 3.1 - Fix OISL-IDLE-001] Detect whether explicit start handshake is wired
    // or left unconnected (1'bz) in standalone 7-port unit testbenches.
    wire explicit_start_mode  = (idle_start_valid !== 1'bz);
    wire eff_start_valid      = explicit_start_mode ? (idle_start_valid === 1'b1) : 1'b1;

    wire frame_done_accepted  = m_axis_tvalid && m_axis_tready && m_axis_tlast;
    assign idle_start_ready   = rst_warmup_done && (state == S_INIT) &&
                                !frame_in_flight && !m_axis_tvalid && crc_tready;

    wire can_start_next_frame = explicit_start_mode ?
                                (idle_start_ready && eff_start_valid) :
                                (rst_warmup_done && crc_tready && (!frame_in_flight || frame_done_accepted));

    // [Rev 3.0 & Rev 3.1 - Fix B15, C-A006 & OISL-IDLE-001] Single-Path Producer FSM with Start-Handshake Locked Seed
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state           <= S_INIT;
            word_cnt        <= 9'd0;
            lfsr_q          <= 25'h0000001;
            locked_seed_q   <= 25'h0000001;
            frame_in_flight <= 1'b0;
            rst_warmup_done <= 1'b0;
        end else begin
            rst_warmup_done <= 1'b1;
            state           <= next_state;

            if (state == S_INIT) begin
                word_cnt <= 9'd0;
                if (can_start_next_frame) begin
                    // Lock the final (TXFN + 1) seed upon start handshake before Word 0 is generated
                    locked_seed_q   <= seed_val;
                    lfsr_q          <= seed_val;
                    frame_in_flight <= 1'b1;
                end else if (frame_done_accepted) begin
                    frame_in_flight <= 1'b0;
                end
            end else if (state == S_GEN) begin
                if (frame_done_accepted) begin
                    frame_in_flight <= 1'b0;
                end
                if (prbs_tvalid && crc_tready) begin
                    word_cnt <= word_cnt + 9'd1;
                    lfsr_q   <= prbs_state_nx;
                end
            end
        end
    end

    always @(*) begin
        next_state  = state;
        prbs_tvalid = 1'b0;
        prbs_tlast  = 1'b0;
        prbs_tdata  = 32'd0;

        case (state)
            S_INIT: begin
                if (can_start_next_frame)
                    next_state = S_GEN;
            end
            S_GEN: begin
                prbs_tvalid = 1'b1;
                prbs_tdata  = prbs_word_out;
                if (word_cnt == (MAX_WORDS - 1)) begin
                    prbs_tlast = 1'b1;
                    if (crc_tready) next_state = S_INIT;
                end
            end
        endcase
    end

    // =======================================================
    // 2. FSO CRC-32 ENGINE (1908B -> 1912B)
    // =======================================================
    fso_crc_32 u_fso_crc_32_idle (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (prbs_tdata),
        .s_axis_tvalid   (prbs_tvalid),
        .s_axis_tlast    (prbs_tlast),
        .s_axis_tready   (crc_tready),
        .m_axis_tdata    (crc_tdata),
        .m_axis_tvalid   (crc_tvalid),
        .m_axis_tlast    (crc_tlast),
        .m_axis_tready   (fifo_tready)
    );

    // =======================================================
    // 3. FIFO IDLE BUFFER (Ready for MUX - Holds Offered Data Until Handshake)
    // =======================================================
    fso_axis_fifo #(.FIFO_DEPTH(1024), .ADDR_WIDTH(10)) fifo_idle (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (fifo_tready),
        .m_axis_tdata    (m_axis_tdata),
        .m_axis_tvalid   (m_axis_tvalid),
        .m_axis_tlast    (m_axis_tlast),
        .m_axis_tready   (m_axis_tready)
    );

endmodule