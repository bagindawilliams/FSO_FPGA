`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Ethernet Preamble Multiplexer 32-bit
//////////////////////////////////////////////////////////////////////////////////

module tb_mux_eth_32();

    reg clk;
    reg rst_n;

    // Sinyal input simulasi dari modul Assembler (1922 Byte Frame)
    reg [31:0] asm_data_in;
    reg        asm_valid_in;

    // Kabel internal untuk Preamble Generator
    wire [63:0] preamble_sfd;

    // Output akhir menuju XGMII / Packing & Segmentation
    wire [31:0] eth_data_out;
    wire        eth_valid_out;

    // 1. Instansiasi Generator Preamble
    eth_preamble_gen u_pre_gen (
        .preamble_sfd(preamble_sfd)
    );

    // 2. Instansiasi MUX 32-bit
    mux_eth_32 u_mux (
        .clk(clk),
        .rst_n(rst_n),
        .asm_data_in(asm_data_in),
        .asm_valid_in(asm_valid_in),
        .preamble_sfd(preamble_sfd),
        .eth_data_out(eth_data_out),
        .eth_valid_out(eth_valid_out)
    );

    // Membuat Clock 312.5 MHz (Periode 3.2ns = Toggle setiap 1.6ns)
    always #1.6 clk = ~clk;

    integer i;

    initial begin
        // Tahap Inisialisasi
        clk = 0;
        rst_n = 0;
        asm_data_in = 0;
        asm_valid_in = 0;

        // Reset sistem
        #20;
        rst_n = 1;
        #20;

        // --- SKENARIO TRANSMISI ETHERNET FRAME ---
        // Assembler memuntahkan data FSO Frame yang sudah digabung dengan MAC Header
        // Kita simulasikan pengiriman 20 paket 32-bit (80 Byte) sebagai sampel pengujian
        for (i = 0; i < 20; i = i + 1) begin
            @(posedge clk);
            // Membuat data dummy yang bisa dikenali (Contoh: A0A0B0B0, A0A0B0B1, dst)
            asm_data_in  <= 32'hA0A0_B0B0 + i; 
            asm_valid_in <= 1'b1;
        end

        // Momen ketika transmisi dari Assembler selesai (Akhir Frame)
        @(posedge clk);
        asm_valid_in <= 1'b0;

        // Tunggu beberapa saat untuk melihat sisa Pipeline memuntahkan data terakhir
        #30;
        
        $finish;
    end

endmodule