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
