`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Static 72-bit Preamble Generator for SDA OISL
//////////////////////////////////////////////////////////////////////////////////

module preamble_gen (
    output wire [71:0] preamble_out
);
    // Standar 72-bit Preamble: 8 byte 0x55, diakhiri 1 byte 0xD5 (SFD)
    assign preamble_out = 72'h55_55_55_55_55_55_55_55_D5;
    
endmodule