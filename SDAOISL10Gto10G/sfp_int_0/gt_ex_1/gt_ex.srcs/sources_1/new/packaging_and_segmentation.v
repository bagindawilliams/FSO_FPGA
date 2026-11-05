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
                 Added exact s_axis_tlast packet-length descriptor tracking (pkt_len_fifo).
               - [Rev 2.2 - 2026-10-28 14:55 KST - Store-and-Segment Multi-Packet Fix]:
                 Eliminated dual-block writes to 'pkt_len_fifo' and added Store-and-Segment
                 completion gating (pkt_complete_in_fifo) for IPv4 and non-IPv4 packets.
               - [Rev 2.3 - 2026-10-29 12:39 KST - Inclusive Cycle Byte Count Alignment]:
                 Added combinational '+ 11'd4' on active S_PASS words so 'seg_valid_bytes'
                 reports 1900 B (instead of 1896 B) on the 475th word when m_axis_tlast == 1.
               - [Rev 2.5 - 2026-10-29 16:42 KST - Audit Fix R12 - Byte-Accurate Partial Tail & Super-Jumbo Hold]:
                 1. Added 's_axis_tkeep_bytes [2:0]' (1..4 valid bytes, defaulting to 4 
                    when unconnected) and stored it in 'fifo_ram[35:33]' so non-multiple-of-4 
                    packets (65B, 66B, 67B, 1518B, 1901B) accumulate exact byte counts.
                 2. Raised store-and-segment pre-buffer fallback threshold from 500 to 950 
                    words (3,800 Bytes).
               - [Rev 2.6 - 2026-10-30 00:55 KST - Audit Fix N07 - 14-Bit Super-Jumbo Length Handshake]:
                 Expanded 'fifo_ram' depth to 2048 words and added upper 3-bit transfer.
               - [Rev 2.8 - 2026-10-30 11:30 KST - Audit Fix A01, A04, A05 & A18]:
                 1. [Fix A18 & A01]: Widened 'seg_valid_bytes' port to 14 bits ([13:0]).
                 2. [Fix A04]: Expanded 'pkt_len_fifo' to 128 entries with 'pkt_desc_cnt [7:0]'.
                 3. [Fix A05]: Expanded 'fifo_ram' to 4096 words (16,384 Bytes) and waited
                    strictly for completed packet descriptors.
               - [Rev 2.9 - 2026-10-30 18:05 KST - Audit Fix B03 - 1904-Byte Continuation Segment Capacity]:
                 1. When slicing a Continuation Segment whose remaining packet byte count 
                    exceeds 1,900 Bytes ('in_cont_seg && (cont_rem_bytes_reg > 14'd1900)', 
                    such as 3,804B, 4,096B, 7,200B, 7,204B, and 8,192B), the segmenter 
                    emits 476 words (1,904 Bytes) of contiguous Ethernet data from 'fifo_ram'
                    and subtracts 1,904 Bytes from 'cont_rem_bytes_reg', matching SDA OISL 
                    Table 2-18 (4B Payload Header + 1904B Continuation Data = 1908B).
                 2. For initial segments ('!in_cont_seg') and continuation segments with 
                    'cont_rem_bytes_reg <= 14'd1900' (such as the 2,000B = 1900B + 100B 
                    demo profile), retains 475 words per segment with zero regression on 
                    tb_eth_rx_front_end_top.v, tb_fso_payload.v, or frontend_lengths.sv.
===========================================================================
*/

