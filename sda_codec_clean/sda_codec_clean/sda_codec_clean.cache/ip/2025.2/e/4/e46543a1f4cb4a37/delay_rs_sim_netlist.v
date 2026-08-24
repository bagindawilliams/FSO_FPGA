// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:19 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_rs_sim_netlist.v
// Design      : delay_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_rs,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
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
  (* C_COMMON_CLOCK = "1" *) 
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
        .clk(clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52672)
`pragma protect data_block
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
ay6ioA==
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
