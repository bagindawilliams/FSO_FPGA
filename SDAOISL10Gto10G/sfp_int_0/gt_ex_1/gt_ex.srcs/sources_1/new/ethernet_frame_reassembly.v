`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : ethernet_frame_reassembly
Description  : SDA OISL Section 2.6.3.7.7 Ethernet Frame Reassembly, 
               Zero-Padding Stripper, and Preamble Injection Top Module.

               KEY OPERATIONS:
               1. Receives in-order 1908-Byte (477-word) verified FSO DATA 
                  frames from fso_ethernet_deframer.v at 312.5 MHz.
               2. Validates and strips the 4-Byte FSO Payload Header (0xAB) 
                  and 4-Byte FSO Packet Header (0xCDEF) per Table 2-18.
               3. Reconstructs segmented Ethernet packets across multiple FSO 
                  frames (e.g., 1900 Bytes from Frame 1 + 100 Bytes from 
                  Frame 2 = 2000 Bytes) while stripping all trailing FSO 
                  zero-padding (e.g., 1800 or 1804 Bytes).
               4. Commits the reassembled packet to the egress drain FSM only 
                  when all bytes of the Ethernet packet have arrived, ensuring 
                  a 100% contiguous burst with ZERO intra-packet gaps.
               5. Instantiates eth_preamble_gen.v and mux_eth_32.v to prepend 
                  the 8-Byte Ethernet Preamble + SFD (64'h55555555_555555D5), 
                  outputting 2008 Bytes (502 words) to eth_tx_back_end_top.v.

Revision History:
  - Rev 1.0 (Initial) : Multi-frame Ethernet de-segmenter & Preamble MUX wrapper.
  - Rev 2.0 (2026-10-27 04:34 KST) : [Target B6.3 - SDA OISL Page 43-46, Sec. 2.6.3.7.4 - 2.6.3.7.7,
    Figure 2-17 & Table 2-18; ETRI Review Item 4.2(2) & Item 5.1]
    Added support for strict Table 2-18 Continuation Frames and Multi-Packet Packing.
  - Rev 2.1 (2026-10-28 13:56 KST) : [Internal Audit Fix #4 - Strict State-Based Header Detection]
    Removed '(fso_word_idx == 9'd1) ||' from 'is_pkt_hdr_word' so that an FSO Packet 
    Header (0xCDEF) is recognized ONLY when no prior packet is mid-continuation 
    (rem_pkt_bytes == 16'd0). This guarantees that payload data words beginning with 
    16'hCDEF inside a continuation segment or active packet body are treated strictly 
    as Ethernet data and never misinterpreted as a packet header.
===========================================================================
*/

module ethernet_frame_reassembly #(
    parameter [15:0] DEFAULT_PKT_BYTES = 16'd2000 // Fallback when Packet Header length field is 0 in legacy TBs
)(
    input  wire        clk,
    input  wire        rst_n,

    // In-Order 1908-Byte (477-Word) Verified FSO DATA Stream from Deframer
    input  wire [31:0] s_axis_fso_tdata,
    input  wire        s_axis_fso_tvalid,
    input  wire        s_axis_fso_tlast,
    output wire        s_axis_fso_tready,

    // Reassembled Ethernet Frame Output (Includes 8B Preamble = 2008B for 2000B Jumbo)
    output wire [31:0] m_axis_eth_tdata,
    output wire        m_axis_eth_tvalid,
    output wire        m_axis_eth_tlast,
    input  wire        m_axis_eth_tready,

    // Diagnostic Telemetry Outputs
    output reg  [15:0] reassembled_pkt_bytes,
    output reg  [15:0] reassembled_pkt_cnt
);

    // =======================================================
    // 1. PACKET COMMIT BUFFER (1024 x 33-bit: {pkt_eof, data[31:0]})
    // =======================================================
    (* ram_style = "distributed" *) reg [32:0] pkt_buf [0:1023];
    reg [9:0]  wr_ptr;
    reg [9:0]  committed_wr_ptr;
    reg [9:0]  rd_ptr;

    wire [9:0] buf_used      = wr_ptr - rd_ptr;
    assign s_axis_fso_tready = (buf_used < 10'd960);

    // =======================================================
    // 2. SDA OISL TABLE 2-18 HEADER PARSER & DE-SEGMENTER
    // =======================================================
    reg [8:0]  fso_word_idx;
    reg        fso_frame_valid_magic;
    reg [15:0] rem_pkt_bytes;
    reg [15:0] cur_pkt_total_bytes;
    reg [9:0]  expected_fso_seq;
    reg        seq_initialized;

    wire       fire_in            = s_axis_fso_tvalid && s_axis_fso_tready;
    wire       is_pld_hdr_word    = (fso_word_idx == 9'd0);
    wire       pld_magic_ok       = (s_axis_fso_tdata[31:24] == 8'hAB);
    wire [9:0] rx_fso_seq_num     = s_axis_fso_tdata[23:14];
    wire [13:0] rx_pld_hdr_len    = s_axis_fso_tdata[13:0];

    wire       word_has_pkt_magic = (s_axis_fso_tdata[31:16] == 16'hCDEF);
    wire [15:0] parsed_pkt_len    = (s_axis_fso_tdata[13:0] != 14'd0) ?
                                    {2'b00, s_axis_fso_tdata[13:0]} : DEFAULT_PKT_BYTES;

    // [Rev 2.1] Strict state-based Packet Header detection:
    // A word is an FSO Packet Header (0xCDEF) ONLY when no packet is mid-reassembly
    // (rem_pkt_bytes == 16'd0). During a continuation segment (rem_pkt_bytes > 0),
    // all words after Word 0 are strictly treated as Ethernet payload data!
    wire is_pkt_hdr_word = (!is_pld_hdr_word) && fso_frame_valid_magic &&
                           (rem_pkt_bytes == 16'd0) && word_has_pkt_magic;

    // A word is valid Ethernet payload data if it's not a header and rem_pkt_bytes > 0
    wire is_eth_data_word   = (!is_pld_hdr_word) && (!is_pkt_hdr_word) &&
                              fso_frame_valid_magic && (rem_pkt_bytes > 16'd0);
    wire word_completes_pkt = is_eth_data_word && (rem_pkt_bytes <= 16'd4);

    // Purely Synchronous Packet Buffer Write
    always @(posedge clk) begin
        if (fire_in && is_eth_data_word) begin
            pkt_buf[wr_ptr] <= {word_completes_pkt, s_axis_fso_tdata};
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fso_word_idx          <= 9'd0;
            fso_frame_valid_magic <= 1'b0;
            rem_pkt_bytes         <= 16'd0;
            cur_pkt_total_bytes   <= 16'd0;
            expected_fso_seq      <= 10'd0;
            seq_initialized       <= 1'b0;
            wr_ptr                <= 10'd0;
            committed_wr_ptr      <= 10'd0;
            reassembled_pkt_bytes <= 16'd0;
            reassembled_pkt_cnt   <= 16'd0;
        end else if (fire_in) begin
            // Advance FSO frame word index (0..476 = 477 words)
            if (s_axis_fso_tlast || (fso_word_idx == 9'd476)) begin
                fso_word_idx <= 9'd0;
            end else begin
                fso_word_idx <= fso_word_idx + 9'd1;
            end

            // 1. Word 0: Validate FSO Payload Header (0xAB) per Sec. 2.6.3.7.7
            if (is_pld_hdr_word) begin
                if (pld_magic_ok) begin
                    fso_frame_valid_magic <= 1'b1;
                    expected_fso_seq      <= rx_fso_seq_num + 10'd1;
                    seq_initialized       <= 1'b1;

                    // Sec. 2.6.3.7.7 Sequence Skip Handling:
                    // If sequence number skipped while a partial packet was incomplete,
                    // discard the partial packet rolled back to committed_wr_ptr.
                    if (seq_initialized && (rx_fso_seq_num != expected_fso_seq) && (rem_pkt_bytes > 16'd0)) begin
                        wr_ptr        <= committed_wr_ptr;
                        rem_pkt_bytes <= 16'd0;
                    end else if ((rem_pkt_bytes > 16'd0) && (rx_pld_hdr_len != 14'd0)) begin
                        // Update remaining continuation length from Table 2-18 Payload Header
                        rem_pkt_bytes <= {2'b00, rx_pld_hdr_len};
                    end
                end else begin
                    // Invalid 0xAB magic number: discard entire FSO frame per Sec. 2.6.3.7.7
                    fso_frame_valid_magic <= 1'b0;
                end
            end

            // 2. FSO Packet Header (0xCDEF): Start of New Packet (only when rem_pkt_bytes == 0)
            else if (is_pkt_hdr_word) begin
                rem_pkt_bytes       <= parsed_pkt_len;
                cur_pkt_total_bytes <= parsed_pkt_len;
            end

            // 3. Active Ethernet Payload Words (Strips trailing zero-padding automatically)
            else if (is_eth_data_word) begin
                wr_ptr <= wr_ptr + 10'd1;
                if (word_completes_pkt) begin
                    rem_pkt_bytes         <= 16'd0;
                    committed_wr_ptr      <= wr_ptr + 10'd1;
                    reassembled_pkt_bytes <= cur_pkt_total_bytes;
                    reassembled_pkt_cnt   <= reassembled_pkt_cnt + 16'd1;
                end else begin
                    rem_pkt_bytes <= rem_pkt_bytes - 16'd4;
                end
            end
        end
    end

    // =======================================================
    // 3. CONTIGUOUS EGRESS DRAIN FSM (Zero Intra-Packet Gap)
    // =======================================================
    localparam ST_IDLE  = 2'd0;
    localparam ST_DRAIN = 2'd1;
    localparam ST_GAP   = 2'd2;

    reg [1:0]  drain_state;
    reg [2:0]  inter_pkt_gap;
    reg [31:0] asm_tdata;
    reg        asm_tvalid;
    reg        asm_tlast;

    wire        pkt_ready_to_drain = (rd_ptr != committed_wr_ptr);
    wire [32:0] head_pkt_word      = pkt_buf[rd_ptr];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            drain_state   <= ST_IDLE;
            rd_ptr        <= 10'd0;
            inter_pkt_gap <= 3'd0;
            asm_tdata     <= 32'd0;
            asm_tvalid    <= 1'b0;
            asm_tlast     <= 1'b0;
        end else begin
            case (drain_state)
                ST_IDLE: begin
                    asm_tdata  <= 32'd0;
                    asm_tvalid <= 1'b0;
                    asm_tlast  <= 1'b0;
                    if (pkt_ready_to_drain && m_axis_eth_tready) begin
                        drain_state <= ST_DRAIN;
                    end
                end

                ST_DRAIN: begin
                    if (m_axis_eth_tready) begin
                        asm_tdata  <= head_pkt_word[31:0];
                        asm_tvalid <= 1'b1;
                        asm_tlast  <= head_pkt_word[32];
                        rd_ptr     <= rd_ptr + 10'd1;

                        if (head_pkt_word[32]) begin
                            inter_pkt_gap <= 3'd0;
                            drain_state   <= ST_GAP;
                        end
                    end
                end

                ST_GAP: begin
                    asm_tdata  <= 32'd0;
                    asm_tvalid <= 1'b0;
                    asm_tlast  <= 1'b0;
                    // Allow 6 cycles for mux_eth_32 (2-cycle Preamble) + XGMII IPG
                    if (inter_pkt_gap < 3'd5) begin
                        inter_pkt_gap <= inter_pkt_gap + 3'd1;
                    end else begin
                        inter_pkt_gap <= 3'd0;
                        drain_state   <= ST_IDLE;
                    end
                end

                default: drain_state <= ST_IDLE;
            endcase
        end
    end

    // =======================================================
    // 4. ETHERNET PREAMBLE GENERATOR & 2-CYCLE INJECTION MUX
    // =======================================================
    wire [63:0] eth_preamble_sfd;

    eth_preamble_gen u_eth_preamble_gen (
        .preamble_sfd (eth_preamble_sfd)
    );

    mux_eth_32 u_mux_eth_32 (
        .clk           (clk),
        .rst_n         (rst_n),
        .asm_data_in   (asm_tdata),
        .asm_valid_in  (asm_tvalid),
        .asm_last_in   (asm_tlast),
        .preamble_sfd  (eth_preamble_sfd),
        .eth_data_out  (m_axis_eth_tdata),
        .eth_valid_out (m_axis_eth_tvalid),
        .eth_last_out  (m_axis_eth_tlast)
    );

endmodule