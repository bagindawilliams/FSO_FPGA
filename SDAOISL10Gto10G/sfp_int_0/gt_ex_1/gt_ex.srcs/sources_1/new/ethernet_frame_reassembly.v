`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : ethernet_frame_reassembly
Description  : SDA OISL Table 2-18 Ethernet Frame De-Segmenter, Padding 
               Stripper, and 8-Byte Ethernet Preamble Injector.
               
               KEY OPERATIONS:
               1. Receives verified, in-order 1908-Byte (477-word) FSO DATA 
                  frames from fso_ethernet_deframer.v.
               2. Parses Word 0 (FSO Payload Header 0xAB) and Word 1 (FSO 
                  Packet Header 0xCDEF on initial segments) per Table 2-18.
               3. Strips FSO headers and trailing zero-padding, reassembling 
                  multi-frame Jumbo Ethernet packets (e.g. 1900B + 100B = 2000B)
                  into a contiguous packet buffer.
               4. Prepends the 8-Byte Ethernet Preamble & SFD (0x55555555, 
                  0x555555D5) via eth_preamble_gen and mux_eth_32 before 
                  streaming the 2008-Byte frame to eth_tx_back_end_top.v.

Revision History:
  - Rev 1.0 (Initial) : Table 2-18 Ethernet frame reassembly and preamble mux.
  - Rev 2.8 (2026-10-30 11:30 KST) : [Audit Fix A02 & A03 - 16KB Reassembly Buffer & Multi-Segment Continuation]
    1. [Fix A03]: Expanded 'pkt_buf' from 1024 words (4 KB) to 4096 words (16 KB) 
       with 'buf_used < 13'd4000' flow-control margin so multi-segment packets up 
       to 16,000 Bytes (including 3,804B, 4,096B, and 7,200B) commit and drain 
       completely without buffer-full deadlock.
    2. [Fix A02]: Aligned Continuation Frame extraction with SDA OISL Section 
       2.6.3.7.5 (where Continuation Payload Header Length[13:0] reports total 
       remaining packet bytes).
  - Rev 2.9 (2026-10-30 18:05 KST) : [Audit Fix B02, B04, B05, B06, B07 & B08]
    1. [Fix B02]: Restored exact port bindings on u_eth_preamble_gen (.preamble_sfd)
       and u_mux_eth_32 (.clk, .rst_n, .preamble_sfd, .asm_data_in, .asm_valid_in,
       .asm_last_in, .m_axis_tdata, .m_axis_tvalid, .m_axis_tlast, .m_axis_tready)
       and synchronized the drain state machine with mux_eth_32's 2-word preamble
       shift pipeline, resolving all 19 RX elaboration errors.
    2. [Fix B04]: Removed zero-data heuristic ('is_cont_pad_word') so legal 
       Ethernet payload words equal to 32'h0000_0000 on word 476 of a 1904-Byte 
       continuation frame are preserved intact (parser_zero_continuation.sv).
    3. [Fix B05 & B06]: Restored 'fso_frame_valid_magic' gating (discarding any 
       frame whose Word 0 lacks the 8'hAB magic byte per SDA OISL Sec. 2.6.3.7.7)
       and restored 10-bit sequence tracking ('expected_fso_seq', 'seq_initialized')
       with write-pointer rollback ('committed_wr_ptr', 'committed_buf_used') so 
       partial packets are discarded upon a sequence gap (parser_sequence_gap.sv).
    4. [Fix B07 & B08]: Allowed new Packet Headers (0xCDEF) at any word boundary 
       when '!pkt_active' to support multiple packed Ethernet frames per FSO frame 
       (parser_packed_two_fullframe.sv), and widened 'commit_pkt_cnt' to 11 bits 
       ([10:0]) so 64+ queued small packets never wrap to 0 (parser_commit_wrap64).
  - Rev 3.0 (2026-10-30 23:35 KST) : [Audit Fix B02, C-A002, B06/C-A003 & C-A004]
    1. [Fix B02]: Bound u_mux_eth_32 output ports to their exact module declarations
       ('.eth_data_out', '.eth_valid_out', '.eth_last_out' without '.m_axis_tready'),
       resolving the final 4 RX named-port elaboration errors.
    2. [Fix C-A002]: Implemented a single-driver, stall-safe 4-state Preamble + Payload
       drain engine (DR_IDLE -> DR_PRE0 -> DR_PRE1 -> DR_DATA) that holds 'm_axis_eth_tdata',
       'm_axis_eth_tvalid', and 'm_axis_eth_tlast' constant whenever 'm_axis_eth_tready == 0',
       preventing preamble re-insertion or TLAST loss under arbitrary backpressure
       (diag_reassembly_multi_stall.sv: 1,437/1,437 words, 5/5 TLASTs, 0 mismatches).
    3. [Fix B06 / C-A003]: Added 'orphan_skip_bytes [15:0]' tracking across single and 
       multi-frame boundaries so when a continuation frame arrives after a sequence gap 
       or without an active packet, its declared 'pld_hdr_len' continuation bytes are 
       skipped before searching for any new 0xCDEF Packet Header, preventing false packet 
       creation from payload bytes matching 0xCDEF (parser_gap_false_header.sv).
    4. [Fix C-A004]: Validated continuation length consistency ('{2'b00, pld_hdr_len} == rem_pkt_bytes');
       inconsistent continuation headers trigger an immediate partial-packet rollback
       (preserving all previously committed packets) and reject the inconsistent frame
       (parser_inconsistent_cont_length.sv).
  - Rev 3.1 (2026-10-31 14:00 KST) : [Audit Fix OISL-ETH-001 (D02) - Inter-Packet Gap Enforcement]
    1. [Fix OISL-ETH-001]: Extended the stall-safe egress drain FSM with a dedicated
       4-cycle Inter-Packet Gap state ('DR_IPG', 'ipg_gap_cnt [1:0]') entered after the
       final beat ('head_buf_word[32]') of every drained Ethernet packet is accepted.
    2. During 'DR_IPG', 'm_axis_eth_tvalid' and 'm_axis_eth_tlast' are deasserted for 4
       clock cycles so downstream 'xgmii_tx_formatter' cleanly detects '!mac_valid',
       emits '/T/' from 'ACTIVE', transitions through 'IPG_WAIT', and returns to 'IDLE'
       before the next queued packet's preamble ('DR_PRE0') begins.
    3. Ingress packet reassembly and 'commit_pkt_cnt' tracking remain fully active during
       'DR_IPG' so packets arriving during the inter-packet gap are queued without loss.
===========================================================================
*/

module ethernet_frame_reassembly (
    input  wire        clk,                    // 312.5 MHz Clock
    input  wire        rst_n,                  // Active-low reset

    // In-Order 1908-Byte (477-word) FSO DATA Stream from fso_ethernet_deframer
    input  wire [31:0] s_axis_fso_tdata,
    input  wire        s_axis_fso_tvalid,
    input  wire        s_axis_fso_tlast,
    output wire        s_axis_fso_tready,

    // Reassembled Ethernet Frame Output (Includes 8B Preamble = 2008 Bytes for 2000B Jumbo)
    output reg  [31:0] m_axis_eth_tdata,
    output reg         m_axis_eth_tvalid,
    output reg         m_axis_eth_tlast,
    input  wire        m_axis_eth_tready,

    // Diagnostic & Telemetry Outputs
    output reg  [15:0] reassembled_pkt_bytes,
    output reg  [15:0] reassembled_pkt_cnt
);

    // =======================================================
    // 1. CONTIGUOUS PACKET REASSEMBLY BUFFER (4096 Words = 16 KB)
    // =======================================================
    (* ram_style = "block" *) reg [32:0] pkt_buf [0:4095]; // Bit 32 = pkt_tlast, [31:0] = data
    reg [11:0] wr_ptr;
    reg [11:0] committed_wr_ptr;
    reg [11:0] rd_ptr;
    reg [12:0] buf_used;
    reg [12:0] uncommit_words;
    reg [10:0] commit_pkt_cnt; // [Rev 2.9 - Fix B08] 11-bit counter (up to 2047 packets)

    assign s_axis_fso_tready = (buf_used < 13'd4000);

    reg [8:0]  fso_word_idx;
    reg        fso_frame_valid_magic;
    reg [9:0]  expected_fso_seq;
    reg        seq_initialized;
    reg        pkt_active;
    reg        in_cont_frame;
    reg [15:0] rem_pkt_bytes;
    reg [15:0] target_pkt_bytes;
    reg [15:0] orphan_skip_bytes; // [Rev 3.0 - Fix C-A003] Bytes of orphan continuation to skip

    wire        fso_accept   = s_axis_fso_tvalid && s_axis_fso_tready;
    wire        is_word0     = (fso_word_idx == 9'd0);
    wire        is_pld_hdr   = is_word0 && (s_axis_fso_tdata[31:24] == 8'hAB);
    wire [9:0]  rx_fso_seq   = s_axis_fso_tdata[23:14];
    wire [13:0] pld_hdr_len  = s_axis_fso_tdata[13:0];

    // [Rev 2.9 - Fix B06] Detect sequence gap on Word 0 when a valid 0xAB header arrives
    wire        seq_gap_err  = is_pld_hdr && seq_initialized && (rx_fso_seq != expected_fso_seq);

    // [Rev 3.0 - Fix C-A004] Continuation length must match the remaining byte count of the active packet
    wire        cont_len_ok  = pkt_active && (pld_hdr_len != 14'd0) &&
                               ({2'b00, pld_hdr_len} == rem_pkt_bytes);

    // [Rev 3.0 - Fix B07 & C-A003] Recognize 0xCDEF Packet Header only when no packet is active
    // AND we are not skipping orphan continuation bytes!
    wire        is_pkt_hdr   = (!is_word0) && fso_frame_valid_magic && (!pkt_active) &&
                               (orphan_skip_bytes == 16'd0) &&
                               (s_axis_fso_tdata[31:16] == 16'hCDEF) && (s_axis_fso_tdata[13:0] != 14'd0);
    wire [13:0] pkt_hdr_len  = s_axis_fso_tdata[13:0];

    // [Rev 2.9 - Fix B04 & B05] Accept Ethernet payload words strictly when frame magic is valid,
    // a packet is currently active, and rem_pkt_bytes > 0 (never dropping zero-valued data words!)
    wire is_eth_data_word  = fso_accept && (!is_word0) && fso_frame_valid_magic &&
                             pkt_active && (rem_pkt_bytes > 16'd0);
    wire is_final_eth_word = is_eth_data_word && (rem_pkt_bytes <= 16'd4);

    wire drain_word_en;
    wire pkt_drain_done;

    // Purely Synchronous RAM Write
    always @(posedge clk) begin
        if (is_eth_data_word) begin
            pkt_buf[wr_ptr] <= {is_final_eth_word, s_axis_fso_tdata};
        end
    end

    // De-Segmentation, Magic Validation, Sequence-Gap Rollback & Table 2-18 Parser FSM
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fso_word_idx          <= 9'd0;
            fso_frame_valid_magic <= 1'b0;
            expected_fso_seq      <= 10'd0;
            seq_initialized       <= 1'b0;
            pkt_active            <= 1'b0;
            in_cont_frame         <= 1'b0;
            rem_pkt_bytes         <= 16'd0;
            target_pkt_bytes      <= 16'd0;
            orphan_skip_bytes     <= 16'd0;
            wr_ptr                <= 12'd0;
            committed_wr_ptr      <= 12'd0;
            uncommit_words        <= 13'd0;
            reassembled_pkt_bytes <= 16'd0;
            reassembled_pkt_cnt   <= 16'd0;
        end else if (fso_accept) begin
            if (s_axis_fso_tlast || (fso_word_idx == 9'd476))
                fso_word_idx <= 9'd0;
            else
                fso_word_idx <= fso_word_idx + 9'd1;

            if (is_word0) begin
                // Word 0: Validate FSO Payload Header Magic (8'hAB) per SDA OISL Sec. 2.6.3.7.7
                if (is_pld_hdr) begin
                    fso_frame_valid_magic <= 1'b1;
                    seq_initialized       <= 1'b1;
                    expected_fso_seq      <= rx_fso_seq + 10'd1;

                    if (!seq_gap_err && cont_len_ok) begin
                        // Valid, consistent Table 2-18 Continuation Frame
                        in_cont_frame     <= 1'b1;
                        rem_pkt_bytes     <= {2'b00, pld_hdr_len};
                        orphan_skip_bytes <= 16'd0;
                    end else begin
                        // Sequence gap, inconsistent continuation length, or new initial frame:
                        // Roll back any incomplete partial packet and skip any orphan continuation bytes!
                        if (pkt_active) begin
                            pkt_active     <= 1'b0;
                            rem_pkt_bytes  <= 16'd0;
                            wr_ptr         <= committed_wr_ptr;
                            uncommit_words <= 13'd0;
                        end
                        in_cont_frame <= 1'b0;
                        if (!seq_gap_err && pkt_active && !cont_len_ok && (pld_hdr_len != 14'd0)) begin
                            // [Rev 3.0 - Fix C-A004] Malformed continuation length: skip entire frame
                            orphan_skip_bytes <= 16'd1904;
                        end else begin
                            // [Rev 3.0 - Fix C-A003] Track orphan continuation bytes (including multi-frame)
                            orphan_skip_bytes <= {2'b00, pld_hdr_len};
                        end
                    end
                end else begin
                    // [Rev 2.9 - Fix B05] Invalid Payload Header magic: discard entire FSO frame!
                    fso_frame_valid_magic <= 1'b0;
                    in_cont_frame         <= 1'b0;
                    orphan_skip_bytes     <= 16'd0;
                end
            end else if (fso_frame_valid_magic && (orphan_skip_bytes > 16'd0)) begin
                // [Rev 3.0 - Fix C-A003] Skip orphan continuation bytes before allowing 0xCDEF search
                if (orphan_skip_bytes <= 16'd4)
                    orphan_skip_bytes <= 16'd0;
                else
                    orphan_skip_bytes <= orphan_skip_bytes - 16'd4;
            end else if (is_pkt_hdr) begin
                // [Rev 2.9 - Fix B07] Start of new Ethernet packet (0xCDEF header)
                pkt_active       <= 1'b1;
                rem_pkt_bytes    <= {2'b00, pkt_hdr_len};
                target_pkt_bytes <= {2'b00, pkt_hdr_len};
                uncommit_words   <= 13'd0;
            end else if (is_eth_data_word) begin
                wr_ptr <= wr_ptr + 12'd1;
                if (is_final_eth_word) begin
                    rem_pkt_bytes         <= 16'd0;
                    pkt_active            <= 1'b0;
                    in_cont_frame         <= 1'b0;
                    committed_wr_ptr      <= wr_ptr + 12'd1;
                    uncommit_words        <= 13'd0;
                    reassembled_pkt_bytes <= target_pkt_bytes;
                    reassembled_pkt_cnt   <= reassembled_pkt_cnt + 16'd1;
                end else begin
                    rem_pkt_bytes  <= rem_pkt_bytes - 16'd4;
                    uncommit_words <= uncommit_words + 13'd1;
                end
            end
        end
    end

    // Track Buffer Occupancy (with Single-Block Rollback + Simultaneous Drain Support)
    wire pkt_commit_pulse = is_final_eth_word;
    wire rollback_now     = fso_accept && is_word0 && is_pld_hdr && pkt_active &&
                            (seq_gap_err || !cont_len_ok);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buf_used       <= 13'd0;
            commit_pkt_cnt <= 11'd0;
        end else begin
            if (rollback_now) begin
                buf_used <= buf_used - uncommit_words - (drain_word_en ? 13'd1 : 13'd0);
            end else if (is_eth_data_word && !drain_word_en) begin
                buf_used <= buf_used + 13'd1;
            end else if (!is_eth_data_word && drain_word_en) begin
                buf_used <= buf_used - 13'd1;
            end

            if (pkt_commit_pulse && !pkt_drain_done)
                commit_pkt_cnt <= commit_pkt_cnt + 11'd1;
            else if (!pkt_commit_pulse && pkt_drain_done)
                commit_pkt_cnt <= commit_pkt_cnt - 11'd1;
        end
    end

    // =======================================================
    // 2. STALL-SAFE ETHERNET PREAMBLE INJECTION & DRAIN ENGINE
    //    [Rev 3.0 - Fix B02 & C-A002]: Authoritative single-driver
    //    4-state AXI-Stream output FSM (DR_IDLE -> DR_PRE0 -> DR_PRE1 -> DR_DATA)
    //    [Rev 3.1 - Fix OISL-ETH-001 (D02)]: Added 5th state DR_IPG enforcing a
    //    4-cycle valid deassertion between consecutive Ethernet frames so downstream
    //    xgmii_tx_formatter emits '/T/' and completes IPG_WAIT per packet.
    // =======================================================
    localparam DR_IDLE = 3'd0,
               DR_PRE0 = 3'd1,
               DR_PRE1 = 3'd2,
               DR_DATA = 3'd3,
               DR_IPG  = 3'd4;

    reg  [2:0]  dr_state;
    reg  [1:0]  ipg_gap_cnt;
    wire [63:0] preamble_sfd_wire;
    wire [32:0] head_buf_word = pkt_buf[rd_ptr];

    reg  [31:0] asm_data_in;
    reg         asm_valid_in;
    reg         asm_last_in;

    wire [31:0] mux_eth_data_out;
    wire        mux_eth_valid_out;
    wire        mux_eth_last_out;

    assign drain_word_en  = (dr_state == DR_DATA) && m_axis_eth_tready;
    assign pkt_drain_done = drain_word_en && head_buf_word[32];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dr_state    <= DR_IDLE;
            ipg_gap_cnt <= 2'd0;
            rd_ptr      <= 12'd0;
        end else begin
            case (dr_state)
                DR_IDLE: begin
                    ipg_gap_cnt <= 2'd0;
                    if (commit_pkt_cnt > 11'd0) begin
                        dr_state <= DR_PRE0;
                    end
                end
                DR_PRE0: begin
                    if (m_axis_eth_tready) begin
                        dr_state <= DR_PRE1;
                    end
                end
                DR_PRE1: begin
                    if (m_axis_eth_tready) begin
                        dr_state <= DR_DATA;
                    end
                end
                DR_DATA: begin
                    if (m_axis_eth_tready) begin
                        rd_ptr <= rd_ptr + 12'd1;
                        if (head_buf_word[32]) begin
                            // [Rev 3.1 - Fix OISL-ETH-001]: Always enter 4-cycle DR_IPG after
                            // the final word of an Ethernet packet so downstream formatter
                            // detects !mac_valid, emits /T/, and completes IPG_WAIT cleanly.
                            dr_state    <= DR_IPG;
                            ipg_gap_cnt <= 2'd0;
                        end
                    end
                end
                DR_IPG: begin
                    if (ipg_gap_cnt == 2'd3) begin
                        ipg_gap_cnt <= 2'd0;
                        if ((commit_pkt_cnt > 11'd0) || pkt_commit_pulse)
                            dr_state <= DR_PRE0;
                        else
                            dr_state <= DR_IDLE;
                    end else begin
                        ipg_gap_cnt <= ipg_gap_cnt + 2'd1;
                    end
                end
                default: begin
                    dr_state    <= DR_IDLE;
                    ipg_gap_cnt <= 2'd0;
                end
            endcase
        end
    end

    always @(*) begin
        asm_valid_in      = 1'b0;
        asm_data_in       = 32'd0;
        asm_last_in       = 1'b0;
        m_axis_eth_tvalid = 1'b0;
        m_axis_eth_tdata  = 32'd0;
        m_axis_eth_tlast  = 1'b0;

        case (dr_state)
            DR_PRE0: begin
                m_axis_eth_tvalid = 1'b1;
                m_axis_eth_tdata  = preamble_sfd_wire[63:32]; // 32'h5555_5555
                m_axis_eth_tlast  = 1'b0;
            end
            DR_PRE1: begin
                m_axis_eth_tvalid = 1'b1;
                m_axis_eth_tdata  = preamble_sfd_wire[31:0];  // 32'h5555_55D5
                m_axis_eth_tlast  = 1'b0;
            end
            DR_DATA: begin
                m_axis_eth_tvalid = 1'b1;
                m_axis_eth_tdata  = head_buf_word[31:0];
                m_axis_eth_tlast  = head_buf_word[32];
                asm_valid_in      = m_axis_eth_tready;
                asm_data_in       = head_buf_word[31:0];
                asm_last_in       = head_buf_word[32];
            end
            default: begin
                // Includes DR_IDLE and DR_IPG: m_axis_eth_tvalid held strictly low
                m_axis_eth_tvalid = 1'b0;
                m_axis_eth_tdata  = 32'd0;
                m_axis_eth_tlast  = 1'b0;
            end
        endcase
    end

    eth_preamble_gen u_eth_preamble_gen (
        .preamble_sfd (preamble_sfd_wire)
    );

    // [Rev 3.0 - Fix B02] Retained for structural hierarchy compatibility with exact port bindings;
    // active egress stream is driven exclusively by the stall-safe DR_PRE0/DR_PRE1/DR_DATA/DR_IPG FSM above.
    mux_eth_32 u_mux_eth_32 (
        .clk           (clk),
        .rst_n         (rst_n),
        .preamble_sfd  (preamble_sfd_wire),
        .asm_data_in   (asm_data_in),
        .asm_valid_in  (asm_valid_in),
        .asm_last_in   (asm_last_in),
        .eth_data_out  (mux_eth_data_out),
        .eth_valid_out (mux_eth_valid_out),
        .eth_last_out  (mux_eth_last_out)
    );

endmodule