// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ serdes_framer_sim_netlist.v
// Design      : serdes_framer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_framer,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [63:0]din;
  wire [31:0]dout;
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
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "510" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "509" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54144)
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
