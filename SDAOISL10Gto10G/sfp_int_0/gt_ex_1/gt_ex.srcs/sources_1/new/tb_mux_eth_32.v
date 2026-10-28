`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Ethernet Preamble Multiplexer 32-bit
//
// Revision History:
//   - Rev 1.0 (Initial) : 20-word Ethernet Preamble injection testbench.
//   - Rev 2.0 (2026-10-27 15:11 KST) :
//     1. Connected 'asm_last_in' and 'eth_last_out' ports on u_mux (mux_eth_32)
//        to eliminate unconnected port warnings and verify end-of-packet alignment.
//     2. Added automatic cycle counter & self-check verifying that Cycle 1 emits
//        32'h5555_5555, Cycle 2 emits 32'h5555_55D5, Cycles 3..22 emit all 20
//        payload words without overwriting Word 0, and eth_last_out asserts on
//        Cycle 22 (80B Payload + 8B Preamble = 88 Bytes total).
//////////////////////////////////////////////////////////////////////////////////

module tb_mux_eth_32();

    reg clk;
    reg rst_n;

    // Sinyal input simulasi dari modul Assembler (1922 Byte Frame)
    reg [31:0] asm_data_in;
    reg        asm_valid_in;
    reg        asm_last_in;

    // Kabel internal untuk Preamble Generator
    wire [63:0] preamble_sfd;

    // Output akhir menuju XGMII / Packing & Segmentation
    wire [31:0] eth_data_out;
    wire        eth_valid_out;
    wire        eth_last_out;

    // 1. Instansiasi Generator Preamble
    eth_preamble_gen u_pre_gen (
        .preamble_sfd(preamble_sfd)
    );

    // 2. Instansiasi MUX 32-bit
    mux_eth_32 u_mux (
        .clk          (clk),
        .rst_n        (rst_n),
        .asm_data_in  (asm_data_in),
        .asm_valid_in (asm_valid_in),
        .asm_last_in  (asm_last_in),
        .preamble_sfd (preamble_sfd),
        .eth_data_out (eth_data_out),
        .eth_valid_out(eth_valid_out),
        .eth_last_out (eth_last_out)
    );

    // Membuat Clock 312.5 MHz (Periode 3.2ns = Toggle setiap 1.6ns)
    always #1.6 clk = ~clk;

    integer i;
    reg [7:0] out_word_cnt;
    integer   err_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_word_cnt <= 8'd0;
            err_cnt      <= 0;
        end else if (eth_valid_out) begin
            out_word_cnt <= out_word_cnt + 8'd1;
            if (out_word_cnt == 8'd0 && eth_data_out !== 32'h5555_5555) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 8'd1 && eth_data_out !== 32'h5555_55D5) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 8'd2 && eth_data_out !== 32'hA0A0_B0B0) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 8'd21 && (eth_data_out !== 32'hA0A0_B0C3 || !eth_last_out)) err_cnt <= err_cnt + 1;
        end
    end

    initial begin
        // Tahap Inisialisasi
        clk = 0;
        rst_n = 0;
        asm_data_in = 0;
        asm_valid_in = 0;
        asm_last_in = 0;

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
            asm_last_in  <= (i == 19);
        end

        // Momen ketika transmisi dari Assembler selesai (Akhir Frame)
        @(posedge clk);
        asm_data_in  <= 32'd0;
        asm_valid_in <= 1'b0;
        asm_last_in  <= 1'b0;

        // Tunggu beberapa saat untuk melihat sisa Pipeline memuntahkan data terakhir
        #30;
        $display("\n=======================================================");
        $display(" ETHERNET PREAMBLE 32-BIT MUX VERIFICATION REPORT");
        $display(" -> Total Output Words Emitted : %0d (2 Preamble + 20 Payload)", out_word_cnt);
        $display(" -> Verification Errors        : %0d", err_cnt);
        if (out_word_cnt == 8'd22 && err_cnt == 0)
            $display(" -> RESULT: [PASS] 8-BYTE ETHERNET PREAMBLE PREPENDED CLEANLY!");
        $display("=======================================================\n");
        $finish;
    end

endmodule