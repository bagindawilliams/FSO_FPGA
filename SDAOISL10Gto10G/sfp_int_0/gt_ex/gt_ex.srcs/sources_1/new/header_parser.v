`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : header_parser
Description  : SDA OISL Table 2-9 Frame Header Parser.
               Extracts all control, ARQ, timestamp, and Fast Control 
               Channel (FCCH) fields from the 16-Byte decoded Header stream.
===========================================================================
*/

module header_parser (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,               // 16 cycles active from CDC 4 (header_dv)
    input  wire [7:0]  data_in,          // 8-bit Header stream (d0..d15)

    // Extracted SDA OISL Table 2-9 Header Fields
    output reg  [15:0] rx_txfn,          // Bytes d1..d0: Transmit Frame Number
    output reg  [15:0] rx_rxfn,          // Bytes d3..d2: Receive Frame Number (ACK target)
    output reg         rx_ack,           // Byte d4[3]  : 1 = ACK, 0 = NAK
    output reg         rx_ack_valid,     // Byte d4[2]  : 1 = ACK/NAK field valid
    output reg  [1:0]  rx_frame_type,    // Byte d4[1:0]: 00 = IDLE, 01 = DATA, 10 = MGMT
    output reg  [39:0] rx_tx_ts,         // Bytes d9..d5: 40-bit Transmit Timestamp (ps)
    output reg  [5:0]  rx_tod_sec,       // Byte d10[5:0]: 6-bit Time of Day Seconds
    output reg  [2:0]  rx_ts_applies,    // Byte d11[6:4]: Timestamp applicability flags
    output reg  [3:0]  rx_fcch_op,       // Byte d11[3:0]: 4-bit FCCH Opcode
    output reg  [15:0] rx_fcch_pl,       // Bytes d13..d12: 16-bit FCCH Payload
    output reg  [15:0] rx_hdr_crc16,     // Bytes d14..d15: Received CRC-16
    output reg         hdr_parsed_valid  // 1-cycle pulse when all fields are latched
);

    reg [4:0] byte_cnt;
    reg [7:0] hdr_reg [0:14];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            byte_cnt         <= 5'd0;
            rx_txfn          <= 16'd0;
            rx_rxfn          <= 16'd0;
            rx_ack           <= 1'b0;
            rx_ack_valid     <= 1'b0;
            rx_frame_type    <= 2'd0;
            rx_tx_ts         <= 40'd0;
            rx_tod_sec       <= 6'd0;
            rx_ts_applies    <= 3'd0;
            rx_fcch_op       <= 4'd0;
            rx_fcch_pl       <= 16'd0;
            rx_hdr_crc16     <= 16'd0;
            hdr_parsed_valid <= 1'b0;
        end else begin
            hdr_parsed_valid <= 1'b0;

            if (en) begin
                if (byte_cnt < 5'd15) begin
                    hdr_reg[byte_cnt] <= data_in;
                    byte_cnt          <= byte_cnt + 5'd1;
                end else begin
                    // Latch all fields on the 16th byte (byte_cnt == 15)
                    rx_txfn          <= {hdr_reg[1],  hdr_reg[0]};
                    rx_rxfn          <= {hdr_reg[3],  hdr_reg[2]};
                    rx_ack           <= hdr_reg[4][3];
                    rx_ack_valid     <= hdr_reg[4][2];
                    rx_frame_type    <= hdr_reg[4][1:0];
                    rx_tx_ts         <= {hdr_reg[9], hdr_reg[8], hdr_reg[7], hdr_reg[6], hdr_reg[5]};
                    rx_tod_sec       <= hdr_reg[10][5:0];
                    rx_ts_applies    <= hdr_reg[11][6:4];
                    rx_fcch_op       <= hdr_reg[11][3:0];
                    rx_fcch_pl       <= {hdr_reg[13], hdr_reg[12]};
                    rx_hdr_crc16     <= {hdr_reg[14], data_in};
                    hdr_parsed_valid <= 1'b1;
                    byte_cnt         <= 5'd0;
                end
            end else begin
                byte_cnt <= 5'd0;
            end
        end
    end

endmodule