//`timescale 1ns / 1ps

//module tb_top();

//    // Sinyal Motherboard Virtual
//    reg        sys_clk_p;
//    reg        sys_clk_n;
//    reg        mgtrefclk_p;
//    reg        mgtrefclk_n;
    
//    // Antarmuka SFP+ Virtual
//    reg  [3:0] RXP_IN;
//    reg  [3:0] RXN_IN;
//    wire [3:0] TXP_OUT;
//    wire [3:0] TXN_OUT;
    
//    // Status Port
//    wire [1:0] tx_disable;
//    wire       fan;

//    // --- INSTANSIASI DUT ---
//    top uut (
//        .sys_clk_p   (sys_clk_p),
//        .sys_clk_n   (sys_clk_n),
//        .tx_disable  (tx_disable),
//        .mgtrefclk_p (mgtrefclk_p),
//        .mgtrefclk_n (mgtrefclk_n),
//        .RXP_IN      (RXP_IN),
//        .RXN_IN      (RXN_IN),
//        .TXP_OUT     (TXP_OUT),
//        .TXN_OUT     (TXN_OUT),
//        .fan         (fan)
//    );

//    // --- GENERATOR CLOCK MULTIPLE ---
//    // 1. Clock 200 MHz dari Board
//    always #2.5 sys_clk_p = ~sys_clk_p;
//    always #2.5 sys_clk_n = ~sys_clk_n;

//    // 2. Clock 156.25 MHz Fisik SFP+
//    always #3.2 mgtrefclk_p = ~mgtrefclk_p;
//    always #3.2 mgtrefclk_n = ~mgtrefclk_n;

//    // --- PEMASANGAN KABEL FIBER VIRTUAL (LOOPBACK) ---
//    always @(*) begin
//        // Loopback Sektor PC Ethernet (Channel 0)
//        RXP_IN[0] = TXP_OUT[0];
//        RXN_IN[0] = TXN_OUT[0];
        
//        // Loopback Sektor FSO Jembatan (Channel 1)
//        RXP_IN[1] = TXP_OUT[1];
//        RXN_IN[1] = TXN_OUT[1];
        
//        // Ground untuk SFP+ yang tidak terpakai
//        RXP_IN[3:2] = 2'b00;
//        RXN_IN[3:2] = 2'b11;
//    end

//    // --- SKENARIO INISIALISASI ---
//    initial begin
//        sys_clk_p   = 0;
//        sys_clk_n   = 1;
//        mgtrefclk_p = 0;
//        mgtrefclk_n = 1;

//        $display("Waktu %0t: Power On Top Level System...", $time);
        
//        // Jeda waktu yang panjang untuk membiarkan PLL dan MMCM stabil
//        #25000;
        
//        $display("Waktu %0t: Mengamati Stabilitas Sinyal...", $time);
//    end

//endmodule