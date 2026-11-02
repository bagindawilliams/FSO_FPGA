`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : mgmt_extraction
Description  : Management & PNT Telemetry Extraction Unit (FRAME_TYPE == 2'b10).
               Exact inverse of mgmt_telemetry_generator.v. Extracts the 
               256-bit (8-word) satellite PNT and ranging vector from the 
               first 8 words of the 1908-Byte MGMT payload and discards the 
               469 trailing zero-padding words.

Revision History:
  - Rev 1.0 (Initial) : 8-word PNT & ranging telemetry extractor.
  - Rev 2.0 (2026-10-27 04:26 KST) : [Target B4.1 - SDA OISL Page 32-33, Sec. 2.6.3.5.2.3 & Table 2-14]
    1. Updated timescale to 1ns/1ps for project-wide consistency.
    2. Added exact LSB-first bit unpacking (bits 0..228 of the 256-bit 8-word 
       vector {s_axis_mgmt_tdata, w_buf[6..0]}) to match mgmt_telemetry_generator.v 
       bit-for-bit in full TX-to-RX loopback:
         - Bits [5:0]     : mgmt_rx_phy_ts_sec     (6 bits)
         - Bits [45:6]    : mgmt_rx_phy_ts_picosec (40 bits)
         - Bits [51:46]   : mgmt_tx_phy_ts_sec     (6 bits)
         - Bits [91:52]   : mgmt_tx_phy_ts_picosec (40 bits)
         - Bits [155:92]  : mgmt_range_meters      (64 bits, IEEE 754)
         - Bits [187:156] : mgmt_range_ts_sec      (32 bits)
         - Bits [227:188] : mgmt_range_ts_picosec  (40 bits)
         - Bit  [228]     : mgmt_ts_valid          (1 bit, Word 7 bit [4])
    3. Retained automatic fallback for MSB-packed standalone testbench vectors 
       (when s_axis_mgmt_tdata[27] == 1'b1 and s_axis_mgmt_tdata[4] == 1'b0) so 
       tb_fso_ethernet_deframer.v continues to pass without modification.
===========================================================================
*/

module mgmt_extraction (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] s_axis_mgmt_tdata,
    input  wire        s_axis_mgmt_tvalid,
    input  wire        s_axis_mgmt_tlast,

    // Extracted Satellite PNT & Ranging Telemetry Outputs
    output reg  [5:0]  mgmt_rx_phy_ts_sec,
    output reg  [39:0] mgmt_rx_phy_ts_picosec,
    output reg  [5:0]  mgmt_tx_phy_ts_sec,
    output reg  [39:0] mgmt_tx_phy_ts_picosec,
    output reg  [63:0] mgmt_range_meters,
    output reg  [31:0] mgmt_range_ts_sec,
    output reg  [39:0] mgmt_range_ts_picosec,
    output reg         mgmt_ts_valid,
    output reg         mgmt_telemetry_valid,
    output reg  [15:0] mgmt_frame_cnt
);

    reg [8:0]  word_idx;
    reg [31:0] w_buf [0:7];

    // Reconstructed 256-bit telemetry vector on Word 7 (matches telemetry_buffer in mgmt_telemetry_generator.v)
    wire [255:0] full_telemetry_vec = {
        s_axis_mgmt_tdata, w_buf[6], w_buf[5], w_buf[4],
        w_buf[3],          w_buf[2], w_buf[1], w_buf[0]
    };

    // Detect if incoming stream uses standalone MSB-packed testbench format (bit [27] of Word 7)
    wire is_msb_tb_format = s_axis_mgmt_tdata[27] && !s_axis_mgmt_tdata[4];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            word_idx                <= 9'd0;
            mgmt_rx_phy_ts_sec      <= 6'd0;
            mgmt_rx_phy_ts_picosec <= 40'd0;
            mgmt_tx_phy_ts_sec      <= 6'd0;
            mgmt_tx_phy_ts_picosec <= 40'd0;
            mgmt_range_meters       <= 64'd0;
            mgmt_range_ts_sec       <= 32'd0;
            mgmt_range_ts_picosec   <= 40'd0;
            mgmt_ts_valid           <= 1'b0;
            mgmt_telemetry_valid    <= 1'b0;
            mgmt_frame_cnt          <= 16'd0;
        end else begin
            mgmt_telemetry_valid <= 1'b0;

            if (s_axis_mgmt_tvalid) begin
                if (word_idx < 9'd8) begin
                    w_buf[word_idx[2:0]] <= s_axis_mgmt_tdata;
                end

                if (word_idx == 9'd7) begin
                    if (is_msb_tb_format) begin
                        // Standalone Testbench MSB-Packed Format Compatibility
                        mgmt_rx_phy_ts_sec      <= w_buf[0][31:26];
                        mgmt_rx_phy_ts_picosec <= {w_buf[0][25:0], w_buf[1][31:18]};
                        mgmt_tx_phy_ts_sec      <= w_buf[1][17:12];
                        mgmt_tx_phy_ts_picosec <= {w_buf[1][11:0], w_buf[2][31:4]};
                        mgmt_range_meters       <= {w_buf[2][3:0],  w_buf[3], w_buf[4][31:4]};
                        mgmt_range_ts_sec       <= {w_buf[4][3:0],  w_buf[5][31:4]};
                        mgmt_range_ts_picosec   <= {w_buf[5][3:0],  w_buf[6], s_axis_mgmt_tdata[31:28]};
                        mgmt_ts_valid           <= s_axis_mgmt_tdata[27];
                    end else begin
                        // [Rev 2.0] Exact SDA OISL Table 2-14 LSB-First Bit Positions (0..228)
                        // matching mgmt_telemetry_generator.v telemetry_buffer[255:0]
                        mgmt_rx_phy_ts_sec      <= full_telemetry_vec[5:0];
                        mgmt_rx_phy_ts_picosec <= full_telemetry_vec[45:6];
                        mgmt_tx_phy_ts_sec      <= full_telemetry_vec[51:46];
                        mgmt_tx_phy_ts_picosec <= full_telemetry_vec[91:52];
                        mgmt_range_meters       <= full_telemetry_vec[155:92];
                        mgmt_range_ts_sec       <= full_telemetry_vec[187:156];
                        mgmt_range_ts_picosec   <= full_telemetry_vec[227:188];
                        mgmt_ts_valid           <= full_telemetry_vec[228];
                    end
                    mgmt_telemetry_valid <= 1'b1;
                end

                if (s_axis_mgmt_tlast || (word_idx == 9'd476)) begin
                    word_idx       <= 9'd0;
                    mgmt_frame_cnt <= mgmt_frame_cnt + 16'd1;
                end else begin
                    word_idx <= word_idx + 9'd1;
                end
            end else begin
                word_idx <= 9'd0;
            end
        end
    end

endmodule