module packaging_and_segmentation #(
    parameter MAX_WORDS = 475 // 475 words x 4 Bytes = 1900 Bytes on Initial Segment
)(
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,
    input  wire [2:0]  s_axis_tkeep_bytes, // Optional 1..4 valid byte count (defaults to 4)

    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,
    output wire [13:0] seg_valid_bytes     // [Rev 2.8 - Fix A18] Full 14-bit length metadata
);

    // Default to 4 valid bytes if s_axis_tkeep_bytes is left unconnected (1'bz / 1'bx / 0)
    wire [2:0] in_word_bytes = ((^s_axis_tkeep_bytes === 1'bx) || (s_axis_tkeep_bytes == 3'd0)) ?
                               3'd4 : s_axis_tkeep_bytes;

    // [Rev 2.8 - Fix A05] 4096-Word Elastic FIFO (16,384 Bytes) for up to 16KB Super-Jumbo frames
    (* ram_style = "distributed" *) reg [35:0] fifo_ram [0:4095];
    reg [11:0] wr_ptr;
    reg [11:0] rd_ptr;
    reg [12:0] fifo_count;

    // [Rev 2.8 - Fix A04] 128-Entry Packet Length Descriptor FIFO with explicit occupancy counter
    (* ram_style = "distributed" *) reg [13:0] pkt_len_fifo [0:127];
    reg [6:0]  len_wr_ptr;
    reg [6:0]  len_rd_ptr;
    reg [7:0]  pkt_desc_cnt;
    reg [13:0] wr_pkt_byte_acc;

    wire fifo_empty      = (fifo_count == 13'd0);
    wire fifo_full       = (fifo_count >= 13'd4080);
    wire desc_full       = (pkt_desc_cnt >= 8'd120);
    assign s_axis_tready = (!fifo_full) && (!desc_full);

    wire write_en             = s_axis_tvalid && s_axis_tready;
    wire read_en;
    wire pkt_complete_in_fifo = (pkt_desc_cnt != 8'd0);

    // Purely Synchronous RAM Write (Strictly Single-Driver for both LUTRAMs)
    always @(posedge clk) begin
        if (write_en) begin
            fifo_ram[wr_ptr] <= {in_word_bytes, s_axis_tlast, s_axis_tdata};
            if (s_axis_tlast) begin
                pkt_len_fifo[len_wr_ptr] <= wr_pkt_byte_acc + {11'd0, in_word_bytes};
            end
        end
    end

    // Write Pointer, Packet Length Accumulator, and FIFO Occupancy Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr          <= 12'd0;
            fifo_count      <= 13'd0;
            len_wr_ptr      <= 7'd0;
            wr_pkt_byte_acc <= 14'd0;
        end else begin
            if (write_en) begin
                wr_ptr <= wr_ptr + 12'd1;
                if (s_axis_tlast) begin
                    len_wr_ptr      <= len_wr_ptr + 7'd1;
                    wr_pkt_byte_acc <= 14'd0;
                end else begin
                    wr_pkt_byte_acc <= wr_pkt_byte_acc + {11'd0, in_word_bytes};
                end
            end
            if (write_en && !read_en)
                fifo_count <= fifo_count + 13'd1;
            else if (!write_en && read_en)
                fifo_count <= fifo_count - 13'd1;
        end
    end

    // Segmentation & Padding FSM
    localparam S_PASS = 1'b0;
    localparam S_PAD  = 1'b1;

    reg         state;
    reg  [8:0]  word_cnt;
    reg  [13:0] active_seg_bytes;
    reg         in_cont_seg;
    reg  [13:0] cont_rem_bytes_reg;
    wire [35:0] rd_data       = fifo_ram[rd_ptr];
    wire [2:0]  rd_word_bytes = (rd_data[35:33] == 3'd0) ? 3'd4 : rd_data[35:33];

    wire [13:0] head_pkt_total_bytes = in_cont_seg ? cont_rem_bytes_reg :
                                       (pkt_complete_in_fifo ? pkt_len_fifo[len_rd_ptr] : 14'd2000);
    wire        seg_data_ready       = !fifo_empty && (in_cont_seg || pkt_complete_in_fifo);

    // [Rev 2.9 - Fix B03] Use 476 words (1904 Bytes) when a continuation segment carries >1900B;
    // otherwise use 475 words (MAX_WORDS = 1900 Bytes) for initial segments and <=1900B continuations.
    wire        use_1904b_cont_seg   = in_cont_seg && (cont_rem_bytes_reg > 14'd1900);
    wire [8:0]  seg_max_words        = use_1904b_cont_seg ? 9'd476 : MAX_WORDS[8:0];
    wire [13:0] seg_byte_capacity    = use_1904b_cont_seg ? 14'd1904 : 14'd1900;

    assign read_en      = (state == S_PASS) && seg_data_ready && m_axis_tready;
    wire   desc_push_en = write_en && s_axis_tlast;
    wire   desc_pop_en  = read_en && rd_data[32];

    // [Rev 2.8 - Fix A04] Dedicated Packet Descriptor Occupancy Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pkt_desc_cnt <= 8'd0;
        end else begin
            if (desc_push_en && !desc_pop_en)
                pkt_desc_cnt <= pkt_desc_cnt + 8'd1;
            else if (!desc_push_en && desc_pop_en)
                pkt_desc_cnt <= pkt_desc_cnt - 8'd1;
        end
    end

    // Accumulate exact rd_word_bytes (1..4) on each S_PASS word
    wire [13:0] cur_seg_valid_bytes = (state == S_PASS && m_axis_tvalid) ?
                                      ((word_cnt == 9'd0) ? {11'd0, rd_word_bytes} :
                                                            (active_seg_bytes + {11'd0, rd_word_bytes})) :
                                      active_seg_bytes;

    // [Rev 2.9] Drive clean 14-bit packet/continuation byte length on word_cnt == 0
    assign seg_valid_bytes = (state == S_PASS && word_cnt == 9'd0) ?
                             (seg_data_ready ? head_pkt_total_bytes : 14'd2000) :
                             cur_seg_valid_bytes;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state              <= S_PASS;
            word_cnt           <= 9'd0;
            rd_ptr             <= 12'd0;
            len_rd_ptr         <= 7'd0;
            active_seg_bytes   <= 14'd0;
            in_cont_seg        <= 1'b0;
            cont_rem_bytes_reg <= 14'd0;
        end else begin
            if (m_axis_tvalid && m_axis_tready) begin
                if (state == S_PASS) begin
                    rd_ptr           <= rd_ptr + 12'd1;
                    active_seg_bytes <= cur_seg_valid_bytes;

                    if (rd_data[32]) begin
                        // End of Ethernet packet (s_axis_tlast == 1): pop descriptor FIFO
                        len_rd_ptr         <= len_rd_ptr + 7'd1;
                        in_cont_seg        <= 1'b0;
                        cont_rem_bytes_reg <= 14'd0;
                        if (word_cnt == seg_max_words - 9'd1) begin
                            word_cnt <= 9'd0;
                        end else begin
                            word_cnt <= word_cnt + 9'd1;
                            state    <= S_PAD;
                        end
                    end else if (word_cnt == seg_max_words - 9'd1) begin
                        // Reached segment boundary (1900B initial or 1904B continuation) without tlast
                        word_cnt           <= 9'd0;
                        in_cont_seg        <= 1'b1;
                        cont_rem_bytes_reg <= head_pkt_total_bytes - seg_byte_capacity;
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
            m_axis_tlast  = m_axis_tvalid && (word_cnt == seg_max_words - 9'd1);
        end else begin
            m_axis_tvalid = 1'b1;
            m_axis_tdata  = 32'd0;
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end
    end

endmodule