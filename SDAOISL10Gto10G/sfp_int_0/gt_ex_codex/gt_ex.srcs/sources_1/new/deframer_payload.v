`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : deframer_payload
Description  : Payload Deframer Sub-Top Module.
               Wraps fso_crc_32_checker to validate the 1912-Byte Payload, 
               strip the 4-Byte CRC-32 trailer, and forward the 1908-Byte 
               verified payload to the Frame Demultiplexer.
===========================================================================
*/

module deframer_payload (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        payload_dv,
    input  wire [31:0] payload_in,
    input  wire        hdr_crc_ok,
    input  wire [15:0] rx_txfn,

    output wire        pld_check_done,
    output wire        pld_crc_ok,
    output wire [31:0] m_axis_pld_tdata,
    output wire        m_axis_pld_tvalid,
    output wire        m_axis_pld_tlast
);

    fso_crc_32_checker u_crc32_checker (
        .clk               (clk),
        .rst_n             (rst_n),
        .payload_dv        (payload_dv),
        .payload_in        (payload_in),
        .hdr_crc_ok        (hdr_crc_ok),
        .rx_txfn           (rx_txfn),
        .pld_check_done    (pld_check_done),
        .pld_crc_ok        (pld_crc_ok),
        .calculated_crc32  (),
        .received_crc32    (),
        .m_axis_pld_tdata  (m_axis_pld_tdata),
        .m_axis_pld_tvalid (m_axis_pld_tvalid),
        .m_axis_pld_tlast  (m_axis_pld_tlast)
    );

endmodule