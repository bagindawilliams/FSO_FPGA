`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2025 07:56:20 PM
// Design Name: 
// Module Name: x_logic_gth
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


module x_logic_gth(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en,
    input   [127:0]     data_in,  // UBAH: Diperlebar menjadi 128-bit
    output              flag,
    output  [31:0]      data_out
);

parameter   thres       = 11;
parameter   max         = thres + 1038;

reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;
reg     en_d0;

wire    rd_en;
wire    [31:0]      fifo_out;

always @(posedge clk_gth or negedge rst_n) begin
    if (~rst_n) begin
        state   <= IDLE;
        en_d0   <= 1'b0;
    end else begin
        state   <= next_state;
        en_d0   <= en;
    end
end

always @(posedge clk_gth or negedge rst_n) begin
    if (~rst_n)
        count   <= 16'd0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 16'd0;
end

always @(*) begin
    case(state)
        IDLE:    if (en_d0) next_state <= ACTIVE; else next_state <= IDLE;
        ACTIVE:  if (count < max) next_state <= ACTIVE; else next_state <= END;
        END:     next_state <= IDLE;
        default: next_state <= IDLE;
    endcase
end

assign  rd_en   = (state == ACTIVE && count > thres);
assign  flag        = (count > thres + 1 && count < max);
assign  data_out    = (flag) ? fifo_out : 32'b0;

cross_logic_gth cross_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_logic)
    ,.wr_en         (en)
    ,.din           (data_in)     // UBAH: Mengambil 128-bit langsung, tanpa padding nol
    ,.rd_clk        (clk_gth)
    ,.rd_en         (rd_en)
    ,.dout          (fifo_out)
);

endmodule