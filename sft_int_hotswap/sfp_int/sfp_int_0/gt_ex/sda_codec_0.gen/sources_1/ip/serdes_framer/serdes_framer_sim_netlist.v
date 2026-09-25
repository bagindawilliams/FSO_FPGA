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
