`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_preamble_remover
Description  : 8-Byte Ethernet Preamble & SFD (0x55555555_555555D5) Stripper.
               Strips the first 2 words (8 Bytes) of each incoming framed 
               XGMII packet and forwards the clean MAC frame to 
               packaging_and_segmentation.v.

Revision History:
  - Rev 1.0 (Initial) : 2-word Ethernet Preamble & SFD stripper.
  - Rev 2.5 (2026-10-29 16:42 KST) : [Audit Fix R12 - Valid Byte Count Propagation]
    Added 's_axis_tkeep_bytes' and 'm_axis_tkeep_bytes' [2:0] ports to forward the 
    exact valid byte count (1..4) of each word to packaging_and_segmentation.v.
===========================================================================
*/

module eth_preamble_remover (
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,
    input  wire [2:0]  s_axis_tkeep_bytes,

    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,
    output reg  [2:0]  m_axis_tkeep_bytes
);

    assign s_axis_tready = m_axis_tready;

    reg [1:0] word_cnt;
    wire [2:0] safe_in_bytes = ((^s_axis_tkeep_bytes === 1'bx) || (s_axis_tkeep_bytes == 3'd0)) ?
                               3'd4 : s_axis_tkeep_bytes;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            word_cnt           <= 2'd0;
            m_axis_tdata       <= 32'd0;
            m_axis_tvalid      <= 1'b0;
            m_axis_tlast       <= 1'b0;
            m_axis_tkeep_bytes <= 3'd4;
        end else begin
            if (s_axis_tvalid && s_axis_tready) begin
                if (s_axis_tlast) begin
                    word_cnt <= 2'd0;
                end else if (word_cnt < 2'd2) begin
                    word_cnt <= word_cnt + 2'd1;
                end

                // Strip Word 0 (0x55555555) and Word 1 (0xD5555555)
                if (word_cnt == 2'd2) begin
                    m_axis_tdata       <= s_axis_tdata;
                    m_axis_tvalid      <= 1'b1;
                    m_axis_tlast       <= s_axis_tlast;
                    m_axis_tkeep_bytes <= safe_in_bytes;
                end else begin
                    m_axis_tdata       <= 32'd0;
                    m_axis_tvalid      <= 1'b0;
                    m_axis_tlast       <= 1'b0;
                    m_axis_tkeep_bytes <= 3'd4;
                end
            end else if (m_axis_tready) begin
                m_axis_tvalid      <= 1'b0;
                m_axis_tlast       <= 1'b0;
                m_axis_tkeep_bytes <= 3'd4;
            end
        end
    end

endmodule