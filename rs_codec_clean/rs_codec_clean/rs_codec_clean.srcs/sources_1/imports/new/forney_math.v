`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 09:45:54 AM
// Design Name: 
// Module Name: forney_math
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
// 
//////////////////////////////////////////////////////////////////////////////////


module forney_math #( parameter max = 254 )(
    input               sys_clk,
    input               rst_n,
    input               de,
    input   [63:0]      omega,
    input   [7:0]       chien,
    output              valid,
    output  [7:0]       forney
);
    
reg [7:0]   count   = 8'b0;
localparam  IDLE    = 4'h1,
            ACTIVE  = 4'h2,
            END     = 4'h8;
reg [3:0]   state, next_state;

reg [63:0]  omega_d0;
reg [7:0]   Q [0:7];
wire [7:0]  D [0:7];
wire [7:0]  C0, C1, inv_0;

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 8'b0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 8'b0;
end

always @(*) begin
    case(state)
        IDLE:           begin
                            if (de)
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

always @(posedge sys_clk)
    omega_d0     <= (~rst_n) ? 64'b0 : omega;

integer i;
always @(posedge sys_clk) begin
    if (~rst_n)
        for (i = 0; i < 8; i = i + 1)
            Q[i]  <= 8'b0;
    else if (state == ACTIVE) begin
        if (count == 0)
            for (i = 0; i < 8; i = i + 1)
                Q[i]    <= omega_d0[i*8 +: 8];
        else
            for (i = 0; i < 8; i = i + 1)
                Q[i]  <= D[i];
    end
    else
        for (i = 0; i < 8; i = i + 1)
            Q[i]  <= 8'b0;
end

assign  D[0]    = Q[0];
assign  C0      = Q[0] ^ Q[1] ^ Q[2] ^ Q[3] ^
                Q[4] ^ Q[5] ^ Q[6] ^ Q[7];

assign  valid   = (state == ACTIVE);
assign  forney  = (count != 0) ? C1 : 8'b0;

inverter    invert_0    (chien, inv_0);
multiplier  gf_0        (inv_0, C0, C1);
multiplier  gf_1        (8'h02, Q[1], D[1]);
multiplier  gf_2        (8'h04, Q[2], D[2]);
multiplier  gf_3        (8'h08, Q[3], D[3]);
multiplier  gf_4        (8'h10, Q[4], D[4]);
multiplier  gf_5        (8'h20, Q[5], D[5]);
multiplier  gf_6        (8'h40, Q[6], D[6]);
multiplier  gf_7        (8'h80, Q[7], D[7]);









endmodule