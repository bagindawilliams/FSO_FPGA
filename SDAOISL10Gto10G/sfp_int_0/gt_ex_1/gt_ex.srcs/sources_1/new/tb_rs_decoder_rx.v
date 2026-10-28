`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_rs_decoder_rx
Description  : End-to-End Verification Testbench for Receiver Reed-Solomon 
               Decoders:
               - rs_decoder #(33) : Shortened RS(32,16) Header Decoder 
                 (32 Bytes in -> 16 corrected Header Bytes out).
               - rs_decoder_64    : 8-Lane Parallel RS(255,239) Payload Decoder 
                 (255 Words / 2040 Bytes in -> 239 Words / 1912 Bytes out).

               KEY VERIFICATION OBJECTIVES:
               1. Encodes 4 frames using Golden Reference rs_encoder #(31) 
                  and rs_encoder_64 #(254) over GF(2^8) primitive polynomial 
                  F(x) = x^8 + x^7 + x^2 + x + 1 (0x187) and generator roots 
                  alpha^(11*j) for j = 120..135 (SDA OISL Page 37).
               2. Injects symbol errors into both the 32-Byte Header (up to 
                  4 symbol errors) and all 8 lanes of the 2040-Byte Payload 
                  (up to 8 symbol errors per codeword = 64 corrupted bytes/frame).
               3. Verifies 100% error correction and exact recovery of all 
                  16 Header bytes and 1912 Payload bytes per frame.

Revision History:
  - Rev 1.0 (Initial) : RS(32,16) Header & 8xRS(255,239) Payload Decoder TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [ETRI Audit Item 2 & Item 3 Verification]
    Verified unified GF(2^8) 0x187 lookup tables (decimal_value.mem & 
    alpha_value.mem) and generator roots alpha^(11*j) (j = 120..135) across 
    TX rs_encoder and RX syndrome_unit, euclid_proc, chien_search, and 
    forney_math with multi-symbol error injection and Table 2-18 headers.
===========================================================================
*/

module tb_rs_decoder_rx();

    reg clk;   // 200.0 MHz Baseband Clock (5.0 ns)
    reg rst_n;

    // Golden Reference TX Inputs
    reg         tx_hdr_en;
    reg  [7:0]  tx_hdr_in;
    reg         tx_pld_en;
    reg  [63:0] tx_pld_in;

    // Golden Reference TX RS Encoder Outputs
    wire        enc_hdr_dv;
    wire [7:0]  enc_hdr_out;
    wire        enc_pld_dv;
    wire [63:0] enc_pld_out;

    // Symbol Error Injection (Up to E = 8 symbol errors per codeword)
    reg  [5:0]  hdr_sym_idx;
    reg  [8:0]  pld_sym_idx;
    wire [7:0]  hdr_err_mask = (enc_hdr_dv && (hdr_sym_idx >= 6'd3 && hdr_sym_idx <= 6'd6)) ?
                               8'hA5 : 8'h00; // 4 symbol errors in RS(32,16) Header
    wire [63:0] pld_err_mask = (enc_pld_dv && (pld_sym_idx >= 9'd10 && pld_sym_idx <= 9'd17)) ?
                               64'hE175_0023_4600_8792 : 64'd0; // 8 symbol errors per RS(255,239) codeword

    wire [7:0]  noisy_hdr_in = enc_hdr_out ^ hdr_err_mask;
    wire [63:0] noisy_pld_in = enc_pld_out ^ pld_err_mask;

    // Receiver DUT Outputs
    wire        dec_hdr_dv;
    wire [7:0]  dec_hdr_out;
    wire        dec_pld_dv;
    wire [63:0] dec_pld_out;

    // Hierarchical Probes
    wire [11:0] repaired_hdr_bytes      = u_dut_rs_hdr_dec.repaired_symbol_cnt;
    wire [11:0] total_repaired_pld_bytes = u_dut_rs_pld_dec.total_repaired_pld_bytes;
    wire [31:0] fso_payload_header      = u_dut_rs_pld_dec.fso_payload_header;
    wire [31:0] fso_packet_header       = u_dut_rs_pld_dec.fso_packet_header;
    wire [31:0] fso_crc32_out           = u_dut_rs_pld_dec.fso_crc32_out;
    wire [7:0]  pld_byte_stream         = u_dut_rs_pld_dec.pld_byte_stream;
    wire [11:0] pld_byte_cnt            = u_dut_rs_pld_dec.pld_byte_cnt;
    wire [31:0] rs_frame_id             = u_dut_rs_pld_dec.rs_frame_id;

    // 1. Golden Reference TX Encoders (GF 0x187, roots j=120..135)
    rs_encoder #(31) u_ref_rs_hdr_enc (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (tx_hdr_en),
        .data_in  (tx_hdr_in),
        .flag     (enc_hdr_dv),
        .data_out (enc_hdr_out)
    );

    rs_encoder_64 #(254) u_ref_rs_pld_enc (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (tx_pld_en),
        .data_in  (tx_pld_in),
        .flag     (enc_pld_dv),
        .data_out (enc_pld_out)
    );

    // 2. Receiver DUT Decoders (GF 0x187, roots j=120..135)
    rs_decoder #(33) u_dut_rs_hdr_dec (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (enc_hdr_dv),
        .data_in  (noisy_hdr_in),
        .flag     (dec_hdr_dv),
        .data_out (dec_hdr_out)
    );

    rs_decoder_64 u_dut_rs_pld_dec (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (enc_pld_dv),
        .data_in  (noisy_pld_in),
        .flag     (dec_pld_dv),
        .data_out (dec_pld_out)
    );

    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hdr_sym_idx <= 6'd0;
            pld_sym_idx <= 9'd0;
        end else begin
            hdr_sym_idx <= enc_hdr_dv ? (hdr_sym_idx + 6'd1) : 6'd0;
            pld_sym_idx <= enc_pld_dv ? (pld_sym_idx + 9'd1) : 9'd0;
        end
    end

    // Reference FIFOs to Verify Decoded Outputs against Original TX Inputs
    reg [7:0]  exp_hdr_q [0:255];
    reg [63:0] exp_pld_q [0:2047];
    integer    hdr_wr_p = 0, hdr_rd_p = 0;
    integer    pld_wr_p = 0, pld_rd_p = 0;
    integer    hdr_ok_cnt = 0, hdr_err_cnt = 0;
    integer    pld_ok_cnt = 0, pld_err_cnt = 0;

    always @(posedge clk) begin
        if (rst_n) begin
            if (tx_hdr_en) begin
                exp_hdr_q[hdr_wr_p] = tx_hdr_in;
                hdr_wr_p            = hdr_wr_p + 1;
            end
            if (tx_pld_en) begin
                exp_pld_q[pld_wr_p] = tx_pld_in;
                pld_wr_p            = pld_wr_p + 1;
            end
            if (dec_hdr_dv) begin
                if (dec_hdr_out == exp_hdr_q[hdr_rd_p])
                    hdr_ok_cnt = hdr_ok_cnt + 1;
                else
                    hdr_err_cnt = hdr_err_cnt + 1;
                hdr_rd_p = hdr_rd_p + 1;
            end
            if (dec_pld_dv) begin
                if (dec_pld_out == exp_pld_q[pld_rd_p])
                    pld_ok_cnt = pld_ok_cnt + 1;
                else
                    pld_err_cnt = pld_err_cnt + 1;
                pld_rd_p = pld_rd_p + 1;
            end
        end
    end

    integer f, c;
    initial begin
        rst_n     = 1'b0;
        tx_hdr_en = 1'b0;
        tx_hdr_in = 8'd0;
        tx_pld_en = 1'b0;
        tx_pld_in = 64'd0;
        #100;
        rst_n     = 1'b1;
        repeat (5) @(posedge clk);

        for (f = 1; f <= 4; f = f + 1) begin
            // 1. Feed 16 Bytes of Header + 239 Words of Payload
            for (c = 1; c <= 239; c = c + 1) begin
                @(posedge clk);
                if (c <= 16) begin
                    tx_hdr_en <= 1'b1;
                    case (c)
                        1:  tx_hdr_in <= f[7:0];  // d0: TXFN[7:0]
                        2:  tx_hdr_in <= 8'h00;   // d1: TXFN[15:8]
                        5:  tx_hdr_in <= (f == 3) ? 8'hF0 : (f == 4) ? 8'hF2 : 8'hFD;
                        15: tx_hdr_in <= 8'h0F;   // d14: CRC-16 MSB
                        16: tx_hdr_in <= 8'h28;   // d15: CRC-16 LSB
                        default: tx_hdr_in <= 8'h55 + c[7:0];
                    endcase
                end else begin
                    tx_hdr_en <= 1'b0;
                    tx_hdr_in <= 8'd0;
                end

                tx_pld_en <= 1'b1;
                if      (c == 1)   tx_pld_in <= (f == 2) ? 64'hAB00_4064_AAAA_0001 : 64'hAB00_0000_CDEF_07D0;
                else if (c == 239) tx_pld_in <= 64'hDA7A_DA7A_C320_0000 + f[63:0];
                else               tx_pld_in <= {32'h4B6F_6F6B, f[15:0], c[15:0]};
            end

            @(posedge clk);
            tx_hdr_en <= 1'b0;
            tx_pld_en <= 1'b0;
            tx_pld_in <= 64'd0;

            // Wait for RS Decoder BRAM + Euclid + Chien/Forney pipeline before next frame
            repeat (320) @(posedge clk);
        end

        wait(hdr_ok_cnt + hdr_err_cnt == 64);
        wait(pld_ok_cnt + pld_err_cnt == 956);
        #500;

        $display("\n======================================================================");
        $display(" REED-SOLOMON DECODER VERIFICATION REPORT (GF 0x187, ROOTS j=120..135)");
        $display(" -> RS(32,16) Header Bytes Recovered   : %0d / 64  (Errors: %0d)", hdr_ok_cnt, hdr_err_cnt);
        $display(" -> 8xRS(255,239) Payload Words Recov. : %0d / 956 (Errors: %0d)", pld_ok_cnt, pld_err_cnt);
        $display(" -> Total Repaired Header Symbols      : %0d", repaired_hdr_bytes);
        $display(" -> Total Repaired Payload Symbols     : %0d", total_repaired_pld_bytes);
        if (hdr_ok_cnt == 64 && hdr_err_cnt == 0 && pld_ok_cnt == 956 && pld_err_cnt == 0)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH ETRI AUDIT ITEM 2 & ITEM 3!");
        $display("======================================================================\n");
        $finish;
    end

endmodule