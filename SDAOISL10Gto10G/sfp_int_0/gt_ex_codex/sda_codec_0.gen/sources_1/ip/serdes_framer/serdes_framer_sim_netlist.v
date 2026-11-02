// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:57 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
