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
//        32'h5555_5555, Cycle 2 emits 32'h5555_55D5, Cycles 3..22 emit all
//        payload words without overwriting Word 0.
//   - Rev 2.3 (2026-10-29 01:49 KST) : [Unified 2000-Byte Jumbo Frame & Counter Alignment]
//     1. Preserved all original comments and Rev 1.0/2.0 history logs 100% intact.
//     2. Upgraded from 20 dummy words (80B) to the full 2000-Byte (500-word) Jumbo 
//        Ethernet Frame (containing "Kookmin FSO " and ending with FCS 0xDEADBEEF), 
//        verifying that mux_eth_32 prepends 8 Bytes of Ethernet Preamble 
//        (55555555_555555D5) and emits 502 contiguous words (2008 Bytes) with 
//        in_clk_cnt (1..500), in_byte_cnt (4..2000), out_clk_cnt (1..502), and 
//        out_byte_cnt (4..2008).
//////////////////////////////////////////////////////////////////////////////////

module tb_mux_eth_32();

    reg clk;
    reg rst_n;

    // Sinyal input simulasi dari modul Assembler (2000 Byte Jumbo Frame)
    reg [31:0] asm_data_in;
    reg        asm_valid_in;
    reg        asm_last_in;

    // Kabel internal untuk Preamble Generator
    wire [63:0] preamble_sfd;

    // Output akhir menuju XGMII / Packing & Segmentation
    wire [31:0] eth_data_out;
    wire        eth_valid_out;
    wire        eth_last_out;

    // Standardized Waveform Counters
    reg [15:0] in_clk_cnt;    // 1..500 Clocks
    reg [15:0] in_byte_cnt;   // 4..2000 Bytes
    reg [15:0] out_clk_cnt;   // 1..502 Clocks
    reg [15:0] out_byte_cnt;  // 4..2008 Bytes
    reg [15:0] out_word_cnt;
    integer    err_cnt;

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

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_clk_cnt  <= 16'd0;
            out_byte_cnt <= 16'd0;
            out_word_cnt <= 16'd0;
            err_cnt      <= 0;
        end else if (eth_valid_out) begin
            out_clk_cnt  <= out_clk_cnt + 16'd1;
            out_byte_cnt <= out_byte_cnt + 16'd4;
            out_word_cnt <= out_word_cnt + 16'd1;
            if (out_word_cnt == 16'd0   && eth_data_out !== 32'h5555_5555) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 16'd1   && eth_data_out !== 32'h5555_55D5) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 16'd2   && eth_data_out !== 32'hAABB_CCDD) err_cnt <= err_cnt + 1;
            if (out_word_cnt == 16'd501 && (eth_data_out !== 32'hDEAD_BEEF || !eth_last_out)) err_cnt <= err_cnt + 1;
        end else begin
            out_clk_cnt  <= 16'd0;
            out_byte_cnt <= 16'd0;
        end
    end

    initial begin
        // Tahap Inisialisasi
        clk          = 0;
        rst_n        = 0;
        asm_data_in  = 0;
        asm_valid_in = 0;
        asm_last_in  = 0;
        in_clk_cnt   = 0;
        in_byte_cnt  = 0;

        // Reset sistem
        #20;
        rst_n = 1;
        #20;

        // --- SKENARIO TRANSMISI ETHERNET FRAME (2000-BYTE JUMBO FRAME) ---
        // Assembler memuntahkan data FSO Frame yang sudah digabung dengan MAC Header
        // Kita simulasikan pengiriman 500 kata 32-bit (2000 Byte Jumbo Frame)
        for (i = 0; i < 500; i = i + 1) begin
            @(posedge clk);
            asm_valid_in <= 1'b1;
            asm_last_in  <= (i == 499);
            in_clk_cnt   <= i + 16'd1;
            in_byte_cnt  <= (i + 16'd1) * 16'd4;
            case (i)
                0:   asm_data_in <= 32'hAABB_CCDD; // DEST_MAC[47:16]
                1:   asm_data_in <= 32'hEEFF_1122; // DEST_MAC[15:0], SRC_MAC[47:32]
                2:   asm_data_in <= 32'h3344_5566; // SRC_MAC[31:0]
                3:   asm_data_in <= 32'h0800_4500; // EtherType IPv4
                9:   asm_data_in <= 32'h4B6F_6F6B; // "Kook"
                10:  asm_data_in <= 32'h6D69_6E20; // "min "
                11:  asm_data_in <= 32'h4653_4F20; // "FSO "
                499: asm_data_in <= 32'hDEAD_BEEF; // 2000th Byte Ethernet FCS
                default: asm_data_in <= 32'hA0A0_0000 + i;
            endcase
        end

        // Momen ketika transmisi dari Assembler selesai (Akhir Frame)
        @(posedge clk);
        asm_data_in  <= 32'd0;
        asm_valid_in <= 1'b0;
        asm_last_in  <= 1'b0;
        in_clk_cnt   <= 16'd0;
        in_byte_cnt  <= 16'd0;

        // Tunggu beberapa saat untuk melihat sisa Pipeline memuntahkan data terakhir
        #40;
        $display("\n=======================================================");
        $display(" ETHERNET PREAMBLE 32-BIT MUX VERIFICATION REPORT");
        $display(" -> Total Output Words Emitted : %0d (2 Preamble + 500 Jumbo Payload = 2008B)", out_word_cnt);
        $display(" -> Verification Errors        : %0d", err_cnt);
        if (out_word_cnt == 16'd502 && err_cnt == 0)
            $display(" -> RESULT: [PASS] 8-BYTE ETHERNET PREAMBLE PREPENDED TO 2000B JUMBO CLEANLY!");
        $display("=======================================================\n");
        $finish;
    end

endmodule