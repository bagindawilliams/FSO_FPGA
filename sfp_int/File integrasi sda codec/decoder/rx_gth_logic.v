`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 01:11:42 PM
// Design Name: 
// Module Name: rx_gth_logic
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


module rx_gth_logic(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [95:0]      data_out
);

parameter   max_wr      = 589;
parameter   max_rd      = 260;

reg     [15:0]  con_wr      = 16'd0;
reg     [15:0]  con_rd      = 16'd0;

parameter   IDLE        = 4'b0001;
parameter   WRITE       = 4'b0010;
parameter   READ        = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

reg     en_d0;
reg     en_d1;

wire    rd_en;
wire    [127:0]      fifo_out;

always @(posedge clk_gth or negedge rst_n)
begin
    if (~rst_n)
        en_d0   <= 1'b0;
    else
        en_d0   <= en;
end

always @(posedge clk_logic or negedge rst_n)
begin
    if (~rst_n)
        en_d1   <= 1'b0;
    else
        en_d1   <= en_d0;
end

always @(posedge clk_logic or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

always @(posedge clk_logic or negedge rst_n)
begin
    if (~rst_n)
        con_wr      <= 16'd0;
    else if (state == WRITE)
        con_wr      <= con_wr + 1'b1;
    else
        con_wr      <= 16'd0;
end

always @(posedge clk_logic or negedge rst_n)
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
                            if (en_d1)
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

assign  rd_en   = (state == READ);

assign  flag        = (con_rd > 0 && con_rd < max_rd);
assign  data_out    = (flag) ? fifo_out[127:32] : 96'b0;

cross_gth_logic cross_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_gth)
    ,.wr_en         (en)
    ,.din           (data_in)
    ,.rd_clk        (clk_logic)
    ,.rd_en         (rd_en)
    ,.dout          (fifo_out)
);





endmodule




