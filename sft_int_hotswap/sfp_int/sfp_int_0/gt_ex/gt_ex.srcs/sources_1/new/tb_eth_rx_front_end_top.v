`timescale 1ns / 1ps

module tb_eth_rx_front_end_top();

    // =========================================================================
    // Sinyal Kendali Simulasi
    // =========================================================================
    reg clk;
    reg rst_n;
    reg trigger;
    
    // [FITUR BARU] Penghitung Siklus Clock Global untuk Vivado Waveform
    reg [31:0] sim_cycle_cnt;

    // =========================================================================
    // Kabel Penghubung (Kabel Virtual XGMII)
    // =========================================================================
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;

    // =========================================================================
    // Sinyal Output dari Front-End (Menuju Encoder)
    // =========================================================================
    wire [31:0] payload_data;
    wire        payload_en;
    
    wire [47:0] debug_dest_mac;
    wire [47:0] debug_src_mac;

    // =========================================================================
    // 1. Instansiasi Generator Paket (Aktor Pengganti PC / NIC X520)
    // =========================================================================
    xgmii_packet_gen u_pc_virtual (
        .clk(clk),
        .rst_n(rst_n),
        .trigger(trigger),
        .xgmii_txd(xgmii_txd),   
        .xgmii_txc(xgmii_txc)
    );

    // =========================================================================
    // 2. Instansiasi Device Under Test (DUT)
    // =========================================================================
    eth_rx_front_end_top u_dut (
        .clk(clk),
        .rst_n(rst_n),
        .xgmii_rxd(xgmii_txd),   
        .xgmii_rxc(xgmii_txc),
        .data_out(payload_data), 
        .en(payload_en),
        .debug_dest_mac(debug_dest_mac),
        .debug_src_mac(debug_src_mac)
    );

    // =========================================================================
    // 3. Pembangkit Detak (Clock Generation) - 312.5 MHz
    // =========================================================================
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk;
    end
    
    // Logic Penghitung Siklus Clock Simulasi
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            sim_cycle_cnt <= 32'd0;
        else 
            sim_cycle_cnt <= sim_cycle_cnt + 1'b1;
    end

    // =========================================================================
    // 4. Skenario Simulasi (Main Thread)
    // =========================================================================
    initial begin
        rst_n   = 1'b0;
        trigger = 1'b0;
        
        #100;
        rst_n   = 1'b1;
        #20;
        
        $display("[%0t] Simulasi Dimulai: Menembakkan Trigger...", $time);
        
        @(posedge clk);
        trigger = 1'b1; 
        @(posedge clk);
        trigger = 1'b0; 
        
        #3000;
        
        $display("[%0t] Simulasi Selesai.", $time);
        $finish;
    end

endmodule