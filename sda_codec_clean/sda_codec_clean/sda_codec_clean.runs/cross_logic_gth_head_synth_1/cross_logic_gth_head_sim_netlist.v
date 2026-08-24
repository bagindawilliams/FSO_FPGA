// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:11:27 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_head_sim_netlist.v
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
WDkpH4fBTAajfSOdqQ645GnkrQ==
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
