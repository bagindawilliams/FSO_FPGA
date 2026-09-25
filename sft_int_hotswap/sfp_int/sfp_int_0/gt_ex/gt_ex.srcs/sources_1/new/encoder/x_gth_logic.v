`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 03:51:29 PM
// Design Name: 
// Module Name: x_gth_logic
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


module x_gth_logic(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header_in,
    input   [31:0]      payload_in,
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [63:0]      payload
);

parameter   max_head    = 27;
parameter   st_head     = 8;

parameter   max_load    = 406;
parameter   st_load     = 164;

reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     en_d0;
reg     en_d1;

wire    rd_head;
wire    [7:0]       header_out;
wire    rd_load;
wire    [63:0]      payload_out;

always @(posedge clk_gth or negedge rst_n)
begin
    if (~rst_n)
        en_d0   <= 1'b0;
    else
        en_d0   <= en_head;
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
                            if (en_d1)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= IDLE;
                        end
        ACTIVE:         begin
                            if (count < max_load)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

assign  rd_head         = (count > st_head && count < max_head);
assign  header_dv       = (count > st_head + 1 && count < max_head - 1);
assign  header          = (header_dv) ? header_out : 8'b0;

assign  rd_load         = (count > st_load && count < max_load);
assign  payload_dv      = (count > st_load + 1 && count < max_load - 1);
assign  payload         = (payload_dv) ? payload_out : 64'b0;

cross_gth_logic_head cross_head_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_gth)
    ,.wr_en         (en_head)
    ,.din           (header_in)
    ,.rd_clk        (clk_logic)
    ,.rd_en         (rd_head)
    ,.dout          (header_out)
);

cross_gth_logic_load cross_load_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_gth)
    ,.wr_en         (en_load)
    ,.din           (payload_in)
    ,.rd_clk        (clk_logic)
    ,.rd_en         (rd_load)
    ,.dout          (payload_out)
);






endmodule








