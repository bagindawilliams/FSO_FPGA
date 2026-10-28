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
===========================================================================
*/

module xgmii_rx_parser (
    input  wire        clk,
    input  wire        rst_n,

    // Raw 32-bit XGMII Input from 10G PCS/PMA or Simulation Encoder
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,

    // AXI-Stream Output (Includes 8-Byte Preamble/SFD starting with 0x555555FB)
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast
);

    localparam S_IDLE = 1'b0;
    localparam S_DATA = 1'b1;

    reg state;

    // Detect Start (/S/ = 0xFB in Lane 0 with control bit rxc[0] == 1)
    wire is_start_lane0 = (xgmii_rxc[0] == 1'b1) && (xgmii_rxd[7:0] == 8'hFB);

    // Detect Terminate (/T/ = 0xFD in any lane with corresponding control bit == 1)
    wire is_term_lane0  = (xgmii_rxc[0] == 1'b1) && (xgmii_rxd[7:0]   == 8'hFD);
    wire is_term_lane1  = (xgmii_rxc[1] == 1'b1) && (xgmii_rxd[15:8]  == 8'hFD);
    wire is_term_lane2  = (xgmii_rxc[2] == 1'b1) && (xgmii_rxd[23:16] == 8'hFD);
    wire is_term_lane3  = (xgmii_rxc[3] == 1'b1) && (xgmii_rxd[31:24] == 8'hFD);
    wire is_terminate   = is_term_lane0 | is_term_lane1 | is_term_lane2 | is_term_lane3;

    // 1-Cycle lookahead pipeline register so m_axis_tlast asserts on the final
    // valid Ethernet FCS word right before a Lane-0 Terminate word (0x070707FD)
    reg [31:0] rxd_d1;
    reg        valid_d1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state         <= S_IDLE;
            rxd_d1        <= 32'd0;
            valid_d1      <= 1'b0;
            m_axis_tdata  <= 32'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    m_axis_tvalid <= 1'b0;
                    m_axis_tlast  <= 1'b0;
                    if (is_start_lane0) begin
                        // Replace 0xFB with 0x55 so downstream preamble remover sees clean 0x55
                        rxd_d1   <= {xgmii_rxd[31:8], 8'h55};
                        valid_d1 <= 1'b1;
                        state    <= S_DATA;
                    end else begin
                        valid_d1 <= 1'b0;
                    end
                end

                S_DATA: begin
                    if (is_terminate) begin
                        // Current cycle contains /T/ (0xFD): flush buffered word with tlast = 1
                        m_axis_tdata  <= rxd_d1;
                        m_axis_tvalid <= valid_d1;
                        m_axis_tlast  <= 1'b1;
                        valid_d1      <= 1'b0;
                        state         <= S_IDLE;
                    end else if (xgmii_rxc == 4'b0000) begin
                        // Normal data word: output previous buffered word and latch current word
                        m_axis_tdata  <= rxd_d1;
                        m_axis_tvalid <= valid_d1;
                        m_axis_tlast  <= 1'b0;
                        rxd_d1        <= xgmii_rxd;
                        valid_d1      <= 1'b1;
                    end else begin
                        // Unexpected control character: terminate frame safely
                        m_axis_tdata  <= rxd_d1;
                        m_axis_tvalid <= valid_d1;
                        m_axis_tlast  <= 1'b1;
                        valid_d1      <= 1'b0;
                        state         <= S_IDLE;
                    end
                end
            endcase
        end
    end

endmodule