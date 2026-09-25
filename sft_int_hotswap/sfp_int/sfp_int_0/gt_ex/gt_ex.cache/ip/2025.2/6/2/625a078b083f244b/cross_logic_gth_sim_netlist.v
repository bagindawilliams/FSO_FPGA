// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:58 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "200" *) 
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
  (* C_WR_FREQ = "312" *) 
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
sv/nlhWPxkv72m1MRbboGhqIkA==
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
