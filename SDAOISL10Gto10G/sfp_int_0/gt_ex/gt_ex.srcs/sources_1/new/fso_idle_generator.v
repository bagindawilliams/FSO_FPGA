`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL IDLE Frame Generator.
               Generates 1908 Bytes (475 words) of PRBS data payload.
               As per SDA OISL Standard, the PRBS is seeded dynamically
               using (TXFN + 1). Outputs AXI4-Stream directly to fso_crc_32.
               
               Self-contained capsule that integrates:
               1. PRBS Generation Logic (1908 Bytes) seeded with TXFN + 1.
               2. fso_crc_32.v Engine (Appends 4B CRC -> 1912 Bytes).
               3. fso_axis_fifo.v (Buffers the fully assembled frame).
               Provides a clean, ready-to-mux AXI4-Stream output.
===========================================================================
*/

module fso_idle_generator (
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Input from ARQ TX Controller
    // -------------------------------------------------------
    input  wire [15:0] txfn_in,

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
    // 1. CORE LOGIC: PRBS IDLE GENERATOR (1908 Bytes)
    // =======================================================
    localparam S_IDLE = 1'b0, S_GENERATE = 1'b1;
    reg state;
    reg [15:0] word_cnt;
    
    reg  [31:0] lfsr_reg;
    wire [31:0] lfsr_next = {lfsr_reg[30:0], 1'b0} ^ (lfsr_reg[31] ? 32'h4C11DB7 : 32'h0);

    reg  [31:0] raw_tdata;
    reg         raw_tvalid;
    reg         raw_tlast;
    wire        raw_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= S_IDLE;
            word_cnt   <= 16'd0;
            lfsr_reg   <= 32'd1;
            raw_tvalid <= 1'b0;
            raw_tlast  <= 1'b0;
            raw_tdata  <= 32'd0;
        end else begin
            case (state)
                S_IDLE: begin
                    // Wait until the internal CRC engine is ready to accept data
                    if (raw_tready) begin
                        state      <= S_GENERATE;
                        word_cnt   <= 16'd0;
                        raw_tvalid <= 1'b1;
                        // SDA OISL Std: Seed PRBS with TXFN + 1
                        lfsr_reg   <= {16'd0, txfn_in} + 32'd1; 
                        raw_tdata  <= {16'd0, txfn_in} + 32'd1;
                        raw_tlast  <= 1'b0;
                    end else begin
                        raw_tvalid <= 1'b0;
                        raw_tlast  <= 1'b0;
                    end
                end

                S_GENERATE: begin
                    if (raw_tready) begin
                        raw_tvalid <= 1'b1;
                        
                        if (word_cnt == MAX_WORDS - 2) begin
                            // End of frame marker before CRC (Index 475)
                            raw_tlast <= 1'b1;
                            word_cnt  <= word_cnt + 1'b1;
                            raw_tdata <= lfsr_next;
                            lfsr_reg  <= lfsr_next;
                            
                        end else if (word_cnt == MAX_WORDS - 1) begin
                            // ZERO-FRAME GAP
                            // Without returning to S_IDLE
                            raw_tlast <= 1'b0;
                            word_cnt  <= 16'd0;
                            
                            // Inject new (TXFN+1)
                            raw_tdata <= {16'd0, txfn_in} + 32'd1;
                            lfsr_reg  <= {16'd0, txfn_in} + 32'd1;
                            
                        end else begin
                            //  Normal PRBS
                            raw_tlast <= 1'b0;
                            word_cnt  <= word_cnt + 1'b1;
                            raw_tdata <= lfsr_next;
                            lfsr_reg  <= lfsr_next;
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

    fso_crc_32 u_fso_crc_32_idle (
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
    fso_axis_fifo #(.FIFO_DEPTH(512), .ADDR_WIDTH(9)) u_fifo_idle (
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