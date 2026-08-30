`timescale 1ns / 1ps

module tb_eth_tx_back_end_top();
    reg clk;
    reg rst_n;
    reg [31:0] data_in;
    reg        en;
    
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;

    eth_tx_back_end_top uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .en(en),
        .xgmii_txd(xgmii_txd),
        .xgmii_txc(xgmii_txc)
    );

    always #1.6 clk = ~clk; // 312.5 MHz

    integer i;

    initial begin
        clk = 0;
        rst_n = 0;
        data_in = 32'd0;
        en = 0;
        
        #20;
        rst_n = 1;
        #20;

        // Simulasi input dari SDA Decoder (Tepat 1922 Byte = 481 siklus)
        for (i = 0; i < 481; i = i + 1) begin
            @(posedge clk);
            data_in <= 32'hA0A0B0B0 + i; 
            en <= 1'b1;
        end

        // Hentikan pengiriman
        @(posedge clk);
        data_in <= 32'd0;
        en <= 1'b0;

        #100;
        $finish;
    end
endmodule