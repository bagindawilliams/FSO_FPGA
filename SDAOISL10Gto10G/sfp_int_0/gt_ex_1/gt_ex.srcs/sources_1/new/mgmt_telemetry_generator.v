`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL Management (MGMT) Telemetry Payload Generator (Capsule).
               Packs 229 bits of PNT/Ranging telemetry per SDA Table 2-14 
               into the first 8 words (32 Bytes) LSB-first, pads the 
               remaining 469 words (1876 Bytes) with zeros (total 1908B), 
               appends 4-Byte CRC-32 (1912B), and buffers inside fifo_mgmt.

Revision History:
  - Rev 1.0 (Initial) : Table 2-14 229-bit PNT/Ranging MGMT payload generator.
  - Rev 2.4 (2026-10-29 13:07 KST) : [Deep Audit Section 7 Fix - Atomic Telemetry Snapshot]
    Preserved 100% of original ports, LSB-first bit mapping, and FIFO/CRC architecture.
    Added a 256-bit atomic snapshot register ('telemetry_snapshot_reg') that latches all 
    Table 2-14 timestamp and ranging fields at the start of frame assembly (S_WAIT_TRIG),
    preventing live timestamp updates from tearing across Words 0..7 during serialization.
===========================================================================
*/

module mgmt_telemetry_generator (
    input  wire        clk,
    input  wire        rst_n,

    // 1Hz Trigger & PNT/Ranging Telemetry Inputs (SDA OISL Table 2-14)
    input  wire        mgmt_trigger_1hz,
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,

    // AXI-Stream Output to fso_payload_mux.v (1912 Bytes)
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    localparam MAX_WORDS = 9'd477; // 477 words * 4 bytes = 1908 Bytes

    // Assemble 229-bit Table 2-14 structure LSB-first, padded to 256 bits (8 x 32-bit words)
    wire [255:0] telemetry_bit_vector = {
        27'd0,              // Bits 229..255 : Zero Padding to 32-Byte boundary
        ts_valid,           // Bit  228      : Timestamp & Range Valid Flag (1 bit)
        range_ts_picosec,   // Bits 188..227 : Range Timestamp Picoseconds (40 bits)
        range_ts_sec,       // Bits 156..187 : Range Timestamp Seconds (32 bits)
        range_meters,       // Bits 92..155  : Range in Meters IEEE-754 Float64 (64 bits)
        tx_phy_ts_picosec,  // Bits 52..91   : TX PHY Timestamp Picoseconds (40 bits)
        tx_phy_ts_sec,      // Bits 46..51   : TX PHY Timestamp Seconds (6 bits)
        rx_phy_ts_picosec,  // Bits 6..45    : RX PHY Timestamp Picoseconds (40 bits)
        rx_phy_ts_sec       // Bits 0..5     : RX PHY Timestamp Seconds (6 bits)
    };

    // [Rev 2.4] Atomic per-frame snapshot register
    reg [255:0] telemetry_snapshot_reg;

    localparam S_WAIT_TRIG = 1'b0,
               S_STREAM    = 1'b1;

    reg        state, next_state;
    reg [8:0]  word_cnt;

    reg  [31:0] mgmt_raw_tdata;
    reg         mgmt_raw_tvalid;
    reg         mgmt_raw_tlast;
    wire        crc_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state                  <= S_WAIT_TRIG;
            word_cnt               <= 9'd0;
            telemetry_snapshot_reg <= 256'd0;
        end else begin
            state <= next_state;
            if (state == S_WAIT_TRIG) begin
                word_cnt <= 9'd0;
                if (mgmt_trigger_1hz) begin
                    // Latch atomic snapshot of all 229 Table 2-14 bits at trigger instant
                    telemetry_snapshot_reg <= telemetry_bit_vector;
                end
            end else if (state == S_STREAM && mgmt_raw_tvalid && crc_tready) begin
                word_cnt <= word_cnt + 9'd1;
            end
        end
    end

    always @(*) begin
        next_state      = state;
        mgmt_raw_tvalid = 1'b0;
        mgmt_raw_tlast  = 1'b0;
        mgmt_raw_tdata  = 32'd0;

        case (state)
            S_WAIT_TRIG: begin
                if (mgmt_trigger_1hz && crc_tready) next_state = S_STREAM;
            end
            S_STREAM: begin
                mgmt_raw_tvalid = 1'b1;
                if (word_cnt < 9'd8)
                    mgmt_raw_tdata = telemetry_snapshot_reg[(word_cnt * 32) +: 32];
                else
                    mgmt_raw_tdata = 32'd0;

                if (word_cnt == (MAX_WORDS - 1)) begin
                    mgmt_raw_tlast = 1'b1;
                    if (crc_tready) next_state = S_WAIT_TRIG;
                end
            end
        endcase
    end

    // FSO CRC-32 Engine (1908B -> 1912B)
    wire [31:0] crc_tdata;
    wire        crc_tvalid;
    wire        crc_tlast;
    wire        fifo_tready;

    fso_crc_32 u_fso_crc_32_mgmt (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (mgmt_raw_tdata),
        .s_axis_tvalid   (mgmt_raw_tvalid),
        .s_axis_tlast    (mgmt_raw_tlast),
        .s_axis_tready   (crc_tready),
        .m_axis_tdata    (crc_tdata),
        .m_axis_tvalid   (crc_tvalid),
        .m_axis_tlast    (crc_tlast),
        .m_axis_tready   (fifo_tready)
    );

    // FIFO MGMT Buffer (Ready for MUX Path 10)
    fso_axis_fifo #(.FIFO_DEPTH(1024), .ADDR_WIDTH(10)) fifo_mgmt (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (fifo_tready),
        .m_axis_tdata    (m_axis_tdata),
        .m_axis_tvalid   (m_axis_tvalid),
        .m_axis_tlast    (m_axis_tlast),
        .m_axis_tready   (m_axis_tready)
    );

endmodule