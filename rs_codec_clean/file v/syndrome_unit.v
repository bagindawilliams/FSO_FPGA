`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2025 09:57:09 AM
// Design Name: 
// Module Name: syndrome_unit
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


module syndrome_unit (
    input               sys_clk,
    input               rst_n,
    input               de,
    input   [7:0]       data_in,
    output              valid,
    output  [127:0]     syndrome
);

parameter   max     = 255; 
reg [15:0]  count   = 16'b0;
parameter   IDLE    = 4'h1,
            ACTIVE  = 4'h2,
            END     = 4'h4;
reg [3:0]   state, next_state;

reg [7:0]   data_d0;
reg [7:0]   Q [0:15];
wire [7:0]  D [0:15];
wire [7:0]  C [0:15];

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 16'b0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 16'b0;
end

always @(*) begin
    case (state)
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
    data_d0     <= (~rst_n) ? 8'b0 : data_in;

integer i;
always @(posedge sys_clk) begin
    if (~rst_n)
        for (i = 0; i < 16; i = i + 1)
            Q[i]    <= 8'b0;
    else if (state == ACTIVE)
        for (i = 0; i < 16; i = i + 1)
            Q[i]    <= D[i];
    else
        for (i = 0; i < 16; i = i + 1)
            Q[i]    <= 8'b0;
end

assign  C[0]    = Q[0];
assign  D[0]    = data_d0   ^ C[0];
assign  D[1]    = data_d0   ^ C[1];
assign  D[2]    = data_d0   ^ C[2];
assign  D[3]    = data_d0   ^ C[3];
assign  D[4]    = data_d0   ^ C[4];
assign  D[5]    = data_d0   ^ C[5];
assign  D[6]    = data_d0   ^ C[6];
assign  D[7]    = data_d0   ^ C[7];
assign  D[8]    = data_d0   ^ C[8];
assign  D[9]    = data_d0   ^ C[9];
assign  D[10]   = data_d0   ^ C[10];
assign  D[11]   = data_d0   ^ C[11];
assign  D[12]   = data_d0   ^ C[12];
assign  D[13]   = data_d0   ^ C[13];
assign  D[14]   = data_d0   ^ C[14];
assign  D[15]   = data_d0   ^ C[15];

// assign  syndrome[127:120]   = (state == END) ? Q[15]    : 8'b0;
// assign  syndrome[119:112]   = (state == END) ? Q[14]    : 8'b0;
// assign  syndrome[111:104]   = (state == END) ? Q[13]    : 8'b0;
// assign  syndrome[103:96]    = (state == END) ? Q[12]    : 8'b0;
// assign  syndrome[95:88]     = (state == END) ? Q[11]    : 8'b0;
// assign  syndrome[87:80]     = (state == END) ? Q[10]    : 8'b0;
// assign  syndrome[79:72]     = (state == END) ? Q[9]     : 8'b0;
// assign  syndrome[71:64]     = (state == END) ? Q[8]     : 8'b0;
// assign  syndrome[63:56]     = (state == END) ? Q[7]     : 8'b0;
// assign  syndrome[55:48]     = (state == END) ? Q[6]     : 8'b0;
// assign  syndrome[47:40]     = (state == END) ? Q[5]     : 8'b0;
// assign  syndrome[39:32]     = (state == END) ? Q[4]     : 8'b0;
// assign  syndrome[31:24]     = (state == END) ? Q[3]     : 8'b0;
// assign  syndrome[23:16]     = (state == END) ? Q[2]     : 8'b0;
// assign  syndrome[15:8]      = (state == END) ? Q[1]     : 8'b0;
// assign  syndrome[7:0]       = (state == END) ? Q[0]     : 8'b0;

assign  syndrome    = (state == END) ?
                    {Q[15], Q[14], Q[13], Q[12], Q[11], Q[10],
                    Q[9], Q[8], Q[7], Q[6], Q[5], Q[4], Q[3],
                    Q[2], Q[1], Q[0]} : 128'b0;

assign  valid   = (state == END);

multiplier  gf_1    (8'h02, Q[1],   C[1]);
multiplier  gf_2    (8'h04, Q[2],   C[2]);
multiplier  gf_3    (8'h08, Q[3],   C[3]);
multiplier  gf_4    (8'h10, Q[4],   C[4]);
multiplier  gf_5    (8'h20, Q[5],   C[5]);
multiplier  gf_6    (8'h40, Q[6],   C[6]);
multiplier  gf_7    (8'h80, Q[7],   C[7]);
multiplier  gf_8    (8'h1d, Q[8],   C[8]);
multiplier  gf_9    (8'h3a, Q[9],   C[9]);
multiplier  gf_a    (8'h74, Q[10],  C[10]);
multiplier  gf_b    (8'he8, Q[11],  C[11]);
multiplier  gf_c    (8'hcd, Q[12],  C[12]);
multiplier  gf_d    (8'h87, Q[13],  C[13]);
multiplier  gf_e    (8'h13, Q[14],  C[14]);
multiplier  gf_f    (8'h26, Q[15],  C[15]);









endmodule



