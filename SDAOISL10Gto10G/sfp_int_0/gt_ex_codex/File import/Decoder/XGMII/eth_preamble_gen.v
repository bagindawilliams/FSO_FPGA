`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Ethernet Preamble & SFD Generator (64-bit / 8 Byte)
//////////////////////////////////////////////////////////////////////////////////

module eth_preamble_gen(
    output [63:0] preamble_sfd
);

    // 7 Byte Preamble (0x55) + 1 Byte SFD (0xD5)
    // Urutan transmisi 32-bit:
    // MSB [63:32] akan dikirim di Clock 1
    // LSB [31:0]  akan dikirim di Clock 2
    assign preamble_sfd = 64'h55_55_55_55_55_55_55_D5;

endmodule