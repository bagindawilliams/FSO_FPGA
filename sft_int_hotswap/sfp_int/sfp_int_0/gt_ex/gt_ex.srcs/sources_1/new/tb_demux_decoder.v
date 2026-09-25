`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Demultiplexer 128-bit & Preamble Checker
//////////////////////////////////////////////////////////////////////////////////

module tb_demux_decoder();

    reg clk;
    reg rst_n;
    
    // Stimulus dari CDC
    reg [127:0] cdc_data_in;
    reg         cdc_valid_in;
    
    // Observasi Output
    wire [71:0] preamble_extracted;
    wire        preamble_valid;
    wire [95:0] lpc_data_out;
    wire        lpc_valid_out;
    wire        link_locked;

    // 1. Instansiasi Demux
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

    // 2. Instansiasi Preamble Checker
    preamble_sda_dec u_checker (
        .clk(clk),
        .rst_n(rst_n),
        .preamble_in(preamble_extracted),
        .preamble_valid_in(preamble_valid),
        .link_locked_out(link_locked)
    );

    // Clock 200 MHz
    always #2.5 clk = ~clk;

    integer i;

    initial begin
        // Inisialisasi
        clk = 0;
        rst_n = 0;
        cdc_data_in = 0;
        cdc_valid_in = 0;

        #20;
        rst_n = 1;
        #20;

        // --- SKENARIO 1: FRAME PERTAMA MASUK ---
        // CDC mengirimkan 128-bit pertama (Berisi 9 Byte Preamble + 7 Byte LPC)
        @(posedge clk);
        // Format {56-bit LPC Data awal, 72-bit Preamble}
        cdc_data_in = {56'hAAAA_BBBB_CCCC_DD, 72'h5555_5555_5555_5555_D5};
        cdc_valid_in = 1;

        // --- SKENARIO 2: ALIRAN DATA LPC ---
        // Mensimulasikan sisa frame yang datang.
        // Kita beri jeda 0 secara periodik untuk mensimulasikan rasio 4/3 dari CDC
        for (i = 1; i <= 20; i = i + 1) begin
            @(posedge clk);
            if (i % 4 == 0) begin
                // Jeda dari CDC (Transmisi tertahan 1 clock)
                cdc_valid_in = 0;
            end else begin
                // Data masuk (dummy increment)
                cdc_data_in = {32'h1111_1111, 32'h2222_2222, 32'h3333_3333, 32'h0000_0000} + i;
                cdc_valid_in = 1;
            end
        end

        // Selesai transmisi
        @(posedge clk);
        cdc_valid_in = 0;

        // Tunggu sisa buffer kosong
        #50;
        $finish;
    end

endmodule