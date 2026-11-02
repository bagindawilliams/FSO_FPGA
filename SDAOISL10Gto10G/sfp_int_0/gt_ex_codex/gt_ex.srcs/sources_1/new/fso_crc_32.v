`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj, Irzal Zaini, & Giovanni Dwi
Description  : SDA OISL FSO CRC-32 Generator (AXI4-Stream Compliant).
               Utilizes parallel 32-bit XOR tree for zero-latency computation.
               Dynamic FSM intercepts the `tlast` signal from the 1908-Byte 
               payload, suppresses it, appends the 4-Byte calculated CRC, 
               and re-asserts the true `tlast` at the 1912th Byte.
===========================================================================
*/

module fso_crc_32 (
    input  wire        clk,
    input  wire        rst_n,

    // Input from fso_payload.v (1908 Bytes / 477 Words)
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,

    // Output to fifo_data (1912 Bytes / 478 Words)
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready
);

    localparam S_DATA = 1'b0, S_CRC = 1'b1;
    reg state;

    reg  [31:0] crc_reg;
    wire [31:0] next_crc;

    // =======================================================
    // AXI4-Stream Handshake Logic
    // =======================================================
    // We can accept new data if we are in S_DATA and the output 
    // register is either empty (!m_axis_tvalid) or being read this cycle.
    assign s_axis_tready = (state == S_DATA) && (!m_axis_tvalid || m_axis_tready);
    
    wire fire_in  = s_axis_tvalid && s_axis_tready;
    wire fire_out = m_axis_tvalid && m_axis_tready;

    // =======================================================
    // Dynamic FSM & Data Pipeline
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state         <= S_DATA;
            crc_reg       <= 32'd0;
            m_axis_tdata  <= 32'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
        end else begin
            // Clear valid flag if downstream accepted the data
            if (fire_out) begin
                m_axis_tvalid <= 1'b0;
            end

            case (state)
                S_DATA: begin
                    if (fire_in) begin
                        m_axis_tvalid <= 1'b1;
                        m_axis_tdata  <= s_axis_tdata; // Passthrough payload
                        m_axis_tlast  <= 1'b0;         // Suppress incoming tlast
                        crc_reg       <= next_crc;     // Update running CRC

                        // Intercept the end of the payload
                        if (s_axis_tlast) begin
                            state <= S_CRC;
                        end
                    end
                end

                S_CRC: begin
                    // Wait until output is free to append the CRC
                    if (!m_axis_tvalid || fire_out) begin
                        m_axis_tvalid <= 1'b1;
                        m_axis_tdata  <= crc_reg;      // Inject 4-Byte CRC
                        m_axis_tlast  <= 1'b1;         // Assert true end of frame
                        crc_reg       <= 32'd0;        // Reset CRC for next frame
                        state         <= S_DATA;       // Loop back
                    end
                end
            endcase
        end
    end

    // =======================================================
    // Combinational Parallel 32-bit CRC XOR Tree
    // Adapted from Irzal Zaini's original architecture
    // =======================================================
    assign next_crc[0] = crc_reg[0] ^ crc_reg[6] ^ crc_reg[9] ^ crc_reg[10] ^ crc_reg[12] ^ crc_reg[16] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[6] ^ s_axis_tdata[9] ^ s_axis_tdata[10] ^ s_axis_tdata[12] ^ s_axis_tdata[16] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[30] ^ s_axis_tdata[31];
    assign next_crc[1] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[9] ^ crc_reg[11] ^ crc_reg[12] ^ crc_reg[13] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[24] ^ crc_reg[27] ^ crc_reg[28] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[9] ^ s_axis_tdata[11] ^ s_axis_tdata[12] ^ s_axis_tdata[13] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[24] ^ s_axis_tdata[27] ^ s_axis_tdata[28];
    assign next_crc[2] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[2] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[9] ^ crc_reg[13] ^ crc_reg[14] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[9] ^ s_axis_tdata[13] ^ s_axis_tdata[14] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[30] ^ s_axis_tdata[31];
    assign next_crc[3] = crc_reg[1] ^ crc_reg[2] ^ crc_reg[3] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[9] ^ crc_reg[10] ^ crc_reg[14] ^ crc_reg[15] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[25] ^ crc_reg[27] ^ crc_reg[31] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[9] ^ s_axis_tdata[10] ^ s_axis_tdata[14] ^ s_axis_tdata[15] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[25] ^ s_axis_tdata[27] ^ s_axis_tdata[31];
    assign next_crc[4] = crc_reg[0] ^ crc_reg[2] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[6] ^ crc_reg[8] ^ crc_reg[11] ^ crc_reg[12] ^ crc_reg[15] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[6] ^ s_axis_tdata[8] ^ s_axis_tdata[11] ^ s_axis_tdata[12] ^ s_axis_tdata[15] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[29] ^ s_axis_tdata[30] ^ s_axis_tdata[31];
    assign next_crc[5] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[10] ^ crc_reg[13] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[24] ^ crc_reg[28] ^ crc_reg[29] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[10] ^ s_axis_tdata[13] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[24] ^ s_axis_tdata[28] ^ s_axis_tdata[29];
    assign next_crc[6] = crc_reg[1] ^ crc_reg[2] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[11] ^ crc_reg[14] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[25] ^ crc_reg[29] ^ crc_reg[30] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[11] ^ s_axis_tdata[14] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[25] ^ s_axis_tdata[29] ^ s_axis_tdata[30];
    assign next_crc[7] = crc_reg[0] ^ crc_reg[2] ^ crc_reg[3] ^ crc_reg[5] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[10] ^ crc_reg[15] ^ crc_reg[16] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[28] ^ crc_reg[29] ^ s_axis_tdata[0] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[5] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[10] ^ s_axis_tdata[15] ^ s_axis_tdata[16] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[28] ^ s_axis_tdata[29];
    assign next_crc[8] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[8] ^ crc_reg[10] ^ crc_reg[11] ^ crc_reg[12] ^ crc_reg[17] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[28] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[8] ^ s_axis_tdata[10] ^ s_axis_tdata[11] ^ s_axis_tdata[12] ^ s_axis_tdata[17] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[28] ^ s_axis_tdata[31];
    assign next_crc[9] = crc_reg[1] ^ crc_reg[2] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[9] ^ crc_reg[11] ^ crc_reg[12] ^ crc_reg[13] ^ crc_reg[18] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[29] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[9] ^ s_axis_tdata[11] ^ s_axis_tdata[12] ^ s_axis_tdata[13] ^ s_axis_tdata[18] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[29];
    assign next_crc[10] = crc_reg[0] ^ crc_reg[2] ^ crc_reg[3] ^ crc_reg[5] ^ crc_reg[9] ^ crc_reg[13] ^ crc_reg[14] ^ crc_reg[16] ^ crc_reg[19] ^ crc_reg[26] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[5] ^ s_axis_tdata[9] ^ s_axis_tdata[13] ^ s_axis_tdata[14] ^ s_axis_tdata[16] ^ s_axis_tdata[19] ^ s_axis_tdata[26] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[11] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[9] ^ crc_reg[12] ^ crc_reg[14] ^ crc_reg[15] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[20] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[9] ^ s_axis_tdata[12] ^ s_axis_tdata[14] ^ s_axis_tdata[15] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[20] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[31];
    assign next_crc[12] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[2] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[9] ^ crc_reg[12] ^ crc_reg[13] ^ crc_reg[15] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[21] ^ crc_reg[24] ^ crc_reg[27] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[9] ^ s_axis_tdata[12] ^ s_axis_tdata[13] ^ s_axis_tdata[15] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[21] ^ s_axis_tdata[24] ^ s_axis_tdata[27] ^ s_axis_tdata[30] ^ s_axis_tdata[31];
    assign next_crc[13] = crc_reg[1] ^ crc_reg[2] ^ crc_reg[3] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[10] ^ crc_reg[13] ^ crc_reg[14] ^ crc_reg[16] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[22] ^ crc_reg[25] ^ crc_reg[28] ^ crc_reg[31] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[10] ^ s_axis_tdata[13] ^ s_axis_tdata[14] ^ s_axis_tdata[16] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[22] ^ s_axis_tdata[25] ^ s_axis_tdata[28] ^ s_axis_tdata[31];
    assign next_crc[14] = crc_reg[2] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[11] ^ crc_reg[14] ^ crc_reg[15] ^ crc_reg[17] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[23] ^ crc_reg[26] ^ crc_reg[29] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[11] ^ s_axis_tdata[14] ^ s_axis_tdata[15] ^ s_axis_tdata[17] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[23] ^ s_axis_tdata[26] ^ s_axis_tdata[29];
    assign next_crc[15] = crc_reg[3] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[9] ^ crc_reg[12] ^ crc_reg[15] ^ crc_reg[16] ^ crc_reg[18] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[24] ^ crc_reg[27] ^ crc_reg[30] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[9] ^ s_axis_tdata[12] ^ s_axis_tdata[15] ^ s_axis_tdata[16] ^ s_axis_tdata[18] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[24] ^ s_axis_tdata[27] ^ s_axis_tdata[30];
    assign next_crc[16] = crc_reg[0] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[8] ^ crc_reg[12] ^ crc_reg[13] ^ crc_reg[17] ^ crc_reg[19] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[29] ^ crc_reg[30] ^ s_axis_tdata[0] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[8] ^ s_axis_tdata[12] ^ s_axis_tdata[13] ^ s_axis_tdata[17] ^ s_axis_tdata[19] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[29] ^ s_axis_tdata[30];
    assign next_crc[17] = crc_reg[1] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[9] ^ crc_reg[13] ^ crc_reg[14] ^ crc_reg[18] ^ crc_reg[20] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[25] ^ crc_reg[27] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[1] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[9] ^ s_axis_tdata[13] ^ s_axis_tdata[14] ^ s_axis_tdata[18] ^ s_axis_tdata[20] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[25] ^ s_axis_tdata[27] ^ s_axis_tdata[30] ^ s_axis_tdata[31];
    assign next_crc[18] = crc_reg[2] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[10] ^ crc_reg[14] ^ crc_reg[15] ^ crc_reg[19] ^ crc_reg[21] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[28] ^ crc_reg[31] ^ s_axis_tdata[2] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[10] ^ s_axis_tdata[14] ^ s_axis_tdata[15] ^ s_axis_tdata[19] ^ s_axis_tdata[21] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[28] ^ s_axis_tdata[31];
    assign next_crc[19] = crc_reg[3] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[11] ^ crc_reg[15] ^ crc_reg[16] ^ crc_reg[20] ^ crc_reg[22] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[27] ^ crc_reg[29] ^ s_axis_tdata[3] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[11] ^ s_axis_tdata[15] ^ s_axis_tdata[16] ^ s_axis_tdata[20] ^ s_axis_tdata[22] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[27] ^ s_axis_tdata[29];
    assign next_crc[20] = crc_reg[4] ^ crc_reg[8] ^ crc_reg[9] ^ crc_reg[12] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[21] ^ crc_reg[23] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[28] ^ crc_reg[30] ^ s_axis_tdata[4] ^ s_axis_tdata[8] ^ s_axis_tdata[9] ^ s_axis_tdata[12] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[21] ^ s_axis_tdata[23] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[28] ^ s_axis_tdata[30];
    assign next_crc[21] = crc_reg[5] ^ crc_reg[9] ^ crc_reg[10] ^ crc_reg[13] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[22] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[5] ^ s_axis_tdata[9] ^ s_axis_tdata[10] ^ s_axis_tdata[13] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[22] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[22] = crc_reg[0] ^ crc_reg[9] ^ crc_reg[11] ^ crc_reg[12] ^ crc_reg[14] ^ crc_reg[16] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[9] ^ s_axis_tdata[11] ^ s_axis_tdata[12] ^ s_axis_tdata[14] ^ s_axis_tdata[16] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[23] = crc_reg[0] ^ crc_reg[1] ^ crc_reg[6] ^ crc_reg[9] ^ crc_reg[13] ^ crc_reg[15] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[1] ^ s_axis_tdata[6] ^ s_axis_tdata[9] ^ s_axis_tdata[13] ^ s_axis_tdata[15] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[24] = crc_reg[1] ^ crc_reg[2] ^ crc_reg[7] ^ crc_reg[10] ^ crc_reg[14] ^ crc_reg[16] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[30] ^ s_axis_tdata[1] ^ s_axis_tdata[2] ^ s_axis_tdata[7] ^ s_axis_tdata[10] ^ s_axis_tdata[14] ^ s_axis_tdata[16] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[30];
    assign next_crc[25] = crc_reg[2] ^ crc_reg[3] ^ crc_reg[8] ^ crc_reg[11] ^ crc_reg[15] ^ crc_reg[17] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[2] ^ s_axis_tdata[3] ^ s_axis_tdata[8] ^ s_axis_tdata[11] ^ s_axis_tdata[15] ^ s_axis_tdata[17] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[26] = crc_reg[0] ^ crc_reg[3] ^ crc_reg[4] ^ crc_reg[6] ^ crc_reg[10] ^ crc_reg[18] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[28] ^ crc_reg[31] ^ s_axis_tdata[0] ^ s_axis_tdata[3] ^ s_axis_tdata[4] ^ s_axis_tdata[6] ^ s_axis_tdata[10] ^ s_axis_tdata[18] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[28] ^ s_axis_tdata[31];
    assign next_crc[27] = crc_reg[1] ^ crc_reg[4] ^ crc_reg[5] ^ crc_reg[7] ^ crc_reg[11] ^ crc_reg[19] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[29] ^ s_axis_tdata[1] ^ s_axis_tdata[4] ^ s_axis_tdata[5] ^ s_axis_tdata[7] ^ s_axis_tdata[11] ^ s_axis_tdata[19] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[29];
    assign next_crc[28] = crc_reg[2] ^ crc_reg[5] ^ crc_reg[6] ^ crc_reg[8] ^ crc_reg[12] ^ crc_reg[20] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[30] ^ s_axis_tdata[2] ^ s_axis_tdata[5] ^ s_axis_tdata[6] ^ s_axis_tdata[8] ^ s_axis_tdata[12] ^ s_axis_tdata[20] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[30];
    assign next_crc[29] = crc_reg[3] ^ crc_reg[6] ^ crc_reg[7] ^ crc_reg[9] ^ crc_reg[13] ^ crc_reg[21] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[25] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[31] ^ s_axis_tdata[3] ^ s_axis_tdata[6] ^ s_axis_tdata[7] ^ s_axis_tdata[9] ^ s_axis_tdata[13] ^ s_axis_tdata[21] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[25] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[31];
    assign next_crc[30] = crc_reg[4] ^ crc_reg[7] ^ crc_reg[8] ^ crc_reg[10] ^ crc_reg[14] ^ crc_reg[22] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[26] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[30] ^ s_axis_tdata[4] ^ s_axis_tdata[7] ^ s_axis_tdata[8] ^ s_axis_tdata[10] ^ s_axis_tdata[14] ^ s_axis_tdata[22] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[26] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[30];
    assign next_crc[31] = crc_reg[5] ^ crc_reg[8] ^ crc_reg[9] ^ crc_reg[11] ^ crc_reg[15] ^ crc_reg[23] ^ crc_reg[24] ^ crc_reg[25] ^ crc_reg[27] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ s_axis_tdata[5] ^ s_axis_tdata[8] ^ s_axis_tdata[9] ^ s_axis_tdata[11] ^ s_axis_tdata[15] ^ s_axis_tdata[23] ^ s_axis_tdata[24] ^ s_axis_tdata[25] ^ s_axis_tdata[27] ^ s_axis_tdata[28] ^ s_axis_tdata[29] ^ s_axis_tdata[30] ^ s_axis_tdata[31];

endmodule