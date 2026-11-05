`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : xgmii_rx_parser
Description  : 32-bit IEEE 802.3ae XGMII Receive Frame Delimiter Parser.
               Detects the XGMII Start control character (/S/ = 0xFB on Lane 0)
               and Terminate control character (/T/ = 0xFD on any lane) to 
               convert raw XGMII words into an AXI-Stream frame.

               Revision Notes:
               - Preserved original XGMII /S/ (0xFB) and /T/ (0xFD) detection
                 state machine.
               - Standardized port interface (clk, rst_n, xgmii_rxd, xgmii_rxc,
                 m_axis_tdata, m_axis_tvalid, m_axis_tlast) to match 
                 eth_rx_front_end_top.v without port mismatch errors.
- Rev 2.3 (2026-10-29 12:39 KST) : [Audit Fix F04 - Partial Terminal Word Preservation]
    Preserved 100% of original ports and lookahead architecture. When Terminate (/T/)
    occurs in lane 1, 2, or 3 (xgmii_rxc != 4'b0000 && xgmii_rxc[0] == 1'b0), the 1..3
    valid Ethernet data bytes preceding /T/ are now flushed on the next cycle with 
    m_axis_tlast = 1'b1 instead of being discarded.
- Rev 2.5 (2026-10-29 16:42 KST) : [Audit Fix R12 - Exact Valid Byte Count Sideband]
    Added 'm_axis_tkeep_bytes [2:0]' output (1..4 valid bytes per beat) so downstream 
    eth_preamble_remover and packaging_and_segmentation track exact byte lengths for 
    non-multiple-of-4 Ethernet packets (e.g., 65B, 66B, 67B, 1518B, 1901B).
===========================================================================
*/

module xgmii_rx_parser (
    input  wire        clk,
    input  wire        rst_n,

    // Physical / Loopback 32-bit XGMII Input
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,

    // Framed AXI-Stream Output (Includes 8B Ethernet Preamble)
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    output reg  [2:0]  m_axis_tkeep_bytes // [Rev 2.5] 1..4 valid bytes in current word
);

    reg        in_frame;
    reg [31:0] prev_data;
    reg        flush_tail_pending;
    reg [31:0] tail_data_reg;
    reg [2:0]  tail_bytes_reg;

    wire is_start_word    = (xgmii_rxc == 4'b0001) && (xgmii_rxd[7:0] == 8'hFB);
    wire is_data_word     = (xgmii_rxc == 4'b0000);
    wire has_partial_tail = in_frame && (xgmii_rxc != 4'b0000) && (xgmii_rxc[0] == 1'b0);

    // Count valid data lanes (where xgmii_rxc[k] == 0) before /T/
    wire [2:0] partial_lane_cnt = (!xgmii_rxc[0]) + (!xgmii_rxc[1]) + (!xgmii_rxc[2]) + (!xgmii_rxc[3]);

    wire [31:0] masked_tail_word = {
        xgmii_rxc[3] ? 8'h00 : xgmii_rxd[31:24],
        xgmii_rxc[2] ? 8'h00 : xgmii_rxd[23:16],
        xgmii_rxc[1] ? 8'h00 : xgmii_rxd[15:8],
        xgmii_rxc[0] ? 8'h00 : xgmii_rxd[7:0]
    };

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            in_frame           <= 1'b0;
            prev_data          <= 32'd0;
            flush_tail_pending <= 1'b0;
            tail_data_reg      <= 32'd0;
            tail_bytes_reg     <= 3'd4;
            m_axis_tdata       <= 32'd0;
            m_axis_tvalid      <= 1'b0;
            m_axis_tlast       <= 1'b0;
            m_axis_tkeep_bytes <= 3'd4;
        end else begin
            m_axis_tvalid      <= 1'b0;
            m_axis_tlast       <= 1'b0;
            m_axis_tkeep_bytes <= 3'd4;

            if (flush_tail_pending) begin
                m_axis_tdata       <= tail_data_reg;
                m_axis_tvalid      <= 1'b1;
                m_axis_tlast       <= 1'b1;
                m_axis_tkeep_bytes <= tail_bytes_reg;
                flush_tail_pending <= 1'b0;
            end

            if (!in_frame) begin
                if (is_start_word) begin
                    in_frame  <= 1'b1;
                    prev_data <= {xgmii_rxd[31:8], 8'h55};
                end
            end else begin
                if (is_data_word) begin
                    m_axis_tdata       <= prev_data;
                    m_axis_tvalid      <= 1'b1;
                    m_axis_tlast       <= 1'b0;
                    m_axis_tkeep_bytes <= 3'd4;
                    prev_data          <= xgmii_rxd;
                end else begin
                    in_frame           <= 1'b0;
                    m_axis_tdata       <= prev_data;
                    m_axis_tvalid      <= 1'b1;
                    m_axis_tkeep_bytes <= 3'd4;
                    if (has_partial_tail) begin
                        m_axis_tlast       <= 1'b0;
                        flush_tail_pending <= 1'b1;
                        tail_data_reg      <= masked_tail_word;
                        tail_bytes_reg     <= partial_lane_cnt;
                    end else begin
                        m_axis_tlast       <= 1'b1;
                    end
                end
            end
        end
    end

endmodule