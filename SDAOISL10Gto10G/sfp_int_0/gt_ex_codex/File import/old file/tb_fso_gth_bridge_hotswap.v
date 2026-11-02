`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Deskripsi: Testbench Loopback untuk GTH FSO 64b/66b
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

    // --- INSTANSiasi DUT (Device Under Test) ---
    fso_gth_bridge_hotswap uut (
        .clk_312_5(clk_312_5),
        .clk_100_drp(clk_100_drp),
        .sys_rst_n(sys_rst_n),
        .gt_refclk_p(gt_refclk_p),
        .gt_refclk_n(gt_refclk_n),
        .txp_out(txp_out),
        .txn_out(txn_out),
        .rxp_in(rxp_in),
        .rxn_in(rxn_in),
        .fso_tx_data(fso_tx_data),
        .fso_tx_en(fso_tx_en),
        .fso_rx_data(fso_rx_data),
        .fso_rx_valid(fso_rx_valid),
        .gth_link_up(gth_link_up)
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
    
    // c) Clock Fisik Osilator SFP+ (156.25 MHz -> Periode 6.4 ns)
    always #3.2 gt_refclk_p = ~gt_refclk_p;

    // --- SKENARIO PENGUJIAN ---
    integer i;

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
        // Kita harus menunggu sampai gth_link_up bernilai 1.
        wait(gth_link_up == 1'b1);
        $display("Waktu %0t: GTH Link Up! Memulai transmisi...", $time);
        
        // Jeda stabilitas setelah Lock
        #500;

        // --- MENGIRIM DUMMY FSO FRAME ---
        // Kita kirim 780 siklus (sekitar 3120 Byte, mewakili frame Anda)
        for (i = 0; i < 780; i = i + 1) begin
            @(posedge clk_312_5);
            fso_tx_en   <= 1'b1;
            fso_tx_data <= 32'hAAAA0000 + i; // Data berpola agar mudah dilacak
        end

        // Selesai Kirim, kembali ke Idle
        @(posedge clk_312_5);
        fso_tx_en   <= 1'b0;
        fso_tx_data <= 32'd0;

        // Tunggu data keluar dari RX (ada delay latency dari Gearbox 64b/66b)
        #2000;
        $display("Waktu %0t: Simulasi Selesai.", $time);
        $finish;
    end

endmodule