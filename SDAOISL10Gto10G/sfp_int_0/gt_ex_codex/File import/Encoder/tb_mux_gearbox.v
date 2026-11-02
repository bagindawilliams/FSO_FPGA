`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi untuk MUX Gearbox 128-bit & Preamble
//////////////////////////////////////////////////////////////////////////////////

module tb_mux_gearbox();

    // Sinyal Register (Input ke modul)
    reg clk;
    reg rst_n;
    reg [95:0] lpc_data;
    reg lpc_valid;
    
    // Sinyal Wire (Output dari modul)
    wire [71:0] preamble_data;
    wire [127:0] cdc_data;
    wire cdc_valid;

    // 1. Instansiasi Modul Preamble
    preamble_gen u_preamble (
        .preamble_out(preamble_data)
    );

    // 2. Instansiasi Modul MUX Gearbox
    mux_gearbox_128 u_mux (
        .clk(clk),
        .rst_n(rst_n),
        .preamble_data(preamble_data),
        .lpc_data(lpc_data),
        .lpc_valid(lpc_valid),
        .cdc_data(cdc_data),
        .cdc_valid(cdc_valid)
    );

    // 3. Membuat Clock 200 MHz (Periode 5ns = Togle setiap 2.5ns)
    always #2.5 clk = ~clk;

    // Variabel untuk menghitung FSO Frame
    integer i;

    // 4. Skenario Pengujian (Stimulus)
    initial begin
        // --- TAHAP INISIALISASI ---
        clk = 0;
        rst_n = 0;
        lpc_data = 96'd0;
        lpc_valid = 0;

        // Tahan reset selama 20ns, lalu lepaskan
        #20;
        rst_n = 1;
        #20;

        // --- TAHAP SIMULASI ALIRAN DATA (259 Kata = 3108 Byte) ---
        // Kita simulasikan LPC mengirimkan data terus menerus tanpa putus
        for (i = 0; i < 259; i = i + 1) begin
            @(posedge clk);
            // Membuat data dummy yang bisa dibaca berurutan (0000, 0001, dst)
            lpc_data = {32'hAAAA_BBBB, 32'hCCCC_DDDD, 32'h0000_0000} + i; 
            lpc_valid = 1;
        end
        
        // --- TAHAP FLUSH (Melihat sisa 13 Byte dikeluarkan) ---
        @(posedge clk);
        lpc_valid = 0; // Transmisi dari LPC selesai
        
        // Tunggu 50ns untuk melihat waveform cdc_data terakhir
        #50;
        
        // Selesai
        $finish;
    end

endmodule