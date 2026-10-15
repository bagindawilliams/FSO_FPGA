`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA Encoder Grand Top Module.
               This module integrates the entire Transmission (TX) Data Path
               for the SDA OISL space optical communication architecture.
               
               Physical Data Flow Pipeline:
               1. ethernet_fso_framer : Formats Eth/MGMT into 1912B + 16B Header.
               2. x_gth_logic         : CDC 1 (Clock Domain Crossing - Logic to GTH).
               3. core_tx             : FEC Encoder (Reed-Solomon & Scrambler) -> LPC.
               4. preamble_gen        : Generates 72-bit static optical Preamble.
               5. mux_gearbox_128     : Merges Preamble + LPC into a 128-bit wide bus.
               6. x_logic_gth         : CDC 2 (Clock Domain Crossing - Logic to GTH).
               7. error_inject        : Injects test anomalies at Transceiver speed.
               
               Revision Note:
               - CDC 1 Header interface width dynamically aligned to strictly
                 receive 8-bit formatted streams from the Framer without truncation.
               - Implemented backpressure wiring (cdc1_ready_flag) from CDC 1 
                 to Framer's AXI-Stream interfaces. This enforces data throttling 
                 to prevent FIFO overflow during Zero-Gap continuous streaming.
               - Aligned u_eth_fso_framer to 'clk_gth' so Front-End XGMII,
                 Segmenter, Framer, and CDC 1 Write Side share the same clock.
               - Connected 'gb_keep[15:0]' and 'data_in_dv' between 
                 mux_gearbox_128 and x_logic_gth (CDC 2).
                 
===========================================================================
*/

module sda_encoder (
    // -------------------------------------------------------
    // System Clocks and Reset
    // -------------------------------------------------------
    input  wire        clk_logic, // Slower internal logic clock (e.g., 200 MHz)
    input  wire        clk_gth,   // Fast GTH transceiver clock (e.g., 312.5 MHz)
    input  wire        rst_n,     // Active-low asynchronous reset

    // -------------------------------------------------------
    // Ethernet Input (From Front-End Segmenter / XGMII Parser)
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,

    // -------------------------------------------------------
    // Telemetry & PNT Inputs (From Satellite CPU / Subsystems)
    // -------------------------------------------------------
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

    // -------------------------------------------------------
    // ARQ RX Feedback Inputs (From RX Decoder Path)
    // -------------------------------------------------------
    input  wire [15:0] rx_rxfn_in,      
    input  wire        rx_ack_in,       
    input  wire        rx_ack_valid_in, 

    // -------------------------------------------------------
    // Ultimate FSO Output (To Physical Optics / GTH TX Ports)
    // -------------------------------------------------------
    output wire [31:0] tx_fso_data_out,
    output wire        tx_fso_valid_out,
    output wire        eth_data_error_flag
);

    // =======================================================
    // INTERNAL PIPELINE WIRES (Isolated hardware traces)
    // =======================================================
    
    // 1. Framer to CDC 1 (Bridging the assembly block to sync FIFOs)
    wire [7:0]  framer_hdr_tdata; 
    wire        framer_hdr_tvalid;
    wire        framer_hdr_tlast;
    wire        framer_hdr_tready;

    wire [31:0] framer_fso_tdata;
    wire        framer_fso_tvalid;
    wire        framer_fso_tlast;
    wire        framer_fso_tready;

    // Backpressure Throttle Signal
    wire        cdc1_ready_flag;
    assign framer_hdr_tready = cdc1_ready_flag;
    assign framer_fso_tready = cdc1_ready_flag;

    // 2. CDC 1 to FEC Encoder
    wire        cdc1_hdr_dv;
    wire [7:0]  cdc1_hdr_data;
    wire        cdc1_load_dv;
    wire [63:0] cdc1_load_data;

    // 3. FEC Encoder to Gearbox
    wire        fec_valid;
    wire [95:0] fec_data;

    // 4. Preamble Generator to Gearbox
    wire [71:0] preamble_data;

    // 5. Gearbox to CDC 2
    wire         gb_valid;
    wire [127:0] gb_data;
    wire [15:0]  gb_keep;

    // 6. CDC 2 to Error Injector
    wire        cdc2_valid;
    wire [31:0] cdc2_data;

    // =======================================================
    // INSTANTIATION 1: ETHERNET FSO FRAMER
    // Executes data checking, ARQ logic, payload/mgmt muxing,
    // and calculates cyclic redundancies (CRC-16 & CRC-32).
    // =======================================================
    ethernet_fso_framer u_eth_fso_framer (
        .clk                 (clk_logic),
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
        .m_axis_hdr_tready   (framer_hdr_tready), // Linked to Backpressure
        
        .m_axis_fso_tdata    (framer_fso_tdata),
        .m_axis_fso_tvalid   (framer_fso_tvalid),
        .m_axis_fso_tlast    (framer_fso_tlast),
        .m_axis_fso_tready   (framer_fso_tready), // Linked to Backpressure
        
        .eth_data_error_flag (eth_data_error_flag)
    );

    // =======================================================
    // INSTANTIATION 2: CLOCK DOMAIN CROSSING 1 (x_gth_logic)
    // Synchronizes the decoupled Header (8-bit) and Payload (32-bit) 
    // streams, widening the payload bus to 64-bit for heavy FEC math.
    // Provides 'cdc_ready' to safeguard against FIFO overflow.
    // =======================================================
    x_gth_logic u_cdc_tx_1 (
        .clk_gth             (clk_gth),
        .clk_logic           (clk_logic),
        .rst_n               (rst_n),
        .en_head             (framer_hdr_tvalid),
        .en_load             (framer_fso_tvalid),
        .header_in           (framer_hdr_tdata), 
        .payload_in          (framer_fso_tdata),
        .cdc_ready           (cdc1_ready_flag),   // Throttles Framer throughput
        .header_dv           (cdc1_hdr_dv),
        .header              (cdc1_hdr_data),
        .payload_dv          (cdc1_load_dv),
        .payload             (cdc1_load_data)
    );

    // =======================================================
    // INSTANTIATION 3: FEC ENCODER (core_tx)
    // Applies 2-interleaved Reed-Solomon Encoding and PRBS Scrambling.
    // Combines header and payload, outputting 96-bit LPC frames.
    // =======================================================
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

    // =======================================================
    // INSTANTIATION 4: PREAMBLE GENERATOR
    // Provides the 72-bit static optical synchronization sequence (SFD).
    // =======================================================
    preamble_gen u_preamble_gen (
        .preamble_out        (preamble_data)
    );

    // =======================================================
    // INSTANTIATION 5: MUX GEARBOX 128
    // Merges the 72-bit Preamble and 96-bit LPC into high-speed 128-bit blocks.
    // =======================================================
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

    // =======================================================
    // INSTANTIATION 6: CLOCK DOMAIN CROSSING 2 (x_logic_gth)
    // Bridges the massive 128-bit baseband domain back into the 
    // 32-bit high-frequency GTH transmission domain.
    // =======================================================
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

    // =======================================================
    // INSTANTIATION 7: ERROR INJECTOR
    // Emulates physical channel anomalies and random bit-flips 
    // prior to final optical propagation.
    // =======================================================
    error_inject u_error_injector (
        .clk                 (clk_gth),
        .rst_n               (rst_n),
        .en                  (cdc2_valid),
        .data_in             (cdc2_data),
        .flag                (tx_fso_valid_out),
        .data_out            (tx_fso_data_out)
    );

endmodule