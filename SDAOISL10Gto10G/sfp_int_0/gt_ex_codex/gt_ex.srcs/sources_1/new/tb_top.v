`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab Kookmin University
// Engineer: Williamsyah Baginda Miraj
// Deskripsi: Testbench Top-Level End-to-End
//////////////////////////////////////////////////////////////////////////////////

module tb_top();

    // Sinyal Input Sistem
    reg sys_clk_p;
    reg sys_clk_n;
    reg mgtrefclk_p;
    reg mgtrefclk_n;
    reg [3:0] RXN_IN;
    reg [3:0] RXP_IN;

    // Sinyal Output Sistem
    wire [1:0] tx_disable;
    wire [3:0] TXN_OUT;
    wire [3:0] TXP_OUT;
    wire fan;

    // Instansiasi Top Module (Sistem End-to-End Penuh)
    top uut (
        .sys_clk_p(sys_clk_p), 
        .sys_clk_n(sys_clk_n), 
        .tx_disable(tx_disable), 
        .mgtrefclk_n(mgtrefclk_n), 
        .mgtrefclk_p(mgtrefclk_p), 
        .RXN_IN(RXN_IN), 
        .RXP_IN(RXP_IN), 
        .TXN_OUT(TXN_OUT), 
        .TXP_OUT(TXP_OUT), 
        .fan(fan)
    );

    // =========================================================================
    // 1. GENERATOR CLOCK FISIK (Presisi 10G)
    // =========================================================================
    // System Clock (300 MHz -> Periode 3.333 ns) untuk PLL Baseband 200 MHz
    initial begin
        sys_clk_p = 1'b0;
        sys_clk_n = 1'b1;
        forever #1.666 begin
            sys_clk_p = ~sys_clk_p;
            sys_clk_n = ~sys_clk_n;
        end
    end

    // MGT Reference Clock (156.25 MHz -> Periode 6.4 ns) untuk Transceiver GTH
    initial begin
        mgtrefclk_p = 1'b0;
        mgtrefclk_n = 1'b1;
        forever #3.2 begin
            mgtrefclk_p = ~mgtrefclk_p;
            mgtrefclk_n = ~mgtrefclk_n;
        end
    end

    // =========================================================================
    // 2. SKENARIO SIMULASI
    // =========================================================================
    initial begin
        // Loopback Internal GTH atau SFP+ fisik dimatikan, kita monitoring
        // aliran sinyal secara pasif. (GTH di setting untuk internal loopback di exdes jika diperlukan).
        RXN_IN = 4'b0000;
        RXP_IN = 4'b0000;

        $display("[%0t] Memulai Simulasi End-to-End SDA OISL 10G...", $time);
        
        // Memberi waktu agar PLL (clk_wiz_0) dan Reset Internal GTH selesai mengunci (Lock)
        #8000;
        
        $display("[%0t] PLL GTH dan Baseband Lock. Autorun memicu XGMII Packet Gen...", $time);
        
        // Simulasi berjalan cukup lama agar paket bisa melewati seluruh chain:
        // XGMII -> Segmenter -> Framer -> CDC1 -> RS/LPC -> CDC2 -> ARQ -> GTH -> 
        // GTH RX -> ARQ RX -> CDC1_RX -> Decoder -> CDC2_RX -> Assembler -> XGMII RX
        #250000; 

        $display("[%0t] Simulasi Selesai. Periksa sinyal xgmii_rxd_out di ujung Egress.", $time);
        $finish;
    end

endmodule