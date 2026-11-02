`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : idle_discard
Description  : IDLE Frame Termination Unit (FRAME_TYPE == 2'b00).
               Consumes and discards the 477-word (1908-Byte) PRBS IDLE 
               payload while maintaining diagnostic frame and byte counters.
===========================================================================
*/

module idle_discard (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] s_axis_idle_tdata,
    input  wire        s_axis_idle_tvalid,
    input  wire        s_axis_idle_tlast,
    output reg  [15:0] idle_frame_cnt,
    output reg  [31:0] idle_byte_cnt
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            idle_frame_cnt <= 16'd0;
            idle_byte_cnt  <= 32'd0;
        end else if (s_axis_idle_tvalid) begin
            idle_byte_cnt <= idle_byte_cnt + 32'd4;
            if (s_axis_idle_tlast) begin
                idle_frame_cnt <= idle_frame_cnt + 16'd1;
            end
        end
    end

endmodule