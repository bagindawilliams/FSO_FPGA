// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:16 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top serdes_framer -prefix
//               serdes_framer_ serdes_framer_sim_netlist.v
// Design      : serdes_framer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_framer,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module serdes_framer
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
  serdes_framer_fifo_generator_v13_2_14 U0
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
UU0HctCtrDGjqiFgNj8KUV1CNrtLH1fzvWozH/S7aVj0RSc24esnSs0ybsApJYbLPSCW6MJRxlk8
TZTBIGKXHEs9iSJrHyeb7Q9LsfbX2O77j94jiFzmN8lM/LIVA6RCDBtX2LtKWWw0Ex0IvwdPy+Mg
2z4iCfTMzyceiAZWkhE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GF0Vw/gqBrc9IHG5aASlKQHzVjMUtBIwjnrAUquexOCvx+SSWyZN88WoE2YOio8l2Mng8jmA3ELb
iVwbk5kPsSQid3iLelRIejTGTCNP7ErmhAyw9N/gInxZrkBgF+99fwCp/qSFsRz+GkpjXlmNPLal
1m+CmI2mtQjH/zDmulZq9kFS9URMU7E3TrKSiNtdLMYc1ulwC3kFJ99geu/tuMfIrNOmA9KkJtnb
Zoy9fNs53bR+fUGBL5n7AwoO6cdU62PpktsyWXh1Gp6Ylf2HTT0CPMyzWbJQve0G4+iszllRawxG
r+FcAh4BuFpKqaFogcTloexA8MTZ9ICsGZkzkg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Hzytw/FfXpsPrE5ZowzcEV+nwakl1BirWDR+Iseu9nWPYk6Otw/UyzdfMGdUJQcXxjn8eODJUMPS
SLvHyIbu8M+iaMMz4+lNG/o0csNo8MO67HX9fxa4xkVOaSOTCzBVfRk3cjnK+OAXlJEZO2/F0Im7
evCVwWE8mv0p9yv9NZA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aYTxAf85PVmpAktzX89uf9AJXAUs8FLk2gaAmaPtMQhfYN72ydFe5GcOlR9/W705GnhW+LSDUX2b
XQnSvIzmqRMwIqE2sgix0W4aZDvptNpP2y+gttAzQaOhAd12INExGFaZxKro7f/cey7YiwGKPPah
zcBWMoHI2bIhFDe04i/Jt1MdciCe1haFyhwBCett8eV6Laia/DlHOXxqH2bLukgGZp5p2EYoM0T8
WwuwxJ3X0IIphS/uP6nXSuuuMQcAplYzcG4PLCMpn2Lo3HwmwSo5w+0N1NFI5LYfb6ZrdTXjRH+j
oHZlteBZzQ+4jNx7/nPPCnuUB8IFMROek8y3aQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e6jDiYnzLTYk/3jC49X3YNnxEmaFBYGO/cl88hMTKYq1FltlAtsDFs47xPVxcrXJmXB6FiDcQKgy
Zcri+H61avSebr0yHZ1uigtfwqLvcivJwyCmMK1zZ+tk95pu+v8wQUekejQwCfm8d4EwcPtFRBCP
VuiAB7kH68VA/rKSNW/L3Ck+PVdkE6HHJnrneJm4Aial7Xm5QOsroJRJU/ObInH0MO+tgwAysCdd
6eCmjEBFQGTjmThY8W79EF9AQGGRTMTJSajCB65vB7j4uMsw7y2m2q5T1cf5FapbNOa5qVGM3ltu
WzPHL8ffpwsn/Um4FxL0m2OELCU3vijgWPxyYg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W4uYHM01gGeA2MU+ib2L/ExIRZJnY4G/4/BNSFnBkDMClm5bxdPZWGZhCUejE4JXBUBzvBBii0hv
o/qn9snazl844XvvPfn0rjgdMjBDDTUc14EhQ+t9LtnZFAV+z3wAIKGQaUOt5C451j/28rPyPkS0
kBiQMKRYL8V8HYzz8PJCw/2pMZh5nAGYlHVN7x7BRfHg/eGLL9Vxje7mRSIq9oPfHNxp9KvTPnEz
BAbFFeUiH6gtQHgv3loUdp74IXW+8+uJHlh0BbE4crWkB23UetPNvBTz30q+iGUe+Uy9cDako55V
AVXIMgciLrWVPF+qY5b7zySQkB4Xsfj+udkVyA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R0MJeGCQpSjYsGBWKKr56ZJi8ovYpLtniBxpCnrQicvQybY+fnPA8Daj6MXdCf3qwLF8yF5WCJ8s
qgsZvXSLz7hwsKVEId08i3cpwMDSnKdPTNXjuKS2h7UKOlcr6QZ5j31qcO2XbyCffpn/pAXTmv3a
wywj0bLNK61+JY8v+VTzUKzR370hK34Ryuts+hg1InhuHxLuVnu52lVOpk/PYUaA+w7ORS7AIzBm
Ic2Gs+gCO56TT/kHzEdPXDOhyRk/LG0ir7xXNq7VYILxVh4t9QTZ+TIjutFAhElz9ceEjJ95QYy+
i58LiAOmyF9ID0yxSSYM4KQAF2bqt9kvgdWRhg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
piBTg4FhL4gV7WxO2j/dIDXpMS0DVV+BCPbz6qHH74TfGEKWiiBMU6gK+ZbplwJNS8NHNyEzAlya
r4wgVpBFLdWysNz1JTSjKKJCO9JEQN5/H5jfiaYLOSRwE+N3Opc54BvT85yu1V+zTS+2aJj4AQ/f
gjyVCtr2A8YVv2zEjqFuQcYlcSxHTEk5eig4u36hHgzGJsmifFlP0OtE2NeoOMzFbBJe4LR9f1Ac
XQfLq8HilNwnOz4EYZGL9iJymjQ63NwSYfWcRjHVPPJXQFZSrWlI6V5kkz1/IDnPuelueoAKOk5K
OAAeaRjYDKgXhfse4B1Cy+u9f08zryJez9v+yfA14jVDkQQJp6a0qHJYuemefEFrmwJxSLUqG+Xq
QDK6/emEA9ZXoln0PNQyFzaEVDeFDZBn8LZi5SGL6f+TpO0acfI2jxa5+vCQHX/boxpyVjtxPh0W
Xjk7+E7CKFDmE6T/ZNnn7MRpaG1g4A2TEvSqCSRRnPprcg/+bRR6T6Sy

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GlYhuN+XgK/dKipYGy0F51EWCsMzdTtEw7DUl9GCeVeyU6B0qQxd4o+WGLqPzleHUcbSjTY0Zsbn
PYVk3cx1yet4akcLytYAGFXC4n/Xi+1UqMz5TGn6+YQTvRIQ3rDpVCwwETOtxY9exyURa9vrZwN6
wg8aS7eaMRDPPrD9XOy8sQT0WrdKizBToFy2xoVRXceycyYYY7TdZikow1sCVE5Dsq8WQ5SRprGB
6XOvNlQnaIlUCVafx8nFv91VsM31btEViBrUpTqFHJAuoebt0ZL+JlrQ5nOk7XQnw6AQ+0ZlOKba
q3Ttg2CqLMLHVI+1yNiz+OEKhmPV1D5J7vlPQQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2gbN0jz/o58BxZjM7+eT+qN7Q3qHE0g1JsI7dvdgaVydBYqQVWbzuiZYLMAHv8yrsn9b32oHcBSE
0o5Cui6GiD7neKU4AljBAlKAaN9vmM7TfUunNvBpRwv61T0jxsnbQPWfLrtpbTXbXa9k+COT+cqb
xPXfz1KFKZR+jUVQfqg3k9yE8k42Qekbv3kD1KU/qey8yzrOiZWk3YSqYVf+xtUpOvJY52CMhroS
XNjVVkBPUu8Qp/8HAzxqzWi+9FMbOuRKapPdzyPMn/9u5V3oDa03Jlbl/wNvQRAMkkI4MR0Z6Fef
acPXE4lO4yrbdCI+/JWNiFnMhbPxxOqB2cgi5g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ijvB9ebv8UTsfEBOdwLX29OhkfU+M38mGG3GBCgYR1J/bZmxD6jFCxoFCEm1aKFgD1oURupMHfs1
c3MOeOmJ+miekD3bzrkO2GpRCnMbhKovUm5w9Qm7OnK1B25OU6+Xq1Ykk4tIi1xMOMYX8YKOrSrC
twPgnJ2VHr4FFKQ+p5YO7BYb6KtJrf3+2JKYjVPpp3gkR5SZklV/ugbHgXnKTC8NtjSnys5yM8fs
hXOpMWgzLJxxPm595q7fFP3rHvMyw7H7unYraHK+0uc9zTFZ4LHWuOQvc3TRUEmRmJmaag8nwld1
2cnhyhbuZqsuwb5+2W6amIYGSDb8gPS45qwzBg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53792)
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
