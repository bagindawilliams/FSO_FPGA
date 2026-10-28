// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Aug 25 18:54:53 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_sim_netlist.v
// Design      : cross_logic_gth
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [127:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
  (* C_RD_FREQ = "312" *) 
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
  (* C_WR_FREQ = "200" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69616)
`pragma protect data_block
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
pJSB0RuJVsCS7VL+8H/4L1wPgw==
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
