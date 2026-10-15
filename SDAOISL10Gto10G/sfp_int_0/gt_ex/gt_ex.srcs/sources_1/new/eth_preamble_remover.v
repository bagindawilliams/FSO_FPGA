`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Ethernet Preamble & SFD Stripper.
               Accurately drops the first 8 bytes (2 clock cycles at 32-bit).
===========================================================================
*/

module eth_preamble_remover(
    input  wire        clk,
    input  wire        rst_n,

    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready, 

    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    reg [1:0] skip_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            skip_cnt <= 2'd0;
        end else begin
            if (s_axis_tvalid && s_axis_tready) begin
                if (s_axis_tlast) begin
                    skip_cnt <= 2'd0; 
                end else if (skip_cnt < 2'd2) begin
                    skip_cnt <= skip_cnt + 1'b1; 
                end
            end
        end
    end

    assign m_axis_tvalid = s_axis_tvalid & (skip_cnt == 2'd2);
    assign m_axis_tdata  = m_axis_tvalid ? s_axis_tdata : 32'd0;
    assign m_axis_tlast  = s_axis_tlast;
    assign s_axis_tready = m_axis_tready;

endmodule