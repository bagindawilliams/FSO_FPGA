`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : XGMII (32-bit) to AXI4-Stream Parser.
               Strictly detects Start (0xFB) on Lane 0 as per Xilinx PG068.
               Detects Terminate (0xFD) on any lane and Error (0xFE).
===========================================================================
*/

module xgmii_rx_parser (
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,

    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    output reg         m_axis_tuser
);

    localparam XGMII_START = 8'hFB;
    localparam XGMII_TERM  = 8'hFD;
    localparam XGMII_ERROR = 8'hFE;

    localparam S_IDLE = 1'b0, S_DATA = 1'b1;

    reg state;
    reg [31:0] rxd_reg;
    reg [3:0]  rxc_reg;
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            rxd_reg <= 32'h07070707;
            rxc_reg <= 4'hF;
        end else begin
            rxd_reg <= xgmii_rxd;
            rxc_reg <= xgmii_rxc;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state         <= S_IDLE;
            m_axis_tdata  <= 32'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;
        end else begin
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;
            
            case (state)
                S_IDLE: begin
                    // Strict Lane 0 Check for 0xFB
                    if (rxc_reg[0] && rxd_reg[7:0] == XGMII_START) begin
                        m_axis_tdata  <= rxd_reg;
                        m_axis_tvalid <= 1'b1;
                        state         <= S_DATA;
                    end
                end
                
                S_DATA: begin
                    m_axis_tdata <= rxd_reg;
                    m_axis_tvalid <= 1'b1;
                    
                    // Defective Frame Handling
                    if (rxc_reg != 4'b0000 && 
                       (rxd_reg[7:0] == XGMII_ERROR || rxd_reg[15:8] == XGMII_ERROR || 
                        rxd_reg[23:16] == XGMII_ERROR || rxd_reg[31:24] == XGMII_ERROR)) begin
                        m_axis_tlast <= 1'b1; 
                        m_axis_tuser <= 1'b1; // Mark as Corrupt
                        state        <= S_IDLE;
                    end
                    // Standard Terminate (0xFD) Detection
                    else if (rxc_reg != 4'b0000 && 
                       (rxd_reg[7:0] == XGMII_TERM || rxd_reg[15:8] == XGMII_TERM || 
                        rxd_reg[23:16] == XGMII_TERM || rxd_reg[31:24] == XGMII_TERM)) begin
                        m_axis_tlast <= 1'b1;
                        state        <= S_IDLE;
                    end
                end
            endcase
        end
    end
endmodule