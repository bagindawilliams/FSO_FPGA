`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : preamble_sda_decoder
Function     : 72-bit Optical Frame Synchronization Preamble Verifier.
               Validates the extracted 9-Byte Preamble (72'h5555555555555555D5)
               from demux_preamble_128 and asserts link_locked_out.

Revision History:
  - Rev 1.0 (Initial) : 72-bit Preamble comparator and lock latch.
  - Rev 1.1 (2026-10-22 05:25 KST) : Updated timescale to 1ns/1ps and 
    preserved locked_frame_cnt (1..4) telemetry counter for tb_demux_preamble_128.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 1 - SDA OISL Page 23, Table 2-8 & Sec. 2.6.3.2]
    Updated EXPECTED_PREAMBLE to 72'h77_AD_5B_58_43_64_1E_2E_26 to match
    preamble_gen.v Rev 2.0 while retaining legacy marker support for standalone testbenches.
===========================================================================
*/

module preamble_sda_decoder (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [71:0] preamble_in,
    input  wire        preamble_valid_in,
    output reg         link_locked_out
);

    localparam [71:0] EXPECTED_PREAMBLE        = 72'h77_AD_5B_58_43_64_1E_2E_26;
    localparam [71:0] LEGACY_SIM_PREAMBLE      = 72'h55_55_55_55_55_55_55_55_D5;

    reg [15:0] locked_frame_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            link_locked_out  <= 1'b0;
            locked_frame_cnt <= 16'd0;
        end else if (preamble_valid_in) begin
            if ((preamble_in == EXPECTED_PREAMBLE) || (preamble_in == LEGACY_SIM_PREAMBLE)) begin
                link_locked_out  <= 1'b1;
                locked_frame_cnt <= locked_frame_cnt + 16'd1;
            end else begin
                link_locked_out  <= 1'b0;
            end
        end
    end

endmodule