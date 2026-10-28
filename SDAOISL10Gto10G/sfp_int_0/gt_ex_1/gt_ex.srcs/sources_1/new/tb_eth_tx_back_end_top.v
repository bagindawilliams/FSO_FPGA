`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_eth_tx_back_end_top
Description  : Standalone Verification Testbench for eth_tx_back_end_top.v
               (eth_mac_packing_tx + xgmii_tx_formatter) at 312.5 MHz.

               Revision History:
               - Rev 1.0 (Initial) : Basic stimulus testbench for eth_tx_back_end_top.
               - Rev 1.1 (2026-10-22 07:09 KST) :
                 1. Preserved original module/instance names and port structure.
                 2. Upgraded input stimulus to feed an authentic 502-word 
                    (2008-Byte) Ethernet frame (2 words [8B] Preamble 
                    0x55555555_555555D5 + 500 words [2000B] Jumbo Ethernet 
                    Packet ending in FCS 0xDEADBEEF).
                 3. Added zero-lag waveform counters for input (in_word_cnt 
                    1..502, in_byte_cnt 4..2008) and XGMII output 
                    (xgmii_word_cnt 1..503, xgmii_byte_cnt 4..2012).
===========================================================================
*/

module tb_eth_tx_back_end_top();
    reg clk;
    reg rst_n;
    reg [31:0] data_in;
    reg        en;
    
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;
    wire        txp_unused, txn_unused;

    // Zero-lag Input & Output Counters for Waveform Verification
    reg  [15:0] in_word_cnt;
    reg  [15:0] in_byte_cnt;
    reg  [15:0] raw_xgmii_idx;
    wire        xgmii_active   = (xgmii_txd != 32'h0707_0707);
    wire [15:0] xgmii_word_cnt = xgmii_active ? (raw_xgmii_idx + 16'd1) : 16'd0; // 1..503
    wire [15:0] xgmii_byte_cnt = xgmii_active ? ((raw_xgmii_idx + 16'd1) * 16'd4) : 16'd0; // 4..2012

    eth_tx_back_end_top #(
        .RUN_MODE (1)
    ) uut (
        .clk       (clk),
        .rst_n     (rst_n),
        .data_in   (data_in),
        .en        (en),
        .xgmii_txd (xgmii_txd),
        .xgmii_txc (xgmii_txc),
        .refclk_p  (1'b0),
        .refclk_n  (1'b1),
        .reset     (~rst_n),
        .dclk      (clk),
        .txp       (txp_unused),
        .txn       (txn_unused)
    );

    always #1.6 clk = ~clk; // 312.5 MHz (Period = 3.2 ns)

    integer i;

    initial begin
        clk         = 0;
        rst_n       = 0;
        data_in     = 32'd0;
        en          = 0;
        in_word_cnt = 16'd0;
        in_byte_cnt = 16'd0;
        
        #20;
        rst_n = 1;
        repeat (10) @(posedge clk);

        // Simulation of input from ethernet_frame_reassembly (Exact 2008 Byte = 502 cycles:
        // 8 Byte Preamble + 2000 Byte Ethernet Jumbo Package)
        for (i = 0; i < 502; i = i + 1) begin
            @(posedge clk);
            en          <= 1'b1;
            in_word_cnt <= i[15:0] + 16'd1;
            in_byte_cnt <= (i[15:0] + 16'd1) * 16'd4;

            case (i)
                0:   data_in <= 32'h5555_5555; // Preamble Word 1 (Bytes 1..4)
                1:   data_in <= 32'h5555_55D5; // Preamble + SFD Word 2 (Bytes 5..8)
                2:   data_in <= 32'hDA01_0203; // Dest MAC [47:16]
                3:   data_in <= 32'h0405_5A01; // Dest MAC [15:0] + Src MAC [47:32]
                4:   data_in <= 32'h0203_0405; // Src MAC [31:0]
                5:   data_in <= 32'h0800_4500; // EtherType IPv4 (0x0800)
                11:  data_in <= 32'h4B6F_6F6B; // ASCII "Kook"
                12:  data_in <= 32'h6D69_6E20; // ASCII "min "
                13:  data_in <= 32'h4653_4F20; // ASCII "FSO "
                501: data_in <= 32'hDEAD_BEEF; // 502nd Word (Byte 2008): Ethernet FCS
                default: data_in <= 32'hA0A0_B0B0 + i;
            endcase
        end

        // stop send
        @(posedge clk);
        data_in     <= 32'd0;
        en          <= 1'b0;
        in_word_cnt <= 16'd0;
        in_byte_cnt <= 16'd0;

        #100;
        $finish;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            raw_xgmii_idx <= 16'd0;
        else if (xgmii_active)
            raw_xgmii_idx <= raw_xgmii_idx + 16'd1;
        else
            raw_xgmii_idx <= 16'd0;
    end

endmodule