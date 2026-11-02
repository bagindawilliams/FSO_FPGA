`timescale 1ns / 1ps
/*
===========================================================================
Description  : FEC Transmission Core (RS Encoder -> Scrambler -> LPC).
               CRITICAL REVISION:
               - Restored RS Encoder parameters to #(31) and #(254). 
                 Since internal counters are 0-indexed, this geometrically 
                 guarantees exactly 32 cycles for Header and 255 for Payload.
               - Utilizes FEC_MUX for 259-cycle true Zero-Gap streaming.
===========================================================================
*/
module core_tx(
    input               clk,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header,
    input   [63:0]      payload,
    output              flag,
    output  [95:0]      data_out
);

    wire        encoder_dv;
    wire [7:0]  rs_head;
    
    wire        rs_load_dv; 
    wire [63:0] rs_load;

    wire        mux_dv;
    wire [63:0] mux_data;
    
    wire        scrambler_dv;
    wire [63:0] scrambler;

    // 1. RS Encoder for Header (max=31 yields exactly 32 Cycles)
    rs_encoder #(31) rs_enc_header_inst (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (en_head),
        .data_in    (header),
        .flag       (encoder_dv),
        .data_out   (rs_head)
    );

    // 2. RS Encoder for Payload (max=254 yields exactly 255 Cycles)
    rs_encoder_64 #(254) rs_encoder_64_inst (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (en_load),
        .data_in    (payload),
        .flag       (rs_load_dv), 
        .data_out   (rs_load)
    );

    // 3. FEC Auto-Aligning Multiplexer (259 Continuous Cycles)
    FEC_MUX u_fec_mux (
        .clk        (clk),
        .rst_n      (rst_n),
        .rs_head_dv (encoder_dv),
        .rs_head    (rs_head),
        .rs_load_dv (rs_load_dv),
        .rs_load    (rs_load),
        .flag       (mux_dv),
        .data_out   (mux_data)
    );

    // 4. PRBS Scrambler
    scrambler scrambler_inst (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (mux_dv),
        .data_in    (mux_data),
        .flag       (scrambler_dv),
        .data_out   (scrambler)
    );

    // 5. Low-Density Parity Check (LPC) Compression
    lpc_top lpc_top_inst (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (scrambler_dv),
        .data_in    (scrambler),
        .flag       (flag),
        .data_out   (data_out)
    );

endmodule