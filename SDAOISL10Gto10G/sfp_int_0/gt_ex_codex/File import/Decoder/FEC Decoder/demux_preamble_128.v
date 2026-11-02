`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Demultiplexer 128-bit - Memisahkan 72-bit Preamble & 96-bit LPC Data
//////////////////////////////////////////////////////////////////////////////////

module demux_preamble_128 (
    input  wire         clk,
    input  wire         rst_n,
    
    // Input dari rx_gth_logic (128-bit dari CDC)
    input  wire [127:0] cdc_data_in,
    input  wire         cdc_valid_in,
    
    // Output Preamble terpisah (72-bit)
    output reg  [71:0]  preamble_extracted,
    output reg          preamble_valid,
    
    // Output FSO Frame menuju LPC Decoder (96-bit)
    output reg  [95:0]  lpc_data_out,
    output reg          lpc_valid_out
);

    reg [255:0] rx_buffer;
    reg [5:0]   bytes_in_buffer;
    reg         preamble_found;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_buffer          <= 0;
            bytes_in_buffer    <= 0;
            preamble_found     <= 0;
            preamble_extracted <= 0;
            preamble_valid     <= 0;
            lpc_data_out       <= 0;
            lpc_valid_out      <= 0;
        end else begin
            preamble_valid <= 1'b0;
            lpc_valid_out  <= 1'b0;

            // Jika ada data masuk dari CDC
            if (cdc_valid_in) begin
                // Masukkan data 128-bit ke buffer penerima
                rx_buffer <= (rx_buffer >> 128) | ({128'd0, cdc_data_in} << (bytes_in_buffer * 8));
                bytes_in_buffer <= bytes_in_buffer + 16; // Bertambah 16 Byte
            end

            // PROSES EKSTRAKSI: Jika buffer memiliki cukup data (minimal 12 Byte / 96-bit)
            if (bytes_in_buffer >= 12) begin
                if (!preamble_found) begin
                    // Ambil 9 Byte pertama sebagai Preamble
                    preamble_extracted <= rx_buffer[71:0];
                    preamble_valid     <= 1'b1;
                    preamble_found     <= 1'b1; // Preamble sudah diamankan

                    // Geser buffer melewati 9 Byte Preamble
                    rx_buffer       <= rx_buffer >> 72;
                    bytes_in_buffer <= bytes_in_buffer - 9;
                end else begin
                    // Ambil 12 Byte berikutnya sebagai Payload LPC (96-bit)
                    lpc_data_out  <= rx_buffer[95:0];
                    lpc_valid_out <= 1'b1;

                    // Geser buffer melewati 12 Byte Payload
                    rx_buffer       <= rx_buffer >> 96;
                    bytes_in_buffer <= bytes_in_buffer - 12;
                end
            end

            // Reset status pencarian preamble saat frame selesai / reset sinyal
            if (!cdc_valid_in && bytes_in_buffer == 0) begin
                preamble_found <= 1'b0;
            end
        end
    end

endmodule