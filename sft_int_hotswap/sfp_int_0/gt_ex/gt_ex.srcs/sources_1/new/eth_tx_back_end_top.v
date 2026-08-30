`timescale 1ns / 1ps

module eth_tx_back_end_top(
    input  wire        clk,
    input  wire        rst_n,
    
    // Input 1922 Byte dari Ethernet Frame Reassembly
    input  wire [31:0] data_in,
    input  wire        en,
    
    // Output ke SFP+ TX (XGMII Format)
    output wire [31:0] xgmii_txd,
    output wire [3:0]  xgmii_txc
);

    wire [63:0] preamble_data;
    wire [31:0] mux_data;
    wire        mux_valid;
    wire [31:0] pack_data;
    wire        pack_valid;

    // 1. Generator Preamble (8 Byte statis)
    eth_preamble_gen u_pre_gen (
        .preamble_sfd(preamble_data)
    );

    // 2. Multiplexer (Menggabungkan 1922 Byte + 8 Byte)
    mux_eth_32 u_mux (
        .clk(clk),
        .rst_n(rst_n),
        .asm_data_in(data_in),
        .asm_valid_in(en),
        .preamble_sfd(preamble_data),
        .eth_data_out(mux_data),
        .eth_valid_out(mux_valid)
    );

    // 3. Packing and Segmentation (Validasi 1930 Byte) -> SESUAI DIAGRAM
    eth_mac_packing_tx u_packing (
        .clk(clk),
        .rst_n(rst_n),
        .mux_data(mux_data),
        .mux_valid(mux_valid),
        .pack_data(pack_data),
        .pack_valid(pack_valid)
    );

    // 4. XGMII Formatter (Menyisipkan Start & Terminate)
    xgmii_tx_formatter u_formatter (
        .clk(clk),
        .rst_n(rst_n),
        .mac_data(pack_data),
        .mac_valid(pack_valid),
        .xgmii_txd(xgmii_txd),
        .xgmii_txc(xgmii_txc)
    );

endmodule