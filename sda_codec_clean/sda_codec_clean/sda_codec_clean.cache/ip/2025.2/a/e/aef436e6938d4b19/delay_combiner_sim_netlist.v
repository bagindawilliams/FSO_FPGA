// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:19 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_combiner_sim_netlist.v
// Design      : delay_combiner
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_combiner,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
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
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4094" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4093" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54592)
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
