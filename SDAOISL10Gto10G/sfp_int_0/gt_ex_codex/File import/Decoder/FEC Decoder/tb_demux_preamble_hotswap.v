`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Deskripsi: Testbench Isolasi untuk Demultiplexer Preamble (Sliding Window)
//////////////////////////////////////////////////////////////////////////////////

module tb_demux_preamble_hotswap();

    // Sinyal Input
    reg          clk;
    reg          rst_n;
    reg  [127:0] cdc_data_in;
    reg          cdc_valid_in;

    // Sinyal Output
    wire [71:0]  preamble_extracted;
    wire         preamble_valid;
    wire [95:0]  lpc_data_out;
    wire         lpc_valid_out;

    // Instansiasi Device Under Test (DUT)
    demux_preamble_hotswap uut (
        .clk(clk),
        .rst_n(rst_n),
        .cdc_data_in(cdc_data_in),
        .cdc_valid_in(cdc_valid_in),
        .preamble_extracted(preamble_extracted),
        .preamble_valid(preamble_valid),
        .lpc_data_out(lpc_data_out),
        .lpc_valid_out(lpc_valid_out)
    );

    // Generator Clock (Misal: 200 MHz sesuai clock CDC Decoder)
    always #2.5 clk = ~clk;

    // Parameter Data Uji
    // Ingat: Little Endian di bus. D5 ada di MSB.
    localparam [71:0] PREAMBLE_DATA = 72'hD55555555555555555;
    localparam [95:0] DUMMY_LPC_DATA = 96'hAABBCCDDEEFF_112233445566;

    initial begin
        // 1. Inisialisasi
        clk = 0;
        rst_n = 0;
        cdc_data_in = 128'd0;
        cdc_valid_in = 0;

        #20;
        rst_n = 1;
        #20;

        // --- SKENARIO 1: GTH MEMUNTAHKAN SAMPAH IDLE (Tidak Boleh Mengunci) ---
        $display("Skenario 1: Mengirim Data Sampah/Idle GTH...");
        @(posedge clk);
        cdc_valid_in <= 1'b1;
        cdc_data_in  <= 128'h00000000_00000000_00000000_00000000;
        
        @(posedge clk);
        cdc_data_in  <= 128'h00000000_00000000_02000000_00800000; // Sampah penyelarasan
        
        @(posedge clk);
        cdc_data_in  <= 128'h00000000_00000000_00000000_00000000;

        // --- SKENARIO 2: KEDATANGAN FSO FRAME ASLI ---
        $display("Skenario 2: Menyuntikkan Preamble dan LPC Payload...");
        @(posedge clk);
        // Kita masukan Preamble 72-bit (9 Byte) di bagian bawah (LSB),
        // dan sebagian LPC data di 56-bit (7 Byte) sisanya (128 - 72 = 56).
        cdc_data_in  <= {DUMMY_LPC_DATA[55:0], PREAMBLE_DATA}; 
        
        @(posedge clk);
        // Sisa LPC Data (40-bit / 5 Byte) diletakkan di LSB siklus berikutnya,
        // sisanya diisi nol.
        cdc_data_in  <= {88'd0, DUMMY_LPC_DATA[95:56]};
        
        @(posedge clk);
        cdc_valid_in <= 1'b0; // Akhiri transmisi

        #100;
        $display("Simulasi Selesai.");
        $finish;
    end

endmodule