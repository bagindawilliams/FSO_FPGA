`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Description  : MUX Gearbox 128-bit (Preamble + LPC Combiner).

               ARCHITECTURE & OISL COMPLIANCE:
               - Merges 72-bit (9B) Preamble and 96-bit (12B) LPC words.
               - Enforces the strict SDA OISL geometry of 3117 Bytes per frame.
               - Outputs 194 full 16-Byte cycles.
               - The 195th cycle is a FLUSH containing exactly 13 Bytes, 
                 validated by cdc_keep = 16'h1FFF. 
               - Does NOT straddle frames across its output boundary, ensuring
                 clean verification and debugging at the 128-bit level.
===========================================================================
*/

module mux_gearbox_128 (
    input  wire         clk,
    input  wire         rst_n,
    
    // Interface from Preamble Gen (72-bit / 9 Bytes)
    input  wire [71:0]  preamble_data,
    
    // Interface from LPC (96-bit / 12 Bytes)
    input  wire [95:0]  lpc_data,
    input  wire         lpc_valid,
    
    // Interface to CDC 2 (128-bit / 16 Bytes)
    output reg  [127:0] cdc_data,
    output reg          cdc_valid,
    output reg  [15:0]  cdc_keep    // Byte Enable Mask for exact 3117B boundary
);

    reg [255:0] buffer;
    reg [5:0]   bytes_in_buf;
    reg [8:0]   word_count; // Tracks 0 to 258 (259 total LPC words)

    // Pre-aligned 256-bit MSB vectors for incoming data
    wire [255:0] pre_and_lpc_msb = {preamble_data, lpc_data, 88'd0}; // 21 Bytes (168 bits) at MSB
    wire [255:0] lpc_only_msb    = {lpc_data, 160'd0};               // 12 Bytes (96 bits) at MSB

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buffer       <= 256'd0; 
            bytes_in_buf <= 6'd0; 
            word_count   <= 9'd0; 
            cdc_valid    <= 1'b0;
            cdc_keep     <= 16'd0;
            cdc_data     <= 128'd0;
        end else begin
            cdc_valid <= 1'b0;
            cdc_keep  <= 16'd0;
            
            // ===================================================
            // CONDITION 1: Buffer has >= 16 bytes (Output Top 128-bit Word)
            // ===================================================
            if (bytes_in_buf >= 6'd16) begin
                cdc_data  <= buffer[255:128];
                cdc_valid <= 1'b1;
                cdc_keep  <= 16'hFFFF; // All 16 Bytes Valid
                
                if (lpc_valid) begin
                    if (word_count == 9'd0) begin 
                        // Start of Frame: Shift out top 16B, pack Preamble (9B) + LPC (12B)
                        buffer       <= (buffer << 128) | (pre_and_lpc_msb >> ((bytes_in_buf - 6'd16) * 8));
                        bytes_in_buf <= bytes_in_buf - 6'd16 + 6'd21;
                        word_count   <= 9'd1;
                    end else begin 
                        // Middle of Frame: Shift out top 16B, pack LPC (12B)
                        buffer       <= (buffer << 128) | (lpc_only_msb >> ((bytes_in_buf - 6'd16) * 8));
                        bytes_in_buf <= bytes_in_buf - 6'd16 + 6'd12;
                        
                        if (word_count == 9'd258) word_count <= 9'd0; 
                        else                      word_count <= word_count + 1'b1;
                    end
                end else begin
                    // Shift out top 16B, no new data arriving
                    buffer       <= (buffer << 128);
                    bytes_in_buf <= bytes_in_buf - 6'd16;
                end
            end 
            
            // ===================================================
            // CONDITION 2: Buffer < 16 bytes, loading new data
            // ===================================================
            else if (lpc_valid) begin
                if (word_count == 9'd0) begin
                    buffer       <= buffer | (pre_and_lpc_msb >> (bytes_in_buf * 8));
                    bytes_in_buf <= bytes_in_buf + 6'd21;
                    word_count   <= 9'd1;
                end else begin
                    buffer       <= buffer | (lpc_only_msb >> (bytes_in_buf * 8));
                    bytes_in_buf <= bytes_in_buf + 6'd12;
                    
                    if (word_count == 9'd258) word_count <= 9'd0;
                    else                      word_count <= word_count + 1'b1;
                end
            end
            
            // ===================================================
            // CONDITION 3: End of Frame Flush (Remaining 13 Bytes in [127:24])
            // ===================================================
            else if (word_count == 9'd0 && bytes_in_buf > 6'd0) begin
                cdc_data     <= buffer[255:128]; // Top 104 bits [127:24] hold the 13 valid bytes
                cdc_valid    <= 1'b1;
                cdc_keep     <= (16'hFFFF >> (6'd16 - bytes_in_buf)); // 16'h1FFF for 13 bytes
                
                buffer       <= 256'd0;
                bytes_in_buf <= 6'd0;
            end
        end
    end
endmodule