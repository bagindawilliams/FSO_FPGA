`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : deframer_header
Description  : Header Deframer Sub-Top Module.
               Integrates fso_crc_16_checker and header_parser to validate 
               and unpack the 16-Byte SDA OISL Header at 312.5 MHz.
===========================================================================
*/

module deframer_header (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        header_dv,
    input  wire [7:0]  header_in,

    output wire        hdr_check_done,
    output wire        hdr_crc_ok,
    output wire [15:0] rx_txfn,
    output wire [15:0] rx_rxfn,
    output wire        rx_ack,
    output wire        rx_ack_valid,
    output wire [1:0]  rx_frame_type,
    output wire [39:0] rx_tx_ts,
    output wire [5:0]  rx_tod_sec,
    output wire [2:0]  rx_ts_applies,
    output wire [3:0]  rx_fcch_op,
    output wire [15:0] rx_fcch_pl,
    output wire [15:0] rx_hdr_crc16
);

    fso_crc_16_checker u_crc16_checker (
        .clk            (clk),
        .rst_n          (rst_n),
        .en             (header_dv),
        .data_in        (header_in),
        .hdr_check_done (hdr_check_done),
        .hdr_crc_ok     (hdr_crc_ok),
        .calculated_crc (),
        .received_crc   ()
    );

    header_parser u_header_parser (
        .clk              (clk),
        .rst_n            (rst_n),
        .en               (header_dv),
        .data_in          (header_in),
        .rx_txfn          (rx_txfn),
        .rx_rxfn          (rx_rxfn),
        .rx_ack           (rx_ack),
        .rx_ack_valid     (rx_ack_valid),
        .rx_frame_type    (rx_frame_type),
        .rx_tx_ts         (rx_tx_ts),
        .rx_tod_sec       (rx_tod_sec),
        .rx_ts_applies    (rx_ts_applies),
        .rx_fcch_op       (rx_fcch_op),
        .rx_fcch_pl       (rx_fcch_pl),
        .rx_hdr_crc16     (rx_hdr_crc16),
        .hdr_parsed_valid ()
    );

endmodule