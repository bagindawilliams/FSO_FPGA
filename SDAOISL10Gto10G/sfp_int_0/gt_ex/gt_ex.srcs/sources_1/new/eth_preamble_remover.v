`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_preamble_remover
Description  : 8-Byte Ethernet Preamble & SFD (2 x 32-bit words) Stripper.
               Strips the first two 32-bit words (Preamble + SFD) of each 
               incoming Ethernet frame from xgmii_rx_parser and forwards the 
               clean Layer-2 Ethernet MAC frame (starting at DEST_MAC) to 
               packaging_and_segmentation.

               Revision Notes:
               - Preserved original 2-word Preamble/SFD stripping logic.
               - Standardized AXI-Stream port declarations to ensure 100% 
                 synthesis compatibility with eth_rx_front_end_top.v.
===========================================================================
*/

module eth_preamble_remover (
    input  wire        clk,
    input  wire        rst_n,

    // AXI-Stream Slave Input from xgmii_rx_parser
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,

    // AXI-Stream Master Output to packaging_and_segmentation
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready
);

    assign s_axis_tready = m_axis_tready;

    reg [1:0] preamble_word_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            preamble_word_cnt <= 2'd0;
            m_axis_tdata      <= 32'd0;
            m_axis_tvalid     <= 1'b0;
            m_axis_tlast      <= 1'b0;
        end else if (m_axis_tready) begin
            if (s_axis_tvalid) begin
                if (s_axis_tlast) begin
                    preamble_word_cnt <= 2'd0;
                end else if (preamble_word_cnt < 2'd2) begin
                    preamble_word_cnt <= preamble_word_cnt + 2'd1;
                end

                // Strip Word 0 (Preamble) and Word 1 (Preamble + SFD)
                if (preamble_word_cnt >= 2'd2) begin
                    m_axis_tdata  <= s_axis_tdata;
                    m_axis_tvalid <= 1'b1;
                    m_axis_tlast  <= s_axis_tlast;
                end else begin
                    m_axis_tdata  <= 32'd0;
                    m_axis_tvalid <= 1'b0;
                    m_axis_tlast  <= 1'b0;
                end
            end else begin
                preamble_word_cnt <= 2'd0;
                m_axis_tdata      <= 32'd0;
                m_axis_tvalid     <= 1'b0;
                m_axis_tlast      <= 1'b0;
            end
        end
    end

endmodule