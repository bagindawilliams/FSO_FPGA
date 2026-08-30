`timescale 1ns / 1ps

module demux_preamble_hotswap (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [127:0] cdc_data_in,
    input  wire         cdc_valid_in,
    output reg  [71:0]  preamble_extracted,
    output reg          preamble_valid,
    output reg  [95:0]  lpc_data_out,
    output reg          lpc_valid_out
);

    localparam [71:0] TARGET_PREAMBLE = 72'hD55555555555555555;
    
    reg [255:0] rx_buffer;
    reg [7:0]   bytes_in_buffer;
    reg         preamble_found;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_buffer          <= 256'd0;
            bytes_in_buffer    <= 8'd0;
            preamble_found     <= 1'b0;
            preamble_valid     <= 1'b0;
            lpc_valid_out      <= 1'b0;
            // PERBAIKAN 1: Inisialisasi Wajib
            preamble_extracted <= 72'd0; 
            lpc_data_out       <= 96'd0; 
        end else begin
            preamble_valid <= 1'b0;
            lpc_valid_out  <= 1'b0;

            // PERBAIKAN 2: FSM Isolasi State
            if (!preamble_found) begin
                // STATE 1: Mencari Preamble
                if (cdc_valid_in) begin
                    if (cdc_data_in[71:0] == TARGET_PREAMBLE) begin
                        preamble_extracted <= cdc_data_in[71:0];
                        preamble_valid     <= 1'b1;
                        preamble_found     <= 1'b1;
                        
                        // Simpan sisa 7 Byte data ke buffer untuk LPC
                        rx_buffer[55:0] <= cdc_data_in[127:72];
                        bytes_in_buffer <= 8'd7; 
                    end
                end
            end else begin
                // STATE 2: Menampung dan Mengekstrak LPC
                if (cdc_valid_in) begin
                    rx_buffer <= rx_buffer | ({128'd0, cdc_data_in} << (bytes_in_buffer * 8));
                    bytes_in_buffer <= bytes_in_buffer + 16;
                end
                
                if (bytes_in_buffer >= 12) begin
                    lpc_data_out  <= rx_buffer[95:0];
                    lpc_valid_out <= 1'b1;
                    
                    rx_buffer       <= rx_buffer >> 96;
                    bytes_in_buffer <= bytes_in_buffer - 12;
                end
            end
        end
    end
endmodule