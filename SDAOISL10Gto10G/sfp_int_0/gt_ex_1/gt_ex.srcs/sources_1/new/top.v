`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab Kookmin University
// Engineer: Williamsyah Baginda Miraj
// Deskripsi: Top-Level Module End-to-End (SDA OISL 10G Architecture)
//////////////////////////////////////////////////////////////////////////////////

module top 
(
    input         sys_clk_p,
    input         sys_clk_n,
    output [1:0]  tx_disable,
    input         mgtrefclk_n,
    input         mgtrefclk_p,    
    input [3:0]   RXN_IN,
    input [3:0]   RXP_IN,
    output[3:0]   TXN_OUT,
    output[3:0]   TXP_OUT,
    output        fan
);

    // =========================================================================
    // SAKELAR MODE UTAMA (MASTER SWITCH)
    // 1 = Mode Simulasi (Menggunakan xgmii_packet_gen internal)
    // 0 = Mode Hardware (Menggunakan IP Core SFP+ untuk uji Python UDP)
    // =========================================================================
    localparam SIM_MODE = 1; 

    assign tx_disable = 2'd0;
    assign fan        = 1'b0;
    wire   rst_n      = 1'b1;

    // SISTEM CLOCKING
    wire sys_clk;
    wire clk_100M;
    wire clk_logic;

    IBUFGDS sys_clk_inst (
        .I  (sys_clk_p),
        .IB (sys_clk_n),
        .O  (sys_clk)
    );

    clk_wiz_0 clk_wiz_0_inst (
        .clk_in1  (sys_clk),
        .clk_out1 (clk_100M),
        .clk_out2 (clk_logic)
    );

    wire tx0_clk; 
    wire rx0_clk; 

    // KABEL PENGHUBUNG ANTAR MODUL
    wire        trigger_en;
    wire [31:0] xgmii_txd_in;
    wire [3:0]  xgmii_txc_in;
    
    wire [31:0] seg_data;
    wire        seg_valid;
    wire [31:0] enc_data;
    wire        enc_valid;
    wire [31:0] err_data;
    wire        err_valid;
    
    wire [31:0] gt_tx_data;
    wire [3:0]  gt_tx_ctrl;
    wire [31:0] gt_rx_data;
    wire [3:0]  gt_rx_ctrl;

    wire [31:0] rec_data_align;
    wire [3:0]  rec_ctrl_align;
    wire        rec_valid;
    wire [31:0] dec_data;
    wire        dec_valid;

    wire [31:0] xgmii_rxd_out;
    wire [3:0]  xgmii_rxc_out;

    // GENERATOR PAKET (Akan diabaikan oleh sistem jika SIM_MODE = 0)
    autorun autorun_inst (
        .clk   (tx0_clk),
        .rst_n (rst_n),
        .flag  (trigger_en) 
    );

    xgmii_packet_gen packet_gen_inst (
        .clk       (tx0_clk),
        .rst_n     (rst_n),
        .trigger   (trigger_en),
        .xgmii_txd (xgmii_txd_in),
        .xgmii_txc (xgmii_txc_in)
    );
        
    // =========================================================================
    // INGRESS: XGMII FRONT-END (Menerima parameter SIM_MODE)
    // =========================================================================
    wire eth_reset = ~rst_n;

    eth_rx_front_end_top #(
        .RUN_MODE(SIM_MODE)
    ) front_end_inst (
        .clk            (tx0_clk),
        .rst_n          (rst_n),
        .xgmii_rxd      (xgmii_txd_in),  // Input dari Simulator
        .xgmii_rxc      (xgmii_txc_in),
        .data_out       (seg_data),     
        .en             (seg_valid),
        .debug_dest_mac (),
        .debug_src_mac  (),
        
        // Pengkabelan Port Fisik SFP+ & Clocking untuk IP Core
        .refclk_p       (mgtrefclk_p),
        .refclk_n       (mgtrefclk_n),
        .reset          (eth_reset),
        .dclk           (clk_100M),
        .rxp            (RXP_IN[0]),    // Input SFP+ Hardware
        .rxn            (RXN_IN[0])
    );

    // TX BASEBAND: SDA FRAME ENCODER 
    encoder_top encoder_top_inst (
        .clk_gth   (tx0_clk),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (seg_valid),
        .data_in   (seg_data),
        .flag      (enc_valid),
        .data_out  (enc_data)        
    );

    // ERROR INJECTOR
    error_inject error_inject_inst (
        .clk      (tx0_clk),
        .rst_n    (rst_n),
        .en       (enc_valid),
        .data_in  (enc_data),
        .flag     (err_valid),
        .data_out (err_data)
    );

    // ARQ TX CONTROLLER & GTH TX RESET
    wire gt0_txfsmresetdone, gt0_txfsmresetdone_w;
    
    reset_0 tx_reset_m0 (
       .slowest_sync_clk     (tx0_clk),          
       .ext_reset_in         (gt0_txfsmresetdone),                  
       .aux_reset_in         (1'b0),                  
       .mb_debug_sys_rst     (1'b0),          
       .dcm_locked           (1'b1),                      
       .mb_reset             (),                          
       .bus_struct_reset     (),          
       .peripheral_reset     (gt0_txfsmresetdone_w),          
       .interconnect_aresetn (),  
       .peripheral_aresetn   ()      
    );

    packet_send packet_send_m0 (
        .rst               (gt0_txfsmresetdone_w),
        .tx_clk            (tx0_clk),
        .tx_packet_req     (err_valid),
        .tx_packet_len     (16'd780), 
        .tx_packet_done    (),
        .tx_packet_type    (8),
        .tx_packet_data    (err_data),
        .tx_packet_data_rd (),
        .gt_tx_data        (gt_tx_data),
        .gt_tx_ctrl        (gt_tx_ctrl)
    );

    // PHYSICAL LAYER: GTH TRANSCEIVER (10.3125 Gbps)
    wire gt0_rxfsmresetdone;

    gt_example_top gtx_exdes_m0 (
        .tx0_clk            (tx0_clk),
        .gt0_txfsmresetdone (gt0_txfsmresetdone),
        .gt0_rxfsmresetdone (gt0_rxfsmresetdone),
        .tx0_data           (gt_tx_data),
        .tx0_kchar          (gt_tx_ctrl),   
        
        .rx0_clk            (rx0_clk),
        .rx0_data           (gt_rx_data),
        .rx0_kchar          (gt_rx_ctrl),

        .tx1_clk(), .gt1_txfsmresetdone(), .gt1_rxfsmresetdone(), .tx1_data(32'd0), .tx1_kchar(4'd0), .rx1_clk(), .rx1_data(), .rx1_kchar(),
        .tx2_clk(), .gt2_txfsmresetdone(), .gt2_rxfsmresetdone(), .tx2_data(32'd0), .tx2_kchar(4'd0), .rx2_clk(), .rx2_data(), .rx2_kchar(),
        .tx3_clk(), .gt3_txfsmresetdone(), .gt3_rxfsmresetdone(), .tx3_data(32'd0), .tx3_kchar(4'd0), .rx3_clk(), .rx3_data(), .rx3_kchar(),
                         
        .mgtrefclk_n (mgtrefclk_n),
        .mgtrefclk_p (mgtrefclk_p),
        .hb_gtwiz_reset_clk_freerun_in (clk_100M),
        .hb_gtwiz_reset_all_in         (1'b0),
        
        // Loopback Internal untuk Pengujian Simulasi dipertahankan. 
        // Untuk fisik, data optik melintas via udara/kabel.
        .RXN_IN  (4'b0000), 
        .RXP_IN  (4'b0000), 
        .TXN_OUT (),        
        .TXP_OUT ()
    );   

    // ARQ RX CONTROLLER & GTH RX RESET
    wire gt0_rxfsmresetdone_w;

    reset_0 rx_reset_m0 (
       .slowest_sync_clk     (rx0_clk),          
       .ext_reset_in         (gt0_rxfsmresetdone),                  
       .aux_reset_in         (1'b0),                  
       .mb_debug_sys_rst     (1'b0),          
       .dcm_locked           (1'b1),                      
       .mb_reset             (),                          
       .bus_struct_reset     (),          
       .peripheral_reset     (gt0_rxfsmresetdone_w),          
       .interconnect_aresetn (),  
       .peripheral_aresetn   ()      
    );

    packet_rec packet_rec_m0 (
        .rst                (gt0_rxfsmresetdone_w),
        .rx_clk             (rx0_clk), 
        .rx_data            (gt_rx_data),
        .rx_ctrl            (gt_rx_ctrl),
        .rx_dv              (rec_valid),
        .rx_data_align      (rec_data_align),
        .rx_ctrl_align      (rec_ctrl_align),
        .packet_cnt_o       (),
        .error_packet_cnt_o ()
    );

    // RX BASEBAND: SDA FRAME DECODER 
    decoder_top decoder_top_inst (
        .clk_gth   (rx0_clk),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (rec_valid),
        .data_in   (rec_data_align),
        .flag      (dec_valid),
        .data_out  (dec_data)        
    );

    // =========================================================================
    // EGRESS: XGMII BACK-END
    // =========================================================================
    eth_tx_back_end_top back_end_inst (
        .clk            (rx0_clk),
        .rst_n          (rst_n),
        .data_in        (dec_data),
        .en             (dec_valid),
        .xgmii_txd      (xgmii_rxd_out), 
        .xgmii_txc      (xgmii_rxc_out),

        .refclk_p       (mgtrefclk_p),
        .refclk_n       (mgtrefclk_n),
        .reset          (eth_reset),
        .dclk           (clk_100M),
        .txp            (TXP_OUT[0]), // Output fisik ke PC 2
        .txn            (TXN_OUT[0])
    );

endmodule