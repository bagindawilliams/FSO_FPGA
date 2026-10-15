`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Jumbo Frame Stress-Test for SDA OISL 1908B Segmentation.
               Fires two 2000B Jumbo Frames back-to-back to prove:
               1. Strict 1908B geometry cut.
               2. IEEE 802.3 Inter-Packet Gap (IPG) compliance at XGMII.
               3. 4KB Elastic Buffer capability (No dropped packets).
===========================================================================
*/

module tb_eth_rx_front_end_top();

    reg clk;
    reg rst_n;
    reg trigger;
    reg [15:0] target_frame_size;

    // AXI-Stream from Virtual PC
    wire [31:0] gen_tdata;
    wire [3:0]  gen_tkeep;
    wire        gen_tvalid, gen_tlast, gen_tready;

    // Physical XGMII Link
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;

    // FSO Output
    wire [31:0] fso_data_out;
    wire        fso_valid, fso_last;
    reg         fso_ready;

    // Instantiations
    eth_axis_packet_gen u_packet_gen (
        .clk(clk), .rst_n(rst_n), .trigger(trigger), .frame_size_bytes(target_frame_size),
        .m_axis_tdata(gen_tdata), .m_axis_tkeep(gen_tkeep),
        .m_axis_tvalid(gen_tvalid), .m_axis_tlast(gen_tlast), .m_axis_tready(gen_tready)
    );

    xgmii_tx_encoder u_tx_encoder (
        .clk(clk), .rst_n(rst_n),
        .s_axis_tdata(gen_tdata), .s_axis_tkeep(gen_tkeep),
        .s_axis_tvalid(gen_tvalid), .s_axis_tlast(gen_tlast), .s_axis_tready(gen_tready),
        .xgmii_txd(xgmii_txd), .xgmii_txc(xgmii_txc)
    );

    eth_rx_front_end_top #(.RUN_MODE(1)) u_front_end_dut (
        .clk(clk), .rst_n(rst_n),
        .xgmii_rxd(xgmii_txd), .xgmii_rxc(xgmii_txc),
        .fso_data_out(fso_data_out), .fso_valid(fso_valid), .fso_last(fso_last), .fso_ready(fso_ready),
        .refclk_p(1'b0), .refclk_n(1'b0), .reset(1'b0), .dclk(1'b0), .rxp(1'b0), .rxn(1'b0)
    );

    // Clock Generation 312.5 MHz (3.2ns period)
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end
    
    // Payload Cycle Counter (For ETRI Proof)
    reg [15:0] payload_cycle_cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) payload_cycle_cnt <= 16'd0;
        else if (fso_valid && fso_ready) begin
            if (payload_cycle_cnt == 16'd475) payload_cycle_cnt <= 16'd1; 
            else payload_cycle_cnt <= payload_cycle_cnt + 1'b1;
        end else payload_cycle_cnt <= 16'd0;
    end

    // Simulation Scenario
    initial begin
        rst_n     = 1'b0;
        trigger   = 1'b0;
        fso_ready = 1'b1; // Framer is always ready
        target_frame_size = 16'd2000; // Force Jumbo Frame
        
        #100;
        rst_n = 1'b1;
        #50;
        
        $display("\n[%0t] SCENARIO: Firing TWO 2000-Byte Jumbo Frames Back-to-Back...", $time);
        
        // Fire Jumbo 1
        @(posedge clk); trigger = 1'b1; 
        @(posedge clk); trigger = 1'b0; 
        
        // Tunggu hingga generator hampir selesai mentransfer Jumbo 1 ke XGMII Encoder
        // 500 clocks * 3.2ns = 1600ns. Kita fire Jumbo 2 persis saat Jumbo 1 selesai,
        // memaksa XGMII Encoder membentuk IPG secara perangkat keras.
        #1610; 
        
        // Fire Jumbo 2
        @(posedge clk); trigger = 1'b1; 
        @(posedge clk); trigger = 1'b0;
        
        // Biarkan simulasi berjalan cukup lama agar padding selesai
        #6000;
        $display("\n[%0t] SIMULATION COMPLETE.", $time);
        $finish;
    end
endmodule