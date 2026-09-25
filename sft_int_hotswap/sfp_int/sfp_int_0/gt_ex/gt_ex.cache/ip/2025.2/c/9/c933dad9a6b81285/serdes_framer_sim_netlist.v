// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:57 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
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
BZaVQOmx6WHl5g==
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
