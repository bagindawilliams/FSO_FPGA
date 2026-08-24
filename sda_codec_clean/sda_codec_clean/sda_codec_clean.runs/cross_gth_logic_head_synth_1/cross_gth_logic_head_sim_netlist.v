// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:11:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_gth_logic_head_sim_netlist.v
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53200)
`pragma protect data_block
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
CqjdZrWNusDtbs5qXf5IZGgGsA==
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
