`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 06:25:33 PM
// Design Name: 
// Module Name: scrambler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Revision 2.00 (2026-10-27 04:09 KST) - [ETRI Audit Item 4: SDA OISL Page 39-40,
//   Table 2-17 & Figure 2-12]:
//   1. Replaced 65-bit state (init = 64'h87654321abcd9536) with the standard 
//      25-bit PRBS shift register X[24:0] initialized to SEED_INIT = 25'h0000007
//      (X[0:1]=1, X[2]=1, X[24:3]=0 per Table 2-17) at the start of every frame header.
//   2. Unrolled 64 bits per clock cycle with natural bit ordering S[63 - k] = s_k
//      (k = 0..63), mapping Byte 0 MSB (b7 ^ s0) down to Byte 1 LSB (B0 ^ s15)
//      across all 8 bytes per 64-bit word per Figure 2-12.
//   3. Preserved exact port interface, 259-cycle frame window (max = 258), and 
//      1-cycle pipeline latency.
//////////////////////////////////////////////////////////////////////////////////


module scrambler(
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              flag,
    output  [63:0]      data_out
);

parameter   max         = 258;
reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

// Legacy baseline parameter retained for reference:
parameter   init        = 64'h87654321abcd9536;
// [Rev 2.00 - 2026-10-27 04:09 KST] SDA OISL v2.1.2 Table 2-17 25-bit seed:
parameter   [24:0] SEED_INIT = 25'h0000007;

reg     [63:0]  data_in_d0;
reg     [63:0]  scr_out;
wire    [63:0]  S;

// [Rev 2.00] 25-bit PRBS State Register X[24:0] (Table 2-17)
reg     [24:0]  Q   = SEED_INIT;
wire    [24:0]  D;

// Combinational 64-step unrolled 25-bit PRBS generator (Polynomial: 1 + D^3 + D^25)
// Produces {next_state_25[24:0], S_64[63:0]} where S_64[63-k] = s_k per Figure 2-12.
function [88:0] step_prbs25_64(input [24:0] q_in);
    reg [24:0] sr;
    reg [63:0] s_vec;
    reg        fb;
    integer    k;
    begin
        sr = q_in;
        for (k = 0; k < 64; k = k + 1) begin
            s_vec[63 - k] = sr[0];          // s_k natural output mapped MSB-first (b7 ^ s0)
            fb            = sr[0] ^ sr[3];  // Taps at stage 0 and stage 3 (1 + D^3 + D^25)
            sr            = {fb, sr[24:1]}; // Advance 25-bit shift register
        end
        step_prbs25_64 = {sr, s_vec};
    end
endfunction

wire [88:0] prbs25_step_out = step_prbs25_64(Q);
assign D = prbs25_step_out[88:64];
assign S = prbs25_step_out[63:0];


always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        count   <= 16'd0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 16'd0;
end

always @(*)
begin
    case(state)
        IDLE:           begin
                            if (en)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= IDLE;
                        end
        ACTIVE:         begin
                            if (count < max)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        data_in_d0      <= 64'b0;
    else
        data_in_d0      <= data_in;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        Q   <= SEED_INIT;
    else if (state == ACTIVE)
        Q   <= D;
    else
        Q   <= SEED_INIT;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        scr_out     <= 64'd0;
    else if (state == ACTIVE)
        scr_out     <= data_in_d0 ^ S;
    else
        scr_out     <= 64'd0;
end

/* 
   [Legacy 65-bit B[0]..B[64] expansion retained in revision history; 
    replaced by 25-bit step_prbs25_64 function above per SDA OISL Table 2-17]
*/

assign  flag        = (count != 0);
assign  data_out    = (flag) ? scr_out : 64'b0;

endmodule