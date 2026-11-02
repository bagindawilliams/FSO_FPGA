`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : AXI4-Stream to XGMII (32-bit @ 312.5 MHz) Encoder.
               Simulates PHY behavior: Injects 0xFB at lane 0, 0x55 Preamble, 
               0xD5 SFD, and enforces a strict IEEE 802.3 IPG of 9.6ns.
===========================================================================
*/

module xgmii_tx_encoder (
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] s_axis_tdata,
    input  wire [3:0]  s_axis_tkeep,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output reg         s_axis_tready,

    output reg  [31:0] xgmii_txd,
    output reg  [3:0]  xgmii_txc
);

    localparam XGMII_TERM = 8'hFD;
    localparam S_IDLE       = 3'd0, S_PREAMBLE_1 = 3'd1, S_PREAMBLE_2 = 3'd2;
    localparam S_DATA       = 3'd3, S_TERM_EXT   = 3'd4, S_IPG        = 3'd5;

    reg [2:0] state;
    reg [1:0] ipg_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state         <= S_IDLE;
            ipg_cnt       <= 2'd0;
            xgmii_txd     <= 32'h07070707;
            xgmii_txc     <= 4'b1111;
            s_axis_tready <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    xgmii_txd     <= 32'h07070707; 
                    xgmii_txc     <= 4'b1111;
                    s_axis_tready <= 1'b0;
                    if (s_axis_tvalid) state <= S_PREAMBLE_1;
                end

                S_PREAMBLE_1: begin
                    xgmii_txd     <= 32'h555555FB; // 0xFB strictly on lane 0
                    xgmii_txc     <= 4'b0001; 
                    state         <= S_PREAMBLE_2;
                end

                S_PREAMBLE_2: begin
                    xgmii_txd     <= 32'hD5555555; 
                    xgmii_txc     <= 4'b0000;
                    s_axis_tready <= 1'b1;         
                    state         <= S_DATA;
                end

                S_DATA: begin
                    if (s_axis_tvalid) begin
                        if (s_axis_tlast) begin
                            s_axis_tready <= 1'b0; 
                            case (s_axis_tkeep)
                                4'b0001: begin xgmii_txd <= {16'h0707, XGMII_TERM, s_axis_tdata[7:0]}; xgmii_txc <= 4'b1110; state <= S_IPG; end
                                4'b0011: begin xgmii_txd <= {8'h07, XGMII_TERM, s_axis_tdata[15:0]}; xgmii_txc <= 4'b1100; state <= S_IPG; end
                                4'b0111: begin xgmii_txd <= {XGMII_TERM, s_axis_tdata[23:0]}; xgmii_txc <= 4'b1000; state <= S_IPG; end
                                4'b1111: begin xgmii_txd <= s_axis_tdata; xgmii_txc <= 4'b0000; state <= S_TERM_EXT; end
                            endcase
                        end else begin
                            xgmii_txd <= s_axis_tdata;
                            xgmii_txc <= 4'b0000;
                        end
                    end
                end

                S_TERM_EXT: begin
                    xgmii_txd <= {24'h070707, XGMII_TERM};
                    xgmii_txc <= 4'b1111;
                    state     <= S_IPG;
                end

                S_IPG: begin
                    xgmii_txd <= 32'h07070707;
                    xgmii_txc <= 4'b1111;
                    if (ipg_cnt == 2'd1) begin // Min 3 cycles (9.6 ns)
                        ipg_cnt <= 2'd0;
                        state   <= S_IDLE; 
                    end else begin
                        ipg_cnt <= ipg_cnt + 1'b1;
                    end
                end
            endcase
        end
    end
endmodule