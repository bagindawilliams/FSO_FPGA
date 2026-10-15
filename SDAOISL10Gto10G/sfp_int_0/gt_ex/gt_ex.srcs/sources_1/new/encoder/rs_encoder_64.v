`timescale 1ns / 1ps
/*
===========================================================================
Description  : 64-bit Parallel Reed-Solomon Encoder.
               Payload requires 239 Data Words + 16 Parity Words = 255 Cycles.
===========================================================================
*/
module rs_encoder_64 #(parameter MAX_CYCLE = 255) (
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              flag,
    output  [63:0]      data_out
);

    rs_encoder #(MAX_CYCLE) rs_encoder_7 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[63:56]), .flag(flag), 
        .data_out(data_out[63:56])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_6 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[55:48]), 
        .data_out(data_out[55:48])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_5 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[47:40]), 
        .data_out(data_out[47:40])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_4 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[39:32]), 
        .data_out(data_out[39:32])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_3 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[31:24]), 
        .data_out(data_out[31:24])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_2 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[23:16]), 
        .data_out(data_out[23:16])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_1 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[15:8]), 
        .data_out(data_out[15:8])
    );
    rs_encoder #(MAX_CYCLE) rs_encoder_0 (
        .clk(clk), .rst_n(rst_n), .en(en),
        .data_in(data_in[7:0]), 
        .data_out(data_out[7:0])
    );

endmodule