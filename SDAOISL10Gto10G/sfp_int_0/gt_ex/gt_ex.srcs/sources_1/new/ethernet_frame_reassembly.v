`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : ethernet_frame_reassembly
Description  : Ethernet Frame De-Segmenter, Zero-Padding Stripper, and 
               Preamble Insertion Top Module (Inverse of packaging_and_segmentation
               and fso_payload).

               KEY OPERATIONS:
               1. Header Stripping (8 Bytes per 1908-Byte FSO Payload):
                  - Word 0 (FSO Payload Header, e.g., 0xAB00_076C or 0xAB01_0064):
                    Extracts continuation flag and active segment byte count.
                  - Word 1 (FSO Packet Header, e.g., 0xCDEF_07D0):
                    Extracts total target Ethernet packet length (e.g., 2000 Bytes).
               2. Multi-Segment Stitching & Zero-Padding Removal:
                  - Accumulates valid payload words across segments (e.g., 475 
                    words [1900B] from DAT1 + 25 words [100B] from DAT2 = 500 
                    words [2000B]) while discarding trailing zero-padding 
                    (e.g., 450 words [1800B] in DAT2).
               3. Contiguous Burst Egress & 8-Byte Preamble Prepending:
                  - Once all bytes of the reconstructed Ethernet packet are 
                    assembled in the packet buffer, drains the complete packet 
                    without intra-packet gaps into mux_eth_32 and eth_preamble_gen
                    to produce a 2008-Byte (502-word) Ethernet frame.

               Revision History:
               - Rev 1.0 (Initial) : Multi-segment de-segmenter, zero-padding 
                 stripper, and 8-byte Ethernet preamble inserter.
               - Rev 1.1 (2026-10-22 07:09 KST) : Updated timescale precision 
                 from 1ns/100ps to 1ns/1ps for project-wide simulation alignment.
===========================================================================
*/

module ethernet_frame_reassembly (
    input  wire        clk,                 // 312.5 MHz Clock
    input  wire        rst_n,               // Active-low reset

    // Input from fso_ethernet_deframer (477 words = 1908 Bytes per DATA frame)
    input  wire [31:0] s_axis_fso_tdata,
    input  wire        s_axis_fso_tvalid,
    input  wire        s_axis_fso_tlast,
    output wire        s_axis_fso_tready,

    // Reassembled Ethernet Frame Output (With 8-Byte Preamble: 2008 Bytes for 2000B Jumbo)
    output wire [31:0] m_axis_eth_tdata,
    output wire        m_axis_eth_tvalid,
    output wire        m_axis_eth_tlast,
    input  wire        m_axis_eth_tready,

    // Status & Telemetry Outputs
    output reg  [15:0] reassembled_pkt_bytes, // Target Ethernet length (e.g., 2000)
    output reg  [15:0] reassembled_pkt_cnt    // Count of completed Ethernet packets
);

    assign s_axis_fso_tready = 1'b1;

    // =======================================================
    // 1. DE-SEGMENTATION & PADDING STRIPPER (WRITE SIDE)
    // =======================================================
    (* ram_style = "distributed" *) reg [32:0] pkt_buf [0:1023]; // {is_pkt_last, word[31:0]}
    reg [9:0]  wr_ptr;
    reg [9:0]  rd_ptr;
    reg [9:0]  committed_wr_ptr; // Advances only when a full Ethernet packet is complete

    reg [8:0]  seg_word_idx;     // Counts 0..476 (477 words = 1908 Bytes per FSO frame)
    reg [15:0] rem_pkt_bytes;    // Remaining valid Ethernet bytes to collect
    reg        assembling_pkt;   // 1 = Multi-segment packet currently in progress

    // Combinational check for last valid word of the reconstructed Ethernet packet
    wire is_payload_word    = s_axis_fso_tvalid && (seg_word_idx >= 9'd2);
    wire word_is_valid_eth  = is_payload_word && (rem_pkt_bytes > 16'd0);
    wire word_completes_pkt = word_is_valid_eth && (rem_pkt_bytes <= 16'd4);

    // Purely Synchronous RAM Write (Required for Vivado LUTRAM inference)
    always @(posedge clk) begin
        if (word_is_valid_eth) begin
            pkt_buf[wr_ptr] <= {word_completes_pkt, s_axis_fso_tdata};
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr                <= 10'd0;
            committed_wr_ptr      <= 10'd0;
            seg_word_idx          <= 9'd0;
            rem_pkt_bytes         <= 16'd0;
            assembling_pkt        <= 1'b0;
            reassembled_pkt_bytes <= 16'd0;
            reassembled_pkt_cnt   <= 16'd0;
        end else if (s_axis_fso_tvalid) begin
            // Track word index within the 477-word (1908-Byte) FSO payload
            if (s_axis_fso_tlast || (seg_word_idx == 9'd476))
                seg_word_idx <= 9'd0;
            else
                seg_word_idx <= seg_word_idx + 9'd1;

            // Word 0: FSO Payload Header (0xAB00_xxxx = Start Segment, 0xAB01_xxxx = Continuation)
            if (seg_word_idx == 9'd0) begin
                // If a new start segment arrives unexpectedly, reset pointer to clean boundary
                if (s_axis_fso_tdata[23:16] == 8'h00 && !assembling_pkt) begin
                    wr_ptr <= committed_wr_ptr;
                end
            end
            // Word 1: FSO Packet Header (0xCDEF_xxxx -> [15:0] holds Total Ethernet Packet Length)
            else if (seg_word_idx == 9'd1) begin
                if (!assembling_pkt) begin
                    rem_pkt_bytes         <= s_axis_fso_tdata[15:0];
                    reassembled_pkt_bytes <= s_axis_fso_tdata[15:0];
                    assembling_pkt        <= 1'b1;
                end
            end
            // Words 2..476: 475 Words (1900 Bytes) of Segment Payload + Zero-Padding
            else begin
                if (rem_pkt_bytes > 16'd0) begin
                    wr_ptr <= wr_ptr + 10'd1;

                    if (rem_pkt_bytes <= 16'd4) begin
                        // Full Ethernet packet has been reassembled!
                        // Remaining words in this 475-word segment are Zero-Padding and are ignored.
                        rem_pkt_bytes       <= 16'd0;
                        assembling_pkt      <= 1'b0;
                        committed_wr_ptr    <= wr_ptr + 10'd1;
                        reassembled_pkt_cnt <= reassembled_pkt_cnt + 16'd1;
                    end else begin
                        rem_pkt_bytes <= rem_pkt_bytes - 16'd4;
                    end
                end
            end
        end
    end

    // =======================================================
    // 2. CONTIGUOUS PACKET DRAIN FSM (READ SIDE)
    // =======================================================
    localparam ST_IDLE  = 2'd0;
    localparam ST_DRAIN = 2'd1;
    localparam ST_GAP   = 2'd2;

    reg [1:0]  drain_state;
    reg [3:0]  inter_pkt_gap;
    reg [31:0] asm_data;
    reg        asm_valid;
    reg        asm_last;

    wire pkt_ready_to_drain = (rd_ptr != committed_wr_ptr);
    wire [32:0] cur_buf_word = pkt_buf[rd_ptr];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            drain_state   <= ST_IDLE;
            rd_ptr        <= 10'd0;
            inter_pkt_gap <= 4'd0;
            asm_data      <= 32'd0;
            asm_valid     <= 1'b0;
            asm_last      <= 1'b0;
        end else begin
            asm_valid <= 1'b0;
            asm_last  <= 1'b0;
            asm_data  <= 32'd0;

            case (drain_state)
                ST_IDLE: begin
                    if (pkt_ready_to_drain && m_axis_eth_tready) begin
                        drain_state <= ST_DRAIN;
                    end
                end

                ST_DRAIN: begin
                    if (m_axis_eth_tready) begin
                        asm_valid <= 1'b1;
                        asm_data  <= cur_buf_word[31:0];
                        asm_last  <= cur_buf_word[32];
                        rd_ptr    <= rd_ptr + 10'd1;

                        if (cur_buf_word[32]) begin
                            inter_pkt_gap <= 4'd0;
                            drain_state   <= ST_GAP;
                        end
                    end
                end

                ST_GAP: begin
                    // 6-cycle gap allows mux_eth_32 and xgmii_tx_formatter IPG to complete cleanly
                    if (inter_pkt_gap == 4'd5) begin
                        inter_pkt_gap <= 4'd0;
                        drain_state   <= ST_IDLE;
                    end else begin
                        inter_pkt_gap <= inter_pkt_gap + 4'd1;
                    end
                end

                default: drain_state <= ST_IDLE;
            endcase
        end
    end

    // =======================================================
    // 3. SUB-MODULE INSTANTIATIONS: PREAMBLE GEN & MUX_ETH_32
    // =======================================================
    wire [63:0] preamble_sfd_wire;

    eth_preamble_gen u_eth_preamble_gen (
        .preamble_sfd (preamble_sfd_wire)
    );

    mux_eth_32 u_mux_eth_32 (
        .clk           (clk),
        .rst_n         (rst_n),
        .asm_data_in   (asm_data),
        .asm_valid_in  (asm_valid),
        .asm_last_in   (asm_last),
        .preamble_sfd  (preamble_sfd_wire),
        .eth_data_out  (m_axis_eth_tdata),
        .eth_valid_out (m_axis_eth_tvalid),
        .eth_last_out  (m_axis_eth_tlast)
    );

endmodule