`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 06:34:28 PM
// Design Name: 
// Module Name: separator
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


module separator(
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [63:0]      payload
);

parameter   max     = 259;
parameter   thres   = 36;
reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     [255:0]     data_d0;
reg     [255:0]     data_d1;

reg     [7:0]   head_out;

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
    else if (state == ACTIVE )
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
        data_d0     <= 256'b0;
    else
        data_d0     <= {data_d0[191:0], data_in};
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        data_d1     <= 256'b0;
    else if (count == 3)
        data_d1     <= data_d0;
    else if (state == END)
        data_d1     <= 256'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        head_out    <= 8'b0;
    else if (count > 3 && count < thres)
        head_out    <= data_d1[255 - (count - 4) * 8 -: 8];
    else
        head_out    <= 8'b0;
end

assign  header_dv   = (count > 4 && count < thres + 1);
assign  header      = head_out;

assign  payload_dv  = (count > 3 && count < max);
assign  payload     = (state == ACTIVE && count > 3) ? data_d0[63:0] : 64'b0;




endmodule







