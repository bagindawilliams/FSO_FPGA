`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Multi-Packet "Hello World!" untuk Front-End Ethernet RX
//////////////////////////////////////////////////////////////////////////////////

module tb_eth_rx_hello_world();

    reg clk;
    reg rst_n;
    reg [31:0] xgmii_rxd;
    reg [3:0]  xgmii_rxc;
    
    wire [31:0] data_out;
    wire        en;

    // Instansiasi DUT (Device Under Test)
    eth_rx_front_end_top uut (
        .clk(clk),
        .rst_n(rst_n),
        .xgmii_rxd(xgmii_rxd),
        .xgmii_rxc(xgmii_rxc),
        .data_out(data_out),
        .en(en)
    );

    // Clock 312.5 MHz (Periode 3.2 ns)
    always #1.6 clk = ~clk;

    integer j;

    // -------------------------------------------------------------------------
    // TASK: Prosedur Pengiriman 1 Paket "Hello World!" + Padding
    // -------------------------------------------------------------------------
    task send_hello_world_packet;
    begin
        // 1. Start (0xFB) + Sebagian Preamble
        @(posedge clk);
        xgmii_rxd = 32'h555555FB; xgmii_rxc = 4'b0001;
        
        // 2. Sisa Preamble + SFD (0xD5)
        @(posedge clk);
        xgmii_rxd = 32'hD5555555; xgmii_rxc = 4'b0000;
        
        // 3. Payload: "Hell"
        @(posedge clk);
        xgmii_rxd = 32'h6C6C6548; xgmii_rxc = 4'b0000;
        
        // 4. Payload: "o Wo"
        @(posedge clk);
        xgmii_rxd = 32'h6F57206F; xgmii_rxc = 4'b0000;
        
        // 5. Payload: "rld!"
        @(posedge clk);
        xgmii_rxd = 32'h21646C72; xgmii_rxc = 4'b0000;
        
        // 6. Padding Otomatis dari PC
        // Standar Ethernet mewajibkan minimal paket 64 Byte.
        // Kita tambahkan 10 siklus padding nol (40 Byte) untuk meniru PC sungguhan.
        for (j = 0; j < 10; j = j + 1) begin
            @(posedge clk);
            xgmii_rxd = 32'h00000000; xgmii_rxc = 4'b0000;
        end
        
        // 7. Terminate (0xFD) menutup paket
        @(posedge clk);
        xgmii_rxd = 32'h070707FD; xgmii_rxc = 4'b1111;
        
        // 8. Kembali ke mode Idle
        @(posedge clk);
        xgmii_rxd = 32'h07070707; xgmii_rxc = 4'b1111;
    end
    endtask

    // -------------------------------------------------------------------------
    // SKENARIO UTAMA
    // -------------------------------------------------------------------------
    initial begin
        // Reset & Inisialisasi
        clk = 0;
        rst_n = 0;
        xgmii_rxd = 32'h07070707; 
        xgmii_rxc = 4'b1111;
        
        #20;
        rst_n = 1;
        #20;

        // Tembakkan Paket 1
        $display("Waktu %0t: Mengirim Paket 1 (Hello World!)...", $time);
        send_hello_world_packet();

        // Jeda Inter-Frame Gap (Meniru PC istirahat sejenak)
        repeat(15) @(posedge clk);

        // Tembakkan Paket 2
        $display("Waktu %0t: Mengirim Paket 2 (Hello World!)...", $time);
        send_hello_world_packet();

        // Jeda Inter-Frame Gap
        repeat(20) @(posedge clk);

        // Tembakkan Paket 3
        $display("Waktu %0t: Mengirim Paket 3 (Hello World!)...", $time);
        send_hello_world_packet();

        #50;
        $finish;
    end

endmodule