// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:51 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_rs_sim_netlist.v
// Design      : delay_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_rs,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uS/dIpDTldS7400uyLsI6bJxO+WmZJrKXsU8qB+wpyI+d4PWZVO6Cm0qMQFNUZb63p6zCI5fvnQy
SxjaSP1nCte/oQZc55w1rQbTqy54T9kryRoH26nDjSBVZvJ8hffw7NONwiKrqeB6I7HJKX5RKw73
wIJxNNH7BCiCEtRLIxc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L7q2sHnC0pU7uHs8shPm9nAcqyU+hUFnNkd6BPHl+ureEVBUvubWhEbLRLiFFJveufcmAfAXTzae
tWbKcVVt/zKzWEtv0onUXoSEgyS4+QaTAFeCPHR2bbnlP0aCCG2SYmC1dv16cFoAk/NLitClNXAv
h+UBGzod+suWv55DaNHeHtSZ/YLZxHdn/R47atTiQM+A1TWQkpa3faF/L9ANZISSe/OR6mPfQ/Zk
4AptHNmW/pWpd3JL4e06iK9P6ZLLRqSMR9mu6AFIeWYBVz+KkxgSIWgQO7/AHBUFjlIiMFhyQR5Y
UC1fo4CPZX7fMdUPwQiC+eZ7UtxMAUzovIzwEw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KZhqqPnSEvcItoYRHrFT/Wt2IEXHe7pq5lmAOfYqAaaoY8mpIG3Kd8B/C4s9kNUbktSOX78NnnrJ
brxcu/1EAlI9itnDH8ahxble+2Nt/Lj3dQ1/wbDy3HOKlwBVuOvVDArOpgho+BAnoLUZXrpsw8EI
FSIPKmsETVzLzZDw6m0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WZbb0PsQl1vn7dY/rZzI8ZGsAP5Ad4C/d2cBXS49yTbQqKMTY7r1YHlrjBGteY6wrhKVmM92u/3/
/UJWPyNVqwcsrRAHhR/Lp3Mg87NIhYzETdNAOpnc7rWC9ieIeEiyPM734sI7QtAMVrZxXoUXnCjp
fjQhaMqv+HsuEWpFhDail+v8Ftwmr5xP1JSpqPfxLz5a6+q8/lTxRGeWZokM7vP2YFKg7L7Yoowh
gOm5w3JhR2fXZsksWxfQk7885JzsI4yZOrU8dY667YWWhkjZE/SKo2TMksiasL22T6CpyUbMwQm2
DJ+cMJbr9/8csBEifIsopc4V9zFbSU9eoxlqZA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Adid/GOKDljgmM7UpkmD6EVL+5rt6bnWK9P8RIZiI3EkLW96rM6eCs7jkLeKnEW/WPGRhlZrGw8p
C7Ni27oibJKJT5xUBJDymbO+yheaaTI0GaeDMIzks860gYA3qdvTPxTBotaOg6MIpnYd070NhTod
Qq5XNnxLuF7/s5rAZANJHyRQKwu4gVBfs5SU2FSjF546M5FvN7BX6G7B76ALW6vKqGyKxwoHkc52
Bm8/jGTxJ6zbwn2v31NEfjO6nM5m6yYwY0476QLXWI6+7/ILkSvDVTt7B9HpcaRg3n3T4AEQDMyX
8bBPgm0qFbWZue0dlr9ljYOl0dgwaO8G9uYe9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tq2b3cw7fnIOEbRUxnQIgAjXwRE3aRwj2IBVmS0S998fvCLPMUtm5MVXAqk0TwuEzKG3br/oRham
Oe5KAx6FauTTVpRhLH5RY3832M9OVTSW/bNq12/dXnJyOfYS76FQtd9HNFrSkVPMONGMD0ZQXRic
Yr0MaeflUHQmU6QUCt5OJkbG4F8qJLMWJsg03K7dNzDfkvev3QVf72bmHTm4SF6/cs94NXQl/NPr
CzQorTZ5BgCzVAui7mM0eu3mu6OPkecNQ3Ih+1zsJuGkAHWC7aFgh7ii6xEj1upD365TzJUF1ZCe
0jZj/Ub1m5OgZMbjbLYn/Fh5nqi+fAmL7jDAHQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S+EkimFGNL3D/SKyjUVYhIZzRbEoTqlnv2kHD0e4rYYCt/O4IYecNmch6HRfd2U/WSZPkAoJ+xa7
GKQSo51PL81HSvqURo2CxltObyTYiklnzGtbdWUMpOSCjDe8LpQjUNwhSksWjZjUQypyYXS4hbCR
VJy96ow8zi5m1XMzoLaVMDYoJYLtOVh7eaL7InaIL5gXJIHWkhoKYh9bR/O5HE6YTsgZl+Ofmx/3
0mQ/bL5ZKSY6gBEUD8f5+SoMIjfXrGkjMj1+fEAIv0fO/wKyJQMKnDOgWMvcUw56dOJ7FWkbNvbC
kzquuXhk5LuzZfXWmhyDSyMGBWK1wN7iyMKMUg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
LQ4hjhkD/G9XJd+gVR5WF2vSll/p8/psR+nHjJ5/DHrtiRqVWFVc7B7T9XZuJBmTqrQV4iSBYWDo
zNaVdq26mGk6TTNo11Dcici0hEwC2Bg66k9kr1if+0iZo3VtB/ZuEOj2w7euhFo3ja1OovnDXxf0
8t4WMUK68mfUiMuKgVcbOFhm3Jdnbnz4u7SggH2/rkfOS8jbon9q9n0EXlK23tz2NzDLCS8B7ERx
dYvwqwBiySKoP1/EcfSwFNIWpr6p7kbRo7iM/JbP6UwBbkDHgE8HGS+3lTXIUXsmGmsx6EDSr/gY
i7lHwZTmDuhuIEJaf6gTJgtqMSxVyDVsrnba5umKgV8z5OOWUkM3FjVWIXOG7Ef2iKFCzBPmp2Lk
8XbrXk/bb9H/jr4UR3hgdbizISTysLTJd4n5uyeDhDgkxAc+1FudacmuZyBlA/VTR1f0i9+cOgLI
kdqbo1u5hQwnMphluBKjdTA3nZ8VnpDbdq5R7hIF61tIrUfdjwQw02je

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JzhYMwmYowESMI19XNb+BEFcZw3IXZpwZO3gzrVg2CdSjbAR3tiIVbPHI5Rgu59SH7H8abU59Atd
+nrPiG37rmU6CD+cMV2mU8SHfCDLYsnrbd9YLZ1GEfqTovR0NZHQTHj+7c5dP7nqm30C/kg1adqd
DOV7F128PbmM5U45xRxOJKUgS/Waz0gvmYKKJejkiyFPOgGbN5f844mtysoOckLrAU/BzRs8SB9G
zzisK/a8hM5af8/opZ64TGhH44Npzy8kcP+gI+k+U0oF0SOqW7CjadKaJhr2oDkTScVVCbBqFEjc
2gH862vcCfZu5Cd0Sp2ALgoqVxA+91lAIHJp3Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ooNS+XjsaWLRgvcrNWVpR3ihKtIJNT1oT4D5ivD5mCfw+4/SAyx9P4cmdvOotLNPE1eqvx1Smd9Q
LDImL/GqS7Cq3KEUtEBbvQAOp+0SjiW74cC6nyOqCA8NQcn5JM+vUzGSsORPnM5qP96axGmyEvSi
p3uL9Gmx+3S3KUJuAzfuqZwJD7gdcA0Zv3hPRl+xhx8qFtkPCfT5uj7wpFVaaJ8tTl1SDd2uRUIx
rgVgV+oERCg71oEVN7PqPK1y7pFVgSW9uhP1wuvO/EsbyrLYZV6HtBn3tJDcxhTsQWrrou3F1kFQ
cFnl9tcL1wXJo/F3wvsbYM1W0UPHv69XAsEUhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d8YRbu+fllaHlNDedyRNDRtn9CBoVbO9fZCdhKpy0yf9dL6A08sFZuWVtVGljxF/L9volGB0IRjl
KbH2N/JBQA+tZWuh75kK5pjveAAKLVACS8A+Jmt/mrxzlolPWsruJ8o1Owrjq5tGWspdqmeDGS7U
/Ww7cN0C9ExUj4cjRDcKaqDS9MGwRtx4LfcQbQbRDZBk+cyRaWCchvmhjoum4uTizvqMq2u4oSym
t2zyKFjAuMO4zC2LbPbODeumm+FhlOKAHRyEBKA+VQeLB4apkMYparuD5AFWAuVvdWEbGq/L4cJ7
pEGz+6Hqi68CfF/4tMNiyHveP1lxnyAaiW6Kjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52656)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
