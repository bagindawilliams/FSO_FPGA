`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Deskripsi: Testbench Loopback untuk GTH FSO 64b/66b
//
// Revision History:
//   - Rev 1.0 (Initial) : Single-frame GTH 64B/66B loopback testbench.
//   - Rev 2.0 (2026-10-27 15:20 KST) : [Target B1.2/B1.3 & Modular GTH Alignment]
//     1. Replaced legacy 'fso_gth_bridge_hotswap' wrapper with the 3 active 
//        modular GTH blocks (gth64b66b_tx + fso_gth_core_wrapper + gth64b66b_rx)
//        while preserving all original top-level testbench signals.
//     2. Injected the official SDA OISL Table 2-8 72-bit Preamble 
//        (72'h77_AD_5B_58_43_64_1E_2E_26 -> Word 0 = 32'h77AD_5B58, Word 1 = 
//        32'h4364_1E2E, Word 2 = 32'h26AA_AA02) at the start of the 780-cycle 
//        frame so u_fso_gth_core and u_gth64b66b_rx trigger and lock cleanly.
//////////////////////////////////////////////////////////////////////////////////

module tb_fso_gth_bridge_hotswap();

    // 1. Deklarasi Sinyal Motherboard (Clock & Reset)
    reg clk_312_5;
    reg clk_100_drp;
    reg gt_refclk_p;
    wire gt_refclk_n;
    reg sys_rst_n;

    // 2. Deklarasi Sinyal Kabel Fiber Optik (Loopback)
    wire txp_out;
    wire txn_out;
    wire rxp_in;
    wire rxn_in;

    // 3. Antarmuka Data TX dan RX
    reg  [31:0] fso_tx_data;
    reg         fso_tx_en;
    wire [31:0] fso_rx_data;
    wire        fso_rx_valid;
    wire        gth_link_up;

    // --- KONEKSI INTERNAL MODULAR GTH 64B/66B (Menggantikan fso_gth_bridge_hotswap) ---
    wire        tx0_clk;
    wire        rx0_clk;
    wire        gth_tx_ready;
    wire        gth_rx_ready;
    wire        rx_block_locked;
    wire        tx_stall_unused;
    wire [31:0] gt_txdata_int;
    wire [5:0]  gt_txheader_int;
    wire [6:0]  gt_txsequence_int;
    wire [31:0] gt_rxdata_int;
    wire [1:0]  gt_rxdatavalid_int;
    wire [5:0]  gt_rxheader_int;
    wire [1:0]  gt_rxheadervalid_int;
    wire [1:0]  gt_rxstartofseq_int;
    wire        gt_rxgearboxslip_int;

    gth64b66b_tx u_gth64b66b_tx (
        .clk_312_5         (clk_312_5),
        .clk_gth           (tx0_clk),
        .rst_n             (sys_rst_n),
        .gth_tx_ready      (gth_tx_ready),
        .up_data_in        (fso_tx_data),
        .up_valid_in       (fso_tx_en),
        .tx_stall_out      (tx_stall_unused),
        .gt_txdata_out     (gt_txdata_int),
        .gt_txheader_out   (gt_txheader_int),
        .gt_txsequence_out (gt_txsequence_int)
    );

    fso_gth_core_wrapper u_fso_gth_core (
        .clk_100_freerun      (clk_100_drp),
        .sys_rst_n            (sys_rst_n),
        .gt_refclk_p          (gt_refclk_p),
        .gt_refclk_n          (gt_refclk_n),
        .txp_out              (txp_out),
        .txn_out              (txn_out),
        .rxp_in               (rxp_in),
        .rxn_in               (rxn_in),
        .tx0_clk              (tx0_clk),
        .rx0_clk              (rx0_clk),
        .gth_tx_ready         (gth_tx_ready),
        .gth_rx_ready         (gth_rx_ready),
        .gth_link_up          (gth_link_up),
        .gt_txdata_in         (gt_txdata_int),
        .gt_txheader_in       (gt_txheader_int),
        .gt_txsequence_in     (gt_txsequence_int),
        .gt_rxdata_out        (gt_rxdata_int),
        .gt_rxdatavalid_out   (gt_rxdatavalid_int),
        .gt_rxheader_out      (gt_rxheader_int),
        .gt_rxheadervalid_out (gt_rxheadervalid_int),
        .gt_rxstartofseq_out  (gt_rxstartofseq_int),
        .gt_rxgearboxslip_in  (gt_rxgearboxslip_int)
    );

    gth64b66b_rx u_gth64b66b_rx (
        .clk_gth              (rx0_clk),
        .clk_312_5            (clk_312_5),
        .rst_n                (sys_rst_n),
        .gth_rx_ready         (gth_rx_ready),
        .gt_rxdata_in         (gt_rxdata_int),
        .gt_rxdatavalid_in    (gt_rxdatavalid_int),
        .gt_rxheader_in       (gt_rxheader_int),
        .gt_rxheadervalid_in  (gt_rxheadervalid_int),
        .gt_rxgearboxslip_out (gt_rxgearboxslip_int),
        .rx_block_locked      (rx_block_locked),
        .down_data            (fso_rx_data),
        .down_dv              (fso_rx_valid)
    );

    // --- PEMASANGAN KABEL FIBER VIRTUAL (LOOPBACK) ---
    // Sinyal laser yang keluar dari TX langsung kita paksa masuk ke RX
    assign rxp_in = txp_out;
    assign rxn_in = txn_out;

    // Sinyal differential N selalu kebalikan dari P
    assign gt_refclk_n = ~gt_refclk_p;

    // --- GENERATOR CLOCK MULTIPLE ---
    // a) Clock Internal FPGA (312.5 MHz -> Periode 3.2 ns)
    always #1.6 clk_312_5 = ~clk_312_5;
    
    // b) Clock DRP/Free-running (100 MHz -> Periode 10 ns)
    always #5.0 clk_100_drp = ~clk_100_drp;
    
    // c) Clock Fisik Osilator SFP+ (Scaled #3.103 -> 322.265625 MHz tx0_clk/rx0_clk)
    always #3.103 gt_refclk_p = ~gt_refclk_p;

    // --- SKENARIO PENGUJIAN ---
    integer i;
    integer rx_word_cnt = 0;

    always @(posedge clk_312_5) begin
        if (fso_rx_valid) begin
            if (rx_word_cnt == 0)
                $display("Waktu %0t: Kata Pertama Diterima di RX = 0x%08X (Expected: 0x77AD5B58)", $time, fso_rx_data);
            rx_word_cnt <= rx_word_cnt + 1;
        end
    end

    initial begin
        // Kondisi Awal (Mati)
        clk_312_5   = 0;
        clk_100_drp = 0;
        gt_refclk_p = 0;
        sys_rst_n   = 0;
        fso_tx_data = 32'd0;
        fso_tx_en   = 0;

        // Nyalakan Power (Reset Dilepas)
        #100;
        sys_rst_n = 1;
        $display("Waktu %0t: Power On, menunggu GTH PLL Lock...", $time);

        // CATATAN PENTING: Model GTH butuh waktu lama untuk Lock di simulasi!
        // Kita harus menunggu sampai gth_link_up dan rx_block_locked bernilai 1.
        wait(gth_link_up == 1'b1);
        $display("Waktu %0t: GTH Link Up! Menunggu 64B/66B Gearbox Block Lock...", $time);
        wait(rx_block_locked == 1'b1);
        $display("Waktu %0t: 64B/66B Gearbox Locked! Memulai transmisi...", $time);
        
        // Jeda stabilitas setelah Lock
        #500;

        // --- MENGIRIM DUMMY FSO FRAME (Diawali Preamble Resmi 72'h77AD5B5843641E2E26) ---
        // Kita kirim 780 siklus (sekitar 3120 Byte, mewakili frame Anda)
        for (i = 0; i < 780; i = i + 1) begin
            @(posedge clk_312_5);
            fso_tx_en <= 1'b1;
            if      (i == 0) fso_tx_data <= 32'h77AD_5B58; // Byte 1..4 Preamble SDA OISL
            else if (i == 1) fso_tx_data <= 32'h4364_1E2E; // Byte 5..8 Preamble SDA OISL
            else if (i == 2) fso_tx_data <= 32'h26AA_AA02; // Byte 9 Preamble (0x26) + LPC
            else             fso_tx_data <= 32'hAAAA0000 + i; // Data berpola agar mudah dilacak
        end

        // Selesai Kirim, kembali ke Idle
        @(posedge clk_312_5);
        fso_tx_en   <= 1'b0;
        fso_tx_data <= 32'd0;

        // Tunggu data keluar dari RX (ada delay latency dari Gearbox 64b/66b)
        #3000;
        $display("Waktu %0t: Simulasi Selesai. Total Kata Diterima di RX = %0d / 780.", $time, rx_word_cnt);
        $finish;
    end

endmodule