// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_load_sim_netlist.v
// Design      : cross_logic_gth_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_load,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [63:0]din;
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
  (* C_COMMON_CLOCK = "0" *) 
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54672)
`pragma protect data_block
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
0OpGpZfW9XQK
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
