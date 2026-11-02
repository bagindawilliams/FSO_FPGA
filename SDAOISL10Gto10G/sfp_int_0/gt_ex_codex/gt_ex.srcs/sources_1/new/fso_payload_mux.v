`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : FSO Payload Combinational Multiplexer.
               Acts as the Arbi traffic router before CDC and FEC.
               Selects between 4 AXI-Stream inputs based on payload_mux_sel:
               00 = IDLE FIFO
               01 = DATA FIFO
               10 = MGMT FIFO
               11 = ARQ DDR4 Retransmit RAM
               Zero-latency combinational routing.
===========================================================================
*/

module fso_payload_mux (
    // Control Signal from ARQ TX Controller
    input  wire [1:0]  payload_mux_sel,

    // Input 0: IDLE FIFO (00)
    input  wire [31:0] s_idle_tdata,
    input  wire        s_idle_tvalid,
    input  wire        s_idle_tlast,
    output wire        s_idle_tready,

    // Input 1: DATA FIFO (01)
    input  wire [31:0] s_data_tdata,
    input  wire        s_data_tvalid,
    input  wire        s_data_tlast,
    output wire        s_data_tready,

    // Input 2: MGMT FIFO (10)
    input  wire [31:0] s_mgmt_tdata,
    input  wire        s_mgmt_tvalid,
    input  wire        s_mgmt_tlast,
    output wire        s_mgmt_tready,

    // Input 3: ARQ Retransmit RAM (11)
    input  wire [31:0] s_retx_tdata,
    input  wire        s_retx_tvalid,
    input  wire        s_retx_tlast,
    output wire        s_retx_tready,

    // Output: To x_gth_logic.v (CDC)
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    // =======================================================
    // Combinational Routing for Downstream Data (tdata, tvalid, tlast)
    // =======================================================
    assign m_axis_tdata  = (payload_mux_sel == 2'b00) ? s_idle_tdata  :
                           (payload_mux_sel == 2'b01) ? s_data_tdata  :
                           (payload_mux_sel == 2'b10) ? s_mgmt_tdata  :
                                                        s_retx_tdata;

    assign m_axis_tvalid = (payload_mux_sel == 2'b00) ? s_idle_tvalid :
                           (payload_mux_sel == 2'b01) ? s_data_tvalid :
                           (payload_mux_sel == 2'b10) ? s_mgmt_tvalid :
                                                        s_retx_tvalid;

    assign m_axis_tlast  = (payload_mux_sel == 2'b00) ? s_idle_tlast  :
                           (payload_mux_sel == 2'b01) ? s_data_tlast  :
                           (payload_mux_sel == 2'b10) ? s_mgmt_tlast  :
                                                        s_retx_tlast;

    // =======================================================
    // Combinational Routing for Upstream Flow Control (tready)
    // Only the selected path receives the true tready from CDC.
    // Unselected paths are stalled (tready = 0).
    // =======================================================
    assign s_idle_tready = (payload_mux_sel == 2'b00) ? m_axis_tready : 1'b0;
    assign s_data_tready = (payload_mux_sel == 2'b01) ? m_axis_tready : 1'b0;
    assign s_mgmt_tready = (payload_mux_sel == 2'b10) ? m_axis_tready : 1'b0;
    assign s_retx_tready = (payload_mux_sel == 2'b11) ? m_axis_tready : 1'b0;

endmodule