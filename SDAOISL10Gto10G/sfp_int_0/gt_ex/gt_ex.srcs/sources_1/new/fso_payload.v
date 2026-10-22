`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL FSO Payload Encapsulation Engine.
               Appends FSO Payload Header (0xAB) and FSO Packet Header (0xCDEF)
               to the incoming 1900-Byte segmented Ethernet payload.
               Output geometrically guaranteed to be exactly 1908 Bytes 
               (477 clock cycles) as dictated by SDA OISL Figure 2-17.
               
               Acts as the primary encapsulation container for Ethernet data.
               Internal Operations:
               1. Injects FSO Payload & Packet Headers (1900B -> 1908B).
               2. Computes and appends CRC-32 (1908B -> 1912B) via fso_crc_32.
               3. Sniffs and stores the 1912B frame into ARQ_DDR4_WRAPPER.
               4. Buffers the 1912B frame into fifo_data.
               Outputs both the normal data stream and the ARQ retx stream.
===========================================================================
*/

module fso_payload (
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Interface from XGMII Front-End (packaging_and_segmentation.v)
    // Expected: 1900 Bytes
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output reg         s_axis_eth_tready, // correction: change to reg

    // -------------------------------------------------------
    // ARQ Control Interfaces (from arq_tx_controller.v)
    // -------------------------------------------------------
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // -------------------------------------------------------
    // AXI-Stream Outputs to fso_payload_mux.v
    // Output: 1912 Bytes (Both Data and Retransmit paths)
    // -------------------------------------------------------
    output wire [31:0] m_axis_data_tdata,
    output wire        m_axis_data_tvalid,
    output wire        m_axis_data_tlast,
    input  wire        m_axis_data_tready,

    output wire [31:0] m_axis_retx_tdata,
    output wire        m_axis_retx_tvalid,
    output wire        m_axis_retx_tlast,
    input  wire        m_axis_retx_tready
);

    // =======================================================
    // 1. INJECTOR FSM: Append FSO Headers (1900B -> 1908B)
    // =======================================================
    localparam S_IDLE = 2'd0, S_HDR1 = 2'd1, S_HDR2 = 2'd2, S_DATA = 2'd3;
    
    reg [1:0]  state, next_state;
    reg [9:0]  seq_num; 

    // Internal wires connecting Injector -> CRC
    reg  [31:0] inj_tdata;
    reg         inj_tvalid;
    reg         inj_tlast;
    wire        inj_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= S_IDLE;
            seq_num <= 10'd0;
        end else begin
            state <= next_state;
            if (state == S_DATA && s_axis_eth_tvalid && s_axis_eth_tready && s_axis_eth_tlast) begin
                seq_num <= seq_num + 1'b1;
            end
        end
    end

    always @(*) begin
        next_state        = state;
        s_axis_eth_tready = 1'b0;
        inj_tvalid        = 1'b0;
        inj_tlast         = 1'b0;
        inj_tdata         = 32'd0;

        case (state)
            S_IDLE: begin
                if (s_axis_eth_tvalid) next_state = S_HDR1;
            end
            S_HDR1: begin
                inj_tvalid = 1'b1;
                inj_tdata  = {8'hAB, seq_num, 14'd0}; // FSO Payload Header
                if (inj_tready) next_state = S_HDR2;
            end
            S_HDR2: begin
                inj_tvalid = 1'b1;
                inj_tdata  = {16'hCDEF, 2'b00, 14'd0}; // FSO Packet Header
                if (inj_tready) next_state = S_DATA;
            end
            S_DATA: begin
                inj_tvalid        = s_axis_eth_tvalid;
                inj_tdata         = s_axis_eth_tdata;
                s_axis_eth_tready = inj_tready;
                inj_tlast         = s_axis_eth_tlast; 

                if (s_axis_eth_tvalid && inj_tready && s_axis_eth_tlast) begin
                    next_state = S_IDLE;
                end
            end
        endcase
    end

    // =======================================================
    // 2. FSO CRC-32 ENGINE (1908B -> 1912B)
    // =======================================================
    wire [31:0] crc_tdata;
    wire        crc_tvalid;
    wire        crc_tlast;
    wire        crc_tready;

    fso_crc_32 u_fso_crc_32 (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (inj_tdata),
        .s_axis_tvalid   (inj_tvalid),
        .s_axis_tlast    (inj_tlast),
        .s_axis_tready   (inj_tready),
        .m_axis_tdata    (crc_tdata),
        .m_axis_tvalid   (crc_tvalid),
        .m_axis_tlast    (crc_tlast),
        .m_axis_tready   (crc_tready)
    );

    // =======================================================
    // 3. FIFO DATA BUFFER (Primary Output Path)
    // =======================================================
    fso_axis_fifo #(.FIFO_DEPTH(1024), .ADDR_WIDTH(10)) fifo_data (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (crc_tready),
        .m_axis_tdata    (m_axis_data_tdata),
        .m_axis_tvalid   (m_axis_data_tvalid),
        .m_axis_tlast    (m_axis_data_tlast),
        .m_axis_tready   (m_axis_data_tready)
    );

    // =======================================================
    // 4. ARQ DDR4 WRAPPER (Retransmit Path)
    // Sniffs the output of CRC-32 silently.
    // =======================================================
    arq_ddr4_wrapper u_arq_ddr4_wrapper (
        .clk             (clk),
        .rst_n           (rst_n),
        .ddr4_write_req  (ddr4_write_req),
        .ddr4_read_req   (ddr4_read_req),
        .ddr4_delete_req (ddr4_delete_req),
        .ddr4_addr       (ddr4_addr),
        
        // Sniffing CRC Data
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (crc_tready),
        
        // Retransmit Output to MUX
        .m_axis_tdata    (m_axis_retx_tdata),
        .m_axis_tvalid   (m_axis_retx_tvalid),
        .m_axis_tlast    (m_axis_retx_tlast),
        .m_axis_tready   (m_axis_retx_tready)
    );

endmodule