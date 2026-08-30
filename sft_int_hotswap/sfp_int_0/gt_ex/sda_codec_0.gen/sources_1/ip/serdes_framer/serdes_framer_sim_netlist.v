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
