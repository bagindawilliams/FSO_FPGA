// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:17 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_load_sim_netlist.v
// Design      : cross_logic_gth_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_load,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54672)
`pragma protect data_block
NhFggJO8IoY7iApE4ZZ3OY+yN9MOFpy5D6kT0pH8sjESRXkVTXQgoTOTQPS8n6U+y3IN5FVFpsSn
CifP/LeOOn1HixRGwzt3OOhzD4CXuajAa5nKaNfrYfT9zMhQNBx7RNSboRqKrcAIlArmaGKj1egv
KbwOfqvb77gtXRDKxMeeCv9mrLpZ4iBpr4Ba5hBQIq2dsl2/JnN1NXnJ72vac6tg89WqQl5fhW5x
rjRzhuwXNrg0qkl7Y1LJLHNGbthThmmksGn7N9XmWrEiMjhAP+LV2U+4x3Xpy1yXnyghnlOOuq7/
lpKNReYBHXrjQ1+82BC1kK8/GK1xc0DI3Frp1tAQhRDGRlQiH9Qu4j7llRlXTlOgvc0mLq6OKgny
cfOC1oa7N3dDIDDiM3eDBbA6260r7Dvgb/L2Ni+OQ/AOYNpqPazD1dTDGNAe/b+qq188wiq0psXb
kLFrRU5LJ8EbVca/lbfhLY1WQyfl/6eOrVQrzJMCr/4DcyUGEKKcKC1bfxPpr8gQIm77cTFPNh10
B7rRdxJm0h1YNOze3WHD2EhhF2FFAnnMoZ4AGIagTZL2ved3ywC2Nwg8J7OJlDr+Q1yNEjU5ehtA
cEo4/EC2s42cpHMdeHHlyp/paBn/dAEBXSjDWIBqsb4tE9UfHxBuDdEiFfuhmsfRhRhGQ+wPH9fH
jM72Jy3rJU73lhyOAremp6Gxynxwx2HDvP4sAstblOy9flCb+U42V2QG2Lp8Uz9uiiIPgTWJ2huL
VN+jlQtFc71TJp5+9qy5b4DD3DjAPWg7NKDZhzROY6OneH9X0eHRabrPCclxbFdFdc72UFNnZIew
nYS5YQi/MMvMy8Ks3ylBpOldq0aj30DK2Dnd2Uaya6mOKra8b0CFmvffKgg4xOGz8ADgRTu/kdWX
SkEvbYZhrufnc0juN51CVEzBstPDzluKiVV/2VhaUcjJSs9aQ1uz5vaYIcypMaESg7JFIJWeicz5
gdmtMMMPdpcHTH3XBbABHpu6aD4la60HxZjliwDlmZHaRVf1wdy+D5RiBETSuAM7f1c5DNhugLFJ
jvq4uSEALzcmsvqYQyNznhzHqfUX5ASPnsDyav+HEPjUs44L3466S0OeODxUY/m+o2LnTCcSCLc6
hOapZDaHX3z/t/95f75kWXWaLf0OELFBYrRV7Dx5ELvMym+Sc6xTXYIrCINeItYVrgwqWZBWUAbC
vaqfA9+R9JTBLn1gwdW4cFYC36yyGei3FhJrGMfcUyYc3TcvedlVzzgmoWThrtES6aqE+q9PeUWE
LfSG8zhReCHBiFgiAyKOBvXbUi1maaRrgOXVmqfrgXOCWzTTUre8HTKNLzjutzJ/V4zmtspit8DX
nRqOORaTll3Tn4Fi4YmrRwIhenWiCiSDDpo7QhFeZvofQ/7dn11qF0vV64GzHm4e0Kq9dJ2GW6qJ
6lIXgZoGRAbUmM0PJYOSXQVnk7WQTH7zv4MHmt6sw/gIB4c5j56IyHtCRqJT3Zx/bQoNMzJnbhEL
35VmOJt2Lheo3teSwXLMUVYuzpRBriFM2qRIS+06ilnzm7208XQ/cjevNqlnbZ9jlqyl6ChgnDBN
kAPFFmERzYYNug/j7Na4tmgfpkzKP34BP3kvTOFpK2V1sWbXjdttuaqOXyKNjqt56UWHSmupxaBK
ybXkZP2mD6cAE0Gqzhi9z5fVQV+KtCChS4kbahghniOU2jnclephwji8ej9DX2BPEBsQf2U/xZgX
SWD4KUepsNAJzMAgmyWZbos8/5EebxnheCrlkrUnJfRe5E841l44oNDjbO0Sp2Rd4dOUoOuYKeIU
a5tjkTcRhWZDWQH1HF/6XNSrmXCyB2LH4/d0lDdcLjvnY9S1bzYKYonWDMtMy+f4Br9PuDuC4FcQ
BSSumidebSSAJ9aaKWEC+W8WTYANDG4AlJycJys0S+gyNKN7mxOhZIF7fFE6kljphemIUpP419Dk
VXBs8OoM4mL62aRdohl38yxN0yPz6YG83ZbxNk62TANxT7cABr6STRgO2oPwh+uElyzyyrZRR3zt
zCa5sUjG1/yomnEado/Y1pdnje8Jt7ALPbzTZm8MsV54566kuRyfBPQZ3p3+FcPDahS/eF1mipS1
16Ut+YRns1Q9B+YviZDce2CmX06VJpuJlFLePBzxxF+eN5aEphKY55zJtdfBA/E4OVnEwiC+mWTL
NywS34jlVYoqRHyEcqZk+dwlJj8iXNvWtuQI+vJiy3QYk7vOnQ2+BjXiedvKCxIt7+QDVNjyIQfJ
jsSl9b63MEfJ5Jv55ve/7G6qWWGZ7W3EXWQqT9Z1FjoSQt0J1HiTEWLbhddS/qyX4NCA40JaYvR9
LubfRUC1IFddNedRAUsYSA0LSmhXqx1gJXSFyvyGNSBLvTxHWtJIB7zpdqdCzcQjn9eKkcP5U2ZJ
kia1NKvxRPq6W5Fg22FOf9i0Gvz5JZH5FUUM6ZTgQtUyg2UBeAOwNszIq0w9uQU0qgL+7upuWeuF
XX5p2a1xQ4jmsKKe5MMDPQZb3siw9drPlX9MOZI232bc3owbfkMl5JdfxFlA4P30yrG9pyip1q16
dctMVSVz/2Gn40TXl3CBqKfXqqKy1pyLNSiOSx5fvVSNHioP9utGIYIhfl8XIuXRe6YjFDIp0h5U
4OwEVw602CHBqI53dbJcy3GXtWotnGR1EOrsQuoyTq1iIjdgAYALZMLeWfwHawAmyiOqOuyoctIe
XmR3h7exFxi+I6yNC0N+f5ozWtbtIFKDOURBc66gqtWFlBj59G1jvtaPeLoVPeiSnXPfV957/v55
Awf3CswwVuodCPFArftB4iz+LP+NuRxqLQblPdgnKziaUDJA2AmE9E1DNB7moUW9x3vxSWmkpegp
Ks/1n/XRtU9k/jdqfY8CfUwwwj1K38VzbRZAAQdNLGs6FomuI37p6HMY8xssAg3/I62D9+QV75Qx
F2zW3ujcP07Y82Kd0rQVHdxyCgNT3+T0iHXNY88qtoMe3Z1thN2Vo3AyM3Rn1sjCZk7Vpexkf7eQ
emMgrPp/WX7p5S9L48ktk5GQ8qAvJL2ZMcZsGX7Qjy5oNMet/XeZF07kFNOMZc2FCT/TmAgi5eGr
wp+9ZHOmT4eXSDbUOqXYlz9c8P4MGaSY1I9ubCjddZyEtoebJ4Trejh4bhCYbTMs/AfrZx3DZam3
MTrV5l1Vs2idKDlodnDEr8fDvSqr4FANeAK4PSK3/2TRvz+Zj+ruHb31gQmOiZuT9IEbq8mOFlhU
zMlcEZ5Be8R65bzwFCy0AbC2D6Z0kod9qm6Q+xsvGikQOWE2HZAOKRQdZse5QC9RDgk0Ac8KAK+9
ES9UTlSsNBZP93z0LZz159e9fw7SY/GInleHV2ZAVQFDZZRoavolzEvbyCwnkPaJfu3qUkekdVxh
gZLVvPhFyI1eeG36vkTIC1GpUTSZWdE14jeqq0G8c+Sn2UHbjWZo1bEw1wob2StyC8L+6nn/DUbz
qXfYtwwfFCNNRxGqtmNX7Gif/xkuwIQGfmH46tezi3NHPfmro/MeDJkrNHeR40flUl8YBXa8pVVq
XbNSjTrWcjM5vTS3c2U/z2y8zxPA/p/naYkajL/a11k9Kgmf9xY234WIJJf90RsDQWv95Pf0d5O4
Me/d477YXIc7iT/Swf9q6YOYlBmGyCrL+5JxpAhi36EW9nTle/66OZtAE8HnN+gp/rTrpQ9IsgjM
ALLx3k6jRAk8UAMX1sYyJTd48PzUnlJAnvIiqW7jfRpqgtMY717FA5dLYTe/iaNthscAmvONkOGJ
od0Vw7PclZiFW1vCxZfycueZkK8opJ8VXYU0pNB6uo38Mg/A3WQXHElfirDtC4lrr3YOnMWdRt2I
GqEsyDlZdWD1+v5nM1fKVO0iK2Y3GdalQlYI8CEv9cmzAF+oBRkdkAZt+eNGLREFbi07FPotF1C9
D1MwW7vikQVrj76qWOol4LtBkxKPFAVYAm6P3p7BqR4b87coi7eAEWv4yXJ0eF2D3MR/GhiW5Ccd
TmCDU3s554STAwVy1yPeb3L0HNNYyepudIVCDPTEC6YEl7jtQAvqrOYrWwrxcthX1T8lk0x/cNPe
5mozBv9o06fcChmzpcfquLDWF5HvVpa4yn0LOW3UIbtYSrDxaAeLPsCt4gaSl5Zs/ZWvi1C9hI+l
HrwKGUmA7/nLTATWKh3q0mBz4PZZOxfHbeOlZbGh+0aRWwoWunXNoTqeVmmvW86QJzz0deRNbsbl
u+UgCWLRMh/SriSrN9fy8JpeMn6gD9YuEqjE+JD44uC6iGs1J+5bOSXTGSEEuzArAQwZqoCVVI8e
hfhwqft9Cc8ctle9RP67kjsU5/VqDfCDyp+uWQzNRQ56TLkUeTqcVspPR2XTLj1lgkKnTpLyJX8b
nTvg6AtXK43kBUqFKjdwI1Z8HXiFYBsVVBQFy/GesfHHiYUrclx/XCKMZUTbwZ2Zww/cRQP8WGCM
cvUkjm5PcbiRgXh4SXiPTxT8WgjDZ6JmOkCnozS0eiid7I03z4RyHT42t6N4vi4oFKR8Bj6pF3OF
wYD92lMPvv3Svlj9NfcOz4cEXzjDKVel2hbzrEXeQVJJ/LgI+L7dWJbrwgpNm9MBIBNGel5Op6BL
nz/z94SJFhv6WyJqtq6mcDgoxUeAEbnhnFeDciYr8tN7poSb8y46CkL2hzeokTmrDGGb+rocOHY4
ZaHs44K6RrEh77cto12LD8jeGr4c5Px+Rd6jwd9kTuXYdlBtWjuSgvE1bh1d8MwLaciiW3UfXkdN
AVdS+mWF28UF+vRwothnOUfichyJneLOrWsFXX8zi0gyYWWWyYsdEb3uSMkJwFKI4MbGs9DMb3K5
8DPd8svUbz6EdBiz80aAhLKl2NqnXyN+UWRpIgK2IVkLFDLCliZpIfiPcqBCKBtDUAGzwuCbrW8y
ODra21wgortK6f0Tr94aqG8rJax/fwgGH+XASixH7ZL8kzYRetzhLpdSpOAmCidIBX3ebysTNn9n
yFwqXOV5hCa0soka01pjTw3+mYKVHralcl3IN/9JN+VKQhGIQPIEp9YPYGHc+la+ALiypJn5NW+P
+ihgUQ3MWzYquo56H4FEW3qVz7h6QP/jnokkUAevainDwBzu/1fdgog46MNqGJT+fncoXwfnE4jT
Sof7AzAncEvcoXFgs5bvXXiri01osYsRQN8wAdSSwSWofdjrQDjO6gfj4RU1Yd3aKDsjCeK6nRwR
bYj/bc090nA79eTtpWWBCXO0qFMjpKHpcIdFPEcZcByOQR6gqK1GFSNDViQjOdxrJ5ZXnfMatmQW
mNbeIDXEOV8JMk5XdYIy3qNoQc6nPDorQJT50+IFC3xQQJjOb+USTG2KxQR+OjglmzUmQQ95ADmo
BoddnLjIYerGuj09nXaYX6llr9ZcKD2WxxTGBh3/ppRTmuuN/KgQrv2SzoA9QTP7UUddr0+hVgCQ
knustq9YW6G4c0yYZq15K1Y6p5lbr15Pugj4Knk4oKz1QMG+QWVxT8UTYfFHSmAAsXtwdKPZebvR
0qyCq1iBxVBFpG4KRi0FM3mepgLHWXP5iUcypGHGGc+C0sHkCp5PNCdJPyt9YujgsXWeCxJFqTjt
E9oIrfdkVkdmYmIJH3HbdGUaJzWxwFOEp9vlSRky6xXiFIQl1+O4E1G+XbrLBhrTROCJSpg/rdO8
vsI5c4hRYJyUC6AcuDjvLbf+ztYqpeOzPn15TLtyBubM0I21ZoHccxL+RyIaVtvFG55MulGEWMfd
85PkPVA2KvUUwSmwYj/eKUhXCpwWgIULmJht93PKcO0w8PG0oqUGRS84XmvuDitU0t1bdj1pOQg+
YKJXlxIZxexIC/KxdY+PvlvgAEEEI2SgHle4ZsOAV1aivoJNJH4uKdZO/JUkQ8Li2Y0NKKuPGaQN
pCxxoJxeIyK4R0ChJOlM0AkajAp1IRL4Oecnu6TvB+PJ2887spBVJeM5Bi4Tl6RrjMguP58yO9Eq
Wrcb9al8BCA3sFW0fr0tXhSvMwMfyZwj2eUcyGUd3ISFi7R6Lh0Hj4aYn4BIHwT2c8P6mQvGed1K
HW/3ayqT76VsTk7HNmo9Gb30MQQdxBxE8PcsjOy1+C85hWzXoMPHxz/0TP0XC6Jh2/wGeiWiYBB5
DCwNJzIV902oS1QFHvtwKq8sK/byZt5W99XiiigSX25VYyVLJMqALTkWnSR1nUOerfuPpob0Yy2Z
jBZgOCp/0qH6y9BPjcj5EShAAoPXp70nk3bqm3tv4CbYvbU+f0zq0RCMVQmnDKuARaBNrPyFOqO1
sw0HNB/eYsAyUqtRfXq1pMWE00/2shXnGn+UVr6l8o+G31GrEJ5PirTxzQGk6Oi9DVpFrCHotrNj
nCADg6dQN6+FiYR0n9zJY0jiKOBpOxUPSwlXvXnaHUcpenM2o9OXTvn5Zpdnaz2PRdGdz9wc/Qrt
cNrOio6R2mTpYbhLxGghYfQL3zfDALw+AYUyACRSz6OHzUMWgfoLOOeb+3JXBy3acVENyGRNeWXQ
bkDDYi9NbbivpKheAheZkU+aM10sP+OzjTrnpyc1zQxiKABh4DnwZMhY5TPKtDQ5hr7mdZfqzIu2
BP/MpOoTYSzme90tMGjyssNJrlpWNf1WYFpsDHe74pnbVpmRVvAmHfQP7S+9iVygJsdbqDdlDoay
xFyC5UnUt6jkz84LjPi+goCxITqMqYDWk2alFCJlH1vSVLlfAkRcvZwsrn5iiDspxoDwb2XPpi/B
lXRi1Ks6SaxbsrZ7XEYvk3V9hwn6xZ67LzFhpl7u7RZqtiAwxZPa7F+fcvtc0Tq3WN5qwyc8V23J
NxxN9+6PAwsP76yKRKbg6NSswBJugGV83PgSIIeONnjYWy2Aoix1MV/iFUq/HnCCGmimPR70jMOu
froGF0QZOv/GHUqEMnP+PPfENEDCwiHKlPdpzSVIm6f+2NVLfPmbQziGx0FrZz31xoe3+eqkt7gX
xIN3JjMdPgTeQTchFN5VQvXckTI6abHfHCb31lISiZ6fu5xyby/Ife3F/NRPRls5MQiKaimiTH1n
BisaFDO0Q9ncu1KCUDXvIAMf/bkwPtnavTLNrBzJCZhlmPIIc9xW7c4+QNZKKtpDY/Fp3SeKsXp1
L4XvuWFYGHTyjXdWbw/lLTuNFl+Rvm4Pe9rVaD25JJ9qkgiqOZPuJhMpf/+jK9e4rA+GDwf32H28
tun9h0puDKt7gqTfs6c7k4+yF5ahoPtSp8YWziWt4IsPUtecG3nHaXOyGHWoaQBd1F6F7Opb5btA
vzPG/vUUcCDaLWteWrqqQxBSHleNF1dlpqrW6ay2jvuJUcnVEHbpfZar+oeN8judZtCt0I89FpbS
1K3obnrLx8ufRlp9Jci6oC1w+KuBnj6c+cV0TOoR8HtJIV+98zJWg68y9NO9HSvagcjo8+9XGYKk
NGvlGPuZDm5XoCx9b7lPHOp9DEj8lY3wU2LB9pkhKnJFmjSqajLCpK+n46/QqE+kx4uhgqdwaAXx
XgyH3TpNRBVRZEag6ViSsYT6NMqQCjWX10fCvlbpvRtyvV2AxjJI/aPkQ/ij/YrM1l1NJih0UoHX
/WPBtYFmE4/V3AAKHmIlU8w1ED7biZeSOhPZvvLrSwJOwEWXEwDWBVybI1+IF/Prk4TLCJ1rPxDy
muk3U1FEzB+gxNIgs5jbYNuj4EBE2AkM4bgCF7kuWsEDpoZJ0cMZ8mAzGOLJETDAOzAvEnGvpFZ4
jaTPGr36cW/PSsvWDQY2CKIFD58i6XjFbjQMNUv9Rtw3zRnxYPyX5GUwLrYIHJAG51MoJvbadKXt
VjCCeS5ZEkvNvQH8e9m1eYjfXHcGEaPTUYX1Zvddl9iwo8JOOhN5AHQjqlTxcoZVBw0RvC65kP7X
ZuTErJLJAwbeQ5PGUFvr25+LVrnbeErDVpOqQOOR52RSDVkcWwqjmFogdgZGms7lDkQOhf5EkoUh
+HwtyYShu7OBXFzpbjCZJeQiwu9e6L/jtC/kMbMXRCow7BVorf3Dd8ItPS8vCebcp4lnN0/aerxx
jwtHAmV3HdoiHqYaKHd87UhUHkK3KPm+TqQrF2JMdh1oPVI7EUIyrwifteLruCon8pHa7XwuDQRp
3jb3/NDRMPewahgUYKMB+sHzhJhGJp/cz7YpS99dcUPXhysUyabF1s95MJ8dso/ChbrgfaFqppQ2
It4P9w1iJnlSLzPgi+/NGJvdd/iHuYunVzvPWSd5DjAP9m1WKrV093FnWz64Ex1Xo54VwSDQhNlZ
alkXCZPfwNNNKPOlzCTaQuH/AkxLI88yBLMPwJEhHQSo7QzxOWGdiggBV5+8LtPYjg6gYo14Av58
wKLj+qZirpPHHhUe2AP2NKgnvRQJ9RFI8Y0e9OE6TwhGi2RDTueD3DLWZoxcaIXX1n44l63FsDzh
KbLhSEiZx/+qPJEKfFuRD7HH3bbfZFVvIvZQH9QXV5KifIYTIHQBx6EDa+ox7cT4PvCPdLak8b2a
aQja/++IBdtW65P9nIkbGPQCCMvUtBZqLbc4WnSe3clZwBy+p/XM0ld8+iyvYlnig9y8npApK/Kc
xkJ5/TtbeOkWx28vJPlAh2ot+NmifxzRypjEdt6rzkt8FGmEzVc3pAcPQALzi1Q9+h9JicJ8Pnz5
I/6isIQgnOsw3/njex5iQg7Woe+1t2JVWRz2E/icV4J07+QlIU/VW5NGVPyNgllyHyynX3HwfQ+f
DrLKAH/CE/GOC+pCzXwHA9FUtUb4zbcSQV7B28h/hfm86q0kOGZhXAop7m/IIKE+Ug0zZXwGEKsK
JrJ0yn0flXCfBoLM37lTcyViclGn/TltYyAeUBm3y7cX/A1fe1WRJoJxr8jpHvT/GnhTiSZFGH0Y
YjE/GntwuQejYfXBNNpN1+I+gSvep4rNJTmCHmMr6byzeUSfc0W7HmRLUwMLqJ2DP86CdAr9fImE
Ipabxqi04gdsknlPyLoNE5tRwXN/NlAPFnzPv22n3pm+wszoMVFccjI/LeXSLLXsebwy+jVWCLcc
CTDkivbYcWNlsiHZDTuyeNBHYO6m41SmoWruwJRjhzVdjTAhoPJoe9QcOAiBLVlP5ykHhktuoDyh
089r0EXbNGcoPPpmH1SHpRjzJW44xw1I0DufWl8K6/q3wr9UeeuYkwTYzzl9e4vwGBy5BG/qHS1N
V+mYcHkIhkQsE7iu/lmKC6EQz1QqNNKsFzm/QuwdJTu5eK5mjsARxtFlujJ6mpP1K9yLwWd3ILgK
uGBipDzysTjgQVclwm/U6UdqGaHumnHqYEr+dRcO3VUcrCoVCWsIVuJHzHmc/pJ5cyAZMhVzzzDj
MwfkzWbqR0Ax7YgZLgapIpMIYgxpOg23SHp+JpBf2rzWF03igw+vNwsjIpGbFQGEUv4C834nwqQK
Fmz28pAPXFU3bh/wNRaROu4XtsWd3uFm3dke9iGPaY3SMOdXHW1QT7TSj/iR2uKWRcAY+6Og8JX0
rCtMojtzsiNOfQ4fPSazmaewkELzNwANycangd/sQSv0mcbGCyEeIgCXoOUzVF/n8aDlLqWJoLGV
iTpz8rgLzC9gEmQzgzljBiNecJgQ3fs3dILFEiIvrV+3ptIa8k0FRzPW3ETfwMBKarkoduKMS5sD
ykc4D29gIpWGOnSaNqXSHLSdPn0j1tD7nVbtCOz8A/SbKeiz2giFp9Uar1T9p4uudJgKrMl/UJUl
VwO/EphBHiC+uOVPxK7afChokxwlBt8iS7UHkoB7597f48yDCpMSmxR5+JKavgEH5VCMI/KaevYS
uD5CBr79NesK6gpweBt3O/H4viC80RNo3B5gFz6kpkBCjXoPBVGjIF6Alq8fV0psPwpt70qWBlwF
6CAokNHtBaNX9asJXyPcprCLJrBzIcnlGmGurmXhjcV8dTuBrvJk00CnIfsBagU6jEYwW24LkTHB
wR+CVXvfAsjZ8JnYacGaIatVYmmrpCni8mzk378QA4WIxA+gy/oJR/0iHdrzzZ5ZbgDNCtRy8mDV
7U92KqJL/EUUdeYRB9FyYouUFhGnKdcfdNNotKKOsmFRBdF/HvfZw34HFw9niEZwsAVX51UunMIF
7TWQiPrRPFYLUBqB2eqfeh5bzoxoucX/S7Sw5v6lnol9ZfBg8HzEp6QAwwbG7/jl9kOlDp+4wZnb
hmXfDSxGYZLTLZKR/heAipHQ6JkKLfHxRBLfOtW0b3KyKMWcFTepcNku3c5iUHMlvgosfTLWPeeQ
66iYM5VIshEisPSBWGosN1SiHWJDxyZSL01bWm2EHz2L83MpwwUIA7B+QudP4ghXa8mTpYbqb15a
6wNMMzop5VAw7uGtOpl3DiF9VK9FvP72jWVK6nsEtW/Xg+hot7E0JK46mnJopnjdnNUwBcWMWP0o
2PHgYKGMqirGHLSDW0DD6v4mRxPb3zz7fkyz7ztokjZdFUfazkj1YY9gqJUCxGI24mn3INif21Ak
we4HStMUytTU+vRYi3MCE4eD+8JwoPZfZc9tzjvbC84ibXPcLO/F/uPaVHT3WWnczJ1lVALIhEKK
uptBPBOAJQea9na70VwAvtHXvdVS2nraMBnoIl8DtOzz0Uk7/x1Hhl/oiy5Oku3d+tGvuvK6TY/c
PFtxnstaJF31JCTOtq9JMBjqKnmvHrp9o0eBLzm7wldh0FZzFB9i8Z67A++5SN6ElayFFotQMKmQ
lT3QyE56D0zTa3Rr9yyWPiiIEnLXReHO23seSmNrFRfwAIHcvtmHCqQW0NToIBkiBXg0FSxXw2q/
VNh0kMcL4UTPfxAIHmHxHfHMGhbpxNDDOIL6zAzv874IMcxjzry1heOOWEsIlwxHPlfGuz+Y5Dt0
PDnD2nMRmrz1sULZGMJ8k93GwWKVQEoo6Td4c4Y4m0q/u9xo7KVLj+url9Uap1K/daPiUPAyXptB
jbo+MI6Wwg94Fez5WRmQsHvINsSYh+gwYKEL6CHCHHq4aqjXiv9ZJb5jzq6j6h5ql9L80/DJeiHz
NqXI07yRvgBl5yx4XU0uegqtHMn2SrceV5oSxouaQLxTTn9NxMwY93r79qchqBAiyFcSfTxfzOY7
kuTGHGggfdTJBAaTpYs64UEGPVtRb1DcO/Iaag9JkcRI31bALMTNu/xHOyhn0cf7V4/ORTSa9gXT
HZYzfnndUx3haxuMEUFUIJZGVUxK5C893q+viNkdntWo54os5y9DPqQKJXYq0l/twlr8hG48mPYv
1yMZvVU8s3+j5ZwHB3jhQ91A2P23gf1wN3IWu/sloErTUR8VB8vDb1rKoglricDl7S7cQX0wHovT
SooMPLTbQoj9LpRzIu7BsbOecGdMYxD9F3xXVZkdiWdKXeNCD5fP50YnTzq8GDPyzWsVtvyproil
XCRdFroIa7IANrS9iPZok5pAEHH2aZWO7E1iaiaLujFjQ6QRXvutZpOdcmreL0QrAp0tga4MgITw
7Zp8dR/KQ0ilgwamYe6hG+zrYGa8x1ygePaRfKUKLaOR/UmT3zcxjwV39kWnU9Wv1G458xFv//yj
MEzNlqHzfMERURLMIXfn0f73HRSOW0JHRLlwFOFEdC+Xsds7gWRGv6ZD9a8lOgSUKtnl29pXLwXx
w5yBrRqdEK/QVMYL7SEtW4VQYiJSrcLerHXXPlSWPobVjHQDPVCUTzqI6nmWGMtn9TtlkxLJvBJk
ziJd0Uqn5N5xWc9vByjLqzDRYpGa94PQlchQq8efs5X1RSjMnO07N3gIZcW2CsvG7c731Cl3tmaC
mx0+AMAK85jsJ8KaNkiB8CVZmTdKq2gECeyYwH4iHogi1obWK/vemOQG+d8C4oJBHYFtE9y2o9Ci
/AaoPFdSL2VAI9CRcGyAYn3sJCcCAo/16hYmvQ3NZDoxXSQ/EgfF0k5tsmC4fR2BNhuI+GQV+yoP
T7M2E05RZCb7Zu6fK3vK2eI97bth2IFibuy9xdHXO9efaa8JoJkTNfqmgjrNwlloKT/kn4oWF+NM
SycIM3D4k73vuPpaUXDUEmE0PlNcq0bjuH1Vv2n+BIvdyZgKrhE3Sq21Mq2L9lO/x4hMP4YBNESL
sfljw/fdks5gw2r++Z8xKa2/ukZg2wdq0kcjYhORzzhaNT0VjF8AAjLD4kqn9Sbow3P3dUKtWDZC
VW7+p1KQbWvYUr7a5C6FLRTiltDEtUvuYi/yqOViT0OKff+EiphUiHvQx7341/yvEsnf35YMJTSE
h8MxxvUhzJbdykGFVgWHydX20KxzVNmLS5+qfyWJodEe9vPajW7ItNzs56cOfqhO5FskfOYyeorb
UiU7rWr/5AjsGFWW8U65PupXDb8JdWBX5szRR3uezRFQHrV1zllfr9lQhwhRIZSyuXVxRIiEkOJy
/GZUKK/EaYjVbdkQTdyJwlZGKo3/q0t5FLn6IPKszVJ03yFFsvLzbEtgO2YlVtMG5XvIKsNS7Pgn
NuYKKRca87rJZXYcod7w8+3orxMZ6gXs/cuMXaUj6oWKm6F/7wjSBJE0zgECC6D8K+9dw85a0sdC
DdqRUCgjIgaTzLvclpAPeaqTlB8r3+lE32hsqLhBh4LfRPuWGhvSRdf0ndf/oAy7j0EL82mF9sjy
8v0qS+9EiG4RL+IiTZg3BQkiF2+yrcByhyfmLVhQEVjcjo8fQSsd6MG701NnzJfLVxlIkdiE5dN0
IBM+4fdy3Dniz+5KrnVO9lfXUwpI9cbANzGsoRU4uQRO2sDxbtcbyhoXg5peyIbyp/WuhxLaTGZe
OlLiYaKCS0ZfDUrysyHgzeKDVcMOwiFq3lFaQx8qvJ9cVksRMEVC/DBdvlFDIiX1vbTB9mVfQSSX
nOCX/pRh8eQpTHl/5dvxxq/7J7ibZvh8xMoZCQaob09S2pmQ84cdDrF6iOqzRpjZD+w6rn3NJKSJ
K7dTN7rNF5cjTLj6dQK6VylAFTpbQCIJkQp85raq9/3rrI/8IZ+wATwGxsV+pkmqm53Gc3b5gQXr
PcA3PSgcFKbTClD/qLcVEyRlGFKyoHneR1DbGAHF05Fu0ycNxIqkXYFbctmIlH9dq0hCJc5f55bh
wIkzwN5nOo5aq7ulrmMs//uo0I2rAHg8YFD3Lu0UNPNGHQH2UiYix0dMqI3oNttM/GdmgXSVTAHQ
qQjGwwAWkObHvQzUBtN6QLmuxmhb8CTKhgwr59BDA6BOdkhy6QsIKKq0t6F+9qtibrjYef8VGfcJ
HfN3ijD2TkCudepkOA15YH+xzWisZYjTq5uq3YtTy2hy/1+zWIcv6vkxBSDuN5Pf995vlhV/t7im
svIb2CFeJGKd5PRuy33YW5Z2auT6Ez01Ra9cBhT3DosRRLGuQuctkcIyJjBShnhDD6Md7lD51tgj
f4pNtlZmPi9o2hdFvPoB+HjTL1gtqXSnPDCkQmRWyL799oY7JrAwGZdnJCsLdmil2y/q51HsUAJC
oF1TduN0Sff1AZ6qPAJe1/Xa0PAVets2rLpgHB9kmXUD4XnInxp4+2VQNMqL6n1RtMyvh1eh8AVA
krdATcUj3j3+QmVlpMM6zV47Hn4JMgHd32d2+Bp3pJSrpsnpLkSzkerLAutw1RgQLr37KOMpQ/Hi
1SFKaH0GVNX0Vf32FweysIsUUkXXFTofbaLxRykzqnC1hDQzQpu9EusbovPdEvGDRX71Q5WS51Wa
7ZPk/YbKEo07jHzlfSJaLnyJgz4f1lAyZ56KfzJ9HfwM96ejGswbcecUnU/nAfap8LcHmQscmWna
UdrE9YE+i2f94iDnPV6gWaB3uUfSmFUrDhFhVX4JcPKUlJyEwEtY4M7aBS1hYlKvbU60nsWVPTZ3
3essPxcSgtoMHWolTa3Zuf1mfy4M3ixwXd/rRrdKwo0MlYzNyzyDJ2pTLOQ4mN8C4M7Xvj/Wsr2J
YILuOawTiMqQKYI45QjBNFsvJAAWx5qNte0pHJw1q2RUE3xOaEE/CpAjjF4psc26U+QN0XT/tMq2
1JWaX6gkZspgi0myEUFYyWsA2GVazj5qaN6wS79mfCF8oPCUqb4b02/zLOxqriQACAliM7UBcAzl
YRhZK+dE1EJM/A8oi3E0bFG4mj79/FsBp2jdmmoyD2e1BkJWfm19hLXiH3E1eH/MTw9MCs74gEDV
CgmeyFaQYonA/66pNDqjFXKN6iu8jMfLUacuSDFO8lB4TMJm3ozityEkpxYKAG2SMxrHjsywWqyq
2n25IhdLS9pU0okND9/wsFOjJzQaKnM0p7h9IoJRshnM0W/6An/2vdVWv2XXK9/yRGtOvOPmOmuK
Ct+Wov7GC92rp7eCgq7vBk/3iWrb7th7cFOV34IV1C/3WwiJ1Zysa3enWYSLdjXYLbP1dzYK1aDL
KI3MOvOhKrR5L2FlPiBLtMKggRRCDZ3FF1Y9hCL/FIRRA7IUvZNUFWE+Zy7ktHFLIwcW2FV95RPZ
2XU0r05FoXWAjmAtY8WnXYkwKV15LIM9ZyVfG35cobGxJAQtkisWkMkq0oT1mkJ201T52fZP1OhV
03u37ZpaZIXuO22B2EeemKtgWRUPOkDkRfQNRju21Ar8hV1iVSFJ1DAL6uhfitplteKiNRmWEqho
sJP0O4pbat5cB/WUqx8xHXrKldoRJEhy14HBFNCJ1HeIFp+sFWsnZdP0KVMPTchdo9UcnEqH/HRx
HGMZjGR8zcNZOqNV+S7b53BORXh6yJwcoUKUDWMvenIAgrw+bQ42g/BTKaOWEdaBfVH3HVYuAfeG
bYC+Y9QptOSJbt1kwuG7MB7HQ0Vzt7O5PyAaBhKTVUQbGz8Nq//Ef3qaXHBoikpvkLstBgm6P4Lj
LDLz33fWY6HjGSmht2BMQUH83ri+Z+qV/08gyWsu/i0+6X9jnv9S5Cb/jeWlXMJiZBdHNkf7fAx9
Hgx0sx/C/zYk3nzWoefpnQ0VYvR6OwUW5MRoEvjPKxbhUB6wVJORtqRoe0pNWHI4GFdvmCHgfNsB
rzm0SEbSlEr8Fe24YlT6Cct8C0/jYDTdHzowHniTwHr0HHMTN7Ucw02bI5AneiJ5xEViNJXeOSS8
sVtF6Ml2GaIO+wAKBqgZldAByC04p03102RvVJiWYUMa7ZGkxVhqGGAnwQSZ6LfsHiUqPvOGcDYX
6zh8R6b+zJ1L77ruWuXWlfu/6HpPFlw/+3lHVizEN2bhZRfzU+jIA3YD2hbRkR7gahRiTOF+k+In
SaXADQDI8zY+dWRPG/G7p+3rAek4BDYyJzdAsXLpr7v5r9JohWoV3RmlU+lwj58XoQ3HMsDQqpkR
GN0KmAQApmS/U1AGKuAJvmegHVVQp97CMDojM7wJBfxkHjJbQLPKQmvmKsifOi0rikJS0wQe/vGX
26W5MinxBlR9A8p7bk2f5sctl0vtGpvcB8iwljRrZ72y8eDOH9M7VTFRRSkCB4lcqe6NP+aOnrFH
WVyC60jW3j6bpK4LtzK7VayArW5snZFJBt228CKuQ/B/SBQ0Gk6w/GGJxJcHT9szWNLxaxkrwwlQ
1khkv5/HaB/FZf/HmcSgg6E/5lirSy5H8zL5j+sYTn876QyAYOUP5EnMgtgLiCUpLQH18m+d3hLL
fJe1jAZoWtSeUk/gkDyikvWv6ZmXROsPQ60ZYOHjWq0T0ZOXQGsMFtPZbmpDu2RCG8UQnSbVl0R1
CgCcXes6nNzKakHrBgWx9y6APZ9gW7utgWdmb6OgqBNnoP1tDxaHHKqYqaXgDISmxGQcEegj0lh4
30xm2K/8JXXaLIOvR4jmOsT0NzFLLN7QBvJlLacmsOyLuJTr7y3icsgEgLytTlov1ee2mcjs+yze
WD9dLUNQP0eHlPBxFpU7AyvmwroY6t2gOPyEWt/rqh4LPa1qhKAXO1K2ic/xsz6pM5fAsvLIDJTp
hIE9C1qm4DMWULHx8Z4qFDgSKrUqc3tNEt8zE/2Ksm/4exdbeMdI2MW/8CN5gDux5I/jCtWsQjjO
45FtUtRtGU0a3CbTPjWbnnPuxzv8bE7L5km2/nZaaaMahACIA6NcIvCyUqMJp7t6rvKbhcb0CNN2
wDQcM4YEs1Sd+KVN35rHe9aUMFVhqCg/lYmZRi3KsYAP8h/N5JLbnueDIpNR9wwuvavvbX/M7W4j
E0DErT930tK3V1nKEagpsmUKPoSrGdmKprtzcDxxKCsqBQzCUn53KtGdIS4B8iEqEnzHfzUpCBaC
Vw9pUpC4wsA1J4y/EtJuxp+EU5PEGvFatbNGLUYMX8AdjUP0WJmzmWTs0SXVd13WqzdiBAw0+TDF
yTS4ya7Jt+rRfvDy3X4C3fhFXnSikDvJqgh5uHN6XPzNEWJuKcNGxyUsOVsc5gW1gEbk2AIv1vrw
sVdC2TrY9pu+XpidRN3PpLknI6GxJHzfg0BpItfRN3IrDyyx4nShCzpW+OV5pf1QNH2+Y1c0e9nO
AFR5a2CBgBYXHGggBEMrfkipKYVMiIwX7TIJZKWYUvT6aOJGdhU0crF05S6SVLaqDCGRF+kiUUrc
sOmyJdsDXEwCE9w3G+FyYQbgr3rZcJTtnUElHTxrWsbP9V5qQoZT+aCVPH9uDDFx8Kp2E3C1LKmA
DQgMbbtVhpcNbGOZlmOQfZYng6DtVSPBJO1M6HrSb8wPy1EfLrbjH/VVG8xuEQ6cJ3L2tGUaSARZ
xJlgnBbkRikWE7kjP8WazGd7CsdLtelpcvB5TUY0wXaMAVdNxKidqoUootV9REAPDh8QsgRIs8Yk
B/IW/j3VbBys/RG+lHiZNUgXf8yZDod4kPAJaEaqzP7ysENv8gYbXwLGQa2BxbbhDiZYzVAfFvVd
ANg6fazBW04xhljTKB94PPw6ZoEtyAbyhW/ECN9Co+Aop1zfoEI3fzCu2mbtbRmafc2ILvOvfcXP
VGCKrTPPFzrYkITclHPK7aTxi0BCYOxOeM8Pfmb8VDjpbrpqtLjpraE+mN5mJCqZaW7/EJTDHzrF
gWFGcAimRxj0yYWbvDLfMCESvBlPqIHP2tmvJMub/RpaM7gR20Q4Y7VaifxpUIRLXyyhysOliwbE
umAgwZ7OI4tuGcc/wJ7/aNKsQWlC2X+dHaEgDhq4ozZLH1KzBU7oE6ALuNP8pPB95RA0KJ0/EeH7
FRLIB9b9aARRZZRkrRE8n2pbTNMNEAY2pqTmsgpfV4rTP4LXDDTZFVXHXFTsc4MWDJW4R5Z+jnKJ
QV1wtDan4MucCCFgnae7/SFftz/csLplftpVNrPQQkO7MSVLZwOPoSFgetjdDVEtXXC1h5aHFXS5
dSJnbADgtj2cY51CoOj8g3Zgzl6vO+A2kcVe3K3KlLC5oCf5MvJU9J2ITH0x3wc45qfes7T9p2DO
F8QdzCSdxcRhApDHUp/S2UoQo//8RZbDU8Cv0QlLukMnpIZaHKs2esilhIf+86IKec945LzheCos
R7yB/pfqZJImNDpzCKjG9nvEbDT/57GivqTlYHkYtCPekJkgcWu8C3z+eFqI4QFuaWeqsfMkoTRk
I5w2+j1hFQh6mU1ztJPF/O0jLQbvzug65GfMGEV4aBTvzksBu/BviFO6vbVd6Pbecp4IKbExt42V
MgdQ3nxPkEDcKbu4bVLLY2+1NNXyopDVMwgjCQwPqXM83lRvvGqDacZLkLI7QmDJyZGXIrQUnrQO
w03X3W7xfRmZ+ArIwHgMXho8TblSzj+eg6Hb3m1MktmTpmRTjXUyMvBBRQ9OxOEvAmQu0oPZI2dp
p+sGgiiz6wv2Lf/1dtgXoUNEQeNy2yNbnAKe9v4Zr2lmcfG0ZW/ge8F587ke/Ah1IbaVcV7STqsS
ibjjjMhtqJZnVN7tSCWuVqoISc8zHAo+5Jws/CRLmA6DJf9BLa8krcmX27s67s2S5SYpXsvrjDA1
kCVhXf3pv7WjkEu/BnULIFtMq1k150/C5kydXhJey1IknBTKvKTXG1or1s5dEONmeoa1fJ7R6ZN5
9wyYiaoVs3V/OXXoIo7rYnCvZi2FypmgeyRzphTS3wq+635VSXj5W9rW2dzXsgURbzopj4R9HvCl
NFo9XKzdBGJgcm5iTDhHgiejJ7gijSOOxGZhS7leu6vz/0BSd9Zl/r4B4flHOgQ9+HZxsBNntZh8
f4FPN1o61ZuVLrZT76koZ9Xrm0vEm1Aryhz+KJ4pvobIE7yvVdZD+g7eC2FlNBCYmk7oScIjsq5d
gNA/5782ZKLLIGwJ0IXyJjYa5jTO01Xpi2lA6NfUgPFnVAZT25kB0SQ4tZ6A4MkqRZ8u/yc3R75q
V47mocQUSNud8s6lH8kzWhpl7UqNw1W1s+FhriK3mgn9VueHDjZaVLCaWiCH1o5L5s7i3hTKB+rm
/e5L93SbjzVyaGzlffhAy8TBg32KB2e4k+4eBE5KlhG3FPVRLt8vKg9pd+QM1Dp5w3Urn+yUuXHO
A+Mgu/Co0FCfWDIB1c1BB0KrwYJANskby4Ftwut3BxFHV61Q7nyw/ja6/E+/Ep87YKMmvcu8sTLT
UILyAkaCgr4KdY5LH54sCUh1xBobYo+1jhE8XgGaowLLMZp2dcCfVDIDJjG4FzCNsbqrZQDm+KEN
Uduul6iIO45X+CJOj3M2JSYqJfYhYoQ9BcvT7CGTLwDS5U8dwIO3h/R9eV/vQzbtyZLB26lrxBC8
zQRQfx0N41v9Tns/aoS/AE9r5T4lMwCqSaNpkXivhMNw/j6sBgFOrfZa7r9NKQI3c6qliGJjDtSs
1fEO3JmvcjSEh0yUGoMN+Ssa25XtNys2E8FeafmIUv8zkbGRznfWigp3xcPPT9Xtb1z7dVmgRP+p
hIPehup6qYaN9pjMhy7hfCzKneqQria5HyE8RhBORkAHtgK1cQIoOcpQa/tGD46xnavhK8Fxr20x
WrcqFv1H5Fw3wep8ddRwGQ/pvza9zPYmBMj6GcciP1Ey1lNN1bFYIvSVizcVu1odv6Nl2M9eMPm9
wNF3zjVgElsaQqB3WGGlAVz17uwLOs4EeVwq8lpX8eVprVusvuzISml1dIaWAIVXSG/62epAu674
XlMRkTgJxu68y9nztb4pUil8cMIDisH8qRTbUTilV2eiGUrZJzJhIe2/Vd4D8OJda/0w3kKM0iaW
VKe/8TXoDm+MWxgKjnx0fsezEITBls8wS5chC6mTjrjA7bWstHzgbf+sNnjmWfP6TUKX9ug2QJdf
Ckv1Lgusl40fRzJ2IWkr5JgX5MUrXS1wviE5r7r5bKz+ZH0qewB3w+Uba2MxVReZkpe7au3dKBxf
XyT4+G3d2LQ9Ec0FvceH1So7MnUPp+hnQmkNUhFo8F5PmE3wJTeF4pYP6poPzAswgYN1mq8S/tqV
ti0UK0A+sr+SFIpwyjA+O6bOMml7ePk1W6yAPUy4tNlReoDJFMJWWfS+W/hUgFAVrJQjzXq8UBLK
CZhRC0b2545W0QxrImqOSBHIkqVd0Llvt6emxKmDaPXcI/iVy3cnRIHFgIMyLsIzyiSpQ75lHKzp
4Jdk5h1hdAqHTGs4MB4R/woin+hn+5Q6WE9dMLeBgQPVcw6oiqWAl8oTD8y6at3hdXeDmI8I40IQ
LAY8aCd7oL2iWjGKJ4EC2MEycwCoiF0ZoFXMczGsRtxbJZLdqzzKjfZO3Z8alGKS2nZNjKlxk5Ls
WA4G4Wtl5k66zrhBjOKm76fcSRlA2MdABr4ligJf1nbmt6v/Vj8Xq8aNH5m8X8DN7KTUGuC9QP68
6KoKZ3LtPdmw8Gq08Wr5yQDgrgv55+acg4zNenwdFfjJTRDQXNGU6r/79sPKOmtK5fX35CCQossj
ViVqWcCl6OK5N64P26NYsXdpofHl7aKOOUvqEPMh3bNVcEJWAkVz0uqoBkFZHR/vp1NCVRlGKw6R
mMfCUv3kScAwG2G2KpXsnaQsoFacJgIkCRfOwhFC3/FEmrz/N/Wz4o6hbZznmnXscpESgxRRf2BG
zd/1jPMTLePEFbRsJVB4EtPRZ1BRShyQV9Gq/PfkgsBfz1MQpPMBPABtSmqse65raLCRInUFApcQ
YMFYFupb7gK5lE/I/+yx8PMy4PN5GYr5QIpYlcY82FKupHXneC4v2cIxBFAhgWrqueyHoehjB8NL
x3lQ1KM38QP9ptIFK74c1Ttp0Ksj7IycIOmlBjHcfvdWczauooORtXmrE3dhvh3/gox7ISnDNgbI
sNRNfomtX+fjlTlgeL2B0h4NxhT3odhc0AfCw0OtzNM46q6hLdig7KgaHjllB2acilovN2S9Gkj/
4OqGYbJcV3mmr1XH/bAimCKP7sXAJ+kEv4IJiRpHKIbloTs+10BdMnyEXDMkhK3BZAJ3wc/q0dbu
VqOBSlbNb8CVyUUa3KB+I68atIdUz30cugR2dASRmhj2bFUJE9vITgIaxaVDyKhcXATLECtjSMhQ
oKGqG3h981Cz7uTE0HKRUQipiPSU45GB0YnhnZ0RtfzMI3eQlfzvnK/XuMjNFVuuBNvr2gJosqIU
IXmzr6hjm9m6yTSPNEiAYFpT2LEuYMc1+yIlzPZa/ygDZbG3w/K0hqT0kB91MykC1W16A8ZWw0Aj
qLVhNG/DwPVpOI3dIIf1cKmHB+kRT/WZgw4TV7ZLCM0FyxRvTRE4PRiDFIKno4rgPyJYC6rVvjkR
I0Bwdnh+jSAQTjWSHKxqhAvfEWWw9ArSNz4FddtZI6A36kFyhE0YYdhuVnPoHAb1kS2bdKCVPFSt
eOtbrcZdcmwB3UkPplhUxpNwwekRNDaMwN8atEwrMNG3/Lj1z0SrQ+OEwZ7IqT1o5Tz3H6OdR0sA
g1NNncq32oF+TNhYItrVSoxg3K1jLmXtzjdQGr3cmwGJwcPAYEF+D2MEe3FMjYDAFahHzE3WGkCR
8gW6cwJeeeCNWOXjtmaUDGOKsU3U4le0egez8QPEbPredGsJsF/yv497rd/ssT7eDyAnU4o7srnZ
FRFZSRSTPvLp6VfoUh5pF2a+MLWvQFPQUfwVD6RU0ir62sYO65b+TZM7JApsgoOhNywx1ZRImcPS
+iSbnZ0Lvtv9WmLdCWESr3FPzGNy0hafUAhZNwxXbkmklLLBE9d7uV9TXJi675R8AviEWgtjk3P4
CVyLufo+bLr39Qo0Z9kcSABHDs9e7cqRe0BAPqcog0OtDqdAqQm0+cIIVZtwZqAKu3l9GX0Y8Wfb
tKFXSWb+/jay06Y2KDLwB4aKINSamhYMyVR+sYQx16t/RgoBBq3tqwWohaLgkYC3OgE1/mXpGZf7
BzCjEJRyFtQSlV54o+4WID9jkY9fqYv/8GFZHfd15kmCM+V8d3kkT0Xt7Hubrj4EPtl5ogRl/H+F
XXdo/73ea4KMprS4GL61oxk0RqmXCro/pImw8mWrkZUAwLnHcQbuFG53ntF+0fzeNPOsJBOM9BTg
lkr2rYcJH7sYujjw4BNbaI4Vx7AOOPJLxwjSkuniHc0O/7LTyJNvB5m4W1YubPJaShDdhMax0iIQ
GBFY7zvX4q76viDQ8VyTyoXqUxA1dV2Wotee2+Uzl9MM1sHHTBFdDSW1TBFICQmXrfOODI8/Xwil
LGQ0X5L7dUCmP+tJQAy4R86GraI/MUQMTG2WAit/qnhoBh3h9yWumHy1L/CdDNrWsZOLh2V9nl9e
bBD0bB8YgV+t19cG+lFFUGn+ihSaVtDT9YppfZLSSwyWhrXHuJFReSDdxzgdrnbEC2IICFaoBKuh
R+itZAmXOGf7cuVNF9mRNkqRH/o66KIj/fbQ4XztyAlyaD8tPP1K9zcNsEpG1szLpc2HnCAoXKQo
6XeLa2rQZUQoG+EPEWaNWGjx4KOJSO56NC+LW19cb2fff9aecmXvzBy15gBAlB33K6ogO8KYOOkE
x92BPcre5N/jQKrquwxmGSU4CVya5Aco0K+vtw7/VS3ACF3VgeZ161G4h+c5L3wm8QtgEOGBMO/2
J/Us2f1h8mIjPaY+I2ZLd+DmHf/EumyacU2bQvkpoHcy7hUohmEuYMZidhO5syLuelMVr1rV70jJ
6WnDhprjmW1jeKTib3UK8mm/jGzPeFmVSnDTMYGUZ+7g37C3M3gdnVdfm9q4lCPYQXkn6Ar0ZA8q
AJD5bzTRc4sUf0bkQcKNTk4epeps7Cnz1hlilXWj5YzW0MeNbd8DGtYdxqVlfiDpVYnFDF3bVtxL
cm38hqqNSWNbml8/VY483yfEA+UPZ046KVBZFJSv1QpuYEuzcS0qhLSJYKofPRPAfDk1qQNZIbe2
9EL75yctPwXrIP2hSdhojn0/OQVDeQxWBw7ouPW2Ts/fb2RRwxOqXo4vqCR+aEbwFaF0srANbsms
M+PLQokYyUIa3VxwqVHRsek2u1O1b/Rj29564hMSFOQoXX5ZcKAZR1SWRdoHXCDezjtdG2xvMyJg
Qp5j5MW0OH/k38knrNFhrRwaR/p1RXxSZeimwsVUmnC/B8KGfrvJ7hQK6RI0Ik8em/94n8giiFsl
fhbigzuYrJ264xpF7X+LIhh7xrMLRGxuDo7LKOVueafI4TLhcUQlB/OF71bW0Mq9vrvltlnj4ks7
nEJlhXj3/5vH3eUiiGHIM8oi+6a/mIBNfGADcUtyp9MBTUON0ETvE/xfuTFQAErTVGOcVWljrFom
zesjtpUlMCTsqL63XQzV37xkywVTWHGkIDb2Q1l+StO5ZTZQ4qOR+3vHCOLtCirArcFuCDoFeixw
zsdwa0KQw2Z4ctkeHfkAvPd8QJwrUI/F+wLzs7YZnqqDG9rILXC+RBcXTySpjAXCsXqOidmpQhEa
wZI6x2A185l3uAK4YMnZXDaxNjQvisGK1L3FFPaGi0FZoUwlN0QV1XJe1WUNaW6rGxW8Tn9tCDFW
hRKsJ1MNSPN2uhjb8TH/QfwHkQV++OqQ6I5rzasvJ3i8tK4GM3CIMzdu+quZh6zqm//ndTqtEsa4
pdud+WyeXYCMqvp0N7hidKJ0nZKvvvOMCY5XezYemJ5ignxZ+Nw1vTg0KYGm1tTLQYm1qh7Q8r1F
sMgUPplQLcVOTSJURvvwUZ+TalC5Tg9EvHNstQ9ff4MLCxJNnMuzHVr/QMnY2CkGJYUMC4KrMpIX
9dIkkyMmBLoMDBWzeG3ssui5REVEJgT8mgjQtRb+3H4by27N3oYeZ1ZORHS+5GIZ2U8hBxpqcREO
MLDfem4QnbH9URJbtJu/jbGEvP4HWQGqnUSoZ3QENqMUi1Wfqk8UBwf0rEgUyxFgZTwBfS5uPVA9
J74iW2GAhjzni2d6b3JdEuegumxGXy5dxtI+Q2h8DLosCHi///2o7M1z1LbKM/ScRzngtrC6O87y
ztttsp1Z/1f+cgeyVdMgKErGen0mAkcAm2pEzkoaqCZf+WEI0sIv9leD0TV4ltcsTTQpjG7qGPnp
3IH7wwL07pYQ/LRntm9b5JPtPlVH4Lj4bgtBYIJ4uJXu0nHdsVT7ffa609VZQ8qArX6fW1Etrm5S
UoaELA0gGmTqBoP2HtT4MFeb4BstNit5Yk7xbIZw4Ljo3QYgVHoqfoL9FGmJB5cP4r6nC47A/zlH
KSjtL4QUGIrlRhox2Ij24mrik/FBZb9JvpOlY7/GtXukPONaIHpoFu2lH6+XQzS4jT9VFMX5RozL
lWAUHTnLZux9YjcOi1OFAXxDUUmcGwC3ebkPOApXbPRGEUaVQANRt25084Y4HwxnwZBd+RxbtdNh
6L+e+jm2+KpuGuIPdKzBb67TuZ0nMdNfb4MAg+cj203lNT1V5PoNNdQXlOBUse7IT1LJRTN9JlGE
9LzQ/bB0a8Vb2bATYjtYRLYKmwuyOk1Xuz//XdsbSbWL4ucmWTWM1ZpDsBt3Ql5K4syFzBI6/9ok
zVVefNiJAZLdBFzPLhnNuCkc/jsXmJKUQsamWT5EFWfXkQ3UkLtYJhGsW6r1TksLHbGSgbvSVySb
AKrc/z0JzRLOtQZKrpvow3y/BqTLaQfUAzaDjqQlU3Mrrg8oEKkQtfUyftuKFtWvdBMhVE2xU0fi
wSxglTD139eTHPszSbaeV9QbLXXJa+V7agmjxnhNZv11ZMFiJQgo17AmN1vJHxVAUWDw1D65tlBc
ahJoUvRjHVoR1IYdtndubOP1oQoPEEu8EZbKAsWZS5LJ1kWfDNqqjlfjEo5XFwAA21UC5+HOtoCh
OLSBCjmJZxpANcqNrugNI/1Ny5oMpcgOzHQzQN6rU7E2heoe9jNexwBPisAHmYoufqilsLyN00Fq
4VNKx6G/i1tW1/T2xVSQjubLMc7YUelDA46l/Dy8Y9LZN+JBpRrxow60a0VTUI4hSgaEKaVHnlhV
1h6lhi2JUzCWvQw2XO7S49VWuy1r6fhTJFVQK5me/K2QQrDkjVGV6XLflPEQU+ln0JEThZC8MaPQ
zH84lmajJG907BTRt1o+Te/mn6j3LnbT70HTQNzXUc6Yk9ntzwByCXfUbc/mf/tJZ4w6KQuX4tB+
z7Hg9O23t+pamS05lYWC83lbxN8YnhtG6ionGfPFJRUl61pUpe1WNYWIBf828X5ELwhVJ9MjoHXn
nKTe29Mok8NJ+8OFftaUdMICCMCrN5ocHTJoRBRKjJEf7zxev04mSBZVPCuQzqbMVkZza24+ReWm
EiJkFVq2m+GpWxTH+nnf58N1L90gfuCwuCJQHAWE+F9rE9lxOY1ZdcCtG7WaM+4DMbh1syNPhiHD
JAayYGwJblGHCvSTTwmQoEG5kmooiEeTVdpKKWfNWm2k0v/TjqDMKl9Rco4O/Qi9oLhueBAa7axn
L9C4irWeEOREKizEDjWV06q7T9ZScv12Ns14PjBNTXj7nvqxcxhKLw535/w+iTNZ2a5NYsuv3i/8
vxegGjO9Rt0/XgDmffFVr9Rm89aCoXpVZJQTv02s5CcpZ2jOHc3tpOx7V0nwpTGn5segczKv2J7A
D64p9pO/aC8kxq5JQrkXvrpyqBxkMAhuPhlrfX40ME4ihEKfbOxIpWLVw+WGlyVapNdlECfiJk8Y
osYO5ZBmeWljImddcEhn1MnkE2X42F7rVfRwTY/mE8zNJXARvuzv3rpvKbjuxkdZ7pw4VsuHiGIy
1bx9AuNfDAV2rTzopf6oiTmZyCXtYUQshS3Pl8yx1RCtwcxMCXte4V8jI3zwFjdTiRUDgW+TpI1o
W/02QA4evJdI7l1fzw/09s92rfvo4v7aOpNA1MeqEtP2gVzL6sTkYDgoQCMC0BHgEEmuW5BcddCF
NJVPKClGrbTkNZq1HoSgwqvC2YHuCvjafqAfmYWSvvuPvYLvQ4wsSKAsVUWsg1k9jYYijV4p1yQm
XKnBJ6Lc7dmEuCufnUR4Nc/McLt5KCRRKxDDTk+Xx9rb/Hr94ch1lMBZvj7XQ0sP6puVDsJ37vt5
oE3DN9vQj8f+vm/ecGo+dRt+Bw69PSGZaw/gawdfqLH0tER7xran4mS+1+YMLIg1KPFXykqu5Qwz
v5TpQS2y+AlxirtHtjJs1kYMu0/LUqavhSZxXXZwBz4tqcRrvWAwyeTCU8IThkvcX+BnAaKGQRci
xjFyVttnA+XDqPrjsi3rbBgawMSKy5z9dHRWIBe1k4E7criVyj/AfdwNm4vw8k5IMjmCuW8qlf7R
/fwGCcEVtJ9wHWWcC18DQrgmgBLq6p8xJJXMI79pXZSajp36fwWMCOxUDC6+gA1DnGn5u6QS/z3V
ZO2wN+/wLeROZx/gbBp1uwoFzNn68IwhO22G9xYfKtXXM9EBKJpifpBdjx0OFleJJQB9ah3pYHnS
az2CEZTJqevB8LklzuUEI5XZavWQ34/+3UbzcINGpGH31Rg/b+6l+znSNLX+DN/eioPNnSsO6A0B
JWm1OQOK+rCY/Tf4LYnFHEq9VJ8UCxrTNLUCzADvtNWqM+QS0/v7k10jlGiVc6dWLF1R+6GP/zdU
loGUObO3bsoRQf4MIrwAjvfK/NASK55JckFxwJ5A5JyUhFVO/jgGpdphTBexKf38FZih1+95jO4p
qdqDFUakyD8r/gmeRQQ6H++CqgGNDGrifJmu0G7pfbx/43bsmt/GATPnjjQUu2G6Bfi/Pda22TUO
GFKA2E9YmgZk3TSjhyM08HT8+fUx5APUIhoC45NJaJUBmNXPBenDAeAwD5oR+jdvhhxRjotWttqt
/0lmBpFy1qRV0GbdGa4IcvgxZjzeecJV7yKv7Se9ggGbvIK9E3pnVfpxvajIscyY+BoCOu2daeAo
CMk96Lv9S5RQh0GiKTVAc2kby73f2JC+nTmQbORTapmeceAVvarXvgmrtVDlblsCRq1pEYg1+AVt
qNMIKbRjgwqPG5ZyLLslgwtEZoihDDhfS/o9QlU4aiYksAOHe7H+6dUv9soUdqsSLKk+9bt1zbAJ
L0ObFnmqk0rvuCfXolv2q+P44jjw9nQw7U2wPqz5RAnii6n3yGIMjDfIYZ8jiJoQy7433WpTAS7x
OWhKXT2+XQ6vFIlM5xk8Ixpq0FIVxNor/pBRP/1iflqW9hiaqbIUYesKySj4ZNlpxY3w3Bz41jZx
qmxviu3IEygfCj02yMbt5RMybcI3vWcI6glqQ73P2NnI61raIxzLS8hnZlz4x0KOMVEPthabMVim
/YQUEUUBG3xYqPTQtOpuGld7OFwPcW836o9y+9TgeIXduFCwMcG4OhaE4PD7dYe5QD3/nMOiAf88
u7HFExQw9mwqSxWL4J/ftyuOku2qb+bZsk+WCTLJmWkxRL3oPmpzPcP8yMc/5vEFDtNNzZSJv7VT
x3F6I5785oNbrckcSPZ//3Udxuqy0Q/oaslikyO1HR3EFgsV1Qs8zQDeOwOr6WM6xahnjUd+6Aio
QIO42TWsP5CadUf3WVyYzJkGPgN0E7GtdSHScOvW5LhYAi9EL+Ro7/9TvySygl+06GOt/+PtahB2
ZlDRIJtVaqYR/TZmLU+c25JUKJKlSfP1nppTz4kW04surBvl2478vmuT/qbW+tOjmZ5xqj8+zZMY
dcSpc2Ks2q+bmSKnKpzs/BbuIFBulysGgfhRnxPcrs+BISgrs0W7VOb9gYDyadIkR3NSqxnW1dXo
D55NzwxjVUJJeN5Ku6fH2ZrmOE2xyh+CP497pJ8hWx/Jhw3eV7+WZIPQsBvh0WkkWCBd7SnD4u4e
cRyt7ycztkSlOP0rvBxod00Cv5n4gfnUOusNWMOj3zkPWqatAB2fXf9NIidGLPv3AE1OCP5QDsA1
JibkAuptRtTO0er0iAtWXSW0x3r1ExuUjZnTIugYdFnf06hZibxBvZXcNjCI3cOR4d1zmBKe3R2T
IedG8k3YMFk1Hv9q01QzKuxYi6SqFIQsyzORakxRkPTUyy4eOIu5MWTZK1/+Gx55iURK26vPcBXC
4LHE+ZxaVjU0pukyQwgsZd+5pGzIAnoRysNdmjwkpwfEeG73ItKU5WOIpE+LR/YLxmURhW23NlZ+
iCo6m27yKBKRrr9FXjsuMe5BSEr2YGABtcQi6Mbd/oQcJGtbD9hXLS4682zBVPKzhSzuIDh8sxsQ
GxY0MMdAXVAfMpBh1eO+2GtAob9tudHI8aceszY+E2t1ixyKdPU9vXrUKDZJU53ADC4wdxu95oNZ
bsB1s9xI98IkyLLh2wdgzZADPEJaHTQdghuPwr8FQt8iYj4wo29wK8OjPOmh9BLV8muYoFWXSLey
i2vUmIFzP0jLaz5SRkJKrCNcY06HtvMSblr08l4dRbQfKRxOw3vXi8jQlAnZpXi5dNv+gxlOa5N0
/DAnGC9MxnIAQBc2UQE64BRjJl7q38+U18Tz2zK8OgOtkFxow5J6QjsBlSJ8BqiOcejlCrsyikuI
3fscCm/k2Z+euT8RVJ6ZPM3GhRnCc2yr/ngKLxDvoEFwDw7bOf2e5Remc9hv8h/H0vMqjMmYqeEX
JX/62WaPmcPkbmjfga0XH5fCU2UUah4eAOfUkl29wnUhaLjrVXz1V7nf07ZtX6OEJDfOOFZZbizG
YL8UlL3xJ5giFynBE0eYstZvH+6TXGX1Vk5o92ZjPp4iVYJMswJ7o7xu4Pq/sk9+FYJQ2ZHv/4/w
9iNCJe72Rx5H9mGWhqxoFFqonR4i23EQRLwQCQicTvkqhm66DVrzOsJ/FikTcOUpiZ5rbjmMFzgN
G4QkdlppTvGyqzSa+L5OJiA6xTFYw1O8ZOIt6MMGS4Ku/cdVdhPDHMj74gjG3V2UQmkXT2YvbGbt
AsGrPcnQmaVhDPHbVGeTRABsgCDIkCVxA67s1l9B92oCXdOJcEMxX+pWuOR/srGdkQ4aQ8738Yd9
fO6AxHBbKvRbwbidGkcBSdNfoZY96R+wshknSUWRy1K4MBmPvf3N+VJjP3lgt1WNyC8psLELHzNm
p+u/59zGID0ZqgcHn8gWPM9XjNPMmrbF6CsmbGxFpkbVPlNDaT62O1D293YTXBcrE4XTUY7W5KrP
SmAOlf8XdFTVaikshnbFTtCYqedKLUhQOqCIkZYUcUugeJF/EICpHEsJMDwIv8Ymeu3e+WFXPY8V
3FlqzZLsuJ0Ogjq5j2ro1m64QzDiNbqsTGcvRKAKtW1bZ9nERlzTl00hT4znh8H6v9j8Pm+3L3UM
h7KlBlvg7hsig+/WR1qCE050PnkMcXePuRLbFOkLSUih/msbnysEAGVbryjCrgCpnpc7x9eQKq2q
0KqpcK+h4RPREZ/jvO90TQdK9JIgONj2YxSQdWVd7gRzYvNVYZ5AEgGSK4zHN3kQRtvKqpkelAf4
YTEqhAy3KXdaHucjk147zhw/geJKAbDQtboJWGmIrWZvnTlmKOzy6Nw94jHmacnLuXgF1vnwD/GL
JSp7VON/UiByGSC9RBt8JceDX47EKzQ95ERdQw1JHqRVqveZM7qzQXHQRBZO6xs1LaIAGwowAUYa
vnT9mw1D0IROvIzLWCSPoXgDRtqKTMdQIvI2B1yJzXiO4OYEPfa8jP/dDu70T6+5654MAR00Bu0+
zLas2TdSzk5/ngyJ4RK7ymLojm8m+Oraoco/j6ONtnsCY96UayX6rGViyyvSl16iKOeNBbpU+SzD
CYUVXdHHHepZ0EymfRmz3JyCCSHiGOwWyJUEjlKDspmYbVklK2Tm+sCtal2q9LhgRozJ/jVxnNAi
NY++okgBjshNirH3EDyscKuHH3eFBeJYb0AlFWqwf+FKT06IN9s+9Y/MEylPwRHIwzEgva/h9g9o
mMZRIQlGUV/ct8qT02XKTI6U4ccXuYWKp7il23QZ3RQCMWHxnpJkDz4pJFrk2aLAnzdsQ+LEpWIZ
09QVj3GrtcmI20tO5APp6MYPRwghedvp/Fj3vn0dkdxzLkPbertE+hySUBEHzRhB5SOwt9GKBXna
tlKbXBLtNaa0kmvmBtzHibzZuZnmnXmJ8M1VvGSTA1h4fkaRYTxlF/R3777AJLudnNtRJEcK6EiI
5PIK8eKJoUbRauRjC8EhsGvcvqWTXL/ZO0fQ0gZVW1j5n8U/02O/Jq6swBm0sMGOeFiEXZL3elPN
v1SYZjPCc7yQej28UQ7ISVloQakNUYA/wnPWahJ7670kPGP7Hb6HS6RIrwqusbslfNbCebIV7yP8
HAoqeAnIY4O7AthmQPRYBldLiV8KNrNiuwE4K6hyeQprbRZXAzJ4LlBPUl+Z7HYfz1cZrxdY95s9
jga+19FO/GodWvOQs8BcKxxu+3U17ATWjlbUqAyvpjtAxX9e+cD2mZVHRdA9X3t4TfdqAPP8psGf
3VEDsCil958k7yJDvsZ/a1Tasl1DeyOJwFraSD1nzTF53JRs/xfSIGAk0biYWtGri/17Rba9tsAd
jlM08OVOubYelCkeJt1h0iGNLndTC2csd7q/hUj2+BnkecmJtC+vUbUegEKIyi2pPmCTcI35sGqD
jF2h7a0ymLbyMxGgEKL3tmoYiGNthyBTwwNIFfExxzeed1RFBbQi+fSg1qtbbGVWxDsbpTErjqGz
L0q5H72Udp81MfcLPz5ymQjeFsSS19fOr+I2MEn7ZuDeLrxUOfiNgkDxrkq8Nsb/VqNNZGRz49CE
SuoGB0V/+SLqfEejYPhh+N4hYXQgDYWI3bhkyLg2SCICjM2GWNfQXXkMAjFl5J8lLMadinfCRqkh
QRy0LuDyNcqzGIodv393zkv+3DXw6peYN8MmJv4i+rgLzIIS5RTYBbQzG8RASwVAaSHFlz90y9lk
1HOcaFCevsoDDN913/4KntwvX9glZmilKGwMsWPWkutId+YHmztwL93/US595H9PlJGFDuvqb1we
AVuQtxRCvGSSW+gc7ogC7z+y6pBeG3BcjZVCC5HaYgQ7olJrCaIwO8EK+0tKOWoOvCImZh3v0GYc
RF5ZWp3FU4q4W5yFZ/F+RBuGyna0bQosm+E9IsB6tjyack/hn67lKhnx6i9zk7ZToD1d64D/u9w6
mo4S1C9uWVO4vM+yMjiHKcox/RNG3bb3+lFCAqPw3tu0IG3iCuoqMASw8qKik/vb92q/sKl+6B2j
hPR65wS6f5yxTRvgFY/1TSTbYcaPKSVBvGv3+vGNhMq2HmXUbBflGMtX3oAe5xWTuoaZhgUf1vGX
+1ygBhhuIZsL0E+Qs1TJEtXTdBpFRClhgCu9X/h5Q2MM8zynOs8l5sEePLrR77h+sViEBYcT9thf
YAy8tcNFfeM6ZdI8Oqj5wgZG3BoJUxMx9bU/pvCv393FqFMy8JLi3uizNtQHDMJu1C6yXSW+1/rN
hkJ27fybakgL0jDXE0/8lDP2VV16fVki5g111HJDpPounv+HQY3YzwFYeGLM2PDs87zlwdjH2lNO
i2ruZD4pV3SfQsU6vPcGqhLSUp0GwMSzrc3NOsMh1RkflZGZAbjiKoINWgkEWBPBnAEhFEsesCsQ
j7paMdy97xoUM8WmWywCpp/weAg7Hr16VjGEGdYVbX0rlppDBoxHymg9hrGP72Xa/XOfgYTXZWmR
CP73wwBZ6MuG+aTYCHlNnX8sc8SoYKCXH5HilI+2sUz9HpPVSt1GoqCrTkzC5y8ep8ltrt2AIjjZ
1mMJ9D2i7tL0KLJdH18vwBgkO9jFr4IJT9tJCjqL6UggFunn/SWZpOVHXOk0d6KlHYucJFbyONxq
aAGS6rhE6Dtya9tWnWrjOks4O4Ayr7AEcpjWDqYqXjyCS1b7PGLseKC3qS55bd8P+X/ZKTUDkvrQ
suo8eNHf2b8OzHfXH5pMrFmsaoxNnOm5ecVF8f86K1q3n3Gdzdq0Sw88RCwsQFsR9Q1nbzgVmEFo
OnDJZ70aJD01TtwWuOiSfST8x0uR9+7QNBpMqM3sBhDOafw0w0kjtFK9KuhfH11tjETWfuSvoQ0o
SPJl7onP3AAGSUnFW+j8K3KAlWd0RRW7IdAnvRcG5Z4ZyaEhdgo2Fk3lFvVYz+r+bTfMzqtpMxDu
+F/vBM8plYC1ORbv1Pj6LS5IzEfO6CTqYAlOtxjEqf/MZRRu2jdGdWPlH7+F5ImiLE8lO1WJrw94
duZiExICViHPPdkwcX3PjUxCQDlmat5DeKr+MA29BGzNN13earWBuuN2RoEfFRHd9DZNUDOf7wlY
6UA2Sn8xYCdRqa3oKC1xmT8SD/ak3NOp99gF6PPf7e7tsR5Mok/DxYzaHWzGmMb5zzxs414H5I+F
rPGrVPDmTwQ/U32BDJYMRgJRxPTr/gudAaFu/tezNw6zfK/tOqdJLV5h49SmTdXeH5YsQovTLw/U
jnFIidEq1XySaXTb4Mseq4gO+4D6gNIng9wHY7Ye2UwYTDFbQW6pTE4L91W2iMaqrrpaxFFZnwM2
EyYg4JXg72kRFU3DRuNHSc5S4g9OIeGcKKpfLDjBzRmFEsM7r8Ef6AddZ0DIVoVI/74NJXgu3Ddy
siwKIyRm7hQjLqOgDzfL5FS901aefoJwRZHGPiAINMmeBHKNk1a1CmZhsMUfHyqhTg/91YdpPQME
Qi2kPvvpadhRqq29P19Cm/NL/YLQv7Cp8pbK12btUH8yZtx0ZVQRog8yrDFkTvdo+t+5sW1syIyW
hyUcbIEUO65KC9vwH60JgPT6zWiOC9tGqJu0mAakZ63/BgKfHxGgJCbsXWv3x9TvqSUTKqvqohpI
New5Hnu35ibtoNj5vR/EGlKDk662WotOPZeXk4ZH0E8N2ozS8kDYbjwISEFT0eLp11Y9fkKH1+GA
j2G7TbcB8qppOYHrEyGJknAsZzLJG8w1eXSAaGccJBFljaRmLDYL8d+YtAeh5zxv4Pyuu9UqjPiS
VXCpWZS9hhVVUA7wiIzuxHLsBfMMf6jcfpoVsvmjmujKQZ48JNiZR5y8u5PZyqcPF9vN7ICgUhMS
CAicvFzqJ+Rw8ONrruJhtluMFxEiOl+00xearVjVxHichgmUQgHrWohrEhmaQ0IFeqwcXfYWpuUl
x5S2bU8+8AzotBWgRrU+DV20OZOARKhlQNKf6HLfwINtPerERCEuUom3lkjuY0mYwayjkZIub0Q5
6uLcXrIKP60DcvFnOkoRTX32uwl7VwZ8mPtiKURodPn2up7RbF1GrQE9EcPc7IIFN/dLPNqwbnxE
b9Xjc0EEqzM/gqyo+cm+9w6H8gqu8sOhn9qAitOSfoDDwL69ijUkBg7+/w1O8v/mZ0XRNW1/GdDb
VrmoFkQpNSUwWHR1Qw+odIxvmD8wvy0cv3Fbm/Ou848Q/qvu0PGyToLpTJR4Y96CgTRXjNTbOB/O
QdrXbuUU6kZl0PrxFw/V4MyB1dTTF8255B4VXIdiJX2PznfrISUZhKxykQRoG6Zfx/l+jpG/EM/L
xR4cfYqs5VbQLlD11+8YLTARTnRFG+Jt+6b13MfxUZJc5noo0C84dcvUBe5GDk8mKOsQ7BC3AdF7
GIz2dQRDmIWlopv0wAe7QAxonHvpipB3m+cC0zVQAUr5prX95ZkNg3w2sagOT5ZmIw86zb5kxlrP
Wv8qamNc0pzKYKx4a/BJETpVWWAhgY3asVCTqju0Pg35wSMR3ATNcwrtVciDoBBkpDAqfSqLda9E
uH+n2cs/nsjeHrjxfk/nV1BNBe9z89xEkW7DAEeMXcXziz6kenpA44C3YrFp62F1MWA3hpMDDL4x
6clq8L0r50WnfeYunvLweyOpYITFqOd1HH+k2tXO/52gtfflQ+nyEW6LyWeL1As0s0ofFch24WNr
Ete6GD/WGCkAV2b/7IpxgnuOzuiqEpWj+PzHI2cKkn0W5b8z4LNZh184uBxSw00LOdlj/qVb62aZ
NxlmCElMfeEM4bCxgwZ1vIGh0m2DeVtf8v57ax5f6YRxnWjJCvZGv2tdSgSrl8TAKVRR+Va4Yj5P
3rX9mtquve7LrHNB3UalF4j5LSnyBM7zs5r4fyxhLog7RjUUloSMtuGvkPLy3vwMc4YMr0hQorWi
M+bsP9109HLpHZzx3Z8GuCJnN55Rh91bbev4OMkyAFRrlkuBAi3GT2Hf6U+HmSrXiThE1BSpAHtI
aNUPmQaeJSIXHSlBvavLLpIaBUVl4JkHMSbA+rTtXvQ1yu/7gTH7xHUWeHBPhgoYEvaMpFomNHPl
UEVvpM9DUf43JWneNM07v4emvgg68kCCtyfWjtLGPEiLpBAMxfV058mvtcHGnE0yAPy2vDBBmoeE
1qm1A7ApjusIcoNRiJ8M7Pd8oPhdpvhlVAPtjjF6KUHima4PmQqyR/5LXji0ijjgSVHP4UrxGEbB
PyMz6NqKuoWFMMB+fnxIbvTsvOJCyHRg3gL+pr71FB/AoQN3wR04cMq953YW+i2eNv7SDmXBXGI5
mqE3UxubdIoaANnTdwBBbK5AQD0kX51qKfS1KkFERU4RiApAjYfIoL+2ByRoglTwhf5Vd6k9sxk3
rGZsfr1Jld6RUA/vQRGkKjFuISqN0/7XziraJTkrq/Rwo3xKpIu3HJnZMJqUTeMroF3i06RGNkh6
pXu4SGpwZsAj3zxTxAahJgxv8zrf/ej78s17x6HVc/6vGUV9Ig9PzRBPnL108LisXskQPPOrNuEW
vCK0taar8RwHy/dPQTh8efcVwYLU0C8w1pUcK4CeVW7bJBIq4JcyzNjXdHg91hVpNxGbCArMmP5P
w2SjeAUzcEaFJMwVNCoDW54V/ZndfYMgInoZkskJ9VZ2w7VXm6fDFfH7NdkSesB0iFdYl0W8xlHv
bIap4HOiezY6wepM3RxbbA5qa39OeM6yErirbREzsmtBqrp/bsDPliAInzBnThBh98VQIQABkiGY
58r4oMBvl49qk+R0cWuY2Q1EPBtMigKuG/HJIM+zzPG3LhxhSX4UkRicjfsbfzTEXHCHrifIIjVa
7aqbgSqVCX4O5VhBPbv22DQ23TbwEBNRzg75wlONhYkDQF0DxDFhDxm/DrEBWiUOWAqBVkwkOECm
dWeoOk6W0yLF2ulg1f9nXc3ZGkoJAfmctpthHj6qEQyvOwhYCDgM4bwMfLB3DqI6t/06+1aMJn63
mlS7wlyaAuXDiAkjxCg4ZYKJM3K+WNVqKko09zNb9Xsjo+aEmjYEN/Kwyw3NwR3WseIfqsnWLw0J
XRyAX9c0C/FNyh5ZP6silHCH59HYTH8cmwMD5qMY/To572BxSSRI0JQo0Bb8/0OK+lm75ZO/MQr9
bHSdQNrVJwtrCqS5QW8YI+rIT+6uHWASO8WozzcMJlblS28+MEXHqt2vHdyasQ9i9A0/y2zFj0S4
tW45eZv1xzKw88AVG+1/+KPNLFd2/JmVCfmrbHpmPZmrUK2YUS+CVYXzH4uR0BiMKHxmijGppokL
RXe1a4OtzEa6drigSL4mF/X61JA/C4f59uKTqiaFis17lGdQFUPkEQagqgCD3avEXS7xi1vyXDL2
11YSQ5e8/L0htPIXwHN0+5SwvE2v1Z6SCe3IBi+n1kjVFGzWMycb/Vwv53h9ixHGyKaluqX+rWEx
FrC/Nlydx5gCcOe488uQ6C9GhK96v4FeNC798U1B4ENsvo686FFN2abo/N2RujcQTxzM0uSIVfEY
ACvetBg1ebdYfelMUKzXKD2GZbrGsmYS49bpci37XTlS2ew7neKYrcQYjYrxmieEnndmyOk4MUKz
YtUaEuess/9uqsUFyzaRtnGdglFMLz2zSOIjTC14A4bUGHdQpoJS+BS/nAUlilqZAMoO3ydpR5Y0
9dXP6yd9oQLCnZ0rOXUwGYtOtQ38SB67DYBVjE+QWmSa/X4/0cku86njjAPWqp3Pj3xdm1LOeGAb
KFp65XVsZBw7fYNJtSOqvcJ+0/zX5iU3EQy9iRKPwDAxoafVlstzwVn22Bv1C03Ubjl3Bai9g9JB
3ADV6VzNLupSS8KLDnPxS69xN9ASJxCQz8eykffg3/gh42pm32GJU1H6AcAhlyK9gVHvVhEFdNTj
IxPlMHhEmK96fkLALB6NCG3+gEfet4+RLSiGsj6lVDm9kR1ZM7wOtnLAQKFyYbMWDGP0UnA6+4BM
yXSIv8ciabJdNxPeV9j7d7uWl2VzRxDcsvxxi7/pqT0G1ROIfv36Vua0+Mt3WxRHafsROsqW9dJ9
YLX4hhSbW0gCfy8QZpSzLeF2WnoACnyp832f88r6Z0+JYoG+tMVSjyM8oAQXZD2qTyIkcXMLo8MJ
NfzzUadfMqNvTRmbuZoMQQ1hf/1H5fbcWUhgfiBH2/3YEmP7wYNmgdK+LVkaEmkJen+xd+LOaKrT
yefp9/MKdbZviQ5HFOiMu6LvGkEIfZOxabyjMLoyIoU1Rdg86mQPgnFU1rHszqCwIMX9VEklG7cs
L+BqqlWMfP8+6PnH6imUPTJyp0oNc1MP7eVd4nofG8UMyHNunhbD5I9PcDzffHAV0qk7KMHgx/Pn
GvldI+V6cJpdeQW1mbwmxCnDdAnIqILw435uWqVApPeTfwUouLBMLjgaLOMDFm5L8hNZgZvtVBys
AjEqVVLXi/oXsevJI2UQy8fb6BW3NN6//qZeaUjqBrEOgH3eyCqJt1OF6CUPZqlJ0GNll5WewWMO
p8mGIowzMtccnCG4IIqhAmaed46Ob+NpVyVktIoxwL+1BWTjb168sIsokRjR8PqFn880TkcTQ1Qb
qSbjNZlfkxNpsQb347mDWi53SVkSzrgLBDxprcup7HWldbY8NqjL3D9DJES/Gd1xX7Fljzf+fydg
9XNPEgK4SH61NvMvA9rSWH8mOrjmCoRQDt5k+iBdsndmd6RBLFXD/7e+XFSj1tkuLbKlY5S8X6AC
rf4uJA7XxLPRi3f0uCibglBCmLdKlzfs+XbvxFXsTTBJGcQbd2BNO83rgxYtROPbTYLJWhwSGy2w
ZE0RSBgK8l76C892mnV+yoPjMJBzpYeC0cJxxZMCU02cqY8l/2GZMdzyIv8isBv+th3GDczPFl6L
dozO1lLud/b8FCZDsVzFzZc+NHuqif2De2BwAqecFj2Vh3u3bQwzuZ9E47xcEQ1lAzTMy56KTD6Z
u84fwpkQrrigYY99M9BBfgErLCo2LN1bJaqjrxOny79h9Hli9EcFDZStWzrRGjM1NYqqKgd45Rgd
cAMG8VflNZ1G35cSMxGXE1orpVQ2vNwHTKH/1TWdKO68kL/4jJJRf+XZ4TG6qd4HHr334AM/kIyD
BoD5uDilZeRnjKcN24ccuR7SfJR4PlU3ETcQs8cQDTRMlxl5631hz8mkULvfIfz6PEavGw+wXriw
QxUKxDkACE3RcZxzoEBIwrONZMG5iMr0JAiWVCIvpNznAxzMrgVRXxBYlW/b9r2WVwazjGW1strH
kfI2eBq4Qp5Z111ygMk/gI2hHosiE8u18k1w2kcwYc3rz61Im+vRf/oRHJ4dkBunnJ5iJGNqAt9F
MlphUZFLoE9xpetOfA7eZEenJHSZGEwoFvcuXEx1TtX8J65g5VmBSIkjuvqolc9r40NoGXywzNpN
zCznHlY3O5Zi0a+Qrvy7cuYSjBJSIxAQQxAgHisYFjWlzwEntqU3JVX381jdl79ooX3H40Kf1GRD
OnFWdE2QHUn37cbYwdxlehMkdQRDv5QKYhEIovDSQ+/cOyXDVlA4FXMzZHJ4ZYZ3EiBw5OjUlPSv
w7ioNbAzWMabjZIOsMvGfdgFWCNlOjrFzKzm6XYeqOulva6bRjSR0B7ISbB8p2EdYrWjiW4M9uI/
EXQF8xx48461wLvcWLt60KI3LMmLrzj5Gc1M3aPZm7cXwjgHqNW83zINDXbZTd/FwbkDWm2sPbd7
GnUu/4SWdbwi0HyAEio1uUGs1lv5dm30kbKOQWD49hqjKTT/Mp0lSprwUg7epiuViafw0rHa8kij
aDBNY65XIwEHHnZzGgXDxrMtgjWkq9vVLwG5rq7N3i8R+DIXN7r/0srtNvPG4xua/qzlhDrFCxeV
fy7+1J2DuHs/ZPrBUqSiCs9cpqKO/piq5sm6wnbDH6YrKdh5sFTM6X/Z57daWs4w+6DpI6N+mMhP
rsKCSXyUk3zdhNEZ9jweW7mgVdz1qTvXgIpQj1wUmjpP+wDrgWe/S5P7YE8Hz/derZRGWA447KDl
HbxCSpurtkXoV0svqINGY/2vLSYq++1wJWu3LORw+XSiy9EszYncVD1icR0WfZplt/e2yG60VGGL
zNjAi9RP4bAm2Sz4gz5zMZuCmPZupXuNRzULv0C0cNmEtJTupeN5z6ftzjnzaY/dtRuvTqeyCXjf
9fyOhvqYCj+Z24+N98i7BhyucCvUDopeq6NLom1ORgnm+TIlTiHMYIl8Q+/lkfc96tpEyzbAL6mf
znmXJQ+7/o8OlbTNfn5fZ2O/Tzt+SfmCbB9hCUfINdJPczKHUwdkDiw5dLyqfRnnhQGd/l3lZLh5
YCcRb8UGFXb0tayDrqyqbIdnbyWU6FIWTuqxrHwjmYb+C1ALl2Bh+3ZziOZkaYV5kfEv0oAwwT81
E+kViMj6ixyKKTsjNubznlv/oiw+YJ3OKsTTW3HT3Fibie7L1wIWP8pQBP1hLAGPk4lnxKAB7Ml6
plOJU1XjslbP06DxHuJya6FKouv4MHqsoAWa0aj8DsrJvKFdHme8smjuINXJGLI3ThIL91Kw47hI
cDOBBv0qKbwDm0lI89pHgMFSH+NgT6CkvJ92lskZ2NISr7rm9XNKSmvnWkWyRawzKuIH3FA2KLeT
oZbhfKtGMHQKUI6B/BeJQ8Z1sIQk6Qm7+/Ayo3xifVYpJ++YZWIqVQ2bPHtr3DkWd0VimZptGgzR
jXmJHrNjb0NWLdeODRr3CCpVdIxl5VKOcX3ZJ2A/eD9CeHeoq+36C7if6TKBthdD9RrS4IQ5m41l
ogBipaLExQsFmso0m3n3a8So2oQZX4fX6Pf/hN5ldZBVipeVkt4k4PEzAIuWou8QeOMIXcxirv7L
bh8dwp6fDMhQBr3gtoxLoxcRpuc7xQRleXTe8atDk92GA4z9WQUvjbL5Zl/v5j8DzZtlbQ6+2us/
nkUl7KSTajlyg7S/lamOzSbbq8PmTc8HJKVKif7ORBbFKWcCGwnrLgZBWzpVg6PIvI9j/1Ziuc2n
i7mtmjzs5KO2CjiL/eLvzdkmWE40zK/T01+enysWzDz/qz/MOi/se+dTxdliXvhvNPo8M6qWAWbD
UEAnFRCaITf4/X0sH+AXFj/AwaEJn5VumVXpvgM+VnppfvEgkv1ImdcX6QqdDwPkBXVLNQXY5pr1
iMo1X0X0QZLtQvoPckKI8CPGRgELPsgeUw8cz9dI4LWeHJl884km3qy9xhMWanYRYk9s47JpGmsp
eqUCLhX1qR49NcZ3Iw8Dl4whZENGcdQ/1pznz6QGhQ1XhPsYhXjj2yNrmrezVOkjd3XPtOnXZ7Nl
nV9L+855e8L9fEGdIr13CfOc6/Xg1LoBd1bjxDIiQOn+Pb/SCPi4eEutF17tQystWahGdm5LfZNv
8U9EEmzrXDu9hk2EPUBg5eZ5P0wJ2mfYF3qCHFtyattGyH7OE1gXamO/yeBsQ09wWlX1lDTHPGhq
XIkcMwGY0ZKrKgS66Ce8xQahJt0yPwfOfHrGALomOXjtG7oZJK1Cpy4n48yaq9OX8VC2DdrV8+//
DPUOw8xafo7vebUvi/0NCjQW4Byv2XViVsoN8q49Nj251laBnYcRMBqqejBDgbYmNUgqGUuELUY0
SICRNblHbmLHZKF22PiHlTOWm79m5DY2qCon63F3rgkgeZwyYGy5JsxYl0VmTqYJrs9eHltTg2JI
BDoZBmeyqTsCNEx/DT3bt760vQtmx+W84Go4EssAP7W8bZjPa1fU9N53FpyPWHHBjg3HeAnBOMRY
sbKHEleBzeJxhpvIjMCb+z01JPgXQIiEiQ2jN9m5y2h9l3DhrRlklENxrYQJhEG/uLXVUQqvif38
mleTav2uRUgwo5y4oGvwSQ7RHBth9sFQ9EvdvzteXs3cxuAUJ49/K8v5/IBhIn/9jifaeWxjUy41
VunQ6y0OpQrzC4QRG2jB4BmyGn2yLsmsdoNnjASDSi04RbpcbM789IqJRWYm+2CUmECC+60gspDY
PCD55UCSD4syq6A60KrsBcGXn6My0BFuG+UFUKeraS58Q0MzesCYLQQFSpHYO7CRcbp4k4hiLr0j
A6QRJdahTr8AnxoK1NbEbc/qPcxfyEZtSO7IBWV5IyxPfJqUqa3NlUykBwAENwIbk6NhSo3ol5Q2
PscZtoO/g4H1eLsMmRXOmohN9ICoXv+Vo86fl1fObluoISXnFqtmmbXyYiN2dwO+1bpGFUI4c4nA
IREcDq7lBXuoMYc/3mZQ0Jgc/3//ymH+rhLhdJ5Wov5MpKdBkdFezSjAdjQna9QztUydkyWTPBK8
o3XlW5HiGspAhzvZR6RmS2wHUGAgHitQ79/kQFzdA258KWY8L3tNWbbJw6a9puPp++2JoDGpktsu
Zu1egWlntcQIKzSWEPN83hD3TY0aSWq9uz3Q/uQIli/AcPb17MptY/Q/Hh8oTVbqQSZVeBYOPX6K
42EdxPc3PuZ4Uc2TCm0p0h74lUj0VGuumxhV/qpvfGLLav+JA9Pk/dPno5L1JSfFx0NKCfSdWVWT
49mW9TlKqO7COZ15mWe7/0rauz+qskcYAi9wcjtsH8YbHCPmtuLNC4L+ne+wWuFUZcScD/oOnkW6
gnQSVOQQb8wUh6FHZ49awOuWYGeiXSVOeOQa4+AXp5m8NoLflTQRKpCIrHgKw6P66JnPxWMtBNRA
WNqBoQvGGeBNdq44KBGUnP2XNirIwcZbC/jDdgg/ETkMbNnDTqEGe/7qPw4CO8o6WQ4hMqOsmWvS
hfcrNOoqwv9jZpUAivVxtRFo9E8WItyqi44sVyzNf4Ifr/WobCnyy+fLMossnJ1J1suKcABpxK9n
iiIydprE75DS9eU/JW7PUTRy6m4oDA5UDAzTQR5M1LVy7rG/eu7XO1/2kTJpR+F6poDspxsB6p++
YBE5SI/PQIPIb9OT2DlTw/6drtO0vjaid1NUomBzgNh9gqGi/6uYRKdO0s4Ta7+SW95Z4MN2EKV+
t8rMV7ouzi3h/dkT1PMUOpD9bq0cyzygU+QJKPtokVjLII+QT5xi1QgA0dScDQzKDg9ZrdurAAIz
lyVVtBiwO5wKyB//STj8VBV+dQ+gAyY/gaWkmPU+5XUDX0NvTka1vFLyZBueBDOjeTiiiQf/uZu/
Fo4UoBtPUG4PDpOYQJkMYeUg88BjRz0bOmkbUmUPM+HV7zUwGwX+jO6/BnfV/Jzicy5YI0Q5psHF
1mtL1xWXdOTJyMdiU2aSESPsYceIrFZMnRCQNJwMaJ7q4M6Huvei9WhfP1pAJ/MjkOMIVZ+1t7FQ
4GtDKu1xarsECGrrciQNMdeqEjONtRgYC/0iEIOnIPh232CbaY20XKRT2vTIfNYAdpg7kS/pkUOY
loYphXwMLmPsd4DTrJumU16QUOWx0zO7Do8ZRm8upVHc/RRr7OUf63E88MPZmSMDDf9zlhT587Xl
KN80YjEs06sIlGfuwj7wnkpMW2CZNVqoUuUj01J5tP6RmKGZOC8aDnuMp58jZq8TfK1en5EUgoUJ
kC+VUBA8I5Cc1g5u9VzfbSchi0TxgupGx6ZRghS7eY1pYDtJbsoOuC8R0UuodUGNuv4c7CQ3Lr6a
Jw7m44GRQojAwj95XjPmQRhPUaVLeQOfPUZ7o9EwhdEtaTzN7G310MnHEUtw4AvqIefnAk5IJ7wZ
w+JJmFgaNI5UTR5VjZJdn9SwNt27nk5IgCGt2FTmEjZj9hfF5SMN2jwi2FQNDd8FD9lSuu83RknY
NndUWCswEQRzINp8wtCjMGyiRv6KvX+9TiILvxMwqDPVZeKm7siKC0Q6OpO4RiTec6+IfPbNMG9D
z4E1Vk/oTL6MFfvJGnvGvBCQlrc58yCMW/WFEOoDhhweBQ43ZgJJqaD98lo/ADgNr02Sdyu5NfQ5
yX0DPZwJzedsTv/4n+M4Hn7Z68Jb+GH534H3eufpwUEd82LL5lo3ZJ+CmXUe2S0M2Rro/w0vd9hO
ne1PCk6uw5xs6m/ne57gNMG4EKYu2NTM/KasFmZtb/OsmKqNPvAmuzxHAG9XuD+fNSZqr2BgCiNm
QBCmY0l94mEuer+yawtwJrnkg6FsJBUUgdZibYb7HULBh7UYpz+HhSdzhfwMWZ9XLyyKcDEF+sUD
2Aa9JzFq8qPnQarRfSdkqhjfv8dn6Uh812Z1owD7L4uEOtOeQpM7LToVenTcp1rM4bFCcQxoziEw
MCLyYEljL+aojRbMcNW4H+H/29ATo2wU8uddnmAigXVxoL2owzp5Vcrq4GU/cX3OZv0UiF145CRe
nRCAkVNevqbTu/14qNFHnQpBT2t5tICeuYwfkNn2+lLY2dOB1t22ukYACN5DNJUfqeSjNMjApKbc
W0yTCLkddIdk/Bk+mjFmxXuhaTi+7PeAZR6E6KA4dZLm2Kv5AIS8TRYIFN/H8tHbCTOpWVUUaQNE
A2v6aK4wjy9BMMA3tqKQqf74SLshP0PwoG4WWXyWjplSLN1DmJZvmejISw+3v5I1Z1+QYQqP54I4
vKU4D0YZbZbFfgVM/rXo9ZGyOFlemQcHaI6v+eCW1L6rSvxCxc4ifLSEQGi64BgYZ5QIV6g9pgiZ
knapkVPddRSH6IN2F5mEVyn3v9tyCXUPNADLpcCn1Li/ZmWkplelMFRBDLPjDtlg7iLW73eawx3I
iERmM1zIz3wgWp+qLVKRchS7FlF7dqoNr41duuC8kxPLSLv3dABHOSCWxF6b1gacioDuorE73hEo
i+gpCXhyrtZFX5mklyyfELKoHk3JhkVUgeRV8mewyOHq88Z9juF9X1MHA9MIwVKgkpJI64VaJ8wR
4oYqUNphAExDDznTgHwatdQLCEVL/7wtb4nIUE7jT1h4epwggGrvaiZqDS5T5hiSTRw/4IUu/OwV
ct5ZpdpwqGJaPPb1Gd+hgd3A9P80fJQWjKBJpgWW2nYaIG9Hq7Ew7VvIES7rcAOcgxCM70FWBJ8W
aVzV6Z+9EiQoKqR+PptznjTUcF1LRwolKqaJSSR7/SC4AUffBblNEL39XTYLY8xYLlt90Kt7QBHC
uNkUvgjaJJd4H31FImv6xebqRTyXvW+6yspH2uVWiaa29aL6r/b0FgDHVItJtvt8ySyVL2hDNNdL
teo5eX/iGFKCCVtnRH7EzxvVHsd4XnzCWnSQXnynhlh/IeCAXOTwq7AhjQewYfol+tBY/LmQIzdw
1holNrqweJlkymAljBG1h/AZ9eAxNn1mfGoDGqWE4eElXzuW0uqAank02Mp58uhl27ynlXNK1pie
2gyXCIryUx6PmD3AdOgVoTQguPZzhVRvT1Pb1LHteNWZsoB/PtFZlQGihSrd0kYNvv7I6HXZ7JLG
20Up15YOvtALRtl/yXclIH3elGQK4h4Q0juwANjmJElh4HpS/qOjeBT+sWDxk9OVO8/94rIdx0bg
wtwtGXY57/lyQtPIGL2TymGJYZ2OHi97JtCQmlX5fOmFK4JssA9AXFAMbuG+qmAWwlrE22G8rHCw
IWgCDzaXAlVu5PwsC+PgO8G39xBvwWoewEuwc8zMbfUMwsqqM7Px4EcOvKhTrwvXILqWHIkQodOm
hkZoTdbsa6C4ltEr5RkRKULs+UxVXB1EB/x8kI1BaKVsnEqxGv0OtkbQhUx0emgFedMDxkuSnvRz
0374MTAUcuRIlVN3zOWUh3E1nvCUMBdVZ08pBXLjAaPotn49FnTtRuX84v6YLLmip4b8N4yctm8/
W/wOZf7u7+Vi+GygbfZQfjXZQoad+ENeuyJr8kohVBPsipGSy3UT2R2hWLa3ZLMHT30n5RZZBTdG
jrCR9bosS/erR1EEjkLclwBFKiHLMhXdfUZKx2MRE/9U2AWNUO6ze+Ph6hy4Zs/EmeZpHarkdg8p
3AeasqWhICk1ikFfz/TWh2VxwRr/4S9UL0nm4TUYbegRqPgS7es174AkBHDUC92yvZkRrawogw8D
OeHceffKZNxU8fjdpUybO4SQ511bwG2UU2hlB/6WYT5IQruBFmmZipEs3+uRzhLmmkUPvNronuzY
0+nr3AkUy5fFlP2il4Evxha642CDA1/HYdEnTukCcpH4gHWbbX7dmlbcU/b+LaV3YFmAG9piXg68
RVtg9qjWleAEzTgyIbcx7bGg238Rx2kyWJGCGc1jUoQyvEfgocJf7MUHvEi32B8NM0IzL6Z80+2+
KoWhEGCDV9CtfaqJhK93TCm1nUPZz68r3kO7EVmv92wqO6EjsDgciBvlGWr0exbbDkrZ1zalE+lu
3PLVH6Wnds9HQUFIu4SYN1KJWk+tK2ApjZCWuMMdesMamFMuScQ4ofCIIx+0vjGTgiKBu0SU9osn
gWIyKsofoMczlnmECK0GDNOWQJD0BLDzuVtcAoYWCra5JTqT2CcYuddIeWNMfXnFq7z8VCsw7f0G
rxmCqaNOXz8/l/Lds9gh4NZL/RpLXiILPti0VnDHyv0+5a4gRYgglZWc66cBbWg/tRYU6J5bvxf2
YmAqq7+3y3AN8f+BBI/ettrEqVE4b+B1SK9HM31sKFeOlHXLnrPvYlFz9T/JPP3cwu2H/3+1nF10
fYq3ONiNGNp2v2f9M31Ty9Wk9dqkr06wz9ngfyBiutVTOLexo2o6aq00oGdV9/bWdQ4fRyaOIXli
JdD+BhVQEZevTnwsocvCwEeck30d/Txqs2KcwX9h6nPOCrNw/gXzVdR9TF0Gkml2VncsXjXaf+IF
1fRN1h0+Uc5THYFvKWs2mC4brcA34LUFcFRYnKa1zYTGvhHkPrZK++5S10MMl3JoTVlKfxxkb/EJ
bORljsrFnesBrPrJ1/nuf1zZe5OiiXXdH4twCY5DQgLW8pi6uKjUKHQ3YmmLtJxx73/jDbQQI+4u
3Iy4f6CD5l0VpECSdD4sng9Vrm9c3SuTrcJDuqDsaayb7EqPavrxxdS9v7tcJB90M7yMVzhfHRWY
NPcxW6O1UHEIgariR0nzp6cKe2n692LAcFhIfCL06woV3TzcMp6+ryg8R9br1hpED2JZcZWcCsG+
hqStOrlTYyfEzyHSR+PH8bSXMlMNV2lSLhB5RMAPda6MfI4n7x1gD3ux7B/YvILqHbCQDJlpVQIq
xBGZbdByM2A+WLNMkr1T9zRjl4ksjI4NcAeblIBtbeJp+3IgW4uWpKKv0nj0Qb5X+yxcb2robzbX
WijQWH1/YAjxjRQS2UivQuUi9RHU28Cph70ygZU0Mt7uUaLo81kolt8E32pwDVXWZWzH/IpaKwEo
bk8oF1iSN6aRdxL4ocGQPwZbci+OR+/Awf2HcxQHqTUFigymGpvnhzTR0oBH3Z0Em2DmgMsrN0pn
vF4U3FMsF4vHHLw7etVzMaPeQP6jjGQ1MB3DBCnOWwW9lclgiIOcSdMI27LibOW+umY3LphyHOEy
rXHXctIXw+IdP2Bsv/kkkE0kcKiKlMV4E3eUm0i27NR2xNehDmZ8tPdNqzQTwT/AI9Pqc4MovRk3
VaXRV6A51pbu1WRrlxln/rdQKNUOZNbkL/g2WcsBnIpri8Xbq6CU55L7bz1hnY+nI5f+OXN4XQY8
E0AVDzBCmO/u81IuvvvZfs6gDFgfj3jips6p+McMDtWvXbE8HuhT1Mq1bz6EeSOhX1ZkFk35/oln
h66kQOkMv0/2kGBIR3NAvKNxZNRJO0t+Xtsph2lm1zDAzDu0YrILU/HDLkXLILpjQxrvdLidCEc9
mdnwARES8+BYTQJGq1U03+VkT7VBHoaH7mKKgkYqeyv2vtr6ke0Sm7EG2dxZXciMoIb9EDy1KhSk
diCD0kLedz0+F7GBAtUGMuTi1I6rn4+LVI3R8779khFyid79QF5ssoZzlK1h2Bm6jP/EDKhnCtbq
lWs2FRR6lHsFREdFMYG+WQ70+tpZ6FHZbUuEuURoc+grJ2U0WiLu1MBq4qfRVcUBrlTS7qOfjVJZ
yLb77P3bvrumGEIwG7hqulKokSr4SG/EcgIOws4DA/d2eiF8KIcjve3jxd6sUpsGO8Yc90FbgQEc
h3OvwUEVAkyBUT5GZbGe3b/DygwXZvN73CRcWy7/YRvA2S2BiBKmMsFf4574rg3U3mzsBnmgWKj4
+hTgw3PmM3lua6+qf2bMzcJiCHPASFlX4urRC9on++hQsd2ASmDIUAtbUluY6UhWD6im6sEPR799
/6ufKbTdo3A9pp/6d6C/rpgGfy1MLsqznq7zaw3lNltY7EwFo9XPIPBRpP9nahHaEIzPW6rzhuTI
Hn4MzyZViIB+VYJ9LCb+EblGk7wyzao2rKo9c6qUSXd6Y6bEMcwBIdlR9H8Qxhj3d+OoxDtQokXn
RpxifPTSdqGvL1TrhF0YEaVshYE2BUETxFq7SVwrUP+MNnateTx5JoBrscWBi5w/tO05TPX61WoU
nfiOaOqxXPvKhDQzjxNF7ytNqWcwOgomudZw+RuaZrD9pjKOt7vcxahjuvoC+4NPl2KkkCuXHQsX
wnvWgiH6ztQ1o0DEDVKv9jWrnUGEEzr4onV+5zMHAf9DhfkYbFRQzEYC1rzmnvHPlVLqDETelFld
Gh0SXmko7Ah7nA79+KHM+MkJJ+1+tQAM2VPkR4EoaSjLAGYTR8tNkSaIcleAQgS1J77thR5CSmnr
SBNmGLZ+d6uuwfMS4vy3Tr4eWaWGCb82IS50KQ7rfPtNbMDuo4rtiODmrPSb8+2WSj9ImUHkgvTF
gfH8s8PiXRnsFzTJcKBYxxx818mupyt+rtmRCU1291YpQ8/yjOovUhGrop4ZlgSlTZ7f9woLUC9H
TT3ReFDlEKPJkALFyd0P5qlRbDZdEK77oR6tMiWaR19996ZrWY2zk0o78QqBR+ZVxYqHgjy4enO4
eI48hhEaDGIBao0jy+nIcl+xNdA0dvPgQgtK6wJsflphd1Bp5QkSACKEbwbIZMj1IIII048mRjt+
GZzY7twMRVd1bqWWePp7oRYPSyhpcu4RQQhW8A0BkGRwwkH3Rw49K5NGCHtjkS4HW+csekRTeBrr
+aRw29zYaAlv1sVkgC7HcosV3KzWEjE1tgiQ1LGh0uEwbXZGVXfwzBdHrNa+VdAWJpHLZTL7Lur/
gEZg5YVes1WdMcOO5L1YPLwPDR0d7JoP/IcGVFKpriyoxH9vAWLK3TXSp0azrNKeXmhNftWzK3X8
Wvrjn42oggAYd/AchxuQY3jdOra4+1MxhMPh+HB+qSmH0nyMNsvVOGLCm3t6+ymmHnr3DJycu7GS
MjcoTPQ7APBvPN3ZXvMRKfiqGV0wAxhTqTgYyojnP3657QzQndMY5uK4G/yh5KRKi/PBQ3kVMfx8
ityKA21DRqMw5Ps8bKQ17148DoiihkSoIIONzxzDBNAXuvP5jPtL3FIQ7JgChjGICgUqeEQFZAX6
2Yfi2SiM8i028WC5iBTD5uxkXiUFDkD1PrqPTZ3bcOONVVPHi0l/EahqyodK1Ke2SuwL8ptbBHeE
oUh7ix53OKvnPG2bNqwAa4m5g3bbo/syRqJHb/I4ezKgadAlyoGFiCEQ+vBzDWu9NhNXbd71dZjz
xMaXQdldfDl/nWcbyTrv2TRt4bNl/JFW9FXh2EZz0uBIcumKwiUWiev2LMyHon46dPcBNqalYSbH
eo45LagOlzcY1LNAj+9XXdaRCycTSL0LRX1HVi+cInM6FcAdqG4vkpusb+t5fSazJX8ezdaJnqlt
oZoZaSkte83xuNLxn3rdCwE9XCuyxig7YWmi5zNpdfhiYUUAthE9c6j2L7vaBd72WSb6/oYeTvNd
4yVnNd4Xdb2AZN7I3DWRc5p6B311TOi25Zdrmg/xDtF52UsaXQgjAYQ+dnR55lHxuvJJXlWTDiA8
OgMojHgVtJJLywszwNQBmIQnjuH/nnVeIwm5iwo4uoMohWefiI3fr4KZKYAigfS8tJIPa6DlVI8e
ht+guxDMlWR4OLsmY72l3njKv1F8XzR/sW/ha6ziNHt2f4nmTHbwK9Xb3/l4zJ6pZIng2B2WQ2TF
ebOJKG1/j6ZlOOY87wDUHX1QQR1RfOnr73yxFZ/dY3CBOUvwWO3WCFkI6cL//xoBJFDTH1eiYsEG
stEFTcOOUFevQctxB857Ldo5ZAb1ENZCOCl77aFV0b4Imk2kCVKNVX9/HBioJ8BAU+YE4+bb/tNM
FgTlfu+8cvVAgRfnySQXiHfVEOCm02r4FBGLxVuDQW+pRvJC+9mKQBzezVZJ+yKTDI/e3mSeCNRj
yVH/I6C+S2TQOHF3t06AzjV+O6nW/0klkmoEXJGILg/J7Tntv0/itcPt6Y3o4Kah0DSwXVTQb7Sa
PGVeTEYMcXKbEyQNQCVJeHZEzNTqc0IZ01JHOGSEpg6VLra2puF0sWF0QGGx3ejJ/n89Z+dSlZrX
F+fp/TYuT9C9uUC+gixg9flgJsrCG9XyBlU5dnfnOvWr75qwSlSyp+uiZLDeruHhfsCozbD5qdBB
MBTsq1ohZhyImvHfNyDewhHewbBb5h/ppzGaxvgAs5sIbPvBAp3dKXThwaItgu4IGCVFAk7WqY/u
DH1yJbSb1HhK7/yYE+QD2vbZZmA0/a7fFUJ4nZ3HoHwFCrAvn8bN1cM9rg8qyegRaUIkSfLMx/bY
MGIhMKtZJC5NjhhI3f8+/x1Zb0sXDKVCo6IfSH4D4FM1M28bboZQa2fij4jldWut2yJGvI7+9rGF
v/NRmXqyEvq1x7M/VElP/vPnSFfXKXYaG8YdJDEh7xKXu+o+x/nfjNIpFHcC429AFvZy0ZadDZ2u
EYPPnEHkGB9nVVbEKc4IWsJUKx4vZDVV7Ql5obmUOWXgskv5kclAxy5VH87uVc543Pb/Dapdrmgk
laV9Nv/FjJzRSUSX0GjQLR676V/ej5pzHRjK8TMXTGUUUasDbdpHpXihIS2bNxdHO8ESS8hln6c2
/9a2IVwNvBx9BYH8MUTQA0dWIEtn66y3mhIhWTl5IRx5IXIjAC5pBIJIS0CotiL2LSduuhjL+LNw
KolqkvikZZaxLHMJpfG524k+NQEKVFBY7C69qwVtNj5mUGAwzNlEfQuox1byh2TZtx3dHEsxMVq/
kyKai7EopYJbk+ODu0nDhYinlpGxN4cK7zsrh9kTd7/sPEReFhHKbU9S9Oy6cZdBNjOnydYm61iE
V9j+YWdvQvLUjFLENzABPV8NnEawK6J9KnHuKh1u3CIX3tD4i/F7pJgWdPvsb/e6ZVNWTSy3GIsZ
PWEfeThtRiTZayvqR30XRSI8daEhC97+J2stmRj5mtOJ0vONWRZ0qIbz6rlXop2SMQeNS99PrO0H
VjvmVOTBmXeBvVdyzl8GqcKKzRL0PDehidbTNMLO1wzxg6R+8GiWxdCte79mZkytuDEW1w3eGfie
wNePJWUlHO5LtM31kL7fXcyx/fiMwQXbWEp8gknVs2LkFcB9N4qi+KyZFEak5tgiEKKgsDez4WGx
2RixsYJ4Dbm5Kmx9dl1D/7JJe1W9wzYEO3isyYCvOvlV1mhqS2YE8yIZhGZ3rHntXBTZtpDjYpRJ
vxA4+Cwbx0Q/EWqlK8IArz5K/fXDScBWOF3L3y5hVXgS8Y8PkKW0bkoRezdpXRzMg7IHXuSosBuc
9XDIiCgzyYmWSMdVlQFNDbDzJ4EIgp8zPj0M82XwrBGWjOeH+8nLV7JW22Nr41UWy8RJhl28I/f0
qv0Y+8lQplcbsaFc2osOa6DsbiAA7mhE6ee+EBSSYIq7OQyiyJgpx4zl+nMrZcTaxmAAT5Aq8b2i
umj54jBp2MVzyiaMSyNtMHILCSosJO7v6jVARX8+fm77+g7oBSO3b4XIqhxl/C2ojSgyd2aWlYc7
xh8R5KxQhK1Pfa0HY0IQZsGmALt/wbCFIvoii94jQh830Otu064bXENrnc1Uj9t3FEIg6Kd7Xvrr
/FSLqFhqVuCvs0yXGNPs3yP3Qb88bo941xsHO2uUPuC2/AOC6wkD4z5tPka1QdFYxVTGwSJEeqFj
3fPViHmCzySgVpRAz0nP+gg7XdHQVr6HXvrFqgXN9b5HBbdVzcyX1pZWm5M7kO1AF5Jy+dTxTbiU
fXR/L82JDRySb494lIikb8JYYTRsk/yQghZcC1V77dRxVxUJLHxDrnfWJzkH1a3VgUErGYYI3TOD
O6rPB+c2zKtCT6BW6kg1y+eP2NtbHr1eoOqbU2AAfGz7ShcWpecCAW2xHznbZRVdEd7zRUJ9kKF7
BfKrTaKvD6gvPAvGsy2+Bdu1YuwjMpGuRj2jSi6NEN7s+V6CV6FZBYim7Bl0it3RBjVwUGsLGEnP
A9MuXlHsOv2yHrIWZdUbgpXke2xuFMDzERC2sYYbImENxp+gXm8HHwJ8dzqffdXDm7gRvA+tqomB
2Bu38C9FH9Q9IOGV9K6lKS0Z1SuuolxyCiXOrUWSzlH4HdwZ/i6CBHH2R8jUm0ieUifEGQ7t1SoI
Qiu2xM/5oq2Z7VEwlmbGAQdkGccatXJ4v0qslxrt+BYkIcbx8FuQNU0Ma0vkbpSYcBovHAr4tcCP
p9h3f5t7Lvr8Q8QT2BzZwz6zTFXtmjqcB2TACdL54CmO56wejHwBZ1NzxyIfB7wLabeug7kOiblp
E2rqtndPDCPQGNFCZVnJSKud8qzJg9tEV2EcTZbO6Q96FTCyOev+mwfQpDsUsp/a7SaqiNq0iEII
wtrH1nHxH2AZm4t0xiahINL7IkVZf3aiyMDJrRbkBxo0Yp79F8Ey+nGgOj2q2YjBI0R9USzblb6D
RrL9TRjqVBAK0ObFpEmOlW+Y7SMm2rocbOzFKDXLjtsXzzdpDMc3paRv2pfJ3Kw8/7k1avdGrVqp
pkXvXryObU0A0SzKm4WQkv03fsKSEN7dMIY69lS5PEYq6sl2lomue3Wsx1fUrDo7dJMiBcEnA0kh
0Tr3dQy35W9fjixOv8gdKQ50h3t2fJATZywZ5IJ2+gRP+D5dErqSyX3Zpz8ZfcfHV87NDXD4C8of
VSViYaBoqRGlKeGloRqXqfTgDpPXHPUsLQO5ItNBWdQT7NlEMIhkYIvRcXeovTsEU8ArxIZd8yGV
BwwRIEuuj5AJ7V8Qy2VWA9YkRczWx2lcSKIKJ1zjHmqgTJnvd6k4DDvmTdbTyDTG5S7wzEjkcKYh
RL1/6QRVnVDfnCG3zoDJ5IGpV0DhwS0HsbGhWJS9NO+Lw2hjHk03ft0p46J5poqTY/g1POj3bOb7
BkA3UFCverLqmibitIWrKE1jaNgEKt7KMU5PGC03g6rjVOd9ExvjTmYXNzxyNq0LaobRly6uFxIP
0+BTvY4uNzYcgFVg/oxZ0O6pujYny0H5byoPzDS7FSFRD9K4m7ywIf+roZB29vu879EqLxNh/8MM
kqv7fzoBzBmazOp9fnweN6DC0jQzcO0LnO5/d5h/MfP8XX3GZ/2kBFRudbwNhF7S8eM069znvUST
+Z5BJh39TI/7BX1BEQ7FS9ch1wFcwQOv2I4pn/ttdjTUAvKFBiZWS9UNfG/IBlyU6RE4covdKHSN
1VelbX1Ocu6sT6YCJp+KYAITUCx7GZjjMVu/TEwhMYftOLL60HBVuXi87fZi8Ot7Vv41xqzPNLlr
KNgYbu5a0b5Vl7eTS6RsXWsfJZXiZHenzYYcOkTWvSdpsKgjKjXSv6/dqhP3+X6LyVIkD8SDWIi4
mpf66OSArWg3fkausnmKH6qlzVJZTJk3OjiKSzB9CIly7mS5B4CkfFaheuJmH8GK3nwSJjOkFupn
AmfWJSktyZ+oAYpENpBfibMhf2MRKlk7yWWKBW56M6h5RQmcEItSz2pfUV9RBRqRjcwMquN766NQ
q23m3eOkWJpgfT8ML6iuKKHVPYJw2KM3ywNUuFdbkrc+/5YQQwYEOgnrxy0N29CeAN6Ft45sWJ6e
ctu4mVtJdg7ybYjk33weqUZ4kakhZPBzAvWCv0jkR4omJLFHgYmUMH5w/l4WV045X+mZS8+C5uXA
okTQAXReBUFyRwpOcV4pL0j7zhznEk+kn1ZWxb3n6Zf2aBGvLyOy5JQ/ga5IDg8uvf3Dzivp8Pod
DgLx/fHZV/aaxjHEnfdH6MWMsfTC7LiJGjF2mfC1WbfYK4MhPr12eqnwZ1UKLjbDSFR4sdY3WYer
Uo+YsNWX0qUub6GQ7xQ29dIkl8jzA+EsUpYdReF3FhHSC7IWliV/r3pgSrlIcA/6AZ5YNVe178cT
I4MEUZHRYJ3izYZgnJyPaPySixLrk9vupJ9UeXtHu/1di6DfJqo6wGRbY34burDl6zrHWU39VjLO
Rdg5RufZsLCqZUUXz5s/HZZfDrW8vOZxgo5lctIqO2uZ/BRhLGgMJk4LG5Br2LGC+UGApI2HCA0/
KEBVpYDkqjWFBelw7k0QGrRN8doON+bepSBz8eMec/vZVnl7+7/Y79yVEhzkKda51BHMEp3flYyt
or23adPNWYPQDrzmvhu1/auQE6WsmXMtvy5KnImLjRiMS4/QL3COqv83h9x94p6naFi+EUj5tfrq
4JiQSayBfNxmANOIRepryjoigw2f4aBcUvhDbuP9fbG/qyEJkbe8ATx9CENg0mUMmAHLtucseKDc
sBDYK6COyKEO/No9aZF9EGA8P7H2LEw3ibekXYSsREJNWKjPWVeKvWqh76a2V2VtBnHTX/IeIwyw
JCUe2B7omLhC1q3rku0SZ7FTSLVbdGrzn5XLb9o8Db2/G0oPvz2pp241Xq2MyKy913DPTZ3pfFEN
+WBshbWuOlnzBm7ZGGo7wKXeb9HRjtbjzviU2rQJzy6w92CjQjRM1qVw1+isyu+GEL9Un/JiD9Cl
YJF8FvvZnxoYCitoPcupZi04eDGZWgESn3tQ367Lx7iWrUOmftmXUJj1CQVEr+C9vrlRDcp7fWno
2LO/YnNaHX21TjBpFvUsifTRnFVLSqfBHY0aTCl3pL396aEW57QyexoWb/8bExHPN5qxgTuTkUjs
UeBN2pl0rdDC667bAaHAQRun9FbnSFq8WpiGG+ggJNbnukXMuFeH7IT5QfgvepoiFEQMpSkX3/uN
1czyMBRTwN5VRqKhomrem5ZGqpo54HUNTCQKVfiCnnGmlyd55glyuBw1q56JEDEq624bzeNJ3gmy
HGHSNeLXACTxIg8TFkp4sDRlPQmX9JgxMz+nfYr95tMpsBjwfMnKGSFOdgRuYp9HFO/0VeGh4Vj1
iD/n3kZmPMhw2yQBh16/xSApwlFH1RDc4wf80dO4l8JoKOYJZBdh3Bcb+k+QH8w3bW5ZZgT7panX
irKEPuLuOgNKRHTJYu2o3fK4rW4fhoBEbDIE/w8AWfkpn4YhmkHWvIiUj17Z086x89rcbp4z7BLl
LvwxQVl3bLi0IbB9CXOBZlw3jirdFEFI1trcBoBpMBpLQ5fVp8LrJIx3naGi6OHOISX6XQrTmGl7
JmdAlo/N9BSukJtyXm97vi5G17VExsr3M0+SQi5co8vZvE6LbKFsCp63LNw1K8zeroVwKpxmOGBB
gnxaqQzmkHVDA8F16J4p4XX7AwLTe+mr8j97zxDUvQlNK0E39Bmwk2dGRd+Iufq8PcqV76anB4SP
TeEU3n6Iy4FhWGQ0IFADaLj14RR87L5TXBzOQYbFY+6WIzRsosydukT9fgjXHbKsrcxE4xFNFT5y
q9OvoaG0yhjo/HhjnvK1cFL0YtVwmG1+lF9Xi+4dr2TDtCJsCvqXicO/rCFnF8bpTDWvjzAnBZyl
2Jj22Br65QzbkAdapwX5YR2ArKyIciJczibj1JLOkh+BV01Go5ru6pFerm9YaCS1mGhmbvOCn42l
Xc4MizLQMA1bumcGw0naR1cUMLbdqZgY9xjK9zeCz4sQZfX4YnariOuO3IUizrvbAsek9OtWMnTD
pw5c+TxIWXCbyxodo915AkT+WZCJqxSRodkezdy2QscdhIsbVP9vlfaSxPf0k5IUY658mXQerkjg
UdsCMS5chv3ipb+zmkpR9cTyZJOjUGpoqxz3rpFibvCBBdXjlaV6/gv9JyMuSO9My8qF+FwQr8LR
siv9vpAxwCVu+Yam9taqXXC/PJuJ3dRbP6Xs2TEiLG8sV4AWm4CuT4uEPSSEzm/KnQ0QcXLrkK4D
qNl3DSxQ5pkcHzdlsjAXQrk93bC8kNU16tupU8lzX8LtFcglTF8qwGMu2bDg0zzfKLDugQUaO2JQ
FA6N6SdOZSdpKJStAb6HJ9sc+GCt/La9471yYZkCUn5wgMFqK7W55SfEjO2Ia7HKh6GHnOBqYio3
PTSPpqaZTa/NVRwlhzICgpWGPh+iG+Ssa2LgUuBoXmmig0TIOR90+aKv0lyhWaZ1SAL1YhJwi0Po
CkGvZc6874g5Cel8FJKAhm9VX4k6yQPemFWgDrapDCGMYo8TAqvi2pu8VoPGdvfTve5hgYAlnJtp
Ljs6uExixhDRSQ66TFvqUBfEiKsQRAP8ArSDNcUF4HOF962AMBBVwih9PiuV2BYqtkrR7UULHDAE
tsT3vT+cNjjQ9W7PKrYnaPQMqmFWElsfFRlTJejpfCin2m7a4oytSH+jysSzQBYq/LfLwSUMMRI/
q/lHvfI6wAUh3eLPG1dJvOt8a6KOBR2EuXa2DpPsrNkEYdhnh43NkEbSVyFwTW+N/x3Bv8dugyaJ
ZzybeMNolHhh4LEmIU68Ha0yZgUZknyAaTgCfcayWHMuP2aCH4puoWAxpc15NF/1aEMMrozJ3mpv
ocfS1GfcEABbtwG1ehu0lCD2ULPQEgrS8NFK3JZPXmieS5ECGmWGYpyV8CEdncmDvxcy65N033Nq
QgUHn4QcQ7mUogadRIOsP8/0pr+PwZarSRgi/30oBxFuNwwsqBIHtiOGonhG8O3BpkHVEM/K+qLg
EhMlSAsvrAE1ViM7rY4LJfeqr+iVsJiQO38A7/EuNHp54i/jRYLzfx1nJsGGrPPDgHgv83hbyq58
DC7isyYrAS13sBO6u5mTp35Gwf2l7cMAMAY13D0qlcScr/wyUvpWhkPbhJmO29MEbaODCHVodF4g
d++1xc9r+tX7X/dYIB6yR3227RSMCH8a2wiaBTw4P/qrHchbrs0uKpRON3x1mBi0xmDyCjxZx09q
rO7MqPE0lTn2NR1T1L2vGatUsszdph41PXlHmCesQSMLpBM8gEMHtgs1HToKFKvE22lOQrFNhWt+
bzKQh3wbSlLOxrkyXlAPg9sN3jUlnr66A0rbf9kBWMba+j+VVpdEFFQRwZM7TsfjJgAiN8ZnOE9g
20epQVt3O7HV1HdQWqeD/CvtaOqEFJpiH/ZsaPjfEXiCnw3VVlnIzv9pcN+OGhmEMR89d0Jowl8y
QUESw6rnBTO4GxMtamOt5/OVZcFjb2gg22GjLF/ke26cN/4wrlchiFP59upDYoHw3K5f03vHQHcO
K9uLwVQfEj2CYnbsZviym4IoAHOZhrwNKWR9Hr8XUqd5fJKJ+1w3qotKUYnX67WZQqctyCvP0WqF
06xtYiqKNRxM4Qo3B3SPj9oYDPdOHfFoCZlKvpLIGj0Ll8r2TkDPh7L50SmTK2LiChpjdwJvsuTM
VhBtjyQs6qzSF+zmtk0hTXQIDSmTQtG566F1mhR6d5xtnPR89w2EHa0j9jLjfY6kQVYsQPnXhi00
ZOzOIxkqVsn0wCRNgGn36rEE79+kCZ0Vnf8V4ayP2X2WTDvSg9Qrk9KhzCoj5qBUk2YSzTHcOwPn
yk2bWVEueBJnvzDWP2uE5o9CNhunX1tY93Og7u3XYOA74fg4n+8jFvAY0RfYK0aSSKi3B8xSNfEP
eixbiE+mOc9+dgsxFhRWwYIvfwoNvyeHfsJ0EmYr3CymuXv3j0miIYbY74wuTgsE2zxBkTcyZj73
FuLHB5bPi9ExrlGARU+W8sa57e7MQv4CiUL1ZAyOOJmqsvj44ZCe6cg6d4adQSQro7LnHqpxsbYY
sc3TWey7Gxz5xuLUpcughaQI7+Jj/d7WwYtiwKELxT6eZlyR6/C18pj5v0LqH+Xh3BRxUh8m7sK9
Es96yCYvzCohM8/0YIB8XugkkB0zG/eyxHEqMFQRDyooRVeGUJJ5FWU8zO28tl+jmqoncTSsG7Gn
BVP4Owe2c6sJZhbVFcDSkwUL5BXJFsdmaioOgo+Q5RXpGYx//opgsABaGyI1c/2BFoAvLKZVxG2V
nPc/GEPt0oMyeZKaZ7VzwWdhIjXkDVGtCXs9fwQL6Umui63TkDKWOOmgcpCjM+I1DZ3QOcfQiKLy
0/uPyf5nRPLfVf9XWb1gOiZ7dt9BFktl4w8iWC7tVcpJCIGMHiTCKeNPy7n5ebWQ+bhrr7u9Hk+r
4fLWa5BcritTV0UXbJI4KS1FiUc6GzR/DzbiCVaZRLtzPMdV0Ttc0AhQokJUsYmPF9XaL0n+9jKa
iROudwZXOCIX/S3GeA+GB5wBYByH3GFygCnZObw1JcSaMi04QVc1DftOhZZIqvuzFzqQjTm7fqbd
dh6l7NbdYTQHa18mJAOxYVVjoysMlvhmB5JoSz5B9Io0+9lggYDVAqp8maOTM0GDAhI5rTnthToP
lhbmDTf5qbLkwiiQtrzkQ1UI0/2tGzHeRGDHzeJREvj81WfRcsDvtXOz6mgF8OH0Ov8jcqavhGJF
DCyAWjXhWzKX7TqyzTOKsidSPWoDwj34o64wOz36G3ku4n3gfJGRQgYeLqnn95NgCGiyI4J6/7dZ
7ggfcJTAfWcolsEdtmonprLe9RF50PNmK6mOHgO2C18ufmgJ2+DVwHE3mIvc7WclEIE5kXsAevvX
OvoC6fIcS1+PWFNzcs3ZDn2lahK88nDSkb8MMDU04DP8I6JNqgw7y4qCHEFmTjQJAYmlhwJf4RSd
QKvbt7FSaARJrLyGVDBb8867tmWkYDTC+JVht0N12CgghsI9hQJ4w6r3qkgjhQnlkGbsmLp0AxbP
WobiquZEnZfxPndGbqahfKAKMKGn5kFviogr7iGA5LzuQbLEMgrbtwdCComqG3UFvZZHeO9aj0NQ
eWgs51Fd7mMzZqzbhMoQJ+O9ciuxWYj+9pwy0SUzc3vjeWO7ognYDZVPhyG9Dybkvq6kAZ/7pURV
MfbMayqfVQ3+L62PrTsd7RyvmaTnHzaehKy1KZFjgdKG4Jb6jDQgk8H2nppjJo/nl6CBrVn5bvTE
jUDDBETKWgI8zaFnr/0Hap3sYuwcVwGIYSQPs147SJ+HjDEiAmex6KN/6mG6cfA9Q7ZpVetPENwP
Dr79YMWZVKwuH/VBa9jX9yV/mo1d7IWI2ClndVXLGF5hO1Q7/VKGtsjnIXxaKzAA9WwPjgUTQrhV
u3P4IPOOwn++UgLXmvSnGmTfpvYMyEZzauNaWuZcVg5d7Y3Uu/2BYVSY8VZlK2VVUzJu63SjHacY
dAyOl/E5xp6AV+wu6EuN4raGv71cylARTeEyyuVvpMYvR9fp2tHfOl05AcU/vcT1Ksp8uFO1M1b9
asR0MbZ2DMg3fduaJZDng8jsAmvc2aHnrGvAi1CGzf4T787M0DNMY7XmxN4whJHsy+B+VpswyC80
RO8oqdToIBn2idcyHfg1TylErtrftPEvGeltUnvqBheUCHpAV8+SpHrVdDVgBL5nlxdUngdpZjcf
lGaAq1bX6hqtOQx5T9nn2QmJXzCZcg60lguS9ZfwVIicUbwqmkFiv+Bpz6Na7HheOFY9piewpq5Q
HVvVSBuTSexP8h8fY0Oy30MIP/NO40aUXKwIIlwd+9Xn5mvVUDBEkw7GIo4QPp8cUN9J7J/0fC2n
QnB8Rhl7/Z4GR/lGL2rC7Zauycg847GL69mDR4zjsGuzpa/1Lc8xRieXT8wWDfo0AerLLxyQIosI
nrnb126ynPY+Gf/v/UacTQ7gGrNXdYoFIzxIGHzGtIVhQQMeLZQISi2BR7wGK9OplH+vk58mP1m1
yD5Vy1emrddfORCKcGS5aMglmeBI4p+zOQOfgoybCuPPrLvxVz4KPQ//BqHxZMj6t43/45+PXWLF
27zg5KpvWlul08zY8BOzJiwwu2ukYOs4xvtv/HCOgILKo35pYEH243cjjpPOtCllgktrohNo2/6Y
EF2u8YRQPWz3yw5Ffkh/6yrHa2kiEvD5dUBtRIRSo58RmR1MTsVjDOHZl9ZOy89HMCwl+qQ8x2MR
gQrCxFDPl5Cny9GV9Ffi3fRvs7xBPPHBrtwLlYWn8ML0Zko+BRQsSigVx2hZ8AwkTS0Vl39fbrgw
Lfeu3UgE+j/DAZTaoqNRHjgPfU0zIo5kdxHv9Vkr+lx4GwFtf0jxG65TJQ3tBMAUxiWVgMdzlGae
u9hUT5UVxtOrTNFps1eXwBk/GR6RMPji66YF7wk/icKkv5aUheE+0TZsLb5IVnQhkJcbyctZ+/4H
7LJ673DMEsfPSiSI9+wzsKc6YAjspmEU9TYQpJlGAKhGeWyPP0LJ0vRKINahSs4TFNfK3HMa04bh
gUZ7pXuxo0WWm3S4wsAZME0vqP0ArtF1FdnrRcOhaz96x3YmgFtgoINeGMav8plZpiYBb5ozJXZG
lfEGc0lIr22OD9WSjsyre0AUr9xPaPIGHBxG4GORZGOzjJJyYSJuTy6GAmLWQvYuav02PL+FOUHD
OaBcluxHzW4cYTuKyZpsaBP11J3dCanv5H5xNxcSqoSno1nLE6ksfGCFhLSSo3GKw7218JhAWITj
/6ZdMyZCKNjHkVLrOf3ql8JMRzASAHgHLQBAlaTTGZXQzCHq2Bd6mQ8nEL/GvD2Sn9SSlYgFcj/r
Qbydr57gi76mJ637Lf9Ms+UoYk40KBqXmbnFQGgI+wTZYjVKvsh17Ry2rz+uE37ovyHzJvzgJbqJ
1BliIMu2hmz3RvlYZbNxWzI8G6sRAA6t95sbUCa3Smo7mSmvTmHzErPmDziKaM8sJvIzrN3CHucy
oz/4lL3aaAWewwxGh3AY2FJVl5uQneVDIMZ/nkEbLS2NOi53tZ6f293slGpA/iBx3jPJ/ImhvdO9
apZXxHN96v7cas24M0rgnDzQmTqDc2Hw5qr2i0LgmnqaD1BSxIeSD9nIXzB1oJEQ5X/+A2A8rA9j
KiOQxS2cvbnL9uyjlAhtwMCxOZJhmxOp0Skg5maTyhDHKtdN7IwT3pLYDzG7LFYVfa7QX9Ct9H6D
iC5QOG+kcSBwf2aVy7KBmayLW/okBaW4Nt7kNeoB9LgsRmgDH3h3N6Qb5wZwM9IfwIhaMEKEYfjl
o3njC/9jru8Wcjw8sVxmXS70eHfaO8SVt9qMtJA04gOY1FG3+hot7xhdJAf/SkWVRhIVRSD+eMH3
YnwJCqbco3ehllZjofLj9/mEKi03Pu+HbfQ0oUse8FbcNK9I3eLMbCJj4u1ZZEwrozKMp6Q9udBj
vSCjAWIyVp//lMyzHiEvPZ7b64nCc+gKcmSrjIDk0JWDVMJDn9Bx5ulIu2ybNxzOr6i0RrWab5wM
lg5TgRWr1iA8WC2DVjxODEK9jQV5q3WG/HaNw2kIvCMbHc37faAmI84fYCVOwsud/fViSORt2jLG
hKlsTL+BCXGxEUpU9xkHlir09GhFub6j5PtBZMOa8b12nmMw8T6PK2lE8JEId2MbdmMEnitveQmp
q9UQc4RpZjNvR8p0mM98IeGfDWK741nMnAwsxlGtA4K3FmToFqATmu+JrQQ5YX6/ptLDfB/J5ZDC
tImlsSSmL7B1UFg6P9AykkqJ4YyaBgndow47O8gOGmlnUWEjL1fx/w65HADibA/7pxyvS+fgAbXx
CW6QvU81mvMc84tNR43Lv/dtkTos1WeXS2/p7682gSqw66t6a2ldXJlledcoIT1XqX+pmGOfMAQ6
N0s0pd0yY7+AS8rXMcDgNm7x5ToClCF8bSfNiX69psul72LXojg++HA++6/vEOES+SpqZ/L8dVYy
X8VC16g5gks9c64uYWsSaeDBD/Ullu1pKSnJ9U5yjb/4bGlkrG28REc+5UlgTuoXyOMg0b+HO3iv
K/V8EKMfam8o4n++KJzO/8Bu53s+IwufYoCeIihgLooJKWeNRInX1ajMxZ+bYUmeRBPaStFFXpD8
bFnn4lrauloAHgyWStDEfQjvZrU0wKCLr/K5iZfDEPFXxKybE0y9jTF15lMwQntrCcYnb8WaTfgw
DguFsmrmF7tqt+DjfbHp8xm5nzXn7MznZu8CK11gyqqWsQaa87ttd5i1cImjeyJAua4iR5EzKf9q
DB4Mda772LTMTBkcib1zU8D0a8GTosKUE3iMOiejiQU0igAfhFJr9xajUK06k111Kpd8ICcm2Zk+
CwSymjq68SJS7EJPglfBxqb4uRJ/de+GnrkS+zoNCVHSG5tvgkHpd5Xq33VIv+veMob8YEkBd3iI
KI3AXYAtp2a27BMbbinQONVn4ULVOu27bilcHr85EqaLS/TF0QYvZMWjFypsbWX2z/WFZza2OISm
fR5TZsJUE1sF4Hf+HG/OadAAiDXfxQlPk10FMW09TewJdPIp7AzPwaZFSnxf1muMd+YrI0Blnyrb
B48ZRbQ5Yy6YSA5pELRWfWu8VmlDx34qDjfAC8o5DmPxc3a7d2FMIfbg7gkSZ0Bw9sjMlQ+430Hc
IVlXnTYKPkANeBLGQD72vlZG8gwggQ0HHZ8Z+ZGlqV789AXKTzwKnINSz0jj17DjNH+8MQ20+xcf
gbxvBHHmrfUECnFVrL7UVw1K0jW/NKkEjGNKiQMwvnRY/LEbaep76wEf76AQRJo0PUZ2PptVdRfD
JSmZ9KOkxfnejwd5nOng/jZ+aBBBofR3ILVUWZvJ/Fk/WhXshTlFIV6IfWm24FUGzhQJdPgqKcCn
14YnuFSU0cE1o8edQxikR2GvDqxDhu+BpoNXx16TAiynR9mC7ZptcS//QlJS0+vunTAGhaDAuP0j
qSlndt1jl1IS8Wmujq1cSdlwSu6wmvnAk/QYiogl6FlobjV/8NCLBVnYGwk3qNXrQCf2eQm+ZysD
D15aL2XFkpup69fY09lT+/TLRZOSAu4uxzwhLsPih8EKEs2N793RYt0nBz0aRoGQd+airG7IbZxn
ns1Q28cRKKgOTIGSG1lbDtAGyvmeaeJr1tz6taKXr7woRwR9MtNHcgbY4C1dy6wCMyDBc6QfzNEk
0nJVxl/UFthHFqObaqIglKpRozOF7d/Kq7Wj6SlihLod3BjkdbZCr38fJb6RqwnBaexka0L/xWaG
8vBXa89ElLnZEXMT+/r3j6jY4L7ECLDoe0thhpfo5Twa09uLnQHjcwCI0PN5+Wbb0qB6QR/WsARC
mUs98dxaPHKiCEewL7l8q4blXW2uavS1aStXm9pTenBsuhnxlRpn2lsxX3/1bUDl8dqW3kuzpAiM
Ae7mf7h+yifQyFtXCeVVPkNH7W33plLtMKMNvZpraItgl1V7pUoTHLyBIwULKc6uvLX7d8JoLwwH
AL2YVJuW0vvkMM3HkSrG7vKxdUjvyAcOq5z0ct+57+Mj7LN89OiQYaL+9ZjhZ23URxFL8DuZ8SJ/
2RiihxuzVaLqs0Ls2S6IPZalx+4ll4sYkaHwYf0U9RYLwxK92ownaonjzO97e2NgEkiJlyJxRUdT
p5OBe/MlKetiZ0sOjc0QwcidPtZCC0d25xbXkt35y0BRJsB+Lfm3u+uBTMGpebXv81XL8gwOeur1
lpdMzDY0XwHxCfI4QniLgEN+Xt0SmE6yQkvJpOxRR2mPTAol6yFFoZ1XgFw1eyo+BMNRjpTsEsQl
a033cZkUSjqoAVgbS/7clAHOctDkDeh7fobQgwkPeZSGqiOFp34En8cg1hMzhUTHo1U+O1zf1SK6
mYP1IljLnavFls61ktrLhuHGCydmbrrJUuYpQSQEy8zx+XE2ee7XuwTAzQNhhgEIDVbb/toHLb/R
l2aPp5taPHcvRx2qWlFhOLu27aTQ0e26pBVg65N3miv9nM+kRQVO/e2u8ShLEEDRim1IdgVfqHoS
5urWQp6HOtv5ZRA+xWOiJORsUY+KWlc+8VMk/ysHFKZZMJPkIljA5YZWJn5yPesdubLsROYHmH69
Lle03QndTYvgXPyD82dYdLRGn33Sr8t6+UYuyCckh+A3WKSO4rWzMzt7IkHCYKVeq6xyieSxO+EA
RbU0ZUSfzR/qc1vVSKdc2mrJBlZIUG50/JR6EPJkDXkqpLQA0Z1TMzXt2OO4tfNWN27eLYs89Y/h
lDxvbBtE6PkcB8AwS2L/PD0Z58taLeg6KuJU+t0HJYIx6edmVoGD+Ku/H74KqSodelH87oLqsfFL
mSAhn6BQgn1EGjlIsVEdl4inO7hGiAWgTKlM+Uj80zkdZ5jP2I6SciHn2j+eySOsQtpWzNHlXi74
LvDXaUyROfhF1JGG/QeYW4NpdKb1KFh3HtB/KF6O8pTmWHT9jUXjXxE+/UNNorfDC+BNItUpDW7G
ULBRh+fyjoox7B86i7pCPnwtnfL0iyhJ16Cgipl5+/Feug7AgQpGx4hBsvznSmJe/Wq4dUIXn1ei
r6pEzLBdqm/WzoNGNlqSrq3ngVJ3lb2ycrrk6DhJnAPYjAjwTedmI6qs2jCcvlhyEEGnyobBhIJr
jDzxmSIMms5AGXNyWc57p2rFyBMg3qG32wTPU1mF9E+ttDQwprlRXD6ivQ45D5GNoTiyQWppg+dc
oTLrp6eRMvxB95t7Ai/JmfjZemPPItatULwcKl+J85TA1JnaCA/89Tzn6TALClEpPUTyyQt6X3rF
UJNy1NvlorAPjWHTdP3+HIMnJmyPS/WBxWuVJQs/JPmUuS19ZxYxVEVpZAPcj/JhfmsIPgEvBesP
sFuKy2cFJfy4I6hUHSY/q0El2af1TCPq8pPmW7/54sCxNPPjgVF+cDtmWt8AIK+HHOxeqXlrr+1z
ZApDk+l+1BoDTQWCDw5haXQoZy6nKS+B6wjJ+6mxBX79Ba9OY+8VZXdIfFsr+qV9lY/7okpnCg5i
0Cda8izFI0D47P2u1c63ftvE9ZcrPl+WftjeKBjMfrMJVmIq8HEXc1OtCgehJDfcILG5vLFmhqd0
47brbMcrciTtON1TFaFmWserMieLUdGlyYmd7Frnz9y4v7R4Ig5G+bYBsFtpOKjXRcXfVML2tB+p
Z8r67HfJwBnLoaYFdXpRXJQNDcjpxQ5cHWBW7rJOZ2cta7zzNJ60D6JsXTqCasPtsyxltALaohzR
w8/oLw1ldJYVX7j6iEbp4ZAAe1GXpUP3v3oI36QM90eLBztjx9HDbyIvBvsKcR+CLBHoMaJ8NEnP
AhFzCyiAXvxQOKywil5NfBsU9bA8zTcKK0ZPWxdCBa11Rv+jUNveizS9aBVWLzm11R7VFWfp7GRN
8jt6Exi58A7gnUNsZA1s5sYup6ziIFFGrpk3srkQozNywzPdJcAgTWKDD5omZMmxYsAGknHgzgqW
1iowJsIhK3x/iyUSWyKTly9yS8waxhu8ttmOrEDe+CiVB3+ir5ezo0d1FXpx1WuHS0yEZqTVWg7t
9iZzN4L7rEzqx0C1exSVzHSL8m8NOG826CqcnGRdOIddNqKoW7JHfHRHuHoxM97BnwbTRBFwHESY
gBGBJWwZJ6Df+XZVchHahCyzFnwcp7nW9Akb7p+gQT0ZfrS6gQ4wmIqvzZq1k+EGsbJf3WnMBIBC
DV5VRNF+Oo4RQoTV7Gij0zD69d+ZLpDDLFydHmULG1O8r6U4wGIZifYGR6gSj35LW5GHeESD5fFv
TZVTSQBCT9JYXN6wPOeibW6pMny/bAgMpp214KIaM5K0RLlbJFV7e5R5VwvqGmD/j4ykKRFyCg8H
gPjSZAtd0emlw8ZtdPYQf6DogEbsOmbutMwmY24Qzr1poEpT2x7lnAegjBSPSKQRSlROG6dq99n2
Fatcueft83j88uleJXjd0iJCHttpDxQ6fBFgo+chE/VG+0JM0xC4yS5KaNfJLL3+49bGk95jqduC
UlcdHnSoIg4V9bL5HjPCkDMqNk4spmoCSBr7z/497LdvPjJFxtjtX1CTLFHdo5U4MhBBK1ECGuZt
1QvHSpC06SQkt5w6lF/rcRi5j7PJdBmdZh+S2XC3SeT962YzHxJu5Oku7P2NGq7kJxvLBVzKef6d
NUc6OW5DcxHe01DZrT8TPmAl/EWAQmQLWRsJPGLNLuSSeadP3LRmd+bekEx1z+Lk3HxwUIoFznlP
yzdsvn+oemmHC45OSY1irWdvV4/wNpw93Tt45jIDtbBcfchYX/0Zjvma/vQlKPSW1kzJrRrT9Bum
14RBSfP7ou+gG/zpNektd8aSBSo7FYeIS2iPq7NXf50ACjgg2m+ps39kOGbYx1idU7y7BvN+OVh1
1NqkmBr+Zi24ncZOQGfbFNOBj6cFWXjeUy7uX6dOYBEB1z46+mZmO1EYNGsSt/ZhzeFO5a52ScCS
YsQfseEy+SpiuncTU2nAAclP8Egz2lx18zsBC/X6rSsCyWBYQVnDY1kelZmnQKVcz27uVE4MpPHz
sU4Zjqp7UIbUahm+ruXIh4rCdbQKOv8c/drqUbjljL1xfTb4rE9Xsnf0govWT5ZYYwP+zJHgBhU8
LjXZofB6KuW9z1auWn87dcnp1xNE9+qXQYBMBfJ2BvxG3Vf85Z2tgb71IDHqLvTctAElfiqsx2w/
6lC+U8aAQcT4cjWb1z+U8AiFL6rjBKqyvYhLk05OkS0OKmZTeHq3Pqou50CfQ+Pt8ElDCapjoecb
tZ5h/D45TjdrSmfBhYgI9Y/DufSRA4gg1wigJXYOFD7bW+KheXPf8zODUZAahkc6PPJoiNJPvGuE
GEOMbURcOA2D/uOwkl48lfRZ0KxB1iaTZARQnpyvMMg0m/CN3mrM3FgE90dqum5XSLvkW+WBU4p0
jCgcFWxM5PuP+IkOeFsnLIlI7EGEyDU0/Rx1i9Px45+142wQhp8XxYcuCjBOt98HbI1FHSM12EwG
8nwqnBbNYBP6V1MooVqyC+tE7S4z2/dyQk715xdJwZpxxFzytGkk5hRVj1H1zrlD6eD18MpZso45
cKDEaZeeokBYQaRyGZPmUGs6L+eDBGwZCw7ZedpU9GmLc62weVgSf15EMvMujk/iu+OQ2JQGxIG7
rwelnNFu+FzBgAX9FsaYNcZsrcis/a0Po6qZbnQyygEtK2XbrSjte78SeMxaDSBSOuO9NeSvSooE
xWkK2t402fg18bLfaWSKS35mVnxY84/AijIQ9jMH7WlGYZws9qt2hwI99/MFvtNgY/cji0Hs0DJW
IgEl0ufhJCKsa7Vxu0zb1+bedsvpPs9ZEAG/QyXwlGAlZM/2YILNJGdO5fK3XbWvqeRdwMOQqerP
KlqDZttlF9cWSWBLAo6H29ljG3aIZIO5lD+iN0hr3m2s1QJUp3/Pj8l1jgu1KuisqQZknUcihpww
xZlshw1//8LVgqLMBF38lsWYYzYmyG1RsBR55vSuGyx3je5CW8fcQm7lJUu4/TCHoRo1HDryVJrK
BezLOM4k5mMknJ5lHMH7oTGlI+qGIHhfErFzYBJHKxfUK5TbJuPnDAI50ubf3c9gwR3AafmCQ7Qe
qGoERGj8KUWm1LttZEvoRoMKDrzA4QRXUZRtD6bxGUApfQdoHTN77Uc96LGdjJalWU68DfQV9KS7
oXPsabkH/db6RuoFojz3q0sjxto7B4phZRxUmLqtzDNsAqFpy8Xgr02mKMj0dq1PQmZMCpyj9LGl
CcbLZ2KFd9EF7NXl0FHlF4fRz/1mo59ke+PnbHdldxNmJrc6bsPcWQ2itUUzjVpUEogMuEORMJ+L
1Ud4YTJZl+QDuGml0Q4ZeT6wPigX1zAOrvu4rFvKJhDPjcFsEnkS3nFBp1cSFxxZtAkV1df3qLu1
z6QUgjNsAmqntMh7cmcP4qqwuBZBUtvxhUT82m6r2GODa4XWYrcp7btViaw+Wk0gG0V28fQ7G6zL
N34ly1/V4LWf/MOtXf7SKagkXKGE/Zt0Bs01BAasRDNEbO1KrSHC3iKymlnf6bHyTyYemWIBHuze
KCG+KwVlWKUlFCB/i1gTBoWP9XKfiSCvQkVhxtQRyEWG8KmeZTn1Kelg7ZnbsgxarOW+k6b1DlQF
/VTbrmKDRNf5MvobN3N+rR6sg3ylBHdlIec4KPIBaJyzSuWmM0DdzcPdy0tzlfUaU4HlgoUDydXn
2C0yK/an/eKJhCWVifMyEoNFcELPtt//5xB+Hlkht/b8WVPwLILP10JugFyTa70A5p3DP3z68b3T
W0PdsLyn3sJJXeCz+ywMVU8y+U7j6FeF+7xBLlL/wtV+O7U8NloVqXUXkpojVnrEilTkCcDbhu9f
QEVXw6EePX96Y0trG6K4eGWqmLf+CwJesiO8oOv3j5DvR3r9bpaVwjvO9d0i6w+iYKLK58KJhbl7
Uu2AwY17kD5s7ak1Av9MwQwLt49KWLipxoA0Yi1smWzSjjq6csRFbJWZAkRfb5Jtf5HE0ikCSazJ
GRgllGyUXM2e7mcXAM9dKyVpyTFXn+OzfcB2/EADVpi3SVbyrApAF6/SNWiBtCq6gddopiJRT/1k
+u81J/ia/PX3D5rGsiZrB6ffyCCW/R6hVBXtsq38CZE32CtjuSQyPWzkdmfUC26iZlPhcr2eX3rl
ex+1DQ+K004b/xTf1VZjaTa0UOyMOi5uF9C6ntLaSyN2Qn5e87iaP3w1l7hR6C3C++XP2qhXDtOZ
AiE2+WvI8e4it2SZteL42IC/8daFG0JGroro/1ILGfpi8IX45KCvbFrOYJFRl2si/TiNLkb3EPOh
B3vd3c+FGh7J1SqRQvjbVOLbe9EfRQl8IdtjzFYR8BJNzyZRyeNawT/2gTxEzzjWmWLj45WqZ+8x
iIKaeWVdnl0DQ0jBh9Sg1K8sMbxdxsp0p/GSG9tZLoMYADHeXaSM6m/BkYXuFT4pUS7uecTwrF+F
O3hH2GYACe9A/ALHzTmnXK5gL3XjZDlJiaK2PO7waVVS5GfxVz5PKxtRCcEIv8qcmAtCPWMfXm7r
SgDXs3K1BFJg/G7oomh6JvtPkmPKV4d9qC7vEXRcSgoDuD9E1JGF+tT81r/xttFmp3i/dwbMsu74
HxGf/A/kA5i+WkF1B0iVE/ES0S2qis/JbWxncAGJtkKo/R2Fm1gfeB00ZuCgGvtLD9I2mXWNwMTo
lkP3g9GMfrSuC8vcuq8jbD2xLviYGU14p8n/9+mOCRdzPBSJKJjTD947wI6naFts+KaNg+o5s/m9
u2ZPEQoRVtavwjySA56qbcasIci+2ECNvAWRtP/BUHVj9kOHb3KgWSPuRCNrflgKjp6aXdbK8X+T
H6QxH/P+EV0/QVeD8nbXjhbSx9TDyBVHGmZRkxiifY14+TezGx5ENXgOHWCnDTxznNKw/JjC3BWx
SZfWA9T8GlxAMiD4xSkO0mC5eMqtxL/IiqCjEgl7R2Fx+QoCSeouOlz0KVew8pNTB9jDB/OmrV/s
EZ64vj3xben4CxB7Ss9bSSoabG0kmUHBDovdh++iOMNJrrOFdbjQluupAiAwyPhPhNTYgALcANwT
ac1SwE6tuS3917wgr30R+ao0EjLPHlzINOfJ1MGYjqrOud6WcipvsJGxHxmK+s6R022UzqSl5AFm
0IShRuB0/2A+XE4AtONw+eIYKVoFLsiZ2DWfChYbjC2gEop9g0DX4rzgIDgHuCYBlKkpn6iIn6rW
I83AvkuxPM0ghUQdlsi41HLlcALYi/aoY6E75E4ghawTZseu7yfnlbmT2Yg1atS+NQRyaqOcrLyf
bFB2IkiSR49iWOCHjfSxyp4mjQ/8lysBKxE3p54pueomYgYimX+FX9zsoz2JjBz759BvCAi2Ah3J
E9Gz2+0dw7PzdnXfMSHDT3l9UEVsNTycO3xuGYAt8UY0sXsAC+jJ/b8AxY0dmPFOrthdatkfVwVG
bcRUypscr1dHyBJyNZGTzag5y66QUcANNkRpFIIVRc3yBtTziE5Rn7s2y3HRmTfWTGRgaGHUcabl
WJW66qzRI/KXmYqLZ+5Ra3MyW6SRf3E326GLvHEvdzXGebrTcwXl2WSsRbEth7XlMrjx/BhPrxw8
9VIE+ObmJKgmqEtUPk3zG7+f7AY1HGaOJjMBZeVkoq5JItrUiOecYZn9PoeUyK1JZmowH93BqNM1
nbSnS4bNCvXOEW37emVaPxUUUXq8ShMvVCL1VX6DX5tC7za93sF9FTR0xdTyNkMOU/8a9nHyMoOp
HZd2kR3nWHd3EcIxGux1oIuD00tvJ62TzDNUQsfjOO/AGh9+aWEiyRQD+NHHLUFO3NCB0QdyDfAk
WKOJ1ID0cjb5Z++j/aBXT5htoIuTVwfiMO+XzI36McXgXrTr0BQLxT9W7XNsDV1gisFeQA4ZFYKH
Yl/vtaRywj3tAIFAp0zJ4KGtZUGF05DaegBKtxwYezuhFHAgs9Yfa/8BR29mGmhjwqyf3/463x6t
1LRxgTCISBqvC1oWjIXExWN7wkVaqE2HVIsmN19glQbHBMM/uKaQK9NSNsqvTRg75wWzzxvB/pA7
At0faL7fB0V/6VMpQiRZnoBkYRapzMiK/djH0vTL5HTGRSowOTd+5xZWJBm4BMXgjiixoCDHkJgz
GcVL3/8cUspdkHOBw5JUBqsVi+idQOwrP/nq4Kx7TCPg8cPaDcMuzy2UrmZ7VqGsfcpKFUX1/tsO
l7JrcWk1abG/F7q7FndFGSrhkdH7L2OSr0/uy3trmfmImBtZbssEaHy/8Ibb5AklllhrLUpJAyFy
hSXSR4S+P5a3Qc7ueIQPstfQvcZwqfpI5j+h8kVWLTsClrbiOifffrpfnvOONoqiooJcQ8bhAsAP
7dnt1T5UP9iAl/iqkwp9dN2plgUtzaFZhF8aqcaYxHtS5xT75Vieb+VJbkRqVb92TI4h6skTDzNS
i8nrd/epXZwBbtD+YMgwvFJtNtn5Ej09smjF1letXdOCJgdOEfx4QnBAN6qniblbxx5RJLR5YUlt
jnhLRkYE97UTex8T76U2H7r+a8qmxb04FAhcKV3KsalOYpM0PKgXftzzLqFy0iYGQaJNI9vFdraq
y1jFpLCMFH5tZTosyLFZEkmWawJ2jBRyvmsz0tOKcsIsCdb4zC+q3UoYdPpZvcS/+Nf6Fdut5mS/
+9PY1gt+Lzcva+zm19JLEZfnyiJEsVSgLmbjgwSOOlNNqymGjiZ5IouRWv/kquPBc0IVI7O/WPUj
qMOu1HtO+/nA7t1E7ARCqtqAs/pz7mqAJPFDAr86mD0Ph6wQRNi6ePcuS3vD89CLXKbO+lIW1NoX
HNFsE0NnghXZOASF+tautKSOoSDqPYqDvRr+pQWIFugavl8q5QSoiIUh+0QsJhV00Usj1Oiqn6o1
gZZDyC5AVDgas+lTgF1/U/y8Cluiuver9/YB4Z2lcEnALLVMxZkB4zrh+ajo5+xhN3/8eXUsW+ss
01GzutsbOM1Uhm4m/XlzPOQe6kB1EArL8356uRJRBah6NLCSJ/3F12NXBPAqa736An1DKJJv7wR1
DxrSetpSmjJOgAt7kJU/j0uvjYSOY7IdWmfQHf19I3UFl7fDd7l0iCNEu2LQ1fgss7MSDgml2lQV
qu6JBkmJJU4+eFzIA6KzTYaS4DjR90n73bl6i9ZdFouYqnyF1Wyv5Zc4GyEaF/0yRWDujzC2mNxt
TIoxingWdbnGm8ENF/2MNDi9XdJ5JttjZa5mdIfiNAqqf1p4/sNEv4XHu1knUR5UZj+fWGPwK7c9
G0OFj8aDJE0iSwHIqN5Z2zvBZFwlEQw2cPWQt1Xu4XFdMto/3jlqMMW+ngECXSvZJ40izYkY9bLS
+X2xvOgw21qrq/YuAV4cYfTQ5hvzexfiVHME9n5OaELESDCxJfiLpCbzJrqgDIIkPTnfGwQ3oXct
rgPqV8fp2l/hLDdF7yfr4rH9ixqtYdHKm4gyDzMmnYURqziZGNbBALRmuyDPqePV2zNCxKJWViC3
/TGgAvVQn6FYNRab1p5BeAd05rDV1pSvZcie8VPEezWPEeMHyqpcrzoAhOCaFjyx5WamKrnLjvat
5ZQZAnO9MaYajbe6rCUrnCXDnBOdNOPnFYiPB6/jZSAC1byO4Mm4nH9bI9NViJLL5fQg28BnPp10
3OVknrKFsVm/GJbibGzIZ91ztuRaazScK1hc8gNETsAjD1R0O7pMeWxXBLUVQCHLbvQ0TLSAk7gL
/PYMic/+bd20RejuLGFk2sa8IomxoGdMamnq6CuNZx29Yu5vqrq5ZUlyf/ItcRGNVsx7bQFuI6wr
l8tGnfI1sx2824f1yvrej/4Qm7q2k+LvWuV0VfYT8J7cCoWIFGnOT2u534bPdM2YCtyi7nz1Nt1j
TVKBlNkPbM7jejx5nWBRGriFClBz60jGHoWVZ0sodw4+IOXlI7INdZm4iH6AN4I53e8hT07Wvvah
SXiG4W+TvQDtBth7fFzUbNkVuDVCqAhTX232kSvZu6dp+k5vaDGvEkug+M+zK91l7chEUaKCw1/5
JhHjM35x/fzPkk5ehpi/D0JNhIcc0QMpaCxeD+YiKlS8u2DSYIi4Od9+0XCI4U54U66TwZ3DTRbP
7YoJvUJZzM+XAvothvBmtpzLzz9zQ4g8hqNhJIz+gQm/GJJ5aTPmKumreGSkjXbGEIZCUEyEgCDT
1UDPMMcCIBll6jrCBdVumYCchk7VPgcwG6McuKy9+SU3ZRejaAtTvjUSvMx5tSd38rOiXf0NSNHH
RUpPpoCNzCiwnWXlZ9EnWiX4zUuvUFUksto0Z9Y8UhjnIjsqtHghNc75cU0sD4HcMDhqml1/JpBl
OXOoVtudUwMtd25KLqkXTL4x4tNfqPg82kTvU27NRKWQsFzmgP7XV5qWVYEcXLzn4QSKxxAknZ/T
8b+7nEs7FBCEC2BHsLvi6kB5S1SQcgQe3FfELLmkJUUQNJ4y0rBGDaX02AHh5swAtAGHQ+aKZS0a
YQfoiB5QO9S7+WngTXT//MqtRz2ddvgG4oCDfg2t7p04rYLvG0nh/K+rj2dc7qmD0iHJWjUMljJh
H32FOS3H1WZmXkEFQngJ2TThM5LzDqqnRbEAi/bn9ReCtcsMvlrXCu+yNsUfneAZDbn2cTLubmNC
K/uIKrkjqyVzQnYbb0HjSBF6mjQQuz5gOMT5M3mNQsZZReXeh7r9R4q75Fa8aBgsjWA/ktSWIkyP
HVI8dAFrISkDsnhkgexl/eQR1vYMC+UMwqsxgYL8ayqc3B7/5nCQ0RIyQSpJL3Jiyqr4EpO9Xs5+
Qxvdk8r6ETWz/lV9EVyrACa/C9PEQzaS60IE1RJBy2nr7vs5XpOgYtYbzlqXJU/NwRDh70MATSeD
RfXN8Dg5OqGGb06As8dbehmu+2FJKjU4ITg8GM7bQJODTEmCnvikmNo2GDK0x7yj9MAt7twfFd56
VZ2GbgM3sK5AQNNBr7ew471PQ9HVMzXo5tnnZL2N1GbI4+ZPt+S+WzIq/3j+mIHXo406Wm6HPCKc
DAt5CnT1TCXi875XGGPWb9EsR7yPItnVD8hs4IZqNECmL/MHzCDx2zrZXN7eF9WkYTRwxCU5i19m
m8vVT3VKRRH4qGueiMGKz02/+wcQLaL4wyuHfCn2uLwPpxo/lKBYj1Pf/nrIPj81RkuA7/0GWQXe
cErHWh9SxCDfVJcdxaEp1PmUAUc2+h07TN46SDDNJcjfsztlXsRtaiOkom1wAoHj7tJOKhGlx3nk
uzjAh9E4Ti2VsutbDK7C+Rl4aEEdKwdiSgNAcHbUE5JHdHqiMIp2NY5QGrNoeUVXLoPvcGuouR45
PPg0kgVMECuQH4MusWfRY11mPHWmGlAercmu4aUc3LxErukSxwT5r2AjHwBtaUO2I6YKGesP7G08
Z1BDWI3RmaYLQgL3Ju0Yhi19Kqz+GMu/6IfVlJZCg5JTJsS2RUdluqnx17chJ5WDndb22zM2kCqs
sqwCEvfMKU4pXEop1fbMSmM8BZkjcC8fu02JL238jhgKw/dyuiR+gl7Ss7hF4KXqjj99uJEWZVIB
7kjouUsrphyptudzeNEJIjKDJYS/3Vi/5GOHRzcaID+6X+S1lCm5/J/Oy10g0HeW9SSpC5FEScqc
A5p0lcz7+Sw683M9kWRYZZJH545I3pL/i8uFEtJ0ZwH0YlRfcWXFXYMY+QUuurHtFOrT+4uY8aPe
Dst7bkttA6WEXJ6Ax5tGyC6FJMRP8Av5CTx7kQLyTpUEm3kKLv93WvxeBx16sTBCXO2I8Y4eqa1P
cRCX/fibhKsYpL32hGdU+qU7XBOP5S/7J7rv9LdfbsjcABTyMfCy0P629FVgML+kqnsO7MwEPC0M
VoiiMGdPFc33RXbnwgw6YI4ChPUGL4Ua4Izn8l0anK3TGF7NM9UsJ2NKh/gOUA0vv25BQXnw0XaP
bVACpIQWNrO70RHesl9juPQqlCcCR1NJ/vWmhvFV2n5e1R+CVU/P1U90llCqPm2J8T1u/zRy/ued
n/Sz5b+x7b1LIRg36J7pkhwNRKCSRWWYNHT1O55nsR0hjAJCiRYIB29zGvhpDTZmuyX8EIR16a1J
WTKdNtGcd48dwSPzG1CMwYbNM/nA1mOp3ScpnQcDtIb4e/G/LTFNjMoXGSL1Xwm8Ap6pRROQ1WWS
AQAHk1a4mBU6WwZo15MeyV5Cj/k9Yyprp3XyIMfflg8OYJNP90CTP8NfWZGJM+R8EBI54qs4WwMS
swmrfeOQPJd7kFaGc8d0QW2uOpBOpfgCe8XqfQTBKVoFiFM2jj0Dhpy3eaWD3YabG1TiHRZiE4Y2
ivM7uXA/1q6WHEtBydz1dxcgZBhz9za4eoiFSIPaGABfOxPihXVee8lHQ2lH6I2Ir5SXcaUBi8N9
Fw5XhldVOdoB7xQTva25XIlxdrj40tcHUutxxgprMEIhT6JAbpw+v5SAidz6XWjGbT8I8vx/hNFV
7FjueBGBJbIDl7b5iDo6DI7fvDjz5zx/7e/ymmGcBJIQSmCWDusQeu74OrqdO3/POYkGzdEzNzTJ
zsa8q8eTG7aqKbbjAEFgNkuxZoT9xIiZkHUAYMiGrI6kxwOkybqzP2aqN4bQkqBj14DGvAhBCIcK
eROE0y/MHI6pa2E+IW/LhHzTxE7t+V0bA3oNVnMV7diZnwOHvWhOn7rqhUVAjds86nTD2vpv8hI7
qyrclv8Dp2hP0ZzVqmw6vPIJTv4bHGahLvOe/YOvrLC3/eTFkhQHbM9qH3tTdXFJSdzSwIDfqQoC
07C6awSDgwEyIsBYmd/M7irtSjMrRqTDnY40A6avkQ5IptwhoBDYRHzieZecABC8eDwt5WBCAOHp
FLPwXNCrq1vR2i1CBJ1BfsdBh9mQIFud36quHkCtQ65xXjTMAL18X+4ClA7Ba+gPK1YUKKKa+x+k
3qb6IgvKVno5KxHQyandm1fzQAn6ospTQkEymtatY25SCOYuJIRK6WY+Krsa81kAwk1ef4qX/7US
gf03Ztd+309SX/XHH8eSBsgHRRl63LFJlzEuzMS3jh18O9OUSfJ9GEKi6/zX5p346t1OeinI+wzd
uemKjGeY0XhnGqzs3Qvi66tQDYfuKDD7vcEj1HIuagUmibRHkXENqN/edNdO6qAqDR0Ijt5uo9/Z
wujjQXlIEciY
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
