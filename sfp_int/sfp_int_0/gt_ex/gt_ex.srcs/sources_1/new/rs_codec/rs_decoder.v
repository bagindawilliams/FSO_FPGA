`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kookmin University / ETRI Daejon
// Engineer: Irzal Zaini
// 
// Create Date: 2025/12/04 11:09:22 AM
// Design Name: 
// Module Name: rs_decoder
// Project Name: ETRI FSO Channel Coding
// Target Devices: Kintex Ultrascale KCU60
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rs_decoder #(parameter max_rd = 256) (
    input           clk,
    input           rst_n,
    input           en,
    input   [7:0]   data_in,
    output          flag,
    output  [7:0]   data_out
);

localparam  max_wr      = 254;
localparam  max_hold    = 43;

reg     [7:0]       con_wr      = 8'd0;
reg     [7:0]       con_hold    = 8'd0;
reg     [15:0]      con_rd      = 16'd0;

localparam  IDLE        = 5'b00001;
localparam  WRITE       = 5'b00010;
localparam  HOLD        = 5'b00100;
localparam  READ        = 5'b01000;
localparam  END         = 5'b10000;

reg     [4:0]   state;
reg     [4:0]   next_state;

reg     [7:0]   data_d0;

wire    syndrome_dv;
wire    [127:0]     syndrome;

wire    euclid_dv;
wire    [71:0]      delta;
wire    [63:0]      omega;

wire    error_pos;
wire    [7:0]   chien;
wire    [7:0]   forney;

wire    [7:0]   data_delay;
reg     [7:0]   decode_out;

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
        con_wr      <= 8'd0;
    else if (state == WRITE)
        con_wr      <= con_wr  + 1'b1;
    else
        con_wr      <= 8'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_hold    <= 8'd0;
    else if (state == HOLD)
        con_hold    <= con_hold  + 1'b1;
    else
        con_hold    <= 8'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_rd      <= 8'd0;
    else if (state == READ)
        con_rd      <= con_rd  + 1'b1;
    else
        con_rd      <= 8'd0;
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
                                next_state  <= HOLD;
                        end
        HOLD:           begin
                            if (con_hold < max_hold)
                                next_state  <= HOLD;
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
        data_d0     <= 8'b0;
    else
        data_d0     <= data_in;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        decode_out      <= 8'b0;
    else if (state == READ && con_rd < max_rd - 16)
        begin
            if (error_pos)
                decode_out      <= data_delay ^ forney;
            else
                decode_out      <= data_delay;
        end
    else
        decode_out      <= 8'b0;
end

assign  wr_en       = (state == WRITE && con_wr < max_rd - 1);
assign  rd_en       = (state == READ);

assign  flag        = (con_rd > 1 && con_rd < max_rd - 15);
assign  data_out    = (flag) ? decode_out : 8'b0;

delay_rs delay_inst (
    .srst           (1'b0)
    ,.clk           (clk)
    ,.din           (data_d0)
    ,.wr_en         (wr_en)
    ,.rd_en         (rd_en)
    ,.dout          (data_delay)
);

syndrome_unit syndrome_unit_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in)
    ,.flag          (syndrome_dv)
    ,.syndrome      (syndrome)
);

euclid_proc euclid_proc_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (syndrome_dv)
    ,.syndrome      (syndrome)
    ,.flag          (euclid_dv)
    ,.delta         (delta)
    ,.omega         (omega)
);

chien_search chien_search_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (euclid_dv)
    ,.delta         (delta)
    ,.error         (error_pos)
    ,.chien         (chien)
);

forney_math forney_math_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (euclid_dv)
    ,.omega         (omega)
    ,.chien         (chien)
    ,.forney        (forney)
);







endmodule