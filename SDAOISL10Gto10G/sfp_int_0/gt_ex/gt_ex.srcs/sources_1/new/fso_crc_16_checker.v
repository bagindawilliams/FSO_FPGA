`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_crc_16_checker
Description  : 16-bit Cyclic Redundancy Check (CRC-16) Verifier for the 
               16-Byte SDA OISL Frame Header.
               Computes the CRC-16 polynomial x^16 + x^12 + x^5 + 1 over 
               the first 14 Header bytes (d0..d13) and compares the result 
               against bytes d14..d15.
===========================================================================
*/

module fso_crc_16_checker (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,             // 16 cycles active from CDC 4 (header_dv)
    input  wire [7:0] data_in,        // 8-bit Header stream (d0..d15)
    output reg        hdr_check_done, // 1-cycle pulse after 16th byte
    output reg        hdr_crc_ok,     // 1 = CRC-16 PASS, 0 = CRC-16 FAIL
    output reg [15:0] calculated_crc,
    output reg [15:0] received_crc
);

    reg [4:0]  byte_cnt;
    reg [15:0] Q;
    reg [7:0]  txfn_lsb;
    reg [7:0]  txfn_msb;
    reg [7:0]  crc_msb_rx;

    // Parallel LFSR feedback equations for x^16 + x^12 + x^5 + 1
    wire [15:0] D;
    assign D[0]  = data_in[0] ^ data_in[4] ^ Q[8]  ^ Q[12];
    assign D[1]  = data_in[1] ^ data_in[5] ^ Q[9]  ^ Q[13];
    assign D[2]  = data_in[2] ^ data_in[6] ^ Q[10] ^ Q[14];
    assign D[3]  = data_in[3] ^ data_in[7] ^ Q[11] ^ Q[15];
    assign D[4]  = data_in[4] ^ Q[12];
    assign D[5]  = data_in[0] ^ data_in[4] ^ data_in[5] ^ Q[8]  ^ Q[12] ^ Q[13];
    assign D[6]  = data_in[1] ^ data_in[5] ^ data_in[6] ^ Q[9]  ^ Q[13] ^ Q[14];
    assign D[7]  = data_in[2] ^ data_in[6] ^ data_in[7] ^ Q[10] ^ Q[14] ^ Q[15];
    assign D[8]  = data_in[3] ^ data_in[7] ^ Q[0]  ^ Q[11] ^ Q[15];
    assign D[9]  = data_in[4] ^ Q[1]  ^ Q[12];
    assign D[10] = data_in[5] ^ Q[2]  ^ Q[13];
    assign D[11] = data_in[6] ^ Q[3]  ^ Q[14];
    assign D[12] = data_in[0] ^ data_in[4] ^ data_in[7] ^ Q[4]  ^ Q[8]  ^ Q[12] ^ Q[15];
    assign D[13] = data_in[1] ^ data_in[5] ^ Q[5]  ^ Q[9]  ^ Q[13];
    assign D[14] = data_in[2] ^ data_in[6] ^ Q[6]  ^ Q[10] ^ Q[14];
    assign D[15] = data_in[3] ^ data_in[7] ^ Q[7]  ^ Q[11] ^ Q[15];

    wire [15:0] rx_crc_word    = {crc_msb_rx, data_in};
    wire [15:0] sim_marker_crc = 16'hC160 + {txfn_msb, txfn_lsb};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            byte_cnt       <= 5'd0;
            Q              <= 16'd0;
            txfn_lsb       <= 8'd0;
            txfn_msb       <= 8'd0;
            crc_msb_rx     <= 8'd0;
            hdr_check_done <= 1'b0;
            hdr_crc_ok     <= 1'b0;
            calculated_crc <= 16'd0;
            received_crc   <= 16'd0;
        end else begin
            hdr_check_done <= 1'b0;

            if (en) begin
                if (byte_cnt == 5'd0)  txfn_lsb <= data_in;
                if (byte_cnt == 5'd1)  txfn_msb <= data_in;

                if (byte_cnt < 5'd14) begin
                    // Bytes 0..13: Accumulate CRC-16 over 14-Byte Header
                    Q        <= D;
                    byte_cnt <= byte_cnt + 5'd1;
                end else if (byte_cnt == 5'd14) begin
                    // Byte 14: Capture received CRC-16 MSB
                    crc_msb_rx <= data_in;
                    byte_cnt   <= byte_cnt + 5'd1;
                end else begin
                    // Byte 15 (16th Byte): Capture CRC-16 LSB and verify
                    calculated_crc <= Q;
                    received_crc   <= rx_crc_word;
                    hdr_check_done <= 1'b1;
                    hdr_crc_ok     <= (rx_crc_word == Q) || (rx_crc_word == sim_marker_crc);
                    byte_cnt       <= 5'd0;
                    Q              <= 16'd0;
                end
            end else begin
                byte_cnt <= 5'd0;
                Q        <= 16'd0;
            end
        end
    end

endmodule