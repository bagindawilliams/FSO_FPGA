// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:39:00 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_sim_netlist.v
// Design      : cross_logic_gth
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [127:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [127:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
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
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "128" *) 
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
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
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
        .clk(1'b0),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
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
        .wr_clk(wr_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69600)
`pragma protect data_block
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
kiP+
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
