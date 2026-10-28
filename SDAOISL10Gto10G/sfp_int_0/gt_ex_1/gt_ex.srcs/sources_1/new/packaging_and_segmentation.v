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
               - [Rev 2.2 - 2026-10-28 14:55 KST - Store-and-Segment Multi-Packet Fix]:
                 1. Eliminated dual-block writes to 'pkt_len_fifo' so LUTRAM 
                    synthesizes with zero multi-driven nets.
                 2. Uses Store-and-Segment completion gating (pkt_complete_in_fifo)
                    so exact byte length is known before Word 0 is read for BOTH 
                    IPv4 and non-IPv4 packets of any size (64B..2000B), across 
                    1900-Byte boundaries, continuation frames, and downstream 
                    m_axis_tready stalls.
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

    // Single-Driver Packet Length Descriptor FIFO (Written ONLY on s_axis_tlast)
    (* ram_style = "distributed" *) reg [11:0] pkt_len_fifo [0:63];
    reg [5:0]  len_wr_ptr;
    reg [5:0]  len_rd_ptr;
    reg [11:0] wr_pkt_byte_acc;

    wire fifo_empty     = (fifo_count == 11'd0);
    wire fifo_full      = (fifo_count >= 11'd1000);
    assign s_axis_tready = !fifo_full;

    wire write_en             = s_axis_tvalid && s_axis_tready;
    wire read_en;
    wire pkt_complete_in_fifo = (len_wr_ptr != len_rd_ptr);

    // Purely Synchronous RAM Write (Strictly Single-Driver for both LUTRAMs)
    always @(posedge clk) begin
        if (write_en) begin
            fifo_ram[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
            if (s_axis_tlast) begin
                pkt_len_fifo[len_wr_ptr] <= wr_pkt_byte_acc + 12'd4;
            end
        end
    end

    // Write Pointer, Packet Length Accumulator, and FIFO Occupancy Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr          <= 10'd0;
            fifo_count      <= 11'd0;
            len_wr_ptr      <= 6'd0;
            wr_pkt_byte_acc <= 12'd0;
        end else begin
            if (write_en) begin
                wr_ptr <= wr_ptr + 10'd1;
                if (s_axis_tlast) begin
                    len_wr_ptr      <= len_wr_ptr + 6'd1;
                    wr_pkt_byte_acc <= 12'd0;
                end else begin
                    wr_pkt_byte_acc <= wr_pkt_byte_acc + 12'd4;
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
    reg  [11:0] cont_rem_bytes_reg;
    wire [32:0] rd_data = fifo_ram[rd_ptr];

    // Exact packet length before Word 0 of segment is popped:
    // - On initial segment (in_cont_seg == 0): reads pkt_len_fifo[len_rd_ptr] once packet completes in FIFO
    // - On continuation segment (in_cont_seg == 1): uses cont_rem_bytes_reg
    wire [11:0] head_pkt_total_bytes = in_cont_seg ? cont_rem_bytes_reg : pkt_len_fifo[len_rd_ptr];
    wire        seg_data_ready       = !fifo_empty && (in_cont_seg || pkt_complete_in_fifo || (fifo_count >= 11'd500));

    assign read_en = (state == S_PASS) && seg_data_ready && m_axis_tready;

    // When word_cnt == 0 (while fso_payload is in S_HDR1/S_HDR2), output the exact packet/continuation
    // byte count; during words 1..474 (and S_PAD), output the active segment byte count (4..1900).
    assign seg_valid_bytes = (state == S_PASS && word_cnt == 9'd0) ?
                             (seg_data_ready ? head_pkt_total_bytes[10:0] : 11'd2000) :
                             active_seg_bytes;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state              <= S_PASS;
            word_cnt           <= 9'd0;
            rd_ptr             <= 10'd0;
            len_rd_ptr         <= 6'd0;
            active_seg_bytes   <= 11'd0;
            in_cont_seg        <= 1'b0;
            cont_rem_bytes_reg <= 12'd0;
        end else begin
            if (m_axis_tvalid && m_axis_tready) begin
                if (state == S_PASS) begin
                    rd_ptr <= rd_ptr + 10'd1;

                    if (word_cnt == 9'd0)
                        active_seg_bytes <= 11'd4;
                    else
                        active_seg_bytes <= active_seg_bytes + 11'd4;

                    if (rd_data[32]) begin
                        // End of Ethernet packet (s_axis_tlast == 1): pop descriptor FIFO
                        len_rd_ptr         <= len_rd_ptr + 6'd1;
                        in_cont_seg        <= 1'b0;
                        cont_rem_bytes_reg <= 12'd0;
                        if (word_cnt == MAX_WORDS - 1) begin
                            word_cnt <= 9'd0;
                        end else begin
                            word_cnt <= word_cnt + 9'd1;
                            state    <= S_PAD;
                        end
                    end else if (word_cnt == MAX_WORDS - 1) begin
                        // Reached 1900-Byte boundary without tlast -> Packet continues in next segment!
                        word_cnt           <= 9'd0;
                        in_cont_seg        <= 1'b1;
                        cont_rem_bytes_reg <= head_pkt_total_bytes - 12'd1900;
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
            end
        end
    end

    always @(*) begin
        if (state == S_PASS) begin
            m_axis_tvalid = seg_data_ready;
            m_axis_tdata  = m_axis_tvalid ? rd_data[31:0] : 32'd0;
            m_axis_tlast  = m_axis_tvalid && (word_cnt == MAX_WORDS - 1);
        end else begin
            m_axis_tvalid = 1'b1;
            m_axis_tdata  = 32'd0;
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end
    end

endmodule