`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_preamble_gen
Description  : IEEE 802.3 Ethernet Preamble and Start Frame Delimiter (SFD)
               Constant Generator. Outputs the standard 8-Byte (64-bit) 
               synchronization pattern (7 Bytes of 0x55 followed by 1 Byte 
               of 0xD5) for prepending to reassembled Ethernet packets.
===========================================================================
*/

module eth_preamble_gen (
    output wire [63:0] preamble_sfd
);

    // 7-Byte Ethernet Preamble (55_55_55_55_55_55_55) + 1-Byte SFD (D5)
    // Word 1 [63:32] : 32'h5555_5555 (Transmitted on Preamble Cycle 1)
    // Word 2 [31:0]  : 32'h5555_55D5 (Transmitted on Preamble Cycle 2)
    assign preamble_sfd = 64'h55_55_55_55_55_55_55_D5;

endmodule