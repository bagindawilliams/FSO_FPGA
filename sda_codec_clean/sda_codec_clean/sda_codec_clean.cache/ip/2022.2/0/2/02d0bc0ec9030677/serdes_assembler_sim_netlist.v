// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:58 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ serdes_assembler_sim_netlist.v
// Design      : serdes_assembler
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_assembler,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [31:0]din;
  wire [63:0]dout;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "64" *) 
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
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54256)
`pragma protect data_block
P+5LCXZyqRc4HBnv/lrUH7Cx8RXWZrSeMbvXxLHPeZLQono0++D+WnfNpsBmtrXFi1nAFEFClDMq
sfh/1INzmMlLnTr9KM7BcDgylChheW+aXdVScV5IC67U96ckT8i5OUFmxqQQh1nTPy5IhQog7ipl
viWsYDKADQ1cbBw0oXkBJ3Mz6A8QNNBIHy7ksse3rdNLIUFdbekCQPkd8KTHfmhlEwzzSyaASeXk
8qEGMqo0ONX2+pJAJ+85PnP6RoxvbormoFAznIRzNbbpLXP8tsylVqn1IXM6bLk/LjKTl4GVQ1zK
qyF67dcTUvIi9WnTaNK2tyVXOyFrZCZ1I+2/qEXbSPE+rew0E0duUdBMIlPkhhcxSLrsH/eDB3iY
QUC4FYXmgsmiFyCbxkDEmFuoO1cTQ+BRYG6fvRR1AnATRdWFUKgUV7hHqn8xXkaoyZ82onep3yKT
ObvTQl0iAo55a9zTe2tnXI59SBkyhWIcu219qixWTLUBfvC3hC0SeGs/ApX6Cknyd4hLGfYKLTeX
4JViQAyQqfAlPzNQDXfTJ/F4dM2j3aTeDPEUy6MGFPE1QlefMoayVdO7w9OCFa0NxHX6/eyHJA5M
5F/R4guib3O1IS2D1O7ToSoINWwtAOhEt/MsWSO6jskZ9bOCisKLokpkdrf5YHMlAb5LN1zCSO9o
1Byos0WilkOR33UgHVWZFQL6Cms63M0JtaC/E1idEBd46TT9yJZM080LJDFafnJkxFJUa+gN+Qvy
CmCQacKcvqIRL596AnDblUKStxKxRnI+s4Gl56lOZru6vaugoD2hdjNkbO2Nct3DEmLtmEIUgTSc
ANIf1+V/6p10UASAbFeO30lpdKb/ZrwHb01BsSa9FkjCR8LThRczBkpkAJxw3rNHDl9g34iGJtCI
pfmMAMN4WCmFG6NW5ip+xjP+5QVxJnRi5Psr25OVeUVnd/PxKflUP5H3IgH9eqDyfvPOWw+SwqE4
ihKer9/ZA4j17iS2s5YbUrXF7Y7x0p+FDJiJoQEjGqlaHP3TAtDqVj4LGr0+tmlpaoYFOD1PE5zN
I20dNiM4qpdDdGvldkscrmRj0kzMAALt9SQr/UhMBFZBGxJ4s/s63UBAN+u/BuYZt5VgByIHkKJs
PBDPz11CMl/QKpFL2iebg+bSrkB5YC45wAvKdpb9Wp8ytcv4m90fovpQP7SxUdOII9MmwOnujqg9
ek0k8YlSbl95EHxEhN2V4ufHejsSMDd79IRPZrpnA/NQdMrdJHAYOUKrrNnp6fbnK4VgLjNF0YLy
CkZz6/LQfNZafYkMXdZTxTgbDjsXQxQV7R59TuwXwOLIfgARnn8IJ4M4JK5ALm8S7sdyDtcJIXOH
Rx8GRkYnc9uCxabe1UL3fbjNIRzo+PSGwIWN9ve2cMuoKe1jP2PyrqUiPR2uK4edrKX3dqQct063
MtXIin/OhsnUptp3nVu9h3dRNlaLE/k5zWAnZkjzHUAEcLgh1feepth+pxyk52ysuiGTid1b25jh
Ntvl7KvJZFzFrhs3oWNGn2nt9eCH8J5ABjzR+2TWzFerWJPY1qFciAaa44V/VqJhVe5sSBWuSII6
uKoJEwcBeYuVJjn1GjnAKW+pdsg0aHebKX8yFVsptc+r/vAYaRZASDUfgm36PDCqFDUc9+hrJnee
2KGdvmgVeJQJCU73UJ7BJSSOasfrgPkiL9YGSjhUVg7FYZb0upJkzRwyKie7Wro6Gbj58fDnesvZ
wVCxMwJXhQ3jwtRMBVThNFnRKtP5fv42g38quNS0zNm+iAC1MEJLxYPSwaKEuABL2NBB/zrpMDVW
8Rhe9mdP3PF49EjVqEJstMHt4mBn8m8tLIb+KEg+SsLOwA5vFIf7UJHRQ0stFs0rzTeVjOzljVmT
sGG2sDpqbxziRg5AQ1lFvAoZrvtZ0awQqtkQW19NwhhJSD9Je7z5ttU2lXzJNmKSG6yYTQM0JgHJ
2F6hLY2Z+JSsnr+TRZQt9Dr5F4eXvHqcN+EE+uXGPoDHAGtnvYkC1VWls14yc9ySHdpvhOmg5SY2
inErcSM7vonfJ1YGD3pn1RQ8hSfNMpdPZQqIUEbmtmyl+AMUD/kbLe4KA75mZAC29a78zwpRTQt7
u87ZSjQfMmgGi2z8G2wmFVfVX61HziKYni9Dm/4bw2SvH2sr73eD53ewvCmMIu0W4E3f2Lf31ElX
89miZuGlgko5P6juA84i/O5SW+JDkb2GsR9jkHQ6ycC3DELpfiZSWjzEFl5Q7/Etdvfaop6y8cTP
zCok+GzhlDqggS0k09oza4ZI+vl1Na+1WNJ8NvnsU3LfEqWrVafVxyw00TK+/5hZW2PJwPcQl2S5
L1vNk+opkYvY/bwGxXVogAKO7BMB6VsU6PnVZwCsnUPkbY4L+Z6Pzd7hSGeNCYPKL1mGZQALKWCS
1A2FpX/bAFPCchkeJ15LSg83YvN/lIRUfK8dKbsoMASNdVmt1Xegh6T24rf/RPhyy1WjGKlcCdOi
YFh6demQf0gK2DisTrsNBgMjap5cF2sL9C7N+HfKaYkMU4zi7k+XAQDA6ysFd1iUdOOag4qlvmFY
B7F/rKAxgY4Jzq9qLsEneUgdfwSO+7kFhBZLny4et+DUCf6bFi/PQMhOEQyQgQnJpHnQN4UZB2E0
KcrqSwvQxV5kJM8lfoxkRyxamg2+0eVwcldhgqOFHio6iQImv+kfIC3Sz83V923/S85CfJ8nf3J7
/0Un2xRk8uP5Lk6ZuFtsWqS0VQUljAgLRFn9MLqwFhEnJ+KcSWHDLUHsSKGFSxJp5MXyaqYvykFO
Qg5AbnYfiu0bZzzKqb84Q9yaOTIEsjUC/OFkY3Ak9G/JimUR6kJCnysIVdmlm2Lv0Lhai9k6SflS
O/jdDgJQKHOyoGtcraxRLVO77LjpPuQ9imYOw3AnCnGihoaqdSdXp23Q95p45sKrUqCaqlHXODqm
8LiA0Z12xY8dKXYOimKUkEQs6mLNh2r1imAN8BnEwHukx+nm5/MBjTg+mw2GlKUL3pRtXK/2szQV
niCevXv4Bi9zFk2yjo/NOjiWtqXLmrGqvwkDHZMiIXF4C0iu6cpXjZwfAS+d6/cjOHR1rNDjuH70
ZEOtILH0VLsV+ZtPnpDYV//G+kOMLJ5YJIUaun1pluMrceFgOgd8g0lnxjwwZvCmEcRUJI8hZcHT
D8sRo1lxuYYv7qwCfy1DWL9hNdk63axTHvMOR2BaNGHcOqfysVsLym6TGGPtblg6+MzjI/rZjICS
B6D/KFF6b4vjNIiI64tUlTfUGWgxBAiFcZIwl8YEsxWy7Ih5vyxDOboV3LtH4QgTbb63eSn7hvIi
Uw9hf7OCmxB3ManoQStJi3mCN7LJ4hgAm5nWX46ekRm9Hhc+h+HYakySFrvJEq3ziMkKeUT3+GZP
8pBRTNM3rGxNQRWrDFwb5edTTStX6xjEF4/QiVCS7Z7+z7GCJMoqeGc+T8PovZochdORq5ITkBHW
TCw5JIwJOZcsso8VNVHbpHGtmpsRCC714Zv4WFzCAKSsKUUn840dgXYJHckCzr7A049hwu/ercP4
uYeBq7BMMrzxb5cF/bYgf1ZEERbhUvBvBvbDe6mNy20UnNnPzwwVlVr9cIeIb5+KWPhXrQvCvmSd
cB334Yiz3bbdzSFK/clLstzXXiZk1NVO2Ji2a+PsoaCpLCJm0qsFqiTn5C+ZMrdP7/0A7lv5+JuM
568HsicCfn0VYOBR1P22YJay6PVewE/jiVbCwXnXj85NCSz2vw9yi6IsnOSOx+zLMJH+2oyi3Xvz
UWFE3yUArAyvdJZnpieOAHhG5KzSISU8sRntZqLfXWaqgPQ5HnXW90ZSxkuUWMJMQtR7/2k2S9pG
P5XpVxrDzBG+nc/DmHvH5SHdK/3IRlXeGZdpI4B2qhwqH/tIc93q6G1/QnwYGZUDgDYsr1db0v0+
92ZRorgRsu6uz8n7m5KvOB/jRet8NHZ6GL4SuQ5gBD2deSK/A5NHM0l9H7tPtDj8dHbhziKxxwzY
bEBMT+OV7PcXhQ+Tb4ATYOI+AvTucYSCYs7VRw+L6MMZws4BDwfPDAFVyYudfISBv0i5UWXqrgUo
kolH8ObTj2qLkOmSlUybr51KLOSIo5a8mkjVn8GH41r7FbmnR++rIXoyM069Knpg0t2+WraAENIn
6asQk90sRIwOhKlA1rNazinut4dFGHg1UXLzqfpVjiyKmCob4+Ip3faETvwRYYYMb7OWMLHSH64P
qG2SZkVbJQYCSljmS2gJH91siJjBjm3/n5oerbvsoGUsOb+93IrmG1ZhKkzytO+Aks0ScBp6mGqz
fcPFD0gQow37Ts7bpyXecLcrZ8jDc/wFO6Oz3aYp8Dq+2o/k0xe+pYtvyBaB0biOAP8iGQRABTyK
Nd6bKHCZBZcCktO1iKYOeccpNLYiIuY4wF/lkpYHXmmMuOW0BUGlNaYmcoG5cC90RAuc6oP0J0IK
/NeXZsAnyjonWApnEusb2GoJWWf9pmhJcvUoFi00RQYsG/3TDiNE9E+++rTVDiFbR1yES9YS9P/w
oCdmTAFuM1YMu4AZur35cLPcW/YB5/dYhwSwRp1ix5SGNMU759QHIIpZ1o+S9rk+k2UfsNBM8rwQ
9BhCjNjS7MvBHjOu+L7/o2GJoml5osFynKDquPtjTRaPac0hELPXEgAsdsVMJ0BSNwm4HfRgcxtD
/sskxGRXcCTojPHcvlVB+KDPLdS1kR9lO2IfGdyF3YJrAGFW3DHdNgnhdYY2SATKEes0cKDT0ZGh
eUqrBvRvs/5rOkDdGuEWy6whBxZNiT00/cNgHbUm3k5GRX+3CbjP5qzqnz+vyzeuath709EI2vB5
5hn1EoA7V6sg2V79Mnj9iKMhbp7Si9lHTsEKJkAcpmiY6S7n31xoeuQDqME3ONps0nizHfGD60Po
aHcbRjOUcUNnhm0U3MhblwJzm1B/gcwpBtRkHlvJFE0eeFeCQcBgSMeouusY0cn3UH+6wzyxVaf1
82FVJuyiEv+ft1Nyg7RBHK0RHjS16y4JH/rR5DqELPRpnHCJkddOuyi4n5UH1RaXwAbERzlYpoz8
S6ModLQ8iNhg54P5dIB0foAZw3ha+W7BK50vyw1j54D/uzDxgB8SxrafpcTJHznoCcyPUvHVTbsN
mMHAy1gd7ae2otHEf3hqIHPabgLdpdzL11HiFOmLyR5HZpjEZ2J4z80lngdJvIfUpXc6R+rVgnsI
5BUdKwqPB4h22nILSSqcpyxxlxc+vQ5OZ9BMNovG5f68ndZ5LsQvlBofCVPoUtrw/r2Tonyxqm4T
m7LO5r8mwy+vnsmL8YJSdV9iH196n6xdpbtqrszpHaEiN/mgN89IjA4frHIfi2PjwjTFSzqEp4Jm
ILn0e4oNzgsneXZOqD2op37DJ+uTkubBTlG0LAYV+lXOv3JNZx14Cd6lrtmfIJMFpRi5EzcPCXgc
lYXa/sgKIZ0iaVy286E8dqch+snUf05gk4dQzScJYqQdqqxPIgqV/DGGxWSai8Y+1kTtw333kHRv
G7V0Mm3WHvXn0pSi00J9CE+27bTsIThmJHK5kST31m4mr8y2crLuSr6DZiR+mbI54dTWpQd1c+Vf
6E6kB3Xi0aKLPMxTIhetW48q+1Ebv11MsHlcQgkFRXk0SGr4WASpI42wbhB96Hnu778GOL3qR6ld
AmuupgR8ZwG0Ih+fjkNmMlP2xfSt18RuZmrZIEXRwdMgnEnYg/WP5jERApYfcwVGk31G26b7fPsV
yWzhWMAfb1Y4Exu63NCkkcV7JajE/pU++tpH2c0cV0GIHZNTPN1wFeAF9vC+kH3pYXmbaKQ3wo+g
deR9aQj+sXXMB4tZnYzAThx1jeUHRu76CnOENTiNmEv7PEE/8R1NvzFcckK0Rc/2MXBOOxco/m6t
pXQp5ayCHuRCDp+xYBd5y/xtAzppu9wMLLcbVNgYalwRybAVxvXAO01PtOx44qveBMkm4F+i9qA6
sfc8JPtNlao47uBglRShItnc2jVdMU/4roRJYLHwI9Q2+Do2itCxy28FIXN020nwxID6w2A/DAnm
g04+nfPbAkvQdfdRN8hPIzxqBcyM/DVeS3Y09kX1u6JuZi1KZvHHmzAV8V3oPqU5UwLU6MvenR5t
O9dioJrsnLfBju6te1R2gSdR2dZPUqEM4+KgYMKLyyIS/AbSusdaZGImUkh2AEhZQLYy4nFfCPur
diqoKzkAR1KB8yS6uCGGkOmW1nZEunb7tiOuy+S1jUUW6lmgGAmg7EydOGWmL/eQSBSmp7M6hOA/
JaPPzo5y+6HhmDWFllQhotfY/GiO25A3J0J3Pl7Wr488h04SHZIEBI8nOmO0BypcfJMWVOJbRQnV
6iRlR8J2f+orcLhPaOdW29Os9CvpJclZhc5Tjap9kzsWbdjhr2b7OtLnc3cf7XRNTXYf28yA5S5b
S9C+HGFK4iYDk/zNa44vuI2GpV2atcPRAQadslV8mdcwgpRt5w1+pN0RRyNL+cMt/vKHkI6z0+jj
2U9R6Ihn6D9Gc7V8p0qUPZ7RS0nPvQzkVleuDNZfHGdK7oki15R+r3gascVY1emNYfZVlV9Vj42c
9mvuHHiPlprr4GaQ5XVDJjhdcA9GymqiIYT/gHZuBfed+xJ0fJWVuLRHf2HcyaAF3SlENu7a7AKJ
BahgtF2in2vgDK9az89dBTU5o9yXczbsfFnHFLd2q9hXXju1g4WIgEXdXTndFvOmXGa5+8jOYZtE
oZZUWo3tHjk+x1wjgexinacrSUgA73ARNUAA3eioRHcynwHAk2Kw951VSxenbwoSNDWg2JFxWtzK
NqAPxlC+aBDTHVZ+yJg8Rlafkkw2IHD4ND7UYI/+T6Q6PIIj+GJ+LOWcwa4WTPlg1mAiWsM01Kk5
Zbg918RoGVqmLojxf7ftzJYkYkQV9sI0sNEMPmE/FjF24aAL+SP/yU/e3xMqyuY0IZyMmigd4vZb
QdSsOhIruGJUaYC6dHjCAIYJ1vlxmn5bTtuPE1qgQ9zsbbh8KGlZW7XMpob6XfU1X7U5t4Q1oRGv
xroUB3+9WymX80d5JlcAQYVIXk7HBltEJytpHq8eE/629GfvUtr9ocWRdb60+YOfaFBDBWbT6skT
0L57gu60IAScxnR9VVJ8FNwoU8ShfW8IdReutsiqNrJ2HZfbKLZ+xbYN/LpxL6GqLMm/o3CqrNtM
ATV7o8oYVH6pTj7mTnhwrSNh+PIJ44dA0Bf2dK8yVnGTn0S+imIJzj+NMgPNDWnoc8IREVdkstLy
HPNMLTCkOCnoAdlZABOddukC5pH3YkyNbwJhm1je7WhmIwBKfcIxfoDxsgEW7/3ClEHLuQFgo5z3
CBTMpBlIV6Np5Oovi4P94Ar2FnaX3KYne3fWbYmvpVOTdsQW+lbPvG1iB/yq2NJKqvXeqGIo0M97
lGMTb8d25+SyXzKgebfXCjTtJYISynI3L2NlTClheDRTv1FjC25QxVZ/l1/Rs8IpcBEO0EDJ+1Dx
7ceUSLf60OvpHKulTZWAGZL9z1AK80zrWxELV0ueoHkzncUNSNOK7AG9arwpdnLonXqNEz+/D7CW
WYEvAlxPA+V2uTleFmwKD26Rz0RSnbwC9ObJ5Q+mrfu5itTjH1MG8Nws2AqwSoRqTbvlbe7GxvOi
YhAOxfbtVR0IArWqsGSeXq3BttYG5Eaep9OldAemhIzZdASoteSeY8o2nsfa6N03bts0Iz8SEJr6
bYKdM66rHfB5a9g+hcsCx04XM7p6LobUCZD7iDU8WW63va7grSlK/sG0RYswUBvJYJNmnTDly9j+
NhF6rwlJSn7knctPIie6H1aURPfNOq0W5UCMVGcWraKeXPLsQJB3PF+7DTg0uC39Wgj34tXJEoXL
TlasnVUrkEVrn5q3T7WEmDTVBTXDra8SkTf7nVr0X/beUWYh/0YiRh5BW0s4Vz0R4OsOYHIclpW4
9Z4ovnM5seWrUxFUbuVKL4zgndNwopgz7YVyY54PphoIz6HS6N6hyfEMQH4a8QlAl7P4NRyJe2cp
jyInFevQLX6qclJkFVPNkXFvlwVpSovnmjOzdo+cCg+XFsHlCnoj7uEs9AVpyZSpT2YWKuEa9Vk8
RLoGqw8dqRtVM5SN02gKCzMj9HmuSyEJf3n0Jc2E/UgypaDmSO+sMsD6SCzGfkdy7RwMyTHcMOL+
Mkvn8qQRqyJxYWH5kHOoUBF8A3uDR9ZChSxHcO1DqR/M5npdIP6mqJELcJtH+a1An0/h1+WJ4cz0
8h+vtBXWVbTE1iPKYVt2P/7pL4NIJY06c0+JeNTl+wSTjixUDSIGYUcx/eDJCjrKY4XTjQYSXBo3
l8P/r5GbQBgOgzrhEG0MGKTUtg+VmsEqgTLZKXoB2G+yf7GIed9f51ksstyNn6abj3FGGvY0dO+I
a0pae7Pwhhm5WFprGPTe1RzIWbINBTm2UCXG3Zih3YTm1tXbyE/h8+btXJBi5vDa7GRr0J4P/qb5
ezgh4pA01LiF7CInh+oC9OpNPvi8nzJrYQmE9dUHBLeSwyXIxqdjAp4YFY/ST+g7rBWQu30bveZ8
sBzFANVWy82i+nLRSURBhumPOEeQV+lc8rNDyMs80BPnxQv6u3DAaJCIUBmFort7RSGIIlenx5oM
/Io5v4XHWp4oRJ3iEyClpl9pfHBuJgZwHl4TDnsXleuHFHW0r2cEscOkEQhr/m/3uvXsoAewlymu
L2jogW4cAs2OEzmxYdr62tyIbJMnHhyQDPjRhLRA5m8+P9JaZKqbLO+PtUMNF9hl6oYzaLGTzvXI
NYfwJnLcgN5RaejJKIyH2W+BqutwjH21JEfG3TqK+Ggs12mTow8eZFB+4rKbtiHdTzFGKMvYKf8k
Hk4NzxNVMVpLJbSCV1EDUzYKEy9BxXHUtH9+DtrGYmbaXrtjUQRFGvyMj6RknWmcSHqCdmDcYgAp
mcncq3n9umCeL5M5pauXTsimBvNd4krH8TDsSpskjmNqLPsU57xVjdFoKSTgWtFq25RRWPgXQVd5
CV/qABIYfFSNFL2XWvSITRcTR/a9HOYzAnBU/Anu9omANkcEp2np/70mx77ggy5eJCUoF1NkUMf/
2Yha4V+9YwR/kVp8lxz2C7Lzn+lucWANnKv3B4mxBbmXWoulihjL6zjd3e4nD2IKIS1B+qngJcDK
EoSf5A8G+H5mOU5nJsRA8yF7/Ie8qc5VpuyQEzkSfHJBgW4tbC8mGSi4Ly5cqcXehZisnsfr7Ps3
TLb/HAG4CQLT/6tOb7eqsnv+TqMf+OYLyy6Y4sUBxt6jx6oPzAJuo/c89h9TlnAk1/czCrF0dp/J
QxWluBfHv+WEBORlBMRPJpGD8LEVKeQjjVqV4+D4o4G7XiiQC0G/cCcPB7Te7pdLdmNmEhx5g+x4
XGRjd2mupDH75Oi1JXvATSqEtj9V+qKxNY6wRICCGeJ1Mcn/0Tu5i6a2QJIHZayNNgPUKYsS+SWL
7d2vqkhZGU90JYqMi+gu7qaYFoWo3U+7lVeflP0b2aHlHkmcTNSlpHEeoTrrJvL9ES0beP7jNGDS
J0NyYqVPsdSy/73SnnhdUbWyXPKRki7755hniN4nVwfpqZIjxumomOoAQFu8ogHg0iL1N+6icmMx
LCQaQ7xHBeQ44bwsmb5i2HDwjvac5Jm/oEPETun/vp/IxjBh/Va3dEvKqMIjHZMXkPZV+Wu8AVJV
iFiHnGuK6GlFYrn6VTdw19+tSul3+StwnNS8tU3FxOZBWZHCCJ3+UeRz1ZMopY/6C3CU42BKZgxq
owN/LJS7lD4N+gsXixCoihkQgkM1MdJl3hnEtSLYLEevTzuMAPU5uHOfCOd+WKUreU/Cy3UxJt7c
HExd7XDvPhP/2XWFC5gOI9q9QoJ97H8Z/macCfqVz2TH19ukflbUrbUiEv4Oo0mjD22NdTT7ywB0
ReluwKxz5lK3JDmNzJ0yGSjoxAN1zlMXQbpFsKhJcN/CObCzq9XlIoBgt3Z7XSJInQKmbjTEkX6p
qNFwjLIL5RsmODGx6yLgsF4EbQS4PT/oasTrbh7GjlEFnMvz/kE1VAswvU9hZtrEUVO095YJrRER
q1Ycv1+7QPcPEMbdGIwBqbRVgSNu8i75eOD84JM4N4EW434XSokcU9PNeeLsc0Jbswkbr79Uf5SP
+saqn4Dj/rQm0AxnZg1FmuShxx+LRFYbAqsiJgPD8mDConbIf1sSnC2PiSZ6b5D/5s5Sen5tsJAm
aCnpmqHIKo6RvyeleT/aLjDwQI7ahF2+oSwJLkcGUzmsTZQ0AFkuEo+mSergbp0zpKNQ6f3rgVa4
YezA8vpWvDBzz39IhCs8XYCZa1c8ERWrSTBvIJzSQzevXCinBzzjFgsHxCLtANFEoG9ZTNdhk0nJ
qd2KLGNC0DPjwLL5kE426Ps3o34IW37pdAhct4RjHNk9N8rqSJ/pyv/oigFN3P/KBgcwdlKRaSYe
mwhTNAZKXZe/EBI2bABE8Im+daMsP8lFTZDU6L0TeRA47RTT0GUEEek/KYIKOP0EOwqJLUJHfqdj
pD4Q0bf8dTAONdWwfhIgtO+dGKzZJfp6fYNdPCeVl8RvU5IEicZNzn3YpRP9vmHzevnCx1dm4ylx
6/dNOVasKgHjuodNS5C6Z+2a29TkGZgT15OdvKE97npwCmBemUQD9c6YcHCd/424ivmkgNPJZzmU
sTJERX6YMpe5iP0rIIxDYnm16/Jbp2R6mxXOGcO5sDdIQf51n/gtiALBeKDdMDDSttezDdMyuqs1
HESCeIaL/OEiCVU8nQMHqq7Bz7aZCX87GZTlsqP7GjkZsPelryd+rAiFJWtmxPW451dvMKQFZz7M
bN9cab/tuP5pmepSf8Wqaa8bHj/RLslKfek99mTUoKYTldyQzHv6GqivihUMYM1p0jXMuD8pH0RI
eKxAeTkCIDHs6lCL1LHH9smOwKFGAolAE28RYHVa8VJDDfOEjuVxviXd7+rwWSUiDLYEZGnrw0Ha
rFrFJzZEeiXXFvwnrwnQ7stkci84kZC+L+EYWAQe2DjrG6dTQD0ImG10AXpbGkPI4aHCmav9i4ua
x6WsdK7C9hDgxn+Q5Qg4gpk9ZjVMIf8OZUAblYgX22aXEChWXbmel4ol2M8zvA9c2avJtNx4bZLe
FPWF0iOBk5wf38X6QaFH5bspeAaJssUoVzr/8Cdo2qUA50MsdA0mFWF9SO55g9gnsgjh9yh/lLxI
f7diPAYwQwPhhQykPwxmXlgv6nxOd/dFGmrWMHCyTHffV29rCw+vPHZ2EZX8N69guvlMM+8zhWDO
RaQuKux9lACthmrHHRFwMX5YS8E9pmNLjkyP2YVrSyNAi0Dynau267/CV+/nVU+W4E+MxRDQaYDL
rrCa5LX9muh9bfOXG2+Vt9LUulyvFlS+EdQfbVn2MIQ4dLp1/lSLRcPtRQWyPBrHh/ZaBcPjQZ3E
8OCdnyWO1Jp5nF1evXLlFPcyoWCzm1CVpuiIXp/CcJRZwP7hNP+TLsMKnZcy2TEsBGr7QByCv0sg
hPMsjdfFBjbnGPSlP+BgYGNwzcn3tdj5EWvy7crUXQ5tC6Hd3FNOIBivYlg+jTPqpFKe60l7ocFa
9hS+eOxBffBSbw3Oxc9+uR/qUfbMYwoX14imbNbzlaagMiyDJ17Biz+XHmQ3FzQcQrHGad4wVB4q
d0lhcbfpIGJ7eUWfRNYhBI3dUd3JapgJSdToF1oR5a9jlugi9ns1dJkJxTHclRYIzCThYKwEWunv
ynvAYYaVsXteXdKTX8+LXReFhB0SBICkQiNMMbAVBuxsZD3+JmM2ibCNxu35Cr6TXX6kL9Xc/ZbB
12m47hPV78EED4CRnEsjNEWSXO1/J8Uhj+Hh65H+6lhYuR3IKtvfe69u4THb76Qad7q2OKoDZXTy
bqS/5TjF83vHLeRaBASFHql4g/e2ySQxq0k4MgkLEePqQ4PLbC5p8XKhUpkYpDqwZydv8lhPkizH
1uHlAEPRv7rhr9uUDOCgxyBhUCYh3cqLs30RKSHelSwLvQ5UqYVv9VwhGD+8IadpNaNz9BaTX9v9
sr67IZS2gfX5l6pkKKjF3WPBFwKl5aUkiYifWGepyx8vnYbOtGGEuoO56SWxZKnt/6y26s2ElJz8
nkmQO2zuOKFPEK7lqHYuq5Ky2jtvfriywho/Lax3GaB1DnOz1kkfSau2ZKkr++t82jrapxj/mver
qg4HPqBYhqzHETkEUpyfGd7QaKTxt1W4Lr4OMXHC/qZYZySk5DGdDD0f6J1Db8K9OS/TpYAE1Qol
SaWFEq7JRtMjOz2XYBGzGyKyYVkWkqBQqCFfPnUb4Pnnk55WRGP5XnfWKYtfWZWdUs6AXr8ryH7J
v5jNiaIbm4MObwWA73wEsyU43nwsSLrmDNfsCzEtDC0j6mSUETt//cGCr5WEkrRZR/bBxi7wBeXx
m8AKpM5Phvm9wWLQNaOqMITh1XVCMfDmX4YRs4teYHYuWP4rvuoccEnABqIhN52XUg87NeVbfCbi
ZvyrWa13gPyOibJxsRgQzynM0hXgesr8Vj//lQv6zL8aUNokjc4scjHv3oGyPFQ8pp5dehK6+NVP
3Ry47XVyE47b2uf5Q741mT83ycPpw8+qFQ/HNM1IAhq/655cACdk72r5T1ESD94vaIJU/4Xb6L5/
4ZnEjBHBtKQWCMD5wNVzpx4d03PvyCnsO5zeAgZEHO8Hvm8ySAln0ClccFjJHcncqTOk11k3sDbC
uBshTR7xYEArPNKinxr8/2RkH9VCznAKQRiaweYSpPAv2TTiZ/JMd2GL3iZstKD9/9hc0jR7Ba8S
buDmLvNbuBAjNGJbhuXxMAiq/2xf8yE86PUVfFvrvQ3hEVBY49hlz23u0Iaq2ys+Wob1WogbheyX
7SvRJcEoCR59I2VVpG/jTr59p0oGEtNSWNC4Op4DpUUUY/TneUMVXfIogt/Io2E6xuYrqf6+zeml
R4SVAbZw3Psw7wX2rRdbMgHoyZK+ZOHomhTAeNYew8n1U5fpTfc4F1Tjq8EWMn8GoEIYjxPQJXD3
esKIl+gxsiatFzK7RLHjQ0C6YQBVLS7eSPsCYJOm5rcp/0xc/2NlGXFlPVEGNd9fuiOZjftt7zrI
YqXF7tjH5NC8pK4Q/UzW4jNs/c/Od3P8XrqOBiprC9VFrcRHFsmMovMnr7/i7EI9hr0XJVr5j+AC
30HVUOwaT796tREf8zCzxMlJeO1JfL2ZU7u8XNNMBquSFxjEpGrWkEkvbjoSsxHsus+PlN2dg8Hg
W+3xOiXjynfNfLjrMKv74xLY8UCMkA2WqXMuhQIyl/59gRR1FH/cFXJdBxu0FmH8Q5KU4KY92XCd
Ey+Q4PjrAISJEPVkm2/t5qE8tXvjjPR3Da7c3u4en3eTPO33aHI7CG3XZ8+rROyZ3wbcmUPYUyQT
GeieHOFe7S030S7Jr/wmrRQkxZJ3aZY2PouYH3FNyq6I+Xyqv/tCwtUwZ++YXFK8lxycFTiENLWH
5kujJwaCY1mSzcH2gKoaXZke0sAc7q4q9QB2fmcWhB1ElCyfzbTL6DZCT3Gex2a4EDU3wMtpd/ue
W74kRw3JNWzXBn47C8o5qG7LAfvH6NGXMDQNhB9rlBQiITh4VM5U2lR9wvLkjXPfFigCdDfOoH1E
qN3ox06EDyadjoxCXUZSPxL/9hrEJGbfIcOwTCZJqh+3I+EFIocgYJO/F2roIUVhjQBRlig4+k5U
r8lBdw75meO9A1hXA8nJP82zkJUz4kbARhvQSVkpzQMIHqE/bPgkWJ8gcDqzr35Dc6o4X06JjxVf
40WeSqs1P2jynXUlEOMTMsroxgAyokL9t0RVZYNY+Fstr1Q/bsF5ICHPrZdN3gkJEGKwYX0CKr8x
mLJhQ55eyx2iNYo6FtEQByWmLA3v6bp0igTl0wqvG0Lj/FOTGDsNt3LPZuwOaL10tfVhR06bGvKl
cF1eMKJCxs8kUmBCrrpFK0Putq7c1pBXHqSHrwwPnvVOqnxL83hlC2y8xFX4aNqq8mqAeRzWOb63
/XpRNEWkjJlAEdOZma4XArl/3wjn3+oQFPYuyB1TDchfNfXGWutXmrg7445BqKDqFEctxmDhThoQ
+MLXB86zewlsjz3di5lcSqXMjbtOtW2JIksfckd6EeNMSFm6fsJw5DmTZWmBBYdfGnacWamW2DpZ
Witnc1M7jcsRMxNWR9n2zgRGTeRfy84Gxq9GMIhJ4Vn6w/k45kYLwdb+yfvz9uJMii9WijhP9DY9
Ejby8AaJvQz8uSgRczp7FxLc2UhrnXfyrQM1jTBm47sTyXVk4YLf5Eb6oqV9i/c2FJLlGli28z9v
qg3JrJFXt3dP+ISnvbJO3g/FC7kWg7UkyA2N4eAcm+yFwl4h92qR3xfORvYWYiqvqq/MR7GuSYyz
cbV1uInlfxCtaSfcgetI7iGQitYVpkVcJTUpcO2c2dAIQTaqDU8gS/9WPumiuEuTLOM5xNt83q0R
ut9vIEJC1aENsH1+noUhxVDIfJbMGs+mDk5GRoDz5+aRMNc7aevCM+7MDErN8nGSkGwzaK5mhSFB
Ej5fjgrDmm2aow+BVsPQRO1kzSc+LRITBIivSvyYLLsDQd7YQYCunpEmCGV4Ib1shNJbQ7Ch9YKH
+VLcOYm6yaAtzlIvexQzpQP97gm5OoQmQA3rphgfHhggecBwaBgG+R8Ln75jfBbRvQ7GvccK+xxm
FIr3tICU64xb+38h0V5uB8610gljZv/LsTw9hDT6Y2D0xFDnS5uR8jYAFGs16oG1/TSOyMVP8QBU
ekATbzWYaRFOo4ZQvPQqo+mpXTU9vuDuVhRsCiv0rfcLnO8HcwZDUy4hJwtGfQu5B+/7kIRlB1vp
bhEMSSXbvKKvq3fU+G7Rn1/vLnUrLvsVVsC1SHKc1x934lfDCbrEanUHs+i6LyaZDogCNRbCg4ok
CF2HLEi75hWuEpvC1GgXG/ib6abLP8rGMlb3NGMwDI7PYYSuMDUNNNtby0yFS60uiCY5dGau254Y
pqxFQqcTRpkaOlh/uIcQZF2gC7Zk8OOOj4xk8IKbdU2rj+NbEAl22UJdTTbRW/zdyTxPS7WeTOWK
g4InDscfNvVmsxBMC7WxraCDEZhZ61ia0eyhwT68MBF0KzlHk+wynfB4X6ja/QCYLdvGsmcrNQV/
cfIpvFd8430LE7p7yivh2wp9Z1QLwB5dxc+z1Uii+doNYo/cJstR+s3vwJrFiROiUdAdIOGPsUhO
IQDaPWP7D7sf0k3mdZSqdUX/7RZsY+1gFJr9d77I/wbJhASpMmg03EzGtegaTeW22QsaJVL+zlw7
DMVJBsySYKk582rSBDxSUEYFlePUuzc9ASEmN/vQ2URIo2fShanCKesorduG8wBH8WBKpjeJ2eIl
kNMisPuLOWMyCxcTS3S6oV99mbBSpOYwp+idpP2KQ0h+TOnkgydPMElpWjl57Jlfizgpv88znaOc
7rLq5qTK5kFLJ8LL4udyTxUQjnmBMJE1LwD8HwNI73qVLQ4lIL0G+2lNmKRNQYmXUeVQJc/tiqXa
XejjSDrnlvaBE4no0Ny8a/e69sDF/ZnlA2J3yYWwNjqEpEpQrA2KnOznzV8f9h66Oh9E17yNV40S
3WnBF2gXDqdGoZy3CuARksOwh1Xh4uYcADgSazDJySFRR4gQWcESDMOR2fsRDcjpbFL5/GVrUE03
/sXwp4oD4yyJQHxhXy7G0vNu7JOGX34u18bGWggpg2mkTO7i7uux69VCWk2UAWOP2dH5g9OHBXY3
tJhtjVN3ZL9vjYoLcyTalBjyrI7fo5EAW/50R/tE8czNEYHwWGpvGkoE5qb6xiX5UvFtQ6SXXofm
ZkjFJEp3GPHmfqv9eAexZicUYHNLPMufBfxn6PUnIyJj4PS+NCJ61xJ2ybvWjQ9ZM+lPLvdBqjwz
U5Fc313L8e5bgEFDaRTo5zL8ky/rc7PtxUczTaeG7p8MOCGYEhF3YOGs+bx1LuLaLmLyzH0Yd8b1
hKwpr21czMOQ8KyPcSRA+LsFK+cywrYfCxEHC/iLawb20lYWap/4oWNHz/mUkNSa5rSkI21NYfgu
k/sJJtfZgU8aPG7Y5Wc5BGzg2BDNm/0U552tToSkNAv1jjVo81pZq+SnBjhdDyw1/4+0BjExaNrT
q9bB2RMECOaR+7Sw41FkwhTtp9uJzvRvAn60lTQ3IBDHhBWVpDuh5U58qiOToA9Vg/wU0EqDg/GG
znISlHQhydIpcLhaO07mCD1LioGCjBdqOw2sAp4Nz9luAbC1hHk2HKX1LU24MlixAa8Nm0e/MJrp
jxgX6Fi6ZSuZky0drMqGuvw8QVxK2+vABLR5Bb6fgJNoq9Cz0gn007TYHDGIJv+rBevnd/A3zxw0
H+ZuBSrw6whwM5mbESq5HECrNj+hb61rITIz5AAUniWquV52hnrqh/MvEnaniGPjzal6dEg2FAsw
el1spcl+1x0j+HTuGgJtwS6XopI9sPZnKxf1OHE5mhEJJTS0m6Ef72TsvslQsf69MYnoOOeJy+p2
EWGxgosUd2zeXZIxkgT/pk9CO0/m7wXaW/+Og+rFaxbke8LIk3AGRYhTpavg1PQ5/OC3DD7c9wSy
e+6FXeHp9s+PXRCuu1T8WwrKXrXE3Np7LJqkE4wqcSyMhwJeE+6J8tCn5hgmhRee25NtF4xcK6kt
gwnpsBLoIItzLCa9CbJO7ZVJ7203oK/1dnF+erQKQFJ4eLdP8NPe9kdpCbOo4HJqOwtx/fPf6Ba9
wjRClMD0toSi/dvrA+uesg5W0hPt4+VPWPWOyWPT5a+BjrfVb7gbriI8erDRX9Rk3zmY9LmPDLtR
fYMIldEZqI435G/aTQiEmnWtkQdugCzdCcfMC1O8yO7S0IX24DbZd72pbrH4mH1dljhO+FAlaBsc
9R6rm6xg5D9Nk/4pJ7iXB04kH/cIzhLpVmK4pXigLX7/+ofgcvInpj+OdAxq2HWaTR42HCMqjKec
usSx2gWm70lxz2paxL7RMbx4JShJCDErCkc/oW6CSQy45DMnuJaj/CIK+8al13m2lLP/Rukh68kI
IbfS5ZcW6vjT1YcYQ3mycTnwmxaFgcNeFMDuo4+1H0yxF2ZTIL9GwIa9sPBHKQft8OYSuAMdqeA9
2qq0hIwsLIEe5yHLlDPHKvtk6vEDDUHWj8HyYPMexHCyawlCo9djqy4YFcMkYrHQ5QJRjjMuaNCC
o7DHlguOEijQtkoRINnE4Cs5DqpNcE90Q4NlH+kf3x1YXZl6R0V/okm64TLKRkkY7HbD/Vxqx8GU
02jKVRFZonisTUSGmv2cwChXDT3xU8gk5ymKSrRyWhhYwyNlP4iwBXrUpBwwgT1pwy/UKJn0zB49
Ms0M7nQfp/ClfgC14MvLTQP0MgjhG0SxBAkRHdbaO6bQYh4i59SJ1fdhijX3uBjoc1sD6P148AM/
X3kUNdx/eFGsu9KtxfV9IfTolny/aHHSQ4jgccpn+zAKMudEJ+3q9iWb5BURUXeW0g5Lx/xADZZk
0MjJRRiKh8oQHdI4PsqFG3jikg7/wYiiCYNb3GQ1QO3lKf1vAv1bkd/u9bfKVFsCmqVyMlhQLQGV
3fIfsNYYYiYIgNNWyIfro6b8Uhy3p65yfkHzM6BbuIcDj91rIM6fVeSwjunUOyP3xvu0SCc/Mwrj
j/NmB6/aW5EH17wOAUvWXXdYUbguFNB85qAx1rdrZN6g4bvlX9nuFEaHjtUfDXnA9HkoI+J+tYD8
GXxHVQKZ9kLwKk9vpdPu6Bz0lvoLrEGi+u2yfExlpADgWOcuMq99i6/5FiLsmT8fl0nmGtXo7D4c
vXMWtwNJ10Ew1yICxGRy+n2jUuZWAG+yLMu1Dj6srmquPiFVNbGfZI2F1jC7q7+xuPwYsmEEPFWU
I2GG3QZTyUHM67Wa3uwPGmStWY8fyBpO6/GGuTaCo+xaeWRaY2wgvK36jaMKQc+4iqLkt+DyumAG
8yjQn/ueKmQT99eAtY8ZjGKsSbKMtC3K30iMZkERXwN4n+AB72zVbIw0t9T8E/1JPWB9wdej8Jj2
WFbGjPZtmTs0VJ+RC/QdXoLu6m7g5PkU09Q7p8Z2Bb4mJBEOyuA8yaZj6SsTs4Xo+OtK6l7BG1P4
WiOZQQ3INvoTxEJOzrKkokHwDef3SrdY2ag0NMMfQ+Z3OkZetOQ2OwaiJxGE+E5nYn03n8JzY36c
UAg1Abs0jKuIhggNVO9So4wzMbsnE3rXuVisUwWRVq0CTIMXoigyE3XRw56kOJcN+BBhbOEKg8F4
l7SlG0VPo/+vHnii9XV/cDIDYROejXmT2CcZPb10JnH4zVAcOdQNFV3r+dvnn4sNLDFNLiADsAgl
29skqMZ3zUaoTWrJ2zoVhlc4BaV9STRqAKKNPWeZI0l5bNG67905wQpomav6y3z01aU3o64PvA4v
XJlbkcltBq2/LGKxkVPi8ryW3P58WfWbFT/eJXGEVUjFEIVj4UdFhNGkWvCPpgiusj94FKH1xFLs
SqUx8PpViSMTiOG8oPYHd2+Pk/cA6eayaqhAgEov/VH3h86MlGsU9Ja1lnwMcatpU4xO7IcfOPIO
Mm8ZEVJjQtXqy/OaqUn2xnGt4Hcl2IZTPpu33Ebx+TB7LhyyPArazESTfBUl4qngIK7p5L+JN0LF
nUfkmUSKwNuOsMwaStz17I0iS1EeXfLOwQkRGTDAiPihsl4wG/zbXc/qUrO/bIzXQisgxCWEgEw6
ojnNefPeKzF3GYZiG40QzrTEZ9x5bw90wk/5SS3veCrI/KLF2ouWiCuRtTym9R11p9S2L0uDWapL
AQUTNUbSsLatdtPr5ryTjUCRn5uwu3is/ErICsBwMdgGb24RDZU6RKuhdhe1EOUHqYFcuyt9bw9j
NYQLO2x4ot6YZfyaKA0kssK8qisPvYJC+e41Y5h1F2rcAgb+Cq7blUZQM32Z3az5Xv0APyaQfJJx
oNXIfaTQQA8e2zOEArTXKBbqlMzCAvBCvDy/nxMyX4jerKBoDO+nCQsxun/3/n0BO5qfnFT3ST46
MBXn7qqPCVPBtxpYFo1Mr5rRH7FazOak1SxKmBQHmUNtNAmtLA63eYnRK6LTPRzGSKV+02qy+B9L
vuoiH4FNt1zcG4x/brDf7RIyUhqHu3z34mKy3UeirYEAW+QJ4WGB30QAA7UcoCQk2av1/RIZSbfD
k3Bi/QCkuIKmDfFwxhA9tHg7L8znhYvRiKGXFNg7/jZV9GZlhiucSv5wXuRVrw/FKZQeReFQ/2rd
19aYpcc93EhtBiY4aJyy355OBg9eXwmB7LIKA3jK796G04x+12n4vbseEiPHRzn17uWc7e5Q+hjV
DLth3AsUTXmJi426MK3GiVPU7Tl161UmJ0usuus8l+aPOfcBAtnmPWKUPAdQvhgVUV4tU3pjVRHb
HEd0aij3sfP2S1l/XB4Nu53h1e31Xrl2uf/8VnYmdnKjBzjHlqZvIZ/v7KbkrX8UYW/xuIlPXDb1
CbkzfS/kWkSGmr54KzMPYDbD1yGSq27TlT0xYjHX6af9y/HQOBRfL/rNMCYsQ2iA24HSRthuO8nr
fHYvv+jo/UpQWnCKXSNxNNGXqB6V9TyOC079hUCY+Egw3Hzm4HwFThC4c8WkPInnqdeoxp+8HPym
5bzT6pi4YlATzU+GfLZxt1xra/tGnG9CHs3UU9d1Iwxxm00sxJFY2Fx0P1eprC+zjoGNDaL+2pKk
DAiIhn+9VVGxU4/JX4B2xpORx16MfDa91NYaCVkhLsSBMnj+YxX+iuOfLxXHTb2emX4lQMzcYzAR
OhKWOgC9OOMJ0e9sGih9ZDWLCclDrphVQarHIFycAwC9iQ3pY/Bi79uCiMfR/Nh/A4QaA3X2YCLK
aZYQhs9iQpjdbIcVi2iAKAL5gltzzZamsnSgJviPs+lEjTPlW9aOWxQJuDqlW3dO4OsaQkY8JePN
dEIM5jouSat8sVKmd1/OcSMYhQk4FxSzNyjJZeuRTaAP59Y1RUkmjzazCtA9QNXeiFCpWefzol+m
cnt24CS2BJlpqB+FAj+OEgYax46KvXySSwwCax4YMSH3m7riphE7F9fRLHrzIa6Ud8gPMTBem7Yx
rkjtEMSlMNoriwUeM/GCOF1V65UtgXphFG5FFUEMOeljap3L/gPNWY5QGL7sHzpmv9IieTGvuCyE
Iy5ZSE8SeTmSef98I6sepTJq2zZoH0Aaq3nRJ7kSTLQQOkZt7UZL0pDrrCt+mWh9/QXu5dVRFOm6
R51dB63uPKu/tfzjx09+aDXngrQ3DU+mYbYk6o8ORmzx+WOaH0jaFAZxAprmdse5nSe8LLkYd+nY
MBruoCf0IzhldFQW4zQ/eF0VCq/m26weOeQBjij05ITnqzKRyW3vTpCD2XEGeT8Yt5ph/9DcDHLF
YKti0NnjYQ1xH1dhWh0C1Q5wErKfATdarDKqETSpX6nKuEOhGRkbhFax8WXTFqxXMVNG/9etBnBz
SbI6qvY0x7/8C29BR4qZoUIppthIN8cSnIVuaM2M9d1UxW10JOltP1Mqh6xEzYozeG62dgwV9HnH
s9q9bE//x5Ji0zeFHbGbAcF/7hemm9XdMxZhDR9RBiz11iohyMOBUsVo4MKTUyP33fZWBPc+OKKT
RldQl3soLljjcXUoZb5gcsTfohXQiWsfQ4c1vKBUbEFFpmS5SqknQ13AKLTUCULQX8A79+IoEGdE
2/YZ3aftHPyWx1+dfT7qRNp4eeWmf9c9LfYIFIHV+yctE6KhLI/gJvRQCatGmCjEMa1rdJmtOPBi
09Rj8OH9yK411rzWzGKzjuveGYusCrUsYB7cP3oIRNWxYzPTpdPxyGSh3KK9+yXvM2No9SGXZDrL
vxaNpBMBh3k23T5/vDcY+hPK3NKNgrt3hB4G0ALIdRKp5UUh+EAAcMFCkxG7O9KPaF7aeNOrke6N
bR4OK+G/tndAx/YHQ8jd6MkylBqnlOgL+9V0Wt6EvxXNEW/OUp1alm32W43jgvRpuOw91M7j6T3w
HLGQP2cQTRx12KLJh5jfFFqrSdPQqKIo1SEBb40f4bBshh5Q+BPBdAAncAxj5CdWKkhjCVU2U0HM
R59tufxQY2xrxoBoH7iOis+RQkqT0m7FkqhnawBV9jMJw0JaEqB7xGbAzJjvlsJc+eaDfJuR/Hk9
OWzOJDcE557i1EigJBVYC/IvILjBnntUl9OzMz6I3WZgiCC+3R9TgvaTvnGf6oCU5LRv/Mr6h1Qp
CeCt8GbYSKhh6JnEdOWd/1NIWQ/+zsAsRq4uFxYt2HSScE9VoDq4Ee7CQN4ltJIib9swIDbPfYNt
QyWPWQSqHiFxJUnY66r1/c5Aiwf/Sokkt97kF+9ccST8t2IVOH7uoUe9l7Gxx5u2bk+cEMldPhTl
zytPO+wGxx4GHOrj1ysW98L2KC+veqiEg/EHa3hthHoBdQR5kkPUPMI7k8lifcSMz/rwuji1AfDJ
1Drgve/eUVFY6Hl2WknLWq3GScMPgVnkFImW29rB7x3+wv5CCwytWm/4ax8eM+oDt6wiJMzHg1eW
Rgh481udlv0aS8VkgE6C2NrarJH/G1RO6ckdTilOiNKCz8Y/mwZPZIyEvLmuM7+bbdckIW3BrtHh
fHp5OIAU+i+8Oa3W8L8ENpBZIwSPGcH+oCJNhHdIFKOqzGfEJGZ6WlBlKHjbe1s/vrv6JP0zTvRy
B5IWKLFkIDNUIFKhBB9w1G2PsQuwOiaN3nvVcfO2Q5zZ+8qXHk4qEEM0f9YrqDm/0tUxr2z9PZqd
CzGVO/Cyox7DOiq0AQWrHm9BIHMKqBYrs9qJ1VeaN8eP6XcUnnsHO66dl5SKkUOOaURmy8aToKEG
EorBZcgKkQX8E67NVS8zFg+y4/KsFVNXTcb0PKmGDQft0YMqExPaRmDoIyvfxdyZbCTmqeKHv+jD
Fv1nqZR/DrLOKryoCBpSwVh3Z3UzLMGUZGZXnaZ7q8PB1yYWD5LuCGTGmavX9N1zR1bMnIqNfQwl
MhTTv9GFHaSENfNwQ0Ulw1Zni//Lwcv8j3AwMqDTSV+fbcdSPvyQXY4zVShEiyzt4yDHFx6DVJrj
xMiy7dtXu8AO0p61gG5U0YGhLYWvW+CO/sJLKpTmZJ0ZcxdyE+r4+tNmCLAEeowd1ieF2z86a1Mn
BbKiSSTUiIgFnSIGplbk1HzYXjNsxaKdihNs0NunREMM+baVHQ9oJb2ev/TK++5XPUdxFuB3rXML
/leu9SwfkFGMGd5PuZ78E8Sdp7wn2SqNgeCaF4T7j92NaEaHvMCg8WK8a9qYUcStHgYgMoZKLbdn
pJ2wvGKGa/fcTRgiQDYQDIbmoaG/HISTomk07iow0Jd+QqRIV/v7vE+rGXIFwh724O6BiQgfFwlL
z0pTSU3138RpehwWXKL6Y1dVx/vehMys6ZvprbF7anxJ8763hO0bxf5bBfPNP8XwgwMoNgYqZlPA
KnAY7vXIugaTxDmdfjn6OaMORnvH77mshXrjwdoyvSaurxZ3vJVCIG5IRqUmOTNk8CEQuMyxv95T
UurEKZZ2zRVuy488VTkCFJBMnUkyj5vPUD8b7YjtCiBXt6jp+Ci0K5QaTtk/yzRP60Xp1cUbjZfQ
nR4BC6IPWZuDD7b0xGQe9xLIX0T6dhTvcmAsHK4s1DZNB4A2/GkNxJ2DrwIOvz8HABTIViOZceP6
BdcWWStRgmEVGLZFmmXeMxbOPbhSiN0JB4ZPswvj+pRdUm7/rmuok7oHna4YTKhOdkFd6M0DmIm4
Pv9jElXN4ABnaHGMW2kY30BkhGBxgaXHKziQ2giGGyh1DnTM5eFdV5j2Om+r7c2jOGf8yRVuHoO9
CSjC2C63X34BHRnYetY/i5Qhh/4iNPzgHSuRhE++WkVtCMkJzFfX7gFvhwDv6okAhaDXJ6LlgjGe
CUD3fLaBjC+I/YNvOMQQxA2jAN0UsklDRn/yUq61EdaD433c874tPluj8FHp3w/ZdZmlrog2DbXK
zNp5fRZ8iUds1nso/rPa6FyPD43rJWu4syvmv9o72Pl/57+3plnSZASs2r3sQMHNBl4D01tjIYtO
L08sfxi6mRPrZo+aSSjARiGmWyV6z11EhopCYWC+l86gioe/EyuR8MPyRHmLnQmrxo2wnph6Mtlp
CaakoXG7NwH0MZTpQ8kIevRGibAS0Ibyq0wDtflCTcc24H6/atPVXmxY6t25TbByaqZOBUNXMKq2
UY/4mNFbcD900sXQdw/r2sweZF/3i9hNtAV5l6EY/osrg8xnSnbFarQsaGvNgDdp8s3JsnHqdKUp
g09VKPVfFAgP3XDkDJPdy6POxppU/QbzJAdyz18LvcmWXOO7gvnErzUDd5CSOEUP/fIg8Rde2ZlR
c5IXJFPqVe4iIvIPfXkvsYabmtqXG9btNOAmBLMel/U8xmPA6CTguc2qXwFX+JesRI5SCN5GGySA
o+7koqF4p8IbGfbmpAwcd4OW1gl2ytbP4f2bioWzYO6P3H302PrLAcsHA5itLaVfkL3QCHKqV+PZ
QgKhAwgawBNG/Pvfzt1nncu17/GnLRvHiqgwFjOfKWpffZZk1CQUnELjfv/0rwml4MSAb4EbBx1V
THG/yyy1pgU3+GOaWnUMJajG/4GSgQqhbi85jP6q97L/lxlwrarvICBx5hnxJOvZcig6cxCc8zYl
iGcwOq+8ewembGImsBj4LCebABK9NWfn3FWaZne1Pd2+XhNB5wfdx17qmVLKovBTVWJJwDSEUJpj
x9QUbCbniUspcBVKZMhcmG2JflpZ156VFzmjlhfkJWV5ltxRzJMFmocYY/r+UhCTyB7BNUXrJ+zO
ZGaJFV0YAhz3j34CD0k+0yyrMSdgl3o4U97Oa3NCpckehJwQlGs9W2ITbh03vOr665zEqIyoxpyP
iMvFikbuc+xkysMw1PypSebZGcy/3n9fye4JlNZ4Hg+gDf5XPLeQ7Si+CLvKBilzfffnHA0sfw9U
H4iWm3jmVaLgdgfPwlyIb86qhSzSa5K29mxKqD26qOBfDFvoLLmxbpMdT/HbHHLccYKplS01v65L
xKjxGjPQJdGPL6P+MqQwzYoeBU8+7DOxEH7m8/8TpyaNbI6QNLISpI3KXskUMNAg7uLa1StY8Ncc
tA1t0nyUz09RpL25RF5MGC0a+yEq6zmQtSm2Q6OtJv7iM+hKwnwbtuQ/jiDi6wdQSiwgIKkt2ExX
itmOJZqIYHDh1I9P7rtUlQE4Em3uN7ck9O2r8la9fvBGlCSTzlAy8PvVmq2wK+W9mQ8kG8gdJLIa
UyO+NSB/FOqVjrGFeRTK7tzKzQ+Ub/xiuhB1IqIu0gRxOhyUJrZQm8hhhvaTqMfpAxLRKTBi+R83
Z4LswRD1R4D+c8jFxSZGeMb4YwEB8h6l8x4YtffA1ZAUpz1eY1aRst7Zi2+k6eOVWSmAd0hWXSAZ
N12gyM5XhjuYyVTh7MdvsVMe5NuPykzVZrAEyBc0AnJQQczMdMGnWHCrLsfajGe9TenGjWpuswcU
QqWCBf9f6peChgOuokX+RSpC6XPJia0AbWYNcW9yoXFuELvtVHizPwy+Ovyzbz2n1cmhe44i8e63
c4/lkzqm2Y0VF7USh5UToeqS1l4VRnieZoaKqWNcHsoTFS/mSLn1jEyC7zhBmUAmk6v4hAKhqG7O
hmpacwk5YUe6YvLNcJTd+U22wlMyo6iPeFErlCgFeP6yA12+1ZhZDiF7kLLLyQzosrSZQE9R1b8q
ZZz/yKk1wwI7psspwjSvjaDOT5L55jr2EPnVysisC0pq+UQqt75V9TqRMVeGAqKveVNytqKqlkLa
VEbQh0pEpf5h73smaTxkr+x6U++5R7nXNVCbWWrSRCqor1mt+MbPTDijTxb4NIugjHhltc9bixbV
M6I+g3EoLVxk+vqfqkFyor37sfz4Ry2vRhGPfVjDT/HYZXpuvjj4yztwlljtS63y0yqnh4Bk+kus
UEs5gaEg5Vk3BDEDQ7aLyaJF7E+htWSzEZGe5DZzzkZOBONxLF7INR++c8PJA4rlqrHy2yhAtFBj
VDv23b2hk2AET8x0eHoy7wKysC4JxGUCoKReOmMZo8zE/d2s7DNFDOwp2QVVLGbsG4K0BaL0IEzG
pMrkHgKJxyTNevdS3qZ+6JaYrbJ/tuZ7dhq4uOLmwpLi32Gba3dY8OpuCsbEVs6HuP0dUcxJaqMn
c+5YOc3squqD5jkei9rIuVLvI+0YgRv7SS8WBHxSVJ+tNIQGSMOp2Hgzd1Fzi3myQKUhY8SUhb0B
w8fWOOoJB31MTadofraOfNEdEflGunOmxBovAnnJMbMy2DD/iDpuqjSsKuarJlxUULdKMyG73+++
rNtF91xGxYk5NzNnJLGZIgYimXCI+cotBA2OKgz9JhHQz670gFgMn3o30GPvxtjJLWCWZ2xgWHty
oCZx97/LTMUo9r/InmjHWi7gY5pgq68BwwQ1iRuMDv8jCDVqm52Zvgk7dvCroB0ajqeSU8ImSA28
pINPacvCZ+mmh+Nr2zlkh9PBknpZi8yqB6hSik776LbmuRDUJLMGsMSXiicUymRw1cy29+cojH88
Hl1+/yeEZVWHgqhjFoDh397oa0fJ5rt6bKhaKsJx/0HgGShoVHKk+7S2lLO9HxsYUdhXq3ETIB2m
X+mWqem9tAWKT0UkpSti8ZWAaqvE8ylcRPI8+mMqaSvLpCnMm1hFe+DakWB2SzaOx4VMO3M2LcEg
bvWxd14/iRug2i6ggO1XyQj2FdAi8OQoNS1ceeS5papnsY9kWQ7H9xxBIeTxp5LfbqmOmzgJYQMj
wGrFAp9mCiDU3Q3Xm2pih/MRaQ4Z3yXlckpwtbKwOTCJTpTJGjJNiErXPUFQX5Casy6KknesGkc5
fPcvXaPNX9Z1eG7hKqQvMKRyPoE5l8zHrpYhmyAR5VDm3ev+E4PD4GVrooBVpXwe3vZ61UqBpn3o
keg6z80+4b2cDnVNJOahYIJlA3ODFOpkZE069lcASZLeK8ah0+8gtlnhdxhMvXDgLZykGPjMNDb8
PHg7FDKwo+75dHxwe4ZWZIjR/c64IG42Mg99FNinN1XH3QknyciZ0for2BQ6sMgvVffzgTWbsRNk
LaDiAtgNxjEVlm+LPpvijUTLS8rfflUgzyJz4AYbxVoYYLw6Tg8kN7apcUPgjWpDY+FRU6NLeJAS
6mwFNCy55Lc5iAswZv1KdMfk7dBgJdequaNj0tHtIATuwDYe4luinXSHg1i5CLS0of9THpkqov/n
TC9y5YMAEGyvKrpafbca78Ahl4TX4yuC+YodpVEMZYiA6SND+boIosNmqHc24UD089JIQYW/+pDZ
SC4gQzEnhphao4m55e5ZwKwbHzzmyfJtlMosBzhvwEMbu0woT+CjwFh91NQUBXIvqFDC6U/AA65+
0KBI3dwZ9aA5NG+JynVGWgVAz4/2vhvloFZ7hBymqV3+yAhruNaDCKxNFadxBCDrIyFE2VXMjjxv
p36UdCFGviLjuO8Za8dhEiKIKP7+HXvrlaFKKyLw7k1lEkv812WgP6GfsZDwiMzpdr0zgmbM/0bi
VZYRI/gnfiXK4x7oThPFRoZUMcmVUcLoNTFQO5vqUgd0mrhsU/f3yu8ceuK1nd7tYfVNnwpji+eY
3TJmIOD+AsQVB0yA2e3YsAqTRLnYrjs5JswWLVZ07iK/xY5cCjr2ZvGBtAzH3SLH9e50kNlPwLw2
Mz45n6OHyH7z4vuU7+1g++XRcDeT2GMz11DDINFCsxyI4Dkb335hJ1zY3DnNCgzbKt0K+jALeiTN
NG7DkFgk6kkVVQBuxl+k1sjkO6XLjJSA2CttX3L0lzGriwumF04IWTuKB/XhOpIC+sYvK/ie64GE
DNvuiDgnuEbdZ17l7L3e8+TkGqIQar/tfosJbnvSqJD0/YlR3fBznu5jFe4CwDjZ+XlWf5Ia7IT6
hBamebKmlBoyIdh21/anoGJyMzzflZGCOMsSNX0jEblu4MLMLcYXGB5Sn99ZFa0tjFUFUv8WXN6l
MQXFgQsVqd33cSRRDXbLVHna9n/dWlVKfWvu/GGQUEGlP1aJC1oUsC29/LK/0yowxnndttZtYbNu
AqvXdRP4ZCUmtRCrxht2xZcMHgjUz/yS36jrJOs8CKMhbC94KejjvzHlJHlUSg6bhxn4H81UpmkV
tIE9/Jc7SknOkRACeqVPFQvzxDw8T467Cfw9LOFVZT7FRsSNeasv0Fxq1xDDmYYZCH1zvHkt0rUQ
uzkOcNpEQB5sZs4t4z0ngfWGBeDGfgq++zC0s+HpiqLjbfBuZy47zONgJpxmXGBfcl5FJ8IUlyvs
aLzVcrWPCg5HjeJG/Flk3OXm27tci/a7tYtZvWkbMNjl/DAasTY6TF8mdtnoouqrQRyJz7x+0JhA
lqz45F5RLSR1W81rGFP5j7gYSnO3K7GT0YJjVvb7mmwanvxBN7Y/Qn3tKq/mOMpiEqFGs2j7aO6+
h0NDtKloI78ZbGxcE7N0VEkSCAIJ+jqPghXpN9IGwFDK9oQnAehyr5O97HXpL0zMH5PQvk+tzr9z
iuhYTRHeFKWYKtyTW/Tmr7aY3vADD8NUIw6tX5Bzkxhyz0qH8lJYPsLPc9Q/PijX394Y5P11pVAy
ax1HtTQ61+tI/b/MwxNQMet99t+kNQJe1+uqYFo51fhOmxkh/N9mh16gxd8Wmt4XIq3iC2lbwNwm
ErfzXczWphQdqouQj/9zk4xwjJAhB3cPq+YYF1w6JkcouETs1x7kQnHRw8+gG8QReClsftAQd7pO
VUWdmzdHwzvkX3G4kr8p9NAykq8s10M1EwsIHtjD8ccG6vjrLc7jLetSe/SnHo1jVQixSVcdOo+N
OB4LavlpyCxFnBr9MDwiifCBhfmGXFWpiuow7oSkO9ns0f7b6hfYsx6RAeyzc/tVEsJJgYjVBteo
8kB0FuHsRX3bOkgxdHJ2+8fA2jvnV+/SZWtJAT+N9kuuYXX8WHmBoLknLiVvvwWsUOWgNNSwhAR4
lV3ni2goz8CFdRTdQ+9Ic8F8ZfP0CqMStwJ7u89zPHkWcnxYHlBcIOzt17iS0aCLHJg6Qp4Mk+Wl
mSFpN5swuGJJsdvujmLm1QuPTTLi3QPe21+YMb5EUN1PXKTy9BiJ07SEOuZ07uX32AcRJg4NeiEU
dqpM4OXyOJtqUR0inmNsLf1TSE1LCZwMqkMJv2qqX0w5RiG18xix1dkiCrn8R8UoFbtXmOJNyqWm
7u2fSZCQolVDCawnMQPJ4AS7rCPg9yE+JLPNpllgzDkysHE4ZocrZl2s3hCyad3kojr8TwPqxj35
PcSObdQwTLZkc31jFpt2fvGWzDDR3aL2kyvq4coR1hrchbMBR4a/I58DxR7//93X63E5yUnkfV4u
h4WNyBZQGubdH+uQSIfwHc7lcirUikDliyaabqockkeHVN9PU0H8W9R4EEnSPtKK0/vEhyAzwTZW
+TZUyx47sSjIRBnQ0LjsPvnr7+OK4Zpqxogc4mqaSkE5VsdToHLOfXNBr0vx5egWYaAtXgjMb/Aj
SLQvB6Hn5Jl9bOInHqMt+o4ae155hxCVlfCYl5Zv2XIYzL+vLJ23qiJ6HiAZOpl0FnKzEDOBWT4j
OcMhkf9GJETf/ft73hPJiVZLF2ul/x75kpJdGJVD+esazboAYwjj9xR7wkL247HVT0D/VYJ/oY4S
F4UUUWBU0Fs0lORX6S0hRkoZKrAGuSLhUueS8m4dJ0dH+eB10YUsJrEq84wcEevTraTPQjmwoiN3
xPSAm/KHRyahuhLq4qWBz2ENU2ogH1lWJVtsVVIX16bY3DauUDPwAH7+nPBYuswA2Yotdf3XzgWn
IjYrzpQUZbsreuWfklG/u2rl2SlZqJpP+ULXkZZmLy4WIDeED8o36uDDrgyEcriTL8YfICy6jKRY
u22P7VL7EiTXfYuI/csIbJztblxsHGnAVOve9TG4UmdXdAYU2iLyA85fGdYJRioEFnzTX0vMbZ9a
8j6Mj1+IWUaQ3obx/Z/JeLJtEJPxR5RKBklyNTh3w6XN9nGR65Y2SrqVBGDMrBT4mokGTt4OF0su
L/mEmceLDpkKBwRb6pA1jy1sGGjzQfYKsiCFJ3zZO5x7df1HFeDvlGSvJVdNsOA4XDUDpuHlZ/5v
mdp5OM7gd4lrN2eM2CcZ0r3DNfOemTRgwnDmciQNnUOpU4EKhj0d6wVHNGaE4YIkQg0g3/0eHhdc
zgjn9nu5If5iSuAdKiqqcIwetWryacz147YfUbe9OwCM8ksEuJgG8LWVGrW5y8HsBrUFfn2ythQM
4hURQUEEhSwChQnXjPgbaOTtqgrVO8phx1IxqXWOnUhWLKrHXbiCfYY0x/UXCTqohYsnp1ibhjYc
SvsZeJbb5ancld/bF34vvkQyr7VvJC/8NdNTOCge6tuBAk18S5Rkpv6lK+iTJHbiuwKM7jgblTli
XnBweqIdX+Vm1zxIkSCbCFJi1ZIsedc5cbdFT0FhGrXvZBlZ/4S+o10U0O3Ne7t67c0uj5bjW+UY
MTr4/wQDy/FZrabCYf2iKgGe8SM2rIF58j9Ip4kyydWogb7+GmxyAIqc/4JtHM/+3zXCquFATqZl
l2IrDFFZdFJiCyqrwev+AaUtws++qozQVY8fYjcFaxrdBQqoalzccVlTi2rkna7Qba26Jd5qHCJs
C561dUT0GGxrqNKC3dgjHnVdmWlRTYgG0bZnZ/0OYYErcXiXp+walLwehUSADOVm7VmgAzNyA3je
Fe0F18VKTdgppJzPM+ZGuwWm94RlRtdrLqPeUeuQbyZtWM69Yn2vd2EQCi5+krY1Hz/W63QhxQOq
/9fk/oOAanleKHLo0G+8uC6zpQOG4iqYe4BZOP2qHx1sFRtxNRutry3U0dDom+Gdm4xPucDFsbzJ
jcYn+xDtSBcvnQnMbJiAdob49FF02E3FLg9JcQE4BjDrS51eaAu9hh5AjdnZh5jTFyObGnU8oeAf
CVwH6vH9JXGguxScnTDGQXuQkusPbKZE6j2+x58tC+j94I4Vu1xtN9u0LNgSCjBvWdCinhLseTKw
xWXlZast76RxEKevwh8WnWvTh2TpjfcCucwfqb5lsH8GsikYbMYC3dEKDHCwQoaTLXIRZ0QhWzxC
4/tXzWWHwZgOvH+oURImyVO4xliN7Xbi8Pb+9mUWnEAWZ67ZIcquPp0pecey4w052xSX0Pdv+4Mk
TCLobWF/Ge5nIt2Ryv7ertTSHQN8yhyWGNeI3Ag+qOVvdgPbfuvUUUzbuJkMwbjhpSvlLqhwXToR
k4CXEuEj9B/bNAI8j83bA12gkboHu0gXGj75qYCqAn+p0dLsazlWmzAvbRq0kj9NvVJItRi8h4qD
3pReZ3gRthTwkih53yhVxOsGiP/uCm09nyadDhmoFKjFKKzjdWJDGhhNl/heQXrVu7pxm4SnYipS
1jZhL81YpfDQsgUCQHo0o8nINIB3EQOLZjrWiDcXgT7QzeJfjR1blgMaLDAurtiTugJfw4XPQX2r
I02BB2MaDaenKu+uhtD3c//tqDVihwq6+kpijgQVsDhluPttI1Xj5ybwF2Tt5VjPaBdD/aLxjbKC
HOSzK9YWOQQYiJCoDIiuM8MHVJPBuDC0LqQ6qHEWR91bGQD+1YsWdHfH5SErv4yUfLGt/RWijGdG
OuX3n+gLj5+7TO8uIynGiNUmrYZluQbKcgBnWiFbaXhhmUtVeQbfbJwkDWHNy25y51EihvCPCmt4
IIJ9wPr0AfQcw6N6WIuwQp66sVgNGQ3+88tW7lbZI48xhFzTjADUcWaL2SBO0gLyyhyhEp3/lRqo
I4UgzpXF5sEKQ1r+hsVcV/DjBHNcSKl/H90IUtH5NxyYiONwcBN7bPOQ4jWetCTwmIoKfQ2z6cpO
HBHBZQXhMN2SK/UehTVtcnMDrjB5PiILTLY86Sp04RszewHWbgukE70R7UZAJ38zWghTU03YYEFy
rz5onByzLore6r1uCKv0MfBKOpXXfvPpfe5jJAGzSsiKBdlSOo4r/DR1Dx1JTeK6I6LxHkx76qff
qERTHqBFkwybhPom3uJRLu02w1zU/UOJMe3SRbU5fVZLRAnLCFvRyQ5w77tqeWtS4RQLDuMV2zgl
WU7A5NHsq1zrGoPMk0lsbKEO4+aqfMozIPdz2L3drnz7TJm+/n9R2k+wp7gHNb2hApAZi+t2RH0q
+GI+7OP2KIj619EoOcGrQxYxQ28SLTFDl9V4gEASIn05EXzCYrmIH4SkB+lMuKG/otauYYX4I65A
0wruGejN87GMK2YUTVeS8fpNJzgCnh/Ude+rzScEYVNjqdWWWIkq5YE2TK/NJnKCVN0kJ7Z+BBJD
uAyQt7UK0+owpsf3HqWEwRKwE3tucRri823nddNspWb9MfJD/RD1RZLryoT9SEnIxyldkFggVOoA
o3XnvdHHM21xES+qiOjrP1uRQizgz+EeSmf1c2VYBw9VLaR/hqK14seeUyghYGKmeDTEKTn9SPdQ
UFGB0J0+aFDhEWCE0ZSaxlBf4hxILzvypa2BX2rPZN5jawYCkaNuh1NX6CjTIAwu9AyC3LTyV4Qm
gkFI6nTqngrT6kqUCy5D5YST7h4ZfEUlIua7QIzEDMdfBJ04xwby/YuoDSsN9n8v9wu7eX3u9Fnv
cGkiJkX1ug0Zql1JMKOIXbuuvF6W0VTQgFmqdfkCc4JSXynw3aq6megjVBbWA4RMV/1yUNwLa8Ra
wLVlFXfeV2coMiXwvZp+PZ9vEaeh9X1ocqfc5xXA1hXpBa4XI4m6HBysjFSCcJfGmT3OcM8aL/ua
FULIhjJuJS7i+/a8rBx0mYkHKi/7+xwlCriHfwgUUBAOihl5CrssdrQponDpN6n15NjWnf76qx3b
j2rTAYoH4EnVteSeL+lfSolm75rh0lK+rAfViddoh2GO96DQcIpKb6r4aHlVcdNLXGO+ET/pAhEg
bhJi4TM7heV7gqoceOgmVq6tEJWbkZn04SVBx3ArQ178+yvnAlhnrwbXe+6zuZG/I8ccGTvelxVY
jWnND927rTSrbPGk9JodJigy3s1VjjKaWy14QxazOW9bHnN43iQOJfworvsWk0elaVf139k3UdM0
FnhehpWG+6U+WWwFk05W+WwUPez607Fj9efY3Z6yMh+y6OlHvMK4UZH04OkTK9kR0tJ9fq2CWKUt
5glVBRkpWTGtgVamIqMqpJ0Yzuy88yddIwtFYO233h/r03w7B59Tw9guSuEKMQwtQOg3Htg96FU7
UDjad3FIpphChX3mU71JgAq/npgTCimXhFZg/aJ3Tusc2jpj8ZqnRt6hv/Tdf92CGhRmGPdU1YR8
1/xa0MsbVpoBtN2QfuvUv7SqqHIE1DS4bduhk8PbmpUhs5dlIhnRRjkkS3Wb3wsaLAU1SPMXbSvu
xzgKH53PYgEAvC7sc3tbOH1DOkUWm1Z8ZigSAT6fJvQS2yOx4Ga48EHta1KnpThH2spFay8q57pP
rMz/w5fqYJvxF9HxTLtuGyHRokCZ5D6DUJLwlxLUj+uHm08WSSylXuAheq8yqRX52QiTLhJh3p92
629u54dyOkmhcG3QPW3Fc6WzN5zt9tt8SoZEis5bNbrl5vBvD+Mz6b4Lh9R7y+0ylZPL4DzgUQ1f
T4fzRY7OLFEZdxBMl06WVsW0mwMm/uTABHJmGdak+Cc1LyhjW2YT3eYH4uy2JvZI4napbjy2FkHr
9/xDcSLRG3hAggbFF3MdysRdZ+18Gy1xI7SVy6augHJQLER+XWyfdmh69hlFsa/4kI11ma2qtlaF
pvZB6X4ZmwrQJ4JD8pMYlhvApZHP7NwnUCO+M4T01LVys1E5LTYtyLHSrei9+oabJEUv7jwvK3hI
dRn1PW1R7SNIsI9CCoXzmvGhosLFm+RZ+ZlBzFTVHijgYPlPmzW/SGmIAto00sghLQBCbrVimVjx
gGuVH0tVmLZrYXTMPAen60n/336wwRpGOdxaCqRiS7ezXNzl0xMGQPjZdGzZJeNkaS2R8dszcOJw
QDbsbVDBEuv11qQjrqsOjjSuitrUg7dEmDNFJb/Gc9dU+yqilMaEGWa9v+EuJUn9J5nIQB/d3A8A
tAeuDQGMhKS0pp6kGNmCjkzFYx7NPK0wxUSdGaVGHA6P+Y3fadnYcLLFvXULLnmBPwHrYRzibX4a
/mljp620Jpp3Jkj9a8tGn7vOFwHabCqFil/A6Xph6+sMIzHu1wWAvqdixgNcHFVyw/ILQrbpIZ0N
RMG4tyHkGFHSCwkPzKCbbbxBF3gqbPHGdaSwm1tCa8okliJhLVg/6+DD/qi0KopX+rf7YRL70otd
h2e2yWGikp5iqI0JnxH45lpMXrXgH1SIc9Q+aOhS/8ftQ/M2lLD9MmAyCyBSwI+SBeAPkR+K7fnO
LVf7OeAhBou3GjZMvii4RFGiz/WA61Tkb7sPrf/EHbYqmtDRMMZe7QiC5z8OOSAJ5de+7YTnWM0k
NYpl+YrSIRfLjELI80hYtFXmDfRvVAZKEj1SzsiSE8OJE1hbFTHMIgdS40/TNMayLlg7Ah4gqIi8
bmws7Z9pJo+tgYLp5aokD5yGMOtm5g4x/1h/Blm/HNPqV5m68ZI8JoJfEdxPsYm5mZZG/Wv3b+li
eudTe8AxjyoUPGZ10eBH66RDMkbY09nYDg/LZPnk9fV6EgGSCBhXqPwwR0tXv8B4ufIs2+/OGmlR
QK66h/0LjDzzi5BEXQjFU9IUA/oy18LoEsqiPRfshoWnsVoB199vXX3xtW2kZ+2VfhzJQyaI9VqG
eJ/t8Bvo0luLhVKXHB1DJBU6kVdPTw+uOn/nMNPEonOyX2oEprlNni6/6dsjgmhsMaZpD0Tmznh6
AGOild3NLogYZiQe7RBJTOtTNp7CCEoZRddlp+OSSyVkExg4cjdX/Cn76OroB5qAEnRws61HUoLu
i4wZleu/E7XxqGpiO3Y/KWD2VI35eaa5hYUc0vh3oUdtp+OXR1qbKGXwFqG4nfx6ilzz18LwMwgN
Q5tfxZtjmiy/8+NUMZRgDwon4ifgtwBZh1ghrwzlCK8nTH7VjFmtZXBCkIkmuUL/lmHuuoGKMq0d
uft+YUjov6yd6M0zcb+272rIvohhduJ/YpJ3QAVLgWK3mdjLVwrgSG3JZd9wLhfI/kxkdlhHxpm7
UVJO8smPZtcCwfwzTi/u+dlywxjDMZnY//hNRNJT35ZvMYTtKt19AfNuZC+D2VU7Vl8DpE8fdy/8
8bfvMcfif3O0+y4GBOiGeFZiLNSvP9rp//7F83wqg8oQ4Acbl0D1XQHNVX8gbRYHWlaWg446PsAE
idbDJ5oBEOn1gj135nHCe6088vPfuDyRAHjcHHS+lm/jRI46VHvyu4PNnJuc3iVyfA5jiiBKnpJh
woTeBF7ooc3IvXeMCK5hHCbdet/UfiUnCtnVSRN0j5Fms1ACeo+BOh8uxfZ5tb0oI2V9wSGYUyDo
PwTL2OvrJ7bIJQTSn4ltQYRraLynRgTUxI2Vjs/IrJG4iGrgpM83WkPl4PcSUZcRM4FiMlFCBtz1
DhF1v3s+Xn+UK4VDlLYbN0H6MAWdyTJggPyOrAs3QNYEZyoSpb51ihhfCL/iHvdYKwaeQyct3j5w
6ErSUTf3FPIUXWxD0oWKGKcVMkBEGjY4d9SHdo/b/U+k7ydRbX+HHT/fPpoh8GPdwfY1vpV5INDk
zXs+zQyhPzKKZVDSf7Ojm6KvySaA5rq9XbcRnx8Yu+YytYnp6P33pz2/4SpIl2w5C3IB1/b+H8mB
gtCzJ+tpXRB0cWnVjf+uTLWvsFUYW7KVK44h9XJ2recsZ8QLYgE0diL3NRFGP2jjObo32P6Bf5jt
H5dGCtuxIMHcivx3OHwcesRdP3QCWBQqTEd130N1bL9ZEE/vJOD/uiD1YGLR88aZGPU35pTPvrzN
VHVhrAz72U5unS+9fXsUKHA79+yQ01pJE+H7TwRUdFQ+8lHD7pnkjb00bvfpHs6IKsLjaqYtIk2J
ernj8bpTKEO31aPghPxsCw7mAbkkG2ePKur/6863u4l35fzi4TjmZWKKYOZsbesL5n7J+sKeuV6e
+zn9GnPz1UI9y6CgzyCzRMt3Y5E3/IgudXMwOH37iDYWhNmBN1uFvrxnOXxpnttoVzaEdS5OnHSi
fU0pZhuvhec9KQgtKv2DZyM7H9CGy7IMmeM3PIJsAraS+u3tBoJC2hLXDaUWhEjlMI9fl3E6Qn70
5BsUUhLmlTd6ScPV/Wmv6u5KEDc26SGT9ZjUN3cGkA7lR+13ApfNDyb7BJn2+HaMMaHnUtNtdXg3
BUoANj/h8MXUe5B34f2GCYA+10RLJDF5Gzgs4DtGzjwoHIHwUgU7J2Lq/IC3125zOVHhA1BTda4T
iVg17LhM59wUvRSYwxZg4+nbh389oIIK5eoSeON3xQz8QltK8Y70+PUp0/321LrV6ymYTG8+w2XO
I2oeTsCz4S2rCGglg9rGYzYeqEOlZVpHVUD2/QUXzDEnHF7kfYTRqW+XWERSE8HHK8ZfZi8ZopcG
icPdn0EjYW8GjHw9rsi2GuAHr+popwwVXO19f5ot3V9dTIrpQaFacWfJ1BJOYYkLcutsmtG4Aykr
G2ox3kaTRdheQEG5SaGn4Lmc3T6Ouxff0PEiKeTBYMTKhlUV175AWtagHb2aRLvOq1xgyJw5pvpH
JYtT6GmouAHOnUe51RbfLPCApc4o/7aVZIi/4bFaVAmal9a7SXR6roRlh48CLGrhe6pXR4+OdELk
noLQT/PemCcSfDSWcb+Q8lFFBbKdnyi6cPvMEs75Fu0JkDiWjpB6IQKOMunyzqQZve7RbUn2y7jP
WpyqaHnM4o5niUXd4zcJzXHat8wmzlZnwq4Dwy5tvCBuB9etnHF6i6jJxFPnpNiEbheR7GXePtBT
28R62axwyoWO/5DPUp//wNDXTHKb9Unii4md/Qi6VAhHMHLq5Up72F+Qa4zBTM1VPdXAxEtKo2MF
tKWe3df8iBz0ZO1EsTyKnq4SJQTvrYxj91nnAfBQS7TtY5UQqyG7oUN9aLtam6BJUZpVGYwTvQ4r
M3s4nrbI63AAkxKfM1ndupOtf1YNbgdaSQaCm0vE6po/Zt5ULihFiAjUjeIxTAloDBnQnfETz0X2
dnXcT+mBr10Zgf2wo/iS4hPkiUpF8U2+QHrw3u5VQXUsoa6LkrirYXyVh7onOQ5QKikyjVvjBmrw
XX0AtgPWaEqzUH7gnYB/TwkXGrN9LZxv8DD+UQvs5UeRUIWQo1SZV0sw0Nsb/T06Cew+g3UJ3Xq2
xY2Ycr78JvkVXPJt3QO3u0TXusYrhcUnB1i2v/PG16AqQ4lceOlPsgBYtR+mzvWsrh7+8L6gAxhQ
uPBakdIjQvVbgZYfh1TcW+5TCcltYDoN0qJP3BZSuIKpI1DdttD40f2Gv58bufXj9WiNLEcZE4JK
JWposif/IWQxPrYe1XTkdMHUds5xJ91tgHL/2p8qjId1A2ja5w4WfoeOfhLM1hidD0+Xsic35QTZ
y4gzNzmAEGCtbP4/JZp6L3xfRyL/4qQD9MZrcrFLIPKveiiJsrF6W6Wu8+kVJjDF6NVDGF1Ykrlg
Jf96Nr+dioXH/H5OAoqI7W9rGkve4EpwZazTU7Zm3M5TkZKwmt395DbfsXr03p+heG8N9pfr0iew
ojxUGyzjL6clLOo2UQYHkq6h4WJQaH6HoasZgmwq/IpPXujks5/WT2/7IwrMf03r4v2lQBAKo93u
zmEpnsjTPTcb7qebQYa2pP9Fcm6Mt5nFPSQMDFXKcKrnkjh5CR9pIxhFiT0ln8PbeRH2Fy9Eh7Lf
03kdbnPQ3LfwpropeiWSiDCqIpRiXTA7iLSb9S6SFkTkAas5kjLN1NmIoUFyxZw7u0HWvhs3rPCx
pGeptIMf0RO5l+pxuNdS05pDrzoT+i7OmCGxhA1PWdw2wdMaVUB1PLfxCm5v0Xx1ysRowx7HWJyQ
+hhd8xGB59vvJd8lHpmPa6BBFbasWsbcjc5cAtvJOTmFrKM6maJjg5s0qFxks66OYPYoJ7plU+hk
LMLxXEUWHMZvBlQHncLMZAuapBtmTVbDGiEtuGmoBQcT3Ej4cMNGjaIMUbXV8fx5CBKNGiIFQU8t
a44MEPmEl5qAMRfKAtxbqsbHQ/IzJV+JK7eDYzOlGGRoFUefOjLeVT48XunoOtXgCsArrIIRV9Cu
fQgKvdfMvmu9mhnSXCvgBkiYNzkNg24CkHKo6GmUxNZJhRbyOliCquOstciN5L0BKwEFyLAYnB8f
XNOVKV9MnQ7AmoBzHUeQQmZgXWWGdrlXyRjKsJ4765I7TH13HSBy00tVKcOoJWKZUI4w3ivNxwLZ
EhbDTEJPD9DVASbs85MUN4K8n5r/iDc13dqefbw29oIkNStp9ZPX6dmW5lsSRmOuJB2AF2zitQCG
iZJIDljCl5CpxCB7N7HrKMKNFZEq+yBXWbjQAKJuixyAmxdO+Xnd2RHF88hQQVfHsWpkTUKNPFiI
DuKVS5zwpnOJgTdAQkqTXrGeLwaXn5542R4N0rYfwn5fZ8pA2bhq5HXO+IAVtU5S6MnR45eN4Ia3
tOpOFeTAWrA3XsZV/VxymXTji7H76ivzDY4nessqpqieImV5zzkWugfAyyt+bNXrvBjDCPaPsquJ
hnWblWt2hAq5R9h3j/ZMlWoiT32OsJNqvFqEH2zOSJxhG8njrRFOFJGwvDI84lq+qCoSrMjxFJ6j
x6eiK7N2y9HCZLJwMIZ04U+x+zZZ57hCS2rKuaS1zY81kELnpxPI9OZV0E/aRHHFYbDyfSQM22fK
R/mtbuasc1QXjGaol+KU7oKsl+rkaPCSs9nQLC3vWwG8IOWyR3v9KPWys4k/tCMYbfLpvGqaE4fY
DtgaKJEHlTj1gEJFBdDhRbKrR+IUecfMiX67akeZvrFrJYdv7M1354+PmtPqSgq3HQ+C5jnpc2ZH
LYrPIV0HwVfWdOQa611ZYUBQL0E56K7y/3SNmh6H5pHu4PKBsEpLtBo/US7YCuzHNzTEyDBDbjf/
Re4F9Smi0br5ebN2fg6yktE7AHjUv+9hMkCClzeO3OaChFonn5+K5mm8+V/wV0ThHUEmEBqpqd6K
fK+iHvYSqFdGfQfVAkbREGVBqS3T2uW2xOHfe7KLvUU0a8b5aiCTT/7A+RfRYyM0W5I7yX8w6fiu
qbO2/Wb7GFIyKlVWY1VJJ5sCUhFU+ixVOX98Etrxv1lHKjsjREqkgwMjaHXoeOUrThSNkgPg+PwU
lwdAaiBaiTYUT8BoKiBLzEivEv/ZWeEDjeLnvgRYT7hRINiUv/d6KAvJ4KapVW4Nrpxh+rf3WnG7
k0R3rTq4Tw3ILN0iq6W04OkRoBaJ4uknWZbHNZH0pUSyKSdSXT8H5+TVcOAgzf0J4QV4xi6geUdO
Fw1sXNYh4HsaF5hydbb4ZiLmJN/H9g0KIvsZUp0vKzg5E/vq8rS08vBwEKucE7ptlwrbksTQwwNc
D0wtBwplIzctYnTr3qkWWy0jMZ5/cPfC47xPHbGshCSgQF550KZGtLFHa8P+ZWps+tumsoSAOjaW
oUKxEPrUtl/lra0YBWQP4fPi+aID886F7CGEpLIUwyGdZA9ghmX5OcD3p2fbIOudknmpWTmDDKXE
01ScjM/aF5ADRUPmi6uOm0i9ZLP7SxUVRXVojEmoxsfuoQdFtdj6RQ7JUOEDIyF75bhtCoT2eAJK
EKU+TkCsxnJm9KfUeyaxjjqAYSvr7u3CfXnXhz6pIDp5w/St2O6ZhBpHCyPAt8VjNrkeHwrlqdg6
dwJGYH3YOBot0AF2eqX16unceqqJuMGvY2ZDHDAG/t41lIr0IWhCVad+YbrvVltNhaPu6kjGbEBi
6OhHkc9e7FCdPppGqWUS8TIZt59t+qzMl+YipEGDjBbGLFNDsNgiIGdUSVaJOKOlfYFGs0msPLd9
jmCyP9YuC3Z3LnBHdM4IovCmSia/IaSa93sRoJDUsPAZMzfpxo6HmYrBvvrCbHmVyEh0zB4F0LUO
akc38E7ulHpERQbR/eXuO3BND52wf3byu2HmvTjizN6DTFUI/mamm1G0WsBfGFHdrQ+gNeQbf4FK
qld3IlJkAjsHwznKqdj1GWvIJGxYnfq1z1dzDdMjH1LCoBwR/orXVCDWwlhr1FhZo92pia3iIH6v
0SQs6fs+mqKGr1kVE/NcQ1dUjn4SnB0IYNAGQxoViY2TBrUy2uJNiM3ePdQgjCg93IOulMIFK6UA
Z9IM9mk1FH/4YORnB/TcCwVPBBuCBsSEq26eqMrVc4ZWavk4MZssB9oqgcM79UF+Klb/+F2+Rsic
1nhrOxNngdocOZP+FRfMHwBLa4wsBgnNt5z0gNmp97s4Q5QIDzlPdxl04yA7h0LSWQWGc8qIik6A
mFXwZrHR+uMPHwUtEMwrs0fCkivzTLXxs2IJbB6D19kgrFQz4heae8IF+keaE28U9hhLg9LANDfz
R4MI+EO3mGh2IA9v9pYaE8rB8Jpg8gHr8INerpsOfJ+Bwnne0/VOXPIYfYxhoLWtZWBiqyNP6uOx
OHb5xLhRbJUHn9RYYIhVqv/TtZoyywtSU6tmT+ro9vlu+jKCWPIniy47pu34rR7tJ5SL4ChHqJ0i
DgZPY9TjSyu+ZR9dsh/549IMcI8HDqWywFcZXBlRnEpGInTlzeYuT6cqDzQTjgkkXZMxrd4j4Myk
3iSut9DOwX0aeyxuRJV2Zo48TA7OG7yFL2z+JvCL2nkRpjcJW/SWaF+rGNBXElyNcnc9Dr557Ojw
p7tCezDiSCpkON78YnKYWmc3T5AD41+RccdYxrXH/qGxBPAf05maeC8cbx1loEUBG8s11P5VRa2M
Io20ov42wUosx8KEeI3cizqtOcidlxczXFWH06xlS7J7F4e0e7loY1BXH+CL0UznDxwLLiW01wmR
sMyKv5VFiZs/6oQh0V8Yjby/bbhVHJw9R2haHd3tXLtJOlIrmMNzoUIb7j3ZOShSvFyzq+uAgqvv
YuIMXWe4XQQI5VwvN2vhELtG0GnIC4SjmBAxkG6FrX+gwS13xxob1v8CkLCU27feVhxP18Q4wbw8
Dh6FQJQuJAnaVv2cPYK0PpajfmzRVxYynAZwKrRjibYmlwT+uEEDRccxFimkFonu5On8c/dRWEl6
s9/OhSafMsRxbRa8ySUJLQMgJMwbcip1MD56y2Oq0P+QoGWfYF6NmDmhGQi9TShrsb0fjvzR7qdA
p9No/WRS/Lszf6zcYJ7ReuLYtHIxmdHLYz2goiKbDMagNai10QvFk0/Wq+cIRXL8vVfFdpBgkyq9
3KjQXqkdXjCgB2BwCDPV2jSWxigJMznHtKwb1dFKB7V9alzWFuIXmwWaDOb7pOGhAzuKpHtC+3jK
c+j6iZ77YcR5VfyRuhHJE+EsCzQK/pjBEvu8J5+OmTkQuIrt/uVMbEM3eZcqBK9Y3h7kvhY0r4gv
UEQsc1NpD/tWBA1Jf/CTLgA3vNtA18rKGO7k2Su1262jlaFqwM2hcGfzLNwbzvUPu5JyKVVYYDBt
9VU8I+9s08TeAi35pu/qr3sCIf6uo21mDkeRI7+W2RLsvZObWt68O92GqyeJrxc5tN3EuqgyTYmD
FWW3YXCT3xCLncqcmx82JgIWKiqV8D7rFD3aCHd11HmFoVjMNZfDlK8jai1TPDTEXOX0auOXzGIz
57Ggh0IaXsb1eBA/64Mp2oI4bvP4uyGNw+t0o1+ZkIXEQG2UVTRW04v59n5E+mJMtb85Us8X215z
CccJ7VBuPwLKLuXyuha7z6wCCAEbqyFrWRvDKJNtDQ7P7citTKtFjykzjre/C2fOB3URc+Y7sWrN
mWaEkHqpR1qHR9SE0jU1TA6IOzJ+lDKD7p8405xlM+/W1Vjjvl4RBxrxQhF3hK5lXxhb20DB8ple
yhXPYx2u61V78hQkVfZekOUNif3R54oeh4MarCLrfurHDgcy4d/QDK4BT0w9xiBoyHVBDxmBT+IT
O+A2XmlcdvrSDmPMLyC4EgaJos2qIvxAqfTsuLkOlM2K4D1IV9cZ4jMWCFXwNVVBVjiPrkmn8sO6
XsMnws4mjl/wiB8Yp0g0w2f0pq4+HsbCXJtOjSbDN53jc2rL7CFgKk1KWDwtIWplRqnSEK3khj8k
mh5SG+voeVzsPmBhuZ9oU66ToYgLWhBjiwkpd8/ob97rE+WC8FiTtk4MQSo7CFXkMrfda/2l00qW
saX/NYN6B1sdDb32hkinrKfCtqNuRU04sPZOpJzj97tE3mUCXNq6YMRlVZAMm1Feg0gWUX8kejbW
nanJV0wL5iSu11x3WeQ6PAM58tdk13HggtjnYT4vnYnODpZkGj1EOA+XhlMeKDWSxZTzpW6vnOL4
78XlRMNT/phBldUoFra2u3kmE2/IVLhDwMaYNjEZU/4lKZq/C27eZZnVZalEp4fj+Dq6bGkVwHsj
bwvOaqjyDik1ELgA3zqEvxqZ4xTjq8iukYvG9hRpSPHW2npAMeU19rj2SuX0697Y400PvGFM54vd
s/VGDJylkoRpf04ygJ3oRP1/DfhDwSpZFM7f9gtxdvp92XL8GLDrVkRITLM+nH5Us78pSUkWySKP
p3Oen4mYdAgKrrMOJilGxj21ZcYgJ0clYMPDGD71uyH9ZN1rcd9Hx/9RcpGgUZrTeRjpp/R8plMP
p74x6EvivCcwak2AClBCEKqtcHkbQIApHg1Au6Y+qStHes+6EcB8UgM6PFx6xVtIfhjxOWxARADT
te1ZPysOHjsw1JJpUkDehauJaucgydQUlU7DhbnrPXLV+u03conqisY/qnSiwrVP/5SGRKI0AO+2
jvX60qW3yvRXGFF+PiAptpfdecQRB8brE8ZSmy9pJuavMslAyBDRQmENbDugsbRfZV4b4AV4S8ov
wHko2fgWNymgpATGCzBeXfLTwWg9P0uhnhxB83FVJCSn0slDIeomy1rVIaDAD9vodML/ubBVRr4K
2HCPd68xqJpx960HncO5iKgBs3wzVoRtPpJcVKkU1tnGTx+u0o+LLIvQC8vpldDw+KsWCJga0h8R
LX1+jLjgossD6Y/zjfPgk8a8VUhB9j9Iu8wp44j3vGV7aCgZdUSP7LzhCInOA9np6HpHO7SWOm1X
Xe7dfvBGXmBSjPn8qo2V88RSbPB/bWNevMoiCV4NFVEczhuht0TKsUJ9YNo9Bb4Hi69a+P0dZEt/
eqOhdVyfGPOd9V5+tGlWUEG2x7aVrOzZ6TsBeJ32MmccLSEwsUNAA/QLVXRvMCKuPIMzfTTozikS
1lSzE4X6lL4hR46c1xuqNnIEFydH3qmxyySbQVUh4o/Jojg6LSQWBK6PBAa2AGA2PhTggZJxKEVi
BzonCiEp9t1MKoDtIRXD/oU/CApTqi6B0L5iZud/b6vhOktW9EY3erQj3ROvZRe6NJh53b+a7Agy
s/eceAbW91OQlJJ/x9MgnSCfNc5CC3vPOLc7a1T/s3bhuQHa2SjaWi5XayFNSZgC0K5c3eaSOiWC
ttfpLmSRMH/dH2bDLKA1K5f1MK5mnHNDyE9LMJxpKtXmpCvzP1l6vXj3i/m/pGbzgRTtEMl2ei+Z
U6y3RKMLh0uks7ciDq8V6d7HRJWMWnf53mZBI7FD8Cetgi5Cc44cxI7MylwOMdTnXHb4hR/++l9k
SihvGeetJL9HFJE8kjlIODvnl1soxU9ZAn8GeGayBjbUTE6i3wCFlA3H1Utfs7sUYl3/rs+1XA2l
VO6qdJRn31/y3knE5YmKAlyulT4Y5Vt8XgcDFfhughsWDHHDazOaunPknkLtUCJharezh5emOTmM
Vn2qkFsRWx2DXhGiw+VLWehNnekY3qfIsS0TP8oj4GbCaMK9mc3R8Pt4rwJSsZLhOF7xS9GrGN+G
7kAHtLhDeSFmL9BI9FNhStdTajLBHDGrtQmn82Uhn9ngGzEznq178YPfBPzydwZhKSkXgzSwUm5W
hJ+4L9IMyE7oL99B3uGCNtdrBmOVvpm8GXaH+w9WyHDTaMUleNgkDL71D5hYxVEehdW4WLmxrh31
6ncwuNyfE676By1zJwSiuc5kB4C0ZSqskUHFTTsXkn/satRaCKlJaeIm38MXww/1yNkJ9IzOlTlZ
fpNJHAdyTkKZ529vilom3F1FQuuyl812QCiXMjkg7nmx6EZCC9IcGveOlPfdUxIwJiNa7agCT2G+
kwUy70P2LhHUJ1gduzT9mhr369cgBwiUgkenubdih2NFNeE3UmVsB+NAAcphBjGA1/T1/rxkMzbF
clL1jBs/aCOgIjyKam6w/f+QMWlowOMYlsMXr6ZXp9F5D1ogOtfzpswlZVZcZEXx23/L4lFiS+rA
Iqxvq9b41y6AzKqKAgCMGJLXFZT8qYpz1Nbaq4UjRlMns3WpUpMn8zwbh8nmOYqxQwS1GyfEaMyh
pdWS4Rrb0GVQaf50ktBDldC0c7qJzXYxXLp7pxRKQmIcWez9C6ast/2n5HBtJCZDTcyX65IlKxPo
CfJHuHa47nQhIlwz8eMVsLaQk814si3EJP0qfQjzGhC0YT8sPCz1i6R/NsjPPzFGDAAkQiyZFbn4
XIfbjZ4PNjAhj2NIl6ZVzCY2b6PDY9fPNLNSRLsZpCJFyRKe1g9hGyETHI6DhXnHFjVzl9PoZGID
4Enufc26MpuV0mXJngVmPqPl5L0568RGjXDqNbXMXJjbLoV6+8HCKL7ooi8KAgDAX2jLK4DM3XLP
nu9k2QvHeYv2Qk0fXlZ+vQ3AZl0CAN25OTEBPkf/TypwNxn8qHO9xL+7/8kt9uuMc1iP66vDTIrB
YeZoNVNe/YSroT6GThgQFiWcQ9OMZhsW26y1vRk0GIoQyRPUm6Y6Knn/Y5apUJObe/0DisSAxE4f
9vV2AB+8eU0yhUiXLes2QeZwP6qTyl2kFa054f7SJW6YeqXffjxLWzG894J12h8LVDbUJ5jA4GYU
d7KwAePSDbtToNahFBMNNSTmvNY4wn/KqwEWuKftMrb7DE4iLQXIjY18XA5xXx2dqkNCLLoH6Ucu
v8gS6yzilk+sxZE/wZWDRtav2Dmz0yLL5FlzP3DFnvmXoDmZV4LJVpNisL3I6YN7R9cb7YydkroS
mZTh/uYmi3EDwg1hAwhr+oLu8gWABUTDUePvL0TOUPyq0L56WydwSLh6TE1JXwb8U3SrjpsO2y9+
HY9d8pAyskZQd4Zxm7FeE5jh22KE2A23OUQP4cES5BY39ggymoP1unfu3onfIRgxcxLdAKo6PX3F
mAczFUExooN7sVfdAE3hR+Fp2Z1MHoLZV75S6vqapzr8PSxLn/89dbZpM9pUpQJ+F2LJOD4QbOxW
CVCEpbUOES4KGZaOruofPRrtzV1Wj3lSWgL3IgQCe4BCiHCM4vQY9fji+SR9q+q9iuV4K2w83bQI
Hvj7TKeqtKw4QaP51gYkcnkaInOzyhQFONoevLQWW9qDag/rBoAtjhIEgEernmMw5DAz+Eh2rrsu
JUexA9rTHKFwd0R1jNJHLEj4os7fZKgw8DsdjtqERPDNPqHQQZFrS3+6zWzR7GXni5qs+TPF+WFN
99Kgo9SI3Kxj/ynK+tnpU5ydKNhqjA8gTKU0GE2iabq7qNwQ5mXgfVmdfMIF6g8UDvJh6Gil8irn
pQa1LruLXMd51dU/ONhCGruGa2O0yE/TWdob/+T1RLTdw1EiY+7nHT+qADKyk6PFhTgwwSwdBkO5
yDv8q8DdKXEkdOy64W7yJKk2BVxDV9G0ftceou+chkXjhERhEdre6VMsiR1G4RQlMD0/lB+Bnw/3
Z2D/Egonhyh83qleHq3oZP0Yq22qKvIdHkZikMGNPo9JBvpHu33cz+FoPWYBvPBW/nq63J8y8hKU
fWfLpI75rSFyfO4kjeWHkAueWMg/mU+DgV2TnnZ0k84U+/AcuI5X6m8MhpRqHK/LkVZcxgD7dUU6
0VaLdBHjJPD1DK9L2mjLtxtaj2N5y1eKz9AKc02UbO0OhXMUBak2ne2rSibvG8/LfdzPhi6DVOkm
nLdTqhxf7Vx6kXmkAu8yszPqxzYZ4LitHGe5tm9Th2LsiLuohEFxrqEg8z/Bt1AYwD3QVL9UKcBC
TNgm0Lq4itLH4ZnRlewRVk3dird6OaNEEF0aOYM7+FG0jrrMTKzcuLQjegrb19lbmBhJgRuvoxWu
16cKOTzcwk0Gj7wFbslXB6JJ+rL6tT2crYLzvWShiUvdhJ/LP8ecQ2HoJn0QHgIqGwbqezCkUmaX
9zwr3l7skUx3h3yVYG3OTm5m/SYryFXWdLgTTz3RV23UzsqN543khjTlLQ1O/oLkLPvweNR1rqtV
UOAMfM/nwb4XoKZpzUHbhewoXQl8o3cLBruPclc9NoPPMpofcYh5YKKged+TNJY7bUmRAO4Zmidl
NKvIlq1D6o5Kji4neGPnpNcCWmh8BhR/dxcOvxRrmduZy88lRc2rDMyWPIDeY5aftMP5TPMGNa4Q
iO2vqNhx4T85Zlj9ZOFjqZAehFxRbKYxNADiQpLCOIVjleYrl525R+RuIguxTvqcdqOrSmcW7uv9
Tw01O8d4D9nuNyx4Ct7fFhKoqYBb+ulCJZugWBhAe6xBFsk2uYRRjTdRl8nlU7E8ah7U4daUNU+N
/VjmFUKnLtjTBcFN59CL1D0KxXknP5WJFJW24Sbd3LSkTeAbDQE1svtVhbdpajRFhNay4JQDM0UV
7ytMVntwuH6jObaQqYn7Xmv/RmGmkJsp2uyzZTOho8yioM7L+TSo0L/VcWM4zuMEQhEAM7Z/5b4d
Gmu34OwyNmugDSCNtoCOIZugGdgwab3sxCy0z8yMYVVuFMfcwpiWTZ8BEsRW+FiyRk2vzNvnSj1c
7WrGuTbvNmZ+4jDFNuAb4Hw4/H11arYKPHdnBphNSIRdZKq0iQ2mSd9Volh9bsoRIhSfWP76sT2h
456rRaCjgp474b9rtP1sTfnhCOH0kuTWq4IIjAQVBXnQdBVEvP68gYGevNa5yWW6YEfcZ5pY1UDy
L+DIRwrF+AtZOm64F0lqP3mZs0ARUB7JwVnYYrDgvCYIEwi3FxXO6nBn6ebG6a5zLIvEfQHZcdk9
f4pNH/fqSyZv+sihTJdGeQWLkjjv4ELFJ4UFAXvHh6+L+ocCrSNKxigDrlVANFKKmvZL6rpkckkp
2HYyCgurRd25JctQWyVaBnId+qr6/4wRyK7KFxupqXoMjnBZ/OMiWa9Vyhq5sW9sX1KqaXX6pF8G
npVMd+4MmYfI8GHXXTovbpD2asUKm0bdbmfmofnOEhoW3iRaRMUmB0VIDBdI9aFXXwFftvnMwKKo
yHkjDphQVSyTH4z0cD0f6ckgChJIgRBr9SMraAayFlZ9yPfgnY+wSRfQQ7fMlllVtOKhM9HjiTUH
jTWPXE9o892L3mLBCTYgoL5aDbizFkhYXOS9IIXm/ok1u1xriTalt/SnXm3beaAF2lasngMRlLQI
UDVdFLKtq7HFac0KwxWM5NsU90r1h9FPPRj7WnGLWJSICLfhDS3jWiJEyWnj1ENBEgMNqBi0CDrT
4FUS8gOgGELK2nItoZe/2WoUI3rwu2VO0hubv1ZLDo4UZQ0WOPtbEUjMil1gKDiWqIl+QoLab9nm
81DcG3P+18yWGpp0OAg9aHNjvc7Dz6Bu5SBOMK8nUEVYOl06yr0t5YvWCBfpfz0voyI0p2e+dqtx
tb3DDsXGuNdv9+wa2KSY7+/JEGbdZi7RIgYhwDlVJouIQ7+B6p3YqzQyd1XpbkxuiRUPJANZDz1n
t42EQTPIJJjgyFMSUqZAUjcIkLzTvV1sEzKcWsB6CqiNj8TcztTPfAArfCy+PxAiKEtPt8hzgJFp
GxLpANobnUD9sUKnokjy9VlSgtfGjeOFVZmcTkdPm1UDddWwkDlfPkjelygf5xjHtWLkb3AwvpLF
wLqfxX5WMcs54+cpeqCsg4nlV2d55Cjs9kqGFnAvSWvsaJ5RMDLF3wijV9CX9dv45/xQwNhCpTg8
XRwSUHmCgEecpShU8giy+ajXittp8pVpkUxiJ68HqstfTVThPS5qFly619G4epTNwW6xTcjsv3O9
6iCXBJqUQ1hbwwZOT4bLTWrBj0M055m3kTCPgZrqGP1ZeA6LwCEeu++L1dGGjhQWHnMLWpbmgkfO
uIn1iDmu+rMzRL5z5o6QQ9jbcGuVvJZ/1Aqy0MMIZQOV///cwnbcheuCRrb0g0SVt5dPdv/I1mrD
qFToYt1UhrFw48Lu39IUpSS4CJvZJvT4KrnriTXfbb2FSRpUIjLLF+w/vPKhexwBKZhSCwIamoWt
FZoaHAWYqKz4G5ES/HOTnJWhnnLCfnqoakXbOlM+8+J18QN0PMtQSCQsNKk+gvdB57tlv7MZQPB0
6s30lvCnqMWpIMP77t4oitYa23cnPIavILteMkrbHUiqhnqz0OwmrUyTNvToT1SE3yhAYT0LnW9/
N18S+j1cObm3uFVa5hP5VXISORnJC0LGbO9Sh4VZKTnYovoSRrFW1XOZZsWBBrfexLhRiOu+n+aF
U90ppTb1YB8P09i1fZPN5X2mxiN7QyuKNCh8IO8YcbiePvhJPsI4xkBzIjDqwhXkQMKLTMoDJQTD
7G/2MRRy9jIwvD7aoIdL0LZAz6D3hFT81QAVUjKZnTjT2wBuXA4nYGq6l/X0e5Zx5pmDP7vATKow
hWDqXalL7kChNBgzKw2Gwh3G3bSBGqv2pB8+2lfhyp7Xkv3oC10k4lPixYI7nEgdTaMArn6k0VK/
ZJuAJDBYrYsa9iCyjlyN+PMCHFqhxWb7X0c9z3BI29BpDOPNZLWAza/G2ZK9xjGI9GuBQs9K2lOf
EKBD33bl/9LotgzJ8S4QJebK5+ZGLlftLfmtOgwvAmgmhrYQOckulzmyIP8Td5OsPIh/uoD9ge8P
NRX7ZMFHXhmE8G15DH8DGRYoLSSZBQzInTHkDIylZkLx+uB/vVv7BSjcKMd178lDmv9IUeX4QPBG
D4w+cpmdZZmFSlcyUdRk0BYPMg6xVzmY1/v8M9r0Wr6GpmWxlGWtX9TSueMnP+hCsI2cvqcxX57W
InQNfCzg+KZY4YrZSBihvzRCrBOlnNdnC4zwUFxSxx8PHvhTCFAR+6kEdRLy96z7puOlxHgEN7vo
yRrSIs83LJsft0F1H8RaCk8CzfHogFu1w1viS41ERxDLrdFtfzx1rIRGTi7Yoijg2fI3JhBPJNnI
lLalmMAbvM4QQh+jsC2hC2i0g8dJi6DorTN/TfKlZODGZu9N/n5lGLXdoboqPd01SIh7rRwqm603
E5GOTr6Qx/T/4wrgBAqYKEDjCwe5h/iniwXV0TwF6YNAYSqCBTkQ+JGYyddIfGlj+tXc1A5M/1IB
puivVaVdDV6R5dm58UclWhIBW4LHStTL0lOK9Fb0jeaUM/HfIXzc4dPDywZ5RdukaJrv11ORuzp4
TzL7g54jf/RmeVOPFo+KwAzIbwtZyRfhy8mk9hlHXUGQLXHZ1rfp7UDDiXCX34VOLzr4LMRj3CZc
9EPY4tzbW4LLYw0EBbhGBhJZCvNE79sk1SS7fgKIPaRzthA+eHBKbEPePZiCLzgXDNDh4CREMPO8
FgnwYGzt819u9DlSFtNMIKxVfnuCAi1XxEL7eAWHQ8ZizaDDzpKJQbcpMNTE516Kpbh+49FywdnI
6s/JExaVVCN3EzjCX/66h/MQpDByqlze/am+qlniGWu0KMeagIZ+Owc6Ahq50FhXpdNyO2WIhy1n
ge2bxnJmEoW4p+P7JLwRZUhvW01A4s6gTqSoQUKV0eYWhuDm5imL55DMH32oRJLilm54CjveFH/2
TN9LwKEhru6HymWWiOPtebYf0UTGtWDtAGWAUm1KFnThAFxGaxho1/bzFWmOaifGt5i242LG2TAg
Cr7lzIzSsD7DS85YZ0mCNZ4EtCvEuAA/cOlhOd1iaV08Aej9lcu+SLsE9wvBUo8c22CPmfXzw7z9
bUWhTxImrvZVJ2jvFsXbJtU5U0kpqOOp9bPyZz7gNPfs1MvEgWsokG/gmoBNLmruPaJlnEolLx8w
FzX523+9KqQAu2HvH/LWD0kkiaZ7HCWO7pUXRyMOnzSkREmPS/lH5WLaFxkjWuz8+XnFYlp7Yeey
ss0qRDR1kQFZloewJEK7NhTmPrim2Hi03zeIm134i3CTqK4PuTfCeT5bUZEZzH14eCPV2OkzYSwo
2jsGYN83iJ188lTW+iAlR0TObtSeA1Nd7YyD0flHQuEJQiuiFF37+H1Cosbf7GiOi3jBvEfLqoRC
i7K4ooNwFB1cHOqlwf5s+QpixWRxdhXPAsmmOfpVbYYXJ2xbpIE/77E4Jyfny8Y6H0WYMOZQ/yTT
edyfpJIeQehxJisWimfEUmAXjpRA318fd4Sr2CFiSkZHcNvc4K86LtdZCSwlCkJscnvA1edCrpbZ
vaSshBAcAdq3mpnaP6W0DZ9oO2G1M3eqGO/Jb3IPuuxVXrnFTLl/VbEPqOO6B1z7bv6RW8mavIto
+Vr1/vcMo9pMXWQDcIq4egUbX7jU7NDRBh6VX6lGYQ7BqrKzvDUTZHwFcDcCPB1n4v79pohw/CvK
K2SzBP42dN7OyysTW+RWopvIjznCl4o2tuS91y7+9Nr3HAbp6aVm0K4Ox3DiJhP7mqnour5ep9ag
8qmXe7FSy5fz95GRoieU9LtTwMyPQxBlXN1qA+m+oP3Cu2cEk0sYf6P4kepQV71vaQnWTUajeAqY
sTk6qZmnc7f9ZhE8GmdBwf/EbwhJEsbZMe68nFi1MUvJtyAo9cGqdbydIdVmGnOpgRW1wUZsENDt
2Pmjch+Qk+PHBW15EhUf0jT3BQln1gDfntNNhtxiWJ63LQlssRLgIyCxFZ0WtSGE+JhjLpbhpzNE
tEvPNGEZyvs3iOeweE0engHUvDwIvGZsTDSzRmo4qiV/IEsNKj7fE7HbHMMo5l2M/IiirZE1h+vh
qM/oqjKk4mkNsLYNWnZs5VP867CFJOcD1Rw7MscRt/OVzoHCaGtN1t3aWmduUR/NzSm6gUbRExV1
McmslCYvB1MYnt2ZdGw1bPISjuaHY+p/fkIiHOUgE3ysIsrdUTzxhsELCjgumAageZTjMc57QCTj
HVXgjq2G6QqFNnt2QonX7KKY2VoIzQOxnAxQnUIbMOIv+LWZ2y70mS0Ent5ZpJAj+8ul4Zig38oE
iKYBAR87SFtbE9Gyh2cXVzllRXR4e10tqS67BiD8TihOPeXhXlpAmWpxKnAp6/UB6ht1T1pE3SE+
bH4VSaTsA+/5Clu3qnKs6dd2P6KP0U21M80s0wrqU3m8uV3qko3U7hBNy/JIv+aUvpVwqq8hFJci
CNvSzeWDY2JJwE8eO1nx8FzbHqaI9gDmSHAFp0bqi1cHWFf/5LeU5QnmxUG6pizJlAaI3ttAHD5V
bpgqlUusmqWXrhddYHJYWdKtvw/YkJUS9IbxjCHQEhfeLIBLh0xsoc3gbZXJPhAwYWNCaT/TYw92
fE4gzCgDawOSjgwlm5tq94C5DsBsn+B9uWp8tVfSpP7BY3D/I7yCNMpIMPZTjOkBpZMIHyj+La1D
bBsLFn74siJTRrPARZTeqZbNVqSD/TDlnX/QIB385eDwl3MM+NPane35YQt6ERi4+wfTW2P6tFTc
3MRq4qC6nAfibBWPR/Io6vP18Qupn9A+TGIwDYW/uAP2y/eI4IjePGSGHjUxNoM45bc6rZAVnjEs
2MOMfvqGYlvBM7UqY4UiAG3O2fKGnUgazxqMUCwkpLt9na98vLelhdQbDR+PGQyyl42abxQ8id92
812s6s6gvpY6qGPPaUbD2DpmYyV1wVicGUjYXkaZ5ft5g+IWrasSaruRyWJdRLLPWP2VO2a6Y+yJ
Nf6ImJT0gv62/5x4ggZNUIxAHZLWtRfPegYNtl2O3BkE/QAP3kqyzX/uBAHGtHa6eeCu/g1k002o
sSv7y0FdXiJVrPj+2vXOcSCtFF631sO+upxbiG20wL5/Vhyg2EVIoqlhbM7OSoe2fdCiQfqaeNDq
1gl2DYlmCtwvD+UPLteJQU03kjHNU0EbVZ3QG50STi0HfdhJ7AFqtGcM3k0o5+fB06J+72wBtMGd
3Hq/kbYWwbf00/6px7hDcmpFmxt1pK6ZAz6cYA84R362tTlQuw9UQhUASSW4KvboAEv2Y5T2lScq
RnRng9JPikun4cWI4LtjfFcJ5Q3seAMTEW9fVGiZx3t6T9YoN6lY17ri+xXWag1e0xdy8YzwOZVe
nSl+7abWBq/2nx8UhLpE8qvTolkSrcCJAUROkDQimnp2Kq/KSeRtRFcp90heU4zckOIcOSGCGZOo
XaHkPhCBv6oUdfzGrE8oAk5XlNIH0oZUnMGX7yjCGpI45d66uwo/007ApZX+P5xG2h5xXvLO/iPE
Qib8NeASDuvVeoTf0o82acZano6EyGWu5VpAr78DILgAXI7k5hcxUlI2tBHZtwNgGdILBnQE895d
QwRwyL3zeu9a9kWaHreMZpK3HHEcDR8zTwlKE/md3FoCD5ODgtsNM5FzY4YMiR6VScMq5UAzWhp4
kuNAn4RRcMeTDA8tgGOnUDcUYcdtjFlxC+d5WR9hZ/PkP8wohy5RVnU8gBPOsw0UgLwKCswgZ/CA
9PGbWSfTg1TGzRVlLDiSn2i4frOE8Oms9F1Abl3BEgquMOydXTRROZQFQ9KGL2Ik/dR93JLPX/aZ
Y2XUEysI6O0umT5dRG6i/Yi57PlXWiL25/DGwi+N1wR0rimlM0c02kurfYRkxcl8893hEKhLAXcl
IM8UGhA1xpZvt/6QpjpfL2xQOJ4bBCWGvVbP0WW5Ca2bT2S2zKry5mgLFXzjqCX7vScCrAaIKWDv
su/RVKbqSdSUOe47j9GoBL4OtZxJ5B5TvqI6tCpInlQZ2whw/n7tAeCQAnEaO75Xl3JE06ZcGyHH
5rrTGRyJZ36TQawUlPFEaivDAYu+1tR/CNoT6PyKLCTPE3NQ2yhcA2E4twFQdyFOH6kNth4mr3nf
WJ/wtrN14owTfQZYJAzgKE9+Gal7rTBtmoJTZH5PM8f45jvLTYw05oDAuf795pYjzV6yLN1aEu3/
6ojomfODKliW1p1WpreJqmEIjtCPG+/c5z4ikO0UdfEaBBq0OCVcFJ2DCFYPhxRwsBp9gzJTUaXs
JtN5RGLSTOly5fdhrj/nl4UqIWfoIY+bgUhe+3v3hufXrHN12ghwAMXtWJOQFkRgO+F8PxGvk+XS
MVQ3ebckoKaK5rS9drmOjbrCWkbtHYEx0UWVEoy5uDwqrxn/ZfNqM+3c1QlUor2rBY0gPO+Rq6A9
ShO6Kl1YKcIAHfBu2cvShHUsL2If1XuyB5qoBmyM4hGfd3yui36eQQXeoo/0Ln3U9N+n5+Bcw8Gs
Xjapzz2D3/3H3YK6wgKMyZOCZjCb/HH4kPJnHxEhHYQddcma0/WZr3WolrDBcVhqYbryW3HioadI
+zpRbMOasj6R3KzL9oNS/TgAwJy21lj+csjxAhBLnqg0tG+pSbKAwCJ9O41X5YtP3UM5Unp5W7tw
Ozk+60QoQFfeUP9Qi5VoYY5aDZ+7/87HDPGDcYURl8KEcobbwUDN/KdPCV75KpMAWMtRHVQ2QbtX
E3di/Lgz41nEbDtr6592Vc6Z9IVHQfN5Vyxd6BRde7FS4g94tKH4Q5rVr8QipOOMDVPu3x600Jcz
YpWRCwYdS5lS2RXb0Bvi8jtRixARsba1yf2KY4OBXeWp7jIPw2437l544B8nSglDP1vKej4CS8gJ
g34NRapYPwJO/s66RILdDX6qvh/IGBAc/MGkZck8r27Yw04CReW+TuCcPvt0mihzxSsKyIywaNwK
IxB64xJiNJuYxo1WkHzvb+lFHo92DpKtrkwSyFX6/hIBSbJ3Cqlvq/yHyy4TdPP11XQGh7DXn9Jn
0WTvsAYwPYvvwc1lSGMYBMiyrv5JghvjWrVuYdAq8xDOlcW5XSvPlRTjB9mqdSovIZbgF+M50ucf
SvovPOnUUxAEBPcFeZxhURQjylaDbQK7tpPT2fXn2a7b+SO1EVTzhLwe0Gx2vu02n63qFC09zEPu
AhUGjxPNRGAkTjEbQ2ZrOdAzuG0yv06GfMms9ANWTgL075jaME/JbZlhl2JGkBmz2zSgI5uZSB4i
UwmRb8Ohw8Jq4xp19ciCnFNzknNBHAFl80nYV2wbZf3TfXXYOEkAu0q1OuJRhKMJsnOL1sKpowtH
iYKyOu9SIRXaOcOic8zuz9CQUi9OMp1INErMLafcblhKxRp6WEhcdkSIC7nhzLyXfQNp7y5TE97O
IRdjKyQ5ze+RG6XMYeLfyuEOa6NVmImkut6uZx01Nv9509XsYmJTLMhtGEEwOcaNB3ow4Vwwl4sr
1vNU/chDbER10THFRAK2j2+USl5BWWcUBZe/lhQVyR0pzMH+jZTvQmsc5q4wlYoD1zQVSmzC6cdW
BR67PkiEqhBxDo2bIV8M6cup+lAhoOxhWHOhUeR+fFdMCCoewYdtEC9fBPC3ibaLA8niUOkn/6/G
ZuIX3y4q7Iv4x2BccpPX9E83XaGiOJyAc6B+ocd8kNqLsGENmCpp9VlDMbEMN+7uoUAPttmdGmAl
Vbc7UOZYdCVNbrpIzQit64+Mx/L4ClR/kILKFIxMjTJZ/3amO9AcqOVyEtor69DrUA+reUd15rDF
kDZEKd24cWukx0F+fu3cnqUmnrmQLBW4WCfzugANlURQQhWal11vjovhdveH8wTRZmUXUGvdRBLF
w1P5Y9ScVfthG82l2/egkZlL97bfKdACpmwv1WCEjMqpYbIEFtblUDnLU+l95uDlcKks1OnK5TSZ
hpjs35Ibbmk7tEndRvFeIEKjPeSbRr3J/GFYDk4SaB6TUx6SRtFP/KtNGgUxLxs1THgSvv2QRTWG
2leU4JA+FszWEJdiliiak2aPdVHzMiQJjbqDRoIddN9Xjhy48z+NQju9/1GyucIaBDXcVRuWvqXh
yBbQgTbyUd6QOtOQJYLUg/auguI5vc3ZMWyZK6G6QWmBXcsqzVrX8Hy9utTuK2K6vC2gB4gHLm8P
q7ZqSXCuXk65C2+SGILKZGASqDnxmG1Iue9zQYPQCVMghb17YtfggVyLmK0hEQn8L989sJxfyyA2
knO4vMH5Fesz/w3tkL4JOw02clvP8MYoX7n/lE3yOLLYbvcU2FKDckqfIlEdu+aRQv+sJ6QoDFJr
73/WgsA0f9b3WUBZtBWoGJHVSiNbz00JTHuUXu+XDgNk/4rYI1g7WvY/fTqPbRAUZ1o0YpiXKvxm
54iRkb9KjpAWyh9RQ8aIxJ4SXboXvZfojuvzsSfQPvYs6+Cmd6p1y//1MrWWpBIujYo9J7RALwyM
fS3SN7JZ04R3cKrdhsJj7oBjlJvELTNvdvRLInNaWxiD6th2csKZEPWOihXtZLP38azwhdPvcIFC
qfptfMkCgTQnt041S8JFRQPE/x/RqS8stZwU/501TMQq3RPukQeSB+NAYlAQxabK2KgBbhXxy3Za
YfBi6b+wArucUskwOBKNVhL7jHL976bfQQSA2crYWZbkuLq8nfuST1pIEZRFhHh5PT/njhhPnq22
p7BS23G1JhXijvuihV2CwykkvJrGMqxaIRpzH65S/fj5I7EoCCg39qjKYSuAYQutRFXFXLUOaONa
HrW8OD1m7xtzTdMI87rcWjI6WQAtAmAnsQ0G0CZ79L/uQz9F3vCDoLpa3RSKPZANcbBXt/XZ1P9W
EVogUkauAbQI9irXUVe4qbJM5Zv6qXVaCEdXHju+C0QIpGdQie2YUm8DwG3RMnQ+4L0jTqZ6AdQH
pUqu4DJGAiOpPypA58XfZeR2fTLdCzMnvjyTb9/RQvCY3e7X+PEqEbOf+z+2SLZnpi5RFJwpSu0M
yHJeY2p1hHaP2P67WXlT+WaYtXKq+yU0Garkv0tUX1GeSY5mVq+t6sUEFr/Dz76MzRb5yPfilCme
mQyLH+qUqMlKBkxUv0tbodQRGBaim/0W6In5ANHXFyO3oB2UCWIT7Bn3jk3YgsgyCP46dJ3yhEJr
xKZpl8UKBWxdXYovyHyGgLmnUJtQmy4aj0lQ34WbebZ+SavfjORuX9U8oxsO6aFcNohYxB6yVyXS
PZjLQowkbiaWzFRPqZoTX2Om4dh08WKwz0msYgRy2/OuV9Ei4Qjd5q4679ozrgeAMkQ8SE/Aevmc
K7nRy2+TB5pRWbebPqhE8JQvkFl9wNKguk9xvGweAmH4IcM4/skoXGKWIv6sTFc97/aoYtet5A7V
9VWC+u0deeCXxMaIUN8gGyd0iGz+4UeLis1wE9AWCiaUthDFGyUUAOf1Hm+Nn0lHC6yroDT4vCI4
RrJAzEZ8XGjiA7RdFGNrwZREr489zcm6mNqx8U6101XMqA3WwiEQlSWl22196TE5sRy16F12WMeK
wtJdPHFnAwpL6oTwSY5Gbo23zpfdcYedRcNpQIieyylvk81jvhIk9D6MQs7Eu8mqN+KDkNvWJXW8
LBkopbjGMqgeJSwJW/A9Azxbb1dgjsKObuObd1ak3LL9cDcaFryCvwEik0XzftpBRBokFV+Xlm3Y
gAbazz+b9s69dFYi6/RuhEK570NzuH5loTZTXIEB/SssII0r7fY43lfwsT23RD+/e5sy8CuEh335
0H6Y5udmsaEvq+KdcHpB2qrzxHgtwcYC3uax0ZCT70fkIYWTegs/92zsYRy00JzgHLpnB1scww3L
cL1+AJ94o1O0D7Xqr79WFmPYK6bQSPAL1Nf1skbscNpZL/7vu8z9938mfEdKcyLb3Ep3IQh7IYry
x98IPK24f8DgbNcDQhny+cvZ8kCyi3jWRxLw+Dsi4F9jKkXIy13q7pIlEEW+qhzjNz/pnAlZYRyN
yidVdIXhi1kRFGzdr9eOrsanat4Adnz54kscoVEkAlHZO5NK6j0Xz/vj3OqL6Lpp1yVpzA8B3uoe
m5aT2QejAf/5U9u0AtfeKGrocZbupmUadOy1jqHgEjHeL79FvAX0KWWowSlx7Hslo8S0xxoTw5vB
wl7Ah9lYKbyC9LwGu7Mk3K9/skTWFi/oZ0zQiwXrsw1FgBqvP/kFwWveeFSXIGIdWpiUKmWBrJ3u
beHKW1AGv5YIpFfUNbrZViOKMqsrktNc/x2rdas96bWxq1eiHWso0AJwRWdpKNNkwMV1iw6ricBp
1Yap7+4vE/Rlbd44HAaFYgkp0guCKOIoBameKUpxLmQF/7AFN3A2MgTjr4W13SkKkWmyUsISL8di
NdBiw81UI0fDBTRUKys2o3QixMc1GD4lPxmPF37nHdM7L+tVGO+5Ph+M87x0VLv0yHfAcKWBVTgK
TTAJ6nr4bZhA71V662keu98LswJ4yvnRwyUYHPbebH7LyGttedoQSZ4WmHpwkzPV8+G490BdNnmU
HV2ggJXSe1ZVEMm0VLOBfdgIih6e1V2BZnit7PuXUcon65ZTuEDZiFWq3eW/gBSQUAG3i58JjD9L
tC1SCtZjdywUot1dzisSE6MBd1CUV76Vy7t5F/cl1KDBljHc7RHPbQOhUN+3IaRJZnEEg93wivwx
hRyKOrvPHbDHglLZanapo67FP68FKr61x04IkLmbYoeP/1E144D+XXP6gJhilU2R6aBFO+JseJUI
3qvsxHTYPB/JlcYx3N7j+3JeJoQ4BcvOe7sVOIysV2vgjbNAHhwq7zJtKwp1hjqG56LEIg+7A3iN
vIAV3kLSAiI4ZoUgb/ycPgsQ3zIfoKRhi/f2iiLRSDzda1vnlJ6nzMRebQImRhE6bvWNs9PxcIY/
9xa7I00Leer2HP/8T412a2H3upEuOOHd7oNK/VM+iaHmiYL1b4JzGZHoqo+4YjD9qj/Vs/Q5bnmK
y//AjJLkTWgBhc6hHsyW+CrwNME6qraoFXWweqsSB00S63Aq+lh8HeFlWo5Ri22MDuZ3FVSf5lJE
z8atDP8hqHELYBwhkIOIv53RXQOVDImyeeuDg3/t+fSTe/5j4iFARKLBJxi7+B18mn/3Us7icebu
cOJfolQFdgiyFTNyLpGkFtZyAr4DG9mml0JNgYfzZWRmJVUCPf/wUITm3v0n9mhOnEP4dkSxNuuN
D0Xhaq7YhIhfdDV6Bj2bQj30LLmiaa6h4mQarIUh/9nwqJChXd4GZlOFIBQtjJLLBHg74vQjKTvV
Kx3Wx+yx+5LZk4pNIxsfwe5bzrxtu833MxxSdbnTual4JzWBUiXCj1xyjCOFP6YCldKfAe8Rmcim
odpyKM0H0nHti51PrkAIzX3ssGFObkrPUAk+W9trafwDw10VNpn1bfNkXBQQKdNORjWyS6pfETL7
Hle+BESVBFn6wsy43GrvoPsVjRislW8EkWGaonL5PzGLBJdgH6k9GNPS9eqxqfOfTe20UhxQHI7S
wLpzEhPAxqr8jk8+2uOWMmhodVrStAVeo7PZjGXGm/cLL3/nIuTOi4zTIHqR/jdfr52sQuFYHhL8
+UkD6jpAqgVDmiL5kX0En0Lk+IJhOplXVbVZ6f/OfLnML0tzfbQS1AdjNfPmzJr9lEew4lVgwJ5W
GD+Y+BHrHLlgMbLIZ3pm542upy2TtTB+kiLGll/dDcnfW2eA6o4yIB2ECWMd7YOdtXkmliuz2D61
Bk5XYZyKu7D364sB3At3HmcP1PmLwICDwzyHkgX28jg8/45M6xn2cG3/a7DGeSLGIPVYo9Dbtgvr
ThH5z6qzjSvOzeBwEIhNnpvTe1LrfEc3C3TgQw3hCUE6fbPRlyYCSMSuZOFiDmjAABf/JboRFjzb
nKvAp1lLUcrCX3Mq5HaI9sWmybCyIsTt6dj05j/YdYz+CCRiOecIxwWv5HkqyYxJslLP95HpPf3+
ALZZ3piWSmMGrg/WvPHgBjmw0kPb4MiC7qDfQOagslmMIPF7NQp2CNJjLUud5Jrzi+VvEqcyzr43
vAXkAuqzp3wyd9Exfo4xkv1xR42spDCInMRM2PGZDycxXJEDkO6U95nr3xpxD7syG8AjPhjszZ1V
UzYQZlnkb5h4ts89DaWLUn9krRNYBkesDtKyAm8emSj6iS0c5GBP7OMOHF+/cDFTaGOlic4Z4/j8
TA+mUtk8OurapxPeJUwSy1CM7Z97w6bDJ5SrCAvEqOeOIXMU8/0ZvHDVIUTAEadpLjs7jsfv5ew3
7WMyty4TO07KFd0z6dfx34SywhD8RIz/2WGmIm0URiLO1dWiSot4w382IZ5ldL1Pxtym/GUfW7Ud
4BJvXzc1Py3aM2X46Am5gY9etWg9yMCYZJEEIIJPOiVNKBsSDXAHlbVlBWhL1j3VfqjwY5M9jihT
8Eq7jv87jwgCV1xpQS3qDCd+ib56ajXn21yG7gdVuAHKsYPMPPhpWY8/3AGRdP8i8dUg9kXqwtTA
lACcHrfOm2tOV2NljFQ6sHC3pNxrNb39gK4z+Udpgy7AzjwavdkGAd5Oy2euE53FfhHHUTSGYLXF
1G+5/liXTfg/rJwKKFrZwBGp6KhpW1gPtQDu+nx608YlQ2qYJVMqmHVF73sBUrQ5uK/5AhU+Gt5t
c75IjBA53tHCdcD86lb9Ttjlcjquxk4B+5L8mjQmUiE9/+AGwH4+lM/gwcj3iYRc8PlGzXp/i5jA
cP2HNeOHC6AyDfnxeHPgUhlX7Hri3Bljrsld56ehQYliuN3X3cb66afPn1gmDc+JzJOkxZHdYHnK
w6GIOotpJIidW4Be/NmGxebHlNIFFNFUwGP0WVqt36K+kJoUhiS+JUbbHUcqV8CjQGVC+LMtLqF8
Iqhc55RupJkzCTdS4j9ZvyVzL11Jzbo/yiQB5/J6ykUBzcoNXy0Q71poiv8YygISOZ3yU7Y2tZeE
G3xQXbKbN6+C5CAf+Ir7aklsFA3OWBRbpCYYfOopm3IKuDnzRkzz0SnWBS2qxwxc+f0CL65EwtsW
3UC8mHMSiWPm6F0u69raJozVQ2DBxIBoGZhOjfTe+RrLaiWhLBqZ5bk7OZBcTdZNQ3jvrnn4YK2e
AJrtDvPbUKHcIWckWueeT4IOo8EOFMtR0rONEzogZ1nTA8bUPac/HZDCEDLa/jYccKMnOXcL02QQ
kvnUbR4D3BdYaXc2L5rKbaIB1KC8hR5UvElRCVy62lXmyandgLQ12KHsQRpMRPl/QLlbnz6g6MdN
E/gOmLBXCEIs4o2PCHzaPn+b8mEX6MDZ5135ShIb8JRmd7yj2g8igvAi8p61I0xRVu3tk/2svj7v
kB/5IOXXStJGp3ALzDA87GiWJu2C3/2WT3manf0yGHjkItKti3POO+3xiq/8Of+EJhEtAdp8TjVH
GpAw82SsH4zJbP7Z8/50AzmTteZbAPlmaWGQBHbq+/yV1/3PvXpj4516pZ2j485ppqUJBoi6c9d7
ApiV0Iu1i+DpX4yQwbvTfVIdUQeIzWieUO3j+2Tz+QLYxj/yVFMWpop9TnwY5QSxVoqfprPMyRL+
NYvVmi8d/cBB86exR+/SfTH2EgztSpzcWsneMkiHAZE4d68F4eF2jjEQ69PXD3B5y6BFxm/0pvE/
dIAk5tvsj7wPpLEHL/vSt9vQgzWfh1Diqrpg9hfOu60xTiKURKclwCP/wkMESPGwhOa0fATJvMMV
sqbjGZa/7JBtwzFU6+R38h2iYpvZJ70flO++/d/oZaWoUVFzWhEFmql7AamnznXZtXEdg5DF5I4L
6wXCMr343aRyTNpgRVrgd1NL7HtWlBc1CGinsbirJpl7q8fIgQfmcFVmnimnQWUYcLqBwXwtwS+5
a4/c1tepbIPClfD7FjVyMIsaF0qbQpooN3/WX39/jl7jnMFHHCkIlmL8zoThxgpTfKvIe0SD+KgK
pUDWYfutqUhXHkuY+fCbiJDHcXn4j8bfNpBuCavMWJvNJr+5qo3UT/K5PVeUxANKUOd5H7euDtKo
g38ThESicDwhCIYX3uHZzuhZg3dsExdVzrnXfcmgAF0DEP7SokCeSClM6UQ8eQ1h2qeawlD7pD2d
YmVOURBPcMzmTIv7xFQgmZK7NmMuzkARfJGqctGRGbsM6a23xta31gP/qNx7EB3uBD+7VGb0WvXl
iLqN/pI02mwdodqB+64QVXtfHQjdfuNuaMXyAWUzLLKs5mknk3Nz1hm1K75AcpUBzt5MOQRNIvNz
TZ10tZVKsfrguepDs/B6LuomwDmAanQ12qQDd5lLTcugim/fQPmriC1YyD7tBjahK/EN8Q3Ts8Ad
2PWeEuEfefa0f8b9luIfBmHH5JEyQbxtybZVL3BYrIgolA6+HYFD4l4cmA+7o7Op/raWYMU9uH2T
Jvpp0f4Uogxci5qkMSYNfSWWyTTMmMmMIwpD0/xL/5oT8Eb50zr0sN7Dl7557Cv0Ru8sza/fD4kJ
OzkYjFWU6v13vTBAXF1QgnhtZfPwpxRNngX90mXjY0SIgbji9PvYf/i2Zni0ed5EWCebKA5Olqxg
EghWynjJL3QcHRJA82LRzxT/Jj8t/MvUPx+sjNPA2Z7VxHJofumJA51SZCm79wcMt3RVG3mncoct
CAgm2JcxcDGjfsJy2EUy8fmtG93EhLR49aJmvNWLHOwYTykosFNE9CN3MMQZCcayzCKaCQVVZlHv
qNxeKV1Y+2FTqxezaLOzolHpEQwtYt/WsJgIswVRNDbshMuZrHSa3NGcsyFsb/D9jlIeR120zI9K
b8/GVzjqHYed+Pidr4MLBYVk2DhxOku0XV0LhyoKEIVpWIVv2NcRGRkXPaCkaiceGEZjVBuaDbTQ
xjkma/fPHfx0LrwgpIOqmAI71L80K+DGVB9zsMtiSdcSDLwM44l0uoaaIDKAs4F0RVB27muXRH7z
QzbVqSrh4GwReDI1+GO3MqT1xLYW1ZurawfxwzbIiJMdQM8m4hpjzmzDstDpvASDU6Vhms2CZeni
CZRjHaN/M8xPqKyYhdqtlKTDLt0S5k9ZpTODbwskOCssAI8RZhS3dqccHDsFjByPoxb9mgVkJOLA
OEm2+ZyC7tW8Ie28HGhUjhfHIzNzwoXw8JDKMxUQzvfiDV7faT7bZN2h1TYqJvj9Xsf0nu1uydqk
OEiblMRW1QdZbetgRm5Ah0XgGUz6p6F+rO+B9FTlQDfcGdA024/S3JjXnAEdrkZkd85atOUhLW9V
s5FeHVaQFDr3YzgFhdy/MQ5tIdkI/jqmXFjg16ukVrv2g5l8JDqCtQGJkpKBuy/d6MpqMnAda88s
Qzs8lNC5kUGaF4qeN/BOlAZ3B7O2CPIJZs6JUbxxChMC+7gEhTTWjMfFhYBbZ8ZG7s5AGZvyEWzH
6tbV+do1nv4tSs6GYo5Ae1+5GkxUvwEVPNmEVYgL6xSbXMsXL90Htjgi6G9KZgC/9/yat9c+C1UH
JKLWco86xC4ugf3CfNMLK/CfhHS9wVuS0PNZaXxAgnFLlgy8SSn6cwAJRz7slnIJ2Kd6ul5+hXzt
Hh7gRS8cGYgsIkyl5cxKHnz1tz2IHF3PyH9dKId6IXl4ZXLbg/gJaLqgN/MDOg9r5x3BaF9e5XkW
tALE4cbaynkOCn8Vmd6CcypEinIRqpgjsnI0K/TN06N7zS2PdePfb6vyrE1g4WplwY8ltr9y5O88
l23xlKf10Tf+pv3CdSsesUA980uYOY6gSEabmNadih8pDhwd82UPBn6vEFOTIBgD/MWt0wVyLd5h
nh3bM8oePCT0/fmc0HxWDrRqS6f/KeDVvig3ghbKnvOQZlSC/288yAe8L2CWgXsCEX+LHZgy9sYE
9PojyWXGiMPqixWdaCjGx1Vsk/25Ee5MYW7KsefqDigOVd6oNDcuj1SYmczK0HzYEvtvWEOUoy2s
O4FxjitEL6xCqzQlKJ/NXPDQ/X4OuhKDVsXsWTGP1IWzOAkLALK1sOggmphcioZZlXOFemz35V+p
RMTOMGnvkk0MJ5cKtnlqJvySWSLDPIIM8s3bUVpNnP0COy59JL+in7KXYVO/MGscP+dxqUEf87WP
mdbQyHCldHJfgs29q2SbLyCxIVQFH4n2jOydOWeY2N147PndbDDiomn52ktoS9xJlhUqscnM6IZy
x/QjCLo3MkSk6H7RjUXssfCh9coYsPhcq4/C9GSlKbmTx4pgj5VuRRjoFJvXM9V6bX8VNZsqR44D
sBNEzXCKq8+LpYsyf6oVKifoogAGyWs9xp/47jbJVzAMgeHEg8m7dn6gFxhwr4cNNXbU+K7TZjBh
YxL8rE+euWPkK1943GBk1gmSoTR8WqWtbRMT4NvIh8ePNQj+f029gy3xceYnmHoxbnWvmLIPr5av
RogDq4vrEbQq+7egi71FLDcev2LI514pXQgj0ir2Zd+b5eI1WP0yhYsp6s+OL05P+baX8/uDqatG
cMV/YRAV+LLTZ4HMKrQvLgaZYWrf/A0iCLCyEop5WuYiuxGpAOdqWzadJXcUDtpfm5RazX3kVMPv
4aHhvWer+ASSPlyEB662bGXQzI3YbffNefeXgddh9jpeRYznImcWTUYJgPxp1k4pYmivZhKgwZH7
zETtI2J6bp0D126v7BOGcJ21NZwiW1wJpRBeF3WyZbpFlmP9dZaUb45hWmzVeko8fFtngnwO5Cdo
lfvdKhk4XoTOXy9430L0+E4eJmyzrpBdwQ51JObq8inNPdJ+qIXemKQpt3ngOhvLs5aUpMCjOuFt
vfqzhRAhXCeX+oQOPHJViuI9JQW6A1KeASq6zy/1Q+6/WqitweshsuDggxTjpl/tQNgqiYDiz0y2
CyaZv0mFQXPAUAtFeIp7itP91HX/ZE/leklLv+cOhMKAQAv4k/krIz2wHHxCFzpUNYYQa5k6Wkpp
5+aNjGK5PksglJ5rGomyqf4ydLRd8yQC+TE1fw6gXarxH0rbCBsw+ycstq5U+4ATwJ/swsncsMkD
dRtWwkoZBaPgBgPUfUBzEsAJzb5J5zHNaCw65qSnDtTUEEKtsLVKdg7U/nIgJgHKLCYvDxnfOSZM
PO+ktQtD6eAOBggfdp6M3M1gTpyJWQKHqDioTZi3phss42uh1uGsKJkbOeNDSkCBL2r2wygqvxMH
xuR25ekbEgOthzDgrD/kXSFTjGme44Np+hZWUMIsuof+sPkmRuRPjFFrCrV/usY5YOrlGO97MXRf
thB4s9LFw6Jto8mSCtebOPVVNN8F4hFBH0mvFXizYqDrjlAbiM/X6jp4UGSulu86sW+d/Yi2P5J5
ZP/4VNXm//HkCo6L5xeCXSmWcqu5OIhN/Ly1tJ686Tgam+3X3w2bCELr+Ppz+XDNLtaLajCqyo37
fdLZUq8xCci4ZCADMX3X8ncwhyO1/7lKgJsYAZ1scgxBrJb5VWpbfXkmnGVpzPt42ZNHyOcxYUwl
himPpWC1FJA9rdPSx9UxNkvWZOp9J5fsdY8/84zIb0/V6eIGW2qn4hGgrwboFVogQqkOxXVIwL/b
W3E1SYth0KwvB5RqhuzP/B8y++UTyB9fq5x4ikEHg+Zjt79qVzSDHHxq/sh6hC6BPCT+3q36zBhv
g3BvZnYPeJkYTwA2+dYb8p9pfNYQJZhy8Rm+jDC2EkMo6vxV5yj0jzdvO84psdSs+S/k5Vvvs2KJ
8BDJZzXtVbjhqzDB/zucHsU/ZSQ6CRw6OUixM33HzPq8i7CIYsfOYYB9i2l2ESFTSeM4O17bioAL
7FDIOueB5m4Y/cDtlJ0V5q3zX97FlwWoi+lYVZK5fPeXs/hA2T0cnUEvhhps8WGmneqEwLhAYyqS
yIEIAcaiejZtS6jb6FxQXYTHoOuZaOPmo/HoEBjIlhqeBe1/xZNo3a1senEyIDVIZcmXQryOND3X
iax0Fv0Yy2+OPF4cbID3ddaT5DveojNy36Qt3L+g7WZYMZcki3aBz4C7opkZleHpIMQHrt9Usjoc
D0UWdeiwJOvJXN87eDOLYD4Ptfpv65wiOPhKI+vO2ikxH6Q1R370Zyqjn1mmAE+8DfxGFdqaV6Y4
ul6zAVgs93KSsGaGTTlX5ZaLTbaUCvQcdvYXdkGoAoJCa0hUh/kIuHIr0MdvKE4+aU7av6aon+RY
3WLqIBUc0tigkoAunyZstV8QGEKfGW2uonqlrbZ2o60Vw/zkiz4OfMhOaegqJzoM+Q8iv7A2J7ba
99hFY0tsr/kbpVCTt1S3mNTx98AF0h3NZ9w/wi6LVx617fDlt2uajkiPYuPPNSpVslnXjR9DU/Dw
ObE4IZbt6SstqKgDEJNOqTdAGQyVYH9ugjBYEKuMRQT8wgJ5qZlaDkCNfcaG2yw4RGKr+GEyc+Zc
+1tDBm2GXOtg02Rtix9W53iGES7v7rstXp9WganWpDapEsvt3eZkvPnIf+g6BCKBMhnTLI1IFwCW
XDsU0D++Zkw59S6rJhLGwTleYw2+RjUaODNtKZGDGsMqh91vFoGwjY3NcXf4YsvDd4PEAqKbTG7I
eZA+aU0iW+fx7o2bHHNnsMp++LYpwlKYGoNuSfS5UVpmHzXs2vIAnbKiJo2Gamnq8T69avpH2QSG
ktlUQnCrg4+2m9v/d3OqCzVOKp9dI/HV3wlNLbugPK9Tr1WPz5hxUJNss9M1VRJ3zTsoTaMopWoo
zuhO6u2C0XDbIvovY2BRVXuQf8I5vjUbI26oqhXsl5bU9h2sHLwqHefdDxtMt+qoWcNAK2aZqhmm
cKcWeL6oUpreFvzWnu5M4cyE6cj/RYcfdBl0ntthq9t3Il0yeTSAb2HHXA62ayYJpiapB+UyPmMo
SLvd5Elc87Xg/fC+SOBJxdhBpNiJCyKv+4AdOFLZEKGC5Zcpkcp+oUUCJkQPf/kcB3kgBUdM4JYo
yYFHc64tw/rTUQX4RTPvh15abre9G8i483MZ2xPd02lo35WsLD2vwV3mlADFGVb6lbjsV3+R6uto
qtDu4JXzGxgh5THCL0IXhpvYW1Qh/TOzKJF1PPIOi+KpnErIrcdxav5tLda8njVUYfVXse83WSat
5uEuVxAM9Jj+xIuABq3/+fKLBePW3FwkXWoDSuLxCUOpcGqdJmOaBKMON1iQDtxwJU6kQdBj5vZ5
hACXpMNW6ujx2iWagxv9SGK1nIBpc5sdjttKkwAXW+AEcGpYXyTAmnJ5o4H+xttQppyex8M7zUtJ
yF3E0Eq6EMvNwv/MI3KlIdT673TJTq270t9LOhkDQMh7t1QB/V0VmPDP4v8e9iETQTErd/w72b9W
GILdaHqy+dlIflmawLedeLNprk8Kens9ZCQcbYXovvbbn6/fAMnNBnHZHuvJePgHHJ+KkdRA+5OL
j1ds8XQ9Vsvg1iY1jsQXvp4nvhM/qWiFzNf9/ssLg8IH0mDVRX33bK9qMIxo6KaIfiFhZbs1MeBW
SSMxVVxpHnaE0GqhdLRG3ReC2/IUf5+laxqyEbPii8QyfNXkF3uQoc2CIv5OeUSCc5BOVYLRZf2O
+yhVlA/FhNW+jffkUohTUsuElnzYRhgJvFvPlwtoHW1BFpbSn0K1gVcrYOEG5pPhPr5fIbaNbImD
4wvGQQN/PwgdZRXJ3tSupH+84NYXXmbwXO1/jHI6e6v/M5r06Eu2Dl5vfqqSI4RUmvW5dn+W8M3z
g3YxpkDKxHyuwWpg7rnGLOU7RU+u2m4datykuX3DXLw4UiBP6TVFVHO8ZirAOWDLyPbT2OiY6snG
pVfAXnxvj1zz94+Y2MD85mbpk/QDQkZfQM3yCSQJdMC3jY+ZzzYO3VhXoWGF7y5OIftge+ievGNa
p6TiwNgQBQmHu3tqAvuLwCEXM8JVPTmyVW6cQptbyTFPCW2teQZ3UV/6bnWlCZ4XUiImKU3bOhZY
r6yTKEhbOJVWkAv+qafC9kjA3W6ZaxysA1AGHsWreaeUiqVQjAI0DNYipkfnZESsk6h8PnnfX5Vw
haAO4eeSAUmF0OfTZ4pLBwo94GCF5ydYDMipvAIIcYLdxxCcpyIwxolatdEUK/OW5NxNxRpDBIGs
oxtzOb88Dq1H9XtCC8ALVb4ollxBWp1+8qrEMc0CXAQKHHRMhQJgKUV0wpvznNNdR0Gv/mmBnrNe
rMtdBkOOKHsYOHB/AfHlLzAUBnPARace1slzjj6yjgMC5aIww2QoNAVwYnfkeDC4ZU9YxolAPJTX
df6kNCy3AFhOh6kLYRW33tsLR2ziTcUY+7SHx7o9lMv7fULgaDJ9qyXTLLwFLEXYVSu6o+juKFza
2Osp293Rq7hkrYCDKmb9gAk+HDH/wDhi0DYotlIbWrDSbGJeOKWKEGb+Qe8sHcS3qsElPrCesIId
OH4aH2vBIqx2eRyy3T6GwCbsTW1QcW1EO9DqQ+adQ0rUke6j7JATOU+t4UxvLVZGViW7CVB49WmP
7hnqeipO1gMmYDs7isEQ0gVvZQCgMVBQPhvEgTwzdR1EqGnBdjJ4JktGavddboVS8iLY1cA1k4ga
d/NZcdTPeLpt6TYx0/e0ivXbBbT1KY6dZs174sQLZE1EDbek8HBz3rOOlEjWa1O/NVr+wraMbpVX
o7f9msab/TAV2N1okmiaNvneWxUH9NZFtwbQfomEWU1sgNUfItLbY8JV07fFzB6wX2OdyMu+J4Dz
nQH919g86jit5btbaoze26/ApDyfiQRlarL4JWpy0eWj3tmX0gE8M5f+3cpPsHnUokv4vAHNsIs2
mmh9oieT8+SOHcnGaldip62AplkM/C5aenmYsMepZaVH64Cssvqlf3dtllbfVuXs1Fa1PzPONBw+
i4You2qfiFmuU43Q08JQb7F6IKau/gxCyI8roVHGmMe1+2iDY/NbZkylUeBGpddJpV+Kp1JPBkJS
f7mv0HBeA1nMoU4XOyuREYIZ+3bNCjdJmgr1SkVc+qHpdo2oT4JUQ1I0fFwRK46atZWorX7Ao8GS
pmFSCWd2ZGN+CZSVTdNu97QFd85+CNRcncR10rNLXX87zrBWb7o3td7g7/lVNfA4U9NMgBNJVOiB
cOCYyDyl3gZKghmzHz4OD/6y/nAdqoqj6bJJ363878myoyp3ZKe+Kw/xQ4RgmXItsnk66VTtE5K+
rRB6hZ02h7F3+tyF63+R2car+8DgdEMH0t9/WS5P3I73AE5KEUxDCl6la+udenvVKQJmfBHHLYMb
Yh3jCszaFJwOMWkmW3b06L0kogg6C6+WE8gqFcKDxzWSuvILMlQTrCtdB1U5C+BmDycYPtdNseuc
Em9Fx6Q80BROCZ7BdIimGfDupWa4voxD6V+w+U+yH31NgHEcgqKL2MedXlwbecWCh5euu/i0gHFM
VnsnRkTqhXDcleAPscWqTMUWs0/+8hSk2PnkeZPeIx19cxzNws5M39CwEYcKImxTv9WdyE+1Gagd
Eq9frub7BMqtV5JlVuQ0vaSkbw2WnX87iBOtl6hH0FzEh8dRT4mhrKef6HZPLuoTByYp/wij16P3
XiXADsZJrwq2r4G7jVkSMces/acrG+qadEGwkZkT5fmwG7oIkdF7/e8l6JLIuSBn/j+mOfCG688Z
oEUQK9smrfQdSgNbxpvrfrlBs1buikXy6+VTO4NvEEKgrqo1Lp0tzPC+zrg3GVPN7HomQYlEYXXt
p++MuV5/mP9vTv8wvPd5A3z0b0s1jgRSMrC86yGnrMSyJVQzJ4mv42jB6myO758K85MMORDX7UQb
pUQp+c/qTkuTFLrkeg7MS0AyeKP1BowsRFPwebSpjgZReIC1+opiRajlABlvu2BemDgO9TpJ9Vve
HemZWSy4oIVk/TIj+39D4QiK1WYJUs1T3O34OF67+IU8qmOlub9SsYLMgt3cTSpAu+lf20ZA0etp
xeTorMXNSWz0mCmTNU0LCz2MJgDiOTvDDshfCf+q1vUkuuNdBBWZw6YJwYdWzJH4OAFN3mE2XtZ/
qKE48biJkgVjP6I3Y4lS7380tXpILLjrHKthmx0VGqli+HZL3M8KYVGsN2QuANDyMMHHY6iD92h/
9N3qPjTHnOcCysHr6xXXpuB5i33T1yajiCKyZrAnfh3rT96JtfxTRpdKhvnYZwv42azJ/YCFk2pB
ogLe9Tp9Davg5/EKvLNSdWnovHPOUK2LS/tgq3Fhm8M8ZnK+L42slDItQwoT3C0vF/c05ve7Ljh/
O7jp0HK6N+IgrYIKi6Yzr5eCviilx3QTBclAsXjDOMixQYFOJrTyhcA9O/I9A9YTiw8eqMwhV5e0
04fKpJ4xRR2rplN5UUG3vHC6HC0q6+xW945r9Dw9qSg1Pw4JnkOT+8luk5Sm5TLo8JVkLVFz5kFx
nZcKl4Cz46Z+eHmUFJmRIeRjk5MIkjkUHoDtKyfEVqZ0Tg/CE4rYrAVL39zcE7htNN5FZaubg0qs
1RB2A8C79ir3uxOxzE9oIhMIL/fM5C9KN98a6uBdchuhyG+ig5J8XYGouJWLpjCC/+4oAjRCVJz5
lc7HIsFrlnVwhB6y6fgej3WI1vuKrJv+Kf7osbp5dB3MX8Yoikh/qBlXRm5bfGqvSA357iRPDVck
t8Nu44Gx0lL7KaH6SZdUj5Uk9jDdewI7tATRYBBrpqSYAJvqV/QId23Lf8NwdAZTlrgEWfY9kVKG
wyu6BN3IyDNBIyJZ5NhWWhrdMjcb5u3rO2aDJbCS/ZPGhVJRuL1L76DA6UwqKFHGtOagvJFOWxv6
WWaFlMyxcP9HHHw2LI7VFqyxfaTABO6jjhMIAwDmkSRFttxRef0Oq/98RNLmZ+JQtvWvT8Yjh9OJ
tZAgU7Iht+oz8evtZpx4g5Z0hHjp6/SC1maCnT8czFkjLabKG1IEdVuVrAmcrbZFCbtH0GDFHgkz
Wj9v983rgPl/DuVBblLClxlT+Q4RexWy+uDo1HxssvwIiULN9h6RDZspoZO0z4IQOvYRUHPukH15
1GEmiYKwnr6rga4f9Ndw+6Giks+v43xI8ODC+Ldinj25A0dodG7AEpJyEYh0Spk+oPRgQY/ZbeaY
fojXdRcZ6N1QHt268C1U4pSVXNXBOXxq+HBYvNY4fdFvuH5FwY94Nd/Z0j5gm6BeLrA92N71V6GB
d8R928oR/gu3zILXUKuAFQBLoadMpI6KAdqutnMJmDwhxNV1NQe6J4xRWYrRQ3HP/bree9we10VR
4mf/oIvLKhY0rHed+HAbo6xmbxDDEca0dFpyGGlqZHAS6gvANd7Fo6w3gVWb9YvllnKDBMhM9Ph8
y5+fCJaC46815Erdv0BUesjzQCOjrX461v5t4jYpu/5oQUSiZ5eenIlHbMpNyDs6V09Iq/jnvqjZ
ignHp8nwNqA0dNHSOiJQRotuJoV9uTQdtBAeHH9NFv0pLluPchBIpv1MvIGKeH1ou54N6CDyq6nM
erc8yA/3z5MXNgk84ZKmmbC74z2ZGH3LoFboLO+75Ln+OFJ530wtLELu4IbURBItm3hJm4FdPU5W
X9f/57qcbQJGwYfhvQQh5ltGJ4UksKAFgGipDgnzUASDHjpfJMopJ+aPRVV7qeiOdBhxoRpnYE0u
Qmr3w0T99wGhdpg4yJ81z3RwIwMJ0k2mcEOsg7UyxLomFjuFmw3udolJBYq3P/RdGOWYzzcvE5Gw
Th4T2JkKxy5KJl4izqxINMGpJD06ahZ0iFL0RxqjttZuKV23GXEa3L303Ohv/HFA8EgZLXRZTX8B
qWBZd7c+UUrphLQDbemfTyHb/yhnELAEcYsH1ZlksMPmCswdW53MnE0lDC6xpe403zVmnYNP2Oq+
6fwOuRf4Xp/eQIEt9l1xoCgS82WMN1N/oRIW398/rZty0qiGze6RySL6KJ/BvXpNLWvZp72ow4Ua
zQesGKq/k8Emaotq1Rf8xY+SsOXo+hIrDwvRUp5FO1iof5mSsla9rv8mAXf0gSn80DEvvlFM+2lv
7bkW7nPViF6+sG7zTVsEH9+sP9hdlZNAJR9YabCFamkn9LZB2X/x05JIhTi+L77Z0UutPaprfhjb
txwnnW7gsRDcMWLrvKvH1jxOjCZ2761c+hnNtkth8xvTjHi607eAkxT/dZSJjy1HrRnaN1jr9PpW
M/+EPkJ40troiwLDZXOmDebjkugUBBqaJla6gRguzBxqREkmmYZZw9fSWS7G5uNmjSt2d+UPCAMT
8YOH7GGlHURCE1tLb5KyD5nsnnGbZE8VJF8w1YgEIjG73Fricq5UjJpb62V/oTutiEjoUTEbnENb
901ngmoNrnTm4p4ufk0YpRxwzGTzTdifrqlPZj9lDhhEiE+OqOM9r/p240GQwdOa49D08Mah+vbT
pnQd8wY31MbdODoMHiOcYqWdJ5rZ0GNw0lS8W9IGOhUnDv6hvXWorJsK4d4LZ32hduJKx3aEF4bB
jCKE6QVnqEu1Pay5LqZkNYUFDDWSZE/TOfFksJD5JptsIdnckyrTy0pUvh155qvRRGVKYO51rwx7
YlfZlk1sNYGPmIE+BPrejL+B/Hv9/Yu8hkhHyEBNIRpF5qsnDNues8LfztYcnrqzHQIyCXwyt/hW
4e6bKBoett00wM/BJ3JfY4hAFaC3Y3uHkogQQMhDN30lfeUk8l4OOo4sXk/9C2COiyJfvT0XUDTC
d0gwZQxuB1pXNspMunvla+7O802BBgANwwCBUJIO4n0sF67sfG5MjjzLONFCNAzrtfSxP67daq3H
4k4ieZt6S3PMBRLBeB6VgbLtS+VMeki2Tr0AieiTDwzBm2PxCLQUgHZ1UKeT1uQZVUtzBLWxnf7V
+YSAaSJKy6/Jly8jTjg3QUd8gklcgqUkUQDtiyru9duj2+k37d0eBKgHu5wRaar4tw3omo9MIUws
qgERFuc6vwB2XtCELwqC5g5PDG+ccokFeriOyUhsjSqdHaXSTIbTNTk/+QI+z/DaxK40ZbQIRnJb
MP8Xx8wzDDsMLXSnhhSD9e594jGcfHfmrwDkJOLYjzu1a5Au9YJvyxGC19fheRE8sftRJ4ZNJm6D
Av5+5sp07KtNJUijTo2AdSxxxcAH2w2TD9GpNoRYxj/ax66680u+odx/Rjt0l5Dc5xK9r/cbh6Q5
YZGjIn/Ln8B0ntKpZ7MsBr+QcYFfhYWkFOsOETj4cbwhm9MYInHilxmxgULK8oenigcuxOE71tK4
FIdlN+xpi/+Xs8RMVvVUSJPSU6UW/QT9dpNgmcc2oPhvsSijX/1xjkg9Vrqrb+jv2lTbwlhxT4z2
NZhMOLpTKi9bL+7kwAihyrn/HDn4Bl+ua8UwVUwjgecwlkjwzDRSFTDGIuHBTFzMO8yH3gaa7EPF
3B9PClKUhe+wHQGT3AAxv4uZimT3HFUD8Hz19C5qCP8u9F1mdSpcEdB9gG7W9Ci1aG/RFho96rwe
D4MkjsCpz2xos4ShzKQePXv8svy3VUr8m3eUcO9F/tpRIphcxhOsMzzds7/l/iw7TDduovAzpbeM
+QhyEOzk1ABjDuzsrfldKcPEFp/xZGG/ckqGi6KBJGr0FnG+MOjbQfZixPxBclExAa46kklsdgk3
Y5aV34vxE7u46QRoKnhSg9Umnp5RFnYV+WU/CVIoZ5OEODoBFYuZYngkt1fL/pL5eBUUM3ih/oPW
YT64MNyDRF8X0OMNbotjFlgixm9TxiIYo57a1/3UWQE86GbfQARPkolZ9jyQGaAKMlaHs6C4S08v
e8gcq3do6E1zYPgsZE1G8Hyc6zx6O+zsGJpN3WinN5AZK+6m/BU0A48vq8p3zUy8Y+I44mBckkFn
YdYzg92JIefhg3VVZeVx2CYmwuxoai7b3fYhjlryqV+/f7kM4vNj4zAvCUGtCAH0lSvc7eEZKG1e
OViJyo0USeQo/o0HcGhhzLZS41503AqIIjkqnWguMMpHx0o031Oba4X+ZUtaGpLAOLu5W8q7qTT8
1c9/IhlLOw8yX4kmpVialkXYf00PfydYEMF1UMu85z+f5rGnAGBg6CmUnm0aBFO1JdAq1rfaQReq
lSo3hl4Et+MBlbDEWlpe8vs8jvOvb8IxclVbtII+79fOmH+DJI2uXh3uetc9WlaEZLcNfU84tTU3
S9qDPM5RV5zqaaSJ2mvhNHTLS6u9/43IEaV/yA0owYyJgWp6zh8QAjopLIAj/tAjgnFeOCrxLgUP
UXfAoXi+undxOQpyowJ1P/PYPjRj6k96WeXY+UmK0k3oSAPIET6MtVgmgHDWgQIiEmQEMnLu8nIC
itTYkMHl07fG2jvvZDSv02285GILV+yh83krRnYQOKzlmiiqS22Ngy9wBGyj1nA7Fy0UyPAOglQ9
jI1hoXa1MPNtnqGw2n8yyZVXLmewAiJW1Xb8r3yZH+7tE7neftWNqdKVUaYKW+AD6Q93cmJRGEBx
dFPCIUCTdQdov+QurCVkFj5bI6hQGkj8gxxdd+J2U3PPQeKo76/NVUmff6vYFcg/bg==
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
