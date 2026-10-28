`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA Encoder Grand Top Module.
===========================================================================
*/

module sda_encoder #(
    parameter SIM_MODE = 1
)(
    input  wire        clk_logic, // 200.0 MHz
    input  wire        clk_gth,   // 312.5 MHz Continuous Clock
    input  wire        rst_n,

    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,

    input  wire        mgmt_trigger_1hz,
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,
    input  wire [5:0]  tod_seconds_in, 
    input  wire [3:0]  fcch_opcode,    
    input  wire [15:0] fcch_pl,        

    input  wire [15:0] rx_rxfn_in,      
    input  wire        rx_ack_in,       
    input  wire        rx_ack_valid_in, 

    output wire [31:0] tx_fso_data_out,
    output wire        tx_fso_valid_out,
    output wire        eth_data_error_flag
);

    wire [7:0]   framer_hdr_tdata; 
    wire         framer_hdr_tvalid;
    wire         framer_hdr_tlast;
    wire         framer_hdr_tready;

    wire [31:0]  framer_fso_tdata;
    wire         framer_fso_tvalid;
    wire         framer_fso_tlast;
    wire         framer_fso_tready;

    wire         cdc1_ready_flag;
    assign framer_hdr_tready = cdc1_ready_flag;
    assign framer_fso_tready = cdc1_ready_flag;

    wire         cdc1_hdr_dv;
    wire [7:0]   cdc1_hdr_data;
    wire         cdc1_load_dv;
    wire [63:0]  cdc1_load_data;

    wire         fec_valid;
    wire [95:0]  fec_data;

    wire [71:0]  preamble_data;

    wire         gb_valid;
    wire [127:0] gb_data;
    wire [15:0]  gb_keep;

    wire         cdc2_valid;
    wire [31:0]  cdc2_data;

    ethernet_fso_framer u_eth_fso_framer (
        .clk                 (clk_gth),
        .rst_n               (rst_n),
        .s_axis_eth_tdata    (s_axis_eth_tdata),
        .s_axis_eth_tvalid   (s_axis_eth_tvalid),
        .s_axis_eth_tlast    (s_axis_eth_tlast),
        .s_axis_eth_tready   (s_axis_eth_tready),
        .mgmt_trigger_1hz    (mgmt_trigger_1hz),
        .rx_phy_ts_sec       (rx_phy_ts_sec),
        .rx_phy_ts_picosec   (rx_phy_ts_picosec),
        .tx_phy_ts_sec       (tx_phy_ts_sec),
        .tx_phy_ts_picosec   (tx_phy_ts_picosec),
        .range_meters        (range_meters),
        .range_ts_sec        (range_ts_sec),
        .range_ts_picosec    (range_ts_picosec),
        .ts_valid            (ts_valid),
        .tod_seconds_in      (tod_seconds_in),
        .fcch_opcode         (fcch_opcode),
        .fcch_pl             (fcch_pl),
        .rx_rxfn_in          (rx_rxfn_in),
        .rx_ack_in           (rx_ack_in),
        .rx_ack_valid_in     (rx_ack_valid_in),
        .m_axis_hdr_tdata    (framer_hdr_tdata),
        .m_axis_hdr_tvalid   (framer_hdr_tvalid),
        .m_axis_hdr_tlast    (framer_hdr_tlast),
        .m_axis_hdr_tready   (framer_hdr_tready),
        .m_axis_fso_tdata    (framer_fso_tdata),
        .m_axis_fso_tvalid   (framer_fso_tvalid),
        .m_axis_fso_tlast    (framer_fso_tlast),
        .m_axis_fso_tready   (framer_fso_tready),
        .eth_data_error_flag (eth_data_error_flag)
    );

    x_gth_logic u_cdc_tx_1 (
        .clk_gth             (clk_gth),
        .clk_logic           (clk_logic),
        .rst_n               (rst_n),
        .en_head             (framer_hdr_tvalid),
        .en_load             (framer_fso_tvalid),
        .header_in           (framer_hdr_tdata), 
        .payload_in          (framer_fso_tdata),
        .cdc_ready           (cdc1_ready_flag),
        .header_dv           (cdc1_hdr_dv),
        .header              (cdc1_hdr_data),
        .payload_dv          (cdc1_load_dv),
        .payload             (cdc1_load_data)
    );

    core_tx u_encoder_fec (
        .clk                 (clk_logic),
        .rst_n               (rst_n),
        .en_head             (cdc1_hdr_dv),
        .en_load             (cdc1_load_dv),
        .header              (cdc1_hdr_data),
        .payload             (cdc1_load_data),
        .flag                (fec_valid),
        .data_out            (fec_data)
    );

    preamble_gen u_preamble_gen (
        .preamble_out        (preamble_data)
    );

    mux_gearbox_128 u_mux_gearbox (
        .clk                 (clk_logic),
        .rst_n               (rst_n),
        .preamble_data       (preamble_data),
        .lpc_data            (fec_data),
        .lpc_valid           (fec_valid),
        .cdc_data            (gb_data),
        .cdc_valid           (gb_valid),
        .cdc_keep            (gb_keep)
    );

    x_logic_gth u_cdc_tx_2 (
        .clk_gth             (clk_gth),
        .clk_logic           (clk_logic),
        .rst_n               (rst_n),
        .en                  (1'b1),
        .data_in             (gb_data),
        .data_in_dv          (gb_valid),
        .cdc_keep            (gb_keep),
        .flag                (cdc2_valid),
        .data_out            (cdc2_data)
    );

    error_inject #(
        .SIM_MODE            (SIM_MODE)
    ) u_error_injector (
        .clk                 (clk_gth),
        .rst_n               (rst_n),
        .en                  (cdc2_valid),
        .data_in             (cdc2_data),
        .flag                (tx_fso_valid_out),
        .data_out            (tx_fso_data_out)
    );

endmodule