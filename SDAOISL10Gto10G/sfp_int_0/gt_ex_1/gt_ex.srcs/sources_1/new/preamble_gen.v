`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Static 72-bit Preamble Generator.
               Outputs the standard SDA OISL Preamble/Sync Marker:
               8 bytes of 0x55 followed by 1 byte Start Frame Delimiter (0xD5).
               Total Size: 9 Bytes.

Revision History:
  - Rev 1.0 (Initial) : Static 72-bit Preamble marker (72'h55_55_55_55_55_55_55_55_D5).
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 1 - SDA OISL Page 23, Table 2-8 & Sec. 2.6.3.2]
    Updated 72-bit Preamble constant from simulation marker (72'h5555555555555555D5)
    to the official SDA OISL v2.1.2 standard value (72'h77AD5B5843641E2E26).
    MSB (bit 71, 72nd bit) is placed at preamble_out[71] and transmitted first
    via mux_gearbox_128.v and x_logic_gth.v down to LSB (bit 0, 1st bit).
===========================================================================
*/

module preamble_gen (
    output wire [71:0] preamble_out
);

    // 72-bit Preamble: {8{8'h55}, 8'hD5}
    // [Rev 2.0 - 2026-10-27 03:54 KST] Updated to SDA OISL v2.1.2 Table 2-8 standard constant:
    assign preamble_out = 72'h77_AD_5B_58_43_64_1E_2E_26;
    
endmodule