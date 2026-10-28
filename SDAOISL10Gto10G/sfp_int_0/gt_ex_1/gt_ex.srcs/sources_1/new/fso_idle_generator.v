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

Revision History:
  - Rev 1.0 (Initial) : 477-word (1908-Byte) IDLE payload generator with TXFN + 1 seed.
  - Rev 2.0 (2026-10-27 04:09 KST) : [ETRI Audit Item 5 - SDA OISL Page 31, Sec. 2.6.3.5.1.2]
    Retained the (TXFN + 1) seed initialization and replaced the 32-bit CRC LFSR
    (0x04C11DB7) with the exact same 25-bit PRBS generator polynomial (1 + D^3 + D^25)
    used by the frame scrambler (scrambler.v Rev 2.00), unrolled 32 bits per cycle.
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
    //    [Rev 2.0 - 2026-10-27 04:09 KST] Uses 25-bit Frame Scrambler PRBS
    //    seeded with (TXFN + 1) per SDA OISL Section 2.6.3.5.1.2 (Page 31).
    // =======================================================
    localparam S_IDLE = 1'b0, S_GENERATE = 1'b1;
    reg state;
    reg [15:0] word_cnt;
    
    reg  [24:0] lfsr_reg;
    wire [24:0] seed_txfn_plus_1 = ({9'd0, txfn_in} + 25'd1);

    // 32-bit unrolled step of the 25-bit Frame Scrambler PRBS (1 + D^3 + D^25)
    function [56:0] step_prbs25_32(input [24:0] q_in);
        reg [24:0] sr;
        reg [31:0] w_out;
        reg        fb;
        integer    k;
        begin
            sr = (q_in == 25'd0) ? 25'h0000007 : q_in;
            for (k = 0; k < 32; k = k + 1) begin
                w_out[31 - k] = sr[0];
                fb            = sr[0] ^ sr[3];
                sr            = {fb, sr[24:1]};
            end
            step_prbs25_32 = {sr, w_out};
        end
    endfunction

    wire [56:0] prbs_init_step = step_prbs25_32(seed_txfn_plus_1);
    wire [24:0] lfsr_init_next = prbs_init_step[56:32];
    wire [31:0] prbs_init_word = prbs_init_step[31:0];

    wire [56:0] prbs_cont_step = step_prbs25_32(lfsr_reg);
    wire [24:0] lfsr_next      = prbs_cont_step[56:32];
    wire [31:0] prbs_cont_word = prbs_cont_step[31:0];

    reg  [31:0] raw_tdata;
    reg         raw_tvalid;
    reg         raw_tlast;
    wire        raw_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= S_IDLE;
            word_cnt   <= 16'd0;
            lfsr_reg   <= 25'h0000001;
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
                        // SDA OISL Std: Seed 25-bit Scrambler PRBS with TXFN + 1
                        lfsr_reg   <= lfsr_init_next; 
                        raw_tdata  <= prbs_init_word;
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
                            raw_tdata <= prbs_cont_word;
                            lfsr_reg  <= lfsr_next;
                            
                        end else if (word_cnt == MAX_WORDS - 1) begin
                            // ZERO-FRAME GAP
                            // Without returning to S_IDLE
                            raw_tlast <= 1'b0;
                            word_cnt  <= 16'd0;
                            
                            // Inject new (TXFN+1) seeded 25-bit PRBS word
                            raw_tdata <= prbs_init_word;
                            lfsr_reg  <= lfsr_init_next;
                            
                        end else begin
                            // Normal 25-bit PRBS continuation
                            raw_tlast <= 1'b0;
                            word_cnt  <= word_cnt + 1'b1;
                            raw_tdata <= prbs_cont_word;
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