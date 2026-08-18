// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:39:01 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_gth_logic_head_sim_netlist.v
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
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
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53184)
`pragma protect data_block
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
28fH
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
