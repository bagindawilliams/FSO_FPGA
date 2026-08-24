// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:19 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top delay_combiner -prefix
//               delay_combiner_ delay_combiner_sim_netlist.v
// Design      : delay_combiner
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_combiner,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module delay_combiner
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
  delay_combiner_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54240)
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
