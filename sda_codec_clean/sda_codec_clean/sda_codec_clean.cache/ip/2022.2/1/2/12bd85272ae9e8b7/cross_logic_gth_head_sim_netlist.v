// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_head_sim_netlist.v
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
zwsV
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
