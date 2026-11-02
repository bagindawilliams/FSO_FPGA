`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Modul Terpisah untuk Memvalidasi Preamble 72-bit di SDA Decoder
//////////////////////////////////////////////////////////////////////////////////

module preamble_sda_dec (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [71:0]  preamble_in,
    input  wire         preamble_valid_in,
    output reg          link_locked_out
);

    localparam [71:0] EXPECTED_PREAMBLE = 72'h55_55_55_55_55_55_55_55_D5;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            link_locked_out <= 1'b0;
        end else if (preamble_valid_in) begin
            // Cek apakah Preamble yang diterima cocok dengan standar
            if (preamble_in == EXPECTED_PREAMBLE)
                link_locked_out <= 1'b1; // Sinkronisasi optik valid
            else
                link_locked_out <= 1'b0; // Terjadi error / misaligned
        end
    end

endmodule