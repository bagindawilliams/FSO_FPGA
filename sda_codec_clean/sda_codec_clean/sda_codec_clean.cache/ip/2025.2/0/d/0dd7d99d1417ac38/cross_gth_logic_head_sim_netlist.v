// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:19 2026
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
6N2IqhBLMiu7pzn7vnUpitbEqEzjvjih12pygjPxvaIGmE6m7hZhexuaqvBsNMpulR8TfzulVdFx
Upp4c1pmtMzB+0MErIZTtNAgjzbZMBedzv2xTY0NC4Y99lU1GQkyQc0kGwtygXJxfY+WKLBgMAGm
wElkxfnhihQd5Z6mMQZ3Wuzqo+sVjH8UdVfRUWqBob/3v0wdyM3HSdDOgxmWfVtccPALc/Q9M2cJ
KYRzVai/YmqPXGMIHaibtzUzjUgvOHPjhoTwx+15iE9YShCHPCr8mzGlv8sUvbyIra2Qa/emodn3
ss0VZzJcJCDkiRpGEXmEQNBapZkAb/1j+lpZ23bVxEwyWAFn8Cbleo5ji0uxsVQSDLlO2Ahqkpgs
+LFcZz7YwctqktM2fv9rHXN7lL2XL72laV4cRbW5U5KEieuTHvKmoj9Z9MI7hpL/NS3s3NffcTo9
6PskLTkQ+bVKMvZvAGQ0s93FA5NSuK7ccLz2Ta07pfpBobAaUIxjIiU/9Reyec9qnwqvzw8N5gZU
UXns7aon2aa1iYkXVmjjWUZooMpGEv8I89rNrDoM7BE3ZacWtVR2hq+BbHQ4lKhFFS+LvZagWCbG
CQSVVPRwfd73zw7aB0vPTGj8kKi+5xhJhQgLwtTysvDSQPTNSsGMVyEzBFc6VIVmM6ePH2MafBtL
Un4GXGniUKnHIg5/5p9tHxXznwIv2EqrmyCSKSgs+6cQBf91jyxkUoSJb94TmMqf1zFjhdTjML2e
QsLuf2gi4zLIiZrgueEkpAwitZYIK4hzv86G25m9fyzstyfNe+u5wQVghtZbZypbBoSU9Zotzu85
lSeArAhTeQNuIIyrG0Zpg/VhuqOcJs+OrEXOYG3VBi3T3qe+PV1duZbm5IOqwlON4XYCjDXZUvNf
F9xLeUoBiNufuGHBYCnZwkIDVvnUNSjaOPuy7sdYGqeSZWgHyDZ71bM396IspAf79e0srOUHhD5N
GomnOzViZGru6rwW9iWArf3uet5qZboScxInzdHmxByJvRrZ/ktTU+vRaEbNFZf1cIaO46o+O6iw
iZq3SBPigv/SUEeEsXWvGV5ooAFchsSdjwFyBXAa/p+HDoQp0V0ERfS3B+6SX2X8OKZ+dlRsSauy
iQtVbgfeY8+pgOQtX5DEbW7p9SZ8lEPdpTe9ANRAjUYLAY8Wfd7BXXLgjJykjuF08g9XLBtN2oz6
+SeGPwiw0u1REOPG16vOu/Rm7waC2RZKIGtmi2UrU+liopJZYeIeLC9KirsybQ1e5jKdSDfajWaf
quUzjWBSJK6iC2IU6eR7Jq7Z9qC5Dd9Csrc0D9hocjKH4sDEnTHvWGN6Jpg1DbH4lhg5oiuzgDuX
zkO8xt2E8uQ6qhF3zoMMs9GWojmgLbmVh2hKnCOkntsneGAmePi9PckFsn6C5WEvXb06wj/YLAWN
mAkE8qxwdGP39sWH7Noxkg7F67VYxWqTu0Ep7VtXXH69B3G2ynvzzbpTNUDN/pBi6xmMcgPEI+u5
h+f1/wqUaQc37iPQ5mchiSaNgFAo29WUxkCVEFowCixQT3PoB0Eh9NypPwPNjZC5tPT7Z+NzVxas
IjV2LuYn59rmxieneFCB8towhE8VJiv/FHJU8KfoyrMB8OzkV1JoPN9GxyHj9zm9KVKbzODovZR+
AEc7FHbNInVd0Aa4eg/9h6PrQEMpAXxJZ+XOTkkrIR98eEkA+qY6s41D1ETyKI2+rxEe8bYMrnHc
3XvsPp7PW5b54jIuGUzBFUFuzy5zbesDYBThaCHw+1De6L4w5Ca+1MhnMfYI/AL55Cyps/d/hT9j
gsdDsjCVlhcLSjLGNKerDnvMRTCrF3j2vbJKNwbFgouV8C2Io91PJ/xrwSulwRMNmJ42nqH4X/6b
KLWKVXpEJJXQQ5XhZSa77OXxcYOyz3GGCzl6AoAefaa4sbP+9Qz6YefrnRtCccOoC2G4xy59uJph
eld4W0cPJk6QG+TWbtlEsaZY9GU6yDQT4+146fa/2S229HB4mj87Hx/6u5pEJSlq6zheFfzWZbOK
f1yeLblrYPJ0iQdnl2ZYw6N2TEQ/MnNsUaMuuPf5LD1wrX+Stw5jU+ka0jnX0qsj54jZW4I2QvmC
fNiPg4ko8LiBRce45QkIEWbA2J7fW+f9DlcLI4K71MSBEDFb3Q0NdtYwSZreEVRdA5N5Gm6tQgF8
qZs5DBDM5ZcDhF0zQIp3bOLP2pgxhZpw64cfzhcfsV/SULCTw+g8sod/Y52OtR9ObIIAa61KDKym
uiYp4W4huBhmJyO9OgNNtC8yhZmqEgPd3ahZsvjNeyy14pfVtg24PNrDypkCF4G/DQENUmbkhFnl
quOB7Z7ZPIK/8QM+p43RqNEoy4GXBZcCcaXQ2fdYsj3WjhMfhn1Ick9TztjFMUl8U+UQxQ6W+eTL
RI0UJwKUoOnL/479a77jjkj8UJuueKpIC4YM5GpxJxHfn9bOe8oYiQAbGH0YxcjUH6HFjzN8fBa8
ll5KiSH3w6LGegSbuTAa61CgVTBzwerg/A26xT0whPeylkzqUUw9Z1xW7nzg2TJ2f9SIvv/3O7cX
v9Dn4oN3MvLsuIba0r6TdKN2oTW7Ru8CsvQofsLG2zdCgPwZbWGnl01YUPogxHatFWsnqbbwfbSv
GpIQBNMcfJfyD51JzXSewhgZ8bj0u4ku8LVyhmdXPY7lv3pU70i34JTHP3OHcbFbuh/wjUIlw0OD
2qDLg6I3hEYrzJt7hd3PxWZwZmN4j1WiIuCTtKaKrZchCJI8zKuzV+uNO5J6PU/mRZOHxoc+bTuM
g+aGrSQsWKeuPcdfVccsM8GPxOIk098+LSDi8/ctL0uDpeDUnZM24WGhuCe7k0aYMkatTj3f1WCp
HlOcYWTHoGgvvk/TQtjTtqn+5l7xYxOo6jgZnNrwXwNWFH6LOd13XvTlcBhpN5YzGXsG5fTE8T4h
Xsud+wrcO8vaJEKrw+zbNFjQ4SwtF0GNiX9fgvE7O3rBUxl12qSgzQZUGapXc080lPB+Yri3jZSz
Qtj5tNFj12tsLqkgKfP7mRqdMwxQQN9qmwlhoIi3yo6+yWS8H8QexYhnmeYB4is0A9s7KWB7syjV
T3KVS+8f5La6CJwsBW3BLMtOFbT7NSz2D4qFWtJgKaIo3A1GNG8XrqTq1UL7WqtRUrZrlPWPFsuE
Eg+lEOX8qDceZjPzZBeXo/p17g9xfuqQvachAxhuXnhSFVW9mG/od9PyVIBM0il3bMsCWcSrg/gt
PhCmSyJfjSoDgduluX2xOC4llSQcrONvcTsJ6V1/et1idp0o2do7RE0XO8rfdgzo0Qf/PD8WY5JI
keJHLX58xfY6OUdo4vPsS6rhiupIxakOuIThGlRuwgkMRz0S9HTjt1cry/9afaO3GQe40wfXG7+j
fKKgw8iZTNp6hF/FCE0GOe9j2xPZrA446MPXyAxztVmdwLxbuwHudK0e0wrHCXALD2oxPr4T8zTo
MgscinB47rDjIZ7XvcK7oOJATENPxeJBsZQlUKjug+DNYej3PuUUHOvHiBio+cq1nowhfN4PpfYJ
7h9df4Har1uZyJKsccvr32DIMB4UUCPJXyhIQSrKTUqqrETn090coKygLRLBfrSd3JziSK48miw2
v2MJH4cC93TeoMf493Mlike8PKalS6Q/SgyEJg5HiEkQl6n2iQ6mZJg3kU2CiBw7fn1ptNtiCIaA
SL5k+K/OBAjbm7Q28qZuHgk4GuAWKStIjVj3xUcAJfeN4yNT+vvanoe9H7ic9+rfFeEr5VsY/OZS
86k5eCNhiPKrJbCENVRdF1lLXpo/6cDZcy92IiiAc9RSp90llsXEeSMP+fWxUx2tkudhU0eu9qtL
4lCH/vKnu/BFj+nGasX43UygoepCHPxvIpYxq86pN7MUoJCqgaOcHDJvw6RLNzr1fuB4ag4Tr1+2
E2lpdUJME8+nkeAAP3A800s1l9y6ro+p+46v2cD/35E9COT80l5CcJd3FeF7xJdrPIYSlEbMUSqz
ukf6qw03P2VoUGuvBGF2xbNuQOq3lTIWdBB06cwaJF9wnqKDL7qp5zYtMxHImmWZx1Ax39UIzBSP
5pMSdxaN9bZ2Derat8bBi76rqyyMdtIIeO5IjAOWIXPK/9NNu0Su57CwGP0QIcx5XFLM8JyFk6NR
QfWZ7N2pd7FLi+0od0vuYRG48ZpGes58xaopwSfrNujIClbZVDI3M64vYtTjxCQQFpmIcYFXaUb9
wCKsrcvxldsn7Z6Pc7lkEIrL20qaKzUS4yaDxt8avdYhMx9/D7W+Ly39KL4YXZcyxCu/qFu0OB4k
rogkly97HEz/YHhaayKvkjFJeKcd/hPL9YXcrXYFA7HjFj1TK7su6JdixYMsxnHG1LddATUb/SfI
uvx5mkM8iiJFrHQASg+VZQcLvnMRqXohWqdFXvV92UAQfShAQjM7pjxNaFK8a9uWmMvMMFrCIz0S
drFY4FdxIkBIAAGYZ2eFN6QTOJjSK++kvZQUJjh7IDAIXmwC9dah15ZYAWRSi51ZMwyR0GiIqB/G
4UtPiFBSIF9fr+tzhkV3SMoSb+gtSuNm7uPDydYVt8gZCTQngYVfLlpi8tKTFErV4DuyLO4Tyo0u
zB/0kn+8oGIWpvytLqenf2iDKJcvL+ejFHJcEYd2NDZqLWPghoAz7DE5tbyq4TmvObZCOQtcGj6J
XYcOPSRUADCK5ZkZZECd86QyH7aQHGuOtHcLL6sjZ5K89wCris6MQ9OzTQ2ro1TmyjP63R6A4Asz
ujkPS8w7wAb3wPaaqR/xfUkgUrqNQtSgf4dj7jeoLCYSlOP6+X8HZPm47vf482cQeRu183xwvnrC
fubIvzYUPtYPg5Rz4No9BqWlwY6IxSCfL8McPKciHM/8Ih0MIMiQ1t700tZDQo263ZIL1Y8uu/5/
gLNbkgFy2usbQzCuS90osvXGZnZ5FP4/YOSpjTQvy+Cp9oErPzV3hGmdtdb4vDgescLNcYjLf/6L
rRHEcQQtO2WvyiMMN9Nvst8O+w7DoC/6qgEy6wjm1sLZDqWgBmnsJe/YMR5cm01a8RrRLDCcdXDO
POlsTMfbdQrlkwKYwdsWsQlqUs60DxN9k2SB3rNInY+j8vFvl5uAUtBj6rUylHzVA975bHxBViGr
mXXg54HiKOdML0zgMEQ/1GfoA3aI8PL6q0L4XzoMBeao5WWC66vk1D38z7sEPAy70bOHZdx1J1Ym
89eZwX5nm/w36OYiGfUmWUzApb4oYvrFb8QAN37/z1fSeHcLQdsz4uh4MFBPL26RmJ6Uz7xJdIUo
Udnn5Wjw6PCiSHR6NbmnsVT12wlMpxDpLn40R3LcPwR+MCiUs2yBNk5KA4pkNfYgJrSjroDKWZmI
2TP/uJzJsPimYvc9Qbd5guQdOlVBu7BO1+zzv+/DWrJHIKhKOqQ9AdYVIV6oiJ2R1NXB9kflyJFM
Fxd8enqBdNVArjsHth92Sk/O7LAmKclVKN/cxavS46OQbHUv9+T5OtmZ5v9DpiAov6nISMpfyv1A
CYznQ7p7iTa90ItrlY4ckjwH1CorMiJaA8jmIuFx5I/+WYWmMY+56q0b9WYIEchf8wM6uJEN/i/t
e5ZrwMpC1k3YeGsCjbNoa6ygbLA+LRRUfClCjZuCKiLpPftsMrDXmluD5td3w3ArYtM/AteXQ6+y
1mXQiaEpO062JR5q1k5S/r3GTD3/N2urzFfLAjjaRrxmchlHyQvXgBfrqWw/JsEvgwiNVV9Q8FPp
UKsDAVZUbHhaTaEAZ/nQRYPb9gL/ozuNB9iGq00IpuFOyTEctk71IoS2cXaopzz90O1ob8kvBzF/
tR6zIl9SnX0KQjv90RNlgQc+CgHDnPqzmAX3/z6QJJh0rqXPsR+SI8aAJo+bBiCax7qT2y56cr/w
9nIosEj5FWyc9mRFz5Qu8BfPVrSaKPOFfoEg7hjV5yAZmC169lAq38OR09eiuxwS2mhL41hx0bMO
WHI04ZnsBreTV71W9q36UYQgRE8Z+71mY0qE3mJ0E9j3BAkoPv/oeJS1a+KwQtM3URTsVSxAjnkj
dnYXfNXxiCnlvnQ192oLetFZDR0OKz/71wzB3ZlOAZ9cfgmu0/4dZrpKRmgHmp8mM9A97ll9Johf
xlq/cI5UA8H9w4fpvX6J7ZPHGSePOqoUtwzXJpcpxxDZ40bboolL3/cSmDK6KQumla0jXEzzZzsM
87A0SXTWsGB0i3dV2tYFSEK2HetIPNhzsRyGDkn/21q2TwzZuTVXytMLBLNltWFNLWN64N83odB2
T+SEVM33a7VNSiwFlV5J1MVS7T2mqTidgAk8AGcKmODtg94SebejEJWS9MENmBtR1AljcmmXbc1T
jzgCMpVRQa9DXiSeVnK4k2CpDBuQ2AqxHSPB6BpgMuOT5QAKaNm5K9le2atmqJmE1IkHQTwWbbHf
GWUEn6sN/T2jjg3bL+bRBjd2cE3ehFyKog3xhrr2K+nLvgw1J1YsIgxdKCMIi+QUvEb/nQHbviBj
289IxVve6+Sk7Q7zRWPThoCQ1kgUwlNDDwkLOjwx7m7swTG+mgy8/lmHi+jnjylENp1+6HLUEXcJ
pQHG1btB9YZq3hncgYfB2H7V8jIRThlqCdg/Fxf7PtRfMg5GXBQ4i2jxpJKV/rLHwQEBIkpen5ji
D/V/YBAusRGJk8fJJpb0G7hIuWhJHc0b7H+FxI+TRlUesSZsnMQ1gUC/GN+6HD+r3rpUEtXts4UX
RIZrE4+aEQMUfx8wO8mHq2g8zrf4/wPBovLdV5E2KZgRZh5ePPTVCQUqVBLrFy92NO03RvAWIzuD
7vs9w0qjbGcgJoCoLH3IQWuFDl89v2j2kqjD4OyJKn1dV/Sckd6dD9QIAAXDsGWoDu92RGdyGiW6
X0Jm79RSJMfoOrSE2PR6JDhtDUgAuaQGQqpJ/ehq4pCJIQFb/r/Ob3vQbv9tEnskWmO8JYTDwyca
5yL5RJA/7wzTARUxEu091WSS+HNVksa98UWVY4QzDCdXE/524rdA4pKyuCe74eJ3kWA0lwqLMDt9
DHsXJmXXYuh5U5ZLElYhK8dtgAaxL8yPcAsZbO28iCZpTvFWX9j1bujSVgJSabO6WLQtQ/UNENKJ
zFtQUq3lydnBloZvc0U4HaxVvNP45IdRY/fw0gTE3OvmF6YFUfAMAjejdZ7uh2jyNknxGa2Cf/hY
j5rk9ZSitQ5vFmZYFacXEPin+tFm5Ka1siPA4R1VMiS1l5CTDXnTYgfz/0xKJwJDjhwif5YGdM89
/HC51R7khF0I2HgDzckCdoWDfw9x2oha1WChwBv5azgfIlE+oFSTP1CoKQmM28WWb0t+D1gbv8SA
S3+/GvhQ60AEI08/o/A/n6T2xI7FHHN+ZMMDMP+uChgToHB8GSamqBUJEQ8P5a6xysnkVG3hPA3k
PH0CZt4YlrXQlDs6vbLbEqo/aVRRExabDY93YPJPS2xze2le/7YBQjR4Lf7Xdh4/vV3Xzw4RpoSm
fBwsZ5+P8q7/8VxJqjmMfCokBdHkr8i1aTqa7oeO9GgEmYscD2KTOTxFfZWi3OfOgraVHyQbW5YZ
qSYBcImim2FoUbs9QuxTFeJ51M8/zEggjL73TnCRRQd4xbRrGVlAN+zYissSCWL4NwS5Zkvs1z/m
bT3OCmV2Gzac9nX9W6w8hGhU06QQ9EqJhknEg64FE85hoaeWqrgRWgkaCGxpCUiVNZ7vPK8+wjo6
IDD1M0MDFVZnnmM0rml4QKXkEZCYkNzumq7/xSfDGDak2eK625uTQlHafIGg8GtvKpN6e8KO6J5+
XKD8hokhMOQxaJ3j7AdFhFZWLjTBF2bpjdTpunXGS3jj65dqyzLV5AIkCTpJZjVxpNv0YzY29E76
xb/n7qi8l33QglQBUYeKUadHCaSxIkFCV3z7K06EBihGbpkxgPlhRVj2/SBP4EPgDK/eG/+ogQq/
GmelqsBkFE7N4FCppvP7PV9XA2X0M/BP53dEiYbJPuiAgVmbS0hqtIyixzC8NS000M/Nz+cbaIW6
TwPmnZG69E7cs3IcDZf3d509BKFTWT+o0Jogjwnyyam9A87m8s5u6GJl7LdRwdKfpkS2QHHrrh7Z
I8AEm+QPai+qJmp3vhen2bvqdno8sZmSfI2xxQZmZFvz/yfHDtJRG+JgaTOv2Uvdzbvy3veRQkoo
xccmfIBnrhqO5ahcEHZj0cGCLMIKo9pT9p7BaKkD32Jyb/nUhtuy+B8PG3Na3fk4A+WzdHsz3oFN
FPnm3GvIRdpXTOyQFbFxkzhfczWuLPxNcq4kOcerlcKEdBSvDMGTjIY6sxKYAuBEl0ojrTy3929p
3L/7GUs0XsbsAgJNONXWBNDSoCyH8ou+qybBSmiX36x3nDzw5cpKoWlwA+OWyDHWD2gxttUOOlNr
DpqujRsT1H7EOBY6BmImdByGQSns5hWVS6HyKVg79XjxJc3KxEjfN/K1of1s5sP6YuqLwnbwhCcE
e0cKbLzVdc4Rz9Qwku+z6kayNsadzUxwHTgJ/l+JXCrtljGaTakfOhfUrc87u/Gi4Fp24OXYDvDW
+vaaJjXzDqMQlK7He6lzzr/pKOqTANKFa6T+RelHK6L9SZ5NKIFAxZKkuwv7iEEgM9KNGl9KSBas
IWIjh5phVTvZFPBAInTM4rLjFYYkulcnVMjW8jfCO/PCcaLE53aXXkszLFbOZ8g54bx+Uh/d8E9Q
nwXMjug7k2FI8nU3h8eWXt28uA4UZYpOLf8PHEGOE/vVSZ9MZ0LzP7Wn4L1OCYOHmMez2fP8qZGE
186w6e5ntPO7LAEJ8NS8DxeiLlPIHQ+FinXGHdAI4htZxJQFBp22erXAeR94ySSBIxtrn9IlJqUV
pmvnVXlVlbhK4MLeTLNvKHw2N6olntfH+X/cOohz7yuXG50WXfT8yPSxfH52LH5N1lK+kn0vP1fn
pLUdI7V1rNZpO/Ckk5D6Y8/UhNnVPoQliLZexk/UqBoHIUyEfUkQpKeRcdQextiBYB76oR+d+q9U
OFooB84+IjbO+2vDdRzA5uGMVc2X6tGRYv5IQ9/PFUkxavetzxrEGEEv1S0jnx4yNK73cT/3YCRG
XPRZsVAzvv47f0BJ9h6dD9w7fUCtHN2ASANQf+EaTqVORgABh8rb4gQXZaqZ2tjW8UlTeFn4FM8R
WVNH74C3qGCFtE6e9PCJA1R2Rl8E9SXwxGzok8yPBOlcGxTBztY7UGjUQz3CMSyqQA3J6x51LD17
o7VxbrrKrMA7LWwtTNBbQjEtVSupdgiklo3a4OBIGJyECl8ISgArb3gf/OzFBQ6f8gqM829cmrjB
NwRzsdDdEHS78OLyR+5OvuoxlpEUEA3XQXi7mmQZZCAj2mhx+wj8ZLaF8SkHNYuG54APVgZts7S6
MoTVoRcG2/aFwAOd3TnoHbZ2AAQR33R6xTIAcyRmNiMF1dIH6j2dnfO8/AZ6ZcWrwNLEA5OZUCu9
4J0WerAuO9S5PZt3Wr3aZmUX391CY7MTHi4/3YJ7bbVN2x2O43J0ZaKLWobl15HmAsYi5QnRC/Xu
BhaivQT1HNkwd1sAhQfGPRrxylOKovrADvEB/V9zYPzvKLeWcz9B26pJpDHC/pB9VX2YPn3XHd17
yMFyP53ZYGVm/thVAJzM20LS5evg1hUMx1RM0LpIfBGEMRXkAf4yzSeDX5aagFygpszy6XMPceYi
lTajIowI3mcHeC3UziDIWLwnUwMcC7WhNCPla8NcJM3Tc1jTfZJcARHDWArRKLOqXjaDRxWoAXqs
3282KqgM0XUx5t97TAg2q4EgQDiAQZM5/sXM/NBqYKFpD/Ol7wrtiwMVQLc271u2ytVvb+7MfJz/
BX53gV3t/3aNiqC7aVCfehL+KFVjsz4Pxk3gmW39mNUmOE707hz8sMb91OBUm4qga2mpgAyIz8uf
8jqd44yE1X4zM/Oh2XgaHe+HNeBoh07tTV6KWKGUzF0yfYedgYBhhNGenK0sDqWoYES8HgRUXLj/
iCAngTVUqHvw9V2Lb6GhiurwL7TrLQiHKFekQ6ITgUYBjbL3NVVAhgUeylKMpY8PGfaOJucjxKCY
vCHxk0KMnGMtjO1srGDXjqFLawMUHrXGX1It0GFBqeKVwO0bY1UWW/OA8Lju47bRLYQO5k1f+7xz
vWXFDFZeEj89jyR7c3qJBTwDjGhfuV3qhRbvtXItF/vRF1IwVTw9kToUPH2pr6ot8QiY0iXM2vCD
NnwjjyX33Lb8Ye0pUs/ljhD6wFKdLd8BEQvYTHaG9JbFdvxy7cG9yDzkZtdfstcKcTfeXtvHqXp2
rYugM1Eg/OZlzP16bnpRbP8JcJCl0HjVxHvHbpAXhCbJwNy1urSYbODq9RkiW2twwtkscR/5QY/f
jQ+hUcOBdeujY9wUPRLaooenpT4c2CpoBkV/TmkvqXx0oFRwnQ2y1V6VBAdnoZnLMMTkOHojve1Z
BqJ177+Sr1USGvVM7d7T5YO7waUUwdic1qwg01mAdbBN15ux2+HfK3kDRrREzNg/BZJeejg+cNS0
hmwdDvc3U6hef3tW0ZCWKbzr3xgbjJ915duxSgn89wJJWZ7CVtJgqkTQs00g7ER7quhRlvqsw+MA
CJUk1IwVClUZ2PQRGL5WsYQQ5Mkg8feo+pDCMhcX2uX2X4kHrnhU53jEqJv9otNh7P+cMTzXrV48
mujUMbsfoC7px/K2r2A6Mt4XCFZxtlv04RPo5q9obfWD9fX/OMLFH5zQxjSPxOZ55Qymy7cXcHoB
+zsZjUPlXhm5ktJdVQMdYD5V7lvmeyI0FGjxRPgoJjfjIbLi1dvToJs7phlqIhppAr5yLpCcXr1q
x0ViXXH9T7jw724jBOdQBaQ2mHHCf92G9pDseyuFK2fql3X5x5o05PIbl+iGz9xBvrdDD2Qn28mg
wQR2Xg+V8GI+XPTo8QJkx6MSZC/s/QsHOT1LeQXGJSsb45YxaU3i2xpXf5fmp8K5OWPI7NfHUSDh
JkQ0sYEroXTlZTfOS5so5LvheTPYCTJswrbpIN4yyn4s9LM0Udw1Siv/rYyA1ft/zpFPSDtA09CB
1kbOMY9aq8RgrYrNzm7/VbCMLTS48TDYvvae5xiswHncbJdxxI6M8TEM8HP9bLy6YiLdcHY2Xlw1
TQKNuWsHmDHE8xWhfgr2fXrjlpWggmRI4Y1sk0JNjlTJXYv9TRa/7tJXVOJv7gxAeY/8eFBWz8bU
ecpEkLMHSFPlrZmD0ulXVkVUJf5IMUBhVAvdynTdE0n+dch8+vuAV70hGA9WIsdm/lh+ojVabo+t
kQ1IRJmW3SrOjqf+zeBA7rGj43Hj9FuNbVixKc6NFPhUCSdOg7ntr9Zh4knNbtP3jiHxcBtlLX+j
UMAv48WZ3xffFGF+IS1YdIqApf9qZ7eEBSxTcxPO7cGMTt/8finYYNpFBvBcg6/LKvvpaTPFU68s
75T/VvZa35Kmb3Jc52w+ft9H8CLHb8zgng/l1RTOyRaFHoH9KxrfP5biT5LDRC3kU24tnEm7sovT
v+ik4mv+obzdfntpIhN4g4ckryEp8ehD9zUuJGxB42aEOhc2mocaJKGt8eCd39cS7pNa5i+Z8UYD
3iBUW3D/Viyz88KhyN4QQtemB3gliUU1A0mcMaOpt5mNKyvvkE/RvYkEMuJmMBUgPfeaYmWnrEqC
PZoNr83MMhJlz0sdz5oIu4EIQ+LnqIgg3oixWstvhFavc/0RnFtHT2fQgBBAwmahDWAGdiBfll+a
b7/VRAgoMIlnhp4W11O5pO8S3Z+Crg2TMWTrhfh5ZkULk+0Smh40hKPmKhv5x1AKDTokNilQBFBm
+o9aax8jQz0GUWW+jm4E/iTN2NOkmW2niWC8yG4GxpGJiIu8ILuejcihR2avTOwNPem9BRIp7xGg
W3NBqSwYVxv9HbtLN4hjjqzq7yy8Pigo+x5DPJM+w6+3Dw00CRtPla/Jzkq1cWl89fMGQDiwDIId
tUSIYKI0aW6FH3cUqD/wXoboGTjERbCW0dlvvSpeHaZpM+OuAxatYa9HNvsBfi+Fl01Pl+Xm6tCE
icS+vZj0tXrmcehNsiDGHhjz6ogozcyyuNZp21PwLzax+Le5ph60d1BCmkLmD1EFYhYsA7XYXI+N
MvPKfIK5jzua2FYDZyPambh/WJ2HV5v0w9AAJE67sdqV3X3s2M8mbw8stZZyeO5qwPIrMIkgJwwJ
cKvM+dJTv25Fcb6CVOnWZlTMR3AeVW+pQSAmAfJOzJZtH9GjFnLBGuAzefRiTn7L/zHpof1d74aw
21C4LHIzw4EJc9Gzbptlm59INpY2ghnUo3fKocV/I7jhgboFeCB5LRrE1Adl+zOqo1duWdTZirUM
lowfVIRwCY5NwgLPMxyfXYr89kuAWPsqkEXu0wtZag9w8Ll5gRwuIodABWsrLEVgegt50dV0e/im
AznESjMtA+foXZsGsYlTX9jQMQc1wbYpqUHYOk+ZScdMhohtvGnQM1Me+FBaQiFV+BvIPdId4Qt5
YcZeFsx+rzA1XoTyrHBw2maGFaldI7OpAfzN/LgABzsCPZv40cHs8/mJJSFNC7tCtPghbbFLMq5c
vgpDFU5TZN/rpmRZIILQud46FNo01Uy3RQcg7MWnbE0qmkL9HFqN+LVXSN715iegcpJjB0Pj16y2
KdXu7ILcaFBpFjmhdYnvL9oDLIBeIeDLEcgamEP3lbRLtRjACD8SwIb2JzZCblPqU04DCn3hLVP5
LkH3llCH3olcX4lfUJ6GXNDrSth8l0dvqSNp7AH/e+jO9H1V8z+p+nyuZfPMSUBleIjJpzogWnkC
MAhOFqIhXCW+Bk4Yw/YyraZuMnEv8LcdMVznitcQmT0z/OxXQ361hCxJ8NWnBRtWTef9K7faK4fk
KHQMe1+5D5rKnI6vLWDzs9wNWrRK7TXSZ9aHuygclYDuXjcJzIJS6QAc4EU5wdXgIV5/sO5Ot9ip
oiOtI/upmud9eJ4j8s9sSiZwN1X58H7kPnQRUtzLAmYhLXrzbkkWpkWVucPOBlkU7CM7MEl5/tMh
SILgnfb4lbTGJoIvbi/Ns0PFm+zsnuLAGKOAeTxbf+hG0omyEEgth2oRS3HOYsLNsPMXDiGWT+kD
HW22lma/FNgMQL+px644mIhxLTPghohvQ4upO+nAX7txiggGjspR1eVu4Kq4eYyL9ksjDxaQ+JGp
jwaVV/NdVTTZGMFz86J05xYtQGnSKMXbKDRqSvSoPdPnf2Z9UvF6J3BxErKHW+y4kI7/etQcVmH9
5d4q//eSTgqxpGEC8Mz4h0fvhN4Zzq1K+4+CipMPW8xw1gWJj0JChtIw9y/8nS+3hOMk6KuFWMTI
ohEGvW4MRFzxKlWhEGO2+GELSd3k3cKtr+QFHmwT7Qbk6twRp6D/2QF0FL+5BkUVXZPEbeqk+ToG
YAemsoN8gj6QQ757eKL2RVYJtBBzu2alvGs8Lr9AkdZdK5GnUtvXRaOUsQktcdRAHyF6mee1Yt2b
WWvPB1lgqhX5YHo33itiNCJVehaZf2aVsj0iD8vSntwYxB4T6iVmskw3wKx0CjrLxg2oSDoe+bR7
I2lIg1HONK1U7VWi5cEpLTBS/1e4bss4lKRuj9ImChjKAb2KroeZOOqueJ7wRZG7tb/sZZlOYwsa
oj3dYIqK+XSvEz2At42IMbbqBeSEbEUpTCXmJI5+IEdobBym0bNlUfXO/+qRxXTbLg0txRH8OWQt
J2nv5hBcmUlSfN1OGMKlpA1YLtZR0rIyMNv0NeOEjkcmLGn9TrHb0rDyklMQ6hHioyBixAS/AWeH
QgFI1Obi4LxBE1IoMSGHwVOtjV2hde3dDsWKbRGfgczaW/9FBTQX/YtCBSOwA3ETfY0/nlMyghHM
aBl21Yf5+k0qaUEVpJ63fB9adFdBsHtyACi8nWdaIkVHfm/MUwnCbyrsvYn9mmV7ZT227fFbovUq
2ElCuCg9RUMOzXnCHYBTz5PBqUEpcxbnHhSxFWbnt1a2QCP6sWylqRmRBlx3RI8p30US1YwrGBky
W2Mdq12bUjhNOT7P7oaErCltF2xSJzjIuLLRKganW5v95si3l9/KWgxUjJtwTffk3sZAc8miFjwp
tm+ljZ1KAtsad0Se35pQtYAitAg0m51jxB570wYsz5UrLfjFl/v6gqPa14rMpvo6kFlmU87D3RvC
mfiTEq5/pnN6RImDhA8fL8JiTtcABWskwnDj6UVg9+n4OmIxkfzowK93MZXBbfTaIsTwwUt/Xid8
APAmvYk54+pHDTdDSjtMzh6RTuDKv1X/PZDRWeGGHUlREzEdHx6P+rteFvRZzcJJoopSwDsNBZ2S
gUalKQUhI7HjWnBB9FHRxUm3wSM5NhBty9vZ1GxVYt36U4+yOt6iSd4fr9rTIzyT3284nAvgNybO
i/m0tFMmOiPI7mGPqTtX7SiROznoABkmKYvsn6vCcq9oyBLn2aGj70SV6oE9ruHFRhLkbkGm+tkO
uhWwybIyx8bIGzoObm1AOvXSEhQjg2NfD3FUcqTKSSRVFLuNexvPtbDLdzDpPQPAv54ZwaJafVtm
KrIQGmP7AZ+0GA5Tyi17OhlERqzlIUE+k/aiAQ1+P01VrVHc6HzpWbD8ywkC3CvJMYJgv2mGg7CM
rEgont33NYBID4ko9tSr5gtQxJlenVO8PeNjw4eCngeZZbq1ONF0MhFVow7Hr3Rk0xhB4DLvPfEe
XBztQOfI1NxTV6TS1md/fdeX9WETEkVrWbiynQvLhiphv0lX3G+ZBuODY3W1Y2EPoCcQsEWpIi53
4qqS9Rsgo8DeHelGJYciagsZB4VTVTpUBhhjW+0OSUcpbqem3ezZanyf/A2FotJe2zxaBGsAgyde
5vNVb2FBM4K7WLrdlA6VBe3SVLcyYstUUq6ZGqB57PvR6RwvTTtttgANz/ZPajNgo62jKl7AQYU+
Vt/F6XIfkMNAqZrtQfUauOiNBC+xz1jycN9cAfI9fgaBQtNR4ECK+b1NjTppFDq2LwvHqcU0bk3r
iJVa1yFJUtHPd/bkLeMTKufyBRLPHpEff2CiSTJhHZHvWO9D0KtOeCa5DssYprL4Qx/OAFQ0Hc7E
AK1SQceccKiWewMkLOedBR8oNFkvVW/4wzCFTPMJpueCJR1Wt83HwF8tpi8bSp3zy7yvse40CoS5
b5HrhEooBNeD/72uOxEg6vEZZcdu36iWwYZeKoscu5TtIfaCawouUSXNAwrTFRmLYJ0Z8WbmHPDT
TLPwigTCjaxGUPSYdNiXR+ha/RZH22V826ULE8eW8bCssze4RZITLZfIJXXwpbc/+b2wsz9ISg2j
D8frIAmp8PnSEnHfOoGpAdhhBaiTIEVWeMNo69BEFkkN9omIq0EWiWy+SBP1M0ZDUfl/41p7Qawg
bvajbGbLzYizEhlV8MxzldF+KCFHJGfp2XQPY+wzV/5hsbxjj+swu3PjQXufo5Wcx0iLmMMEotHx
Nb78fTSeqc6/6ARXem7PvcBqvEV2lRE9EtvylTdlHmvVijXlVQ36GesHjlU1qqENMqa6wvDKbfCM
38XboZNJQ7SzY9PFisxPtuVYSFjgQjzjIi/MnYUWlNy1XCZIIKGT76OAdfPFyr/Aj9Hdl1nC5x0F
SfQ1s66VOidsHUlBYvVyiZ+7HynGdJ+LYZfVUJcxpxyFOGppV8LdDRUBtmkv7BM5EJaZmvbRQNJh
RIdsEX8L/RORHBWdws0vdNkXWK6m9rwJThX2qx7z6qqrUZj6Hc1Gn/M8DeWLBqowXZ2IF3cKY6Qd
9POVI7T8iWqbZ4DFeCOmii0of+pN53Gdu8YYzV2eZgCyD04sLIdvfun16o/o6qVgeIFIK/pGUUeL
Q4V3Zv8hBWzz01wS1eh8j6ybezQ6r6MNNf4QvVyjtcTNeUAxi83r2MNXw5nQnDyWLaBiMrgnf18D
2hcKlQL7B/GWYfCBTZfNHU8DNqxfKqNkzzqEX3yE9LvZLpOEptyIfDhUOcTjLnA/Q5BHcNPbE4j7
yXLXnLTNLtjfErAYmOaHbrOy7TDk64rMRAHSbzu4xwlTJYhYSQyLdTuEt5UHGwl6gbPeXisFTAEy
F/27bQKIx9u5EaSdFLn9NYWqvRiSWhql4fqYzKwFzDLbbN20o1ST2GMABCV0tMWrFrwszAfuXrQA
8O8V6J4qwGMIym/tt4LnZyqzb7VMgzJ3aS5RcMgh4c5COIda/z+H1r4IuXXdys/0xmoZpNQueYx1
AVCQK9xwig9dVIbQYPC3Zgv2lXcMXy7y+SKbGOH7hgvowk3xA7kYgEKQD3MkzeJOs8PWXbEErpOw
Wug4VTEqQgj2X0z5Lenwrjyi30hTTkotQJ/v2FCXvkkjmZ4B/yT+4EDakNlvvZM5DtEo3RUfAa1n
zulo8od0LL42suc8Gdh6MaHJ5ZyL0HwgcpCLCXPLUsNj0wx55FWEyy+kCWAyuw5llSfUDlHtc4oz
UiYbXUN15RE41Ufe3gW6ewof9DUDvHxBIgGFfiwGyamLLlsZZMM9FprJVQsbHnE39BLjSelWjkvk
FVem8xZBLBujefI4xs2eoC4eeyKZ+lUbA8n8vG0oY9CWZFvkELAldB2SU8chfuo9T1ctoeuBCjP/
lJ1MahsY4bxSI/Ur8aiMBONUrSWFRxU+Fes3ewRboFc8UivWAjVKmjNluX6gZyX/nTG0oZ1wEWhN
5UUpE9T/3o8VmZBqfiJNejigfW4BmpZx9MbZ+5bdBxRsCSZ1+Gu5S4fAM6oi32h67cwkQSKgURL+
9vIJfHxmhlfrmt9+KFfkWEhfgZWQImjUHQiH9pHiKimq/ewtEvFz3OgKK5CC+Uf8wQ4vqCAN7s+P
Pucvey3mgjdHEAIU7GBG8ro+yWDPOSsey3k7mX4JEyBfCxhOD27ylqsgXdkX/E/VBB726HhAcYb+
OkP8UlkhLH56MIumMvdGObu/nO6dLVJXlXzcEQga47uJO9NVLXd5sVEm/I50NfomHduqLCp/zAs0
1Y3T5H4XkMVTuQjaN8k3qo5BGEBYkA77kMQ2vOM27bD3PZhI+2HUEGqchknnD+mir8AAaU1GG0og
qUErMqthsKFylku6p/yNan9gnXg+eII5SvfQaJPaCU86st/AP0f0qiNQoCvqyYBRZarpNKGsCUgm
fIckw2wRE53BGi2yQjinmV4DkT3bh2dhMLEX5WBKy+pl2wkz/cCuXFYYw1DleW92LK6ddJP+htl7
8hDm3tmgAT7JjejOGn7eqseiZ7OQIJm47kJY7ZC25JpAuI36rSzTxH9xkT/IEWaIHdPT6IjIjsaU
shB3vBEnT2qUROnciZGwSwGrG7s7B7oDbFbZqeHGGv4o3+PhddXFnx4o+sxiUpt/9RcXelTusbC+
O407/SOiizLpBoQuKGJVPVp9Uwxr/NPvrzHK+oPiwWycAboz5IyQM6OXbemsohtVLcVkbzf0gORt
SEcfPeJnIREz04XqJ3OeuvYEOF2uu2mUPyUFmh5c+bcCXXrV4R0uzRMAr5d7DE2SPFsUnp/zKVtg
6U6/z0obAu4p0pIl3nsZ+HfQg33+eHd0yXOrjg1qPZpk/+4DpQNbb8v/+TYrta0qJrZG+E1tjkWV
p/+5QEOAfMdwZHjC4X95/XMwrL912aJY3OK9dY9s6sK9yDSJ3KHVBfmyOipsCP+/nDb9WkCBzeNg
uhIXveAIWa2sxy3lPXTL+BY0lxvhGTrElDs8H0EAUWisw4gFsznD89Oxq9w7R8cf6dfeGw0rfOTV
LHeXeUKtEevpValEliUdk03yvazEaVZ2BBtIqNuLLksm4xSjz/a1isTi5KVT+hL5pVIGjE0ZEbz6
7V3j0240w+WSxShrANNf3VryyMALiSCE3Mxv9JrQ1NtUXG8XgKqah3OhmOO+X+0FhkB4ldGeD1SN
9Mgc8oys5MsvoeSzvZIQF0p7l4z8sGOfW5nhUlq38Eus7oNR+62vFlYUUz0Vyik/oi03QXJu+hYf
P7/bTegD8rYXEJQq8z7tN+WGXUwwSmeXJLB5gkvRWh879v8bbooSuxDxTFAKti6hHgAR/mfs72kj
xkFDOD/ZslEKLJ55HWvTG31eM6dwuIICSqXp8KPgaQaeRyEelTtZzb7+NvKTqLelNz60LreZjrcL
xrDl5d3Ib04FWw46FT9bWn29r/YwL1EyD2IIqFELOhaiSvqjwnWsQ6gcVYrQTxeAn/tGD1ItUx//
6fEeMPE9M59N4LJKh49sHWY9UfznAcs9hcBRVWPlQ8a3WQRjmCpH4dtZJW8ejPCOZpcpuWQcgxuF
urAqE4mXNBpMdyP/F5vk5vGor45G++y/00Q4EN6FTWrF9QjwxC01b2eXtUwDBR8ahn7136Zmc7MA
NZI8gjTsxjqM5hiwSp/VWNaZ7pStSD4ng5y9XB2Vc8YkuRLKy05wRoaMQxVc/9vNqkbHNGkv7aU0
F32lSO41Unh2VzNG93n/gpSDIZheZACmsODgYqpi80ZeHnLST62uld7Fs92Y9tyeQ0Q+BEqWh3Op
sEPMV4QiVP+5Gzrut9k9bJDVUdNGd8wXWFNM76PTJsnn8bNyZi7Z2Ha3RxKI7eKLESjx9ChXRUH4
r578NrPoZTyJ5Fx08tj6v4FhvvVkcjG3CaKOL5+QnS2F1ZU9thUyFgmQ4D239F0glY9OlnEp9qiO
5N/uDlI59pxkbYHvxZ98/ZsTo//2bkoVcaHBSHywf6pAKi9QPob5Nt5hZ3HN3uwcKOvtNaVSJlcx
YpTuILbDpios1iEs/PfWUZ71vMOFMp1nGwDWyxvSKhZXXKvvD99bi0440/jk7fKuj3Bp5Mp840F4
XncuiILp6tHYXBNcU1KDdInMNIwqcxhgGYsdz9ZhjwgaCGuOg3VpXXf4oMLqCgED0+zo09djZaEa
WbTnCZY5VMZUaFUhUqmhuZcOBEI4RROoGhby4LPqIfeJN81MqYj+edMKeF91kfi3dSe0JAIKLbCK
OuApW49TD2RM/J9uXbf+qmrdRqaRxsKYHZcjaOVkbgYJDfEiGqMY6bToXBbSwUcSwJTSgiKsvTgu
etoez9/WAB9GeLBJmDfzrHGsSEu71LiipWlCfJAOf0RRhavvZ1ChsjX6F0zWcOtq0JiMgsOj3O43
Z8gOvyK1QOda0OfF9hj24UQqdXTMEhqK8vMy0Zp5lg9lTTB5JjGSX9AHK0aTKcyoPHpIUt2xIvdu
2jIotkzizNjgjpCU7sPLxRtQj/yz8UTf20j76SVE24KYW9cHPJqkssGJlymFPLtjz/G20Kwx4hRl
AE01qj9bGeLIIUw3r2K2vk+RfjwCQ0EL2/faHH6z6c7HIrxXiK6LJnuPl3q1SZqiiRwoE7yEo/nK
fVFQtms4hJuMunUrE3HMLZCITwR2JVHdRKKHt2H2JiUjhOfulac3mip80ig6DZOJf6J8yqvjbKdJ
pm46m4aa8cZrGAMGmZjeKTFh0jTuVkWxfWkOEtb5dLAjDNUnd8/xj8hZ47kpeoPZ9uKZMp0fHPfZ
1w1asdZU/dKHJeO1WinNt9xiZdHo97Efl7Q4e98aIXdU7I09PJzKCBjx0MdwnXHmdfmn7CtUJIRc
7R861rxJbhPcerkaS3ckkJKf3hWSWxTxGwZJh2urJ0FwK//JNTjYikE9HLzo7WPhrc2YLDp/K7yc
8DUXkv1LJ6/2npbIi2RSssvJk0/frhrlW2Vg8cjxCqW7CjnMG9sojfuhhjhGDLkh6He+f6rNrFZw
C/FJ8NcGxoyXB/ty4RzXCReeaAkbN5DnsafK/kQFh7vfOa4tbKq7l70MNfSvYMEFnxThXs31I/m5
SCU8A9My0bs0ERUE31mcGbKj0qCTQqsQhvP2fEunrtB5MpnU/BjGd1r/TSSK6VAQz9KgvG29SSi0
/J0IliOlaGC/zsqZZqdp1nLv9usrC/R6cZXanTEnFXgVJoG3Z3kIM0O78jzZvdTwABSgIOxw2VEP
YtN0kk+CFg/iVQoKGEOnNFSygW2ysILOER9cT3zXeno1eZu7eZBSMOWi8fU+uz1lRgjvTRRMT/F/
EAtnKgLN77knNE6VasnuGqqFYxZROjSzaxJ/o53jvQArGEv+bbJpS2/TmNc0LZ4SrH57x6DqQ/R8
F4Ujbz7K1SLKTlaTOeGwfwLgyu8oiN0d4YLdnlxmKgC2bxS3L0w6ZQk18spBs15CMeKUhmEa1qND
v75wDU7VoENOnjTX72xSQa2oqSyyPPu2812HvhtPJjqqCuDu43jlGpth7MOzMspR6sHtrKPfTjxc
QxqG12CaLb+pJ2U3WM5+hbviRfD/4+daDaKncqR5W284s0oDYy7fj/Yd3zNvvgdk/esJXK8+6XOx
T9NkiBubETkWn0h2oaBVmvXIwS36b9r6jSvjnE1RRV/oSJsJQaVVttC065UEnzk7+jlUlOGt9N3J
nJfjW4Rxu9XGCTpB81yubJyzOSER6EaotnTmhw29pqGr+d+qAD5FVBYUe6ki8igQDpsqPJUvgYql
gJtqWdiG2CMvvSzeePaXYhu1ReualjONlbiM8Q/v/9M0BuyD/+ZzEnQ2L0yRFOCiEvvxvTGoM1uI
w1AYRSvJHNq8ixKV7JdJRZW9jQHQpbrd9OqOpxHW728f/6yO5vhsGOm4YszLg5lWvEXUjWVBFV8g
Zml/lGJ+ODsXZlJUTnl8GWsfXtaBBP2i0rwGgjWPQk3ZPAWKJ27V+baX4csjPNGgQ8rxPPCqeUdn
PsoEEfbQvS9rGcvRC0My1bc1v3VZCN3lhPymRja7SD8CpsbpSyuxOI2yfIuIQL+/4mtDu4YOAjCe
kTKrsALIMrVLmiXXkLa2Bi48VUmQBnznn1kjUl9BxnZdz8gAxJdNn7dyg0qAPmJBy+zw/+3ruBos
YDnd4tb3U3oeNEXoQfeJoEw+l3+wBuEmfdIKx10rDqL+MwlZVnK9/1b74qbQSNO9K3jVRkCoXpRB
TlG52FFHuEXm+mF2dJxDUXZ+3gxNcy6fc0ofmZfkeuxLFzL223BTdMQSpqFUE4C5UvF9SqhO4nsk
zuz55axSd0Wv67mybbmQY7zU/Ed0LP2d/84fLFqJr7rebR8QtwuorCakF2WZG7UtHlrOXyHBkoK5
RMuushCL+bJG2JkgZw7kokMCvs71UQFlPtKSEhgG9bRUWO0w2LnR5xg22Jc32hSMPtveg4l4A0HN
Fv6g6G2OMlf4dRoyzYIzrm+sHJMZUIykQZcD0D7e1592TWnOZFHvT4R7DH7d0AfxoCduG44l71yX
5yyGNC5n/6rRTtij06JA+gKK6b4WYuUArFjNZHBE1NbbQ4H6VKfT+quFfVono9TitzOOeJ1WaktQ
UmylHdbq2Bw2lk1Cx1hQq8kBKm1kYre4t720zCkGsfS8KRdjHHQG1WNXwHoHHB79IQyc4xjGArm5
AM3PxzwpuuawaH0T4qAQ1NI9P+2swwErfjtTa2aCRAuGQOGTAac2GTOGJZW6Y/YLuBae3FyblcZa
ZGdNhKwtPIMKui/6tpMIpQY/wed68ocQXGGlQNLCL7wHX8TOhHOCbP26JirrkN5IPRPPAaT9cHDn
p6wJookL/FWL2y+6jX5pwQMcq2bsLIQdsNx0qqkFkZ4NeFePre/xKXHRmVD+PIBjx4glkQt5qXIt
VGoqTNTGYm8gZg3jszBLJdEfCrZzkwQLM6TYUl7h+OyfLDjdz/xF60AhgkWw1wOMay2QYbbCG4zT
COizKDSE3Sk+BoSnbX01YQYO20UNOvgTKoAgnWSEGZNF7h31oJzRgtBz9TT+ZFrbicwat7rZ30Fg
rBsIFcdgdv4TybXPtyVU7eLOHS5I34qN2Knp8Aonadhi5sem1vuXyE6J9Nujd5AvZLAlcWET0mkB
HUPDC1dP9hATLysJ0R+UGXrvyQJokMbPCO8lAuMuHuJ6Mj/taUnR78Fd5xWKNocFRZ1nzdN2VhjQ
jzeoC0OO9hZzphefNf4dqYx5mv1JcDOm8qz6/ZoLH6B409H60SBAM558/6J+waDUf/mv4SXMRj3o
iRADxJn4tHdmKWlrfYjq/dDj0+cMVPyFd+3h0McQIJr6E4UVJ/QqBXecHU7t5p2lHWtVnx36Fmrx
zTdG6RdnAXF4hCi9L+FwLYciMZibS6gmItlr/IPUNKbGtcXC9r1GfUy+e3D+wiw7rw/S/dKUPw9c
fUljTTu/r3lLBPjlx+8mxqNOQsJZLbg3nZDMxCkoB3VB/cArkRD9RG7Vbm2snxNA5ldcKvR9kdZz
hYa2bQIj4EokPz+trYfoJoun0Sf6bYZpuGcECkbUnSgKHyU/aPxWVX0ZtTofAU12ctI49hyEmU8L
M2hL9w+JXv0/RHO5o3g4Q+Cy7iU6m/2UBT8nqwamMXu38J8kbclz29DZD73Gj2xLhX9dVweKPwF4
U/26/2FK+/w6J8xbmgKDGUUoJ5X6kYpyZm3+wKbAWppw5UyPZdYF7KwrtPHevOK6ZQzmZ3TSzrNT
M2qEJxyqpAh0ciaimiKCBawKHjk6/82yY1ompCNaM9t8Zk2K++B4sq8n8vUKbWtNBHgzyuUjLtC/
hubw/S+9y2Lu6ZxXVV9ynXrvVMEAac/4BtbD1p+hhLSGMZR5pAf8pW7TGfp1PoIDjsa4qhcQ94fg
N4PAU5O6c/8VaP/NrgwgyLHf5NHH8/fZs5zKGDPt+4YzJXJyGIwcP+vPbYqEIOq34djhBNvunM1T
vR/IgtGEqD/tQOD3tv1F74TtgVh0hKmdXMn1JPPhMYL7Zov5ulHOxlXTqEx5shkRG7q7VB1GIXLV
SOV4qf8Qs508V0JxSLK9kHEBXGuozLPgRhEMv3Rzdr7Z/sGZkOY/f8SD37dh/RclW9mKqPw+/HlF
cmr7jISDlE+Q06KHhgtQN0EJcCwdAHqonBYNYfzVL/7xFdWesO5i2bsvLrSqyEGXB7xzDl/wdSax
5aKMsZ9q59NCqNiESmpb7WsSxNSKIV9/vOhccQDty471R6hW0Ay0PqsAS/TNq/MlcR2GdRvG6+pW
TN8ENRs56rz/WAzwxsk4XdOL3I8p+F6D7TIUGQEElEVHGviYjg6H2IFRIMDus/b5ICq7lXcRlSIn
m0QVB9tMuNUdZ5zOf1jYWtr+NRt4LesKIfLFbxhFKdCBprZLh90/GOSDNZ69CrXsRoB7lIhrjz1B
2nwclYrptgD33n5JwogowkO2Q6pNEPh2r/xKz9L6tWl7rhU16xN9JHU2fq88rSSspZU0ujDAxRIJ
H74QAVXFWB+oBB5jo9uFe4wslV4IGmslDg18TnpRv0R+QuwiMxMZOvZWm31Wv4SAL0HQb5lg4dRK
bkmA5UHFYqzAB+hGtHALXuiv0LE6Emky82poqPzMzQ3U6EgEDbLiqggdCUVmhFADQVn1QAolHGcF
8p/t90mSu1tDkfVTPLO47w/kmfco276NYDMJFw6oW+E/CWBrgVRjyxN5UrML9YigPvdplrhSjyeR
Blnyk7EV1Daeg75oJ3x3b3RIHSg34Waes6d9nRCaKgx6HSdjfxHOacaaR5FfbVtNaP9cw2ONsxKT
hmU/hi1589RSPSsU2tR0f0uVU8TPeeXLu0kBdhL00sX3AqCLXadfEiBPtlgi5kAbqu/lwIIEIm8a
+GXrZjvrBBcp8STh7qv4fiG0yGBu8dA0wXfCDZa6eC8STv4zIzcZqh6JZvfBnawviWl8hc2QEmDW
apfXB6lY3XD9SofR5wy7RO/xAh8SXX/85Vbeg2Z3t7WbWIK3/cVoX4M5gRRz1TbbFT7yI2QIFxDx
BNdoIfxFqEomtttv4KcVrMleYqeOO4GleZ/tNFYMDEwS+1UsEUuCKNJceMMOhr34YO0+Mo84CiJ9
gnRa8f+cMig/Za8X4AVhJueJLc0nn/NFO54wZwQWOtnwmQTwFFh373Z/abtBBK37V2G34qEY9A2C
PcsqG9r3JNRhgnSAOHAn8rnUAWdfX+DCrcp2fSx9hkAjkXMJzNwgaIh1tvOcQxQipKpjBRf5rK9q
i+GkhSXZs4GjlcscdKbHGk4Ns/KWqlLzXk0UChLatzU621BWk+NYBvjleo2Jc8/3P6bfXYaqyFmv
kWdoaF1phEgWKMqdsqBXj8OElFIrVz9erW4Rpt3UhCxBQZgMcjzl+9ElYmy6X3s4UOFspsi987nd
NzuoH0C1G4WnaU5ALpXxWOSEnevqlwYIexIsyLYJOiQmeDepDnuHJZYg1IgSQTzBRAaCmW0vU1dZ
Ebld3h52HkHyscJ5I2t5UmaPYmpRJvG6EPpdb46FMDwA1JcpG7OKybSce5L6ARSS+GFVF9BpMVJI
6nwN2hvaVgflJxGKSZghRppaGoD9Qqf1W49x3m8JXCtkOViMpbp5z/o0EYa20ClIG/EeF0pGi9Yr
suCvs2DDc/QpjDekyDMmVFfj/QSGR0igDI9wM//1qLKoemHuePVUghGID2EccPnRN1prOMgOQcwh
tDqJFrU0W9fgVhAm6xHmmX6apDtOfO6rL60caQ9QpNxp9jeuQQvtYUPnMl62nj47Kf3A6Ijulq40
j/ZY0KwH5uupkq11zwM7Yckcqy7KndJFTLTtpsF4vhhwACOfvZXPOZWlTgvbV1T0ATaGL8Zqdo50
/yhkbOQ9uFpICSSpqqWOMPoWiX60BhwiTIZBI8mRL2W3ZVyT6KoDh2r8ElD4HHo6PWcsWPagyqdp
L56dUGQhyRB1hxF873bzI9XhRknjnYRnrKSkWtt8bdX9bkn0Mre1heDCRGbkDdMjUhQ788936Ouc
avObSoZuhUtmLFNJW5nBDi2jnXb6go0gz5EaMBqazUpVf74ztYPNE5Z7Rz2FQp00UyCHw9HX5TVi
kXQ5C4O3haewI0ylR2jdY+/bD7eMiTBNOdpdyNoS6MhRlr+CeV6Emnbm0yVxMxmURD+rCMovHcyo
6pUEsET8HXrtk8VbD5GG/FZu8NNplQIyFutSkWvf/xPhnOsGmE4gWi+imCEO517WVYIm752GuqCu
7UbaZe6IIzDjTWp5JmveJHsFzPXvR27/vspBCZNUWQF/rRtZyrR5FTPo8N/PvD3dYzSeZVE0NJVS
dsDL6EijZkF4hiJaCHjLE82yTlcyUAa+J7zMG174ZhqTTz0jcOIagyrKnuU4OvxS/IYq5YptRgpl
Rfazhf6Pgp6NZe4kNpGkgBqBiOTRUpVaiq9vtzf+B4AWrWJ0xwuxfaPqFesPpAFfoPOv/OnTP7p/
vxDYzmtLRpzvmUMmadmMK3eQF7UwGwv6kP3favRy9hQlnhUoeauPfIowTAxCvhkrFeGgEmJfk4ur
zZB734ry7mPsdXLmt8onRlMVIRLhUvWmPFaYHAhFrHWu7NxgIommcym3zzojRkn3hmCVGWvgvQyO
33HV4M/rtieJ+8GtGzceCwybXJNe0HpZiQoOo8+LKsH6r1K25a2JoDHMHbizmZq0EqZK28ltJqa1
cs9OCLgx42Ka1Ol7yJra7XBTe15j2BnKvPOsmmFQFze5VukYTqKNGsU0Fnr1Pm/XJfGbdlOIP98k
PALIqeZ3hpFYQykNwQScsm465/sib9Bglsn69/O2NZV2wMJ8kEMM5brNWdazFos+2qKC6KN0c5mG
8a79Y5m0V+QKSiR30s1mkPvtB88uak7bQK9uLTbcueaeTHaUikxHIdBd0W06nLXpwzP9EdNSf2+A
DJAzWlo2Vc0083l4bK18NlXAdbfvft26lzd42Ouetc+xFwHbIDmZAX86ozviV9viiM+vEKJchxOo
ilGVtSmphsVZD//gY+QJNmYkL4t9nVhWlPhgNf44kJLGf5U8rEB1oALD2MkO6AD3GnK2AONaSx6x
mucZJSJQGiFdF6jE1zNZvN0XM0W9xrV6k6PcUWbqBDlJWRgIupZEFEOWXHpe+3RWsDoGRIZspPre
TIgw08jfCTQLhEnPKpfkDlaD/Iq7GIvel1PCBze6FBKwH5Xi0CBFaiFE+9I63KpUtdd8Dw3mngWS
uM/iXIRh+RW5JEsW1VOxlyF+rzkiypbw2bTKaWJsnhM1z7nGiYDnKlVjdrbl/TaD1BsIMZIKh+5F
DxP2w/E6sxeBxzMeuqxpX6fWLQCmPb3P8waMSdOB5kmARSX2o86nftZsCVunGstmHigeuxfEetop
7rJqcAY9BjwEpXKm0JRKAqn/djsyv3VQqFAJ42K6YBgPR/i/ZS0esa5gNj5Uvxq4CrS7Wk14kR9y
Te4zYc7eArbrQ22N0vre7nPe04ceI0Il/cNfRTBW/Mi1uQVcoRnLGrZdOcRvDGCFdzA/2vkGBDCO
Ot5+v5nwRm1hUNRT2YfazioJ0vpAeArz+9Fcf/9Z8PjdVJ8jPuBTn05BT3//62rw3fxDGp9NzhxM
1C7UcYaDpgZEEKPP0OzojlLMNBL6SFJ2zvPRs/t+m7/0gFdPaHFJK6iFimkF4A5aa3E1OWv/wnR8
XBffW15rz0pGQrBHlVxmHi4ju/AoQvoEZc9X8TmN1CxCPR6D9+BSecGzVzqoe+xIV3Jn9Sb5tbG9
SCyRpz2bCXwLFZD40MFqkalIRlQusRSOoxozXCv/Qvz3Nt5ZmJdy1jcnBrbrY9toI8CjX7doHUXG
uYJM5pQ/Ew0ba2H/Q4AxNf9j/PFns6cjxzbT17hPYjE5OS9VYH3CUFlBBogrwmW6IVL2g4RhnT/x
kGxwW+1EyH35lBTOXgukh5x8zS/cnXiLijv6zYe3sopFLLmQ97epUjZsshbWQwNBuii2gwYb0NFw
CjqJLxocVYN8fTouPR6V3d9TEPSrDCKU+Wc4bi3wmC18bqOApYymUlLKhxVgK1yM7Gb/vfkV2GWc
L1Cu1En0hQU+1LgT7vP78Hk/waYChOGkJhyOPMNXORcWN7iYu11crcGAcl3tUgvvIpBB2bJ27JaA
o0RgXGwuP0xZaMmrCpvFLtQsM0iFsyW99v11Lh0pzi4C1opC4kki5C6m5AgW2ZjbNLYqHbc9ri8H
A8ifL1NyPcqkoKtPFRji9mHneLnCMsJkD3ToSOB+Lt5fvsnCqapCm/fbwbyCPSc8H1CUdJlY77So
+aBAQSmyYlE827J/WwiLOIyCqmCEKy1bCmJVM/79ir8uvR0TqCsLzf6sL8OrbPUVKwut2NKVL1Sw
WASkyChPVUHBUYv+m9fQF0T8GLFjt6Mvq0AZBdZIJNsVvJGYdtm9ZbJqWN0dUBUVXqqeLo8t47N1
e8JwAy2MudGdTy/dy99HwGbUlr0q9ib6uL8ZL7cQ/iXPsl5KqFGq1TE0FWOj0WakNyaj/05xOM19
Op4fr0fPx+K14+9rtTNA1c302b/hi+wZKiYVPmUI5ySGW8m5Lagosl1FQAWplAzSp0iPB4IM7X2+
mw9fyP2fPbRYdWfNP7epHwhOpdCdxgZ0mmuOoSmK/N2+RUsTlUlvAoK0ECbIe2rjEQhctTaxk/rH
vOY9oWMgNqeD19GZ+xd7IYScdjyr4rt9YK7zJddVYOM7oczBss0Br9jTrwiX3lMabZ8y204fh/9y
g1Bww0oouuqPYJ+8C2/NPv0cadjXu0Wh+xGSRtYYgyRo1ItIxxzJJC+PYd2j41Hsc3U/FruMogTV
FVSec0ASOOjz/epLbBhEppPX1j0K1tWerMbPuXlM+RIKegyRlfcSo1saODNNvXCSqFVs3ZXqv/cd
7+JFUwHq5KA4OxWJ36jcY565pZf6Rw4gelKBENf2OQ9KBn1pUafWS7duI8v7ForIBqDLxWeY7875
/aqRPaKh0e2jumbEx+3SluDCo9+OlvfMQOc+7aOAEq+kDwUPOtnGvTJ2051k6MPvKPqqyQyeOhiw
+3+hIYm2ZdDp/oUGpdBpuV0fSByW0mi3fWP1p8ir8mVNp9712xDEk0fYsL0JUjD/dowQzW4GDr5I
Ysq2872avqwVL7s/OJJLT/0GxVhl5si69Q9z912/+AxLs9IFoHBYQ6rEgW0E/GAN/EZ3f+7eZbkD
VOyUgim36YLVfHAVyBi+oen0C+yMbxmxSgt6Apk7t6UUFn7Weo36ZDxCJQ8UFRkYatFkz4aQiUUb
NV0UJSww96l4eG7fzzJ7Dw+1BA4kcUSyYTe85KaxaIoTm9lwXM87FfuuDUwP0X22N0jzzB5eM52s
K09YcfXBkbXyTFukQEnItNldEOBzw7979vh4+jtAsBUAxmb0qYyweJ2b0a0LE5vgb/MNtAMP6OF8
1aPuCBzXmJRttWOPPIr5jh08XNgYKiWEINNNuUuPKARUbKpH7NVL3ZTg5nEc7fkSGhSesY6CbH4n
g1+LLXm+0MFWxxx2Gtj6nCNst/k/goRAcdx7GPY5vVczYx+GsWBsZudNkj7t9v9nB8lzWDTtT+uT
tcY1Ox0ANh/DmutKasxHRQIAyggBBLvPX7dyfPRJwj1R7ZH3fyoVVZfkO2g5LwW/YZ9cpElA90KZ
H4vQBK5qRxl3F6SkNnXe4gWDAsyJn34vpKq9tXiHE1xYs/54+dgnF4AoTDdxJogqC5K/Z2vqGoDp
QP5XWiFNcf3H4znGisOL8Hm8xmkvwc92+nUOtzWYDwNqF5nV/CDg1Yr+bXEaodkvuY+8umyOOouj
BoZ+qldvL5ZDwwl6XpGrTPL4UFwpMsL/veOugGOUqTNBmdJFpiQ7cug3aEq3fOviQpupljmyEbud
miCztfzpvNDKs9FlypKoBrfrv002JTkJ3tGK29vHacUjUahXPbXBMq7JuCq6V/YVL/RYwmHMK8rl
iWzReDkipXM5EgP1TxZF7Z3GBwirtsRFT+oHLdB2HcSNxqEGzpTpgkZJZb/8v51KplApH9z4QyrQ
rOIK6yeuGNmnArZEAFYFmOE7EM6JVogaEmRMaDV6nRLq9x7HXkoxdr0ReQtuDz52SExZpUk0Qv6v
JT6xJ4vSxCemV4DeFY/CvFtWZknFJA5w9AZR/Mad0psE5TI+KRic9x9vHKu3vgsG9NMOl7ENRtjN
DF7VY2H6qHxEfiH5uwwKGOBrr5cyRG1C6Qkp0pQf9L9Uh7/Zfj/HthGQzSg4/33q2jmv+yoneAMg
EuFIWjMAYaSiqvG10q7HJ7uE/FN92nqLQ0UvPe/B0HObtU9s+xraesiVI1L0DrnBhc/rvWzVKPDb
Qyryz2Fbxxe2SxL7J5ScFWWl1q2k2Hsr/evD9mtni/n/xpWM4ZmKmc/bnbFCcyfR8ku5T/B/8ggg
8VaLgPGjW3+QV8oQw3LOj8QDDSpt5tFu32zraglKDJbORQCrppWCSpOm3E0T9++W1p25peQZGSAO
TUh/p9stUe9aZuYCerin2Az2/ulKZR07jV/7Qb5kZTmruDGIV2RbBvYd1VD2IUtO2ZvD1XENyNfV
Fip+Zpwe1MfbTPzKCcMdxQAjAMPuQsbD3HLPasMZn9R4euw5yI0wpHpxvbMUTsvO316vY1JBGVwZ
GXa4vgbeiwLeFfnwxEP3HFnHAMiT2+mhRnsjt1EECa8H4dTOb+5cg8+GzSVfvPUrTJAMg7rmIjx7
8xlxF/RFRKU4zHKW1bly+CtXjRWkMbIhqPi9qpPVrsFTNcmXLB3SXetEDXp277KY/XE3PrsXva0L
i1HORN4B7EduPy0ZxCt79PHk5Wfb60F70nSTFoLzLkdH3TSvxaA7P9Xsdkfsi2u/DEsBqwVXmvga
PbWmLhIi3mqFPxb+xwUIoMkN3F0O2XMjTc623Is6G/BHg64Qu/NZO1qOabtlLXp4avjTs/Luhteg
vY9KHQF0fvqN8ZcU5J4b5yB4pUcAgfREGuHBpZERoI5DtpCojOI3fF37XnAqsULXq92eWOPEYZ18
0wg4FAvMNfwGFRH6tF/MdrWbkcZ1k2nz1gNsOlPQTx40NUZyDmtXDTvktaTIlXw8FgOSDiiLk8K7
Qrv2INoMCA+Rvoon7wzeu4vrZyjbnarzEdkGwlgA4fXvLMV39eMPcSxuh0UZ5EyRrl3T93ezCpTQ
2wPOeZBZ41ix3tqkn8nyOXRPTVBqDs6BKY5U0EkFXboCW2HRFRA+La2rmA13StUQScSYzPy1n5Pr
6jhVKbjO6hiq7TeF2BhmDzznC5PAhKG2Ef/UtYPklfEtzO1M76tN9TE2oQK66UK2ci9qn5lhmaZG
tc2lQPdgVg8kHQNZKxulnX3jQ9MBqbvQbFp/bz1Qt9kSjUSPTMPhO4LispVaac+nw6NxMYDJfW/U
1qq1zSMZsJadRjp6DFFsBXQLI62ZImnFOSijoOjUjL6tCSW3lGH+QNQNfDIXXSiqZk5er8/1GTM+
gLNOiDJOz3mRRR67TAXPmPdbiu7oBWtXa4zXjc3AtBZw2lBOHxOpa7oS0gsXJhO34DFyzOds6sBD
t3yNzxZ4WXp73LLub+FhfxF7PNONT38ZOFeavmQxHllcQNQ7rzqYtUcVPvdY+TCdFiK6DNwBymGH
DDubWUNPv/25wxdGuCoV0Blh3ChpRKynHavWeLuNb0KocYyQ7Nb/YKj0xd7nm090k3V2MP7wPUmS
fwEakXMQMjhTC/y+C2gcVTaLMKVNXovcU7IEfpZVpMk3TUcUTzXOXeQvWaCjUmuoS0FeiH9LMl8t
sDMl/l7oSaxgSR/9y3Qu7bH0+OYOc/dBS/dq3uNM262nUmJgQnrnt5euL6VstlIhFO9DNbUIINi5
0KLJ44Kt76R6XRgZbqLK7sfv3GVYqSH5F6lmwuPlISFzjg67XfWXHe+tEkmgFpK1xojhF1SU6GAx
S+pGrfPJopML8POhhaw6QcOlFEnS22rdc6pT9e6A7aF3r9Qd0IMGND+KmRSBHtoncO2dcd72KOt0
/6YlUuYYWn/FtARa8dnrtOW/O3NTpJl4h/8ZTgKlLTz/4OPu5q4UGQAHw53po9pfSXCQipnqfxgj
v0fBGol2c826vvoj2sld8GstE1xMzos+ux2K9QwNiyiA+a78KO9LKKKid/pOTPFhzR4YF6T+rhH2
jXkAe5AbN1Si7/cbxwSQldsELCHBQHsA1QN2lZS06SvLT5X7Nzn6XKhq96iFDHkSe2L7zWFLpA8O
KKTsckr5E1bQckOqszCONd5ydfBTeaowuyEbDnCP2k6hCqBHm9HcI+c/MWSgn5sVU7ffyKq2yNlI
BN2xlVeRs119Nod0vTMgD8Fno2EWkja7zCvslGfDuqPKDUizu5Lk/UlKwfrtHzNuczxap/PMNzCb
N084LF6Yo7sqZWtNBYXDTo+1YKcs239coR/7SiIrERhTNyPCb3w4cvYOr2MsjRCcprbj2cjEkPqd
/M2ZHlRfNPLaacL3CDTWbIYdzoJRr1xyRwKKD2LH9hEZc3n5m8ds8760271/8xBTW/FfoFCYuZcX
AwcCg5cFu8GC2I7U53ZuleIslpYU8S3Pe+EJg1XSadQ10ZVgECrH0v5c9unO8THACo3gTKALjoBV
L9quma+SHXohD/5rF48edUQsUdw2fDltiF63Dth6fxhslnODzRdzTcN8TNrHafhMxeSdTqBoqWYz
uMpxnV467OCSjZ3218zuou1XuS4Xyanx4gVJBWUuqlARvxb1VBHKLkPRH8Nqfj1OAzTPq3tL7OnA
WX4RH3GNu3uMVXMWbxstmbBb9FhqaZ/q9cZSq2Zm9h94/F7l57QoO0GFOkGLZlGPN1obE8bOF/iz
NEJPc7fxCwk/OUXc2VhMXnNFpMzGfkz0RdA3F6HM/aMYMvK1qlAmoRPB8/Wmzy9nATvHRzI8SVog
HBXMIrCc5JLNxybJiWdE0G0PfUlROCpvEdGhmGSW/jI4C2Atd9nNpzcSap9pxpFVMI5ysY4BadcN
Q+Sd21TbztIyE3BqPiDy5rQHieye88OfmZd3iGv/PRyHW2ik22QHOjh9eRRNhs5DI9CEdChjnthu
T1LEhxM8HKQk0zN9NC42c/CPxpMMJuL1j2VvfpDzCjeQ7PGtZu0NXlB1V+DhsVRt7SOwdwyaS+vG
CQnaEROpHygY2Ah5+T5rmmdaX2owGDTqAjKYKGlZR8osvTbGC+Ou5/HzTfOthF6udr/tuNmBVKYH
YUCHx/oZ6+PFZoAAupQgvAOQeWLubsmwGvNz7xIWwOAW/Go+3xy5LYxZhB/ZEJgOaIl8AORLAX1f
jiFMaXQTt2RE+RrM8NeqC/3LIj5HC+IXzGsO6Mq7qjUUtC7YZXxr3DIRuRTEXMfJ6E6IyQLldPLf
rmYd+HsRyNzx0ep6izgAzaUyeyqpGk+1CEr5Okbrdo2/Ubz0/1YhC3nDYwFS0RyPAwCrKTDzmgar
R1teoKjltqJcyEnre1HFYGdqGSUwHJDr0cw+/iKhoWkGPj1Qs6AUWJXLvMK3/K7Y0AJBDH8VXb92
W1hAn0aAQZfsLwjcT5sP5Pn0bz2EyKFPG+bbRmJWi6kQPITLut0NxGA3C7kT+aXmDs1SC6cFToSF
OnEc58SBdDN5CN8jUacRK4oHQD/RHGB89hEbt6etBHYw/D7Au+pLCL1jPYi655e3Q0l7xlEtunV+
9i9k2cHBj4O8+5Avwb023/cY0prswobNLlcJI+890TLbuysB5NR/vLmAbhlfc+Fkqr7jwAQ4xgX8
q6e0NjBEGRcQrXuAIi4P6t78hqE98t3FG8wQYHHp8C2lz9XHBISjDl/5h7JC5c/qq4ep2bCQvlH9
DGguYStJCCUFAT4zAXeU+tEv73JAswMu7LjrmOECZMFBnHqnJ25+Hid1Rn2wyho5Mj7dsSzsrPJS
RFOpHwWkV6vEWOpnyUCkSwMONJeNcgQEWy7/dHifW/LSkpN2UKwNz1VX71hKZicUkEbw+pzyJNU4
5TKEWEUYiaRqOhtaH3jgyVmR/USbwNKXuXGun/3BOE7eJ4g5i5nNxEmrq9uyoS9qK6m281HEisNf
JRxExwlVNnaXRzJghMNFT33JKi7j28P1ptpzy7b4BDVDMFpTlmDezNhRCWn+w0hM51SgJm4PSNJt
Oon6EC2DilqzBusj3H04HrQVewRMxgUShUh9WfAoHqKRNGSvln9UASkWoO3977JAEJ4GVO9WpQ7R
wEB8iQrvRUs/+a1YdnodsuJfubPZe9K/7HVj+pFOrjwceHrQTJ4Pjzaig9JSZo58SG5mR2FTZ1D2
0T/h/v9nigATkBWzEe6mr0MBE8n7KhB5mmcHF8PHNiE+CbFthuybtzQqCMbjXSGfuE433XtXh97X
T4l3/3lLtWUkH2IW6bbeUR1+OncSGRpQlbvCwDHnHJ8zR+L41H4qJUCjVn2adNK5Hns0VS2W1WIZ
NPJXYOTJA+HSdZNCQIYW7NbOLhS0tO3kq3jKLtd3gBLEJM+2Fy/oU/MoazCmxrmipRT2MNaDOdCO
vzLYxd30Sly1NJNCRcSS1OWG9fywAc2w7eatXczDvBrwVuCVufxFEbuyq/frv+KeeJOX7iQnR+Rr
7c7mnBky+GQ2l0jtFys8MQxVwvMEiIe4OOpAB3ZJL6LBM5C+mGqm+TGAEqmSi/GgNw1LtTgXQj9b
boeQFMQpnD/SlcfMqLIbTIAOlmRqEVQ0MT51Dq13QvIeJmjq0R7RXO0G8vo0nsDxGY7Xq42zor/5
jsCxbL1ENx++/5FR7WQnEhREtJ5YVbD8fPniwc2Av3Na9NQckSFAScOJTeierAXrSkxHxEWR0YMu
5gK8qUJanTFJ4frJmy10X7EFfwrvYxWkzdvhohiS5IaALrdNq+jvv0Sr8ICOkZAkCezltl1wTTBI
bJEq8w4iWcbspffBBUWwiuHq2d46AE4FAaKTvXBPMuzy0rh5t+GC3HEJ2bw1fYnCEIJ9A0oaapNY
fLI1E2bsNI97flVvUXoo+ApBEAlonx2ewHkYObv5j8piAkfhnj6nSDKELG6P8DbxC0lAhGXf0JWj
Rp7DspaEu5MdUN1B+iltfRKJQTAvb0E13RO5SCSfysgkKuYt08IXtoB/52RUfk530a0WaVYHVoq0
xXMYXCRFh5HiUTGSukYUVESdK8xbJ4dXN3dRw+x4W/2RzodTJi+w0RvlNkcvcxS3P2hus6ULf7Co
c8S9cDjdJ+eBPCU1FXmn8NZy1r9f+9InGT85KoBp20SW5EJ3mk3zSYq6DnaBJYtdrCw4Qv1JhK+M
nbU1jgMYzbxsXvhT7xk3zEym9w/+t0FUAAR1XgIUgaOR6i9yN95BMtA2QR0Sgkemex/3/WkuTaTB
cHBx9zURQyxzLrzqgRbPzM4n/Y4nsVHEAltMyUL4HP2fRHCJGvojvSce21mE67SJY10JKL3vXWUI
IidQE5QY1TAY70eM1mggnCDIDsLP79DdnGtJVleZdSD0oZc4QpoVSMUs4hcP3leT+olk+OMtnQ1O
3Pf5GXtwiNURu0JGJfZ7mMXuEEi2wpWttExevFYYp8KSJ0Qt3LJiv0cC8jUWJ8JcXs5uv5l/LdMF
/gomwemRb87cdbOLGm/41CKRtK0n1TTCOw6DNo8a+hgNtGzw02Y68WliImA7/TyBonqLbh2QlNdr
RxYVvKhps+zHkAltHV4WBsL3SviLJZoNTYKvD8UQRAHY93CfLMSeWQct34olhzP1PZaDJAgshmnS
2H+wox85oK6mmYutw8wQhMGVu93ZhTy8GzivdaiIP/D3WQdCJ5sXpC+F0P+fNIQAr8qIfRGOYISq
smT9wg2atEIPObJau/3sdPTHj5+OCkXLJedWzZ6vlunvgvEw44Hqiwbxkl7uHkNAUGaJLqZkrPro
kyoWUDyirkywzwf/syNFCjk9K/ymH3gxXcz3dHwRbE3PZe38HJPuk6WVWj+8KjQ/sj9Bsd+zZcJP
74VnqhdY6lpS07SAloeQJXIUTSDV+dLheEOSZQRtSWvU1YnugO9ZSjX8CZAwJQWZ5UU1AyjY3Kj3
GWb1SGV2j6d9vCbV8AsaXRZgFv3XiApxxYaLRbCfRGj71i/PS2jemZmPkiZUmH9L2PfOsCue8PkP
KUE0BlD6DEMIGcgDsXblW3A+Z/QSx1731lYWSgFHoLWQRBq8dROAxHOrkO4nIRB99el8iLNxyMiv
dm01k2sS+RkFS/R3Mc8SfcN3gfqtr/wqJ8su6kBCvYXarxY/diDZIIl6tej2p+P9zlmqUjbxA2eK
0KZpdPRQW2YZ8IMTez9ms3d+xiuY8pIRT+p+RJ/R0fPvbS+tLxrRc4dNN56h0uKUXYpbREnKNAui
ltW4MEaAYgPSCE/CAjNUSsvN1cU4G6UKoZ/AzW287uk9jGKNGQ2Ro8e9SGNfJ4zZWwxa+22hz8lV
FoIq4Get1muhaGCtf30B03I2XfyriYuvD0GBuby1/qmNVPeBJBqeQsZRkELdZ30GfXeJpCMf8kMe
r3Xv6kakm3D3Dxlo0jlS1/2i+00czMygbug4/YnN5lKH/srGpncWmC9jCwg+IpIe8/V85NMsxQqx
WpfTjN+FDE/3WuFO3U8kqVtFJpa603EmdPOKPVT9QM6/pDiYYtZByf9l/bf0xUcYGTVSGjcal9AN
6w4UNoewSPk4rBG6p5ikPVxQOGhtTXKbXf96G/NLf3LjSy/oKrB2smUQGpvLEFdKiNoNnSK0N9nD
SxeQ0vnDBMhI/TYMNZITZ6A/EYwCFZvEvUvBwAFmwl31yqn328e8eHcN4y1JsHV3MxA8t+S8ifif
igD60N0MqumyoETBewmH/iyFJS+8ugQhzjLGxzRC+TSprUUxPHVn6X1kbJg5hF5VQfKACeYEnmXA
wuRwtqozEyM599M/K7NRiC3KE/ZypIFE8JRNHO1tnkdIwO15zJr2QofdVDRHSgL57F85E/nt11IS
lxYTQHAc657MlWfnj/Pji+JVVb1XpCiB7rTodIiDJAK/mXgi0Apwa8I8lqeYh/wqy1qy9uDhFtb5
XJZpGKaawuHZxj7mQHtrbfUy9Aewf1GQa/9thA9yNwNmT0hZyBXLeubs4n/xP4EECKYz0+2PKKGD
FAw6ixU8Y5f8KdQFzGXFJLcYgZhG0aIvVbKvKQYxT+Vz8FBuqC7n1oQhRtB1vFm8asc4OXx86e7B
1/B35MPGGvFijaAYHWbw9Mq/mRwRZlTsB2ruE5bE+SgYTNaJiR5E8pdrm7usPy4JY3gjBwxsJyVZ
N88i5aRBJf/cH0NQ7/w63pwd3NV6TpgITEM0gZsXawFL2HHaTIMd2VcFJsLMqILlfoVP9gAwOs2q
BwD26BdG70MFsioHjy6MmH4A6iw75dtRPIK4PF3N1AMQhkG/yLC4Jxkg7QrfCzT8zVCkwH4w0bBL
E8c/zQmnNJAKKfi1nvMwPUKU1HE50ZZR513oYRv1kjWzXcNlMEdKrnl5+cVHTB6cwT0oHDNl6K2g
TnrW+UV4i3VGykIhsZKzpTIx7rCuh6NoqdWPc0OGMcLfYsGm4bSRMvwz87X4RxP7iStFjZZGHUbq
Ju1Wsvh8dkOYmtNY6n+rmLHZMSkIfrX+tmaj8IDnG5nff6+U6IuPqqVsRyXBAnDZfnH22qRVkCS/
NpsQv+ReUDz+hx+mFArlFovG0mwYBmdKnf2TFOHa4w/nqc2aYjbrKqbpHDUBQ+/HvdETW6Zyig59
t5sgqVKShY5JuMTSOCUUDzl+WLw/WM/EfOiWn2wtSSD0qmcgx9+mJxd7B/EKCNYOzQQZVwVxXLxm
5LoNII09relrXknnvdE8UjSFPn3QzhBaVonHxBJWPbAcr1jRNAu7DS4ZO9bEjJnGm4KfFrOuGT4C
98dE1ZwXxXZSV9QhfrW3Llddgq256hcU8eQBB/mDb6l4OJdD2iELKxrLUgHLvAQk4hvek1OUGcJ6
UIIQcsQBk2nP9EC78RgBw6/FL3Npo7IIKSC0CFkwoW0Aq3sViBphQV7zm2jBtb46ZvHgWl3DlqVN
jK8SfKFwN+WHpulmuztEwZ07bJCS0BGXS0nsAKJmIDcFuXf/D0EuNHgbXhglw+2k0co5i4pq0G1P
5P+QrSMZRYENMtSdDLD1tH6F7XeDICg6N1mLL06uomONu6yzGu7Jf9qJ8PSdhrWX5HuC+8CAqXtR
336Pd/BDFfYkUMijJCUtJBauaiWSZwGK1Gd6f0SC40euKMvneDKMLkFz9vOCJIVJs9oH0VnZk7Tb
mmobEGaYx6c3egkzhkE/WZZM84w27KF79EDATJDv1Q0wrFn8hEleWQVWqj8JMBxseq/gYKM851LS
xz5rHurIndv1gqyvEaJX3eT2Vwm6oKN+O+eYd+GzC5wy13AUWUzSMS1vtXm6GBBs/+ha34WcOW/x
1o/H6FW6IiLnmoC45d04g8cBV2Wap22HW3yxoUj57AfD4FnTT5X3UKAPiC/Rlwu5GCM55VRmIJiU
gAMn5bso550ygnjJrAFSXGCrT5xnBIuOZq0eThv322NueTna/eFS4l6u0WrPua478YyvGtmx7AT9
Sf7r0sWKS3crp/7jPEQgTMzQchFk9UR1zAo5TLLgQtTXvVvfT9YqvDtrz8sI9BMheToghe80ESx7
AOpunPcX0+5gV+p2WQhNFjwgKvd+jkgy/P1W63TOVWAHp0CgA41CBv7XpQZeLjDAsrYX8yjGY7Fe
08KcNg9RhHyZZkC1oRlluArS58I8wAoU/dG6aOw86bsBh226uLI0F3heU9cJn4lxbiVRQomyvvc3
05jvuEzEwejSQJBZgsrmdr7MV4iDsrQjFVW6AjXNcX6y8zsLfLkn41u2Dm67lgbmDwDBTqjrTJZv
222BibpxfYyJR55amuqbY0j+pRWytrdiQKWGTsgoiOpscW+H8FBK/19ON/gXcA6WlVqhQMR9NRG6
w6Ab9GHEOZnSaPEhporNQ5IbMRZmBWc40oDHeC5Zm0YS11WCNoll8yaXRsHc12YIAYeu0HbyIlxj
e/MuaiEcTeCfyyrCdy3JYJRMPQvHa+pHRN71EyOdDPN49yDTJXBM4PkZ7hQz31qzvn6j13EWkODG
QURD7k0SxpWNHVWI8MIoaG5FZmAbZjEd5uj0l1nWm3hGw2UxVDEVXCplID3odmi/Imbxs41LkNAL
tcZMN2pLwhHcjh7y/heAytpVMGbpMeIffGfir7OnRNwNmaw5yEkWDdhGHYlEFLHTg5Jrwvonm5GF
t/kgx+ztzQnkSPWQELHrfJh6Q2gzLAlaUDf1iPEMpd5FpRMuxj9yEAsHo7ovbXwzE6XeJSHLg41W
riuSgF/AcnzfLFYcRLgLID7SYOeYcqF4e829ABz7YPSGqIQnw2lgzh3evKZW2Pfe2jjsqeaIxMq4
/5BXw6ri8RiTfpvxAZKlbKvAWWUQdlqlDKQ1PzHJbzo5puKOuHnxGhqjVN+GkrH97Dv/cJ2bbnKq
vZAqMCGkORJYQ6MgSilX4L6wn2Af25bQXx8s5Fys8IEM7aHfC8XcfmtzVnMiKGUIAqc85WM87eIN
5gjh6sz+y6XjMvW3aAARGUxQ1rvmuQo+1YPV9+XjWkSn8x5+9x7Zw4nVNSlVo0ZUa9O87YMKtwqC
Wyx2axaqE48ow5FPI5Ynfmkepo1bAGyGgJslgwlU0HCsPmmpJZow7eWmrEn+pVlaNrVTyIzAa+1D
JJ1WuCBWGQZSNjJiHcjxg9Z3pf6Nmf6MjdmAGS6tr2BAbmzMQ/qEBDycQFDK7AoOWeVUfv4kMZhq
7NF/KnRgZNRW3w9G9Is8dEpqNUDjDlHhjMDDroFLr8UIRSzHgxeEilQI4w0OSuf+zlIIwB17E9Cf
mEPK47tnAlH11UsJm+pzaHGRVVyn//G+nGjzrh7Q+8M9XRjyO4ncln2ldztXX6gBpXM75w2s/aUa
pTaUbgzio9fWR6lbAU2s76p9zYDJc1hsT5HoQuF1W6J8Jp7+A1g80Sj6nvcDhhr4P2cRPMZnTOyK
uIZvaD4EZMdOKRoRyXGykiS0VWIUbYf1dUUx48cR1NT3ZJcU5CIo8X6rLVi1EZfaERg4DCaYTF1Y
5EzAE5p+jhYxPog8iw3WTCdto5evqYvRijO4UsbZSrtnD8iaS3gfbGRI6muoU7v0tYo71KVNe85v
/peXdapZJB16fG4yKjm+bsgOZbQde1oyyOTy6AxnuG8z/qBsUp+zlGUBOprgs2nDjllbJqI0NLwn
ZbWUcI/tLgrcnqfFTHP3SBdT9rBE81XHlP1UnB9nUZhyTx42SZZDHswn0hjnunc/pa6i8ikX0cLH
A8xr73spny8069nsl5UOikGekMEZOA7S/g3cup299QXllMDzLmakG2b8k8ByfYGHd2BT94O+oELW
VYaZXhVetkRvL+jasWT4hMaW/rVR/0CXneUpRA07hcsyp2WwqT5on96TMaaw11gxLw1GUf5HxuHM
mGSlTHk8Yg5oIGYkXDTRRz27sxZ6Vk9oClNeWZ7syjFqrghb/m9tj00QVjXXW/bVn5zWmXjTYUjY
DRgiVfeKjrehsj50CLgrmk5BZtmUPXbczE/wIAhoNeCNltrbRc8YXGI1TbjVe3V8O8ZE0yxVY8KL
LlK5YWQ9E20/RkvJUG0ipQ+j7O/xDrelA4r1G27Wr4Nu/dFBU3TL6mSZ8mLKyblWUD9ws55XVMAz
ggRGL4VwTJdTwFohF9kVwcZXKl6LrMhf+DjzPG5chSyHBoSkdlu5iK4km8VZhTwmZy0+sfQJOE7Z
ZuwPtBTi33LYG/wxxw/kCNyix+KTBvEyniApWXBeXO1e4eH761zGWaHd8Ma8sr1GzKM8VddBlPxo
HJvd3y0h6KE9J6FlYyhDq9LVPf3ZoI30fcALRqzMvdCuzAF+Tz+LS4QOebJ8RfzkBOe390p3lpCX
xRlO3sbKIK4X6lN2VcXCu4EHtCj68D6N8444WCnXTKnzgua/s4ObE5YyemTfWQLDkzc3mea2KoTS
mH4Q+//gbD0uO75KtAPk6tQgjvlZIm5kHiVobOEk4/cynSmKQN7Hgc2+MZMJ5j8bxt7kH2DZ/2pZ
MAALJdrAAp/7qHyYvSq3CX4YG2zRS6eqiGWLlCEbRHjnymRnE/Td26eFGFHmVfSd+bP4qLUQ9MxG
L19VqE20byS79WlC4WbRs3OD3UNAADVd+8bBAU5hFuiAFNSLXw9osipAcGzj7DdsErvwCHCPQILv
XhXr9YANDcvV8IvDpGkK4biquNwzULjmq8Kz2GezNk9CKOHUr53PozrEIkEZUdZVF2JFnx2RAmzG
ZB5pzJ+8NNolXybMEG2y+w9CfvAKWU5n0i2oFZ+IgqvFKwOjtJtnV73Qc04BW5qZBnmrkXXXS9zw
9SOx9Dmw1NPLOJoHslILYq7qIGlg/MBR5x6Cmx4FnZUlXb0SX5nojmiRlH6ESed5sETvse6yAgEo
T9Ji8hNX96mzNd2rS6wk937n1znd1dzqx5OvV/q6jt1y1klZgOHSf7O9c4+ZoiR8uNzzhSWPLfBV
pSeiw+GsSuqXxXXqr29JXDm06BWF5AN3CmW5QsUszR9tpjDRm0pqkpLY8QCXiEMjjQncf6VkS16v
wsBRj+ESdvMVnsUyuVtCOZynwTjGzptEpEwFMdcTf9Q+gJfmJsIKaIQNiaJgMi1udaetJFP9hQ/u
3o8IND3CWjBMnxou3k/wMspjfvLG4YhdY4CmxSgzVnck16qXQww4Qk0WvhUWMuNqRZ0UWsphRdcc
t7XUeAYvGRKO/d8TsTTh3F3dTK9m/+2jOk0r6PcaN1FJ9jZ9iBNpJgylbD3tgdiGtLQukbJTGj8s
afSW2jRazjt58b8l75j0JX52Yme1i+glGR08owduSpop9emvTAwsTnKBmwC3ra7NgRjt0V9hNxvv
Pv3Zr4PNhrWd3z0ONyXwuszPjQVnqLpvKMMYRzwfXog7RFWEYDRF7UVIi2y0u+txIHHp45Ocr7Vc
8Ane+Ec/Eg2zkEMt7vkJV7VzlYGDJAcnrvyEokMh8yzAbq6bw0LSsGFlVX24OB26vvJCyZ0enPq6
LFjN50JGSuozG/dewG/vpuz8c+CYUSzGGeR5WUBWdJlC1nVQpOcyXq7hIVQCGq1AVFFzIT1gD8y4
mpJV4Az2taCTLRII0BEumvgLg0rrdn5gsVMLsss3IKc5n6N9TZywpdI1AeM/JUBFusF0dTM9oJ4e
e5vWzQGgzkg2l5BxsnXtYjt5t7BkXiokX/3LkPbRiF7IFEVqm37ea7nz2eMXjsVywDo7QHJL3Q84
SxGe7IXCvvIlnSmRV1aTqbXs9zpgJTmPhpPeeV4rqUbHSRtoJmG+q8gKLuZl9jIKJ6BBKcxioW9a
MtYM0zo103VeGrLm7GWryR7l6j141osiphOp5lefYE8bbxYsuELabDYPq4u/4d1gPWl781hngrUZ
ZjrXitlBHFCVntubNb04i+2gsjLuiMgIWCwLeHtvQGjgDhf65aNPbIT8/7C4PZOO9JvTf3+sixF/
zikaFXQoseaKvtWee+89xAj4M1S4KtQRI0ftQYDKLiViJVB6DAPZ3+459XgsfWWSufXAo5fUVbx2
irrUbbA7RONV+YfframLMTCwqjhcFwEMs/TDBlSh4nEwcBAu6hsJ+/PliLn35t2AIUAcqqEntuA+
Akqm1AaGnsvCgvJq+oc/sBEdsXnXXf+r8WSGNZluZWCA/bJ2nE+tl1lCBX+DU+WuKdH7kZ5Ow5T9
SrlQiKlGKzmvYiuyn8mSYPrV+1Yp9jICOnpDDdmtlPb3bkb6Thl0x1tQzUmUt8SCgpwDyrEbnkKg
zIx3zpi8k7jKQQiBhJY3k2PLRhZ7l0bzO7JcNgZjXbL9YoMRnTHk3IWYRcROwFD/8NeoZrsw30xk
VUhhtsVkBF2L37to4HTycX+FdOU158jWzI/8I63EzgSdHW1HWHZFLZoS0Fmc5YFW2anGxcp3Bot6
40v6O+o4m70Oi/QxpcJyZk6qJWM4v4zQ7J6tumP7poDMUgFUN12skuCUa5JHqSbB+RyZdwhwnoe5
JCRM7yEYztG6GQOrpgvX5RURhoSgB6m0tXy4dby60mN7ReyUwE2CGU+G+0VuS1pKT9JEVwobydAo
RR9XAwtcqoFwSyb6XZVYNyoJ2w10o74fQD7mDFzg6ftk6vZk7ltVHBBjxH+nOJq1kzBEGMsxp/bE
A3XOjNtyl9fbWMSy0gwD97kVfKwwWFkoerOaT+2gCxWd/VZmycqxptJlT3XDsisZBafv3F08F28+
4nNmXUE4pNmqT5YDrGpbAKVlMNwSa7idgZcpFRctRBLN0DskUEkWlEUhPd4geld0gYQcI0T5v6BF
hFcEXDPRF/4LI6q9lAH2TYkkhFnWHaB+oFDnqxyfC7Z06ZfksBMN7HFtLNj08XF/B9iHE8QYpc8s
u/QY4wPpUedUlV6CWLEASSuUCEhXpuG5jOH3qd7PilDKcAd+bBSxLSavvEpxcjqlDyjQP6C2W3ur
vEDLNklNzfzG9iCaBKNiFVI6RcOq7yh4pB3ja+Kr0FZqQM4UL48B9AjlcoP4vA/qpSdyKDH6H05F
nXlf7q2ZP8mLzgtXgWzGfCCq/ptkUEM6koM0F66su6RtVd+Z9CXucf4Ic3pEdUwM5mKnBjLDZ/xh
aew+JYX1WFWjMRYRR7YhXXgmVKqAMyXtEG83r+tzPT1O31xkhf7cDynNBZ38gUchEOA/rrGlEZeR
LhFyayAV1QT86ud5qREgV9bW2V2CPeb/pYj3SsrnUig1bS1CB6FuuJaPzIBPYijsK/m9VfeivXxK
MBbcEO/CDhy51hezBzGChJOJouxwoV34Xg26w8Hq9X3RXC0GhJUWkFTLUtfAKp1vnsFQJ80GTeHq
tLToog7MPO5p3+YI7qk9DF5FClgrX65tKmYrX9LFinnOx8ARoiBD2fJapXdqKaxqumLRLWvzfA9k
Yahvm5kLobyNyU9SfoUsCO6R/RooofBVo+RThKwoJuHOY005tnoDKnZdecMnmHoknp5/oAa9rBVR
isyU/dP+hlZGml5Vuc0tCmWU93xXkaix8bqNKEXuSM60YmFrSRHwX9jc5xJ++x8bqkoK9btr7Wkt
aFwoolbqRPgl8ERqQFZRdUm5Jj7zrPZayKKIH0pxeiwePRWqjNP/Co8jQ00E2OJvR7x6Pvdfk7eJ
jlioJ/JR39bILBc0W7vytNyb4tusNsqFccBX3P9CxTL6vy05RkGrLctvz3UNBPoVpEeUaLKQrUPL
jG4zMF8CQOB9lVEa/b9L27etG0l3sF/A41RLnKZ00mvnvjg9ZRWPIiBZ30N5yLxCY8D+NKXfBNg7
i3pFwprJ0WKDLSYhcxa/EpV5imAiwkvxyfd9nLhtbDNlQUoa27SkvtgjnbUOANmzkq3aVAaeP4Qq
vnT82MdeLZzL4xb9D4uypNNYxbrCT3a4dSbE3NcUceNTsleLma8BLTcKQIOllmkgriwNVPmN9LdX
F/AZe7/MmPuQRtq0W0NOybjEnTBoxASScB9b+an4uxC7jtSNNorIXzPleqcqJDcAIEbbv9YdZNvd
AwGtuP1ms70ckqNpiDxQ4OvgC8BICkMWcc2SRD31WCuSSZHiUBR7GJv4ddyDh7Qcug1VAtLCGCuW
VktMZ0PaCyG/xscJKMASB3Kxr1u9hyypuknfb0Ie94eP0jlcicn/k4mlSbfMa86kYDo5Gd6lYp9P
iayGfE82GKhX9xC1Mq9QFwvEzwhID5cawiqpmMCDsjI1hGw4weL4XOriYfC0PG4CciN10MCpGoAW
4yJ0sbqPeb4UzuEGqW9anqbchqCChrswmRzUffugQZKg70gkHmv+MglsXxgdAdI5Jf3r33KACc7Q
TRpiOhmfDT5FlH/H9Tg3/fOnOt4PYLMYEcl4ac9ZjAhalPPQJDX72/f2Y0Uh9fMBfJuyDNI9j8da
JrqatGQDNzqZRbpsQD7nLqwUwEnDt1PyEIP916Dn3qx5MDWXMs0e3h9NbYr0PEG+2b+qcGcbOY55
7hvBaeMvf89NbbARVwYru1O7K/GUAQlQybNCuHP3t1JBfNx1x4UmOpGx56bueR4fQXiikUrA51ou
Kj8MvM5AyZJCHInJaVcdQEp7mAllW93UN4M21slhGieL5KM97oNI2lrKrb4mcncDkIaF3Fx3382z
+fYKBpdtHghomkNgGu1xazE1CV8IAb5HZhYWIUHmGW+nrme01910Fb3Ilj4blZn0etZsFc6SbzWp
2EPdQRVpisPdCZXR418oJzzhRzG5tVXXg/ySZ0Hwh3fztYcEsv4L8YydFKkvVEiT/a1uaRJd7gs6
YzdUz7AlxUeJT5qS4c178MALjkVNsr2yuEEz26TpxpCVOfjYFxJ98/uALtURHLLKNUCBXq1EeE4N
GWh5UE76fXdiOIA+R6/YHGnVNvPL179SManWffmHcNEIY81J/DcwcvAwMSzLIl3rHUDu+T0MCkmm
6tSqnvpRE+gsF3qPdN8EDrdB0qR3/EO8bPNp/fNYvFvX2olsqy9HGgDf13/c8K0yeVUE5vT3qxvL
GhGrrc41WMn7QQEluWptbJHMM6Zk3dk4zw2yiwvXxLYOUzfBThiDsnD6YY+q1HmHCdDhSoV5MoAA
A0QcsFChokCQPHMZH2hPsFMBaj1owdQWzaREzjJ4opdquEY8FUmpRLhhQkwQZzspz2inkTXbdwNS
JBOcU2lNvr7wQyayUKxGZjyFBSH5LIMyVb4I4RESZQhXCdSDtCpk2pp4JD5N1jN15CC0NkGNkq+X
dFj8UNSBEAOzFy39pHvLiX3yZYfensXO+WZyglSK+82gOU6LMpcUWJ6n5kshx2W8kV/unUN52Vgq
G53NXXonZ1slv7pu42J73sesl1V5DVK6F0qqt36ZuLPSvVVpyCBGviY0vFyO0Am2oZi0YpDWXuGe
F6X9We5PDxnQYnoQbGb6EY6ekaCvR3Txj485RJ1QF14K+NicyIqUGBJDDi3EIbKsoqP9eViV+nu+
PcE5Av0vnNYi824PdlNEYRkeFkxAs1thTpCnEV/XGwAxA6uESx8ij+UAYLiUO84KeyU9JL8eSuwj
Aefubk8oruIYl6PGxm8E9HjNOOLSCBGQuXC9BZjtlSlPs7NkTJDuvj9UJJbZXCXl2zqytJyBhPUU
R6ZqjsO2/oXrv4Lm28yCotOZboR1jjKO6EAGL7miGxkiSjkoLAFq1UnucUdPR6/c6SWtbgyVb4j9
+nGjRn6zn00I/bq+OSd5Fzx3i2WZ2cXRIY20AspgwMr47PbdQKUK59QsIGTKAc1DqzW5CekGsX8D
nT6bhz8vnrsMJfVmLtDsxgXKV87Qs21B2Ss7eW8V5iAKlYcjpnqYNRFFRBMAnHlpDCT6gLXoTeUR
QFB1vjiNu9UmRXMEmOLPL1D7ZbVvfhaU9scRi/m2EFNdWcvh6IGlUJZOnjLHehtxkZDNvMPQj6DY
mMAHyo7waDXFapWLNzT/kfahLkwcVq14y4rJ9lcV+y0jI/8N4RrplcdNoKyhqp1EFa0DAHIgpd6J
rHM34riej2ho6EDJqyIEOmR+hEWeLxnjcv64b51TyzYMSaYsYiIOt7Nw6/p+jurMRuGh0vhXuIof
HZhKc3yTkgMjJagVtEUT3aBgut4fe0YLMY1USED4UOeAXumy+6TW7/VI6wGyGpKFDrYj1TIDSYl3
P22G2a2YPeJgTeUV6/q+3Kh1VrXVBXutmb+njxlbfrt7IiCLsQeOxFBpCHixj+cBoCyaGH45f6bX
vHp1IIbIFs8PyE4nnjpZhcU61JdMN5fI3vsHE89NVvMeOT3v2/sELOFZZ2SDF+pSc0ljAKGtSsOf
Rf7OcCdB3fZ2HXQiIxUi6xAturY09FbVyxL74QgBCOwUSzWGaJDkyP4BA33jeZHFpus+caPs/ZW2
eA6E9I4jAJHqBT02eAWlbM2kvKo6KgI0K5mkzlBGPIsXKH2OuJP+gidXYEeAE07HbWiUekjIpU1j
dF5HSF7+1OodDNR1j79srZ4diBr3chWjvzPgBSbjZBpIFzdt+vFwN7V2M3licNn+PFWpVTSbIeYX
BANCvTlRMdeRrBXzp1YsVB6QH0Gjy+2cnOhifSBgi9QjokFnnhJK8LukIkBETRlFcsDIor9cvu7+
6+o0g6Ee3gmQVBUM3r5Ke63uZKnLV6/FZCa+YLjkoOUxNhpnvLc1YeXaeW9IF2Md/Ox06JZ6s1DP
L5J/BwIIdLbzz+afwYhOgP85I6nQoArvpSzXxfP/pc7S0M/k/qjtEPg4cXo7iR1jGpSc9EZ8nck3
kwHX0ww402aJQRNmy+RRcQZiwgkF+Thmx/rDdO3qNPi165fJDJCGj24Cm1rTP1bNWCP6XyWtrcf1
XyicY/hC5LUf2MS/bL9BYiTFazQlMRfQhuTvhoucGnIdYqecha+UgjsP5tNYA/Nypp3bxlq/X/8h
NzMXyu5AbdHG2EoqgVya5M3uA3MkEviDj7b7tECE1uw9ZfxFjvtrAoWw3DPMY4R84TZQU6Q9+70l
dRyOfTS75Cdd6txyosHxR9cEpMpUAMMzBaI59KvmgchU74S99l1LmeRnBwi7aEsqLXqIybtCUS6i
7hSmceS7AcNpR2YJGQEKrtOBnUbQyg2r4oMBBNtu1BF7HdN+uBOv8NCoHqQ2wmKDiB4Ow5aB7nn1
pp7wRz9OUKFsrB3iCNhLq91cRlG5rzhUuiGPl/jrU8i+fPPs9Ug1gf3lSlLB1BGeBPeko937ZPoO
fQnUu2ZYqtRLqHL8T4AyUnxg0VojBF2GV1yuAEVc055bLffW85WlTiUI+b8xsd+e8WI7hCgo2+5e
qDO+x91+zSUSHObiPNZ9XKWTEj0WkSCYcCIYvBNZjp0UUwrTR5oQoe0Bt5T7hOup8PydWvt14YxS
5LzogkXipPqTADGRwSRQYEzXcwFMKC2GW+JXnLHOz0Z6bg/Uc1SbhPEQ28nV58m2J4Vjrn5sWjBj
LFFOW0yJlcWj1fCGUBbc+h18YSa5HyQs1tdohlbrtl5ilq9NSwWT3hyNcQyz19DLc9p7r02CkATO
aI0PLEHxj0I+IUe06hLCpSbdrr1nPwTt0wqVgum/Syv+nyATfWEK8BkeVzPAyMBDwb/Nk9iX5Zyt
7k9IuzAheKXiINsnMcr3Ejjzo0o16YNcLdfDu1k75C5FZ1oBAieJ++/lr5Xt6jEhwTdFofRX0TvG
jSyMtqQrAYy8KdYTUrxfB6t9/K9GkNRv7uXGjO660BV+LmEoEIIHtKo/z/UDO5o50qhJku50/mjd
mxCUp77Klv5MJP72xCcVmLQbJqzIHTkpicSiCC+X1mcw9yN+ndc9sdF81HY2CHQhTzujg2flDMXy
1XgDPpkxEAMvmp/qdetyQKIkd4n0QO8FkOBq/H0Bb4gKBLEg56gNFdIhGtTWvisyZpu6iOH3TA+u
zaJTetp7FsSxR+/eFck1Xmi0rSPegPO6GFbsqn14mXAPC4Q36D0ZKsIvE4WSksc64S17kCaSXoUk
oyU7BPlZs40leluRqcptCSrMH5FdiLWb9p3YH9lBs/bJmpZUrTmnsG/hPrGjrxTvesJxMpvGDMhM
vLd+K1+9wQuFUapoYcnCFc32RP+UvOsdsIE1O+uWv+im+/SaiL0D95EXR9qn3qMuhOsJ2SCX38Rr
4mGMk9f7fUQnuBreIJGRkRficueKrx7Nf1YHIZUcxG9VLdZpgDVrR0JTiFWWLf9N24rA34i1bZOF
7VnIM8Ft1Z73lK1CDjE3IHhb7fM7YCihzhiusNXgwqEUQesAqIBAbpQJ49eWndfrxs1OfKpXQI6k
FXtkyFvQQGpMxwLbAno/0BDXCv5MrVsuxR5e4DNyUBx98EtYsULP1hWvdPLL8JydDakQkn0DEoa7
aUtUAnSdw3QGJO9BbRYH1sq0SFlLO6AImLi4mnl7ohXCDmLsboquD45X099lJb73vtUobgNQ8s6D
hPWtsY5RPUzg1AWh1/RVTqWEiJbS2MKe80Ma9Hxi5J6Y4BSR5UJrRL4yb/GONkDFTw800q6EomqR
w+UXFSG/BUaXaaQpHgxeD6y8UG5FbwEKs30PY9HDTMi2hKr0ulK+NvVn0/1t65SFYI7TCYlTqjLx
hTuJz7DakZBI6hLzp7b7vDOoGiADeV5k0o4fVSNeSmr/ALrAwzOGFPe4YqrjhaPZ+xr3Iv01/ttG
MvSjdk/R514zyIYn9nutrdDyM5hcVI1Ty6GVZvuGTt3mF293KxkNufdouzFyVvS+9PDb9DuD5jzH
L3XNOSBJmZIETqhl8lE9FhAs1GIn/DT7nlq2Nvbedu19OYZIzKiIaoFCCCeCofmGMK/HonVySS2v
eWENxQfCMT4cWssuZaA2qIVWOIlqUeGwRoue4snY4QSMf5O1//qff/TBaMuVbMO2Smaqdsa3oDFx
CAtbld+loXKiaqAMsbFF7RA3YYKUnId3m9zyGy1xmHoGqE/jfL7ndfcumgI1HZAZy+qxLPykmzQY
5p/M0seJqI5/ya+vy9lmQpZ9DTBxtqhunxBwlqZDbhqJctF7VJ1KT9+vpluw5GwMC728OfvMrYyV
ZYyc8SdRYarcfLd2NvB5dE5LeXGmMyKcxfR8GrxIsEfMHga8fF/omtGVZggAKq1YOw4edgwQGSsd
WqKshWomu1wT/cXoIU/3HPfEX6ICL3AxjEDX15hoMGn8N+FDKuxTXwXMSgjzVbGjIdCFNGTtSA8a
1/UXhn02FJ4TlOZdKsPYmPV/DJtTpJKBhT+YhYgQzLY2A2cVqabB0RABdDdztyEUn0riRHBk1eiV
XiXtvLJYo5t9B/Qzs28iMmrbJtM0peUhTB5Z+i0nDQF1ZpC+ee+LbUuSvxaj926uYDxalSV/Lieq
9lvgkgcRz6zPXYK5lg0NyRdGWTGmOAuXpr0OYEQgXTeh+nmE89kNbbJjYDhqXSVFC+kG1Dv8LsZ4
x2Yvp4DrUF90UmHL287XYLnrN5GbuXSjulN0Z56iYikTalky80PhWYz3h8HX3Y1sSEjVcy/L7Rw7
yH0yXx/Esmp6zIWshZ3rNLFKGCuRNJDLlJvv200qcj0LBWEMtjk1cFmg1n+uBIUyYewllP8US/G+
W/bIAN5w+/6tISirD/40wBHpqCLlsEj5l0fSdV9K/E8X90rI/0boWeOYHx61ham4qBbFXPOzi+mP
8NjFKAQ+Vnk0iQVELDa1H44VPUMmPx2uMne4a+imzuyzaPWtGBBk/10Z+YaSlgETbIjiAhxA1PzL
oliWJDg1dbFF8WvkQWKeGTu0OHcPJB8XzK4OvU/JNYgDOaLwUEYViGd7l7janajUaOuMi+OvwdUS
LmqX9XL4viWKi2EO6BQsT4myRVUv8i0n1BL3wMxI78btRwZeEi0eZbFKzDqc+RAKuM027MCNnbRz
KZwQbjt8UAdvBPp8CgktorgZyw5vXvklsn9zumOCiTAD8VcSrNq3INXNXdMGg7t1t3RyHzMM4pG8
vW1ON3lETous3FhqmWS/G+Gsf0Ybv4LnzpurGdG/BWGyZKeOONBp4dHeQlf2Sq8MEVjfcrydo+4K
jLLSZw1JfaPOWiSNOCSUbgxpdonweU3zsWlMR2et8K0Kg/XvaaAtpxqFD9GjkmojW8CZNl1wiCgn
oP7HeeNt3HktC3TI0eI5PN1eZSww+9xE1HkcuWWH8J9PmY9Xh6rPCp0IrIbJVNs18ns4Jso/RTq3
hBS3lTmQ+nY+YtcrQngyf3cxSoVsMfZ7U0UJfcB/taO4qQON9j1a9Xt5HPd8iG9jW6Eyqoi5kLaC
UWw0pIPFp2MnFW9NJZaoSvxKGJGIrB6yLeDaNsW6qfXwocppNiqtNNBtn/qjjeBDGS5l/iaOCVZP
CrXe9Mo/Qcn9/5WD0apZbSDihsh9f0a269THq6S/berrLM2zgBupWijPUFUV1/vRFo0x+JBBfkE1
cdciGDt8EU/8dBrc6uLzVtAItISfr1CFN0/44wCtzHWew7V7PlosVJ1cfDOroDJDxetoYC9MWqdH
UPCbzp6WbR9RkU5Ev8Aw8oG1JFFp5vq35BXjf4K/7SfCRpHL1BA1K6y8UEvplCWsq+FOVQQDvvCk
IEigth5QeT6EWSCE2tiNzbiDr1tPERCqPa9UioavWcbVQEUQLoBHBzq63hAjLoj2r3bH146InrPe
oFnhrEnH4oRMULfV0nNBTa5mSnbO2+0RUoVcOqeNjarzyY3imS0MKatLltNJ34ozGdkpG1B1vJ+p
Mg8a00r7SOc7hgaaSvkZPy58D9cPY8YZepOqjpgDyNR+fF3KV6yoZ1kXn54GIXpFypF/XYED2Y9C
E47bUkR1JOwf13ouSTuJd2AW7THcJssGN8mP3UsX6sO1XuicaYr2sTN+eBWVDxLIVIcJLd44tie1
ZmoFwJr67E5o4sycXoz83Gk6vfAROVNVnr+QWGrHtv8SrnVJih9AX1XfcV1oiugo/Gaqyub8txzY
z3lVw4Pt44y3FKrn5HqsyJp/sUp5Ei/Gc90bA6pdBPkvv1KTIzreSSVGkHelat1zk6Sa75/PeV4h
CC0ba2U9C6YdssW1zWZgsGnkZMTXqSDYjAuLJq7dAKL17+HgALWZrp8qajrD7e6Ia6hnT3n5vO2W
fq+sDykOy4df1XxCm61HnqVjuFF0lblbjWePpdEEJxABawq9DZFNpi/fCmglXuoPDmadeAkajeNQ
H/qxoQ7oX7RJTKP0GzUp8rBfSLYx8jNhV2gLdmCpn4nrEQ2aFVDl2b+CLkFTbyAi+KvjJg5ts54z
B2rOZmzSJ7haTfAJnDz7pfsBLc4wb5oqH5LJwz7wwgOcGaBD93QCvj/JaczkxSxQQ6LzIOyJy7XL
Jiy6rWYly6AiSMtVv98XQzUvHh59UqZVN6NPLHF7P8NCbdBMv3l3BR94py3302rU3iCLkc8etOQA
EhGnoNnBE2ckRI/V2iAkheDTiTjJX1rqMPXIUDMeQqZZbpPh7DHpdKOsp50nYqjkTt7tS6YJvxuz
snAflw2IFo8WtFBD2kjIdyhMR0cCoHLxsw/51uWev4tkgmyg7o3xPQ59EmL79HLsqJ1TV0h9aXbP
V1+f437JfE9GRYIhNtdCuPmO4clk7oUbQZHVeNJpFCkvD7r0qr/LpEZlrdYosqvn3o8tfJ3W0FqD
/28YnlYjBGtwhtk16rc7v3MLBenX5pT08dvKwbAJ8aPg0g1zn4K9XUeL4s5a/VtRPpUdnpEFP0Fg
drdgujnR/4+T7Z+Yhh3Xhr1vfPgZK0H/YT/CMm0W+Vqb7Ch8zSJPwWbRY1KNR49zNWRGrUWamJM3
cehN5gUmwQBeKo31IZ6eovGh21yPdANfnYXs3pW4Hdm9O+efrZet9Le3jAulr2iPYo9e7qXytaA2
BhU/GMPFkrS9pZH6GMeos+G7Xe88OhZzeQSFrK9ovTlJU8tFYFVDoENo85xbZ6R2bDu37/Qzusx9
OPPRbXzLeLQHbH7z5p8SKX6rMlhROTWdJxMdxxG/gvEro6uEJ95qaAYa3Q+ar0kby4t4iISECahZ
P8z71Ja/wIE1MwXCtDbkhlUWp4Y47rb9A6OFr5iwMJ4ZnPdEBRK9VHWQZH+9nFRtnPvImWIA9xSr
htxVeOZKYaNds72aJoVvR0XY9HWF9rRyxYOIkriKfZh0esvrx08H9zEOuakXx7dQmUnSoK5z7UNy
8oFdX5FmzGjI9KoDHld0cT+qsBFrRWGiYSqQrZHhmB/J23CgIi6uabSAS1jAAWzgbQrt+UnDnwRm
K6T/caPRZllGIBi7nwBzjsBY1lQ1CkMls3xXB5sQIjvrNvMKnwJzctAkLk9J2K41HyGLVnnCqlL0
72NVmqhjvcKqws2rc9LMLIuItqNTLwVSeIIet7XLdl0+S5+PsPXbmQlGdfQWJqk6dNt+/1yRmfJ/
q0kDCIGBGIHdGNY2VjT2LzL9nOmTxl7yo90yecSvkwlmrLcdUEU+skK7j7O+Onll7w8wrs8v5bKV
pgfE+Mca73DR6wjvnmfkVty1xAoBNRIglFwdJnpKuL5dj+2xo3ZmH8orZxRc4dqaat7lrNHZctci
HyC60xL42bZwjPIrsVjqTxDL82al6nrmW9Lq+JGDCmEAO1nxBOF6u8BwZHpzF8biqR/nSBJiaJ1o
tURfnfUTvnp4c8gmba1Vke1/6im3Wr4h7yQQUNGe9PAXQ0G+ftSY5aW04BmG5UuHNZZ5PpJQ8F6p
b2unHikKkOJZhaLY+DL6iAcc9CMSjM7I9vr3jVy5LV8PAe8K894nfnVJMpJMnpA8uK2pTMNogSs+
t86bTCXmzkIX4cAGpp1AwGQ9SOlbLaaNUjBzMyEsiUEZ74G1RxCs3zJBoRVGEfGiBHfUEEcN6JWt
CJ0IbrJhO8x6XnafPzi/h2XFfJOvIRNQ0uuHUKRHxEW+ljUhPM3y/x7kI6qFfk38tRJS0id10yzk
bCrXckFDtoIBK+AdfrSD+ehkixa+ytlfwJd5bvw4ePQTlQ6sWKHajxLhyZTr53IPl05PyFTnUwHD
aBdQ0MucK11I8f0zuguDQb11dCHkTe7RZdF2lSXWDj6DhuqqUdAmqh+Mjm5uG+PDsQ/Z4KiPxRPh
TgHuBSm4fjpn2eS1fBt2ZQZJQNetShSj6b37LjOTcPFr96yXW4klUO8eSssrYXuVTCyHwVftwO0O
n1AaXzhsQ8uj7b2PwEDIkYMdnA4aqAswXIKM66WaQ/PnOqPb1uM+1UrlBUsIi1tmdpgnnOkKOJcI
VHOUvsJNivsM6QuykvVkcJ6zjm0GxFl/bxJT5KDyUKYxFFYuGgqaqn6S8klrGoC+3jtN3cxJoL3c
hnK+lOZa1DWw/Wzj2+qe9krnxAbDlCD4P1u9eMz3dMON6fgRxboZcCieiBvpDV4aadAwR0DDZzWJ
oE7/ug7ds4eAtVZmeO5otEFzNjMcxhsQFdZLqAr8BGRNVw3IQQ6BggCIumpKGi5yCwUx/1+j2ML1
vHctBTA2C9dA8jtNvo2JLEh3wk75PKWLX2q7j+36uyh1QZmMlcaH6/D2PLQ++QAIC1d7arOoQGNH
ThDxJXGJdPn6Is9S76kCE9ATumrKgQ3W/3mnO9SWM3T6SfDsNQPGkAG54b4jvgZh7wiL2swYhbxl
jFsuYoo5DBBDcVFu6+xfJbVgg85RmLNdPDdgmqNBJcACipet1nExS+pB9cSKYQJNgU440cWDx1Xy
Wez9l1+9k/9IbItQY+YeqlgTgIFTEtql+GLwQm+FbxoFlKQF1KTmxNPfG8IGdxKwbetD7HlNgDme
P5PxR95O8JsqzeeJWGPeHX2dEISZ6Be79EEDQrRZWkwoqIOpZ9ic6bRFRchoEKRJ4GTGUPjfQAiI
M+1U7P5tnil/Bue8k3w4PxuEs9nh2PXMPaOOjSPDYrk/VGLMYM69nhs4s4fm01R4+LYtrt8hdlO0
nC3cJ3iXdGEaT+VLR9ynZ4x35VvZZA2RVXGwXZ0oYhKyXV/7MI1yVwhqsR2OA8kucG36CxuE6PbE
jMp50FC3q4NzWUpHgewKAtQVcWWE0qmYWvOnhJcM08vD8PsH9SqZCm0BGHM9PCzjqrOf5QGNcEPw
2tTl9GAyfFCpYfdMkkcilkJ1/xYEEfTYVaJFMwJ3O+6AzadRhCar4ZKFfMdJLOkg/TdaSIXOYzY5
WVyTR8B9+s+mn7UUBpi4+Oix2nxLvWrskEp4u+pp7NTBNzgg28LatDkFS831yacQXxhRtaRjnE+8
yhelpgJdZgAdy4dORxcrdG38tsdBOEJxQJiXvvMVRJ+RRLrtuLupBTRGZMOeRayZev6Zd15T6g4C
YKXF8zIwK1dvPDNFS4iWtn3+PFGgkwTK/Z/02ZwuCqbYmg41zvErQMb+l62zXSUrvyoqzcgv3EKO
t3d9xuHGohSZwX6TmYyGkKCrMYjcmjoifraL4Ir9Xm8d4RChpsFZwwKdpP7i12iaSLfc8RRUH69x
IOykQ67J060RM0WMadWypZhuQwwY+YvN+4lLdsqt8Tq9J0Gt18urNqmzye/cz5kuvHsQMYaDBpFK
whVgEEhg+UjMDfPPYlofZTpb2J5To7dHK8XUEfQJ7R5IMuntXQTzZuQ/oi6HoYTILh02V0NXO7qO
m70dU1WeoMRSP6oCNnZwDTpr1g+btlqiSaSIC/sJhSQAFQMeTwPKzb7J1u2C9rWAxduTOAmPie3z
b+00USalxH/rq2DZP9yAsiO4kH3dv6hFJCmRqgaZwBfFEhpGbri7TNy3c4c/b8ECsguya55wkKT1
qajQHpRvPyHWKaNil7C9MaC9fL/RoL1GJJWRa2qQR0MP0G0jXdRDoBXCf4i4WUVfYWqelVsUvkct
0VAM3sKAHRH01aK0xtjxvy8aXRlY6h6+u7OUo9EcapZKcz4ytQ6ywnE1vHeLUnAmEXHywh2aLAKW
UHex/MnfzIMjz2G3RqmjAZW+0ZEBKIYGLFUWOmX/qmJhGfxa5v6TkSUi5PeY31cqrfH8PHuimVLp
8/b0l705F+/FdB3VjgiaWxY9doi+5zu9kRKxBoty5MNL2hE6YTRfeUSAt4g3Iv/hkFti1MjdGT48
ZLw/n35WRH1nNRtY7C07Pa3V1m2w05fTjwMil5GIThbUeEHEasPOeF4+Gm6SpT5OLRHCCyGjDfPI
ZzXkIZMWDYgcLZ9Lc9OjiMWUMAoFq7RZh3ZoZvux+seh2Eb77QRLkpwEhSm0a3jVux8fGDW924Kt
OB43N0B5Uv6D9zx6IbtCmxnuA/DYtI/SlveQt9HkgTK5dbmh5vdANJlDhCY3w7Hr7iiwVRpZQ2KR
mLYH9M7/1HEmoyXvQzeYle6uvwJCvetZr6U5ZzFlkWQv3IoEOnX44tfOOnk/9MgoYBiRk7lKu+z3
Blqzer9vTywOZDmHvk193HCpgHaVV8+/LaM5dCe8rnVwL/gIBA/BEY5+dcIGwj2SY1T6lNoR7uqW
6QM5AVFMz/HQmfWM8KRl4LZ5a+l0j6zkLx7plOZnY/YR6PVlID/AnjUl03i8ojPuJSykZgjBtCAq
Az1Mq9AiD3rAPAH43iIqsD08IOhxufZ1fdgRifte3XcQtfBXWTPNZj5PYb8EHc4x94AvqkRS366L
FPle6Ch3OdY1DW+wTMMdH0LSmQo8m0GaQ5ngFAAodYetsEnQfBJXj1P5N6C+w7Ev0OCG1UUBc/lb
UUrxGJ7NDOgsEvSOpWsNqc0SC8Va3aA2QOJzp1PkjBAnHcv69SY16ogU6+ech6g9hdPjQR9NQWIk
zcSXFm6HVj21RN6KqI+hvABXHPgSVnbHy3SYuoLV+W+rXMxn+bW658p8HkiMdaJOzZslXnp6cUvy
W1nivCvt35QhHSzKR5rzyqMpMNigmfcVdDZc39YnejPdcvYlXpScUViveh9G0X5V/3/4EWjqoby4
lgZ5tNUjsRJlPs8utjPlixWK31iT7hnNSP9vBn+OCDBiFP+W5gVDS7dO5Nt2FuO0l2VbWqg+8ioW
cSnVKtWboNNxQRt+nsXZk2Ecj0yB0sSwuHq86Iyi4PeeJ0Wr+V2hLppAeTEmirMUut/8UPBVGEjz
WWOgyk4Lf2LA3jV1a+nmqQNV7lTEkwLzWDl5PHADMdmIGL0lCnlh3BWCPuyVtTOJPR6U3hwneHZn
vN85HWcvfdJNfhvcAZLKATM+DiJPDltiszHWhNDHPxxEnowuNIV/7OQyATdQqK0jtfLelNCGxNrK
Zt/eRGoJ6DUISk91zz9sjwGljc4qjhYRWUBK8ALJHoKh/mOOLtaRjwtEJk4BnwhfHzPV/3WJAYtn
k6fgNT4HddPf4Qj5labOyykenAECf2FshqAEUdDAa2/yiTXFojle4TNEbIcgzX9YYYa5y27Me9Rf
jNjS2E1A53O0CajA38DbomotJPNFqozY5anxIVVKTyEzcY7mjSferkPDa0Gm5Sr29txnU0/jYhz2
wuYGK22gRNQUBvkYIy8LOK0ZnYI2PGGg6s/JEbH/VHDHMio90XpJeNZVJ9p5WSDKHZw/LlbICjTO
P54ZG9I30QIxFV5VUIGN5XBSHQbgFEUP3D+9xSwJ+0rwF4QbIHUa1Jzm4fQy53IxMzQQl5ohq9AU
tbKWA8H5eBueghi1r2FcwwYN+XkdOWHe/ujkPdtWqc241qniPQ5UXPNG6w4tHyZfS9zIMbLfgHtZ
GpBuE0CLx3x9hkJx6RHX8th6yhJg8Aw73sENuT15j0ka0SC0zwZXOUnzsfmt7BmDYM0DYk62yl/u
K/ikChSwghMfUQsQj5Z+FSzlIVaX2RchdiUQ1Kc9/guA8377GAX+FGaeoXkDUiWGJgm3cKAECO+z
o+cejJlkAUxrP7wAlB6VQbwxyqRxLJuKuvadMZ9EiplJud2yG8z0w7GeROJ3WinY3mNdMM83nN09
I3e7L3W3eSgRohqp2qmNV2WcE+wOmhMdZx9SxMqZpfPi9lgVIt5Qa0MJkTh9R9R38WPUJuKIrjgi
obIggoveT6sJ1befWtqLdhc+H3ZU/6pb+/NiOqsVEyzKw7RECYmBhKfHbUAUOEHWRrXT+MmMMeAp
RTPtbrrGHvkp5AfaCFqCk/yBknuvmlJicWW+JwGzpjsH2CifMutdVqHGnX7LPUcmH7rs/oi2LLBc
9P3D6xvldYrBe+M3+Asf8Kdssgzq64csXzzjb4xbj/yK07fc6EOo4UJ4/gJTIphbiyr48bKztrf8
z0ib3wLKuTwLVJhtmsuAaSVjpMmH0CnrOl2gcB0yYbPB/RGRU1YQpG+qRFAIGxCsSQThPTTTPu9x
3J2Ic0sFxy5HpdgryggbebrTyouE4ROWQD0y4O1oNlG/cdeJgm6+kwjpwgGbpdH8AWDGEhiaM/pZ
YviONwFWo9CsvFImqVfxiy7O5lQN1UjmDc+6kfMs5JDq3Tjy9T7tOfCqyGYVSt4wPcxE9rm59V/i
zjvPRs5CaMjynSxhqtccXzZdoB5uqv6a38jurdr8eVFdPNHPoETyWRYiXOWq7g9qMZj0OHN0dj+1
wJ3uw5lHF+38/Q2Mf0q2AQP3cj/e2ILUIKNn7stWZr+YQSTf+rnahSZor3T+llZmF0EdA5ZkxCFC
rE+7HV6++uwFXWEZRa6qLQctU/f93YEN0B80Owwl9I2+4I7D7jz67ccMe8GTHSilWSGIwMVoDPyY
viNFcaj4N/QP8snoypUlqERsNp2oV1V2LRfOja+m+BR3hhAGAaauwAisIQ5qZznUI6OlPFK+s2HT
e+0XF/3XhgS6GlOPxX7ojo1YkeVEr7aYufNAPSlek6oCiZ2dEDHouE0mvWcfr8qiaMAkTkAUGRMv
AYuoLUeVC9jPIKlv31hsfQGm6kOSC/cRtrVqDnezBpNlOFsIdlmafAuPvP+0vPy/kU9h5rB5G2yT
6OzuMU1Ukrhm6E6F2ebdT7cVUB/Eiy8sdBeYsXPTqIYqvA7V40fuzTwWk+fhOpDVxvAJI/J4rffe
VqgoRlDOGEJYcT34SpL+D0pEJwhBIOUV0ZSUphaFsxbpUQRcuyTHqddxDJDTWTPccO/kWK7CvHuw
xOgPFIQHSLUHOuWIbvd/39/tzauseO0GFAKMvKTgybJb6lCuGy2A1ZAd1Gzg1tlO7Z2m8/wrBNE7
WkZEfoLbvUZbFo26a2KOFyk+9zBh6mmgSGymLVzpqh1Le2gqz/yblib7pWz2HNcoA/28Va8nQhFi
KU4NlFsA3SoOU9IJZTVD5x8v/Cmnn9XHllEN1XbNEUdud//ibsvfLX+v2sGK4lhces4MaV412Ol3
OSDrPRyLTkO4PtSBLZxUyVd6SJWIn+1WOFq/jY9c36gDSwFYEsnvs1xPTuRFWeCE3IyBjMzu7jtc
7GmIAnm+7yFmOqJ4z7tp+Ui2X9DuL/WH2G+mRY4Sdg26LVsvz/vaOmcObAPck23Si0c73CVqKkrw
Nz1xdautHdICkpYe1g0gDTP9n3lSWRPqx00do5fZdh/lgTaojTUikOnKOG8lM+zuG5gX8EAV3tfM
vZMlvOvxX5yYTbPKLwusi/tvqnyuehH+HeFpIVKdip3moYAPlk5Fde4wK0NLIfWui2EetLgZ1gGV
82a7oqYDRm7bnlacNofJZQKbKRPIT1CSH4U1DZd+hK4F2HzB7fCCi61EnFPAy7j/zvQXGIvSPCTX
D9Lu592nnAPwZ6znGUi+OGtjBU2O74wytUS7A8VFvnSxSzVeF5zP3LVEU857CX0sJeNiffu++WKY
v9cWMUIyqyCwQDJqi7HW+HDWEFzofRySAduCquwo/0nMbBmdHvi8Ag/YSRWkgOBgJb53Gmay43TG
e8aHKiJYD9uHEbyvl/ECVKK2GMe4wb7wjuBFIio6blI72HUCsvIRpH5O1dYI/kViyzhYBLmEoqZ8
q+P7XgunQIqpJUpOm2ZLLOg6SATe3NRt4NmccEcK3MeTFJ5bhxOJpCVkt4iWB5DSRjBefZ5qQ2bF
r5LxHBT3QBEERGRhfHLyUpx+ButTCexe3/J1z6mcmdRnWo87FlIj4xugsu2Kg/yN88nhgfg3Y0iw
74gb//wEEaMYbkmFOpJSn9qI+3/e1yAuXVTJzM9oXiENosXsi36mPRbgRhJNKu6m1rfiRkkJ1eUh
Q2c75vSL5pGZnWGCTxzIePsGEAByHsf2hJy6eRkkM5uJBDxl/YHKOWAdOeUSaeaqytOz+K75IKOu
LlsxfYVeK7Cv9Zgr+toGvhEMri+IRRjVJ/wAgzU2BdV9Y3BfxGn702veboC60/Op3nlKK5r9Cmjv
x3lYxYlM98uxOv3RYDhCperwPDKowmWGY+PTgllz2vdBuksxbdBuonWpE7lbTyOByUNGUFsRCger
n5Edty3SGaCQ29O1dTVg6lQ9MJZJ3j5XqbDAS19TrqWEl1jfUMt2Vzb6kXtXxtzdgpZG6fyo4iLr
LErL40ZllMBK71h0PaWj9hkiMl0dlst2d0vBxFiU6rG2Xr+52gitsxJ6QISlt5UVDMSVtfnVx3fc
nYbIbJICfUUvdWvHpfmUmFfCp8mTPLil9iWsz2B0MilEZVu9dA+u2dV1oF8zUhgdsfkJfOTkUR9f
UIE1oqSZMdSiX0/eaA7SPPhx47xqPwGEoQZaa1ysW7n9WZCTCbQhyZIcZtxQLmv2fcXgjaXLz5VM
D4uvKiA5upZzYdIgq3eH9dv6m/TEZAGMNJUra+IJ20jzsP4V+v5JHqe+pP5fo9bEuOnq8xg3NCnW
x3KhsNCMPNG0fdPujKkoePGS4Elh/tZ1D0mA8PibM0ncfgPhEQNMbCWEv9n3dO+q1RulR0pbH+qH
Wc5HM15Q6qaf8gQVgES7NsGJ6GKpBFLMhVg9yCsVvIJE7r7u+5OmYQrk+tSKD280qsQ5QEqPKtIw
rcFRXs1WHhS/vquxl6yTR8jc+wfCmn7QEDobzRdMwiIvdfWLpvJ9ouSzynnxG8Adq9I49co46lYo
17qywnt2Bp1FxJZdFKcn1BGnZWhS/wpXt+8c3yIX8hUoiWWv5+s+0XsH19X+zVmAXGD+RyukHL7d
ayXFiDUyXN02eyeIo7kw5tYomSvm5wucdzCVa3qz16IXyBLgsr99raryOlPzZ8NAKZz6Nhu9IKUO
AKVwVLAbDIkayV9TmfSPscgSmhuGshdDqsrCjUJ2VWY9saq7Esrwd1V7OagI9ovJ0gcANaoH5uAg
ifrNWZrHPjKdCNLjcrGrKnIQIRS7KVc2ONdKVZmDJVIFtK0KI+s8RroE5fFSNP4Oy7xukX1/B82/
ofu7HriQT+iB+auf6SSUkC7la3X2OcINzawrgGkX4VK2pR9mMBitXfm0z1ZzihQ+FyV51+dSk7XO
GvyJRyIk3XRpISaVD4QWn2PmcZFquqmNccYcbDjWBsysKY1TiIj0DbVPM584be4oyvSalRLHkBrU
HLDje5ysPul6aGQZwK54WrzdwCA6kZnlRMDnAZvu95o56Ssa1c+hq4ZNaMnXDPZtZj6h1hws9xoA
FNhdpRIHTxPrrwEU6qpen+ThYHmMVXZ6cXnAMdCZytSFlUZnmDu9gzBhFosFYyH8ND4Jih8vTRXy
rOcHYhQzxOjDZ+MFqX5A1vC3VYnwsLwnKZy7sDpsFLe46mUEd51mnsJIOPmwUEHoF64jj0s7z937
7dFRCVk5J8he0zXJo/XVnAjtfxwHClbXqrNf9gtM8v3ABa2OtPd+fvb1Q8nkb4pjmoPRQk3HPpPx
p7gCrBb5l/5ShoV4VlWrRgzUlsOjaR65yN3lwzRKxoZkscW58GmVWMaHp7O6gk5MLMZfo0Wf0Ilt
c61L/qPfxNjzQJTQ11bGjoq67h7D85C/qQGXiTjjaVQJIHpfeOQnXyNwkcnnVl0VFudI38/Ew4s3
HyiLrqaQ6gqm0H/0VLKPMfjproMA1fA0B6CoBBzjrKmy2hgFDuMq+nNpMYPhLAvD5ITE+Jt4LDSA
XQSCcxc4i2+inI5WT4jfaipUvM7dZhy5HG8Su02ISTLDHSihsZAr+0movKaxMYuKAWFJFKULHHLX
derHzyK6/zG/TW2FEO8HvREfbycX3uV6c+xK1JRO9tPSz05BfPaNrAPjIqk8WLgdhl+OEJsMWhGE
IMrYzVB4d45OiB6h2NptKwaJv8mUVE+7dDJtffa/0Wm3feYS53Clhj42yKRnorj9jhWjOVJICAMm
8ijYjmLW9DPwsdVEMhg0rIN5zFs96QO/yUMsLkEVhvBzn+Zs/VDY8hHLDeLbzwtLJmUaHoqw2vr1
y/I1YHTHECMo/romqtaw2Yvw+L3Kc0D4Mfff2kDZDd2jJJZ0HUD+r3Y2L4B+iewFtjnOPFum7NHn
cTJ1h1B3F9gHB+hGxatLkpcWU0bJLwFdqsPSVrynEVkOAmw28JMlwkMO1njYmL93OB9jG2xr3uiL
fmAUgM89p5AATtnO7cBxmbMmFmRoSdgsjKQWKBp3MAi3N3a3Y8j5VfQqm/5V1iNPRmhkFL3eAMYY
XLBLx7wH5H1gbi9RhuwdF3gPzdb69zx6WU5wkSEGmdtLS3CKqYQrNhjlWrNpGy0JTwNGHwZluVni
7JzHipzaM2mdavu8Jf4/PKs08JOJVDXypLc0F8KCI26ItqteCdIk+hz/NyiaoE34JcB3GhEaJCl9
hDUKiQsnA+F+hPyN7ySmBBfsnd7IEeZcSbPfBJ4rJzUrMVjCQhDgsJ+5RCY5S/eBx3UeVb6QSqLz
7GyStmrw/rSJWfEBUGtCQv24YGqzTnr0RIb6r+omru/IDjKli4YDxrjQWlKUEfLEHihD/HmnF80x
j9II/S3PSb9Y1lGozEJlstnzrFmB6yi6rQDvPk3D7IUWESp9QV+bQcSajy9qlPgCSWhUt0qfzIOj
OgSBhCLmXhQKv9vHtBGU5dscDscy0d6dT4ofhT7wrL3uSVVYeUznjyw+oOY0SYu/PCY6VihTkdyh
U/JW8H955congTERSTFxwQ96NfKWEf32F9LA+k2Z0SN4D5hv5SumO5CU+VdHlFFz3EfKsmk/u/o4
508Ovpn5EgtN2afoHoUOXBR1oJoyaAufmMMLy1lAv/EyKxGpoyvRaKpmzzissCzZn3AOVY1Y4x6j
ZAHc2aKDESBxSRlOY49Sy3+qb7lFs9vAfdBG0gi5Pon3P+D+gLLAI25+bAftnaYy9naDkx22IpN/
Az1Ck8UU1S1ib5Gho688dDPhzEJ9AmMMgHrpUoSOBUp0BJf5k2U58uwCWzCzccH1/jqiDoS7b8oT
a0jM5VCkmS8uUvH0yh9CLDnfiD54vv8FS3BNNsAgaFleXkJKFj+sfy7NtS5mZR6gN3pow0RRMJe/
O+pK3iTyDuycFWSxQHaClLCY7d9eUuoVs4nibxpl01pv/A/0vZdq+k8e4crGSyHuZwqttlkPGTtG
ZC6ZLLJ9isQStSXl/aIbSLVjvQOJynX+IVzzta0QkX1M5pk1tDYI5JNk8OEde4rTosb4wRmRDb5O
1zCrrOCiqc0JUKiDQoRFAQdM+sVR+6UcBVoaAVWxbjBo/gf/R7Mp6f5F6ssmkqBlNov+Uas5x23T
h0VWzNbGrwMgxm+Ev4ZTo2dGmiufwXYqGLmKWYNZW9uEA0OvdFuHZy7WjtnCUMJYL7KPVAvx4cku
cYMPqoCD1V8jzFHL7HuaMizvPdMyHlZTDrh36Y06CdXrvDHa4OJdNlEST1FK5E5XEZKz+naXNTvx
wnqZ4pqa8+D5WThyHUefIbA4FPOzf0uRcYvruiTrm0tmnayvEWUKfXfteBzYQupOX+tkztzM8v9e
Sh40DKFhPddqk5QuKc8+OeNDlVGXdBXjp1kJ/+wUQkZMj/cUqOnQinfP5+LZ/ozbMYn+rbx7Jn3c
YqfYZkszniaAKxntLA8OCLQd4lQOe6vLYfLo0dnVuQ/P/VwxmL9qKfGKjjBvz8TcE7co9v0kZ/ON
8pCg7ah6gTLiXGvPGQEYuSsBClGGszx3RS5ER6IVFQhPaXOy6IF4mIbkBoCxXYvKl/QN3HX1iDSS
Nwty5YHfp9VZyb+BCYLQ+ppYQUK+suIDhoUEz/XyBtEEE8gxrOJ6Rw0IaFkm5udhm/dq4dcl1FGO
emc9t71fFh3S4ZQ08EXr29sn0p+Hn2sh5CdOks8h8oNMZ0nMbizJDDzfzYzNG6e+FiKFE3gkUZ5U
bYyemUFl1aFWmblWXAtpBsyTresTLxoouWTucuEs6Iw/FQ9x+0x9WduW/tRqRAtesRjtE5RzT9uY
c2VLDgQizfAGVIVI1S4c3FylE+0Nwt44CMe0N89Cjdy95vHgQaQ1rZ9IaS1u4mhgoeQ2omI7EaKu
qPLNGD0fMvoBLt5BvMBZrkmjkqNR/zofdX1a6d4d8cj8+J8a/kTVqn7ueDAwHcal+VMAArK1Y8Iz
8PCxn4JR8g8MqRXZCXeQY2u6E92yyLfBok6fcd8OWYxg8maDs90jBtxPFTk6rkaYt00GgorjI2CU
fCQ+vEYETHKA84CYEKLYklEMGhF2f1yn5Bi4hDG2u5RSsLlz9m11GfcWLc5nPLLk9WvGDmjpNY27
XzUdZbGZ76o89zZ4FETfz6jo0Nr8hoPKS5nA2X0y13leVCnA9L1qjSj0qcnBdpEQnPyCJvXoGmp2
dyd2++Tj+IBy0GfZFj4mPkopL8B212O8NGjaU58nYl9q9L/kCwZrEAqAbsueJSCRVUlqOmpw0ttt
yp1321WuVr0l+kQc7H0w61Oe3cL1Gu+CCA9yra7fLBOCunqB5zAeks+nf65RdET6JbbUKk62fa28
n6E/nxoGZNibG82Orq8SD6VL25wWCupQS1kYUmL7jtsZDIwP9hVl4e2eR622Gpd1cLH6fAAd86yf
Q1+N8gLSyHx12C7JQwWEkCbcWBLhHlbNCtSPenRgmT72zDWXra/zW699/ak8t8z2V1Suml+dsbYy
ovTMO7EVWs1fQ/uDa9CXt9TMLnda43qy3BdSAPY4L5Z5mE534M9pUyxtP0H51a6VjBC576nbnO2j
A3fDziVHEKZab2XBSZ88ebWUio88hNqBdbZNLMdAoON6DOmoWZbT2IlcCFFjyq0S8EiDfV9Ze4nQ
IJn24RGTlIMirv6iPmT8UOia7bikV8dLItdX9pOyDv89SzAy+DDZHcVzVYL1NMCynoTk/N8NmcQU
rT53c/JndERk8L1UVGn58gVenj1UVZMZQ0NjLSZfOOs5rbt/F/rwq11NJczIWsGvFi0+qv0CuneL
KsAxXzCevp3W4HyI7xM5AhkNYQfLga9FVtZ6Uj5tjt5a5IjT5LNIOAwdNmh2vbdTEWSwfgfJwUy2
rz1o2GsG7GFQwUjnTatywT56AoS5YoBDMddNWz38oQ6dGDr+rRt5zqXh+9Q0HZrZM6R6gZePN3us
hBIOwOSK0JLzsJ1F/0MN/jJ3vsGbRkY6n5x4sX2cPnLKX6d9k9OyTqbmmyljidbZoQKDXMqxopHO
ME2MFFxINViGGL/DZMA0GUT557gT/SnGuyYOSMzmAo0HsumQpjRCwguH7EEmJrd+gtJFpDKWWCIq
M82OzjGo8bislf+GIDHKNkDJmfUi0u6p2loBMaiLtYxImtKtnj3MI2GM0pg/OsaO8Kv9frQA/w7Z
VVpZnSlghfctHkCvbLrQNMAJ8LeKw+JHhSrKCQ6h5vjJO7U4y6XCsmohUrDYdEQv5pkfDvV0bnr2
+u8ksv5X+HwavO8qf33dyOGq/+PmS/S5w+6L7VPnX5eXBysRHISliFYCE/JrspDvLIL9/qSdtKX/
A0ivdPw5sV7Pz1toBTw2XFEVnv77Nxxo3PJU8S5drBpkffhpqb2rcow9BmhKPDENdl8HB/tF66iE
4BvnycSW7CmyXBczK2TKj9yLeurE670W+EVGiKXyEGD4YQUy6CWdVxfKHIurTqKIrpTw2OzIcROt
KRgB/fj9UgfhqTT+x8qZMhN9vYINSKN7pNM18kQqaeIDHE3ebNeFy2dugn0oushO7wy4vcb5nE+N
aOnwwTPg2LsvIvUmGnvfKfllt69mirMgw6VpiNFuMyrRScfUwFsEbA2ZQfzzHHOPBHvAohc802pe
w/TOJrugaQxKARmbwBt4qGjXQWDs45BM9tWK0uq8QidmPswc0dIpbWo7g6raVfYSEwqySMI1bDY8
5Ok9TLKD0S4n80fEdTzK8paF6qLGqvQC09d5KlqvOhmj/6/tBMJqMDQ7jRMUpyBpD4o7fTcHxdR0
Yg5nJqdx1ziKDkyY+/Xlw+ICsLW+Sdgv/z4GFCakML25T4/79nN2UhiuN/pvYD1al1YdX4lg22U9
DbeqedjIfSwzfXv6+KtsADdnxUFnd5PHdzdK3qkqJ0zfrvJjSUf9/ppHTySTb/2SpreMiPkoDaOP
U7yWLhhcWttGgANPRMEcSqSmbnm903UoqB1OFkHsSp5WU4oRYbLEYHYC1lr/z5XhjiZhlsfzhhRk
GF4c8TRznHVJ54Fy7smkuWXiWfwwCctKf/WuZqHwtoISKMW+x5nrKa1TsjOe3meBATkHXbooQS7u
LSGupWMI3N5Dk8KnrgmK8dK3uUgr8wI9NtOE7QITnV7VK8W6gJIm3WIpnIc3wzpf/sNpO4Tnm0a4
utQseuXXEs0+AGC2h5OU4vziEgW0tAqM4OPJY6BGvr7kj99p+pRBbgU3oQQVJ2PLTik/3DLzdZoi
h82awZclHBtg+CDdy+P8ntTtzbgHSbaeWCeqYKouJWdZi0x/IWVb9ok5fWbJ3CA3+O7+ZExjydMA
dNiP52RmAO75oGidexMKrTQaYfXYnn+nG4wYHFmH/d7m7xvtPHJT71TN4MhYqziHpdeBF9qt5A83
B8wHMFiwKRCJhleoZ5B6k6BZ0gZw9CtUb1v4TuSkPTTPigSTLVjUyrGmD1c2QJ4rguoj2f6ahGPF
iSqJywrkok0klnL/wpgFc2Gqqpjr2eI3+NSB2LEStmBK2bwGMZy8LskloLdQati19hwXAfjzYfxL
H6+P+tQEW7X9/OwQuIl5FUdwsb55sr94GMk6dnPwUmR9mozKj+2iqMFLGl/+Z1xOOsyiA4kXTtLu
ON8K5fGV1xZuI7li6U4x0I9tMCXn547+tXkHxQHgWZQMBP23AGQPPcTwJxhIMaLmhd2pfnFBwEAi
E05BpYAZ3nEMmu8cwOBq8XwDkPmICdpvGdyTJBO8GCrDEKHUTmbmdxA2Hb4XYZ6ey21hiQ5BqCD9
GXF2daDr0YS6y5RjspLUR7Zse0Q2dgsEQ+aQuUUkGeh8ww3OcNb3qV6sBCHFGS/lgliScWygkfLi
UF7uyezhuyUUY6PRu3jn3berYWGh2QPRS0zDkVBPW4MqdF/ua3LcM+3hFcAroGgASv/4Ncas7i6O
T0nF2LFqPiIkgNEQBQ63R8ObbEjdndwodT+oBs4LNTYfJSlMmMUI5fhOjHrCmqCtck0GFGFEouXl
cPdRxPVy6kb8xW4Cfav5TMJcnnkrWNZMeK16wU9Q7wl9UJAc3dM3sTcPgzDU/UKVkE4TmrTO4VcG
UngdQsBbRUi/OVyIVWpmV8vapuGKPZ1BWhTpbAuhu0ZAPvtctxMOzvy38I4uvCLOj6YzkhJwUOcW
1uW7HQ5d2nzzgtmW2t0xLa8v3/90bs94Ax8F1aPyPEems20fqmfkf9vdWJWPA/D7stB2YF1sxyzR
d111EKBnnxTi6D3BxeGfVVAamTf5iOc/pH5RJ+VisOUdyLzh/oklgtVWBV81v87Q7Ft3Lotm+qBY
PHTV+WXSCswAFiqiwMiziX3i/+NGY+VuvWGs3wpVv1YTZVJ4SkG6GvSVx4U68++ZuIM2q/XxRYVx
f5UEvHHVyTdlSK1lxeuK+MkuqOSbCqpot4Qf0OGXPBAbHzy3UFGsP7FJd9sD/DoQE8cXprHsAWKY
9XELPqPOvZYZdR2Fqq73UdP84DMSUFIetHey0dIWB/CdhKSAEQH6+4dkRHcuZ1sX/3+HgiiFH1rf
bKUeKnNPcFdnoN8YuJFhpxoR0MOPl2VP7HDbAef3A8/GaLdkseX+kRav6IKICzWzkSiefExPQkWC
LgtO9uIMPJZo7u7dYrbDYm33r3U5RNprXOrB68ipA9GxFaKp24+S8ZmxC3/lj5lLfV9ZNxzG+aqR
qKNWqkKZ4SivWsWRu+dtsyEFx2B1cbfmbRverIF9uE+NYaoK38t+ZhZI9cJLTPO3zih/xS+ob5X0
2G4GmtYhrXHW8TnyVbBhnQIl00Zx9kpShQrvtunPfo1CRAEMsXjBB+rRysUoLDVV5/BykzVPvT5A
aHmJV5xr0jm+PkGPlMrymxzk+x64UiSNQmW1te+WSv4IXmKGqStUb7QYxyXWyhXu0VUh5R+1W5zc
4w3ewBxD7YbW42H2Sduhny87NtU0JiBo1OnL5IeRyVtPT0sq3HuyJrYqWMx6wT6QzOZj8xQHjwNB
YXx3Us9mSL6dzok+91ZEsptDRiNY6KozxA53Mm4HPxt0Q32KHw6L44BZ14wHOIys35z5PlI8Aj2z
g5o3yPlzQeij20ixb/PR5gT6oAzcmJWH5KKvpQC+dErCLAOC4aXoPWWv/Gj4wzNdTTnzPgA3wKe5
Lm83qwBiAPpDo/EDj1/Ivnpjk3x2uofjxg2fJwhEmivEBFU5YRCJziATK7qLfCNN5+QQoPFhaCrn
LGc1zbgdVrrb8iHfZlHcXUWNWAiWUtK2CHPFJYlMRmd11D6TeswxNzjK9sGryDdf2OxM2n2La2vx
YF6/MseNo6xsH/of/OxyxuDX33483z63U/QcfALS5H53K94iMQV+OZ6zeN9Y5PJF+Ft4LrmUfFyD
a1MjkgJjAxx7mmgtlfAnQBM9VVEky/aJKJF6XkhINrIZL+WwQpLAo0dnjlwfSZX8mek9Q9vF17Zg
9N8UqoWQ0DdLUuLbUGXhcJnrnaVpH+fB4Qtw1BoYo2R6K4MCCyIxlnyQ7cyGiZaxfkOvIhSYBopB
r3TCXw0tNjHT1RAmFcbAYjktC+z/Vxk6foWKkE2lEp47nb3+0YnwC65NiByYMHVDhcYh2bbvJoa5
pH++9d7zqgd3Qbiy8nGRF6VtKPcxonBe0jRkG5RlpMFBIAy9+BjoqGk5lVQwHdeF4S32atd0o2Wt
xuuNor2l5NMrfMr5kQ5lKC7I8bzBGg9vq2aXr0WkLUgxnz7j+Y3bwkJyrYKXQeoFX3+hf7Tkeu6/
bM9SIn9EUSF01mzKwJA9MvVnBOcprpUaFNFT+QkeuzpTYSlfAL2GA3TjHJ8pPPAHubcXgCq3moy8
LcK/Z9WPBUl1lQ96qM3cUEJItumTl3+3gfF3XSEL5L683qRkTBtiYS90V5PLaPTklqv/GYDdyRyA
Ed9fKi8tXoDiLs+CJi4YFDFPuaUhdIQyYVaw1TA8T8OyhDQTE+jkB0uUqFSKZewOWAzm3EaeIgy0
e/Pey8YFBkZx3SR3CFd8JhMqvY80lHLKZa1R1IS78mVqPM0LEhaicVsAqzkuk3ZQVXS9xZmsROcX
KBDbGAEoUscHDPEoBg9yJR6qGRr16+V7zJaqhIQgY3cjK/O/jVYYeNdieVZZG1Tuz4MptkByi8xZ
Nh0HyMYGFhcJsHHNUqcnVCKg+MRUYr895pzrrrkQl2vxhgo+XlC/prghbL6r2LPOJh61vrJb2lH7
lveAk8WKDscoo/php8wZlWzxcAHCLdzbr4fsEJF18xVtynEjbof0dL3SyTPNex/VsTMgd1BREN0J
VKy7LYtYpB+TRwuaS+fqj3ThcuT3CaRezmC2O8R6dlnxj9Q+29LfTLSysyQP09UluQt0clmSDj6G
aTkbpPwBjBW7VYA9R4hOnbod4m3Xv1Ea78daDpAEzkvHaE5IoV0YL+urGuIp0MkrGldyzLWFmqxa
NxtttSGMAFpGtGXBw7Ha497a0QNF8IrBHYGwy3lkmXc+YC5hg/75PVTvQbXT/P+8hw4lZvLFZ8Ve
RyDzpjteZj4KRa3NkBFslrVTIXPowbF8Ju+RATDhyUHj9f/xnlsA+1G0Nxh5FR4nbtCuk4b224aD
NOgIKWDn9+fHqlwg11Cy1O50YufWowLpajxPNqJql1OnLnnIywyP5xDb/A+I0O3Y9DSyw+ONzOmd
irQXfsY67KCnnLJe/FuLt9x39jLUK9xPt0PbzDcQM/dnAQ2iy8aWU2OEvTuusw5vAYJb8TNzrtBG
e4DKxd0UzISi/4m4Q93fpGoqAgMF5J9FqPlmGPLGjC9Jy6CgvI5iT6/bXV9IDd4qQn2oL8I5/6iA
e5cM5YiBCoJ0yBGaJIWnSyidcy43wv79uqg3f5XQzqwE6jt37M92KoAnFb/tvjL3GXpuaj5Hci6h
iOMbgsFaz0LHCbBJNOBoY7OyLOK+C74YZIF3X4v7/Kf6CD5mAFCmCLn2QZw5BV7TKNxj9jzwGRfL
YUMUweBIeZZz6a5X7Rgi8/qbLzvLgZc4D4D6YaJiqcC6Wq/vb9SXelywWYhj8nlrq9lLRJZZWnSK
dRsbeBqQwEtuGJ9pm8JUAxbLw6i7pyv+zoIl/APauTXXKSZ0WguLQE3ruES2+rJ8MD6iE2HrE0U3
L7ilh1cbKa13c98ovA1vbN1aXEWBgqMRSBUd/yAtques38iu8ffPb82bJcyYNyZK+S2bqVhTClem
YlAV2h1QvyVx7BMNPwYjr3nvNjSKJI9z5Kvm66ttMezuD4FMkhYLyy8SvIoXOhvzTbKoWeYMNw5Z
vHl5CWJKKW52yPG8S0Dg3gk8InTKpUX3wmaLon+TVJVRH2Jrz7e3jEGPnXQm6I4ri21p0pvHAFol
tPaWcl8TsJVmZhsVnMZ8pAgJDfbhx5TT/DhUHwaCi05ULz+E2V3UiaUMENZpRwhBbppJUd0KPyqu
uPH0MWf0aYmQokMuVy3tPeQkkz4ZojpVvoVGz/dUoFQc4Lc6vTYfEFTVymmjRX9Ob8/f0br+kaFl
dHZz0NwKeRdauhejUNAsesq/ayPokMk29BKXB0lfpmRuxu+pT/nUfn9WJZNG/ehsenmgNl70qu2s
Tj5gBFf0pJTcvZ0A9S2GIkutgRwPjizEqSR8emC/91xvbuk5ABBfjx2C9xgaoiX/f/9wXEgF3Sgr
e4LLk1OhkI1lj8n2C0Rf98AVJwdC9iu9kmLWpH0O/GAKOvpMQEq/fHIOJwGgZUj9nEbhafjIy9Zy
rXqoJhda3zGxPjzczGbjP6JYj16cC8aF570EdXuF4e8Ehgpd+ZA410Ksy92Eqw4y0f6JGoZC8Vbl
zsoW+l1K10KCGEsX564S1lclUUUdDLH9KgSiWkXSvRJzcSTiHak82ZYHBH2Ytjr+1burcT239nAd
z0lXJqoO9s31AS5UMAmI6QcqY5/5uRWFvqjGJworQ/+Wn8FpN0naHElz80kBsYAzZF5fpH+Yq0Nm
4+iI7kQ0NtedzslsgjoBOtEJ6GsDDXd75vwsS5fIFJ5pKYPBENYfZVOx12ALCvAt5etZuU2HuMAr
MJfmNOFcduYhnqwshVfjrYxokj01kbEVCV5gFXn1EbiBC22fLBUQqqGAxvGRQVySeVWWK3n+mQfn
mHJ7ZSae3SorxBAcWDt3M6yj5aad+U7t8aKwhLAsROaYxzKR9CrQLSd9ve/GAIyApOxz2Szmdmb5
n8ejnfvG8bt9yj7Bf20bdnNDIFKK+0xN0a643pfhvU5763sFElG6LIw9XJhQ8zKiMsdt31phBc9q
XW6/8/cTT4UaCtepY9k2BgsK84VfZM5cujlwBRdzM2JrAipIh4yanY8cxBkkWsCdELsSJXQRpzxN
+Nvwr7rjaHScUgTac237Cud62juaIHOCL84/Wjq25UJnJ13Vmao8NKBxlgwg0SiEtqStx95Ubk2r
Wt+/sX9uwVUssV7sXFjupMY/ljgQrB5MRVzRYbaXBpJ9+3x1GtSAj0sGtnUSRLljV0JVWeyhTYfv
TWw57w1/sjiWIZdpn8YPjzaP6KLn/oo5T1A09BRZGHoPx4ApV7U1+ech2H/R4GP+6IlJwfBQ5TVD
HKDJLvWINU3QO0Hp35xhVloXT1qb1Ac65LnMa3FEuNp4rUzS1XaqCOHpfC9GopXvZTEGeXVsdrIY
P1L30sCRC4SH5yfmrLjffY7VzsN3D5/0IGnh0tlVDCZhelP0KAIwOZu6v4nAKFwLN8qJE9mIUWvj
CfIqu4AYHsN/6dOzcfijUJCwfqmcD0GnrSapPG1rJ7MIfypTojgoyWdfR2aad0qWQa6bhAbfZd1+
KMd9P8bDCAJW4oA3XriM6/B++YBy8NIFXf0ygQBi43Qa40jKHfl2SpCP4Nj8T0Dyo6/JzVEjlX0/
R39ysexkk5HKhtgXznwVYDNpnb8bYHw177a00+BpfpzxK3ozwgz0Uu5ZC4sbkMzGDbF3EWKlXT5l
30kqF8CGPz0H48slhK0qDENLZtfTfM+OfUd0SnEAdQ98hTO3ZWL+3kHevfWd84lDjoZBqypfypqS
SqjolRiS4nLQJTWWm1pGE/2lbN+x6IJdzh8i2u1z9rGhSO8pxY+4G8C92RhBKPmGoQ5FYNu94XB9
XnleHErqWrdoZVhpehDpxy5BFyyaETIxE3pL7o/U+iPapj3kWUSOlkli3WV8QlLmgSBfD4KSbl/6
Oyk39VKpjM9JA4hpsvjQkUQ2gX+r4MFKwzK9MGvrhvYqSiOD0heuMz0CCmFpDNIqTQCYMW1lQHI7
xjyevTOlz5eyi8SiXc49lliknQ==
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
