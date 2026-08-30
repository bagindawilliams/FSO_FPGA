`timescale 1ns / 1ps

module eth_rx_front_end_top(
    input  wire        clk,       // Dari output coreclk IP 10G (312.5 MHz)
    input  wire        rst_n,
    
    // Antarmuka XGMII dari IP 10G
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,
    
    // Output ke SDA Encoder (encoder_top_inst)
    output wire [31:0] data_out,
    output wire        en
);

    // Kabel Internal
    wire [31:0] parsed_data;
    wire        parsed_valid;
    wire [31:0] mac_data;
    wire        mac_valid;

    xgmii_rx_parser u_parser (
        .clk(clk),
        .rst_n(rst_n),
        .xgmii_rxd(xgmii_rxd),
        .xgmii_rxc(xgmii_rxc),
        .parsed_data(parsed_data),
        .parsed_valid(parsed_valid)
    );

    eth_preamble_remover u_remover (
        .clk(clk),
        .rst_n(rst_n),
        .parsed_data(parsed_data),
        .parsed_valid(parsed_valid),
        .mac_data(mac_data),
        .mac_valid(mac_valid)
    );

    eth_mac_segmenter u_segmenter (
        .clk(clk),
        .rst_n(rst_n),
        .mac_data(mac_data),
        .mac_valid(mac_valid),
        .payload_data(data_out),
        .payload_en(en)
    );

endmodule