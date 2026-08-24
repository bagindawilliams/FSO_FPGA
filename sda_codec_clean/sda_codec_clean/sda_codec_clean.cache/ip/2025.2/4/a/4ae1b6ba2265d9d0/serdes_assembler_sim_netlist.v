// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:24 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ serdes_assembler_sim_netlist.v
// Design      : serdes_assembler
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_assembler,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [31:0]din;
  wire [63:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "64" *) 
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
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
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
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
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
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54256)
`pragma protect data_block
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
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
