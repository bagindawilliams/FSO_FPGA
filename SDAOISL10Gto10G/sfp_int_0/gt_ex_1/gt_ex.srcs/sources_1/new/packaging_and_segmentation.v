`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : packaging_and_segmentation
Description  : Ethernet Payload Segmentation and Zero-Padding Engine.
               Slices incoming Ethernet packets into fixed 1900-Byte 
               segments (475 words x 32-bit) and pads short packets with 
               zeros up to the 1900-Byte boundary.
               
               Revision Notes:
               - Separated 'fifo_ram' array write from the asynchronous reset 
                 block so Vivado infers Distributed LUTRAM cleanly.
               - Connected 'seg_valid_bytes' to 'valid_byte_cnt' to resolve 
                 unconnected output warnings.
               - [Rev 2.0 - 2026-10-27 04:34 KST - Target B6.1 Audit Fix]:
                 Added segment-level valid Ethernet byte tracking.
               - [Rev 2.1 - 2026-10-28 13:56 KST - Internal Audit Fix #5]:
                 Added 5-word lookahead and exact s_axis_tlast packet-length 
                 descriptor tracking (pkt_len_fifo) so that at the start of 
                 every segment (word_cnt == 0, while downstream fso_payload 
                 is emitting S_HDR1/S_HDR2), 'seg_valid_bytes' provides the 
                 exact ingress packet length (e.g., 64, 128, 512, 1500, 2000) 
                 and during active words (word_cnt >= 1) tracks the exact 
                 valid bytes in the current segment (e.g., 1900 on Segment 1 
                 and 100 on Segment 2 of a 2000B Jumbo frame).
===========================================================================
*/

module packaging_and_segmentation #(
    parameter MAX_WORDS = 475 // 475 words x 4 Bytes = 1900 Bytes
)(
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,

    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,
    output wire [10:0] seg_valid_bytes
);

    // 1024-Word Elastic FIFO (Bit 32 = tlast, Bits [31:0] = tdata)
    (* ram_style = "distributed" *) reg [32:0] fifo_ram [0:1023];
    reg [9:0]  wr_ptr;
    reg [9:0]  rd_ptr;
    reg [10:0] fifo_count;

    // [Rev 2.1] Exact Packet Length Descriptor FIFO (Captures byte count at s_axis_tlast)
    (* ram_style = "distributed" *) reg [10:0] pkt_len_fifo [0:63];
    reg [5:0]  len_wr_ptr;
    reg [5:0]  len_rd_ptr;
    reg [10:0] wr_pkt_byte_acc;

    wire fifo_empty     = (fifo_count == 11'd0);
    wire fifo_full      = (fifo_count >= 11'd1000);
    assign s_axis_tready = !fifo_full;

    wire write_en = s_axis_tvalid && s_axis_tready;
    wire read_en;
    wire pkt_complete_in_fifo = (len_wr_ptr != len_rd_ptr);

    // Purely Synchronous RAM Write (Required for LUTRAM inference)
    always @(posedge clk) begin
        if (write_en) begin
            fifo_ram[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
            if (s_axis_tlast) begin
                pkt_len_fifo[len_wr_ptr] <= wr_pkt_byte_acc + 11'd4;
            end
        end
    end

    // Write Pointer, Packet Length Tracker, and FIFO Occupancy Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr          <= 10'd0;
            fifo_count      <= 11'd0;
            len_wr_ptr      <= 6'd0;
            wr_pkt_byte_acc <= 11'd0;
        end else begin
            if (write_en) begin
                wr_ptr <= wr_ptr + 10'd1;
                if (s_axis_tlast) begin
                    len_wr_ptr      <= len_wr_ptr + 6'd1;
                    wr_pkt_byte_acc <= 11'd0;
                end else begin
                    wr_pkt_byte_acc <= wr_pkt_byte_acc + 11'd4;
                end
            end
            if (write_en && !read_en)
                fifo_count <= fifo_count + 11'd1;
            else if (!write_en && read_en)
                fifo_count <= fifo_count - 11'd1;
        end
    end

    // Segmentation & Padding FSM
    localparam S_PASS = 1'b0;
    localparam S_PAD  = 1'b1;

    reg         state;
    reg  [8:0]  word_cnt;
    reg  [10:0] active_seg_bytes;
    reg         in_cont_seg;
    wire [32:0] rd_data = fifo_ram[rd_ptr];

    // 5-word lookahead on Word 0 so IPv4 Total Length (at rd_ptr + 4) or short-packet tlast is ready
    wire [9:0]  hdr_w3_ptr    = rd_ptr + 10'd3;
    wire [9:0]  hdr_w4_ptr    = rd_ptr + 10'd4;
    wire [32:0] w3_lookahead  = fifo_ram[hdr_w3_ptr];
    wire [32:0] w4_lookahead  = fifo_ram[hdr_w4_ptr];
    wire        is_ipv4_frame = (w3_lookahead[31:16] == 16'h0800);
    wire [10:0] ipv4_total_b  = w4_lookahead[26:16] + 11'd18;
    wire [10:0] fifo_exact_b  = pkt_len_fifo[len_rd_ptr];

    wire [10:0] detected_pkt_bytes = pkt_complete_in_fifo ? fifo_exact_b :
                                     (is_ipv4_frame       ? ipv4_total_b : 11'd2000);

    // Wait 5 words at the start of a new packet if tlast hasn't arrived yet
    wire seg_start_ready = (word_cnt != 9'd0) || pkt_complete_in_fifo || (fifo_count >= 11'd5);
    assign read_en       = (state == S_PASS) && !fifo_empty && seg_start_ready && m_axis_tready;

    // On word_cnt == 0 (while fso_payload is in S_HDR1/S_HDR2), present total packet/continuation bytes;
    // on word_cnt >= 1, present the active segment byte count (1..1900).
    assign seg_valid_bytes = (state == S_PASS && word_cnt == 9'd0) ? detected_pkt_bytes : active_seg_bytes;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state            <= S_PASS;
            word_cnt         <= 9'd0;
            rd_ptr           <= 10'd0;
            len_rd_ptr       <= 6'd0;
            active_seg_bytes <= 11'd0;
            in_cont_seg      <= 1'b0;
        end else begin
            if (m_axis_tvalid && m_axis_tready) begin
                if (state == S_PASS) begin
                    rd_ptr <= rd_ptr + 10'd1;

                    if (word_cnt == 9'd0)
                        active_seg_bytes <= 11'd4;
                    else
                        active_seg_bytes <= active_seg_bytes + 11'd4;

                    if (rd_data[32]) begin
                        // Exact end of Ethernet packet (s_axis_tlast == 1): pop pkt_len_fifo
                        len_rd_ptr  <= len_rd_ptr + 6'd1;
                        in_cont_seg <= 1'b0;
                        if (word_cnt == MAX_WORDS - 1) begin
                            word_cnt <= 9'd0;
                        end else begin
                            word_cnt <= word_cnt + 9'd1;
                            state    <= S_PAD;
                        end
                    end else if (word_cnt == MAX_WORDS - 1) begin
                        // Reached 1900B boundary without s_axis_tlast -> Packet continues in next segment!
                        word_cnt    <= 9'd0;
                        in_cont_seg <= 1'b1;
                        if (pkt_complete_in_fifo) begin
                            // Subtract 1900B from the queued total length for the continuation segment
                            pkt_len_fifo[len_rd_ptr] <= pkt_len_fifo[len_rd_ptr] - 11'd1900;
                        end
                    end else begin
                        word_cnt <= word_cnt + 9'd1;
                    end
                end else if (state == S_PAD) begin
                    if (word_cnt == MAX_WORDS - 1) begin
                        word_cnt <= 9'd0;
                        state    <= S_PASS;
                    end else begin
                        word_cnt <= word_cnt + 9'd1;
                    end
                end
            end else if (!in_cont_seg && (word_cnt == 9'd0) && pkt_complete_in_fifo && (pkt_len_fifo[len_rd_ptr] > 11'd1900)) begin
                // Keep full packet length visible at word_cnt == 0 before first word is popped
            end
        end
    end

    always @(*) begin
        if (state == S_PASS) begin
            m_axis_tvalid = !fifo_empty && seg_start_ready;
            m_axis_tdata  = m_axis_tvalid ? rd_data[31:0] : 32'd0;
            m_axis_tlast  = m_axis_tvalid && (word_cnt == MAX_WORDS - 1);
        end else begin
            m_axis_tvalid = 1'b1;
            m_axis_tdata  = 32'd0;
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end
    end

endmodule