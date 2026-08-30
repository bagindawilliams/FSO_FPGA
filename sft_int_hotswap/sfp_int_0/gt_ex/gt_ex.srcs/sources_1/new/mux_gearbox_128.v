`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: MUX Gearbox - Merges 72-bit Preamble & 96-bit LPC into 128-bit
//////////////////////////////////////////////////////////////////////////////////

module mux_gearbox_128 (
    input  wire         clk,
    input  wire         rst_n,
    
    // Input 1: Dari Preamble Generator (72-bit / 9 Byte)
    input  wire [71:0]  preamble_data,
    
    // Input 2: Dari LPC core_tx (96-bit / 12 Byte)
    input  wire [95:0]  lpc_data,
    input  wire         lpc_valid,
    
    // Output ke CDC x_logic_gth (128-bit / 16 Byte)
    output reg  [127:0] cdc_data,
    output reg          cdc_valid
);

    reg [255:0] buffer;
    reg [5:0]   bytes_in_buf;
    reg [8:0]   word_count; // Menghitung 259 kata (3108 Byte)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            buffer <= 0; bytes_in_buf <= 0; word_count <= 0; cdc_valid <= 0;
        end else begin
            cdc_valid <= 1'b0; 
            
            // KONDISI 1: Buffer cukup 16 Byte (128-bit)
            if (bytes_in_buf >= 16) begin
                cdc_data <= buffer[127:0];
                cdc_valid <= 1'b1;
                
                if (lpc_valid) begin
                    if (word_count == 0) begin // Awal Frame: Sedot Preamble + LPC
                        buffer <= (buffer >> 128) | ({184'd0, preamble_data} << ((bytes_in_buf - 16)*8)) 
                                                  | ({160'd0, lpc_data} << ((bytes_in_buf - 16 + 9)*8));
                        bytes_in_buf <= bytes_in_buf - 16 + 21;
                        word_count <= 1;
                    end else begin // Sedot LPC saja
                        buffer <= (buffer >> 128) | ({160'd0, lpc_data} << ((bytes_in_buf - 16)*8));
                        bytes_in_buf <= bytes_in_buf - 16 + 12;
                        if (word_count == 258) word_count <= 0; 
                        else word_count <= word_count + 1;
                    end
                end else begin
                    buffer <= buffer >> 128;
                    bytes_in_buf <= bytes_in_buf - 16;
                end
            end 
            
            // KONDISI 2: Load data normal tanpa Unload (Ember belum penuh 16 Byte)
            else if (lpc_valid) begin
                if (word_count == 0) begin
                    buffer <= buffer | ({184'd0, preamble_data} << (bytes_in_buf*8)) 
                                     | ({160'd0, lpc_data} << ((bytes_in_buf+9)*8));
                    bytes_in_buf <= bytes_in_buf + 21;
                    word_count <= 1;
                end else begin
                    buffer <= buffer | ({160'd0, lpc_data} << (bytes_in_buf*8));
                    bytes_in_buf <= bytes_in_buf + 12;
                    if (word_count == 258) word_count <= 0;
                    else word_count <= word_count + 1;
                end
            end
            
            // KONDISI 3: Flush sisa data (13 Byte sisa pembagian) di akhir Frame
            else if (word_count == 0 && bytes_in_buf > 0) begin
                cdc_data <= buffer[127:0]; 
                cdc_valid <= 1'b1;
                buffer <= 0;
                bytes_in_buf <= 0;
            end
        end
    end
endmodule