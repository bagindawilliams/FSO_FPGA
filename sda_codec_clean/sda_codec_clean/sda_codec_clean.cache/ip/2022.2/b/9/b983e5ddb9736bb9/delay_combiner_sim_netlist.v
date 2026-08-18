// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:56 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_combiner_sim_netlist.v
// Design      : delay_combiner
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_combiner,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
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
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4094" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4093" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54592)
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
