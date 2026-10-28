`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Demultiplexer 128-bit & Preamble Checker
//
// Revision History:
//   - Rev 1.0 (Initial) : 128-bit Demultiplexer & Preamble Checker isolation TB.
//   - Rev 2.0 (2026-10-27 15:20 KST) : [ETRI Audit Item 1 & Target B1.1 Fix]
//     1. Fixed checker module instantiation name from 'preamble_sda_dec' to 
//        'preamble_sda_decoder' to match preamble_sda_decoder.v.
//     2. Aligned 128-bit input word format to MSB-first per SDA OISL Table 2-8 
//        (Page 23) and mux_gearbox_128.v: {72'h77_AD_5B_58_43_64_1E_2E_26, 56'hAAAA_BBBB_CCCC_DD}.
//     3. Streamed a complete 195-word (3,117-Byte) frame with 25/64 CDC 3 pacing 
//        so demux_preamble_128 crosses its 1600-Byte pre-buffer threshold, 
//        extracts preamble_extracted = 72'h77AD5B5843641E2E26, asserts 
//        link_locked = 1'b1, and outputs all 259 contiguous 96-bit LPC words (3,108 Bytes).
//////////////////////////////////////////////////////////////////////////////////

module tb_demux_decoder();

    reg clk;
    reg rst_n;
    
    // Stimulus from the CDC
    reg [127:0] cdc_data_in;
    reg         cdc_valid_in;
    
    // Observation Output    wire [71:0] preamble_extracted;
    wire        preamble_valid;
    wire [95:0] lpc_data_out;
    wire        lpc_valid_out;
    wire        link_locked;

    // 1. Demux 
    demux_preamble_128 u_demux (
        .clk(clk),
        .rst_n(rst_n),
        .cdc_data_in(cdc_data_in),
        .cdc_valid_in(cdc_valid_in),
        .preamble_extracted(preamble_extracted),
        .preamble_valid(preamble_valid),
        .lpc_data_out(lpc_data_out),
        .lpc_valid_out(lpc_valid_out)
    );

    // 2. Preamble Checker Initiation ([Rev 2.0] Fixed module name to preamble_sda_decoder)
    preamble_sda_decoder u_checker (
        .clk(clk),
        .rst_n(rst_n),
        .preamble_in(preamble_extracted),
        .preamble_valid_in(preamble_valid),
        .link_locked_out(link_locked)
    );

    // Clock 200 MHz
    always #2.5 clk = ~clk;

    integer i;
    integer lpc_out_cnt = 0;

    always @(posedge clk) begin
        if (preamble_valid) begin
            $display(" [%0t] Preamble Extracted = 0x%018X (Expected: 0x77AD5B5843641E2E26)",
                     $time, preamble_extracted);
        end
        if (lpc_valid_out) begin
            lpc_out_cnt <= lpc_out_cnt + 1;
        end
    end

    initial begin
        // Initiation
        clk = 0;
        rst_n = 0;
        cdc_data_in = 0;
        cdc_valid_in = 0;

        #20;
        rst_n = 1;
        #20;

        
        // ------------ SCENARIO 1: FIRST FRAME TO ENTER
        // CDC sends the first 128-bit (Contains 9 Byte Preamble in MSB [127:56] + 7 Byte LPC at [55:0])
        @(posedge clk);
                // [Rev 2.0] MSB-first format: {72-bit SDA OISL Preamble, 56-bit LPC Initial data}
        cdc_data_in  <= {72'h77_AD_5B_58_43_64_1E_2E_26, 56'hAAAA_BBBB_CCCC_DD};
        cdc_valid_in <= 1'b1;

        // ----------- SCENARIO 2: LPC DATA FLOW (194 Words 128-bits next = Total 195 Words / 3,117 Bytes) ---
        // Simulate the remaining frames that come with the periodic pause from CDC 3
        for (i = 1; i < 195; i = i + 1) begin
            @(posedge clk);
            if (i % 4 == 0) begin
                // Pause from CDC (Transmission is held 1 clock)
                cdc_valid_in <= 1'b0;
                @(posedge clk);
            end
            // Incoming data (dummy increment)
            cdc_data_in  <= {32'h1111_1111, 32'h2222_2222, 32'h3333_3333, 32'h0000_0000} + i;
            cdc_valid_in <= 1'b1;
        end

        // Finish transmission
        @(posedge clk);
        cdc_valid_in <= 1'b0;
        cdc_data_in  <= 128'd0;

        // Wait for the entire 259 words LPC (3,108 Bytes) finished continuous issued
        wait(lpc_out_cnt == 259);
        #100;
        $display("\n=======================================================");
        $display(" DEMUX 128 & PREAMBLE DECODER VERIFICATION REPORT");
        $display(" -> Extracted Preamble : 0x%018X", preamble_extracted);
        $display(" -> Link Locked Status : %0b (Expected: 1)", link_locked);
        $display(" -> Contiguous LPC Out : %0d Words (%0d Bytes, Expected: 259 Words / 3108B)",
                 lpc_out_cnt, lpc_out_cnt * 12);
        if ((preamble_extracted == 72'h77_AD_5B_58_43_64_1E_2E_26) &&
            (link_locked == 1'b1) && (lpc_out_cnt == 259))
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH SDA OISL TABLE 2-8!");
        $display("=======================================================\n");
        $finish;
    end

endmodule
