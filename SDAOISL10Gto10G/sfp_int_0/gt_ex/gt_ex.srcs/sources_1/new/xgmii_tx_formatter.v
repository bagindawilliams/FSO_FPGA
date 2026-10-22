`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : xgmii_tx_formatter
Description  : IEEE 802.3ae 32-bit XGMII Transmit Formatter.
               Converts the framed Ethernet stream (8-Byte Preamble + 
               Payload + FCS) into physical XGMII data (xgmii_txd[31:0]) and 
               control (xgmii_txc[3:0]) signals for eth_10g_pcs_pma_tx_0.

               KEY OPERATIONS:
               1. Idle State:
                  Drives XGMII Idle characters (xgmii_txd = 32'h0707_0707, 
                  xgmii_txc = 4'b1111).
               2. Cycle 1 (Start of Frame /S/):
                  Replaces the first byte of the Preamble in Lane 0 with the 
                  XGMII Start control code 0xFB (xgmii_txd = 32'h5555_55FB, 
                  xgmii_txc = 4'b0001).
               3. Cycle 2 (Preamble + SFD 0xD5):
                  Places the Start Frame Delimiter (0xD5) in Lane 3 
                  (xgmii_txd = 32'hD555_5555, xgmii_txc = 4'b0000) to match 
                  Xilinx 10G PCS/PMA and xgmii_rx_parser lane ordering.
               4. Payload Cycles & Dynamic Termination (/T/):
                  Streams all Ethernet payload words (xgmii_txc = 4'b0000) 
                  until 'mac_valid' de-asserts at the end of the packet, then 
                  appends the XGMII Terminate control code 0xFD followed by 
                  Idle (xgmii_txd = 32'h0707_07FD, xgmii_txc = 4'b1111) and 
                  enforces a 3-cycle (12-Byte) Inter-Packet Gap (IPG).
===========================================================================
*/

module xgmii_tx_formatter (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mac_data,
    input  wire        mac_valid,
    output reg  [31:0] xgmii_txd,
    output reg  [3:0]  xgmii_txc
);

    localparam IDLE     = 2'd0;
    localparam ACTIVE   = 2'd1;
    localparam IPG_WAIT = 2'd2;

    reg [1:0]  state;
    reg [15:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            count     <= 16'd0;
            xgmii_txd <= 32'h0707_0707;
            xgmii_txc <= 4'b1111;
        end else begin
            case (state)
                IDLE: begin
                    if (mac_valid) begin
                        state     <= ACTIVE;
                        count     <= 16'd1;
                        // Cycle 1: Inject XGMII Start /S/ (0xFB) in Lane 0
                        xgmii_txd <= {mac_data[31:8], 8'hFB};
                        xgmii_txc <= 4'b0001;
                    end else begin
                        xgmii_txd <= 32'h0707_0707;
                        xgmii_txc <= 4'b1111;
                    end
                end

                ACTIVE: begin
                    if (mac_valid) begin
                        count <= count + 16'd1;
                        if (count == 16'd1 && mac_data == 32'h5555_55D5) begin
                            // Cycle 2: Align SFD (0xD5) to XGMII Lane 3 [31:24]
                            xgmii_txd <= 32'hD555_5555;
                            xgmii_txc <= 4'b0000;
                        end else begin
                            // Cycles 3..N: Pure Ethernet Frame (MAC + IP + UDP + Payload + FCS)
                            xgmii_txd <= mac_data;
                            xgmii_txc <= 4'b0000;
                        end
                    end else begin
                        // End of Packet: Inject XGMII Terminate /T/ (0xFD) in Lane 0 + 3 Idles
                        xgmii_txd <= 32'h0707_07FD;
                        xgmii_txc <= 4'b1111;
                        state     <= IPG_WAIT;
                        count     <= 16'd0;
                    end
                end

                IPG_WAIT: begin
                    // Enforce minimum 12-Byte (3-cycle) Inter-Packet Gap (IPG)
                    xgmii_txd <= 32'h0707_0707;
                    xgmii_txc <= 4'b1111;
                    if (count == 16'd2) begin
                        state <= IDLE;
                        count <= 16'd0;
                    end else begin
                        count <= count + 16'd1;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule