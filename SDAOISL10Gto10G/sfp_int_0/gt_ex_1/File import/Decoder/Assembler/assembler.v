`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2025 01:18:13 PM
// Design Name: 
// Module Name: eth_framer
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


module assembler(
    input               clk,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header_in,
    input   [31:0]      payload_in,
    output              flag,
    output  [31:0]      data_out
);

parameter   max         = 483;
parameter   thres       = 240;
reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 4'b0001;
parameter   CHECK       = 4'b0010;
parameter   ACTIVE      = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

reg     [111:0]     head_d0;
reg     [111:0]     head_d1;

reg     [31:0]      load_d0;
reg     [31:0]      head_out;

reg     [13:0]      len_payload     = 14'd0;
reg     [13:0]      len_packet      = 14'd0;

wire    wr_en;
wire    rd_en;
wire    [63:0]      fifo_out;
reg     [31:0]      eth_packet;

reg     [63:0]      roll_out;
reg     [31:0]      load_out;

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
                            if (en_load)
                                next_state  <= CHECK;
                            else
                                next_state  <= IDLE;
                        end
        CHECK:          begin
                            if (load_d0[31:24] == 8'hab)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= END;
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
        load_d0     <= 32'b0;
    else
        load_d0     <= payload_in;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        len_payload     <= 14'd0;
    else if (state == CHECK)
        len_payload     <= load_d0[13:0];
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        head_d0     <= 112'b0;
    else if (count > 6)
        head_d0     <= {head_d0[103:0], header_in};
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        head_d1     <= 112'b0;
    else if (count == 21)
        head_d1     <= head_d0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        eth_packet      <= 32'b0;
    else if (rd_en)
        begin
            if (count > thres + 1 && count < max - 1)
                begin
                    len_packet      <= len_packet - 14'd4;
                    if (fifo_out[63:48] == 16'hcdef)
                        begin
                            if (fifo_out[45:32] == len_packet)
                                eth_packet      <= fifo_out[31:0];
                            else
                                eth_packet      <= 32'b0;
                        end
                    else
                        eth_packet      <= 32'b0;
                end
            else if (count == thres + 1)
                len_packet      <= len_payload - 14'd4;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        roll_out    <= 64'b0;
    else
        roll_out    <= {roll_out[31:0], eth_packet};
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        load_out    <= 32'b0;
    else
        load_out    <= roll_out[47:16];
end

assign  wr_en   = (state == ACTIVE && count < max - 5);
assign  rd_en   = (count > thres && count < max);

assign  flag        = (state == ACTIVE && count > 242);
assign  data_out    = (flag) ? head_out : 32'b0;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        head_out    <= 32'b0;
    else if (count > 241 && count < 246)
        begin
            case (count)
                16'd242:    head_out    <= head_d1[111:80];
                16'd243:    head_out    <= head_d1[79:48];
                16'd244:    head_out    <= head_d1[47:16];
                16'd245:    head_out    <= {head_d1[15:0], load_out[15:0]};
                default:    head_out    <= 32'b0;
            endcase
        end
    else if (count > 245)
        head_out    <= load_out;
    else
        head_out    <= 32'b0;
end

serdes_assembler serdes_inst (
    .srst           (1'b0)
    ,.clk           (clk)
    ,.wr_en         (wr_en)
    ,.din           (load_d0)
    ,.rd_en         (rd_en)
    ,.dout          (fifo_out)
);






endmodule





