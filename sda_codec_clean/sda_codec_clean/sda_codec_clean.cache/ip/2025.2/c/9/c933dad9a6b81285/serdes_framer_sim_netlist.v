// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:16 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ serdes_framer_sim_netlist.v
// Design      : serdes_framer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_framer,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54160)
`pragma protect data_block
1Hh63gOVxpPaWUnYpUaQF+QH+alUpxd4P+kuOU2gXIjqjmrPvgtEIAruDW/RywCSmf+HJmEx3aag
Yb5KYbmpE5pJCj/D+WzhM0/TziajKM+q8J28odJRYlfvm3FybgB0M2GopvDTpaPSp6Owgru+asCB
tEg1yC1wA6x/w/7fIbNNO9kHIr6CznesiYpr3/MZSezrVWyGn43XJDm5OLTiBpbmQ7oD3biwdhwL
Q8spXcjs5UQB5jlth8SuSoBIzuyx/YkZxlDtcYZ6pWGN6ICgAghPnLcAZJETnyzLTm0XwchPoO2F
iWnEmHB5RimX20fVTgdmgDbx/7dBqn8J1gxuX8mN53Q2hl41dSar6WedteynnQie6Mk666pwmFbl
GCMbVCIgpXlabylUkN4rYSG2eZg7/yKERHG3MLW73UM5VNp4n9Gx5/YPfz7EvZOCGtNWF0szYVhH
tsE61LZ4mVzLr+DsJS+T75adNEvUTUxI74WAJ7sBRB4HFXRbeZCnZDiF6rlpmVfkdLgTnvvak1PL
5QRMPWrK7tu8dSsosYeOdVpb/4zZz8taY81JPVtrJdnBrnM+oMWuXyh3mUifJFhijVnu5CFPeYlj
SU0cOXsyGpOjPfA63gpTStjN8zhavscxFtT3V8MALIQJQrN11eQ3teyeq5AIBIdBlD2RO+pNZP9X
DnTWdtY7rLo5XZqZsSCpTlqmaGsTVzgkCRf5m30vN9Cxet2nrmnobA8nRm2yMKxh4CTwQ+eDsgh6
4h+i6ZIR48jURGFOZBqrtid1Gd0XUs+7KEsSZjqzqDEsyHEMRyrQbHVeGaUGv0uGTb1CJOYtJuJF
K5lRRJ/yDKfqZUg/dyM9snHmMRifDc5sLnsB28A5KsPOTkbkuiBvorUlKFUjIsgLS7hG+8L67eSp
ZSenS/UVNiO92pYg1Hg6UQ0g91HuCrIGFt1/xkVz3D7pp6RHS9XfUH2dfa9u2DYpr2G6uNCTcOck
iBJoDYKwyxMcHmdSV4dOkgF2LVPn8RdC8juSjcKUKzYLUtLrd/gbAah179/nyaT/RiiuiO74R31+
epuiBgylNcHtNUMnEGgtKgVhsOHUtSVOeDU86eOpqxrWXeNFGsntDfpiMTiRsjt5SRlq+jVCUq09
3OOtLn18N41qI8s0E4TuR/uwltM8arvKAMaa2T3qbJ1RtH4KpyFJN3BGhPqpH3dptKaDkNR5Hsct
hy/gb61bYKZMqbkHJF9SoOcRkyF3fKzpHtfn+pEj5K6uQ4y4/ktXWIwa+6mGGhMnytlA6cYyePX0
+F5Q6fYlxw2s3Ou3QQHQTF3ewaAQd5XpaR0nM00TuGRs4cI1aAp4h264sQdbMDY4B1Bed+P/dMn6
0c5Khio8ODvQ6lAYPPxinXoSsBDQn3ppHocvToTmR63oDaS6/eHL4SAkEQ23WcdttilLBOsruWl6
GobCZdpjn9lmjIcvsTV7opicQ+d7O5BzgeOqd7ufaYCs3PgAm1CgaWy5cLzbHzMul9/9CsXEqDM5
Uj3haLA2A5XULxI5sfJt1iEQxzosEV/IE1TvfuxbSIT89wOHPgg2nuoXeUPeL1Yoo5voGq/6tF7n
Alg5I2pU1EQbsXy35NyOAEszJx201yeR6RQ+KXDa5WbsEyarjd7xeRW1VPXQ9Ngxd31EJtnAvxmA
NKE6l+WsvTXI2BF3QC6z91ynxw3u49CUGXjAxRFWuMPxG0YHlxyloWDv1jdtv5PKCY55QTj2nNIt
mfv4QHJss7EsVNAFKVLOm0cqlOReL9xpHSbBsX8PGTmoPaMKciyJQpwMgfr9vofELpASkf8I7Mx8
Bim1TDqEWB3Bz0Ex7oLQ52Om31UnMCb3yUjerhUIGq3yL/WXYcHD5ch/SYkhE22Ar/9vJse5jU//
ydAGATVOIFenqSgcxmehHrR0Q2qC7iAsouUo6Kawsd/66CV+lQEQahW9SqFSqOAjYEhtJ+YUSGQK
l/OK+zeG9kD16YcnoHD3IQCr5dwbRtlh5h9Bf6T4eSa4eo2UneGd24uBM42ITkv3lkMSo6+FQ25O
OvvAOdyqggufn6QYpQmT5CakUyBsg+H4QU/ElJTbrjQnclY7QNp5ssEf6y9q6iB9PBBmYU68unqV
OsVv+91BEA1wRJLlHQ0No91zZJPAObHsJ1e7rvqlagx+UYPTmzA4zhwMeelMaGAUhMmWMRWJSi2B
Ju24H05Xgtw7PInMt1u1f7jXanS14FK5/is5LwCgMvfLu2VN5aM6ry6vHRmQ/DJDVuTId5a06Hjw
2LzY9HSuJJy6bDPNtM+mCHgAooKm66Swy7tnYqByc6fFSQ3ei3KugySrBY1io9ENH3LzuCi+7yGR
ppnZojmgm1oE7gUkTdtvZst93yOcqZP1SHFbjTdM5H7INuM5jRXdbsayzm0Bshcha7/dynUxeEYH
6MhTq65ULj0Tex3oSyiggRGLb3w7z8GXqP/ytJEWmdMKnn3NUq4n5WkzYy2If89mLIw+QGC2Qeor
IfsOduN4hFOVbhVgQm6hYkccRZBdjt8GsxCnPsqBqKmQPX7tsGBSJ+bZ62x4ciaY7RNhXQwpiV42
L4YORO4WFQMQ5nwsdhBqddlitQcYfWwM0ZRpPZuzc0URcE7Pjb2jYt81MVnjPXJEDNSxY+IHd/V1
cNMn2l5tQlY+gDrecyW+vjSZTnyErF/EgpLugPA4ZxBeP5py6SnyNtBQu5P7XW+goGJshExqQN1E
Wl1nWVFSKxOBmEdT+RjMuDlwtbVi2btEAHn/ptUxsEN7KlNcO/+g+cmEEwPb3qU4IfXl+aHH7aub
W6t9q6Fn0NPwp2lWIARhUnrM4OqozROugKWWNk1lBTABGFASiR5Un6Ii1GgotbM1nlKAyaZp3f7S
AesNv1C+q/LGM1Be9Ak2imq826sKsae0gdt7iCZQBA9VkZSeIyMYCkP1y2IBtezW0GTovmMfZXiy
ffFuFuAb+W2Hdz2QvPwPNpt4wJHJLlsGySfAhcSckDZ3GjMof7LicBIj1MtAJtXWuvxawJd9NgQt
nnLLDNVuV/g4l6nCTRor68Iz6hB/+IocDj7zfwTT/vpyUA5CsjxxbqRzkNbXfW4ydJB1FEBvx309
MyP2K6wH9C09uYaR0w+CeE/1zPt0ic9yXRE3337qKMk7c88BwMj+cCDTYwwCyeL+BBmoUw8Iuqj4
0Vq25KA6BnjX6FQjCQSYdBHqKIDRYI1bsHDjW3g3bFghAvdZjbAqRxmE5hEy00LGkXX29+0vakjD
Gq4h6EUWPBafAeW7ZW/1Mxk8YnHj+yLNqd/M/lRPa1wNCZ6ZetPSUDUQjsnPPkZQmK5nG6GgmAHT
dMdLrkm/cHLP9ciT+ngciue/eWRebvWDV8v0Qcewtrjtjo51jREAlliw13k2D35VE9AK2lGxY01e
xjBlDtKt80vX0KM7J4KdHZZriIdHyJJEc1131xPk3xxFAmusBDEzJj0F5W8qyKgKoNlDE8U5t897
fpGETpkTmRtNLig0j1SnKU9sZ332TLQFe+LfXEZ95M3YXmKdm5dQjqOSLjvmhMbWoehe8uxYZznm
GUIx3IdIuDzm+dBKWikixnAXewKTvM7ishUO+y3BkX4xeVX3RAkeSJQe9ERqNERdjwJoO7xtRfsW
XW9bR+7G30Wut916w89L3yZaTwTCnds8U0lVq9ghfTYbtkWTAm7YYZ9toET2LQJAad8Pp76CD0OF
FxqssEpTcOvQf8xM+JAuSj02ESmnv4bS8nlX46pSSM3g/pipOxlysKFcdY7mHf3ZjDfoW8RGmVAq
qkcF50sLOWFc2d3N6SrNcfSVA9kRYAViSUPtukPcGpy6FfKDQqboPpcUUJ0em9XFqTqluVoiQqHz
45yDwdEQKFMkJiUv+4MtlIfEKCsUUOY1+FtAaSP5K/4kGQ4DI625b08s0DrBz+2dyV83ppLJ1fhc
WBFIjGzorhPQW6CnxwklCRb7JnQZhxb55dKmmEIel0aS+sLbrcNYXjT/7OUq+6Olcu+OtNgnFlX9
JTYufWp1OCZGyjhJ6yxnjl0YGtJM2rekLRIwG9vkMdDulMTioUHZzJFYnxXMMb+AAx6nRT2eJmwk
6k4Pvmbiv3Wrc9Qciqg0ueGDmmsZdJ6lR68rjRclO08MF+C84V+FqOTB6SLaxSuK3UI7mttWcXGA
1BQ9tCkDO6jK6OEPq/77HMV4Y7DxZxoP068KvTBRUEEmJxlzoGOvBC7ZtB+uFK4IzmLBkAAoIrBe
AukLQkD10Z3PsRMlRDJtwCLkmDMx/a+ryuVgZ+7SVf0LMDu7Olns1k35Y9nC8cXcszfSVCidXX/0
BhxhofhI4TkqCeeGU0F5q5RjUEHInXxXoeqlLnd1uhJcvp33E/ma/doof/g8qKQvXD6OP60cDzMM
ioF2Tg+XbuGvXJVvKmg19IFO8nyfPkaQDc1wQQl9QvKl+XSo87aezDw0l5Iy22npItTnF2gGKcc4
s0VZF6lw1/zgKgjnasqdgcFoj+kJcmB7xAlUfBgi9Y7jPSMBH9Ackcs0MpD1Q9CumRy+xfPN/4v6
qSWWUJWlXlVxAo2UzkFK5xcb5xlpntmyYb8ub6T5cl8dHws7am915N7+IT0K2vdA5aJzPNTizDe+
IXQ6UmI4v+V7aYh36BTPKt2i5R3SDS1QiI9gkckRMyoUMG2wGA/PigHU8BlzblFh9CAxGFPW6+t9
JlCkzU88ZkqpfRf+H0sBXyt4c3hZe8DKewDQLJDQ9w/+psMnC3hTCQiXsKsnGBDwxLaG9pfc+XLp
m3v3g4cKM98C9X9RCvpyz/a2wCbFFezS9JX2LGPNv6KCcg+W65EP0ULcOxuQw6GB6f8F8APchlVS
aYUDKHdknEQkTp0x7IqLm2CEgP0wR0pvRag1EZZrbhornuS+6Ln5drkUuNHXoJ0h0ve25zANwqe4
raHRm/7Cruj6wGeN3OIJSeaI1vNeLsD5IwIYCvrmfgNSq/kKB2M5TBPHId2yYmbGtgnK2q56WLo+
Or1d4sy2SAerShToALZC+7I1biy52nhv6wE+MnOoN9VZR5PkPPeyPj3xlczkNUlMMfL5JtKNmbG1
IxTekhNACuFKYGRDBZaJJXkOD8wcvM5zIA0F836bXZXHzOSV9dRiLYGPRQBtZdtOt+kzOr94CDga
4kS8PMfcEsRMakSCIt3DN1UFdiedB72vbxGd+CWtwVOn7Xl1yz0jUVZmJ8KaF4WByyks5QXOKJXo
xHbTHK4Iz47hD1Yg+1j4N8v624/tppwFv9YbV6HzvrCqLHLpRxR+BGrlvoHdXEaj8SenmKh2X34W
Umm4pPyGDcPbL33OMG02t4wqDbfPrOCS5A1CZJHoTBPGQuT6xpn7/uySIRaEoO/JpVS+hNXioDMX
/336Hex0lWioWBUDrK4MKwZSd+1byJAfkz3aJoaHdex/gp3xVxH6QMpFthpflntbMRxpvaZjRXim
7jBOM4dxP0tiHFFr7rlzvIuuj++vDzDxbLEk9GYDHyHRszqVdoc54gI9VKB4+3IZy/dwItmL83ex
MWJSLETWLl9AEBuahYkjebwTq58sVXdrKLvA+vx81ddRh16GVKM//i5f9SrRxbhhAb32nQP14epZ
l8+M7fyZaicRiW3SnJZhJzZ5Ew5Zowxc6PeSCu/aEBjEozXlYyfBtCFCny294/YHqR6DAfHuoHj8
zS1Ma7p40OMP87dh99pKFqLbBhg1rXP9c3dmN7SzAruu2Rkhvo/SzRDU09CMk+pDiygLyLrBEYPL
jXwyiYR5bSEhNu6lEda9791Zw6cS/iczT2IDe3CNUBNZBVCtgUFQ1R/4V8+wHv6IRSTv6nrG5XD2
CMtPldIOx4I6Y8d21aLP4qpts79txant47J6bgUBOrrKbrH1UwtGf19vgMO/yZ4P7AitArpb0V3/
Js5lcFxBm05wYTFo34hprudH10sIHDH7HxdlNjzifU8G4HDiX8HEex6TsdCpaWIIVLPTh0Et7FnI
jUxvpAM7DtxaTThjiVIBOsrtiGdKUJjifkRj+DS4hpeRoOq2ci7KqTP/WrzdhIk7Z1wSZSrbiwzq
DFDcAyetGK+dWF15iM4XDsY0Pl/7CaFRPO8zhAbJ0WO9IoEmiNcScZ3F2mtFj+DF2rLRrnMzxyVf
QJ2/nQJmaAizlNZ5Z71C/+tAq1ChFY+kb+gN3+VU76Nol7g8/Spw3aovjPh7dqBhBEa8gkPxFeZs
8XPz2oiCueQefXEguWKHvPMTFCGy4+9tLFwr3VgcgVs9lGM/UaTIevDBsNw0NHxffPD8z8/5PQ3g
Ibz5J11MKBKBJvu4fZSjfzX0L1hwjCeZMy/irfaOA8ObaGumNP/Y0N/ohprGHhqaIXBSx7EUiWnY
3wzSYSJVgOccYiTjPrJQdO8hni49B1+0z2logI1nnNcVxhCydGkJo9d3Ed7y9iwAyqlvrrBZ9kfa
+EeuZvXnVN4uBqAwDRk16xJFj5rcYXyAIl4e+ZEJy5UVx4Bmg2bsS+7sRu9VHmfCDclLuTwo3tY6
+yAdNV0gUwesrD4LIfxSODv9BWcHsZIksFqQxY5Z4xeAZlMTCg0NXg28T0Q78GaQO9/5Os42iIlU
fr6tVM6McE8yBbpzxND+0Q77kGmnmkVuRpJ2GREzOkQxPbl/H8+R4WXVJjQPHgy31xUKoPN8/sn4
cwreNfsEaD8EEcCMl3C8olz4WLg1wu9WqjPYn9MnRS792+Hotp00lSKifzijWCQJPfFAPskG/PXV
1IEXHn8TYnprpgn15C3vRHTdr76JMdWxvxgDZWrDJL7s92t+oDTd9Ju2NurbPeIsMa4EsPHZlN2n
RWpllpLCnrQRbRNHP57Pjh14dimAlWdND9EANoJvQQbhJba2vN5W5xMWIP0dfYntL41NbkQtr6ii
AgYIR2wfxIMTIzgm+VbpeoLXwb9jJVwRgNyOQTfMliJz3jnMV/18KmIKOWJ/ctHo/By6Hexb2b7t
TMNBqW6OMCbqqrWAMG4UsoVVfYUpXrxoYMZopyDwvzzPK/k8eX9d7k4Rvxyk4VsnL+bONDotOhb+
wOXHhtFG9zrtiUR81B3hR9Zft0GiGRCHQ2n/PBkx1DdqGKlwxBtgVxtDlLiJnS7fhf1K//iZjFkY
1J4ueCXeHVyvOUgpCGdlytIGhbOKrRge/HharWFJMV3gR0RCgwulZ+0ZdyglzHznCReV3hzBonxy
lumshhk0HDdkL3WUh94Oa7ddJT0w3E7uvHk4vsWGMXY2eQwg6lkna086WRwy1SshKxsWVZFdWTy8
4bdzClJwkucu4ZSGjiwTOcW8WSFIuLGyPHE+6xBoXjUvNe1oooEGpZ0S6PZ5NWYXzJOqX/VdfK7O
FYcRXCy/OR5cu75CeK0CS+cbk8OAqXS4V2NUIhWYljwPMnT4sCwINrH/a6lHViBGJ1LwTWo7QM8V
nPUz5rUwL8sKVyqQJyB8fBdaN/pibPvHoC1ZIZNrScJSI9D230ctYYQ5JeWfvG+0ZRAqGq3oYjBx
S2NkFYsBV4rGsodz/7HT6frsTCrwuRd7jg4Z6/40gtgimw4KSFss5rpz13PS0CJe6UfelE3nfoOs
Y9lG82VddaxwD8En+OmWf5B/LLyGVE3eHvQL0Axc5EBsu18rMSj4Nsl72vw6iMCZq59liMCuHOZn
i2KAH7yyuZBQ+U6c1BflJktZjGfQ2xoROxEqrH9YWczZXN5x4aRPs9u4iQhBRp5wI0Erg/6zr4In
O2gquR4Bl2HNOshgRhYrVflr3FKPM4Z1OI/m8t0vvxgPn5RxfDtn6fGVNKNqCRxq24zqn8ELg5dT
hGwHeTGk6q80M1RCMjlPWV/uO6ErC+ZmQaKv0XI/rhEJ8/yjGk79jQ35I54+TPOlyljXO2lakvN2
oCNeQVxayq1E9FWEBNhEbX+lblDlXRjwB46a5IJXXuBx9XrGeo6je8JuEtEH5AnuMiGZVX8C1Dcw
amD3fvOD8N6/6Ipzrb1DjMjrqyP1tONVIVfUuugIx5k064Vwz4R5uq0T3xg5DnJLJcsRkDAiWKn5
0AQ7QDD/utCHlX0BigkM5kX+Ph+yiJUWQIvAypGS7miftEgjDAZuChaRdHCtEBe9JMXkovLrwQOv
0HqQJkpl+8pldHfGSzbohfgBmI/4XIiuv4zb/KMN0OgR0qg+gWkhB1rLNwb2MvacOxO2kJsNPlT/
VDhl2MsJpP0gQOSldtKql1envLFw5KDCqt3Ynnw0lSenzA3eh7spK3NlX3oMvkP01PwNPasyN2Pr
OpHQIAJKEkQobXVTyUEennVDGS9FxGqbTVD1mNws8lZOqj4ay5y4QvKsditEXpS3DaBEfqd2+vY7
ejUVev46w5EA6X699FtXWVdJjyBWcFPqqxYrIGwaCGX/cYDvn07tepTA/SU6j0d42OE4eIrWYuL3
mWMVVK+Ox5WZkf+D2tpqtXL9CXJK22orUlIRvXgt64MDBYtvax4j5xxuq4p5N4TviKW7RFDNri9D
9TqUtkAVR2PwwSI0l6fsfVy3Pmpk4nUxWay5Q1tpw/XFdqvIP/DralP0N6G1jrTigTdgbEWm6lxz
/ESltHMy5hxBhu+Ict/2f8s7vkxvWsRBiDZGXVSMAHDqmInJiO200hbnlHNQ+7q7VcbERx0w5QyW
GKJV7PFL9jDam39kDWBEJ8ssu09Uqb/k9rBAl47g1UkRe8XkllAXewCb5zi2Lzl4tWBDZel2DNBx
SOmuUZQR0Rb9FCqddDfzW+tRakj71SoPt+yeTxX8oKp35gGh4Ts5WyeTsIH8rz+IAIk+zcxecF05
ZZAhYTRYw9ZGOTRl2RQ57VgJWFKDbRpiDJ4l92tLMN4RvbKt5rk3ENppDeArfjg689bIVwQMfvAu
RWLuFSeRtC1PeBbnyYue+EI7AKsOpQ2kAJduybzxa5+akdpckmqPgB205p5LPd5EHQq9GIjeiXOd
7GoSZdXRx3jYj3/NUtPTPbMseoRfZijaGcLrEhqkHEOTqTBpUgmu03gFy4izbWlyhyD3xTjsdpf7
CbWkOUqxr4GkHUXqV4DwryH6n+K4FzL1f6DYF1c4JX8eQyl4jBei5APQB6A0ip3FGwOLeOegzYKA
Qd3DrIC9bTyuAc4/wYWc3kU1PLUFvNqCFsy+xOVv6BpiF7Sx3CRH5EZW3v/PzCllbOmNyaIFUfOh
Q5bL5O5P5hq/qnnnX/ubgS02f66wS8vWuE2dmPiq6gzbIBhv+Cx6BRZKyQVloa9sDcCVoTcCUK3Y
6Ys3VV5+e2dBf7vcSIHK+boHLY5dnM/vS3etskOXfbQXuGOBN+D9ZfIhsKboR1/5zyLZj3ZCHgZx
GPLCwPJ++OuxkODhdgaHv/PqH1S39A6Tcs+7lLudH6KVu4aVYaJtHjvGNiawXrUfticTR2yfLuXT
oRq/Z9cTi55Ky3PZVXZzlkS0t3nHMUgkxOkwPcJH4/+ZBpFMRV2ms8uLvU3Lz8X6kAZoMTrav0kh
JM35RjphGJhSIUYe+poA92hEqoAKYgEg9DNsroPWBytvU6MXdMlwRt0oF4JC7HiavF+gNwBUggm+
KK9dsY20K46rIILT7C3pqDCke+D0bzHUfk/ifnuNHrrqgkNpwXb3y63rOco+yPxQ9JlVOwpFu/Ka
upsM+Y8dMqivY13Vsg+NcVg9NoeWZubCNwS9nThEGJ26LecRKY2rFzta4o8Xv/qTpY+xMicDrlu2
2EEKXOBTzp7ltP2DhVTUh8gUkS0LdsiIi+/keFpzKvFASQgGpv4fhfD/xkGaee7N/mhX9ozGHVWk
M195SX+IW+L4WGADPakGZ00iOhm0HC4yEF1scm6pJyjhPScO31N/Kk3hNfKNxR59mJlgfHqaootx
1pW4/vffvrl3emWwQKJhxvdJEdZ9SDI0FSWe+CFxosWbwVpSplNKW2eZE+9ihfrF4bsqPtUENeaY
82AtZqIoWZkKGSE/BQLfR2bQ2jha3tkkiCnzePPCTaW7CFQKWnXL9DFikN3skVzp8CDWQCQGY18Q
ngz30eUR3/tf+57ql48ru1w/zaO++q9Xqzzu+k5ZIVhNcmX3UrWLUACrdSrcxHuknj0poQ/wtn0H
DypYF8g60che+DkprHOox4zHpl7ZfBQiNoe9LZ8QvviJqRNBVIhlgFIrwHHAnlTZkbo7S+xFHzpa
bKBHjnLeVZSQebdYQjjf/SGbF6lfVH+b+APWDtTbWY9swdFiOv51YwPGmbZUmcN6VT2dubUEzHJr
4g9Z+Re0BKT1SmsEcXPnSLXo4wfqxPDhJXaZAb0xcm8VD7aNuqg+Wim2NXTBYktipJjSKI6tBpEQ
BBXQojtPRVZJRwBYqxeG6iqaTN0ypm5NzkJOuaPu2MSDVye8SSVW1xyoEoecXdoiIBKl/FvdUhY0
MjcRX7omVOdsoNFKAr+MQZ2+vnICXqckTsKSuR/ldv4qy+hYDjTqFPXhEooi2LX3i4qntJQs5mvA
x6wEDxPRyfDcnKIM5SHgMUVBijHC8Ud1xCAXe3xo9K/uP/um+oeZW19h20KY9e1T0kskz8Syus8L
0YlzA6WFwNQdqW1rSnbTFPobt9nfpuw8puP8e5AEfEpDzvy6qXtH1Bn9uzrrLIfJk7WjgLGxK2j2
+eZwZbXVSn4Na4dB6CWVd5h/vfM0zmYYST/QCBOUnLgH/MTUd52Vt467+/NZk7nVT1CAhInXQd4D
bL/QLt//0bpuKwnkt3jkSRjM9N+QqqbFHTWshS2t9UudVgv5q994gzxjtLeVIUX0JViFoZouKu16
0EPSvUgYdzxR9FvtTVQltNTmRN4oYMYOfQ33lWWtbVoq7hkk8PgANcn2+OVoCM9TvH87ynFVGsT/
kb+F85ebcCl7ytwcfinN973N93tQpbc/QdNl1I0N+Q4ZXqPtEgiivq1zG9vxSchIwd3d3TnCuk2I
5BxZJ8IV3P5TCahOv3YID1qyTiWZF3OcuGp1yv6pSsAKW4xctBekga2jzzrCvFYX3dmBkPebuZkX
ghV9hMO3aiGjTMzinLlJyQx6s2uX7QIxznk+WGodCJzHy8B4IeTkgw6NmKBMqMIIUJRskS0oArz6
kBp3AoEOFQ2A9Z2JnGoy68sd3QcQowbRUkPwJ0/ZvzUvDBXuvvbnVVhl9prhgRBA92l7q5WOXroW
Zy0+tn0JPmB32S7KqKbUIAxmBLi+xNR+T6cgW+M/CZ5Ms3QBjVc7sCdPGp8byuR2siXo+UqOuK4/
ffaaLgmtoM1J4Ow87oh9m2c2uIiolXZaNVsmjYkQu5BBe/g4koYrEXN5iajAYQGG9cN3fRWBi2Ko
2Mhiek6ZsxCWMSCu0o5NWnsainIVr6cLReR/pvcMdvIdugfQvZFvVGwQ1SyuoRNRLQBSzsffrQTF
CUrO9a4WGYerxFGLfzTFRJOSVG5fV/S0vvsQ6kaRgQOYv5nig9/AteBUMbV8F/D4jW5mQU7WstI7
/nFtP6of0fcybX4KcMwVf+f9GWrMr8F0ZxrAdY4Cp1rbbhQrxj9/+Aqh8fc6qi98DFf1zyeJLjyc
0348xNzVb4wJV5kCL1XZLAnY8R+ND9kR87Kzd1PZEUXx7/SSBi8bky/XGzV8pqOhJFalfpR2UHgy
YCc5HM3TL/O2BgGsUVY/A9DcZQ9vG8Zumm5cSzhMm5LtvXn2jEvLVknLJjAtcel/w19LQDTR6W+8
kKm1Ce2EolP22ADme9bci1VO9ouvYwz+yW00uTsulukYPMPC+vDJ0nYp5meuVBqViUSvro3iNXR1
6XM8aJrGSGBWExTKlDl1oWrvOIPfNxZnnWc1J4T+em8B034/9jjup8orYVYAS3FR6AiFQtN5Jrdl
0gtY5PlJvJaG3h5aWWRfVal9gp57tCgzAV7ntG/X4utFNvfjhEkoW5L0oCo7fTyItupIPQ//muTM
qqroXe9cMHu1BdUZQ1mXbzd494SGXzzu+YGdQMbpg11GTKof3H8kxAh4UVAIcrR66yazpFngzP0U
Ad157LoZZUQjUl0eRM9mYMp0vD2lWEi39ZZ5HI1PxlAvEXClIe6PZQ690tNwiC0rrX0IxtoCNGg1
hfPCWekJeLgjOixW7RYQbvapfQKuCAJ7kLvaeLx5874Lr/nvQmk27Pmwk/UxxfIdC0cFad6Y/yxB
diHE/myohok0kK6kiApHsdyImMK5g6vq4cvQ+HwPqshxWkRszcRsJe9J32eLeFwJDam9hO7HEeq9
79U16MU8mXqAm5UtqbhEaZ/g0Sdj7YqiACMPYmOzncINz/5xwjUhg1T7AOBOHii8VcYkhGxnG38g
zgCq2aILCRfZ+bhIAu8hq2B2kQ9Ysr/tKiSZwxqz1UCpBZ8mwiiniMuIhF8+PoC92v0HiWcOUM75
LKwzykJi6FuK+cieSL2wlmb2m5fhzcUg3ZvkhL+qZIfBxSyqS6imT8QynhXxnwvfzGWzND16Gs1V
4SZBV4I/jSjGF5byAtNsv3EnuWtkoDtLg8xEA6svYtC2MjeJV/dp6X2MmnDNNQpsoFNie/UCbzTV
o/Y8+s07K73hwfPa/IQiqi4io51muWak51n9tQmjy+IT6ggXYoGJBo7Vc3jDiQ1MlItRTMdhdFnZ
55zQb8TB7yMp1Dx7zygh4mjaLpOQQWXr6WXZuuqAbKSpXQ9e7Ra9xbUu7/esMZtqiXP6B7UcTPr8
JSRuBe8yqI9umA4dkiX+y5Pcxao1NiTC7DuKCcAATyuO4qA3ygZF3mQynlkyadvPMTkjSStpazhj
/Fz4n7W6AaLAThUarDQ2HYvmSfxlmiTstQGDv7A7/ZJpIKHGJEGhnxlL07Smk3PUYSrvgp91HaWl
R0f39rkygTWJ+ffAuk9pu9+35aYePm/dYrJUz9BhRiRKnIv2somp6I5NogTBoijpq/39f+wuYsEL
2dKLlwtt1B9TkZ1fp8GNesScXPDlpF3I9aiZZ+WlvEf9tUliQ56Z4rwsToEZySmrVKijY4W7PwCD
UMnJAwRlsG2NFUJXfZ6WL1LW9EgKKbh7IorOBXwmTQlNijUbrrtT2UEBu1VUC56/hHYlyuVpUnQJ
JAyKFF2NXuZPw9yGMO5NfVtpv9LZESzRW5/Ehux2nKCkz0gE/tNjdVAovjlx5JdLf6AQzzWeXGuc
znKoI29LQoPWh+V9ETLP4NFshmPboEO2Zq/88xCalnXr4oYfF2pme5O4QcoipXvDRNFDp4VVh4PF
M7brXmsCurPbwUgbbH6oh8SO7oQF6lFYlaqkYmeMLUBRAuI1QsjlXwSBtc2oiP7Dwwf7bq1ZN3Iu
6Hfnj2xBNhVT77xiURnaVmcDkbSN37J/CK+S0IL5mMAHAf0Bdec3/QGgEYUW1qsSBZyB16DoNCRs
xuvSpy4ZU117po6ERjFtqMr18x3XXt2tr8JTJygliuDZuZHDHQE+sTZ0sIiXqLlLlLDLhpoHbyJC
n5hB9U5fdzE1M15psktZwxmHOzQiVIIh/g6BPxQnBjnU2pTV97DM77z0+3Wm7bx8Beycg1C6CET1
zfwjSiKfEIIHUGCgiMxjkIKCn7NBT/ijpe0qhKF6e4R6NAcz/4y8jIRUxKBaV5Qp3LveJlIMx8/7
/vHzdXEBrkMu2TvffeLD7SVTJUTlyai1NZyj7Cn6OQAOeaWEXqgAC/umjBS64UpneLRir5kdQ/Xc
WlQCZj0AkUaRIYxoQxd5HjnPiUnhUTmERZjghhlJoIUhuZXccAXpp4owMSMhb/Eke3dMADqAYeLj
xHSmHVtKg2uzuIcgwwyJIqk5ANM4c0HmD7TMo/m60cqkG0Bt8kOZkCXV+4zUAVY9peqKM0uWwb7r
xvbrnQynG9V4xbG5rO7drdfaGr/Cy+MObFvIkQJhJaXQHRGBolbKTGN7HFDEY2E8jjTNWli66baf
5G60tpLjzLvsC8GALyaadQUy2yOJGVud+VmTOm1EsQBlLvJ/LOgiXAOL+K9VIE1U5xb7v0e0cvan
PZNLny+hTrmiusde6yuU6wT+WaBMlzlcqTx/x9K5jz4qY0jQjdHrk+0r7J94l0yytgnal2GyCLiF
qVvKsVWKePtJcz5IlHTOBNXja+8k2QzSk1W1Vxo3SNFLPMrmZOdrQYyc4NAHl78qQTzNfR68bIAS
sFOVRKFL+Aa/oHbPkuJlZm4+djpIAvOiwMF308M04XxSYYz7z4uCrq7JqfBcAMMYNSDjJkwtpbvN
SkHs/0um/kOBIJ8FydSpaHNlI1Fi4eJ9cRQ28FFBh94m7McXWjxDgYZi+VSiCY4gnZwW++PK3kZ6
Ny32C9bTfNoRglzz0lk9ZxOL4QbKvM/56dzUIQHMSsnFUxyjux1Fr/KMrqgzxxecpgkyXmQZXBGu
yIzPD3F24uqLJM2J22Yd34WBh1xmfxUUL9mP1M04tG2uq7HkiqVZ7B9k7gFRNq9/fgGxro/OVvqQ
Zr3+UVfjVWomsIQmWpiLqS2Q20bStnRAwG/rQB4TDffaNUljjkJCVKzs/PW5vDPdUXtPoVnI1RTT
gz5F1bQRPtxYcqJqB7hi1JH2NDFs6ftrnDx8IwrJhIvx6xe84CpLGfZ6F08uESDEUjtrRbEtHNla
lgsY22exVeRsHjmJ8Qste3CjxDYF6rYx/SXsYAO+0+n+8+VcvWZxqkoNGjc81cp4ZLYHqiLaHDsX
d5d+uIZb8AUW0AGIcNvje6gn5lXMJXEiq/WbW3xXwXWsvpOsbrQyVNWwURxgrkyRQdi0KIPGBhan
ko/B8K4RvRT6CktX4xn5+KymbB6HDnW486APcANevlukzMpFOByYNWxtMjkhOhJBXN6GuE6LumRt
nrhg1WN4wYLQYCJiD+T0W47Jd+L/1Pg46fDvcNHuOsXVG3g25S0ZWR3kWzdGUPcXD9iYJ9oEiIcJ
hp/EgHn4SPHsiii7sS1eCkwQZlJfdB7W76Se01ZUH3HFXIFfyqcWWepwhw8g40dhrAorHJdBXTuh
0n8MTrmP+Xl9vC0VPBUjNFwfKnvq0C6lhThDvHHxr3UJcqJQaZZZIBeTUE1uP1ruYXMuY340d5BV
oDd4q9TJ1/csyfkPSrH4+aGhjX0V7Qq8hm9ASTOJcaR0XhlD38ZtKSOgqGEoV8TrdbzXDtjg4Ege
na5k0CWv87wo7oIOdEfvmZsMTQReZMWU7p3UsTInCTLz/1U8r8PUde1iUBkIp7Yx/uxgY3OIBJxP
/O1c54coDIHDvUz9asIZSwz58LvidTzkicrTovph/ILVfgdmcJXQO8xA7TiwAbNJLyOTqqJggwZG
h+bUtzLhmhaF9QMru780gpQ+ihvytKBVQash7EG6yq5MwIvRvsxytY2nyO/dArzm5DKrzm4W7Ep8
FITs35JqReEw5nf/jH+7oQNEOybkvpbkcNTzmBCgiIsjXggZTUjmcXaveR4eGGMhGl7m0c2YP4vm
bmt9It/dGKCqybBLZCibOMtWkEm2XJ4ytC1sDzBTAzDUdM/K8SynkiwLmVIHPLU00TDeMmJQWC8V
sZ8zMq+iQ09qEsaHgQgimupZOFTInRX8gLwKz08zQNMHWm+I+8MujwcWfLQP7YbfS4sFiQlr2hl7
R+gOvePrKAqAZQn4rd0CmUCKJB8GKZxfpC051B+UulYRc0hu1KBG24MWv3uh/i971rBHp9xvDRx1
3sz7BHhTn8kXxnY7IqUdh2QkenGKa1IJ3SHdf4IXi4wt4sbu55X91F7iNgaw+OJ+IM95QysDzK5g
Grxhtl3TZ/nzlSC3omMhkusLIQssm9d+HXYewbObI+JJcAslATfJesjo4maq/uKX1sjYRgyaVy5k
Lr5BWNTmWrFoqP+Fn4cWWatk7JbC/6tAvZZ+O9F+9odmrNaboC+mbqomKVQMnmlcHe3gCypvlWLh
aeBn9oc2cndxeehRL66H/01ZEHKwf3TweMJwmEuY1Yjy1uSxKoytVeY08By/aN1NjT0CRK8wl6Nc
Q9X8ehfmCPMjl6rBDJq9bhPNHRVHLRKBmJPtR+uBBSpEqfEcQ2VVXua5wmquj9atWFosSi1UmFRG
kN8N5NrjurmmMVCjlIt3rWwNLqOzOw9yiq0uWLLCxSv5csLh+VuESR424Ip9GL5pmWcy+I1w/SpL
tl8LkQ4eTagtMzPqLcAODQYafIZglXG2GybLSLjkgPtzEl54dPKc0VYzHjgWWTk4n9+vQ0Gcb50e
CZqraOiRn2UAbjEoUFj46ynfX0RJxZi9qg51KSGFgrPW4XRx39/AuFcSkRzrbA9vunpLpoA1c6p2
s2MUkDOAdAjiW+90gGl++xXkEyviLsruSBGqPhyBMWS8HStXEyXtPwsQaPqHPo9M5Nqr9C0D11j/
VF12ABi+iBicuLoOKZwF/JE2e01S8v0NUsBIlCLvigWY2MzeFxSbToxa6Hijm1gdkKNg3UdeFQvl
KMgGBagDoSNOksoTLIsATt4Y+ZeNRbrG6HAy3Q8o56pNlGZQ0rh+X7ctFoZXn4OQhOIl2T+b2B0D
wUFGzQwOG/Qa9ZriOGOs+x4FiTJERYujkn/d8UtqH7OmB9OtfQSDmnStNcTMOeQCIlKAiytTNZ16
O4bESxun4ytTm4prJcH+M1cnWZQJWaTSpCSbKvvKRS4XLsiCzXgl8gtCrJbElK93YhC62UCeK4o8
rqVFUHvTgyX8PispEwTmQtFUjzFdQ4D2Fj5lygiU227sc39giHZPqmoJas8vWXqjMhbKPokTJoOq
U4zwZ/1xSxXCg1r0m9VWOWgTQ+WxX5iPWc5trFO3S9s3dEJ0zEpFzTczAhFKSjH5Q4pUSOfMSIHa
rlr5zVAYLjec+HjcrNvkFjO8ryeMiedPlCQcmrmQ0bl3TbLOjOorPWzzkAu5Fxu3Ft5X+lqffkny
iK+WkQ6gHSeS3/gILiFMOySQnZKXkUzAp5ILu1m5XyKKzhY5c8sNhMjrD2i3mn8QhmmK9YLkj5CI
BTnspXxD9ECpoBy2QEoWRgZA//Kiim1FzEj5jlwctAHGGTuI+kcOP+v0vL1qs4RtNPzca3GEoLWQ
4N1JGCBZu1pvjXaGSY1diNnjQ6pxTMn2o+smdMFQKaxxUNMJ2nCc3zxc+LxorKzZYp+WqVr33uqn
reXFdZ2GaAaPu1Q/sBtrsglwgrxOMtc+eH3uwbx9mVXegWrJ/yLy0D4oU2kZvTrnnGcI8+javbUw
pBJCW8ZjolyX7r5ZNEZoU6KmRqotTZCoaCl2A9+QkQBI1pHvxA2S47YnKclajTn71QvktFsmr3SP
bMBbro+4AGaRiiKLjoEJVd3LNTSvNa4xZBHYRKOERcak4GcTPC01Mu84mJSxzA+4vSG242lD7AS0
3v1a2m5cnwMgASkjUBjPUFquSifEH7589sucGUo4VAO2jPqRtrO71VX77yc30iNUtSarhvW/GWcm
mO4a8aiXu8HAEUtWjK20TWxNgGckttnIDiCnG0udOjppZQpccbqLRNqkxFx4q3Xo9LmMgo0qhyV/
pu9x4mlkf6dKw4OSgYH7ZzxdoXmUIFR8FhIbIn3I/t8VF7pSWqLv5mHE1SJ8YM9AgMZdvNOIzNQu
O5fcO883HFSSepEkSs/0mI1iqmne4zHZJWf/0mGwYmciTISliyaNOwXnUE+Sr5Z+FdX8kYJhb1sa
vj+9skLbV32gi26mml7QKeboSflbIqPN7FQsnAZ8mOVNVHsf9CdaUqky69ouFxD/p7xFhTWIzr/x
/425GHvbMnkaRyNHeh0MoOtq03SThluJTTvnSbChz2I+1buOJ3/ZpjWGuNP7lCTIImupODqlqZIh
SYWGqEBgQYnsvucrphEQe7UjNv+39eHrEQP2Dr9MUm1BVYRJH3ajUoxMrcLou/qiPddQtR4cG9RZ
gS7XqXuDaEJvhaGreqAXmGEyUs1Zipc1Xaw3Ts0Ea6YvlNziXDvzMann+F3+2Jd5jjp+msS+t1od
BmZ0RK+sOWVS7EjMOfw233/FvNvmQQwbrb7VFERka3TPGQica2Oqsgaa9ZMSYrQYl5VJ/VTuuQEF
9uh0DVu0wBTSLxOezqFTIWE6a0IucVQS4Z94389GBlEZ6TcOMrucRrXjPMpnKjr5L/QzSbrCdMSv
iB3eEFq++8gfWb3JDUOUGPCz9HEN58AMqoIGy6uHoS5ePdrWlhqNtoByfApIK/IBO0xICP2gCuTX
bDfvG6Iq1eDs6vlsH+dZeBB7VbINdlQIJGEaM/8gfRi/0AFHCxsLrgNdg4cy5t8S6rlZ3eTFvVwH
GUgSI9OqGQmyCrfwV4HrQNcTK5tJwuK04ijm9eURtqSy7vh/3myFTvAd67hA26XeDLaX3kL55svY
L+qLd6xgodZ3RpVbEBCzvHUjkUswI5jfDEEOl6hDqRfYegQrsJAVEUb293ayKs3Re1Vg1dpi7CH0
yYVXlRS6F0PK+VfgJyM6Rd4qacIsWJialCg4pOnIq2Sygd2+RZch8BCRH0a8CRzed7i7bFNcEZLR
yM0pbafHs/zTOVzEOlip8TVwHez946J1BEqB3Gk7aSCp6vlROp7iqPgv53iN8hYgFhtpMMA5RERS
dLMSp/MPVdUMoG/lY2bFOhgugbiwD2Z3woPPHdAO19Ws6LLDkf2emoWqJqXqD0eCdmpZTMfFkKQv
Joo/zo7OeOCiNAS/oebkwJ+QpAtpr+5LJrnWOVTtb95mzrwgyVsv8qWpFTifbC6cgfWEzK/3yKbL
lAuD73Z+Kdy9Fb+jqYqqtYz0VqX/Ifl4wLf4rsqtFIjYx6fFXy65jWTx/725Q0sDVwWgU1Q6U2kv
dGOKQwmwjHOSUSNstVsJHR/wIxbq1zykK7t3Nuc6cCG/srXQpRqvSzAFDh/0Xqe/v5FMuhoXWNQK
7MHO/XvyJdgKMd+2VW8QlCP9vGydDNlyLXAd52MY13soaCQdPBSs8EP41LvpdrqWEx3kjMBJw05Z
LkPlSV95nBtXmt2Wt+YXgKIYHkIADZr5orIz1OXAnWclmuIXb32D+RKLLTqStFCjCWJ29MTXTEVf
oK73udBG5vjNTT9/SQNuisKYII8yrgLnzrdRBRoGS39osT0KLkqZZNSkNbEVdb69wuMDKt1prqRK
XW2hkGaVwWOBlDQsCEIy9Kt/vSl1XdS6T+6VePtKK6zPBqOQEVlrSibVCV6STZdqIBTFTCNsFMpn
/ayMxmVhWWe9NIqTaTUWQNzRQYcPwXKMltNrjArW4wJhcL+p6naPSrzkn2NegLzWyX/jUHF1pQwC
m5yWAlbmhvABKUAEbiJIupJDxHcmx4LlZwtOvaau0V91JTeQFrK5lU2l1GHmH61a+Q3WSzwsW48/
dSa3NrAajMbdthueuivGQorqVeuCi0lDL2zSopFiGDPaQSWNVnHf6Mh8SNshkKWSvI/pduziCKWT
70JGW7FQj9BL1oLEYZwciyBCAeM/45QlnpwIWSwtF3yGRTnc1cwla4Itct6C1dI7xXoYac40eHp2
pqRet4RTl22NZpOzdutjOw9Z5RidEIuzD4h/gl5Nubq5+S0RKwf6CGumhLdkCPY1l5TJrVd6JU+C
KzrKWf+/aEcAFcqBpEWcArna8ghfxlU2HbK7taU1alJwQ2yxRbOTSCnP1Olg7mzzX/+IcQ2GZUjW
o0xJubibVqTq7B0L/RgdfUtZHCgUYBm/A7liLpPgq5WQlWgrtVewTqiyZ1ype7eUhF2jAAUqvWlx
o41VO79U+KmO6D/9dDl0SDYp5xiVUtN9bsPIKz0coTK85eXR1nmYAOraUPW/lm+gaUXz26f8u5WV
dx1ujoszYVLSybE6I2jPeNxENrOX2WpxhvBcApB+SFD03HD7er1cv6jjYxRovCJBW52r1TTuFBWS
J2aF7c+HA+zBZvn7BAk/7ei1oF39pLgmiM8vDeMrIMK1eEioGVvg82psxPoAUynGSaYVBtyFZKMB
/LG7N5CbaPLMlT1baQ6lZSoFeRL4wUBrpovwmANHJTPVuBReha9tSDRDj7E4cDm9rECDROCM/LsY
ng2sEt04LJLWMeWcAvCHeeOjwoApxjhVSTa+EQg9EWk5SFYamF81GdmcOpqH3u/5SDzVlzoqOv1Y
at5lA2s8EPAZHgoS+Y1HeZpe8qU8Rpl9THqRUYgai9Dw8p3MIpehKx16uvBdERGuhdLtBtoTm8vC
8utiLt79DqDsFpkbk9pWPyKW+E8/2L52N7M3pAWETrVSbB1Fj+MEf+6ikimPujgigLRNfUxMXmDt
+0VUQS89csEWBCW+XjGlkx+P+JQo+w31VI+zxfIWx2jBxozOu2VmLx7eFeRv06TFEIKBD99knVLi
PdnFK6p0WZeblC4HXyjE0nKVU1/sGJ0CZGziwjEzjr9xFnaQHYhv/CorLvWYslv3BnTtoMmFrkw9
lHvofeT6xN9K1vsqeHXslZXjW/rXemEGw2rRe01y+TCEMrW2D9HuHIgHiPVwpzaxPlyxapk5Eris
1JW7XRFE14R5jPbqsKqNIBobnjHE7jWm7n5ZjtTkW7NW6o3EVymImFErzenVXXaAqtz2uYlFRxzi
5zDIB9juuyeBBmiOrnCu4vi1YhlkIJJWQHBnaFR/ca+nL0YeVmJxwiIEbEVsU2cDjFVAa8uvJDnp
M7y50rkrMpRPI90NrqbWwIgpZr0mbWIkT3ouW99bMTAqRHvWqXH4AxVNQnGtsH+C6Mg/ARAFMWfr
WIKMGQyS5ZS5rMlvTxGFIgzgEG9nUEX7zMc0CCaBQZO+uhrPVEcPQhYL/v2tVhJ8CTLRegpCWgv3
aiQ6a5i+hRX8RiNVSSraB0ar1dX2POXkp2pbKIuMHIyunQYBepT9Onu9Ks10uN8lQ6UAiFAhJvf4
6WDhBG74B9mTiUMZ7TyOwL8mEoYcgNrnHbqCuYbqMUB3iAEyhb0kX3b4T5tOJA9UTxjIBi7QzfFj
WeOG+mX0qyO9pEA8z2LWpQhy3WI6ph3ARdT7ZKvavV6w9aiOzEpUMR5fgNwOjB2qkUCSi2c7ifsg
coqludJZzo5I1CaMr8YnVmh5FXhcuXfrVuhU2Zt7pfVzcF5+IKsS4PB41zb5Bq+nrDfjKSJ3YXmQ
pA6Lx1KXEdBuGnxNqSEHm4F2/gSy3WNv33WDkuPIjCEf9urUiHVXWlj/j2e/WYWqrF8FayCl728g
URua0foq0WghXy6w2xFWSYTKdre9LjGvIAVPdfGsDloITuai5Eb5CpWqja1Ith3giuMYSd5Y7Ddj
IT83Qz9EuY+/zsKWpzcsgjCPsDMq/esRzEJZVgloyQmtI06UgpsWxuSSSQSiUtyc4CxnJ23pfGXp
uX7lRJ/Axr+j7WSIepvBHkJHaYqNfHTSpN/PAPLdXsnPgXiXKo9GjeKvWcXHkLbdhEdC7esiPki8
I2Us9Qd3HZFv3grDALuZo67oRzcIlR+DxEQvVRi7PQsFR6T7jVXQPvihGrUIb9l9XstzCQcL+v2X
aWq8W3BAFmfCa4XSed7Nv9yZ23sGDzyZm+aBUh2TUkuf9mj2kU4igJeS1ShOWWCioPAsCkYXroYu
8X2gArdtT4/wLEVTOoqyhLbKXhqNS5tDic4Fi4idtIh0HegwqS/fFHPQgXKGRacxsL6C+6yksjeK
8cVU0czRBaR6zy3Pa5xIWYHRtxu1XUH9o1HdkK2IaFtdErPghzQjau/QZ8v3oBM2a1+Md8E1Uq/f
tPV0K33G0AYvQ8X5FJfZ8rIMuS9isJj+9RGa08B9efiP0g41R9HBf+l/+gSYYJ/ULQY/nRYEnVyK
ugYKJxd4uwEPQwAL+4y9HK7vPlLxQpvMuLmcZ1d/9DlOi+CS589f9/lSZoD8OmLUGe3Io/RcVOJ2
+otIEWFWOqDPAo9r+ZevaqXf9hOc266jUQkCkKPh5qRsfq55VrkVXdd3K9dtANcCos5R0skbl8kL
BfdDn54aw4Aw1emdq/3dG9j5fanQR8BQESkmt6kczS1IcprqyYtDyhkwcAOF+ZyQL6mBdI3nfys0
rHuFvQR1K59ojlIic7ZfCkKen+8N4W7Ait1npCt9MpWoMMaODKy0lMWPYgFT1zD8NvHljiV0jxe5
vBv2nL3JcEWSHmmJU0xG/Eq5Y/EGxcoP8UtJAMVzU3WQ79JrW/zKHQ6KDYT1E5RG0VHBIrk9VdQq
AZSxRGZawRtGKlYa9rEhqKYjJAS2nUJf0wOYIt4EIE9Foy8zCEuaLSn3hmY3z+fQhc8ZiRZ6DRVx
pYAEKXrj+Rxy2lH+FFbJK3Vzn4AVNTonEwsSqn/9CC+Fv26UN2b424I3h1oX7P2VXPMCChHtx4q3
UZ9LxVwYWzJkrOzYxskTTTSqcX7KOVB7NkgoqWe4u8w7WQrdDugBZXB2vyMXPPfrYlrTm/ApzkaL
dEZKhPjXAY8ik/pKBMgTHulm9vdsO/inW5dT41QbrKF6RTyIh0/23hm8pZTWOD3Y7tG/eTCSNtyK
VEB1clHc//uURJima1Vr15YpFUibpilyeo2o3hCgBHxBo+YMAuXCS/crZ2utnGSsF27x7uCE3C/3
GmFKfClCQtYKYWU5EID90olmCFkR4pKT5CMiH7aX3H8sl4cOw2xpPwQOiZm+Doy1EyePSDFWRt11
IV5eUZM1VdJ+IXw450ExT6BDA1Qprtk4FYvAMv/rz26WN87O8BrLQXL3pjNZGlAy5weEKqXfdh9K
hh2ZeU0UXRtYrqA4Jt+5le1YEUBH9eZlwlO/8GrRozXzQG2RkXkd54ix/HIVBS88Z0DXcJ9UahWs
E1PiFX5aX9Rbxl6UP+fmlgfQeLtkC3p4ROinm30S+QJFxpA7a26+mPPagPotKEiFyeS15MynLS0K
OYnTkYmcg2w72UCG2KOGD7paV8G0KPiCC3i7r9ekpcioJMJPQzR6sJFgR3DvDM4nJzFJdbDg/cQg
5vIeeV1hmZ01uNDK3agP4Gg2ih9m79L7C9RzAiLZDpMp2IdbYgrthmm3wTh2LeCcbqXZKXMfM91P
WZJf7hGF/PrltKBtiLqqxyUa2VImP+eqC9kyFU1w3riOtF+TdmUDa7lZyZHW5LjuDeVsuQxmCNRW
EryWGVHTvqfxQjpOF2k3sMU786ejvgdt52YecvDwuu4xGejQIRRseCey9O4H/E3zOS4W0sZDM05E
pGxVieD2qxw5t2qsyh7OvhdandNg0u++P8w23962/br+bzMspGVcUF+P2FTKrlqCKzuTamiIOPJ1
366T6eFINyMaQ5zZyPLdAEfIccu8Ymf8sH8KYOqNhjz9ufwMORK7dl+loA/Gw9Kujw4ne3zawKcy
skdWZheddI6eaPLDdUq7+PyHEJBGaIuzXgz4QDweugsjOeBWz0l9Wlojxv9QTDpXDyNwaRQCrd51
pfnSIzeCinhBLzpMyfbuGsbqoBVm6B9kx63BuOVVIvm+zA3mC+QdrpI0n0c+y2L9tgrjun8EG9z8
pcmdcTCVxc4duu3ybAz/FGrB4qefBLQNDhXRUGRa4x2XJTYtIBuJ8G15wB6BBhJW45XXV87Sm4ab
ctO5UMasYIAIFunlv1f18V0dqd7DjXUtb5QrFJq6koPnZuywKXuvXSoYIYKxT1Jde0BzYqcZOP/l
0VSc05aghZYOjq21k/48zi7ZwheywS5cC5otmutftD+K8UiudJCvXZ7d79Qte1kIxnPlPxyBANAS
VElhlZsDhMdThx7RdUpU5ph6HqoPswIbvieDiuVnIZJFZuP3SNLe3S9i0s7VyTxO7TysptrWthic
DynDOdIgmyctTGBjKuYlkErLyF7OGdQibgAJ/f0LnLBotQDCnYEEz2smP71EweFBkoqpl6pVgO36
pmEnG1oFpZ+GGGEbLOjc1zxPVWHrB5INDTBXT/Srh9fVtcWBCbP2XHLXpPQoxWNOKSJ9LlDvNEa/
JOflowyapkb2GTgFtrqB6M6FiJlfgd8HNhTDJwVTADmM6zuA8/KT+XwqDPF1cMttpqp+7aMNJTEz
roDB0nedIDvL/jXyj6wpTrsKiD38/LLCU0xngKt1Ul7+XxUoBpZejmyIZwMReHwuiZS8sxU3SuDJ
dik8dfA5vt0egeGP2F/4McfumDQ5zUW050qET7MOEmMvw6WSlIV5dwwIpUFdqr/NLHDBZ7J2BQEC
a55g+8Nkqd+b/Z4bRXSF77mlV5XLGcp3+6XHv/ZOJ8m5lDXt4DW+tpgrOaUDrIraYkdew9FeM08D
pU+84I4K8ooQFY8uC0+kp6gLcbC6w5eDnQHVLeYeqpH6YzX9vfUSvZ5D8V8Z+DsvDWh1Q/7W2kTL
BNTWyHIvbmnHoBEtSSIZIQKy+zOypFd12yqDn1ocOa3Y1bw89icrYNcqavrXaXlX6Wz4ayXVRESS
IH2WtIL8du4DheDM46avw4/8ocTGp9JQZxTrzQwZCFYNlAQwvqeUKu4xvMv+3YHU+2+5hZJ1qyDC
jYDh+hUrmSw0t+fPlEJHbZSzDBbHeLf5pFXfDIkRAu3dbhsVZfmgHaRYUi71SCF57vvqr2RLy6Hm
/9RCjUdAmR2uDEJv9Q4piwqDcnhIbFqMsS51hL48UZr0JZfyXFkAevttEzG0aPa/4qJ+ZDiOFf7D
zYdmW9DVlIeQiCF7CXnaXBUqIJMigBR25yf61Ol6jUunIzUbLzEUzqwmWAMk1yA44G0Xp+oyUL2D
lG4gkdoazP5xrZN67wEYdOPQPpfzFEe4ZPBFIkUbHbKCwBmeelMD8K1xku8wpwVGAPemUZm2VDwB
J6hPojqHXH/A4bZRfLbGV17AgJjQ1ggKt/BQ3DRlDu7f/n8/WeDI0uWARtALA6ZaEN+GLoaP4/Qh
yVyrVLRrcPurDc9VP4FFrgjqkUL7fs04OxLsRgljmQMU3S4VHY8hp1OI2k6w+V7py5wE2f8XVAOp
7YnXYquFuCMbt0XRR75fBFmT4pIgTyWaP6QH3beEUCe95BVNLIjl8R4FInVUN3wQevlQ+BX+mjPH
P8RpcFEDLkwWYJAvZ5Y3aoy/tq+ReT0J4IMkWSJT3h2DsXhBhvdPVp2ZgkU2wJ0b8SbYrLcy1LWT
GLcyTsG7mxcc15O+hrY/CHj0CaT9JoU2e01MpDdWrqjK1r0x2Ft5KNns3EGeSRf6SkGNHqFIYXug
2XVzUE9AE2NHuZhWTqvcbkKDxlPIoCqUeB/nfGfSOloZvFWPgDaUIgHkMgUVo0iMCTkaUBCloTKP
z0blWduZAqydKIaL2Cq21MwuDJSkA2MftVLK3dUHD67/p4WqsZKAdZ0b+tSfMN3FG7nylmTfVWhH
5s8A6z+RrnhlrvvId0jd6X+6VzcBq841VP/CK+QuqP+E4rAeZyjce2ibq/owj78XmS0TLpwcAR2H
Aj3h0y2OwoJYgzHVQ9C2iK+TqMT7fcve1cvC1gigDVTTkDyt0nfKmhKkiioKn7uh0WgUJGZzeZce
PP3etSL44VxQv6toNB6PQUZJ2ygBe+rz9qlx/ZmW7Pmz56mPm+gwAltv0M4XRd06qbIna9qEitXz
pyl7Em9nuGaApa87PyVevn3mqCJDWQuFW1SBXYINUG1P/VzHoshZUaBjoK7kbBOLtCrGqLmXDfsO
CtM2ZlB5hZw7C+XGl+bgVRZo1ZI4IdwNttovInANKG4nlu8NKFibs7F1owVuH4l0c9iG0X7rC1EG
iojh3q71RYjVpSao1MqPJxjYSq/CIdfZxCkv6RfZuE+KHlZM/2j0s5E47BuwQavf4UiUSyCqnKQq
wa9hb0O/QlpJNi/PDXlz2UJFwFipRVO+TyJGCOUSE3HSg+1yNfljMja7u/w/ibmT5qXvUl/xzkP4
V4HtNmgJnXSmsIkYw2NZm5WpJobpt3vqhyABBagVnO1HRggTb+Q9IXD72qSGCukUqy2CdOB1Wt3e
ZY0fXzUL7+p9isI5ZfrTZN82diQuwj3hwzACY2du/EMBBhskkHAMuFelEYaZ68NUvcQGCRngt2tm
Kq8doteOzlbSKnI6Aq/9KQaBBi1WUv/R98NH0J3Mv0CGXlvTEBRoJi3zJMF4NtSkRYT64aFmvteX
WoyfIbYuyfB9eGJNHntO8vN4QvJq8xZt4wsCPcHr3IHLV5+ZNlFj9vHbEWyom9DsHh9UV4BhGb3d
XOuHS2P415x8Bx4b9dSwXQbWF2+mirsg9bCHG5lGBdaVQfkPDGfoK0x9fTTsrmpfHPKC7Nm+nCqO
/Jahxd4JJ+5aR/i4QTCQ+lOHdM67bOvvQNBQ3ZzH1PZ7uY0OGagM3dUlWVDBinYprdpc+xX1QRt+
WOe/z45e84JP7QCGOQpI9Qy92trpQ3no6GlOVPC7oYcJ6Cn/JQUtTHt+Xfq3DrJ0/IsF28db3dHs
tKcCHLZTv4WnCKGIxYYPkXbPaikaSzeAjDxtesoI8tBDDusvI5upyP+gypW7iHrsYkYuSpByMBGN
CUFrqASU46pMdkGXqnkamKnvLbMRcYkFLrWGg7LJ2IMADiiFhD33FWvUO2CJuDqFrkJAg7JoPffy
Mny4JmVUdeHBh5pXQEawG5ogZrydh/e16UHBNTP3Bsa60+ecC8CcUDRk/YF+GcZExmPbkoxp/n1f
E2ojoFlz36+3OtkVAtiA5B880r+zO1eXFaAfUo+aTjnLnS56CQu87o0XM+lvyhX5x25AhJyBhE3s
vl3BjDJEdFTV1+HTsXOmn6evAYp0RddckjCBkNeWNToR/6KUBeqvsXB+QrhIYr/35FVdSvKs27Ag
v/Z67gqPMCXSDl6hOmfZKOieXFSYXshv9GRYpF4IiaDuATCwt/oLAYpV0yVnjCsBjfdOndSyTsoO
nPDAJYXVN4cSYMPbDlywzlD78O6Gq9rLAZlTpVl/7BameRYHkJH0nW1o/uttxj39KfDW3a9PIFvI
0/gzHeea03ZKaDKrJrU4YATJ2+p1INDJa+/rKJDYFZFwCNcJB7qU76ljyWvp5aUkn67vGZLar3+n
EOvNYZWwGlDmpNOyNQd/G7xqKIeCa+UCXSEiXGnxIkrTaRe/X0EBTZrGt2YP9HQl9Ro5K6mXImrr
iruTVCMYe1KVK5g3e4HU5Ps3AU2PyCdG2lbBlkXOVg4wBno0dZdM/FwvBH0BEtw4045o2AaGesAl
xwe4AV/Ft1Y7qNyRzQ+uheCqCwxKQszn5Mz7t600+6pH/aJUGXP4LIKIhHxxr/R0SbRwqvVtqLFB
OhH3/flosDEpvwkll1QQ9YCNRVk8kpt3VO6fJbuEyaa9Mhvi6Whxo/GxFEuhhVKHrObPAt/iJ1gd
gLhOPXxUPEF1bATHBdfIk3vdcBDLtCHW/Wh9A5lGyMDVOd6AouM7dxb1CTgibhb8drVMfXA6Z8Wq
ampPh4D04epRmR6S8ZHAXhFgWCaNHKPoDol5BD4xbknqEt83l8kCZRxM1NJCCig+d0/EGTmnd/E9
RgUJnw+j8xaR2y3IJQW+XT6MZ5QF3gop53nU5vZxtY3jCtzEuD/ExUj8uJuWKWirpiiBOngXAOEu
8KAjpMTDWtpgCkboSrbIPvYjU8Gv0imoSq07ZmPOJGAt7+7Ix0cv1ilP82ftlJrR9jy62886fG1s
vMtvjWbfpuKC85J8MLpJTlQVsVCrZsIDb1uyTh8/g7AgirqHKhcloPrPyPwUal6XbLBvT5eHe8a0
Naj+wWyBdjW/DFb6SjrYnLIs+nf7hwqdp5HX8LH2oZ/eIAeEDAo2f5AvPAP0b20ZTWHunOmybx0r
vHOfvBnQCYyfBX33qpboYuc+tFoUJ7G9QI0j1ffH8oVjmy/xc8lE31mcE3CnKtCRAaMcM15GKVvq
hatfI27XjsU9oDDEhmQgjPJMZSKDn16S0brLfYSJeUuPHxcBvRZH+a2OYIR/ZD1eWdLJbje7BVIL
OZApvchGt1K03KGADJScuY6P25ek/UnS9zhXz1NttOtDyCD7OxKud1saw1+N1e00/dCA6Awr67LX
kvs3FTyXY5xEuVsAcAByckrRESs2eVwZpXmpSEwNcUa+n04KurihMxgdL1PrO5mcaMELytvE5DiY
7J4VbzgogHSjJAXWO0O8yQNWCVDA1SskH9AtAxWiK3yh95uKXvtMCffkHBeHTxtk1upGpzwDkbnO
gyE1ythFtjlwO83ZQsiDQ+N8W+T8eeoSRMI2udmO1bgJ8B1mctBv9i32wHKkR1WUxaaYYJ+xeZOU
85EjXVaghyXxeRWkbJ1e8q+5lYQkM/TgjdpZ6gpiPjTjssoGi3UDle+tNg3kSBzdBCRc7Le8+Z/m
BQ/qkZJJUCuEsBlw6DKgdhY8yQXCEhmyjbUP07IN91Nc7ysZveokSom0Xuti9cjAkJV8/VPJBOo8
6e6lDlQYXQ5dj+wtvu0PRCnVI+Ymwk2p1tAbHX2g3qa3jsZoPhPdx3GTiwselbNLFXQkWMC+2pRa
WdBOSCfLygV4qvfsWdC8JHYx7VVkXb04RJIHfhxD66Le6bzLHfJGSZ18ngoyWXInDzvrdw9NSKUi
PJ+wdYAAe0ZlO7RWoolcLNzKZvDfsGJ3IPE3EBu1fBlxpgGoerZd8CMujCo3p5ydY6lGmL8uPs4Y
4Sk7Ws6PCIxXH23bARV4/cqdAJvqIJfDNBA4Ss+xvov469VpsttSBgIlwTcjumgwv2i2M2DlYQ6P
WNznQYTvsuGufH3pb+eVlFBOHYlFaQmVkMNFBWNcT4Ts358BfPUzvzEZj7b5xxoYO2qDGpi/ZWDF
gbV2nY4L7dYR2fe1FrHJiQEGawNb1Ua0ZZBWgNzKjaM/ouqKwDbbqyMYNc+GLTZv8kkLMN26oCwP
7pOV6OqlTf6l3fnA/3I7wjUsy89Ow3GUzOer6DQv45Tluhk9bkXIy1bJ0/WQZEE6Mfpe8aJ+Tovh
rEdYzEKUChzJs40bxezhFS2xKMBBAPeEtdMCkAiwRIvVsk5VLqOsHAZH29c0p2x8W5qsZw2mLkIN
Uo70FdULhJ4ztq8cii+TjorxVYqNCxzjuBV7aaEdzSYmSj3fEagXRaainyGsh0UhhelssZ2DHnKZ
d9qea+M4yY2fqEKoHq0PdNECTXLFMKVaQzAmPK3dnY517DpZJLYOSe5eZXc4JCjhiONc6STO5tkO
S3c05CeDLeYKB94sZfs0h+PTGiWf74QgILOkl73i7T+QEe7G2krr4V9Wt9ftLE32d08vTUTDIPT/
LghipqXTu41ksbMDHayUtTespEeedHSWND4ZhzvS0DHZP/US+qi5v+bZh5GXeSkQLGonDML6QeU9
DYR/rGgnaApMAVgx8akSf1Eug4l7aUdOv8VoLfNUEw6/PeY3sBgJzbYUCHawxjv7d2BAPjDno6EO
GgHB9RYdbxzJ58pMt336jFkrDwY5CTp4YxSS6+zbUe6r8TWnzgQyrDEdmPHxIVzEHWPa9fi22tOd
Vf8rzdrQrJ/dPNRgGS+mL82Aw04i2uO63CSB26g4hvYaZZLaamDFCt3CfUTfac0KFn1TA+sATMEH
xnMEVm1IhGJDMuhEBvwYlbux/P3iylLpV02KxADJ/rmqHpA48q/oOST2AdcGsUKkrgPSdX18jPEO
XoHxJtOSS7lmeumZOr9nh1YbRLTuL8osk1UzeLKROWUzDwECAJS8nWi+arLkT/zpgYRttGM5u3dd
s8TfXYnOK94nu1qlg5L++BikZxsRXlClQk6CXI+3yAI88+a2gFULo+U8AWIS0ItnT6sGHeBQckro
v6dklyLrj532WxHuxUAuAa4qCgOHVzdDC3+V/v3fwQOs8t6LDesD+UeumQ5tOof7fR380ogNGhja
hIYhyVSHj+30ve4dsHoVBbffjCWsc/TdWQB7BRoyZhHL/K+HYu3kLZYSYm/+5pE2aP9a4LS14Nmq
fOoZH71wzKC9RMG7rD+l5dXXk4yh6iocK+namvBdYGm++ibOl2IxJG1J7jl/auzadAfm9dHiDI7e
6YEaiERLBI0Jg5uWAOxDBqU6aQ6f5EWvPHpbkQYUBcCqgOt3oeAJf5fO9G9kZkl+jXubj8xmyr7x
7j52iKOHQX/p7beimSViSDu9Upm2UmIdwpX3pGS2FLVo7Kx06cMq3AWEcuai1YJ1mP/yQtwm39tq
57cDhYNyJHREHC+sye3ZpvNb44G9IsRnb1SaV10125ayZgU+OtYAjxCh10u6qxTxvhIK99iddoLW
anPFAXsM+VgT57i3HRSKMKW3nmfBqPh8/YfZ2KXkGGWYod4bdRAX1yZqOmGyjOYRg1qBcqtwSMFA
kJpiRsvdQ4c8Nf2rMm8CgsWK4fsjzTP10VMWFwbwwE7dX10VdibmfrJCfZDrtNwLYoIeTfs5MvJk
Q2VdTstZYsx5F6394gF8arWlCeOs+ZIMnHfuTt59OriNbM6S1rumecsNw3tkOuYd88BO+rXeL9Z7
5VPfJNWLL/AMU4jPfsHzm5BdMGvCa0HkN88vRy5HO33JbJcD733TS6NU2V+ddS+9Sb1SevijVpaO
SLjy2ZHpXlIxfl2uu8CmZL0ydWRUNPNUFS2plIUOV7XDMnTZeiSiGMWrb6qKjFI4Tq9jz90IQH/P
/gmy3g2t5FMuBl6A9zuHKvkAe/lmZzWZG13d2GpVgT7EQveDmTi7T8PQOB/GVZKm//Q63e0khPff
X11P8mg5Ge7WP3n23Fryb4KLE6GmVi4dM/6IBskDpq6P3Q5pLspvYanet9rdd0LRxCU0cjEsStVD
gZ+VfKJhip2Ul4+B1FUpQg6u2ST/v6DAKvwNeIcYU25X/TxhYZqGYq1rqIxOjuG9RSl1dgtD48iG
XyM5Gw6IzKMQOxgzqPUK1J71MrR7UkGSHkA6Xy0pMt6zod2UGhDezZKK4SQrD86AhverfE/jtjoJ
8x9nGfLI1waJz/iLqY0C7Blr3QZAgtKCkS31GpQW5bMxoxwnoIQnsnApFYpWxsejchgTnJ/NVMkK
eDOZkyyyirR4cNJd1n3JOWu73VLNCPTXkfbBPJ/5+dwbc6ZWnEe/qwkyhW151wNQmExRzYXfAsKY
uB3YYnx0Ss64BYBC52xnxzBObi85CjX6yyqGxoA2red0PMGzyxZMkbLvckTlWDdND3zpfb2tzkuH
Xk0PGqHnUVsZjwwYEG6G0Yd/FZaR7E9rmYNKHQCXhOVi5ujGm/GMPw1pG6J9IDeZDhig/naEkpkJ
86iC/EoSV0L8GRztBdz+od7fQYCckZK1CJ/qCdK6H3pCptiBZ5ftWATx7elqcOeixjnlOYgD8b0a
zmaZ+kYifjyoO4O0JJLYR1xLmlNaL7tOESnvvoBAip2+r9OXikLStfBMuQVkXk+kEIKyBWers2rR
ICmTCxrsIcVrF9zw9RPj3BsbXzDGIkNkn6x0GUFhAdUqpnKZ/Ta7qZLHJc+aiO81dQWuUhDTDRBk
0mfsIhciMZAvZOBMZ/e4uMGuWNne0FCaxMEoWGMyp9cEGcetCdXE2hoCqfwH22T0PhHkEFG5IYAf
5DMnpB+YdPjNG9S8BSKTPp9l8MpITnUYTBwmyD+BM/tdAZgTTdlWToEZwIWIRJam2xTosvxMBH9T
OO+OgRiDgG/U57Y6RoVzf39AMxCrvvIe5OwdWoZtn0nLHnrO3fW2GaSoqjhhw2YP+oUjYPB+CfGf
Y84DaxnuWD3OvKKjWTSVBoyssvmLQuN1ghYMIOxoIGBz/Pg/F+36Xs7G8PjNEkhnc1Oeg+D7ORPv
4EdknmnHf7Cuu4Fm50PfU7X6CJAlNPkYOnqUBSJTd/sTILms5Ayg2+zMTex+Iv0U/Ljwhc1g3yEz
gQONbn6Oy0Y8iHxqPxxDAduia2xtEXjiItKyipeKTZHbrC4Urx34+u9JXx29yyq8hDjZ0EL7gi7z
IA6xuwyNICGkUVV7XKpZEt24oxM1bBC5v56XUfPQ5ZY2WyJuM/4u/lKiAzkE1x1dLOlKaxdGA50I
JiFoevSah3RAKANq3nhVmyEFi8rhDy6HjPCQWwNuFuO88QQdqhPJPkxgdwH25hriDAbiX02dxigH
mzYNMpAbMpDiSGTdru0X4pOxNWY8wbMbGwHFC7s40M2DsmwoVg0BtW13p+3IoFdKIPC0XlE32TYG
rJaNU43ydY0/dLmAoQNCuvvRPICu2FeGMFXZ24mo0BncjwErQdpuJWkV+xEzxS5V3BKcWOYvqiPR
Ui2ynjc8RPLfiXRppgBXZnOYck1g7fD8sLtvWFs3Jwe4KYsDgOUfrRhSKWdWi+It5eyjbm+ejVfT
moHr7r7nYQRZcT64j+II0XBw1jphXwqvRavTTGaPlWSvptbuoC2r8/U3DFrMqxK0pqcSHY7F1baP
/pg+0hevphgMr6DB0moj1y66lpvhQRfF8KAGAUaoSqFT+clNLMG3Zkp6xEm93dA0RCc7MmkfMFdf
sU4Bqbwl3eM1zzvB/QIye2oHyj/0yJQft6hJysksPkP3q7K1m9egGiAao963ZBEQ5PUchi6XmQCw
fB/bsKewCZSq3LDXAtF7ttHE97g7ngXhzsKRaQu6sFvJc8jXuUkkI7XxYWrYh+RVTuwMPOdgud2a
QpPWNwkKvNT3I9GeeKlllO6/kIB3sX3cB/o+jwRe1nPKO/9hAEj9Ogsqkk4bGdZglR5QcNSpZJd6
zHN5n4L1I4v7J8tGhLZclR3C4p102/jcxjfFD+GVdPrZGrPUCDHHp8C6tWGfrGJiHG3eB2eUuiqq
kADqivbScfhaZrDi6toa4cW4tbv4ANyfrVk0Ln2sMzhxdlZcurI85s0rcO5R9LiaM09PFsJqK2gl
sWJoG9LoyyYWT4IsM9ezzl5OZeBJJ79n4E1EVk5JkPourLGihCuQYzTu9S7b+leEjl6iYTOqDEr5
i/trc0+jvjK+kQBx+t+uZttQGY4gz5P04QEaGQTpTv1h0+HQC3TVKFN7abNWEYOiFSD7HSy0Ll8u
YNq3E9YIlmUntHrjq2uy6cwFIWpgSo68438IFYX49/cdbT56PXgGHsdNVk0hx4lbQn7OMiSWOjuZ
VDPEXjD8ws58rqMP5sK3yvL8e/5lNONvQx/BKV+lwEA5+sWm+f/Vq2Na953dKBTedr3qkQkbQ4Q3
13b9ELmWuX0lvFVsYUjvlnJxyXhBYg4bkSetnWu+q8T4IlTOkaJ5gTivB5Rmd+6/J+IijbzdmC4O
UkLERzerWn53lAvwyduJ2qYWvjGuO0M0MG8oT4ktBSwDVXDjZjctT/KMNVacLZUIqWADyBRv6T4y
9l/wHmSIV40vessLxpombrziUZOYP0m8tuc1sDpPDHrfP+Zg2UzbOwiglww3IoJOJ7V9wRAuKZal
vGhwIVDmtmceSROPFXuy3SI+XrkHgCGSjnk3ykaqUvaQ6w9MVLAXQJsKGFn6yxhYhr+kh4X8Yng7
NOYY4vEhq86E32heizNM6ggJvxB1+pZnhWJcumN5/+7ODhD340mrNrdNBlquml83Gz+JG7R/DX1X
tKKrL3V4NSrIE5/Bh7bfoqt4HnAwzgsWaSc7IJ/0Tb8LrRiRbFk/ygR+Bl1feWk4iGCjOEB68VVq
+G0KgKDaVzRzgBKXzhfJv0os8fpIucV8B35B4OWiOUpVQdbXijL8Ns2HIA3fPiL3QhoqBYiSO98U
w6NYjQh3TSknw9FJ3r465I8bLWz1Imw5KjP5pB76TLl6v3EQexN8K2oKLAW72RXpaeC7KCbtjxAm
YFDiAo0eS4YE/CphsqfzjLU+jYWf6UBRrTCy1/8u51lGOeWf2SOyH5bhu3tuIdWDeex2UUU0PzmG
6+w9JY41hGkEZewJoGpZB2fxwuJVDI1SATZccrx19zbWexvKKN7iqDZCe+ibFYr2OSsMGqll2Nb0
+Wjtq9TO0B4Vtss2MhIbfXQbBrX6302kWiiXkICnk1oxfNCj5MjvoieLvgfwK3WX7XCpozJTvVpo
PhliaFpM7ZbuCjSlkv++hNODUHzAoTZPexAB5Y1OoAS9OuF73mgWE6qlaU3nGAmJP/zRBHJwBaMV
1kXi5WeXfGoBDf961fgIHnWf72Ym4dIPoECSgM9aVAJ3GOwRvYcA5TB58TqqamfTMMs2AtvUO5h6
6bb9fx5TM6/HieNo57XreyNg5XCGR54OVuMGyOM9urT7o8PFIF5flsGroJgxywYdTfEVDCYIsuEl
T2OhG9Db47T/MNKR8cLDzENTyMmvP+GSUYEmJAAjiWh5PBG0naAAeAPZThwsl+6V+o9ESIpefcrU
ibhWEpysyYpAINg7YkrA5iYc2LDNJzuDitnDsyGEg9ZDbap6DJOgqxdcS6uLfzQQc8KEQjbGbw3M
U6A+8p5eJwAgRJONMzSSGmGXYflThjMG1X8IrPcnJErpAoh08/pkUnUNlALNcb/vIR5nvesTX+LI
VFyYJSmtejU8yxJ6Du9j4PPhPBeHbIEO+Y0kAqAHwMgm1YmGOjpVYxvw8dGJTfrAg542NAV2tnR3
UgRVAyG5E+h7+es0CnpEGPHnOptR179T6LFKPpGB1R3PmxA+7Jsh9bJUywOTQMJxAl2F+q7lHMn6
4IV0p0JzkoJ++gxgXIK/stQyfLG8g7hFBsRtJ7zYGWCg5ut4dCCWhjFEeNnmBjSWuEsALmgH4ptm
x7ZofbfVMLpZdDSMxp+jJPV/INEHt7m5PLWRxLqGZ0p6tAzV9JhiApq7+W2ge75UUg2M75Kik2yM
YxKSjUQ8OQl/Z3ForkXfoWBn2aDmymo1+7sUt8RexJBNflZTDyZDdlhi4a0/nzPsqxMkOrjpcWUq
vEWFjwkGI5Arw/YlofXcC3U3wlgSclH1N4UtjeLSqMMk6910CzNwQLDRziQBkDtvEaYgios6UpMP
QJBs8dZLreGQMYiAuuDKylQ5e079HI+bVqSr6TQoDfbhspfl9pa0mR5AUSSsQiwGkbtrrKrT9Hl9
zhUIRq4rcBVYOQVkLxI7/XpgyEVITUw+GO3eA0z8RU2ZT5SPaYrXioGcM2TOePJRHy4oiCkybpR7
r9VKUmuhqlKDCJAJBRU/o11ZY+x76hMWbNEZNr7EPFsJYuCOTulF+TNtvntmt/VUNxenHfvkdiLi
Rxq3JhVceLn6ee7pfxHl9geEQf4wtJx8Aky210NRMu13AMII5a/h/GwltMlFe8UNzxSMcjzX1X6p
6+B5R1BpMMuBn0CW2ryE+m/kM/V7sernb2hV3SCYvmIk+3m5TGPRhTe+zF4xMRWuqIBnnsdMuDqT
1hi/NdsypGMHGbsMdxMRSVn6eFC6hAyTsk0yuwLuqPgi8hwd5PowiltGkOo+UUQ8I9AG3qm6DHtm
PSRqTqCQ+0trXxqdJoJ2FlOd6VQg0KI0qLwySw890IOb30tOb/PVa2uxBhrxIY1buZT2crcerr8l
gqLB5Nm0ZvcrsQLMctWDH6eBG+dvEagPZgclIAFkI97ITWLw/Qjaic2fd9TzsU/iJS7zAhM4Qo3L
plv961Yi9V3KvCx/KspqsQRSkzBRMF7/gNYI+O4aG1PR2IUcCsF3r0rQWosjMt3rtiJ7Wg4ZY/N4
KgZv3UpJ54uctSlrsFgIDZPimtK0rjXJEVD08WKAr3j5R8gqb89m2BJRbSo8X/XxzhawTVFll359
9Om4UlC+oq9tle2FUodxnaNIUf9CsxIJvOWUrISe5EBLR5/z/xV9w/5FlN27xUQuPHbf5jcxo1Cc
wOj2tMgBuyRqDxrVvTDJGl89iuckZUj4FTawv7wSICgVE28C6cxFjtK3BPifiBrCkt0ebDy4ouWY
Ke2YEwIKGVcQIwlNguLOSUba9w6QwPNg3hkjZrnTpGABydPLcd2zIxJ57kZpUxNhxBgsYTofs4Io
kJ6kQMltMIC7g8P8aLgeRIlkIK+hvfcunqf1ld9cRm+m8/5PC46l0qZtk5X3dHwtHuaSwsz5nVcd
hfwUAZAbh9n208HzEUdfIfk3Ntd1m5CTW2i1VgWDIChT/SbIistK4JQBrAdmxwgpttxjfJP0KvYc
auCoGkWZsGdP/96Q3PMDi92csFhOPqoNNNOFgeWr6V9yZDKAvhDZVSZIlcqSRPgPp/dVAPb6jbOQ
dUIEAeh+7FOaqu5htjO6AWg0AU6kwitbC3cF3A6x8cZL4XZl149g+7HcBFvgjS1kCnPrjYujWDS7
iRqcbRdVoSOKUSRAXtTKax74yoEoCq3I1XXvzrUB3+HpZOKlTuehCE0yfchBHi+6z1oOAzoD0Pcu
ieNcF/452cBwtygU1krfHdx3nUB/ztgQ1gEMffTBjyjGJGRwtbdpAfEZzVIE+L4xTZDeaFrxSTRq
s8oEX8ZoLsCYCveJydrA/Gedx1OJRqVrvzKdPNclsNPcQZaGxFoS7TeiJ0wangc64N513nUW0WBb
1WSMtdNoEKTTDLC5Wx9LKvPnweA/PRz4S50FsOuKt0HoX9vvvZptc2E9fwwY0VOxN3P8I699sAxw
/H4QYzskJBnO9msWnMJz1JsqUomYbtlSKAWSElQyQ3jtEU4qCsFzxmgl0yg0ZZFJ+NjJbzvNBQYj
VH/BeR2Yg1WerAhm7H6a4AuvWz39etklD3/jBlqNqb5F7fGVFWU2HpVeot1eDuUjc4+Ink6Q1IbM
F0FPHFAD15ycyVi3e9SyDYDtIEF9Dmt7vwlgE07pocfWadinJfVhtzuBGU9Snccz4tBCdJxfjBYy
1MgYpq3Ry4zJCqI7GVYZ7ErFzJ30LqvQYbpgrzDMg0iLS+e+9n/3chUFMLr7Q/fFlG3oFrgm9sqs
4yDrfstOwOnCRB8n0A+MoiAusFLgvAVoWXFfHYpz6QuIEhAyFsVdXSBGv7Xp+YLs5grbYJ8z2UaN
K6HexavFv4y5BGVVsaWNoUByQven/D94la77znyozf5n+UQhSrDJ+oKW9gsvwBRTmMhafIY1V+IU
GJeC7NT+ad7B7CIeFRMRVJkyr4AwtuxopbRIas0wGuwYEdTGIiouOXQ8KVRYBO5hyq9aitILcuME
pXcJPkrwb9ONKC6bk2+Z8o3dgqt3zqqMwSWN2kws9g/L/I30dwVzZKJzhlpRwxPpx1gQjrbqcQqK
H5rIIPI6Dceml/w3iWMlqf5tvXNsPLWIkzeYBwdD8/vFb+yifWTikYyW4jyKQhHEgGOozNVGtJWT
qt+v3M3Aj3tvfwgDbaAI3rnTFMppRnLcLJdQrtwvy/B2vuZvnnh6mip/EDmaKtY8BxJk1cSZn7EF
838+o8c1vhNVJ8n+31aLdFYG2dTIPA6x2IrU1P1ItyBbtBH2NnSHckCH14O/MKkwRQ1cBeJyuQSg
pLJqr1WGEJBVf+C0Ergh2wh1YGTI7zfieq5GCMD59tf3pSWDThvhabg5uWh0Su5nXkNvrciJW2WS
FMO/pvXFXpP9+/VK2+pCAhpz97G7C5huHjswrORHKjMUoY8m6MNL112/Y4/unPR/5UrTvkv6eKsy
ZkvZIK/sD6IemGnymqTl876URrsgVHY3RF9WfmidKuspogeZ/n8baN9QuoUUCVLlBNqOgYUPsNC+
byFaj+Hzi29/snev2WuXB0We8AVynlsawpJC3ggYobq8p2y3NG2gjGPSVv2SiQ7XDwQxSJuEghae
HcLh9WHC0pDlbrYCV2e/hCR+4O/+4AoDcm9Q4n+Dk4KO2PdRRwvwAguv5K1QKVafH3btxSYkZcY2
MrlqLAixzF8PWBcNpzAOJfBzJlk+5ekRENB7b/20/NtX4V9IM0OPTklxgapaVu/kT5BhP7WiaTI/
sn01TgFPXwF5UH6PYUJdmguKLs9etddAwygB+Jnu03WuZVNZeNsvwc6E/YA+/Ou/rvNrgrUpZHzw
x9U1+2VVeHePzT41Z/o+lPW61paD9df9U1YigTRaERrch75qnNyqurljPTBm5ulMPvzQqWugiifY
OSZH4boYZTaLuZMKUL096MUzijlQjGjBS1FSAbVO8QC560a9lulw2WdyiII9BA1KXqShUFVIepou
cC3EUNIBxJyw+NrPYdR6/i6HEXV+/IGa6KU5A3mMnMPsIhmUw0pmvJT9ijdOp2XisyLPisf3Lq7L
vf4gsO9Qwkn4gVVs03nYMOkyK2XRagVfLGSPyM8lLn4BWJmdBbu8cMmsM47VRH39K/wHWcUyo0kt
9f+Umg+TKD0b0kc8VO+pJbIKxlLC1+4JmIVblVBzhElIPIYfHuY3gt1o4vb+le2XYZesqN4dhUBH
LkHIqGC/wYUls8k++Jn9GrgH1uKmwHxJY25fjmHWOGoZDeBpq5StAs+3JuvjYC1qxEkKxQucylG0
EKS3WjKjjY7ZSAwrPbQixX13+YqtKIkAsKQZGLl03pysFWHzRRtt1fhUlBs2jlU9eRxnQXbyZK0X
Tcz+n+eRq8QAXh1lax5+aNoaMiG587YhX9xTtFAEOy+FK7TOSDrm8E54ne8vF/RydaUmgzBTjR/w
c3FXQWvgF1hQm35NLIpXlLdoKgZNaDG256V1FXx+9KEHMUvc2Q2rGV7jqok6Oxe5/4lQH4lOxgrp
yin+A00bpnNNOvTZ68YuT9tVFush8xfU6DrTwaioKRzSDEDGeBH064k+2n7Er2BGmxx/EJc0DcqD
ybZIrEy5pZftSDc7ApBXlmqCHoDmhUo1C/K9CMA5wYXzRMKMNVpdXYcpP3vU8qAhl47wdsaF7YSC
HLtZ8LB9v8oconA7u5PIHZ8o+Gko/LeI/P5TibgoP25SnIovefniG9y1gSEYzX4xCUlIr4n1aIpN
TOFNRJjxL5e+APD9f62i3ylgwuWvbXBe5rXF333ZeB6/ZvZOpV2sSrRcI4I65PdPtPGm7woSlzBd
e5O5W75ACyuI/8Vtuzl/kDmh8VPCn6qFPQcyNYFMUbKR8sdDEkZI6sW75+NjbQn8WAegW1OxQaza
gJrQaRzAmuaASmIJOljJazIAz2lLyZNJqw9HKbRj0uIQCHC3PLqOnXkHvh7ymR/SeUL0M2izQi6j
A5SooQGEk2vi3ZNsgc2bx2YI1J2B0Nwo8hk35HfEI+c+zdk3p6UrgKXz9ITrUJ+jUlUcQeP3UUsW
5HAWa0ia6Am9+r5xNHVb7ZTvtxbW/eu9xqogjtmNtdU/yvb2DwvZSauhnk2hWNsp3N1hhn+MKyBO
4EcQiPdl4NIpoILqWK01Mt5mTUn0FOUfFCd+g0WLP+FGvFdF5rBGVOlZ4v0X+8FjwvGERagSNmls
MWTC3AzfIzHt6vfmgNLSyAJgLXmu7qhtemKblDEy61ctjjX6FNhf1ZtpaNyKDst/D5hh65/AmuH+
rlownBAck1q+U8lQ/pljupFGTmzGEftQu/5k6uKvc+q8rmrLVOggoAbQ9Q3O6NdK7c/HU91N/Tpo
1I9JJlNq0RnEwXUL4orZMXxqYlxP5dJLr4C6/MSNUQVnLUFPqtQdcCYHE/WfrOjN9zFtZo768/K7
pkTP5XJ7Y3UEj71C8VrcXdg6FRjgIPLannAJp4NB4hoMdEcmhmZ40rELejOH5VCUxRMhISMJY4ci
eWfhErZicuVMJckXwZHIUCD6U+whT/ujl+XRkNFqMpTLZWwpx3WcZhbNztDGbVyYVICoFt+2fhF0
LNvPRjWE2+xshmvwWROi8x4susm8nGXbkwZIwstYGDrsFZGGfJ7OFBldfCTOljcex2VZ19nFYyaB
kp/dH18iOPFSDFky4MY1CiF5p4iH64ZWqXJup0CZo4/NTsOr5t6MfeutjN7F0WxoWz02a5oOKjRH
gc4hO4oqpb+ht3zO4TiZIY/oZZvWNq69s5UvXQe0HvjW9UbzlCE+DveAh+P8oqh7N/yfsYBkIYXz
phprUerE3+32O0c3t+bs827hVv/t29yuERsoqUNiApIr7v8o/Wm74Ri4xdBEXvYcVVqDqg3FcjxE
06BK7SrQmu5RqiOpfVp4kx4EpsjgbuCivQdWXBV936a1d1+ZRdwUmhdqrk897FA97IiLGfCwEkrD
9/+C+M1OfFtQ6Ulu10Xjmb3fh6TpIg5ivDMeU54bjaxkdO8BGtoNdkxeP5EBl6nc0cGL6wjPgbFI
rNwgnTKXvntsYoMl6upBdXICkaNBYhuF0xLURIVhq4Tj5M9nPuKyX8cD8HlWLfucctbNuXZnzDDx
6EOPQYaP1qAGqj1GRE/cfyNEHzEoEfs/vQB0e5oxp9XAKw+y7Cmz6Az86dcJkCw0fd6me++uaxsb
U6qi7f08Va7pmU3Gi+WMu9R0ku9i52g3jvhn7Q2nUjqL06vnuzIdv7TuCMnZYM+LiHfDmQJcwseB
HI/FbmEcFBxcPvNVsd6x8z0bLQ6ciDB2R9G++wZH8ZwB2bMLy14XyCYnpXip4e4ucbyCd/yrEa2t
TWbQv+4RxvUXq4RKeApYFMSSC5Hpuj0+yIdnLuB/hjsHyZS273A0+pzU98T7fYAO7MSCUC+zID1Y
nh6DaJ3hlUl+t8XmkVhU/6hHvGN22iQPStjh09ahPnN4ybpOdnuwk2AMqlKDL5/j0cAVhBkv2Lr3
Rz/Dz8tnJPUR7iNms7mNGRBwV1uvADLtVfWDd1gJiQ8ylS6Rrz1Jgm96RRnsJn3d0B0ayFanuniV
ZEyp4SxIszkDcNFptG7c3ijApjgABOTQoseQFBNWlaEFs31TUT/LQ7+ro57hGz5Twe6MRJNe/VK+
dM/5+3/cT8e1ZCaY82//mPMUOx59VLveytKoffBn9vfmrEGVpW0xycloQUouCpqPdS3UXZFXRimz
G/as/imYq8Ft3eku9/KMJr7a5m0iUoPht8HNa79XrimVwPU7SH1sPczpY4UWjRiVVwkQsjrxMrrL
ioXK5cfA11Yz6D36M3d2vD6Do4UVQ2iK3nTdHg/K+057vJdZ/miZ5T4fqnOjoBB/dUgOkYSDtBzD
DffMjEtENvOgNO3U5QjhznSJSgwAf2xAu/JGTfxe6hMcoM/LMsKBQQCjqiK2zRA90fb+VNnOFO6U
ltdY7Meuua7yq3so/kQxJghyzWSlzzHsY5JdySF4D26wWPr+LzY5Y+dJv2R9dYzKQMT2RuzkFb7H
0zStZIN3s4HS4MEPBzRvAUaiwz7no4PTVLHRUDw2qwfUg5nD0g7BCoyADm2FGPHM3lPs3n9zIMfz
rhVD9iRT4T3iUAKuYJQzXbCd1eA5OlK8EElibAU7rwrv0Wx8T4aQcVWp8AX84qmgbcJSppy1zahn
XMQDBT6JQ7kIJFEP4g3dz2eOrW/lClsipa12u5Q4JWR+iykhGWL/PXyYuNKBJRVVjGMBTqADjcpO
WP7pmtpEp/F3S8nPHfEYnB6KV8HnAsNeC4RBvgEndxKqoWuTLrKrR2hF3Pjn/WF3i8y675PtpabL
rO3ofBwDg5oORDOtlFo9ciMJ8Ygc/lmcWarPMhyuEFq8tPoR4Q0bitnsMeWEVoc6hm3FpYgzi5r7
AOSHsFhG5V30qYkCuPDm0Qyv+62LAFv/oZOw/51bU/JugAzJZyj8Z3lQ81akHc0uKJwy8RBUENfk
VVORGfbwfL3BzYG0mtCKBydFCsCMHsgC83Pu64+jyb/ldQIQ++O9GQLYJauROdwVMu3RqJ6e9oel
yYROfQ+oLfDs7fkXHJflgK/w31BZcFXF7m7/c87T2BhqywS/RG4aC+MhnW7jOuCQxcYWB0CoLj3/
2SBa7GoX1+Q8MpHrPfIVaGZJVfjEcCZ/e9ujFvNCmZRo8C7DSljm0Df1NTcd7VHDvjPFX61qb/RN
PpEbJv8/WFBTxmvnQl8icAA/CfVbSz5QmzrTVo1dDw5U/tjQURM7NfK/Xth++1WTqz/4ZRc66hg7
8OQ9nrvpd4LYXShuSO5/zg6uax4ETs2Xx4zifXEF3IWrWnnxmwdp48pNn+OnBqEE5frkp8wDrTJJ
xSwzKDUX6Kuanf3uzYvZlusO0Ugi1PrthC89zJ77Bu4jBwGtJrvIeBOj54NE17wd9/zEMb3duh2V
jo3e624GQTBBEN5CuewS0b27NKmVAPSMc/a5VKvDhsUmSVsjjwg53/PVjJMdrP3bHlC+P5T4tu0S
mNMJp4++pHwbYLB7YIiQ5MbZ3M9P35z5G/dg7OoB/oredDnlYLXHtVNoVE7r8NMLlRBMXlnrLDP1
Tzn1EchlOatr89HiHELB0SFiHWaFaQ3cY97XzSoahTUw/eI+pz5o//76ByfK6cLvvYcViweAx5tN
8eiZ+jZXFVcByGhpGVVQMgUFI6wKFTL9wY3HvOq3PWGFvGe/aIH6jvSigrruxClBtGefh3yffhvN
nbQehTZ2eSAzPFr2mR8p7JeqnlEHhEmVoH5SBDbyd9PVytuUatYk51R+FOlYB3IPxIQnDaP146DL
vabaJRYZGrycZAolmmMya+qV0iCzCDxVELRP0uGVTYbTwczXqiFwTCRVtp1KUBBP6Mx13Ca5XOae
Ulo9HoQJuovi4QxOFh3496l9RM9i7FUM1juHVvuSjysDf+I+xY2uxSBn18QAQyXHK8gltxBTH7GI
MxLpnRrx5ZI7nqGzjd9KEJKN89UbJqHMhOyv2+T+sxvdxfmhCEpONJx8oTxGufRLnRTjKNTRcVcl
0gCLtXtJ5sK4/ZsdG3rdD2VZn7/57JBhK45IQQVGTQGSR+ZlsYy1kyYf2OgeTTpJEk1JBL9YRWV+
2lJTS2jfVQGhFRvleusNlEEnTQhdKuk3Gx4weJj3NBI/RVbN+/P6YCW5G0qXmBNw2LEt6idH0c3J
6gcezltYFfqZ1EKoOcZ9uScl7J8fK0b2kAqmI0wggewAL/lwEZat+L9TqY0wXG/8zPrL0ZOTY34G
0k89vAJMECsB2j9N3OR0Z06akJwp2T7AheYXrXcv+rPQCM2AbokQRk/oTnmR/Tvc+LN1sUfEOCn5
NIQ8mELUQLBOodpDVsZUfOQOteXHAOoaXdYzHUeKTQUhAznQxGNDGo1nE0vfaI/ftsrR/ts+mYY5
86eFX4kvxNjZwdk5+1FbgIDvre3jh0YWNPuryt5d3Ujs3fxiA/WiXllOHAIK2LOkYww7VOb9IZNA
bTVreof0IUDWFTPKLYn2pBTiHw7lRK79iTvNssDw+qZduDUxDBqmXkpzgX3Oi5tiDgYoa8488uBI
UoS3IzX6VfYmAIU5hSlVoFhUwqy5do+91L8WnfXPwnR6JiVXprd80+87wKU7hPIhcnXFL6FIPp/Y
z+MB6+YCgMknQmMLpftNXLaTsxIUVQWSxMhsTFJlqBTCS+UNLfGY2f5aZFXEw2G4kAyke3WXcKve
TDhGKABCU6AI85aibYJLpYtZVLUoCkcGxqWG2DQoM7wdRVgAJc124RcLSfkY8F7V5KmJEslN9fdO
cDyCab8dU7eTIZL5uxPEY9kIscLlmO7KpPPyqkRzaRRoIwLwvPRPrqBvohJ8o1y6Ph3mRMbs+3i/
bID1oyXrOzwhzkYNqtPktFCZuFEmXVYJ9d+lhSSw8puHqESbXnBIxcjiOy2KHwLfa4FL8ax2nxX+
FTse4LObRKJxJRYmrB11vc7nqTPdaHgS5cSzoPJ5MqRzd2QLB9SG+ZJE37WiBkDzU7HutpzapUl2
4RjIVnxLam/V75LtdvDIm313HICfAHIcI/M5pvmvDZc9BHe1ytNSDmoQkjMyWqHkmeTqikFMd6BZ
tEQsK1S5XwfkI1Iv/tE0yAvD/Sw12c8gyZVz5ui5W65x4GpPKNyXRd/ccBTd8jds8QrzyQGZRQAq
NmkSJoUU5BingVt9wC5bQMtFwBbaNrrk6AlHBhMRA4h3CGgPbv97uBOctVQt+g1qh1Nzb16OcrVs
VYd1/DqRJNcEoar5pWgjsOQfyEsStMxD+HgW3bvOvUeip3tPdo7oYmTd24j6Zw8XgGzUQAshRBai
U9j7TFM4cIgyCw9seJuDKPJfXOuQ3gbpuAggQb1aS33cTaUgyjIz/tBH2kvnVrdo3/Ra2J4DnfcA
8Gwj5o+ZCEYeQzVlmPpoE9L+XmNiPLMn/lwEzWagw4roM0mzpjsaBisAGjBrzgZgaWcrl7RJeZXm
81zpti7qNHaOTZ4P4gPEVym1xr3Fqt0A2HZx2+p37Y9uD/bC/W4Q12suQM4alRbHFHRlRCdi/lF1
13vROuOsxnsXss7ZNO+0vcHvD1zZTjhduXz8p/K59WQuTjvTZLFZozTROaQMHnR9S6FW+5AGtABO
SOm/4LW/urPO0lcSx3VvifEhzWlMpVjT0EqSqMkq1k7rITIGxIZuDleaE3LD5ta/un2WT0hZAiXg
WXYBsfmKs+IEZL/Cx1ALGRKte1OswNfz3Mv0SlCmqKJ8+a8homyQORGdBgjVc7sNdEV+j9oW2Ulj
1nnNDdBGBSJn9C3FffQ+13ltyRm+c8w74wYf7+QYGUVvTw5kvjmhhbLP5+4gxQ8Bs9xWmMXcKbVi
H9oR0KDbf8R6EWLB9K6XosGIf7SfkTR0ETQqp3CBgU+8g4WzNn9/P86A9OikonhZ2rfbOH7cYSxe
JVJW3sMpTTRPeUb9m4EyaEL+aY8ulhg/oLKF4zAfNusMHSR/6qoS3iVlzfW7ufIIMiyjJpTgxDmP
DExPMknSBD6E3YCjIYtm73eIV6GfyIO3VfT2mUpqFrXixbsFC4vJCQmpMZP+qKrIQPY/ZfHyRTou
ntfA9eZ2SoEKDha2R3fSj1aJZex5s1dZc7Fp67zmyPWvbb5c8CTDfLaXP+KkbVv5SlUF7I8shwPZ
p/junl7E3zns+RI9ik+G2RdOgKyNpoLZHi574KVrJKHirBqJfGz2WGikTwDH+1WulRO/ELT7S+nU
p+hu+kWLWWusUrU18OOwX8w6u2QtZ/xztSpls3UaOj/wp5DuKsgLi5ODbllRxfGK6gh3wVz0bjko
SIXbw3EbyPAwTFRRQimXumg1qHIPelfZwCB0BwrMdEuRB6WENbggJS0mDhB7c207JM08Ezd1AqeK
IDKuBDwLwV05ivOh1TqMctPVn4iFqii0qqwDJeNi4WltfaZKyTGgRt/1/IpKH0X5fj9VD2IY+bK0
RPQ7TyiC/gWHLWZeit7s6zv1BW/h9LqMF1R2Rzvw+cZqxJINCQgxVSegxINX5vG0zd619dlKf8KB
Z7LVVsTlo2H4u5ZVLME/B9kyS0OYvgKdl1bTzZG2LTT9xzqgSOrxmYVkk7/4xEFbFsUl8BX2FzAU
L1s9IJPKE0blip0aZXTxa9BjdLw1crdJq8BvtFPB75FFsUmuEoInUWvG6nGAaW+5FvCGdsJrUXPZ
LiBHTuSDOMr5Er7QYm80/gqrSlH8N5UtHn7eDXHK0HmzPNnKBEtHJbXP10lqXtP6iuuybtB3gKIw
y7sEjxL67jATKKnUtzO0OTzQGaT4iEXrPNptPvNVukUr7kFHrMTvqVSUCOqv1QKvjGNw39mEiG1R
vLb7x/8OU13tBocAU3oo+kjrtNGIboOKijqAVbL3lAgnwaXvrjQNDGUV4henAlQMAN5eUBdx5qIJ
aMEbv373wfrk4fHI8x4rX2la7ME5RPQWoG9Ym65Clz+SZ7YwvxNmm9zJjy1ayquzgKuq2nbZvl78
Zg60uaYPL2H1wcl1v9sYED5+ojd43cFAO2AHCEqE8038y7Sc9uinx2gqCLFgtgEARvvdZbSgfurB
hd558tHE7D14nIciYc67quzYMqRv8i+1GFEWrlx+4/2GNcRDbUlH8dd3lRQq07UgO1e3QyEeDCW0
DwPWJdyjvq0aUFkM+1YDnka8ckqJtTAzdNAS8d4NZ23owB9VW8X9ugqj/I8dEcnpkldflQiNfEOk
xtXbJbgE+L+yK982x7Vv3JDoIDds53ooCtms1dxzMjWbbH7qB6KDnUBJ1tmNrE903mP/P+ZyCM4u
ScKiRTsS1BJRP1c0MBGHdEYHnfj6bRwGYdlQQtpfuo0TDuWGwDf01k1kVufBweHUeJutTXcPP47s
W4tdKyS8O+kz/rpfA6tVNvlf8xX2xSstMGGQIp5ht20hEV/b1xjxkzlICYUsy7XMJcJOYOobfSCd
oY5BdDwtLw2np2KdTQQszKNawjut7L/yZFThfZPQOeXeNtrzWgj1HHEq0sCnS7SPiELuZo4Mic39
+EvXc84ImB5FOmyy3EFHL953lMASMpxwBMFZSpb9jfr3tad7F8hXYZT9EScJQp6/MfJeYfsL0SRL
2j1MMToYoC3eFhR+3Y9ERL+FL+oJyU6NcZtMG1xN+iYlFDV3wz7H+7iSzDRmgBHZIAw09LSNbJ15
Wl2r/XFcpsopCDavo7/xsiqPeDj+5UOtYNQzkRJNSW9VxrJES4awmr73R5SY/GvC5kVv9QtiLedJ
kx7nNJ92N8BDs6qBzyu+NxJfptp7eIrQEIaf7Th4AWtHflAb2VDXi9D6VFST4KCn4E0icrkYhIsg
oCFLNrngWxvw1gNWM9m2hnL9m6wCCMSlq14I4MfmZ9+nKQlDHk1KFeYp+H1sOQQ4reD2cmqk1Uar
xYtS/C7sAeUC8aDTHslfO0YvtAEJ9m4525vAj1QdVoNeHcasQsSf6xE29EdvSlg5ldzmFWa/zBCb
x6m2/Ww/SHSl7PykMLt79VLwJPEaKmFsZTlP9Sf/C/7aJ3a2g4bVGAABCN4uNseF1uaLUptunjFh
4knIlZoh5DY0vRijtAf9jJHgZynCXc1GFp1UmgO7LOWk6SNqrEQjZi32+m+HEWvJYl9jCZ5iMBz4
56WZyyhdBBuN85uIHg2bK7aQGIZSTlcQUULtD3eot6Stm2OyBtEwXwEbcsdcwcM9hTwDoIkMNmms
IM/dfaho6LZ4ItYOXwL8omzM20G0YH2QYGOsiSxJwJZDmtgclv/jmW0Oof7RylpBwChdxce4+/gq
VfEQJMZMd3lnUW5/m1yBuWP093O2gTB3rRFeVlNXHlSa5KO9oLZvSMxAjausgWmas9pc5f+jvtL1
MFZXb2ZAOFfdG4lpdjhQ4WdGN2Qrx7aS3Afa0itveEB8SPJFfzdA//FiNV/PjdkAil8I90/i0quB
ynjKFduvf6a85dMykLnlBSRVM9nlRUTmjq9pAbFwsblVdMYZc2ErL08efShIQQmMinM9krr+rGPf
rfLYduopL3vYRR17JLnjPb15mQ+U9bnBPkeKsu0p0YW6035dbqVsZUiR7/hDPjFMu2o4xGhYi93s
LGnN03czvmBnsjDu6xJJFMjlLcjEgwfviearOq8BX1sZgiFIwcTdMHvsSOrBVGP8UiVRu5xcXmOL
Nb+v9VjCzLaVzsTiZ9kPpCzRs+EWxG1XSHtnQEFuSPpUBRNY/p1YUN7dmQj/oyrVp6HY9YIVb92u
c3uW8BC0WqKz1oBivkSLKiFSrU++na/WsC/a0dSnPkl68c2klsyCoI9eEsQi4Mneu4zcF9AuJQRc
vl72bcngyLSGwnk9O8WDzYBPbO1Fw5MQxbk89LVSqXs1wSCRiT7tTvUvX2UkT6IIKZYduhb5GJR/
FlOcciYMjyL71oHGyDV7PECu0rwD93FpM5JONTAMHnLWcn7ro9IXwWdZqBdEIF+IYDhpPamgDI/h
BZhyFvRmjOwIUbueUOwABsTTkm4osxIg+7YCFrCmmRFQJ0Mjj8kFJW9eVZggt/L+BKc5dDPLIX0Y
atOrH1Tf/vhZhScZpxQSvKuDVAvRKG0CdXsMRwgrZIg6+XIxS+hD8iewi19xKFnpRWriYw3Puyh3
C35XOFEOBnYtcd3IlvoTIM8Ix9Tk7iZPviGZ33RzTXvPIN49R40EBUvmkzJ/PEvAInhS4UWuh2vX
IZ3I1fQBV4gb/XuVPgJHO6nLeLK2Nv/6sASQqjuaygeTSQzSBLXGHUNig0h145WnTXiDYmqqCNSh
q29ZPyxONAObfOOFMAW9bka+MN4CCVP1zMqG2NOH7MtxAsobiIzoYFtWYbsJnNetNzCsWdGhHx74
00MkMRD7MakdlZbBMu9RD2Z6ZoB4kxexCRJ1LlrnkbE8D/qz2BeG7/VGIx8vWecG3uEIdr8cLEpB
zBvu0txoUKh2+yqEp7gUIVzqrUCC9O85mypLLYoOmFvGU9u7UTxxcpFSQJ8t6t9oS9ZlUprlKBJj
8iQ/pp4TE/I7aNh5zCpsILcTf5vFymG/CTATKs8LGcBBUsJL6x0ASU6vLwQlGuNWUmx7nYTBzYhE
LNxB30HmhYNLISkY016bqTIjhr33KBb+ZU2vQYn4Uy+RiA52trfdFBHuoU9ZrnNSvXlBjiIHozC/
Ro3OxIHDKHwSKq7e5J3KDqIqYmVs1quEevql55LAkekRE5DzyPCYXAfkEY72lOYa/jTqN33fJ7W2
xDG5lVg9GP6OeZWYOB9k8P0ZcBmznVwVRX73Lp79LJgkDprYxNpFKS6SOdEhDAlAaQb4vbHAN8vG
RIx39yp0ZIhahsBATlgAfgJPa+F31U3MjEfBdhv2OS03GfUzt4ljA6Pn4hTELOu9V5Fs66h7sZ0v
HQRgyXjgAE8jru5zUHadl/e355mLY2981wMs1S5mtTtOmZtsEWr4aViAfcwYYqZXOFu/Ai+ufW/j
UIYe6fApVDty2eQXqWPzodWU7eahVBTEcJdjhZKbuFZQ38zLz3USR42SCq9YowyebWJKr1leu5Hn
QsYspMGCx6z1cnYyEliFRTP3853i9SMRBvYZVsSsdWw7axBrT9DEkSm+9u9Ria1oZqg1usao/EP5
u8e8u2/OU8Vjve8shc9hP773FA7dsvO2M1OEwH1lyonV9oqBG8W8DpHQa+seQvEJIWNwIoZV0GXr
eUCXK+NlcQzScxL9fxSMVuWrjvmavIOkeSWLRBQkX3PR07vaCeQvK8qh5ydCpYkv5vpNAW9attOL
YijB/+pXSNLclO/quhpv92O9lrenR4NEk63inNwkjwxx2zt+tuCGzWJeXzLsJiMNXv+QuBrQ8pqa
PiSKOf/kHez9TnYMLLQTJ4xANmOcHe8m1LeI+MC70VeGguor9Q5puGBN5ISLkNnv0Me/2XlLJCf6
6rgLdnDtsLrOzm25SVnJ5K+Zw73f41RejrulqLAqv+d74YoOYei/PCYrT1MSL5b716kDVzYSIQlR
ZUIWvQ0QemhZSDVwHn60TFsAPcoN9o+1J0MnEu11r6wR5+6l17MzTEWddb9owFw2L3dxlzuPFtIG
IAP5Ymdu96xpbV4O8Vj9adRh9j4WWcp3BCmUQ+PkrIfVSuKx6rd08ksg6zBfes8YmAZCwvsCk18H
DtFcBa2gvLfP+U76v43FD+XxZumDoBcrO01ayaLVQJpk+bEc9rWPn1Nz3iUvqy718Dpv50GcQ/qv
g6LH956mNGbWlT5lm/BBGem1Pp+fBshsfdG1H8oAHWX4aGDV7KZif3dTGBBHLEIOEQB5B4Vx5dMD
QMA8XQ9IRr2BFtqTDSjFcsjc3XsQ/i23108Tai5waSJVAEXLLg6qowsnUkNuQ/q2KSj2u9nCQSHm
GrrfvAkVPYIAUX9nPpsen31IBnsh+1G94QfDB7E5ET6muCCLXPVsIfe+k1GqQpsUzF5Q1M5p8k3A
H/Jn74P7y3GplDrhC+zv6drdqZie5x+jiDz7jh6MOpYwkZbMJ9Z1ixAwb+l3PDxGy+Ksmz2yMvnG
8pRY/29OEYBMpgFn6YL2DbbVJ6XrGP5gKt6JkzTd9LkLajAOri7QvEzm93qK8GdLb8ucRR/xM4Hz
egVZXEtm1DGHRdnDt/cKnzeSOG2cDo2ANVNKN+z1FlO7B7rgjnSMKEJT7WhfGsb5T0w8QA8VusI3
z1/ee0sjI4myV1AJPeZa0XnbrsNOVvegnD6Hn2JfPVsVGqDDY3+kpcVxO8aCW7Rid7EVoggprjyu
XOKH8EJde8IdkBBlH+1UUL+XnJchLEdi7lIseV9lxFJCaKSwy+csZ16HNZW7GFylew/5Qu9pUI/2
/jnxJVTK7XIsuShFtqYubmt47+tl9x/u3N/pVwzDmcV+J+DkhlXIajTu7aVVuko8a9oOb7aSYe8S
ee+ZMXXLF3z649c94LJrt62SRThe45dKBuLMurO5IeMrzHkHBAmTXTqZwxJuXBDd1/eVwQzWFyQi
M49G8ZPL+e2pjJvDGiCgdGXKajsQmNGVPXvlHqCvqcehmayOsy8UafWAgBH1jAZr3xxZvaQdr0hL
aXbC40424bR4ERH+2dZ2Oc6U/RLppxNkQ2mG75L94sIutn1wuFXH39Z7jeORvBY8yZOBNoAPKzSe
WXjUd0GUbSlmtLGepU4Oagbrvyd7IaTw+BDzP6a6iUIkodLh1aX9f65jnrUe9/CJIwuoT5fhu1aM
cX/Qh1J2IWYkxJim/giZWL8le5QJKKN8ibLiMCpJyRelBKxG3mt4dKK9U9hvs/b4SS3vRwKisVXQ
FFs0z8ad2UGV1pdruCX3gF87RlFVkvMOjxWsb9/VXkmDJiG6buCWldghXiNM1lZxP15H76UlUoh8
wZVGFnhzuHcPnkimCItau6f6lXULo+Gj1X5G0pPHtpdq4zRD6hrgpsi9m4mk73aghHx5T4lw/bBn
IqnkVtMeZFcDYhTUPxak4PZOyPOlDy25oaIPqH6K1XXbOVNyeFbOjQeuAc8ZIZ2diR0T19+ABGVF
vvvdqs7MmbrwBhUIAvtyrg/PBDQPkXH4S9w9ZFtkTmFx2yNwDXOahnn5aXXXiQUEdDMnxVgYQ2hf
sK9dwE9sltLRAAF0jRsBlrVNRg7E2H1DA1JtqHHg8/MNl4GsP+xpb1z94+z6Qb2pKJ434bfQ88FZ
limxIVEjlBSFbd7Wh49zP0t8/5C/m1KKtcjwQeN9E4SGcSAxXuEzLYFcnEKrBiJGB0ba+BCm0cNz
VVLel5toyNB0pl+YUU/HMwwgzGqdSY2vWd4XSVydnsOdZCuLJq94WKtSkKkka/iKAuc/CujmLagO
6COeCcK1gKZtvDhKOKHJJgNxsriUomrWoiYngNO7wI4EpUgF8CUtzY99qzgrZz0or31VUlhTvM5r
cyi8qTb9uO+TDR6kJEZDqH2dVZD9YTyBxmNpgwtM3+65gPNFJcqzh4EZG/aC+y6efzdRe8V1BpX0
D5p5SKv661fW8C+s8HZli5u90+PGg0x5rABTozUEbEx2m4/edJETMS2/PZzVhUFvIBxen/eImP0b
3jiKjPfUE89iboMqv0E0c0zP5DE0F2del6D7tLQmtOYZe6hocCr4W0IeisTuDFGBeshLENmQhBfF
XljwWLFVXUmOrS4IW7Wywn/teyc5eESKw2dHnZQovMrgYmkShFYJcJMwu3KD8mYL5LXxgxjO7tNY
Z0CxGKbuPOJG8qUgdgSF5H3I1vYidQTCioN9Xy8GEMDjl257Yv2/ecze2oCwC+f8nLTWzjCa5GsV
Q5Dbk7uo1ckL1zOVVO+k5LptohySLjvVkjSu7QyC2YnL/vlSr/hMFIBBN/tMr3wGX6EQcFcHoaab
qIp0imEXUbgfiWAPLaNyBDDs+Zb7B1hW4vPGzPZMKV5l6sfVoaHucS8RSzFSSQVHe/ffSVfC24ZG
jUTImWM2tUhZSdTeQ/ndeCYeg9A3RWhL4KmW9gU5Hlcr2dNv7oqKn/aCjgFX+r+ZszXJm9SG3Yyj
WnVzTrJL4d0VQ7dAUmSO6SobCAQnvSTLr++E36Veg5bWjttktQPd34Z3zPBoXbt3mrIzdLq2ZZuP
IGbHxv965WEzVW98QayDG8QKbk3YW8BwUipzwcdA4DnULk9pB87GFb3ZGAVzjNMoD8fuuq2yLfYe
9O3m3HKPw9LWuATUlChwrbyjC/c93E5D1HFB5/AUa8pE79fzwP1AOi+6SO41u5ewPVHqNb0Ujn5e
q5FklykQIk5ZIs3ekRUCT8JLqsocYnN6Bz0VgR1UutZvTOzxGO7iLkGsYNY1pu0iCkNWOVxI3nFU
V1FCsWbB5Xzj5afyA9HXzY3i4jkFdR3LgSsibGnebqecNRl5oNo0VaZjqEmIlMlUXBfOKnuh5frj
a18ZX0Oua/cOo6k3BVM1nxDL/6Ji8kETIn13mf6/HSOCgSYjWCGRYtqVWKnRWp2N3tIGGSAOPSi1
fXmLM8YCF4AR5K5C/jd4tK68C04bZqn7c0Y5FqflVwd1RmAO0KKEj4q4B5xc8XGvTsTHQ8bL+uDp
fMbFjc7IhDPE/AlYmBtRVS3nQhWGmgM+MRLGIBxciHGqZN2LCUJv5rPzh3MDsPfROEj2Y3ZWCqvL
Nfwg0H2e5XwZpQ+FnAj3yonhNcpC+v9Lb4D/lt6Hb+omrF8RG6p2aiOVrL/6Hldw4aR+6HxgCp6P
bSqcqOi+L0zsvAreKtijzBetbodq7QMQfn2EVXUV6W3jrCdkhNGwp63RC2ReGl5/uKxnk53zDRGg
l/HfZHUfIiTbAU/psbNkjV7xd+wqDSO/e2F0S83XAMLNxsbN2xgLeFO4is8vADiJEkhlnjzD77Kf
4BtEfZm5/lbM7IHlH2BO1T64RthJ/qavoTA8JFJlXj71vBfdHdgoNqFdCI4LC3tmRHY/tfI1U0lg
fYy/RYc5zyZ51345v/IFBE0IWV6fs71C1kkQH85BEyKOnex9Gir/F5Vbz6A4Ii5HN/9Xgc+KxEPl
D9xI41I8TDpGz2ZUiazuLQuWQGRFCfQIlGTfhipONxg3W8aheJ6DmnQN+qn5k8alddYCMVdZkEFO
qP/TKeYv9BRj+2Weo81BbZD+vHkvS+BkMBn3+9mKQBNbKyi1KFBbgDXu2P3xgbQsJ62lkCfl4BSb
bUrvJCoaFylqUHhYMbcH6scvzPou5bTT8EkNuM38K3C1J/Vr46NcCBCJonnfLM3bkpDMB4uKSXHm
5ycBZL+SAJbItIJrb+R9PPMN8AcPyou4TwowLLvtVKiX/3PPnGblQkZvmonn1WZWYscNNKks+LNk
pc0EGGb4XlK6Lda6VgMp3gK3+t/RxyXpKeoP3XgfGakVQrnhN6u4LrfnAxfgUqhVM12ZtfsC4eP1
GqRu5XanbzpvKoHWjtq8bYss/rjJ9YupoQemwXl7MhXwZ0wrPuQFR5TdRKdjDz5i/DjZ8/vFnFeE
O+gxk8ppjhESCXhi5yg/sAttA1OP8GHnoWRiVSHxcheSOjvswxer0TDkvQ67xnNrktud3TPvuFC5
h+d58LpqSne2NKSf5a+TZ4y0GyzHlqnd4tJYFpSubuM/MtXG3LYifJ+UDstxZnwYKAmVuVrt7txC
9bklwibm4fBeKb1ocmkHszAhjtodrr8s0U+2oaWHLCca92qb/s/HuprmUPjnmrX31ozOlTm46NAh
Wst32CpiTt6N3vX/jguhV6bwwpaUOoLhmqrVd4/TvQ0i77ObQpaBNR6wXQbzhLBnZJ9ljddy1bmf
BSGV4oT1NHdWrzB1fpxQtk7RDUOMlq4Ex2exCf6dv5/0PoG+bJ8VrRZDlrCZeTk1rhEWfgk2RS70
ymw83XR4fPFFdS8dfX2xCbYKvlyPEllwisyG1ApQhSe3nbubvzMzxWpEHoML2jpETWr0RtMHU10W
6sZPKLzevs/g4gaR+FowAbTIaYdWMU+3dSNuX8eso4V9jDz+sgZKW1Y6ZhCu9l1mD/Tg5F58aH9K
CgEH9pxV/C8/FM9AqhsIPLWynSb1cMARraCZGn7llf6WtVcR1fGGdTwoeWSObZzxl82xLglgTJ0C
EPDWKHa3hokGa4DVmY5o5N0v5ZsdUmi17Bq8Z3WcLgkKdskPH1E6F+Dqha6FP/AuPbpuQXdDlVV1
pY4iQL4wXrCsmy9j37XTkra/gbGgz5UQ5LNbTpHh0u3KSffxai4Nl0TAIXPlkspdKaSUje07fjpt
OJYfpfDabhhtkzg6jj+HiPqFaQIzhP9++jVlSixIwKefXAJJwTzejWGENtTTsJoadVHtpc4MZZq/
tPLmvZ4BkaHok3gbp3WHjYBpu78DdPWPzGGmlmzlBZtA6Fr4ZqbfmQ+HZn/mpcVpaXu5NWq7oyf/
mAhFRDxwcTFKpELAcbZ5cYFWDYF0Qrsne6zhT6o6R63srP2RHAMpt18eILZuHKUKZoraOagav/n7
VjHN2lZQBx/+NkquOmXOra5VW7B9Ecl94Ld6V0Nr2jJHgAe0n2Ym7t0eD5ki8IV1C3u8UKzrtlPR
meErOiyBGw+mQ0Rc2q/RKTI4nAjYtbFPLZEFeFl7SxjZarP/tgTupALQb2cl+Bb0T/ZdJnr5XhBh
p2izJdYYQ61Jn1GUoQsxTJ0okc5VHdZl7XGn8m0D+XgQg9OjYSg8vMGOO05DAaDUcCy3lIM/oEx5
6Q9ShgUrkYydpOURaRjXuI1lhJFLyEpmTlBTchRdiCwfCrsCuVW3HZ8MmITJzgZ+6FZaLaLnpK3r
VvPmpzDoV6zy3UJLQy2ycNlDJWrKIYaRPCa9Otj3W3eu70RtCpQYbuK6Oof3XtwjPity/HjJlFfy
KcdR8Cb4wrvqkn4tNGDVSNYi8r29nU4xmg3N6np6DOk2ux7grN1SrbjJ95lqPH1+N2vvmNTPmnJa
ez5wPgJEIfhRPx5xmTDaXQFCswXfKqGth3cfIOi9s0FqqQavn5n+dcXWD0J9o+CbIlvlzxrDydqX
QcLQ4cT7Xt7jb1Ed6WqmNtBEiooCvF3beIrHkSNQHQBbwiIiz5XxNAHBe51rXuXGWvI3uxy5aeq9
tWcIIYlJgMNOcAzxd0Q8BHk74XwdHHzYcdYYdgjNbygPpf+nMWQddd2GA+ZdxTt7TTa1EI+xh/A3
H9kNi1gG+kDen2P0EVhSEtlK97pIwGWptwH5uYJUJ0hLslNYSHHgFZ4N0WqONfTRGXlSJNZordSb
BdJXnmO1VWV/NcvpvUHpRM6hah0T+3Mmg/6sPXbMxF8i5TBoHkxREViJQspOPHjIYC56dYrJDKiE
nToFasczqx3vvQ9yTxwSEC0M6popT0AQLU6WY9hhdGPSvKcUiIhiIuE3eJDvRI54ueIjuXv0f2km
dLqTRuMQDJMOOYhKbelhRiwVd0WHnA5jgMr0LoHsYomNKPUQ0IE80zJWJIuJuKCiBsQr7+3If+rC
f6muuDqTGmhQg3d1I3IuhVxGJwWiq0IEUfDTEQ/nJT/x18pO5+IUwjW5K45NQlpnCIkPt/c+0v0Z
JW7z9S7RBz71eX7LV80uEKCl/QY+cPn4ET/KQALhd7XBiw1V91F17lM97HUcEcUTpPKJcnMRL4pU
Z8iZj0nUc2WTkERAXaYBH5bk089+XBen2gTiOVlgCY9Ws/SJBwnyq0/RPK9/zGSZigREwqKZzBj+
63WIFAFVwcB/+B4qfk/paIMfnUtTadziJ014d57zmdfZcOwA1ym42mHiI4CVNoGZuZKlVzR1erSe
CZFNA+f8X6m9CUs1v7KZppJpOTd22SjrF364VeGXx4qQiEG72vd00r58jP49zW0E64m2+7H9p+LV
B5EAJNPDSmwZUd1aPSgkBsCyYmwlh5oxcLnJxZ394zdZ87QZ/tOimeJQZlgVmLKPUBwgg75mUChI
IOgHG7DUTXXVhXbItaUJQUHvMkzGjs0fds1DErDW4Dsen6d4ZZLpx89pm0yA/MwNgj5lubjTfvHF
NcPaEUZPSVeExHP1RCdzaQtMiVngaRLfNdxDi13zKOiQgLkbH0CdAJuI3SMvdKOEHSAF9iS9dZfk
/wvQRTUz+4LhOTLkG9G5hCdJ5yfHUoj8OdfKfMVPX7RFupbnoCszrvNAXAcGMR9v+q6COGSCMqMN
pCzzRQ1liVlLSQ7hTtlAKdg6dwA7YxPxIPRv3IML/7pfgxFX/nZzNj2naB7MQdFMMLnV5h1Rx2mc
PTY+8kylXtdMxxKQY66d5WyG9RrJ/7+fGH4hlQ+SUP/4B2Rn0bx7MDGrb2wXKk4kg1crjXWtcRMB
0LDHLCYpV4+EFyWVP6NQ0nzzjfAOsDUUasK2r+GjDiP7BwR/w+AZM1f8myGv4mr7El6in0BVJI6G
68o6T6eWWXWa99tZvwOJz/KNPHq24UBzBVQDEdxwCUIEsEgm0n15Z/HJyajXcOaAmC8UEcd21lWr
//3QGicqAFVK5MguIZbV3blaiyO4UZfoA1kHf5kpBUCN58zx9pzIfRKJSHkEAii16JxMrZ+hOhnf
YGr36dHWuxFH7HNMeLDqnr3FUeQWRvVCrpTbKPbNPauKFbUGRqMen7YiNW9Zfjd8ASQ9nTXPYEn7
rt6vnvxe1weUQAk5J+V9wFx6fiuyOkPbsOXdJOrTbBpypmihTg4rCLuLjPmhB++QKegl89OSpXtm
8KnIcYUq2gSPPNj6oa91nWwLSRw5sn0ePsODjvfc7Z/bHKcqBH/5+xYYVfOKQ6AptMDVK3wnf2yM
NrU4y9sf8piA/5It5bQ1lQ+BboiOQ3F2uOiTLr8bz1w7JgSZqKPyNRaBVyKBdPOBywo4Yu23B/hy
h225HmVlCx1dqZpIbJnxya6DwDUbGOzA6H70whF3KeVDO4Nck374cB0k/ESDxZypAJFa/kwcsNL4
NdmA8MqUrEWbpA5fp5AueFztdosEt1clVEOqddVhzXfdQEAVsxIzXE8Qhy1nRXCy3c1lazR+8Npv
zIsqg2FI4xB2OswpthxsJxJO+kZDu9KZ5LOV0ShwpZgvENVhKz5uX8PhhndfaMz/WItoEq5E7QVU
bNBpdAIkWbeYW4U4A00By98ZJS2yCe0bMe7XAxVoAdh3rACSPRtK/dJa8kUmGhMbIUKCnQLqJ7MQ
QXiWV6O8U3cHFhtJcEupfrIo3LqI66X7tPJI/pWr0et+8PxK9k6ue6xxzc0O2Mdd60WQom75PMo1
cVx5uic1z0SGZ2WBlNjlctOf3C8g4n8z1xbWrwVi5b2pHXuL3Wh3Eakmo5FUV9znWE//fzJMw8cc
nKdWXwd5IC7G6r556iMyzOc8rGdk0qYox0lo3Sy0GZUJWBUJBw4YPfEj6zTcY8xZVZd727UqagDI
xKE4F8+48r0ji9uU9Q4n6Ggfd7wArIDMUlJo0NJ/VDIlhiGY/UHPW+GFdp2K7hZyCdRZumHimm1m
uUSTPcd8AtGqvccJL7ntsNbfR8yotbyAFpNc6gc4E817XQjiuFwgNxThj5RVmzOW4Yv1ZCO4oUjV
EFyQjPv2/ilgWPfZjNmmx0pLdmadIxGW7r6Qvrg5Euilz+cIw+lBoXjRKVVAGd1BP7zXtlP/Jo5Q
yOaiOlSS9Pt44PntlqA6ZwYzDBW0ttIEav5o5hU39g4CBTZuDbosNnragm9hDpuXxl/gNjzxGCev
2mvunfwHV7dScqUO+R+omP2KCRMpC16sKl6K5b1v8lDGevXYOY6OHF3e4Q9WGJBv8mS81bqONnz3
93RJNLm9CmQn/Bo5Ge6cZqNBMOcDUn5TKW1kssNto5K8Tg/HmJjAxCIWV+A1DCD4fjDs01OmnILA
/Xks9fCCKh2uzGc+JwQWda+yTvM/lQAybKpUYLypht/zYFQz4X715SyEGfFR1f5o8D88qh3Hzwv6
HCclcn9ZfX+HV+RdYfBLXlxrsFTtjfrGL1sE+isjMyITy3a0Npvj/zFKi+O2G5CCKyLSEzTx8sht
rE7kV5V4tm+UsBlqXIh7Ogs9OArzF1dwH+01BT+zWV0uturw9ntNo225wqTQEKGiwMfzHV6zdPld
6kY+XTBa1VHUExh8DIDy347+pm+F3zmNBmtzbqY7FNzBkxdWrG/aZT+V22KnCfhUfI008eZ9sOGe
SCxnNW6WSfFOLvORypupW40trfklM0kM5a61bkKWrCn/74LNpNonKbPRkfkxZseTSUMbzgEx03/e
FYxjcgx1DenOBVapvLuOovLBEHFWF2hOJn6i1yoUimvwIbYKo/tVklXiCFqK+PXGjjRAqoK9UIhx
ecPvAjLe5j+YxsvfTr4AMM2t8stQtcH4UnW9ix7vOQIr1Jk5m4/TgXXzR6MaWiNHJVZ1vqmSPqpk
nULYN3Fox50i2m9dg+LXkJDoQeBRVSIrd3nMAS8hYNCU1JVBne7WDwbSjJB4dSP36X6Tb+IrWwN9
rvUl+5JEPF1ve0MsSeHn/uXfc1Ih5Fa/JR0GdDTl+8RaleIy7yJc1NTaahTAXL7fRHEmurnZ5nVy
xIP5b5yAd9dNfCn35czwFGiiqeXH2Ha1f+6k/uaOSpIdMbtWsYjk6XRWSAuVTap4Ii8AVirXOOQ9
rGlgE080xAEVMcPFhRgYXybaESF2KIaOraqbW/qoLqVH31DK06NzAeCtcJQpUPid/0WZykF88qiO
+Cmw0gjr2iDRSLQNcg8jlK+VCH0rIsy/hqhxx9Z1vKfFPH1qrUUhu2vFWRhugc+RyOcyrhW/9UgH
eq3ZiUPKDWif1v8fRcaZCMlc+3hIYqva6N4MAtlA2g5Nk2XCzng8Wz1bz5DNmEtAOXD30MeZFl7B
/XQcE8tSJcma8xJ5NZOr/F1MEJe18yg1AQVFMauSFz80kqaTsMpqL66poA9+Dq4zG3WrmPB7DJ5Z
sFaIxghhpu6hhw8ZAm9AhdfcJMmWqTg1VJjRS20AACYoqY8DCbQLthDMJSKsrh1qmbIHVeJuWwyq
8ZnVyIIVvwx7zvoaOspl9O7bZUbUHVzULBUPV7KRLSchodXu05poMAoU+JWBWU2stW/He33mkrv6
Vvmz83ut5J9HOaYxJpWLRTEMmn0npvpR7lSb6wxtC0UVaxbZlTsc0OTRQHskA/Oss9R+WltSIQOk
D8Akxm8jBtFCZX4QgL1hEa5HLV/xSh2Db9b1MLvvQsftVhbtrIFNYm1zfxlwrMvZ6bsP+a9Ph/mu
Ih39a6j9dZ7/8zFCfs7H1nNFt2Xrgz9bjQznUzQhGOQtwD1F1fJf+DMP0zm5qAtU8aFU7HPyZg4O
CmycMOitXhcxGu17yZGAyJSD2Hjf0LRXdhoUJTdRVbOQ3U3hlqBMhy13mSVl2X99s/nlvho2F3Jq
MEPOxEV3BhhREBJSOnfVUgspFjWJzEBptIELmGTlfveECJjY3vi6PSlWQu0BggYjDaniufP9tN59
zkZZNatI6tKWjnE+m/vtCSoSF+/Bcp+K4zdhsuckURFjh4ScMpvLNxTy4bKcbCjYpaoJAkJC5uH2
dBuu9RvW84kdtZDhTk3WlQHCB8AXxfPGWKnhUnm3RpK/XPgKw2tNYr/pgk5uSeDMYMpyEHlpYuWA
hkTnJH5/T0iYjaG/oPiR+X/DOhQxGo18gdn/bRgUCHLDYxlUgKgInmWMQw/EBuCwqmN6ig61Hlq8
UNZPrHACiI3CEAJDuwMbmnukYUID/noR6lNTx2woiDqyDnjAwBXRL6sdISKON/zt3HZcuqibLijB
vXpCVQScROS05dy1n/5nLWhiEdXgwyrpsF4anNJ4tDgwMLEjrWX7D0ku+Agz/Vj+HaJ5eXzS2e6n
LOvd7v72G132GjAUpCO4IlO1F8DsaS+beRbd4l49RzVg5Ed5oZjrRo/MFuCgxIDLuFkvfUp3yzEL
ZKv5YviqWTBy/i6vWQem8PCaR2fhKFxJsyqEhQkQBT0PZjXRc8hu54x7JgEWwn3Ej64Q8xET2I29
EWfl0zbX0TlF6fN4+LOME86ypTIRWIYRgbpaIiRkVOtNKyMcpph3EJjc3MgVpNQLRWl4PQDW3Dgp
QJMI5dzNltW5xiXNUd1rka76bhCCk/ccv1d+twhiOFfBaieBUQEXyVlwaDvUN3DRs0RLHUV0zj05
ARERXY1qRrGWdbT+8y3NpTtJgo89WwRaoABZ18ennbuFqlPSuSZrWwJpi+Rk8cIeGzM3mPwEebdF
8ZH7EGsW166TZZdTIidZPUVxqIwPUGG5bjWND2KCvQFk8IdldRjJlR7TLRZzIZ+WSg1pT6swBftv
dLLBX3roK1QkRjhF9ar2RaNFqlzYmAIN+tPg/G+oU7NtAmDK1/LaX3BL7HN5jx0iVwIfEv09GrAf
uj8Hwh1w9xE36V30JLlimKoJbHDFI5y8u+neCd4ZuWiVQxFEOaO3Wze7z60mqyWA3toZhOQ0g7uk
HyCvACH6Lx6ZdvhCOPL582qj0Baf0rNf7o8nR4yLk4vmfaRjK5pZqiWcfFyEHFJkyKD6IYEs1k7L
MFx2RFN0we1fIYVYFl5X22NdSq8CV3RRhJa4S+QPDgywlZlR0VBhPgZGz6haWY/5IACVRj8iLhsd
cnNaYM4ubmdOT/AfdjsBWVL5zi15JXrMLf+OImMEG0cx/K5h/NLM5s8RGbafD0ESFQcWI2vgsoK+
MM01an3brc+REShQhznJmpOdkPGOCN9Gfz3j7ljQAGyH1g15283lqeWLwGqU5Vx/5iODEKRtvttW
kuzdZ5DwFz2XIvsNrh9fORO5zLsh2y6jscgvjPl/NOmP4GH6xwfKSrF1iFx+tFVMFbfR8RIUkwqL
UXpfe5K9dkpK3lwmU5lDYuN7FzuCXs3NmOy7Q5IkSNjYO10OlIj520SN+ZR0pCt+3rwXIZCgoQhB
zm8H83x15WGl8gcrxAxtxGOwJnlbrqixqTayZ8uqDIB/ErJZm1yw89jLYgDTigzhgrnEDzG33Ocv
gOFy7FrIPBzVqhXAc91cBYhLTqT7AO5/0N9wAc/LveoIMhYNJtkU0fQ6LmblZwzODeJV7a/dWP3i
zS4FoVSEvVp618eXoIieBRnIQl+8omzyN7hLMT5l/pCPEkqXpe3NZcnFVN/0he5iVftWwAfau3uZ
rOFKeLK4mHp/bA/0/cwjpodhOVvapZleuh8w47OJivZlJST3nJt8PLCRoYB6MZr4tpxuew3NikWA
DD4tTvnBmhomqWvmHdcoGV8r8OE4OtE/wcZEAvrOmTBwunj8L4yEmdJqb2/XBrYdNmoo0rMZS5Ls
4rmRDtk6G/Yn0UAN1bhONVMo/uZPyDJUfSL47/sf+ECIYIhyuD+xYp4y9PTwV/catbIHx2GJRQ2w
I8MZQteNcZd/5lAoBCyYY+bpwYxw2oatHmRu01nfNfl03GRXsrhXmjuFE/I3d8J589qrvdg+sT/A
gb8arq17eFX0cnvIEKuCvgOxuz4sURl5qKZmheVLjaKZ6E2cooN7Jg0OOrtB75Y7gTBT6jAaNDcS
3J2QJ4jqQQCzuDzplLJ4Q1A+/u4oXSbZYy6iECXK+LAVAMfY3L71gguaW9U/numDctlHpGehQhbY
WW9O4q3ULS/9++VuQYWBXnZUMlAYZw76cH9LldQhj07Bv0TWPxhj5t/Ka5/P2YNx6ud14Nm3DCnS
OqzThzhSr0ZCA3GQEwHAWjuG0Nxtp6MVFpXpYLuu8A/jL4KaO2jcyaOLiCRWKxVoUsmhX/eB7pFJ
x3janGz36SA6Ub+TZPUupLGIpK4hdTCFrmbhfv6N+nVMt5bl8SYgSCl7L4GcJxTK0QwgcATT6m3W
xahaqxA+s/V6d2x9r0QOIjW+ArGPmL0821+YjhzWwvVWjNQpp7TJLCzVfMM/6Hxp4WB/zD3IIY/X
730OlfJzWNeb+HB+EqIb3PdJR7MuuIsQ3MdMpDNX0r88JeQtsH9Kqh3iL6JEP8tsBUPpU7m6c+S/
s/3QCDWFZ5hxej5RPfcaOdQZpIrHbxwvXRI4GTKWJ6v+l+hacWENUeWpXZ9q5DoZIjVx+1fkU5fb
ZJlBd7FqNa97ess2A9Prq1mDdM9uhAvPLK81wGBfLOhwl/7zJ5kOrYrsknESYSTFsrvCQ5Ce5SML
u5vHtYc4J8xVLn5TwVeTcDd8YQ1DLWG5Hk7b1gdXmGiNPdYVhv6maxB360GHv+m/cnvLWPrUfOe4
/++EtYsN3dULYK7FhO29SnrlXwlROp15aTMHye28BbqqNcVv/SrC3qtw5dvOTzhPI2mhW5lokUM1
UPoehCfY/h1SIJYna+D01rzK7uMjiO0/3JMzP794aP5xylCKgIh5tCt1KOIJmXjZX5vSGJUEw3HQ
Yj6RNaNk2T90nCQSLqHuJ8j0cxwNYsQK8yfCDDhA6wTbTWa5GvEZEU01DH4YcISUzHVbm98i4Of0
q9B8/PFL5TjG3nddoXCgki3fZewiP91JzPqd8aw9o2hyHR7dmzCwlIfu+r2S4AfzaS+r5EBPUYig
zKZdWWfY2FVtUO5H77zE11REXHZcpO3R8oqqqEFAMPOumfVU9ve7Uhq798K/pponhmWZ2BKM2rJQ
nGGBMg5btpjH27Rb5aYfgZy3iTovO8AAKddvTqpdcafwDVUV7PIe59h/iXgeyeXNKKTli/Psq1px
7rr8xi95F9tBidMCJHRK7LJ+V715CTnjB6ge2w32KT04ZBoVcLgeKJoNQAh9vOhMXiSqr3zZAIN8
fy8KQ9+zYZuq7w0Wk/AY/iWbzxTBDEGnUYYxYs95VvwLf1Zt1TbG4MhZOw1ZBVok3lhV9+fgjduu
evrV9mWEfjfl2E+xUaIxdV4b/WKV0OIsbRgQG/FtMZNS8AI9AaDak5HBrkYqN+zORN2WGGx7rrGr
u4hxVsn4z0C/HmC9HnpL2Xmb5CklKYAyv5XBt3mYODpiewxAiD5wHoA/NYIZXu9bljy3e8R/yeY/
0TIFohnoimmRAVS+085UeFPshwen2CrKD2r0K50vBN8uFKiK4tR1rmDNHYyF8tv60Rt0V7D5VgTo
5WTRQNDUr7zsg5DQwH1wz8DtaC0nPSo1/DLdREy+pX9g2EmQAPxcNsImrwzQlQ0KkmaTPMZsCGTQ
NW+Ln7hcDEbBWtPE867pZBzDI4xWK2NzyJv2jyoLDXcP4+wQVnIH4HEIMi6jGbNWD6IxjZ9W2YeD
rgqPfMNsmKU8JlzitlnJzJMVl4j7saMQheZyd7fyPwXfqi0MUtm4NcEi+YhaeEqYXujfDChamRvF
/Vn0PRDBjtbO7uwMhAl7fltWk7L6OAd+3JOMauQVrTAkwNSWt9rJK3fEZJ7bQ/2nNWJnVvJfjtd9
TTR2K7NKeoWqa2RBHUYgdWaDuNnkn3uVXOqS6FwUNMiRegakr2t8gjo7LipBATkPFM+fXX926gJi
dM8lpVTTjc9bWtz0RdApEtpir/Xcxa4h2pKg29/pRjsdSCuxN0E7sErP1BxdhPPpjaoioX7IcUF5
DV5pKxO1kjhFl6r5mvJ1rNq2rpZwDpT/g4vIV2DOan6qaa/KwZkviP0DFoPdRWW+5rFt/6pmOJHx
9L1PY5sOsak34+qGmIM8rQ8ksvKzK+WLrOSHknc513fUPHIWvYK7cM5+oiarwj0mxILR2IDzbfVs
SLsBHnnnHTnPYX+WXy101dnox0LCEL8CDgAWqNfduPkIOpDUzsvEHk1apVrAp5VB55H4TVkpn2xt
yAwg5HkdjLZWVCSgMz+iGHEk8CBzV2H50IBRJwKaWQOz+tLGRQBcTtmuv5Dd/TPA/eeMeyWuGmNr
iQdXPbhchnmsYxGIfx/dTj81JbuW2NKIPJdjdstQnnAXF7oVVoo36aVA/L8pRJHm0Qxjjwc/Ipse
hF8lyOPyTX4dXYXeL1ssn/64Y3Pu8MqJKzQTbdTeCwM1QsQA4Zz/oCZMX+Y9/DULvMZov+8KRwBi
yFhkGbh7nEjGKtgMSXw5m0y8E7dQF94UGSbgZUapa18csIMbbITKw8rYXYqduPf/J5MDvtDqtUnh
zx6/Xogsuy9CEkko++UON6PYMnBnJrHM1alof4hiduqdbGeuDyzKR+6n8DroLkwVQBn0nc+JEnQ7
QxT0G53WJo5A7IFNbvbYgFLcKliyN/MQiKYiOaNBS4HoW0Tz3XaUDV/xKZs6wBvXtKZy7GHyc8of
Hqt4P8k/1vrwAwaHio9fg68sXcAqGqfCGQJgXtP21g7+JVWoDh3hmWwGpYSiE4MRw6wMBzyT/5/4
NqBvLIowrAQsz8Vn4mql9q22ItMDf6Nim7iq1NORRXaE2JoMKQpLCNpeSIXlxVxI0jrF1DfXnPU8
rtBqPP4UJFKvzVoY/iZa9fzOO4HIuxeKi2xwyAPdSwdKON2a0pCnUcPEbS222MhD+ikIUg8sdibB
LHr6qwhNiWRula/w/dGWQCc81FlmJwZfpdH6gmp53fJ/HP7K6GbSk8H+I7DHFxU1n0qqPz9OwKi4
Zo4Jd+1sjKx0Wf8b6t9CEciPhMrG4V4jSgbxNinEppvu+4xb5epiTykjcHzfr/2e3bKB/mg3NQdJ
p4pOxaXTjnRMZGpl/0osESfQ45hdVjjRCKKIVB+XfDTAzYSf8xbSy/hhcg6Ryd/OjBFZJA3LMVrk
32NlezFofSlJzM0J+7aLXdLuEkLIPiDu6vaXPRBDirjJ3immX/ooTbYsoNksqEGMqARnvxy9HOyT
po6Bx7hOP5UvJKnr0+U+DbhnQhD2V3Z26Gd3B9WQPWzT3huxkT4nrV+gMZR4xtPVjoHW2aSfzSZC
JGK9biFcJOii1GmWvCx+XI1erVAamF1Las79IGO33dCiP4BfbT3CucU7/BC+JSeNkEUecxeCWaJn
Cm5Af4+xUdaYFA8w+TYG3ocQ+wMg5ucJ3+GcsEmygicvk1yh1z3h67wgE4Mhbu2PLDxps5h9a86Q
2URkXYMD9ELBcRWeIM0/Kd7N7qlRkzej2HA+lvUpW/GlkIUvHeGSVaJ16Y21oP3Gp4KpS8PxLP1D
PneaQsDok5K6nPgAw1GxUlPem1WkOWHYujVnen1FU0sZaQcFprMLEWjjQjjRv7zK0cTTmrGq+nCR
Y1sIF4EJppLibBTXJZKTk4/+MHLIKAvUrBY2kosJUZDvAumiXK4SDA0h9KEc7Xt0moKDckD+ZoVF
uuNv1D2G2W0chqZoBfycoVb62Qmc9KLJRR6A+B6ITcjwOzN/fvbrhIMBKuccigAfQqzQqN0TzQ2t
YR1FsktPGpf/qrajZZIWtGEoOuNLe6IK8QmiKjjCvFouqO3WhXaGrxOg9s+Zn7AC5mydHDM+xXCR
yyTfl6Ylfy5A0tjNda0iJ2lPv7+0kXvGUTEDd2OKG2Mr5GLCjfJ6awX+YGMQQfAtAFYvR12QcuuD
Z1VTYL/KKAalcD+v7012Scg3rXRX9mFYXD6egOMdiBXWUqqAt7XQNRyf/H5v5H3PNtu84WHv3JjH
pfUv0yY6JGlbD9TEdeKHKKKZqe1HGPWKETGRaTIglSUyZkDXR3m6KkpjoR8oLNC9/7JaSmI3/1Gw
0UqiPAyVI5PSuXFVmhPpnyJeW0WKD8rZglWThHl8Kw/wgjhcppj+4MAUv+gV+0ltoOErgn5wqvbu
BgJIqOwAxWKRpdvrItUdMcIfC8QPdniwTZFUHhor7Phal/9uSjramKXqvdPn0CZ7xDbdIbwMhzSS
fBZO2toMeqrA7Z61wL36jBdI0fKqEJ0RFkhH4XgXBIzUCWIJxPhefvZVqntRe1ufjlZlk+s/EFy8
bZGxQNEx7F7x8DA1SOlYTaUF69OYx8WqD4QyoQi9Vcwf19EwTvFMhoa1fp0XkY4hNLvu3qF3DwQK
QHaUMyviyxTFZFrfMk2ku2F+63bXVkNEUPYPXq/S9sXYi1p1aOettk8dD1jPiErgmOLOBct1bnNU
UzSYWQjxTiYRubhVNkd8Rk8eoSVjUbG1GILa3zZVxXE8hzfli8/jJsB4MBeLKhEOEWD6WDOdpq6k
RDwJQWrbH/J8Qt/qebuz6HUH+npXxD1hQgyGFFVlkQRs5XM34Af3CEgwgvTNp7cd5ztuMz5ALyZM
CF6UwMijDCfS+qlO5tWrwiKDOGMCPnDzgF5YT4Ksf7bo60NLHS9fG5WTwN2n/DOdce35fqsvjSHJ
NhWfQPwdsIO+I+gVPvYCtuZYKS+I5yV0QXKPblNdLv/RkcQOBXD9s2NovmfdZO6gU52MQFnTO6fp
zi6xAm2vyTQFoRzyLp1FGvYxYQcTSsD4EOZTwRtkYjPEzvS7me05c6PYCV7KUXVV3t1IO1b7h/Vx
sVM3KOYq9No0EbtTThY62M4biaC/COP4VhczK5AUwhDdjLkxl+eq/ECJM8VJXNZWUv1ch5ydKDl3
Ms8nPGh5IgidX50M4g8jg6zvLATJ5SFQCLE0JyxVdeMDsf0aWgyCK5wvHyhEYn23KwlvBes6bO0k
wr53khIJDElmkYkN3JYA9uVAwkNVGYQ6jAMdzZ6IyF2erCxRhspxgVaKLeTpJ63+SyPsM9VG8Lse
19goT4xt784VAyrDJE/gYAN1EvJrClB6Or8UaYaZ1sSrnynFOQaIdaj2e6CTZ+jFw5/qEXmm3RT2
01icgV+OkzNkslmkIF6KQHqNPtomqjgajcoaB6WlfdZ56bTZjGR0v9Wpc7A44dsysa6s9UjpGEml
irqXWPKY1iRqrYA/a/NbRcqFqVs2E9cJRDtfrWJDBDdupqknYyKr74URi/LNI89vqhOvSjyMZeql
UwcUOGBaQrtbPrfF754FUrNWc2950F4fx1F1TfyyHScXT1rRZHq9Qkc+6l8/aGumAcp14BDU7NaO
qF7KIcpLhMgcLF8h3CZkTI/ue3f8E/NIFyjTuR6UGdUBA6XpiSX2z9wJ/M0kcm5ZxdQ9laBk+jvH
Gvcnz6qCA1p2Yfgx3Vyh7kz/jIpN0SoOyGtO9p2JLtyw80rSaFQyPCZ893sNdnbfeV2diqxVGsFT
Yf4HoBU/D7tVbWb8mO477NPTWkdOQvDQSseDSjQ4uln7+E+RnlaiZp8Vl/wJXdonXjmtyDntPC09
NJ0ZSgiId0/cn7mHOqy1hGKmWD6gLQeVuln0XYv9RLRbB6QAL1MDeo9Fdd0sDXWfpkhswGmfA1gC
tQMVlhUTRdEV1pJ2bg6YcGEQ/0BxJNaPjrAp7E+R91WZZq00GHlYHqgnXO1V/E0alTF3DR6l4PiU
UQAs1tlJJ08cfguDXpLe40oXYQjife0D+JwIOqp59YNt7zREWyJ4q8dfjvIZZUug/euBbQaKihOs
NLYBxjXms5dT8wAYKpIXqEWx9hllJE7rLfRfDfFTo5BWafRWuHFjLo+BySCP6P4TeC15tD7rKXGM
p92PYv5nqHfjEAUB5vJxoQ/sO6JTdq2gJ6Bmp717VK/9BvK9kBbnmscekkqgwwqjdGB8jQimbuWq
Fx3doEZ9dyf2uuExLDC5lqblIxXrrkpAWWdm4LGu3/4LEK4h6Pb/o84OrTi3XLqLPkhJjG3gM6zr
XLwyBeu6ITLI461rM8PmDOP9pY/aVnMLA7zN2jYNmZLmcq52IA+Ck5R1k0tBgpnc+6pOVnFFLqej
9ozdaojp7jeTjdHOgDqbmgYxbVqtbu+flwwibheeGvWN1epPe+EWsOcdfDip9Ufb/i0pW6zo+nmy
bFE6k2TyYOAmpXPej2oji4X/H115jeAoGg1A2g6HnLzlb7lDIcuIj/ewgVE/yak5vZy1yGtKiNaU
cYpQ1BHoyH/oJ+C2j/9IviFRzYwzy3o5CYMGz8veFnmGLo0YNnBsdyII+l05cBCOu2An54uYlFkj
24Dt4D6O3TO2tr/Z845qdBydCoqS+UOnhab3fh16K3Fd9hmbdMnZzQtOrmyfslAmBIlKRCxicu/4
yzkgGq+jX5KFBjnF8Duevw6eJ+UubngLEDhnrDFS3adqiPx3Wy1ynwDcKuDJkOPjOB41VAbLtcqY
P01Q6iy7W7zQS0zMyWdBzjkQ+At/nwNd70VpJtMwjKgZoKSv036ayACQEW2XKnqYtQhjpW2BYMEN
FaU4iQhfKpj+OCU+3aRcye8rUAXcKPutNqoAEWJqXbWLsbgui7pdJpMtwyQZLVEjvlHhf+xdANY2
WBr4f/r73xDFdZqQSyiv/y3HxR+MXDdrWb5gRN4HNUOvJVoPhw03slkLxALC1X3ltkjG4CaJUMC/
KqWzE0LHwyw1g3UN67wLPYljM1Ixi7Qf7U1B6WJdGLZQTlIkfPjNbrjaNhktu2zBsFviZvHipgSu
ID+1faV0qt9AlbM6vi1WarWL5saGiKlePaQtj3FN89VYVHzcDvcXSG3E9/1ieMs/4nBHIqmYeUM7
tFgcZTeXhyG/zADjLW/MCpgyoRIjlXgPcyMwcWM3yckI+vOLxIqoTyhlNLJ9IxA+4c2hsdibWwRd
1R5f/l0p2Ti8hpbNzOd4rmfvPyOGR/nYfnraTR4drnRm4S1lReD4rAw9dVNwmBh3OcqhhSHa6DZg
JhyEocSruxPSaJMjaiBY13MoV1H7qp/KPT8fI0uB3Ts0iJr5gFU+6aQTIrRC2P0nrE3h3rxEL/qN
gSnk9ewFDYUx7sUkCR8yR98I86e29kCzsJegYAextiln5dOTOzg3oxYytLGBiXXCHFlwlkbwO82I
O6QvRLCrWMldW2slTGdGf2CwG0PPrqUSuo/qMoyXuFb1e1J4ii7kG3P2IGiSBz5rnM4ldJ6oalQq
2j/MR5ZIt02GL5fFkodPIYrRH3UwdzXDan8CZUkT1kEmBMSnFSz/G7/4P1jqy21jKT9ubZhIVk/3
JtHQ8Q40GOZCQ1pRCKweMQEI6TOv6tMzjc9/0iAo84xsG8Bw69lUuwW3kibe3TMADqqRg2i/UR0G
TfLWEhjyoA/HRGhnrcK6IioOKj9bRfrZscl5KQizh9lh7qUlnfEZ//rHb5VFwdh200WJcHRh+NzC
S4p6F15S1LwzruKR9+mZLIbHFvVwaUhX+quHMtiImBEdrRN38s3p90MZy5qtiQPmrSUZNsI/gZce
4Y4VUL2xr4v92nxTB0USfeCwA6YbioT+vgc9i2GD05ptDeluyOnBU5JDIEbBRDvDxiorkDp8n8mc
soEUgMfLJ7uG3llLJq+pKUjF0KraktDIDO5Rzc3xulTBc6AC43vvE6Rwxq8pdtIGUKisv3bdVimg
jjO2NFAllfMsCHP1Z9qHOSw5eeHw+H6TsQX34aRFY2OFXKy7jGffGjMYxSFImvvQU7GZH7yQ0uqx
mrR5fbk1uh+jvIU8qTQef9zk6LVt+7G+VivOUBdMR8sCkPLEocndrZJVlGeCbfOx9BUNHxHSF16h
rtSzEjOscLVMhjActLQqbvE2appgo4PYgPpyJyIhNeVpPjBnPI6l9A/o8wu1Nz7woIxwZh1sAaVb
eYb2yIdUtSIXa0qh6TFUI/d8Hg+MWDWvORZ0xf90QFuKElXhPvmdcbA2DNCKSI/9WLpYr9vgrWdL
7nCYhyv/SSq8ryPN6xNSLtIGMkXme98Aargi82Vej3LXk/Je9NzdCulrOm2GgAIV8K5y5FgZ+cP5
i5zQNe10nOAnAFVsN5XilI4UhiWLbq6+gwK2LkAezLQNYBmlTrgu3TQFifpRtKlSu7khhdiu+Ux/
sM/YtmBL1KLbOOeYKfoENiDDng3LkJk7FNriHRR64ZzBI1uUPrj6EeBVFL3C7wz3xDC97acCKSdz
wkvkUMysBzk9PQwS5XbVN19JVY/I6DYzc6T2Jf0C6JcUOY73KB2/Zuu9jleNxqvbX1AwyeJv4Bvt
eau+Hnf5Zw2S8ROuVf6yA8Fvfj4V+/Ji/5DqKAqsr631sIyb9LYr1aSM4kvhFpQRyYKQfCOhB899
LRUoHcLYHWTwZu+Nvj8IyNQwGca1mkFuBfcXLsqfhofIJXNXeRDnqxg3W8lNq5LT4lq/IfIrkzfu
RHTq54OWHzOXGga7k8pPdMA90JPiSZzfy41Dspfs9LgJI4zrBNkz1x8jbHImQ79n2Q1e9jMuM9J9
Syqp5txKx+zZdZZI6YhwSalLyrTG5+4U2ggPeSFL5psqsTtu1gy8mvtnRIGW4yaapN4vUA3FJXdA
khwAdsVB6U24z4oSsZXCKn8xKf39FTSYQcKCV36vvXHlOeda5wPaIskEVk85PgkbkC61dagD+Wqz
D4uO8qFkI0U7AE4mCPFmmJWc1dGK/AhO+cshUwhqCBqJEpeFYpTG5SP5YdDZ3aVXDyCezcgnHjeS
pmxul8NaAGaKBrybDxdM19cL9ZepHWNyF2ksTftbfJ2sBBvTUNkDdraJqf62B1h2DC4m0QOS0/GD
4T366vjqNkcdX1/s2rx3v3YfIkeqkm88oKVqt4hIPMI5mdPC4SLdBJSfM1EMXBH/vsiO+ymGfXJi
1RfJP7hVXrWZPpUhIFWSRvYS97lUlJpQ1SW+znzc0VVau3yhN6BRXR/Xdr6C4Gi2Z9QRB4tmJRYd
3L4mT3Rc9ix1fr0v+Tvkwuzf0WITlLpZoTls5QL0T9qJqVEOCPUUXECON7CgL8oFpVhKMibJDGwY
6udTwMAJkkFEbQKOoWxDQOJj7e6hsyv3WYPqzxH9AGJGf4F01fNOdtp5P3QLaLY5mCcxirX2ZTTD
GD1d+E7NwrwOTWGVcriZs0lQxa1Ot/7fDcms70dFALcGwVvnFiyCdaMcdn8wkBkkDQrnk3r/JJrZ
agOoEOnwRs4vmdvn+UXuC26fJmN0SrqXsT5Me7tJa0yUroYMWJ6eACih5DHitw0x69EKU5QSZueo
omUKRxtsHErlGqKs3gTHSVxHT0n1U+XipQzTx4k/mZA4Eq59idZZWrCBKvqtq4C1fmYpIk8noYJV
IhU2pmpRTqXxwqvmOPHYTvxFO6kEQGqATkp6bsbojdc4KX/hGGCxP1lDm4xxnFCuxMG2i+gCvCJ8
1Y/Ieczy337yNqZQ/2tC/vvUI0/c+3duYE5NrPlYvW+RbFu/tz2dDaJomTn/DMD0NlzymxYDQczV
M22h8iWEhOzCOhSJvw9C1KFcAiy7TChYQNoerMtJKy7p1u+KwA8dnxpCHTAWZmr5nCYnucbAeqyv
gOs0i8IeOsbQR1RJi/rLOmRzD8tBjQecilEy0TEPVTyp4RBbTK8wHv+EpXSG/MbcdZWPGtw6zARE
0vgS8ir3boh7x6u4NHIKMjQa/LV7KxzdU8VbzgweyxV30zpWwxzhMINqOMVaE8IJqhgBZUik3uEv
xaRy4UDtwEJRWYzqp70CDohC8yHYYJ5qP1MDUQDlAcx4gKnWY7ix3rhQfFggR/14DmZIKJZnLc+d
C58Oq/FyPMIzhwUdbv+WSfMZ2NJUoDN2WlqAvO6WU95MuSVhXO81ldxqfLEcjwCKKlH+TnOZNm88
a2ETudPTxl8WL2zYq226GqH7HbkbJw7toyznpDLQ6PUvoRc62z7+A/E1TCME5mtuVlxrfJWVy09n
Dg/E2bGF3CRJggS5lmkIbSXoEgVkuUjpedZOd06QhwkOF4Oqw/sLiv/Rn1hxyVHRFqGsIu6mcMUQ
qUo3At9qeXB/l4n0T1mjGYBea83mJYbvsw0YMuLOgpAwo2bITHxLeyufSjqZP7Np/G6or2X4MjCY
+ufT7kbIex4LkK5FjLDOK2KvpOipjXOnUM6YPa6dN1MsSxaN0kHCaJrXRUK89N5JoHY72zgR7Duf
zAbxqMCdV4EnlZD5iTgnZq5hhWsKqPH6Av+BglsKH/1ndfZ39ahRFNm1KhLAT1D4SypEjhHFY7a5
BlgRRHqteneWZgrXy0PnRTX96OS5WPf62moNNUfjlDi1BM0ykaV2k76kTGm3C9Im9lr4oZEb4FG0
b90ThPoEQqrYKbEfBHzGoogEI4Glsp3DUrSX0l2UyAka0CGmtmgWlWJLQvXx4tRMqhi8QtlLLJ/9
xtqP3gOSQFDI6pLhfEKl7tv/h31+Xgmey9j+JWp2E26NtkuoY8aCfAqgFYZ209TYMbIi6fai2T5q
jmtl5KQi2otMPjsXx69p+LFKTBqSnSsgUYdOfdS+DbDx96uutaiVPcONyMqWO/RMZV1rLC3Ubv01
kMHVq+OMg4+JgiCMXSU+Pxdfw61fvRrwtQadRB3MHcPDOSvMSTTVRmjGMAF422hofZvoFahRBhIM
iZIblpJa4jpOzH7AhrSeXelkR0roN4JxIx3b9cmXG8+pq3yfcnx8dZiqgrScqhnZpy5b/FZQSKzK
7A4kF7sTl6KWSJNZ0oOKhq8kQ0zKZ1wbmrdY2d43TJAIMI+0/aDzhZD5DBm9OKeWp7ZNwkIyhwAn
eVE95JN7OhXN+NoNzSRwNCzyP9yZBnsF5VOAuxlmchaDBW5G3KAQ7EYsUQZw1ND3W8TpRao2J201
YSmpLvkndFLY8d9K3xwlIcIrsL17Cgy0zdBuEdQjoduM+KI7v7f2Gdgbh8PeApZ7n5gfK+zzuk95
Jijr9HqvIaQd61GLuKOhiIkrGe2xc6/gvYtTh97dCORXjCzLfWAkOpFh3uM5wGPdyVQ/wp8SEwWm
3681tEu3Q2VuDxSS/MU+7RL8AYUlXhXJVwkhJcAfV26rVTzkVvZx/SSIM7Q5BK29p2a05TJaMv7a
/8ovPKJSa+oOpCS2sY4DJ+93MfXPfwsZpXokgh80qC2hFEpljuRKU0fhrKaI/h/mNerHxnmjj85S
bGbu2Cik7nAy8L1RZCgmrbvQ9JqaKx97McLj5j1CMKlMlzn22C5EG4L5uN3b9PpXrgglPT/1sfkn
a5HvYmvB07Y6YOAqnj1bC3gKl04SLcP4wUUFQ7kFjHv6X+EeaLjShMwoRTPNl6zQJ9J28h5H3qoA
wNs8eSC9LkTMbkBIpikpcnWvKyegSjYaBhguSiEp8gdoDNWYesGlsgQTNZPqOgDVeYROFoC8Kx/K
MeTrEmzvL7laqA==
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
