`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2025 09:43:52 PM
// Design Name: 
// Module Name: combiner
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


module combiner(
    input               clk,
    input               rst_n,
    input               en,
    input   [7:0]       header_in,
    input   [63:0]      payload_in,
    output              flag,
    output  [63:0]      data_out
);

parameter   thres       = 6;
parameter   max_wr      = 149;
parameter   max_rd      = thres + 254;

reg     [15:0]  con_wr      = 16'd0;
reg     [15:0]  con_rd      = 16'd0;

parameter   IDLE        = 4'b0001;
parameter   WRITE       = 4'b0010;
parameter   READ        = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

wire    rd_en;
wire    [63:0]      fifo_out;
reg     [63:0]      combine_out;

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
        con_wr      <= 16'd0;
    else if (state == WRITE)
        con_wr      <= con_wr + 1'b1;
    else
        con_wr      <= 16'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_rd      <= 16'd0;
    else if (state == READ)
        con_rd      <= con_rd + 1'b1;
    else
        con_rd      <= 16'd0;
end

always @(*)
begin
    case(state)
        IDLE:           begin
                            if (en)
                                next_state  <= WRITE;
                            else
                                next_state  <= IDLE;
                        end
        WRITE:          begin
                            if (con_wr < max_wr)
                                next_state  <= WRITE;
                            else
                                next_state  <= READ;
                        end
        READ:           begin
                            if (con_rd < max_rd)
                                next_state  <= READ;
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
        combine_out     <= 63'b0;
    else if (con_rd > 0 && con_rd < thres - 1)
        combine_out     <= fifo_out;
    else if (state == READ && con_rd > thres - 2)
        combine_out     <= payload_in;
    else
        combine_out     <= 63'b0;
end

assign  rd_en   = (state == READ && con_rd < thres);

assign  flag        = (state == READ && con_rd > 1);
assign  data_out    = (flag) ? combine_out : 64'b0;

delay_combiner delay_inst (
    .srst           (1'b0)
    ,.clk           (clk)
    ,.wr_en         (en)
    ,.din           (header_in)
    ,.rd_en         (rd_en)
    ,.dout          (fifo_out)
);




endmodule






