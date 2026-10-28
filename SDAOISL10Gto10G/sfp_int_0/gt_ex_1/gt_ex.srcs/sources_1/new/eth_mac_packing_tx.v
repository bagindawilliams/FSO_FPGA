`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_mac_packing_tx
Description  : Dynamic Ethernet MAC Transmit Stream Packer.
               Forwards variable-length Ethernet frames (including the 8-Byte
               Preamble, e.g., 502 cycles = 2008 Bytes for a 2000-Byte Jumbo 
               packet, or 18 cycles = 72 Bytes for a 64-Byte Mini packet) 
               from mux_eth_32 to xgmii_tx_formatter while tracking active 
               word and byte counts per packet.
               
               Revision Notes:
               - Removed the hardcoded 483-cycle (1930-Byte) truncation limit 
                 so full 2008-Byte Jumbo frames pass through without loss.
===========================================================================
*/

module eth_mac_packing_tx #(
    parameter MAX_SAFE_WORDS = 16'd4096 // Up to 16 KB Super-Jumbo safety ceiling
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mux_data,
    input  wire        mux_valid,
    output wire [31:0] pack_data,
    output wire        pack_valid,
    output reg  [15:0] tx_word_cnt,
    output reg  [15:0] tx_byte_cnt
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_word_cnt <= 16'd0;
            tx_byte_cnt <= 16'd0;
        end else begin
            if (mux_valid) begin
                if (tx_word_cnt < MAX_SAFE_WORDS) begin
                    tx_word_cnt <= tx_word_cnt + 16'd1;
                    tx_byte_cnt <= tx_byte_cnt + 16'd4;
                end
            end else begin
                tx_word_cnt <= 16'd0;
                tx_byte_cnt <= 16'd0;
            end
        end
    end

    assign pack_valid = mux_valid && (tx_word_cnt < MAX_SAFE_WORDS);
    assign pack_data  = pack_valid ? mux_data : 32'd0;

endmodule