`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Static 72-bit Preamble Generator.
               Outputs the standard SDA OISL Preamble/Sync Marker:
               8 bytes of 0x55 followed by 1 byte Start Frame Delimiter (0xD5).
               Total Size: 9 Bytes.
===========================================================================
*/

module preamble_gen (
    output wire [71:0] preamble_out
);

    // 72-bit Preamble: {8{8'h55}, 8'hD5}
    assign preamble_out = 72'h55_55_55_55_55_55_55_55_D5;
    
endmodule