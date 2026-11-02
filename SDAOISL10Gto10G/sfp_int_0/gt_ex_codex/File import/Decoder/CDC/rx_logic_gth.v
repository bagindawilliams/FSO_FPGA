`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2025 10:02:30 AM
// Design Name: 
// Module Name: rx_logic_gth
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


module rx_logic_gth(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header_in,
    input   [63:0]      payload_in,
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [31:0]      payload
);

parameter   max_head    = 36;
parameter   st_head     = 17;

parameter   max_load    = 489;          // diff 481
parameter   st_load     = 8;

reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     en_d0;

wire    rd_head;
wire    rd_load;

wire    [7:0]       head_out;
wire    [31:0]      load_out;

always @(posedge clk_gth or negedge rst_n)
begin
    if (~rst_n)
        en_d0   <= 1'b0;
    else
        en_d0   <= en_load;
end

always @(posedge clk_gth or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

always @(posedge clk_gth or negedge rst_n)
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
                            if (en_d0)
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
assign  header          = (header_dv) ? head_out : 8'b0;

assign  rd_load         = (count > st_load && count < max_load);
assign  payload_dv      = (count > st_load + 1 && count < max_load - 1);
assign  payload         = (payload_dv) ? load_out : 32'b0;

cross_logic_gth_head cross_head_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_logic)
    ,.wr_en         (en_head)
    ,.din           (header_in)
    ,.rd_clk        (clk_gth)
    ,.rd_en         (rd_head)
    ,.dout          (head_out)
);

cross_logic_gth_load cross_payload_inst (
    .srst           (1'b0)
    ,.wr_clk        (clk_logic)
    ,.wr_en         (en_load)
    ,.din           (payload_in)
    ,.rd_clk        (clk_gth)
    ,.rd_en         (rd_load)
    ,.dout          (load_out)
);





endmodule







