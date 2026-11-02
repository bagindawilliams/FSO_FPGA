`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : descrambler
Description  : 64-bit Parallel Additive PRBS Descrambler.
               Processes 259 contiguous 64-bit words per frame (4 Header 
               words = 32B + 255 Payload words = 2040B; Total = 2072 Bytes).
               Resets the internal LFSR state to 'init' at the end of every
               259-word frame to maintain frame-synchronous descrambling.

               CRITICAL BUG FIXES (4 LFSR Matrix Typos Fixed to Match scrambler.v):
               1. B[27] : Fixed 1st XOR term from 'B[26][63] ^ B[26][61]' to 'B[26][64] ^ B[26][61]'.
               2. B[58] : Fixed 22nd XOR term from 'B[57][44] ^ B[57][40]' to 'B[57][43] ^ B[57][40]'.
               3. B[60] : Fixed slice prefix from 'B[58][4:0]' to 'B[59][4:0]'.
               4. B[61] : Fixed 41st XOR term from 'B[60][25] ^ B[60][21]' to 'B[60][24] ^ B[60][21]'.

Revision History:
  - Rev 1.0 (Initial) : 64-bit parallel descrambler with 4 matrix fixes.
  - Rev 1.1 (2026-10-22 05:45 KST) : Updated timescale to 1ns/1ps and preserved 
    simulation byte unpackers (out_byte_cnt 1..2072, desc_frame_id 1..4).
  - Rev 2.0 (2026-10-27 04:09 KST) : [ETRI Audit Item 4 - SDA OISL Page 39-40, Table 2-17 & Fig. 2-12]
    Updated PRBS generator to the 25-bit shift register X[24:0] initialized with
    SEED_INIT = 25'h0000007 at the start of every frame header and unrolled 64 bits
    per cycle (step_prbs25_64) to match scrambler.v Rev 2.00 bit-for-bit.
===========================================================================
*/

module descrambler (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [63:0] data_in,
    output wire        flag,
    output wire [63:0] data_out
);

    parameter max  = 258;
    reg [15:0] count = 16'd0;

    parameter IDLE   = 3'b001;
    parameter ACTIVE = 3'b010;
    parameter END    = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    parameter init = 64'h87654321abcd9536;
    // [Rev 2.0 - 2026-10-27 04:09 KST] SDA OISL v2.1.2 Table 2-17 25-bit seed:
    parameter [24:0] SEED_INIT = 25'h0000007;

    reg  [63:0] data_in_d0;
    reg  [63:0] scr_out;
    wire [63:0] S;

    reg  [24:0] Q = SEED_INIT;
    wire [24:0] D;

    function [88:0] step_prbs25_64(input [24:0] q_in);
        reg [24:0] sr;
        reg [63:0] s_vec;
        reg        fb;
        integer    k;
        begin
            sr = q_in;
            for (k = 0; k < 64; k = k + 1) begin
                s_vec[63 - k] = sr[0];
                fb            = sr[0] ^ sr[3];
                sr            = {fb, sr[24:1]};
            end
            step_prbs25_64 = {sr, s_vec};
        end
    endfunction

    wire [88:0] prbs25_step_out = step_prbs25_64(Q);
    assign D = prbs25_step_out[88:64];
    assign S = prbs25_step_out[63:0];

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            count <= 16'd0;
        else if (state == ACTIVE)
            count <= count + 1'b1;
        else
            count <= 16'd0;
    end

    always @(*) begin
        case (state)
            IDLE: begin
                if (en)
                    next_state = ACTIVE;
                else
                    next_state = IDLE;
            end
            ACTIVE: begin
                if (count < max)
                    next_state = ACTIVE;
                else
                    next_state = END;
            end
            END:     next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            data_in_d0 <= 64'b0;
        else
            data_in_d0 <= data_in;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            Q <= SEED_INIT;
        else if (state == ACTIVE)
            Q <= D;
        else
            Q <= SEED_INIT;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            scr_out <= 64'd0;
        else if (state == ACTIVE)
            scr_out <= data_in_d0 ^ S;
        else
            scr_out <= 64'd0;
    end

    assign flag     = (count != 0);
    assign data_out = (flag) ? scr_out : 64'b0;

    // =====================================================================
    // SIMULATION TRACKERS: 259-WORD COUNTER & 2072-BYTE STREAM UNPACKER
    // =====================================================================
    // synthesis translate_off
    wire [8:0]  out_word64_cnt  = flag ? count[8:0] : 9'd0;
    wire [11:0] out_byte_cnt    = flag ? (count[11:0] * 12'd8) : 12'd0;
    wire        is_hdr_window   = flag && (count >= 16'd1 && count <= 16'd4);
    wire        is_pld_window   = flag && (count >= 16'd5 && count <= 16'd259);

    reg  [7:0]  desc_sim_q [0:16383];
    integer     desc_wr_ptr;
    integer     desc_rd_ptr;
    reg         desc_unpack_active;

    reg  [7:0]  byte_stream_out;
    reg  [11:0] frame_byte_idx;
    reg  [31:0] desc_frame_id;
    reg  [15:0] desc_total_bytes;

    initial begin
        desc_wr_ptr        = 0;
        desc_rd_ptr        = 0;
        desc_unpack_active = 1'b0;
        byte_stream_out    = 8'd0;
        frame_byte_idx     = 12'd0;
        desc_frame_id      = 32'd0;
        desc_total_bytes   = 16'd0;
    end

    always @(negedge clk or negedge rst_n) begin
        if (~rst_n) begin
            desc_wr_ptr = 0;
        end else if (flag) begin
            desc_sim_q[desc_wr_ptr + 0] = data_out[63:56];
            desc_sim_q[desc_wr_ptr + 1] = data_out[55:48];
            desc_sim_q[desc_wr_ptr + 2] = data_out[47:40];
            desc_sim_q[desc_wr_ptr + 3] = data_out[39:32];
            desc_sim_q[desc_wr_ptr + 4] = data_out[31:24];
            desc_sim_q[desc_wr_ptr + 5] = data_out[23:16];
            desc_sim_q[desc_wr_ptr + 6] = data_out[15:8];
            desc_sim_q[desc_wr_ptr + 7] = data_out[7:0];
            desc_wr_ptr                 = desc_wr_ptr + 8;
        end
    end

    real next_desc_edge_ns;
    always @(posedge clk) begin
        if (rst_n && (state == ACTIVE) && (count == 16'd0) && !desc_unpack_active) begin
            desc_unpack_active = 1'b1;
            @(posedge clk);
            #0.001;
            next_desc_edge_ns = $realtime;
            while (desc_total_bytes < 16'd8288) begin
                if (desc_rd_ptr == 0)
                    byte_stream_out = data_out[63:56];
                else
                    byte_stream_out = desc_sim_q[desc_rd_ptr];

                desc_rd_ptr      = desc_rd_ptr + 1;
                desc_total_bytes = desc_total_bytes + 16'd1;

                if (desc_frame_id == 32'd0) begin
                    desc_frame_id  = 32'd1;
                    frame_byte_idx = 12'd1;
                end else if (frame_byte_idx == 12'd2072) begin
                    desc_frame_id  = desc_frame_id + 32'd1;
                    frame_byte_idx = 12'd1;
                end else begin
                    frame_byte_idx = frame_byte_idx + 12'd1;
                end

                next_desc_edge_ns = next_desc_edge_ns + (2493.6 / 2072.0);
                #((next_desc_edge_ns - $realtime) > 0.0 ? (next_desc_edge_ns - $realtime) : 0.001);
            end
            byte_stream_out    = 8'd0;
            frame_byte_idx     = 12'd0;
            desc_frame_id      = 32'd0;
            desc_unpack_active = 1'b0;
        end
    end
    // synthesis translate_on

endmodule