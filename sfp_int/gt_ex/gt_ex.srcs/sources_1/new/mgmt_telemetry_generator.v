`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL MGMT / Telemetry Frame Generator.
               Maps Timing & Ranging data into the first few words of the 
               payload as per SDA OISL Table 2-14.
               Pads the remaining space with zeroes to exactly 1908 Bytes.
               Outputs AXI4-Stream directly to fso_crc_32.
               
               Revision Note:
               - De-asserted 'raw_tvalid <= 1'b0' when (word_cnt == MAX_WORDS - 1)
                 upon returning to S_IDLE so that exactly 477 words (1908 Bytes) 
                 are emitted per trigger without a trailing 478th ghost word.
===========================================================================
*/

module mgmt_telemetry_generator (
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Input Trigger from System Timer
    // -------------------------------------------------------
    input  wire        mgmt_trigger_1hz,

    // -------------------------------------------------------
    // Telemetry Data from Satellite CPU / PNT Module
    // -------------------------------------------------------
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,

    // -------------------------------------------------------
    // AXI-Stream Output (To fso_payload_mux.v)
    // -------------------------------------------------------
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    localparam MAX_WORDS = 16'd477; // 1908 Bytes = 477 Words (32-bit)
    
    // =======================================================
    // 1. CORE LOGIC: TELEMETRY MAPPING & ZERO PADDING
    // =======================================================
    localparam S_IDLE = 1'b0, S_STREAM = 1'b1;
    reg state;
    reg [15:0] word_cnt;

    // Flatten Telemetry into a 256-bit (8 words) shift register 
    wire [255:0] telemetry_buffer = {
        27'd0, ts_valid, range_ts_picosec, range_ts_sec, 
        range_meters, tx_phy_ts_picosec, tx_phy_ts_sec, 
        rx_phy_ts_picosec, rx_phy_ts_sec
    };

    reg  [31:0] raw_tdata;
    reg         raw_tvalid;
    reg         raw_tlast;
    wire        raw_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= S_IDLE;
            word_cnt   <= 16'd0;
            raw_tdata  <= 32'd0;
            raw_tvalid <= 1'b0;
            raw_tlast  <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    if (mgmt_trigger_1hz && raw_tready) begin
                        state      <= S_STREAM;
                        word_cnt   <= 16'd0;
                        raw_tvalid <= 1'b1;
                        raw_tlast  <= 1'b0;
                        raw_tdata  <= telemetry_buffer[31:0]; // Emit Word 0
                    end else begin
                        raw_tvalid <= 1'b0;
                        raw_tlast  <= 1'b0;
                    end
                end

                S_STREAM: begin
                    if (raw_tready) begin
                        raw_tvalid <= 1'b1;
                        
                        // Map telemetry data to the first 8 words
                        // Pad the remaining 469 words with ZERO
                        if (word_cnt < 16'd7) begin
                            raw_tdata <= telemetry_buffer[((word_cnt + 2) * 32) - 1 -: 32];
                        end else begin
                            raw_tdata <= 32'd0; // SDA OISL ZERO PADDING
                        end

                        if (word_cnt == MAX_WORDS - 2) begin
                            raw_tlast <= 1'b1;
                            word_cnt  <= word_cnt + 1'b1;
                        end else if (word_cnt == MAX_WORDS - 1) begin
                            // REVISION: De-assert raw_tvalid cleanly after 477th word
                            raw_tvalid <= 1'b0;
                            raw_tlast  <= 1'b0;
                            word_cnt   <= 16'd0;
                            state      <= S_IDLE; // End of MGMT Frame
                        end else begin
                            raw_tlast <= 1'b0;
                            word_cnt  <= word_cnt + 1'b1;
                        end
                    end
                end
            endcase
        end
    end

    // =======================================================
    // 2. FSO CRC-32 ENGINE (1908B -> 1912B)
    // =======================================================
    wire [31:0] crc_tdata;
    wire        crc_tvalid;
    wire        crc_tlast;
    wire        crc_tready;

    fso_crc_32 u_fso_crc_32_mgmt (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (raw_tdata),
        .s_axis_tvalid   (raw_tvalid),
        .s_axis_tlast    (raw_tlast),
        .s_axis_tready   (raw_tready),
        .m_axis_tdata    (crc_tdata),
        .m_axis_tvalid   (crc_tvalid),
        .m_axis_tlast    (crc_tlast),
        .m_axis_tready   (crc_tready)
    );

    // =======================================================
    // 3. FIFO BUFFER (Output Queue)
    // =======================================================
    fso_axis_fifo #(.FIFO_DEPTH(512), .ADDR_WIDTH(9)) u_fifo_mgmt (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (crc_tready),
        .m_axis_tdata    (m_axis_tdata),
        .m_axis_tvalid   (m_axis_tvalid),
        .m_axis_tlast    (m_axis_tlast),
        .m_axis_tready   (m_axis_tready)
    );

endmodule