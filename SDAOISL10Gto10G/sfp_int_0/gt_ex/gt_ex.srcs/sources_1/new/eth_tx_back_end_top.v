`timescale 1ns / 1ps

module eth_tx_back_end_top(
    input  wire        clk,
    input  wire        rst_n,
    
    // Input 1922 Byte dari Ethernet Frame Reassembly
    input  wire [31:0] data_in,
    input  wire        en,
    
    // Output menuju Simulasi Testbench
    output wire [31:0] xgmii_txd,
    output wire [3:0]  xgmii_txc,

    // Port SFP+ & Clocking Fisik untuk IP Core
    input  wire        refclk_p,
    input  wire        refclk_n,
    input  wire        reset,
    input  wire        dclk,
    output wire        txp,
    output wire        txn
);

    wire [63:0] preamble_data;
    wire [31:0] mux_data;
    wire        mux_valid;
    wire [31:0] pack_data;
    wire        pack_valid;
    
    wire [31:0] xgmii_txd_wire;
    wire [3:0]  xgmii_txc_wire;

    // 1. Generator Preamble (8 Byte)
    eth_preamble_gen u_pre_gen (
        .preamble_sfd(preamble_data)
    );

    // 2. Multiplexer
    mux_eth_32 u_mux (
        .clk(clk),
        .rst_n(rst_n),
        .asm_data_in(data_in),
        .asm_valid_in(en),
        .preamble_sfd(preamble_data),
        .eth_data_out(mux_data),
        .eth_valid_out(mux_valid)
    );

    // 3. Packing and Segmentation
    eth_mac_packing_tx u_packing (
        .clk(clk),
        .rst_n(rst_n),
        .mux_data(mux_data),
        .mux_valid(mux_valid),
        .pack_data(pack_data),
        .pack_valid(pack_valid)
    );

    // 4. XGMII Formatter 
    xgmii_tx_formatter u_formatter (
        .clk(clk),
        .rst_n(rst_n),
        .mac_data(pack_data),
        .mac_valid(pack_valid),
        .xgmii_txd(xgmii_txd_wire),
        .xgmii_txc(xgmii_txc_wire)
    );

    // CABANG 1: Teruskan ke pin output untuk Testbench Simulasi
    assign xgmii_txd = xgmii_txd_wire;
    assign xgmii_txc = xgmii_txc_wire;

    // =========================================================================
    // CABANG 2: IP Core 10G Ethernet PCS/PMA (Pemancar Optik SFP+)
    // =========================================================================
    eth_10g_pcs_pma_tx_0 physical_mac_tx_inst (
        .refclk_p           (refclk_p),
        .refclk_n           (refclk_n),
        .reset              (reset),
        .dclk               (dclk),
        .txp                (txp),
        .txn                (txn),
        .rxp                (1'b0), 
        .rxn                (1'b0), 
        .xgmii_txd          (xgmii_txd_wire), // Disuntik langsung dari Formatter
        .xgmii_txc          (xgmii_txc_wire), 
        .xgmii_rxd          (),
        .xgmii_rxc          (),
        .sim_speedup_control(1'b0),
        .mdc                (1'b0),
        .mdio_in            (1'b0),
        .prtad              (5'd0),
        .signal_detect      (1'b1),
        .tx_fault           (1'b0),
        .pma_pmd_type       (3'b000)
    );

endmodule