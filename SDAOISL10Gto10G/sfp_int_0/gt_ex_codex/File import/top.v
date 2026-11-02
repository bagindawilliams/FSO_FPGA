`timescale 1ns / 1ps
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
    
    output      fan
);

wire 		tx0_clk;
wire 		gt0_txfsmresetdone;
wire 		gt0_rxfsmresetdone;
wire[31:0] 	tx2_data;
wire[3:0] 	tx2_kchar;
wire 		tx1_clk;
wire[31:0] 	tx1_data;
wire[3:0] 	tx1_kchar; 

wire 		rx2_clk;
wire[31:0] 	rx2_data;
wire[3:0] 	rx2_kchar;
wire 		rx1_clk;
wire[31:0] 	rx1_data;
wire[3:0] 	rx1_kchar; 

(* MARK_DEBUG="true" *)wire[31:0] 	data_tx;
(* MARK_DEBUG="true" *)wire[3:0] 	data_ctrl;

(*mark_debug = "true" *)wire 		tx_packet_data_rd;
wire 		rx_clk;

assign tx_disable = 2'd0 ;

assign rx_clk 	= rx0_clk;
assign tx1_data = data_tx;
assign tx1_kchar = data_ctrl;
assign tx2_data = data_tx;
assign tx2_kchar = data_ctrl;

(* MARK_DEBUG="true" *)wire    rx1_dv;
(* MARK_DEBUG="true" *)wire[31:0] rx1_data_align;
(* MARK_DEBUG="true" *)wire[3:0]  rx1_ctrl_align;
(* MARK_DEBUG="true" *)wire[31:0] rx1_error_packet_cnt_o;
(* MARK_DEBUG="true" *)wire[31:0] rx1_packet_cnt_o;

wire    rst_n;
assign  rst_n   = 1'b1;
assign  fan     = 1'b0;

(*mark_debug = "true" *)wire    en;
wire    sys_clk;
wire    clk_100M;
wire    clk_logic;

(*mark_debug = "true" *)wire    data_dv;
(*mark_debug = "true" *)wire    [31:0]      data_in;

(*mark_debug = "true" *)wire    tx_dv;
(*mark_debug = "true" *)wire    [31:0]      tx_data;

(*mark_debug = "true" *)wire    fso_dv;
(*mark_debug = "true" *)wire    [31:0]      fso_data;

(*mark_debug = "true" *)wire    flag;
(*mark_debug = "true" *)wire    [31:0]      data_out;

IBUFGDS sys_clk_inst (
    .I      (sys_clk_p)
    ,.IB    (sys_clk_n)
    ,.O     (sys_clk)
);

clk_wiz_0 clk_wiz_0_inst (
    .clk_in1        (sys_clk)
    ,.clk_out1      (clk_100M)
    ,.clk_out2      (clk_logic)
);

autorun autorun_inst (
    .clk            (tx0_clk)
    ,.rst_n         (rst_n)
    ,.flag          (en)
);

stream_input stream_input_inst (
    .clk            (tx0_clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.flag          (data_dv)
    ,.data_out      (data_in)
);

encoder_top encoder_top_inst (
    .clk_gth        (tx0_clk)
    ,.clk_logic     (clk_logic)
    ,.rst_n         (rst_n)
    ,.en            (data_dv)
    ,.data_in       (data_in)
    ,.flag          (tx_dv)
    ,.data_out      (tx_data)
);

error_inject error_inject_inst (
    .clk            (tx0_clk)
    ,.rst_n         (rst_n)
    ,.en            (tx_dv)
    ,.data_in       (tx_data)
    ,.flag          (fso_dv)
    ,.data_out      (fso_data)
);

decoder_top decoder_top_inst (
    .clk_gth        (rx_clk)
    ,.clk_logic     (clk_logic)
    ,.rst_n         (rst_n)
    ,.en            (rx1_dv)
    ,.data_in       (rx1_data_align)
    ,.flag          (flag)
    ,.data_out      (data_out)
);

wire gt0_txfsmresetdone_w;
reset_0 tx_reset_m0 
(
   .slowest_sync_clk(tx0_clk),          // input wire slowest_sync_clk
   .ext_reset_in(gt0_txfsmresetdone),                  // input wire ext_reset_in
   .aux_reset_in(1'b0),                  // input wire aux_reset_in
   .mb_debug_sys_rst(1'b0),          // input wire mb_debug_sys_rst
   .dcm_locked(1'b1),                      // input wire dcm_locked
   .mb_reset(),                          // output wire mb_reset
   .bus_struct_reset(),          // output wire [0 : 0] bus_struct_reset
   .peripheral_reset(gt0_txfsmresetdone_w),          // output wire [0 : 0] peripheral_reset
   .interconnect_aresetn(),  // output wire [0 : 0] interconnect_aresetn
   .peripheral_aresetn()      // output wire [0 : 0] peripheral_aresetn
 );
 
wire gt0_rxfsmresetdone_w;
reset_0 rx_reset_m0 
(
   .slowest_sync_clk(rx_clk),          // input wire slowest_sync_clk
   .ext_reset_in(gt0_rxfsmresetdone),                  // input wire ext_reset_in
   .aux_reset_in(1'b0),                  // input wire aux_reset_in
   .mb_debug_sys_rst(1'b0),          // input wire mb_debug_sys_rst
   .dcm_locked(1'b1),                      // input wire dcm_locked
   .mb_reset(),                          // output wire mb_reset
   .bus_struct_reset(),          // output wire [0 : 0] bus_struct_reset
   .peripheral_reset(gt0_rxfsmresetdone_w),          // output wire [0 : 0] peripheral_reset
   .interconnect_aresetn(),  // output wire [0 : 0] interconnect_aresetn
   .peripheral_aresetn()      // output wire [0 : 0] peripheral_aresetn
 );
 
packet_send packet_send_m0(
    .rst				(gt0_txfsmresetdone_w),
    .tx_clk				(tx0_clk),
    .tx_packet_req		(fso_dv),
    .tx_packet_len		(1036),
    .tx_packet_done		(),
    .tx_packet_type		(8),
    .tx_packet_data		(fso_data),
    .tx_packet_data_rd	(tx_packet_data_rd),
    
    .gt_tx_data			(data_tx),
    .gt_tx_ctrl			(data_ctrl)
);

packet_rec packet_rec_m0(
    .rst				(gt0_rxfsmresetdone_w),
    .rx_clk				(rx_clk), 
    .rx_data			(rx1_data),
    .rx_ctrl			(rx1_kchar),
    //
    .rx_dv              (rx1_dv),
	.rx_data_align		(rx1_data_align),
    .rx_ctrl_align		(rx1_ctrl_align),
    .packet_cnt_o		(rx1_packet_cnt_o),
    .error_packet_cnt_o	(rx1_error_packet_cnt_o)
);

gt_example_top gtx_exdes_m0
    (
	
    .tx0_clk(tx0_clk),
    .gt0_txfsmresetdone(gt0_txfsmresetdone),
    .gt0_rxfsmresetdone(gt0_rxfsmresetdone),
    .tx0_data(tx0_data),
    .tx0_kchar(tx0_kchar),   
    .rx0_clk(rx0_clk),
    .rx0_data(rx0_data),
    .rx0_kchar(rx0_kchar),

    .tx1_clk(tx1_clk),
    .gt1_txfsmresetdone(),
    .gt1_rxfsmresetdone(),
    .tx1_data(tx1_data),
    .tx1_kchar(tx1_kchar),   
    .rx1_clk(rx1_clk),
    .rx1_data(rx1_data),
    .rx1_kchar(rx1_kchar),
    
    .tx2_clk(tx2_clk),
    .gt2_txfsmresetdone(gt2_txfsmresetdone),
    .gt2_rxfsmresetdone(gt2_rxfsmresetdone),
    .tx2_data(tx2_data),
    .tx2_kchar(tx2_kchar),   
    .rx2_clk(rx2_clk),
    .rx2_data(rx2_data),
    .rx2_kchar(rx2_kchar),
    
    .tx3_clk(tx3_clk),
    .gt3_txfsmresetdone(),
    .gt3_rxfsmresetdone(),
    .tx3_data(tx3_data),
    .tx3_kchar(tx3_kchar),   
    .rx3_clk(rx3_clk),
    .rx3_data(rx3_data),
    .rx3_kchar(rx3_kchar),
                         
    .mgtrefclk_n(mgtrefclk_n),
    .mgtrefclk_p(mgtrefclk_p),
	.hb_gtwiz_reset_clk_freerun_in(clk_100M),
	.hb_gtwiz_reset_all_in(1'b0),
    .RXN_IN(RXN_IN),
    .RXP_IN(RXP_IN),
    .TXN_OUT(TXN_OUT),
    .TXP_OUT(TXP_OUT)
);   








endmodule








