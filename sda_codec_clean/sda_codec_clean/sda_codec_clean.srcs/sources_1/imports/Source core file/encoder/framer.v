`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2025 04:18:56 PM
// Design Name: 
// Module Name: fso_framer
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


module framer(
    input               clk,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [31:0]      payload
);

parameter   max         = 487;
parameter   thres       = 246;
reg     [15:0]  count   = 16'd0;

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     [255:0]     temp;
reg     [111:0]     mac_header;
reg     [7:0]       mac_out;

reg     [9:0]       seq_payload     = 10'd0;
reg     [13:0]      len_payload     = 14'd0;
reg     [31:0]      head_payload;

reg     [13:0]      len_packet      = 14'd0;
wire    [31:0]      head_packet;
wire    [63:0]      fso_packet;

wire    wr_en;
wire    rd_en;

reg     [63:0]      serdes_in;
wire    [31:0]      serdes_out;

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
        begin
            temp    <= 256'b0;
            head_payload    <= 32'b0;
        end
    else
        begin
            temp    <= {temp[223:0], data_in};
            head_payload    <= {8'hab, seq_payload, len_payload};
        end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        mac_header      <= 112'b0;
    else if (count == 3)
        mac_header      <= temp[127:16];
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        mac_out     <= 8'b0;
    else if (count > 3 && count < 18)
        mac_out     <= mac_header[111 - (count - 4) * 8 -: 8];
    else
        mac_out     <= 8'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        len_payload     <= 14'd0;
    else if (count == 4)
        len_payload     <= temp[29:16];
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        len_packet      <= 14'd0;
    else if (count == 5)
        len_packet      <= len_payload;
    else if (len_packet > 0 && count > 5)
        len_packet      <= len_packet - 14'd4;
    else
        len_packet      <= 14'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        serdes_in   <= 64'b0;
    else if (count == 6)
        serdes_in   <= {32'b0, head_payload};
    else if (count > 6)
        serdes_in   <= fso_packet;
    else
        serdes_in   <= 64'b0;
end

assign  header_dv       = (count > 4 && count < 19);
assign  header          = mac_out;

assign  head_packet     = {16'hcdef, 2'b0, len_packet};
assign  fso_packet      = {head_packet, temp[143:112]};

assign  wr_en           = (count > 6 && count < thres);
assign  rd_en           = (count > 8);

assign  payload_dv      = (state == ACTIVE && count > 10);
assign  payload         = (payload_dv) ? serdes_out : 32'b0;

serdes_framer serdes_inst (
    .srst           (1'b0)
    ,.clk           (clk)
    ,.wr_en         (wr_en)
    ,.din           (serdes_in)
    ,.rd_en         (rd_en)
    ,.dout          (serdes_out)
);







endmodule











