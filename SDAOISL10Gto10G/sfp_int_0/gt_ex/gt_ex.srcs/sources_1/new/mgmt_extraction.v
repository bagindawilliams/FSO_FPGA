`timescale 1ns / 100ps
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
                    // Unpack the 256-bit PNT & Ranging vector on the 8th word
                    mgmt_rx_phy_ts_sec      <= w_buf[0][31:26];
                    mgmt_rx_phy_ts_picosec <= {w_buf[0][25:0], w_buf[1][31:18]};
                    mgmt_tx_phy_ts_sec      <= w_buf[1][17:12];
                    mgmt_tx_phy_ts_picosec <= {w_buf[1][11:0], w_buf[2][31:4]};
                    mgmt_range_meters       <= {w_buf[2][3:0],  w_buf[3], w_buf[4][31:4]};
                    mgmt_range_ts_sec       <= {w_buf[4][3:0],  w_buf[5][31:4]};
                    mgmt_range_ts_picosec   <= {w_buf[5][3:0],  w_buf[6], w_buf[7][31:28]};
                    mgmt_ts_valid           <= s_axis_mgmt_tdata[27];
                    mgmt_telemetry_valid    <= 1'b1;
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