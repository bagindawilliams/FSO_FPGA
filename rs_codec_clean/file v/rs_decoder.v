`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kookmin University / ETRI Daejon
// Engineer: Irzal Zaini
// 
// Create Date: 2025/12/04 11:09:22 AM
// Design Name: 
// Module Name: rs_decoder
// Project Name: ETRI FSO Channel Coding
// Target Devices: xcku060-ffva1156-2-i
// Tool Versions: Vivado 2022.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rs_decoder #( parameter max = 255 )(
    input           sys_clk,
    input           rst_n,
    input           de,
    input   [7:0]   data_in,
    output          valid,
    output  [7:0]   data_out
);

localparam  hold    = 41;
reg [7:0]   con_hold    = 8'b0,
            addra   = 8'b0,
            addrb   = 8'b0;
localparam  IDLE    = 8'h01,
            ADDRA   = 8'h02,
            HOLD    = 8'h04,
            ADDRB   = 8'h08,
            END     = 8'h80;
reg [7:0]   state, next_state;

wire    ena, enb;
assign  ena     = (state == ADDRA);
assign  enb     = (state == ADDRB);

reg [7:0]   data_d0, decode_out;
wire        syndrome_dv,
            euclid_dv,
            error_pos;
wire [7:0]  chien,
            forney,
            data_delay;
wire [127:0]    syndrome;
wire [71:0]     delta;
wire [63:0]     omega;

always @(posedge sys_clk)
    data_d0     <= (~rst_n) ? 8'b0 : data_in;

always @(posedge sys_clk) begin
    if (~rst_n)
        con_hold   <= 8'b0;
    else if (state == HOLD)
        con_hold   <= con_hold  + 1'b1;
    else
        con_hold   <= 8'b0;
end

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        addra   <= 8'b0;
    else if (state == ADDRA)
        addra   <= addra  + 1'b1;
    else
        addra   <= 8'b0;
end

always @(posedge sys_clk) begin
    if (~rst_n)
        addrb   <= 8'b0;
    else if (state == ADDRB)
        addrb   <= addrb  + 1'b1;
    else
        addrb   <= 8'b0;
end

always @(*) begin
    case (state)
        IDLE:           begin
                            if (de)
                                next_state    <= ADDRA;
                            else
                                next_state    <= IDLE;
                        end
        ADDRA:          begin
                            if (addra < max)
                                next_state    <= ADDRA;
                            else
                                next_state    <= HOLD;
                        end
        HOLD:           begin
                            if (con_hold < hold)
                                next_state    <= HOLD;
                            else
                                next_state    <= ADDRB;
                        end
        ADDRB:          begin
                            if (addrb < max)
                                next_state    <= ADDRB;
                            else
                                next_state    <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

always @(posedge sys_clk) begin
    if (~rst_n)
        decode_out  <= 8'b0;
    else if (state == ADDRB && addrb < max - 14) begin
        if (error_pos)
            decode_out  <= data_delay ^ forney;
        else
            decode_out  <= data_delay;
    end
    else
        decode_out  <= 8'b0;
end

assign  valid       = (addrb > 2 && addrb < max - 13);
assign  data_out    = (valid) ? decode_out : 8'b0;

bram_rs bram_rs_inst (
    .addra          (addra)
    ,.clka          (sys_clk)
    ,.dina          (data_d0)
    ,.ena           (ena)
    ,.wea           (1'b1)
    ,.addrb         (addrb)
    ,.clkb          (sys_clk)
    ,.doutb         (data_delay)
    ,.enb           (enb)
);

syndrome_unit syndrome_unit_inst (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            (de)
    ,.data_in       (data_in)
    ,.valid         (syndrome_dv)
    ,.syndrome      (syndrome)
);

euclid_proc euclid_proc_inst (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            (syndrome_dv)
    ,.syndrome      (syndrome)
    ,.valid         (euclid_dv)
    ,.delta         (delta)
    ,.omega         (omega)
);

chien_search chien_search_inst (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            (euclid_dv)
    ,.delta         (delta)
    ,.error         (error_pos)
    ,.chien         (chien)
);

forney_math forney_math_inst (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            (euclid_dv)
    ,.omega         (omega)
    ,.chien         (chien)
    ,.forney        (forney)
);







endmodule




