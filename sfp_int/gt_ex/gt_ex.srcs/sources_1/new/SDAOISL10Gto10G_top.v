`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL 10G to 10G Grand Top Module (TX Path Synthesis Ready).
               
               Features:
               1. Fully Synthesizable & Schematic-Ready architecture.
               2. SIM_MODE parameter controls hardware generation via 'generate' 
                  blocks to prevent dead-logic and multi-driver errors.
               3. Connects the full Ethernet RX Front-End to the SDA Encoder.
               4. Exposes final TX output for future GTH Transceiver integration.
===========================================================================
*/

module SDAOISL10Gto10G_top #(
    // =======================================================
    // MASTER CONFIGURATION SWITCH
    // 1 = Simulation Mode (Builds internal packet generator circuits)
    // 0 = Hardware Mode (Relies on SFP+ Physical Pins)
    // =======================================================
    parameter SIM_MODE = 1 
)(
    // -------------------------------------------------------
    // Master Clocks
    // -------------------------------------------------------
    input  wire       sys_clk_p,
    input  wire       sys_clk_n,
    
    // -------------------------------------------------------
    // SFP+ Hardware Ports
    // -------------------------------------------------------
    output wire [1:0] tx_disable,
    input  wire       mgtrefclk_n,
    input  wire       mgtrefclk_p,    
    input  wire [3:0] RXN_IN,
    input  wire [3:0] RXP_IN,
    output wire [3:0] TXN_OUT,
    output wire [3:0] TXP_OUT,
    output wire       fan,
    
    // -------------------------------------------------------
    // Final TX Output (To be connected to GTH TX later)
    // Exposed for Testbench probing and Schematic validation
    // -------------------------------------------------------
    output wire [31:0] tx_fso_data_out,
    output wire        tx_fso_valid_out,
    output wire        eth_data_error_flag
);

    // =======================================================
    // 1. BASIC ASSIGNMENTS
    // =======================================================
    assign tx_disable = 2'b00; // Enable SFP+ Lasers
    assign fan        = 1'b0;  // Fan control
    
    // Global active-low reset abstraction
    wire rst_n = 1'b1; 
    wire eth_reset = ~rst_n;

    // =======================================================
    // 2. CLOCKING SUBSYSTEM
    // =======================================================
    wire sys_clk;
    wire clk_100M;   // Reference clock for various IPs
    wire clk_logic;  // Baseband processing clock
    wire tx0_clk;    // Simulating GTH TX clock (312.5 MHz)

    // Convert differential board clock to single-ended
    IBUFGDS sys_clk_inst (
        .I  (sys_clk_p),
        .IB (sys_clk_n),
        .O  (sys_clk)
    );

    // Mixed-Mode Clock Manager (MMCM)
    clk_wiz_0 clk_wiz_0_inst (
        .clk_in1  (sys_clk),
        .clk_out1 (clk_100M),
        .clk_out2 (clk_logic),
        .clk_out3 (tx0_clk)
    );

    // =======================================================
    // 3. INGRESS: SIMULATION GENERATOR vs HARDWARE ROUTING
    // Using generate block ensures clean synthesis based on mode.
    // =======================================================
    wire [31:0] xgmii_txd_in;
    wire [3:0]  xgmii_txc_in;

    generate
        if (SIM_MODE == 1) begin : gen_sim_mode
            // --- BUILD SIMULATION CIRCUITS ---
            wire        trigger_en;
            wire [31:0] gen_axis_tdata;
            wire [3:0]  gen_axis_tkeep;
            wire        gen_axis_tvalid;
            wire        gen_axis_tlast;
            wire        gen_axis_tready;

            // Trigger generator
            autorun autorun_inst (
                .clk   (tx0_clk),
                .rst_n (rst_n),
                .flag  (trigger_en) 
            );

            // AXI-Stream Packet Generator (e.g., 2000B Jumbo)
            eth_axis_packet_gen packet_gen_inst (
                .clk              (tx0_clk),
                .rst_n            (rst_n),
                .trigger          (trigger_en),
                .frame_size_bytes (16'd2000), 
                .m_axis_tdata     (gen_axis_tdata),
                .m_axis_tkeep     (gen_axis_tkeep),
                .m_axis_tvalid    (gen_axis_tvalid),
                .m_axis_tlast     (gen_axis_tlast),
                .m_axis_tready    (gen_axis_tready)
            );

            // AXI-Stream to XGMII Physical format
            xgmii_tx_encoder xgmii_encoder_inst (
                .clk              (tx0_clk),
                .rst_n            (rst_n),
                .s_axis_tdata     (gen_axis_tdata),
                .s_axis_tkeep     (gen_axis_tkeep),
                .s_axis_tvalid    (gen_axis_tvalid),
                .s_axis_tlast     (gen_axis_tlast),
                .s_axis_tready    (gen_axis_tready),
                .xgmii_txd        (xgmii_txd_in),
                .xgmii_txc        (xgmii_txc_in)
            );
        end else begin : gen_hw_mode
            // --- HARDWARE MODE ---
            // Ground the simulation wires to prevent floating nets in synthesis.
            // The eth_rx_front_end_top will ignore these and read from SFP+.
            assign xgmii_txd_in = 32'd0;
            assign xgmii_txc_in = 4'd0;
        end
    endgenerate

    // =======================================================
    // 4. INGRESS: ETHERNET RX FRONT-END
    // Handles XGMII parsing, Preamble stripping, and Segmentation.
    // Passes RUN_MODE parameter downwards.
    // =======================================================
    wire [31:0] seg_axis_tdata;
    wire        seg_axis_tvalid;
    wire        seg_axis_tlast;
    wire        seg_axis_tready;

    eth_rx_front_end_top #(
        .RUN_MODE(SIM_MODE)
    ) front_end_inst (
        .clk            (tx0_clk),
        .rst_n          (rst_n),
        
        // Logical Inputs (Used if SIM_MODE=1)
        .xgmii_rxd      (xgmii_txd_in),  
        .xgmii_rxc      (xgmii_txc_in),
        
        // AXI-Stream Output downstream to SDA Encoder
        .fso_data_out   (seg_axis_tdata),     
        .fso_valid      (seg_axis_tvalid),
        .fso_last       (seg_axis_tlast),
        .fso_ready      (seg_axis_tready),
        
        // Physical Hardware Ports (Used if SIM_MODE=0)
        .refclk_p       (mgtrefclk_p),
        .refclk_n       (mgtrefclk_n),
        .reset          (eth_reset),
        .dclk           (clk_100M),
        .rxp            (RXP_IN[0]),    
        .rxn            (RXN_IN[0])
    );

    // =======================================================
    // 5. TX BASEBAND: SDA ENCODER
    // The core transmission engine integrating ARQ, FEC, CDC, etc.
    // =======================================================
    sda_encoder sda_encoder_inst (
        .clk_logic           (clk_logic), 
        .clk_gth             (tx0_clk),   
        .rst_n               (rst_n),
        
        // Payload Input from Segmenter
        .s_axis_eth_tdata    (seg_axis_tdata),
        .s_axis_eth_tvalid   (seg_axis_tvalid),
        .s_axis_eth_tlast    (seg_axis_tlast),
        .s_axis_eth_tready   (seg_axis_tready),
        
        // Fixed Telemetry & PNT Inputs (Tied to defaults for now)
        .mgmt_trigger_1hz    (1'b0),
        .rx_phy_ts_sec       (6'd15),
        .rx_phy_ts_picosec   (40'd16678204759),
        .tx_phy_ts_sec       (6'd15),
        .tx_phy_ts_picosec   (40'd0),
        .range_meters        (64'h4153_12D0_0000_0000),
        .range_ts_sec        (32'd1476000000),
        .range_ts_picosec    (40'd0),
        .ts_valid            (1'b1),
        .tod_seconds_in      (6'd0), 
        .fcch_opcode         (4'd0),    
        .fcch_pl             (16'd0),        
        
        // ARQ Feedback Interfaces (Tied off for TX isolation)
        .rx_rxfn_in          (16'd0),      
        .rx_ack_in           (1'b0),       
        .rx_ack_valid_in     (1'b0), 
        
        // Final Outputs to external pins / GTH logic
        .tx_fso_data_out     (tx_fso_data_out),
        .tx_fso_valid_out    (tx_fso_valid_out),
        .eth_data_error_flag (eth_data_error_flag)
    );

    // Temporary tie-off for unused TX output pins
    assign TXP_OUT = 4'b0000;
    assign TXN_OUT = 4'b0000;

endmodule