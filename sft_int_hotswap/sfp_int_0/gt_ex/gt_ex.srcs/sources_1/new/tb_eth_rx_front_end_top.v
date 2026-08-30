`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Front-End Ethernet RX (XGMII Parser to Segmenter)
//////////////////////////////////////////////////////////////////////////////////

module tb_eth_rx_front_end_top();

    // Sinyal Clock dan Reset
    reg clk;
    reg rst_n;
    
    // Sinyal Input dari IP 10GBASE-R
    reg [31:0] xgmii_rxd;
    reg [3:0]  xgmii_rxc;
    
    // Sinyal Output menuju SDA Encoder (encoder_top_inst)
    wire [31:0] data_out;
    wire        en;

    // Instansiasi Device Under Test (DUT)
    eth_rx_front_end_top uut (
        .clk(clk),
        .rst_n(rst_n),
        .xgmii_rxd(xgmii_rxd),
        .xgmii_rxc(xgmii_rxc),
        .data_out(data_out),
        .en(en)
    );

    // Pembangkitan Clock 312.5 MHz (Periode 3.2 ns -> Toggle setiap 1.6 ns)
    always #1.6 clk = ~clk;

    integer i;

    initial begin
        // 1. Inisialisasi & Reset (Kondisi Idle XGMII)
        clk = 0;
        rst_n = 0;
        xgmii_rxd = 32'h07070707; // 0x07 adalah karakter Idle XGMII
        xgmii_rxc = 4'b1111;      // Semua jalur adalah sinyal kontrol
        
        #20;
        rst_n = 1;
        #20;

        // --- SKENARIO TRANSMISI XGMII DARI PC ---

        // 2. Siklus 1: Kedatangan Start of Frame (0xFB) & Sebagian Preamble
        @(posedge clk);
        // Format LSB ke MSB: Start (FB) -> Preamble (55) -> Preamble (55) -> Preamble (55)
        xgmii_rxd = 32'h555555FB; 
        xgmii_rxc = 4'b0001; // Hanya byte paling bawah (0xFB) yang merupakan kontrol

        // 3. Siklus 2: Sisa Preamble & Start of Frame Delimiter (0xD5)
        @(posedge clk);
        // Format: Preamble (55) -> Preamble (55) -> Preamble (55) -> SFD (D5)
        xgmii_rxd = 32'hD5555555; 
        xgmii_rxc = 4'b0000; // Semuanya dianggap data murni oleh XGMII

        // 4. Siklus 3 hingga 482: Payload Data Murni
        // Kita sengaja mengirimkan 480 siklus data (1920 Byte) untuk membuktikan
        // bahwa Segmenter akan memotongnya otomatis di batas siklus ke-477.
        for (i = 0; i < 480; i = i + 1) begin
            @(posedge clk);
            xgmii_rxd = 32'hA0A0B0B0 + i; // Data dummy increment
            xgmii_rxc = 4'b0000;
        end

        // 5. Siklus Penutup: Terminate (0xFD)
        @(posedge clk);
        // Format: Terminate (FD) -> Idle (07) -> Idle (07) -> Idle (07)
        xgmii_rxd = 32'h070707FD; 
        xgmii_rxc = 4'b1111;

        // 6. Kembali ke Idle
        @(posedge clk);
        xgmii_rxd = 32'h07070707;
        xgmii_rxc = 4'b1111;

        // Tunggu sisa pipeline kosong
        #50;
        $finish;
    end

endmodule