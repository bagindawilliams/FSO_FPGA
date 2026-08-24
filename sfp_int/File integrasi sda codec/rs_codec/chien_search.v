`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 09:45:54 AM
// Design Name: 
// Module Name: chien_search
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


module chien_search # (parameter max = 254) (
    input               clk,
    input               rst_n,
    input               en,
    input   [71:0]      delta,
    output              flag,
    output              error,
    output  [7:0]       chien
);
    
reg     [7:0]   count   = 8'd0;

localparam  IDLE        = 3'b001;
localparam  ACTIVE      = 3'b010;
localparam  END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     [71:0]      delta_d0;

reg     [7:0]   Q   [0:8];
wire    [7:0]   D   [0:8];
wire    [7:0]   C0;
wire    [7:0]   C1;

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
        count   <= 8'd0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 8'd0;
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
        delta_d0    <= 72'b0;
    else
        delta_d0    <= delta;
end

reg [7:0] i;
always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        for (i = 0; i < 9; i = i + 1)
            Q[i]  <= 8'b0;
    else if (state == ACTIVE)
        begin
            if (count == 0)
                begin
                    Q[8]    <= delta_d0[71:64];
                    Q[7]    <= delta_d0[63:56];
                    Q[6]    <= delta_d0[55:48];
                    Q[5]    <= delta_d0[47:40];
                    Q[4]    <= delta_d0[39:32];
                    Q[3]    <= delta_d0[31:24];
                    Q[2]    <= delta_d0[23:16];
                    Q[1]    <= delta_d0[15:8];
                    Q[0]    <= delta_d0[7:0];
                end
            else
                for (i = 0; i < 9; i = i + 1)
                    Q[i]  <= D[i];
        end
    else
        for (i = 0; i < 9; i = i + 1)
            Q[i]  <= 8'b0;
end

multiplier  gf_1    (8'h02, Q[1], D[1]);
multiplier  gf_2    (8'h04, Q[2], D[2]);
multiplier  gf_3    (8'h08, Q[3], D[3]);
multiplier  gf_4    (8'h10, Q[4], D[4]);
multiplier  gf_5    (8'h20, Q[5], D[5]);
multiplier  gf_6    (8'h40, Q[6], D[6]);
multiplier  gf_7    (8'h80, Q[7], D[7]);
multiplier  gf_8    (8'h1d, Q[8], D[8]);

assign  D[0]    = Q[0];
assign  C0      = Q[0] ^ Q[1] ^ Q[2] ^ Q[3] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[7] ^ Q[8];
assign  C1      = Q[1] ^ Q[3] ^ Q[5] ^ Q[7];

assign  flag    = (state == ACTIVE);
assign  error   = (count != 0 && C0 == 8'b0);
assign  chien   = (count != 0) ? C1 : 8'b0;

endmodule




