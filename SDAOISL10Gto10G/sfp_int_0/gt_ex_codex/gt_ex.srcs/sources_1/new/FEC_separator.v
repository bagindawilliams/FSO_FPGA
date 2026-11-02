`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : FEC_separator (Previously separator.v)
Description  : FEC Auto-Aligning Demultiplexer (Exact Inverse of FEC_MUX.v).
               Receives the 259-cycle continuous 64-bit stream (2072 Bytes) 
               from descrambler.v and separates it into:
               1. RS Header Stream : 32 cycles @ 8-bit  (32 Bytes: 16B Data + 16B Parity)
               2. RS Payload Stream: 255 cycles @ 64-bit (2040 Bytes: 1912B Data + 128B Parity)
===========================================================================
*/

module FEC_separator (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,          // From descrambler_dv (259 continuous cycles)
    input  wire [63:0] data_in,     // From descrambler data_out[63:0]

    // Output to RS(32,16) Header Decoder (8-bit, 32 cycles)
    output reg         header_dv,
    output reg  [7:0]  header,

    // Output to 8xRS(255,239) Payload Decoder (64-bit, 255 cycles)
    output reg         payload_dv,
    output reg  [63:0] payload
);

    reg [8:0]   in_word_cnt;
    reg [255:0] hdr_shift_buf;
    reg [5:0]   hdr_byte_cnt;
    reg         hdr_serializing;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            in_word_cnt     <= 9'd0;
            hdr_shift_buf   <= 256'd0;
            hdr_byte_cnt    <= 6'd0;
            hdr_serializing <= 1'b0;
            header_dv       <= 1'b0;
            header          <= 8'd0;
            payload_dv      <= 1'b0;
            payload         <= 64'd0;
        end else begin
            // Default de-assertions
            header_dv  <= 1'b0;
            header     <= 8'd0;
            payload_dv <= 1'b0;
            payload    <= 64'd0;

            // ---------------------------------------------------
            // 1. INCOMING 259-CYCLE 64-BIT STREAM ROUTING
            // ---------------------------------------------------
            if (en) begin
                if (in_word_cnt < 9'd4) begin
                    // Cycles 0..3: Capture 4 x 64-bit words (256 bits = 32 Bytes) of RS Header
                    case (in_word_cnt[1:0])
                        2'd0: hdr_shift_buf[255:192] <= data_in;
                        2'd1: hdr_shift_buf[191:128] <= data_in;
                        2'd2: hdr_shift_buf[127:64]  <= data_in;
                        2'd3: begin
                            hdr_shift_buf[63:0] <= data_in;
                            hdr_serializing     <= 1'b1;
                            hdr_byte_cnt        <= 6'd0;
                        end
                    endcase
                    in_word_cnt <= in_word_cnt + 9'd1;
                end else begin
                    // Cycles 4..258: Forward 255 x 64-bit words (2040 Bytes) to RS Payload Decoder
                    payload_dv <= 1'b1;
                    payload    <= data_in;
                    if (in_word_cnt == 9'd258)
                        in_word_cnt <= 9'd0;
                    else
                        in_word_cnt <= in_word_cnt + 9'd1;
                end
            end else begin
                in_word_cnt <= 9'd0;
            end

            // ---------------------------------------------------
            // 2. SERIALIZE 256-BIT HEADER BUFFER (32 CYCLES @ 8-BIT)
            // Emits MSB-first (hdr_shift_buf[255:248] .. [7:0])
            // ---------------------------------------------------
            if (hdr_serializing) begin
                header_dv     <= 1'b1;
                header        <= hdr_shift_buf[255:248];
                hdr_shift_buf <= {hdr_shift_buf[247:0], 8'd0};

                if (hdr_byte_cnt == 6'd31) begin
                    hdr_serializing <= 1'b0;
                    hdr_byte_cnt    <= 6'd0;
                end else begin
                    hdr_byte_cnt <= hdr_byte_cnt + 6'd1;
                end
            end
        end
    end

endmodule