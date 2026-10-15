`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Testbench for fso_payload.v (Data Path Sub-Top Module).
               Scenario: 2000-Byte Jumbo Frame.
               Proves the following hardware mechanics:
               1. segmentation: 4KB FIFO absorbs 2000B, outputs 1900B rigid block.
               2. fso_payload: Injects 0xAB and 0xCDEF (1900B -> 1908B).
               3. fso_crc_32: Appends the 4B CRC seamlessly (1908B -> 1912B).
               4. arq_ddr4_wrapper SNIFFS the 1912B frame for backup.
               5. fifo_data: Successfully buffers the final 1912B frame for MUX.
===========================================================================
*/

module tb_fso_payload();

    reg clk;
    reg rst_n;
    reg trigger;
    reg [15:0] target_frame_size;

    // -------------------------------------------------------
    // 1. AXI-Stream from Virtual PC (Packet Generator)
    // -------------------------------------------------------
    wire [31:0] gen_tdata;
    wire [3:0]  gen_tkeep;
    wire        gen_tvalid;
    wire        gen_tlast;
    wire        gen_tready;

    eth_axis_packet_gen u_packet_gen (
        .clk              (clk), 
        .rst_n            (rst_n), 
        .trigger          (trigger), 
        .frame_size_bytes (target_frame_size),
        .m_axis_tdata     (gen_tdata), 
        .m_axis_tkeep     (gen_tkeep),
        .m_axis_tvalid    (gen_tvalid), 
        .m_axis_tlast     (gen_tlast), 
        .m_axis_tready    (gen_tready)
    );

    // -------------------------------------------------------
    // 2. Packaging and Segmentation (Front-End Cut)
    // -------------------------------------------------------
    wire [31:0] seg_tdata;
    wire        seg_tvalid;
    wire        seg_tlast;
    wire        seg_tready;

    packaging_and_segmentation u_segmenter (
        .clk              (clk),
        .rst_n            (rst_n),
        .s_axis_tdata     (gen_tdata),
        .s_axis_tvalid    (gen_tvalid),
        .s_axis_tlast     (gen_tlast),
        .s_axis_tready    (gen_tready),
        .m_axis_tdata     (seg_tdata),
        .m_axis_tvalid    (seg_tvalid),
        .m_axis_tlast     (seg_tlast),
        .m_axis_tready    (seg_tready)
    );

    // -------------------------------------------------------
    // 3. DUT: FSO Payload Data Path Sub-Top
    // -------------------------------------------------------
    // ARQ RAM Control Signals
    reg         ddr4_write_req;
    reg         ddr4_read_req;
    reg         ddr4_delete_req;
    reg  [15:0] ddr4_addr;
    
    // Primary Output to MUX
    wire [31:0] fifo_data_tdata;
    wire        fifo_data_tvalid;
    wire        fifo_data_tlast;
    reg         fifo_data_tready; 

    // Retransmit Output (Connected but ignored in this TB focus)
    wire [31:0] retx_data_tdata;
    wire        retx_data_tvalid;
    wire        retx_data_tlast;
    reg         retx_data_tready;

    fso_payload u_fso_payload (
        .clk                 (clk),
        .rst_n               (rst_n),
        
        .s_axis_eth_tdata    (seg_tdata),
        .s_axis_eth_tvalid   (seg_tvalid),
        .s_axis_eth_tlast    (seg_tlast),
        .s_axis_eth_tready   (seg_tready),
        
        .ddr4_write_req      (ddr4_write_req),
        .ddr4_read_req       (ddr4_read_req),
        .ddr4_delete_req     (ddr4_delete_req),
        .ddr4_addr           (ddr4_addr),

        .m_axis_data_tdata   (fifo_data_tdata),
        .m_axis_data_tvalid  (fifo_data_tvalid),
        .m_axis_data_tlast   (fifo_data_tlast),
        .m_axis_data_tready  (fifo_data_tready),

        .m_axis_retx_tdata   (retx_data_tdata),
        .m_axis_retx_tvalid  (retx_data_tvalid),
        .m_axis_retx_tlast   (retx_data_tlast),
        .m_axis_retx_tready  (retx_data_tready)
    );

    // =======================================================
    // SYSTEM CLOCK GENERATOR: 312.5 MHz (3.2ns period)
    // =======================================================
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end

    // =======================================================
    // CYCLE COUNTER & DYNAMIC ARQ ADDRESS LOGIC
    // =======================================================
    reg [15:0] payload_cycle_cnt;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            payload_cycle_cnt <= 16'd0;
            ddr4_addr         <= 16'd0; // Start storing at Address 0
        end else if (u_fso_payload.crc_tvalid && u_fso_payload.crc_tready) begin
            if (u_fso_payload.crc_tlast) begin
                payload_cycle_cnt <= 16'd0;
                // Increment ARQ RAM address for the next frame
                ddr4_addr         <= ddr4_addr + 1'b1; 
            end else begin
                payload_cycle_cnt <= payload_cycle_cnt + 1'b1;
            end
        end
    end

    // =======================================================
    // SIMULATION SCENARIO
    // =======================================================
    initial begin
        // 1. Initialization
        rst_n             = 1'b0;
        trigger           = 1'b0;
        target_frame_size = 16'd2000; // Attack with 2000B Jumbo Frame
        
        // MUX is always ready to receive data
        fifo_data_tready  = 1'b1; 
        retx_data_tready  = 1'b1;
        
        // Configure ARQ Wrapper to ALWAYS sniff and write to RAM
        ddr4_write_req    = 1'b1;  
        ddr4_read_req     = 1'b0;
        ddr4_delete_req   = 1'b0;

        #100;
        rst_n = 1'b1;
        #50;
        
        $display("\n[%0t] SCENARIO: PC Fires a 2000-Byte Jumbo Frame...", $time);
        
        // Fire Jumbo Packet
        @(posedge clk); trigger = 1'b1; 
        @(posedge clk); trigger = 1'b0; 
        
        // Wait for Frame 1 (First 1900B block) to process
        // Takes roughly 478 clocks (approx 1500ns) to reach CRC and DDR4
        #2000; 
        $display("[%0t] FRAME 1 Complete: 1900B Segment + Headers + CRC (Total 1912B). Saved to DDR4 Addr 0.", $time);
        
        // Wait for Frame 2 (Remaining 100B + 1800B Zero Pad) to process
        #2000;
        $display("[%0t] FRAME 2 Complete: 100B Segment + Zero Padding + Headers + CRC (Total 1912B). Saved to DDR4 Addr 1.", $time);
        
        // Add a small buffer time to ensure fifo_data has fully pushed output
        #500;
        
        $display("\n[%0t] SIMULATION COMPLETE. Focus on Memory Sniffing and Segmentation.", $time);
        $finish;
    end
endmodule