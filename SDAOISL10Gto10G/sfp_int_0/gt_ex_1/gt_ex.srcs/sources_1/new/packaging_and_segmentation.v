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
                 Added segment-level valid Ethernet byte tracking so 
                 'seg_valid_bytes' holds the exact number of non-padded 
                 Ethernet bytes in the current segment (e.g., 11'd1900 on 
                 Frame 1 and 11'd100 on Frame 2 during S_PAD) through the 
                 end of the 475-word boundary per SDA OISL Section 2.6.3.7.3.
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
    output reg  [10:0] seg_valid_bytes
);

    // 1024-Word Elastic FIFO (Bit 32 = tlast, Bits [31:0] = tdata)
    (* ram_style = "distributed" *) reg [32:0] fifo_ram [0:1023];
    reg [9:0]  wr_ptr;
    reg [9:0]  rd_ptr;
    reg [10:0] fifo_count;

    wire fifo_empty    = (fifo_count == 11'd0);
    wire fifo_full     = (fifo_count >= 11'd1000);
    assign s_axis_tready = !fifo_full;

    wire write_en = s_axis_tvalid && s_axis_tready;
    wire read_en;

    // Purely Synchronous RAM Write (Required for LUTRAM inference)
    always @(posedge clk) begin
        if (write_en) begin
            fifo_ram[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
        end
    end

    // Write Pointer and FIFO Occupancy Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr     <= 10'd0;
            fifo_count <= 11'd0;
        end else begin
            if (write_en) begin
                wr_ptr <= wr_ptr + 10'd1;
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

    reg        state;
    reg [8:0]  word_cnt;
    wire [32:0] rd_data = fifo_ram[rd_ptr];

    assign read_en = (state == S_PASS) && !fifo_empty && m_axis_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state           <= S_PASS;
            word_cnt        <= 9'd0;
            rd_ptr          <= 10'd0;
            seg_valid_bytes <= 11'd0;
        end else begin
            if (m_axis_tvalid && m_axis_tready) begin
                if (state == S_PASS) begin
                    rd_ptr <= rd_ptr + 10'd1;

                    if (word_cnt == 9'd0)
                        seg_valid_bytes <= 11'd4;
                    else
                        seg_valid_bytes <= seg_valid_bytes + 11'd4;

                    if (word_cnt == MAX_WORDS - 1) begin
                        word_cnt <= 9'd0;
                    end else if (rd_data[32]) begin
                        // End of Ethernet packet before 475-word boundary:
                        // Hold seg_valid_bytes (e.g., 100 Bytes) steady during S_PAD
                        word_cnt <= word_cnt + 9'd1;
                        state    <= S_PAD;
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
            m_axis_tvalid = !fifo_empty;
            m_axis_tdata  = m_axis_tvalid ? rd_data[31:0] : 32'd0;
            m_axis_tlast  = m_axis_tvalid && (word_cnt == MAX_WORDS - 1);
        end else begin
            m_axis_tvalid = 1'b1;
            m_axis_tdata  = 32'd0;
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end
    end

endmodule