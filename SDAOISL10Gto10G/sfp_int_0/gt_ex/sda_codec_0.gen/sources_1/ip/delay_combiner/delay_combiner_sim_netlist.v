// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:55 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
RN7fAsIx6We0HDFlBcOCWQ4dJFnYhdR9mozk8VN+a8zgX8Pr4yVNirWxOv1f9TqhLbFQB73UAjHH
CRxQIjBnJ+xn2AnFCourygUFzX3m77D7BN5C8pYgaipa9GYOrX6Db8BD9qL7jkXYeW6qE44raan8
ten4FhKicw0TnSb6Y2YmlBzuX2P9iWq14LhulWAE0/4sGUOZ8WYiMP7nARrZS36fyTSE4gra4Fmn
bUF8ifvJTtyfOC4oloz/lyKsDGua1Ru5qcwM5t2hAs08ZjaICy8LLX9wrszCcj7spHwXmTpRhz+E
oYerTpfCugiLGpZ/wL30fgbJH4xhRpJ43Nw0Rl9RFaICpY/HI2vk0R/XnRW5TyAObM5oCgrnbhaB
Bmi8ojMW/5AMLHZrWPVAxBb/JSOnQt96iHYMf217OC3ZgVu5DkPwYD+U74WqJVpopjcTXTPYiRHW
gK7T0ru0atceg87G4YgKreum4KNiGP+fMS4qG7i+P2f3qquB2L01QoO6TB9aaKMSAefZ/ku3LScB
Dw2Hx3MftMeflKMUrovTfSDmXk+vlc0FGNat7cwe5qzBzfH1AWupYi5/YSEc8RpyTRqRHtP8ii6U
9W2fX1AzCuIZENsxxzjIS/R3kHejRV0mpUh2Ypgt6hyAVaKH7Gj8KyMYoNKGS0dfmlfrg1+3mXMI
fdtM2W4MyUG3ve01Jc65d8jwWn1lL1j0IDiffSfFY4F3FPYDBNkKHLYAb/R+CIALLXt35ACoUm/W
JTEkkEzyZUBAKnUDSODu3P3G52ZZZu6x5Z8xvLw5bh+Nyapb1sNkEfV/LEIbZXFDbhBFgO9LRKKz
MISts/eXveWDLkCJpr2v5fYG9gogeBOEDVlqRooIp2pOMHUpnclOyShBBFZ0VAAjqEaYCiq2yLaN
ELyqGJtOJl8Ve5zGQIYk9Hl1BWMiV1reURCoZiXdlEcnnMbXgJ8eLBR+qRZVynnaPVvtcYrWKKRq
OhwcbOPfqizLDSIpYn8Z4CjiYS8NqK/KyMoJBaxKF4bk+MYag783y7VTjwlOleWGcMTpu1g9PP47
+PYtjYsvlgqKX166Gc7xXWFpDADWQmMXZbHeuqt9KRE3DgoVv+vRGMnUdyHAGW7/dQjsxzqOsuTr
wQJ/DXrDBus+bX9FFIeAZDrhVpXxHo1wSr6zhzpXpdCJKifW9tJWPN0IUZk8ErCe7lux9jAptr+n
fYsDnFqUlxkcFT9T+/87Lgt5ifnCYQwuR1w8BSBK3wn1ofqNB5Y7CjYoSmZCBxxvF28Qip0qWh4m
LvKXRmAWmfXbnGB5rdGfrHCOh6ApIcpqhkX+qAH6URVFqUd2rixxrYGOmSbpg6ip1lDfqnK/CD+w
2EbtZeLsRgr1BFSDZxvpDcEVwUR//74EN4yvjhuAuEuiwxWTh5sqflvjKCYrCNcdq+0PLsDc5OZ7
VDaDk9y9CPbabdK4Vlx6EEsT6nJpSIj0jxbVWG5d7tK2/ZyU74PtmU21dN2pev5C7h8uXL8eoJU9
kpoBgUQEFMtIWwBNpsmV2rHnFsUVzGju1jXlTsMsN7nya+am0hKGXtD/r0ir7cFxgCOXW8Ym/TOo
QsJdX135pCfcTBFYlrHVwXbVi7xhL5aj9Y3s5IRtkACcvvXX63cVyzmy8tYPMw1y+Ooc5EXElN89
YfAfp5ckOqeYPQMmWV8lwQ49HJUSuwY0IIqANNHSJgbL+C/i6zcHOQPaDBTHWYsRpXC83rAe40Hm
60tAndNzXcQikhfrNkLOfM8BqIaJ/9Aa8f+2GhNPBqT6a0KOdSsHU/cocA/hrSOvduCUNoospMxQ
eM14tkaWi1q+abIpFcckb4sgwZuNIKwVuTsruFZC3SGWFMFw3gFuygEaveA+TMuzsIchyZpDlfL9
2FmEKAKUCRtBpl8ttxn60UAtlfgt1wpEEcUiNqfFlmslPdkV6wsUXcKLoo8+pUJ3Ms1QNLF7XcP+
KvVi2PXJC7zOuhtbN5b+OuF4wCQBffwkdROX5JSqFfG9ijQEHfk1cQhp97wvSW6tJ0rAYcs3nMVj
q8VohQvVOxMjjaLDTgIY1ytu5438GHBgF41VaUParJG1TzKmlQb9RiBhNFFQ4WwhbMiLrHpXaQXO
ogRSaNE1gUAXue3AJFS3EqhZYUTC74sb4R5JrBGvdSZ4EryOEpPG5Zdkjj/+NtTpKjvKVSPlm0FT
G+r/ROvAhjAcp8AqVZGrJzVSAZVhZDqztz5G3KnDpZEJ3x4c+96Ix+sLr+XxZysj1NHE/fRgBoom
8mcQzJGdsRDJ1IALnTGr73k5n2u0eFgfwj5fvET6oMCIp0theTykag9VZbeKooN8/0cuLMv0qTt/
hazTD5KyYrO8hLypTIP7K88EM3OjXNYw2+H6tLnzlbN9bmC3Cda8N3Ql0tTKT2J/p4qlhwNbqtOW
qHrRE8TI8AAh+fzRrRDG9UuBes0aPqKKWhFMh3MfFhkjU5Uod/KaRmrCC4AKr1weTrJLQyjZbmFK
eflpTU5qxdgpXcs+5jlhz5t2uFNnXQczuO3YbRgJTzOx3kQvf9cbvZlGrZ4SJft14GZ+68xK4cMV
scJDXFjnNpeBdv8gOlSEfX2iqjF6l+THv+AIyVSc0RjtN5yML019fcPKkkdqh5OtTvz+YjvOoDv5
X8elrxp0rt1AD6fTfofx4kzi6xXx/GfUUgksXHpeHy0iuYTf3Gv+r2e8LAhPbdq4QjCOwpz/AXeQ
2yAdQ3bZgEDJxPE8AJLyCUACTpzb54lhDaIgVwxo/djbMDgw8litM8OZjhc49rp35zSesYjsqHcY
HyD3qzD2zfxG4gl85jHERKrIm2XU2Nxl4hEt/lANWQvwdpOapYaIKfW3DNKcWGB3BbRKwxkbdYYn
ZVJ73Z8FQVRLJCaW5L40vQw3Mswzg7un3KOka9T1I824Gle/s7GNcts5UZBknUtaA5YZRfeZdP+e
hMcbmeMIK6MMaFu5CxxLzNxJM9ts37TocVWPXYH3aHso2wC2FNiv+T2huvgMl0Snb1ccmPDVJpDi
nOwl2PTJE/tWI0g2ovrxbIb7IAvySDAoMsN6H1TCKfbAS8p3Cpalrm+K4Naed7ze2eW26m15bQS7
FU4YRhz1o4oRL0Zev6bweLB3XCWe4O0RuG44TJTNcRLlplYu4LTPzz6m7D6n/HU5n3iT6RbLizWA
XStNL/LeBgVHIZ9CId9cEUVAQE+yUdkYAqDSQL0HtRS2x3mRSOD2LTRIqbEyZ4ixy89OgQZvAsGv
fBeZbOtmYdhCoo4Uwm+HvOZtkSS36JlutvZCvQQtERqsL0hdt1ZGDhCz70V/JudEx4VBld9aj7nB
jt8L0XZmEKGSPV0SqcVFM0qIVcgpgi/LIqjC7OGMTwYVV2anscdniEVWm6CUSUhlr6rgGTdXCkMy
P+lscTyKTQ3xJ5WAB4iSs6WQQ2GrINsFTxa6RmwnrYOWHzdTkmPu0z+AK3mutJerGkcixJDc0i2J
cudIkM86OfIs2nhUBLNOiRFF6JtJLHwrlGaNMa2VX/aMPtohZdydcujwLGSuV5bPsmEFYDZ85MYR
0WJBMe6PHH8uaKIsufrE/MF8o6DzsqPD/6My1TnHl5jZyGLMmd5qVVibjdL/Sk82R7A2B/dSpIHU
lqkJaY40fui0EUinlM8NV2hwi3nJq2/+988hnUv+XXGVboem6gQX0D367REOj2XtPPbiLrn1fmBX
iPxh18aa/Fb1vRVJuqzTL3R80wPOzC2VZaEr2SLMnn6Jk7cdIjDquOn+jvjIuQ0AeD342nudsCLU
BPqkRdGxkeWanIfbnkABV/lv/kvnZXU1LzuimmW01CjjjdxuTllCjUauaoGIwBxaek00hV6sxEY8
3B/FNFC/DlWOKR7LlpTc9j5XVStvP8zo/tIs71WhvtdBPCIU/JVypYChKlDueie42bPxspbKKuTc
FdArDkM5R9sV2GB5/4ycr2doNQF8tBz8UY5x/NZnMXaYeDEIHPa2+rWXzNcNkRAjM7vYko3XG+jp
uIEIzeriRph7f2+xJiqT5NEYGtigveB2A08Vv+zLsLw1AvyncJaJFf74R3WNJXZmzyl17jPBYtKb
xBlCzMHobveEXcC3xkGSnx9HSKcx3A1xCilC+lava/BLvzTqW1U2S2GkLnrkjEIFrBQqwf1MosFV
TSBU7V48S5GQmedTFXzNt5KtflaMJ093W4FmnT54Y/zjLakL+WoJfK7hQcY5IORQsWWYOVn3eGo/
63c0is3PYRq7bMKfvdEj60l8kiuSNVG3Oq2CphNHGEoVfO0jDymhKoHsomGimUPlpflhXD8+HXlb
7w4Nv9UGzOPrE+dbl/ZkbZuuydMZRX+/Fiir+OUahYfexFIQ6dBqbxHM+M242vT63LkSm7MnsqtF
vekH1Yut5dgqkmb8sxrEyEnb9UJFsivGG1KU6IIEzx/giYnD7TacuSBL2+InNV2nn/W3ubhfR7Nq
kDc1JyKTcQNNZZ3SFew2Ba/1YOE8fBNFeUO7K9IGehnHXO4rsI57yEbt4V1dqA4IeDi4DcXaESEu
YAfvAaVThDrWQ/VzbjAz89n2VqghaH4DnWZkl0PR5LnAw1ykH1DajlTD6+v+hwhUwlKQSDgiKfNZ
NiJias9yRHR2pX6RktCIG17h6r69k84IrBP0hBDliJOUKXljwf665ERvcSJzp0L6aU3Q9e0dRYpz
MkRWdKWyr3M1iyyhhbmafcWTJkpvJKH9sNodQh9cp5nD61nfGvJNa1tBWFdf0/AsTqOFq6UefWnH
v1Jy0HvEv/9H7MR7LvllrgkPwqQBJ4bLImoU+FfE6bvwG2qp+MD41qKfCXpJAVUSzvKGYB+mYXB9
d/uSVh1QH2VI09zCWXwgEjB2w8LCng0AWMTyMgR3b0ZGaFopIS1KrLHL0kvFgWXppbUKOdUarGP7
OJBYRBiAh7y1k4NPzeVKzC1c5EaW6nNOfiN6DB1X2AUWSWPX2u8KksvKtKnuL+N90OgDpFWL3DnC
NMInV7QT6UGWmE41D4bh7F8iWYSU8t4Cqr885mQhJPaQnrMgK4jDrCE6inxn4BQHc9C8NyxVp63I
B2dx5CP0NqDAaFjLzBbjDXkJzIA52DYV7uDlQnlFPVlsVr5WfFNeT0lsih2leXwojBQXJzS0xFna
NwpEnH5h45smcSaJb0WE0CBVWJ1RCPoC6RDMPWHkZ7DUrXfSRE911cSXBTEAyrdMfkGYnKEX486A
gSUwUuh1pGnjx9ihliremo6sOU6devvlAocDyFePA5gdjjMXaKevnbQuBhPxaZVTX2wyXcGwmzRl
mhl00XNhcdv0mZFG5ZSi849e4GQQOltS07GhLphjHa8wPuP8kolxDdRoYwB9xX9tJrzcfxdm/Atv
Bkfg6iTKb+5FO6VYs9fOjvi4z2cMzu3hfwTnuTN700fzfcYPTwlYUBbZXavfMCMJdB7ybaTR4grS
a9CTA8CI62Y7VYtbcsdxGaVKiKZBtTGUSb+K0SAIz16BGFBJXiIpM91tYsa/Nw6kbyV1sYoiCq8U
Ps6ZMYHmQ59FcA5SrcxfL/4gMpJHfXRIsPrOyrhVZkwLlk6BoIJtqkDpcmMHYGG0x6G2vM1LcnyM
KqMY5h0RpC9St8qfrkbPhxXCP8c1lE3Mk3zbJwngBTbCrri8yKDJzTjFrncs485mdMhIkewiR/li
jiLpx6Cxcl4shVMvBk6u91FwF0fEWUtyXmx/AdwmbCaMGh10wZzyDPtIiDi0Dfyp/8R9MTkHn4Ge
VxTj5tqBR11A/243G8r60234YBzZYafJMqUDETFCIrALqVpmt/jG0BMbQoVURJ8uWI/0C1hZ4ezz
5+4ab5Sxoebcs4NLafQv2v6yWahUHwwGK9GPAgY3lukG9CMFTUzmuHGPKlTLbzl15bVHC5gA/i4X
qeX+yEwNzJeqKG9UbnLrHamT3Msv8q74KK/Xl2nnFm1j8s8e1MxzdY5JmpyCGrCmtdUCH1m3KWOU
4axHRlc7ii9/K7p4ew4QJsGM4g5RKiSvvGJutRD5PgR4YuewC9ZlTvm4D1CiLYu7XtG+nirriM0Y
UGj6rH9upClHrFh5rrsckrwLVEzGQBts4sUhxtn4t/hmaJPI98j2WLz9P3xMbYqhXCY9D5sE6Zcm
alETiJqhQfyEBTsPkygUXIbdQzbvo+JLVRkI4rQ91kUs/JMDtB0ulBIQj+K5oH0nEh/+tZFAcctd
yV1PD06V2YOT+DI49yj+gsBAsRele6qdWCt1nTiNQsjmJxbqs35DDIMx8x/OZHzeHwWE5kNGJP+f
NDF7OFHmsserQTVNiiJ8b/EH2IizA859QprHBA2hcMToSDmgfMr2OhXoEgLoiow9mIOO0KF2TfKC
5WbhGCnhQw7GUqCSWFl8/aaNy+wFajZ1Vd1sQGm6Rpq5o0FR8HslkUBDUaE3HxopTAosR/73FtAk
EM46BsfCtOk05wetLJpgR8isKjFTEbESlZ9WYkh3Ib3QMgSmU0d45fpEmIt4E0180HGx17C4QtVp
tpxzJsH0ZjrG3VVNJfLy3yKncrZJ9KjWBo5D1e8CLqiBR26Qmq6Yk8qlqb0V7VMU0560SMmmPpJ0
76aBBEQdrsEB2Ehd6Yp0Illluxx2QOWxjaubdMo4qubVSVG69jczpuZRMOgYDh8OhhLakMpKJzRw
tQt5CUcHnqsB00SszX93+IAV3I5mZ/TeR7kwo8IOJr90pjPJ4o2Tt0OaXI7jw+MwQnSLyWhXTbaS
ki3hpxigIg0dRbTdGmDjyXIuwjESqEYeqLY9spfaQ6ncLMfQkrwkOPdmKLhQ7RE2+uZBkh77IjRz
CwFmUOSIbbvxfg9Wcz5jV2a1aEy6tQxL9q4CR2PjosP/aomdr/2+09F+baMVC1eaS2O9/OdyLs2l
W7gaRF0H9jdUKPMv5k6rXPGVrhPsGZe+d4CxMp1MJ78S10v5MZSWhbSNYSZ4CzUuNt+07H6w7uMK
Jkj2/l0aeAVAl9XfxX5u3qiaAyOfyiZRLvAx5tjdUV76ds2/MI/4l60viwc6CIuTCGl5g6q+ouFS
lMP0QZ6gNcQjxtnkpOGOhz6BHYAKuiBXeZJXKht9l1DysxNhP9CYzgQNYo5bBOAsWyT/s4rEeV/9
M600jyD6YLsxkY7+zFvB4vKCrIb/n+5RcSX6OWmzmAVnE6Ezm9Cq7kt4NDZp9Y3WDWIOLJSe7l2k
Sl9Gds2DgSmPfZe3jNqSK9eKvrQdc7WX+FLwg/We7KC3tRszA/jyA+H2H32hWxSR9eMUCwqC1iC1
ZqME3SPiYbl8E+rqiJpNNme0kzbVfkpR0BZWYWV7vEvtn7ZX0F0EYF0sWo8284UCIEbhKkxNUfV7
h+H7S43AzDc9udrnZW9mziF/pqL+Y3NFI9TWyGLUhkuLnVL9RNQnwTtAlUUUzpI3ld0MEN4HGWHB
75lPs2GsBFJzvbl2KytxApHmSxsLXaiXG7VPcxGAiciBonuq0XzX0drGF71a/m1KbeGcoBgSzvJS
yUfM8is9SrXC9xYiJfKU0etoTC8IQlo9+pFqUikzY5gAPMwa7XJkw+P3tvE2etSKJ3knII1VK7+p
CgnzO5q/jTD8xL0ocz7GSqSbtby3YsIiC81Sh1PwDXX4pPW5ajxNh8E3bucgrG1NZhY5WQZSmkfW
La9oVYGfTXDEyoeoLgcmpny7Sl/S1jzr0RIMuTETmiM+aTRv3D+YfKck2gTjE2GEKi3xfKc93e53
sqfeCgj9SK+io/qWt29zoanS/9iFdo3lcz0FqChgsLiY/U1GAYECj+M++SNCuDTK8BJtbiTBUrQ3
MRBSks4V+opydEkBvTRo1ZNQZwZgIFXVAI3+0+iOOSnMqXmkzhndb4IZq8M8+0pO6o+ewU8YkdJz
EgDlEJUPJX5YCxQwCoobbIe9SVXWEkremVEdrtNwzcXLLdSJbFPbPDnN1bjiMt9/LSWZpTaTfqgJ
kbCzNQDuH7k4gSJ7r37V9h5HRUg+R2JzV5Z3A6oEutaLmj9vUnk3oKvMnU8m5ucfdgAU82MqVBdv
GUGi162Z9k8DQiY7aSZ1qMfFsOZrejCZd4Gluxnrbqsns7jhe66QIQETI8G4iCfBS6K7IaLeSfQi
0C6aXAJP+wdhPdTwn6dl21PTbMChBBf5B74laIyNQtLviiSkZT1FzIo890jF1Pp1IkCh6cnpdZQZ
oqaSsIJs3SKmM1afJ0lroz+n7xUkYNzHe1SLRe6RioStrzggjfeP3O3xEbqb7Y+eAkxkPfTpB5n3
RAFEDGtlxauURY8aDQ45IfR5uyG5G71Z65zO5khVILL9kUxFlNHMX4l8cGOUiy31XV92ukTD9Oj7
LDBVYCdlbW6Q+DYz3xoKzqqgkYYKtz97HyZ46bFVIiqr1rZS0YrYc9lgMieO+CSww1Wx9l75a1lI
73XDTeeumL3Uo1p05veJzCmJK+uoi6x+sdgmZC+CE06XkbdCo38ENF6WPVGcwjX5nxG4bwC4DQLD
y/6PzrM+fh9p3Dq4dle1pH4U+pL/uJBNQU5LMSqkh70RFTTsFVL3sRBvlryVO/DFdSkTdFGinFsj
f1z+XzreIqnqGvWCF+GRInf5AR7yhCUYoWRzEQ1Ml4YQb7a0DHobLYCiVqs4XnHPfJDoT16I0P1g
Xg6X6v0Ka31WbwPGYxz9l6G1UpmYJAXBbKfNYxbVi2v+8Kmr1/gS3Xgz4egntmMezIWcdWgVSSq9
B1p2h78aKkkUSwFBheyhVpS08PURYZdqeWXxVwljC/QReWa5pP/1SvSCNPp4zht/pNiMKsn1EHM9
tfrYQ9v/+ptZWLBktQL/tEJBHNiQusGPd4F2FjHdM/opfRIPwZVC590gbKwTMhUIlZiPhzFnKwik
XbZrHkCGUv6NGW0BL99NUoE+rTg7cxqWxx4c567+bD55Qyp61ADW3iYMRcWYmOzd5BdK/7SZ/usn
+3wIe3dy5rtzEAnTEZrOJuxQTNTjFzt7Ojpj39SQv0y3ubuYGjQ2iOB0soIBud9LmFlw82B8Kzui
DAy3dPNA6TWQra09+tPog9a0DhNFd9Vsikh9GATBAc6iTvt6BfHbcDIuVYfPSanGyL9EG+yOFKFj
fPZf3Iug2oye6TMa8Bw+hDsAAUolTnr5wowjXTodu/gR7D89YOKrY/pvBadxdfgwOkGxFik3+Rkw
pGuFSsIZtWbsHLHJEKUcPWeHp0y+vYqAyzBeLV4bB2uFkM9VT8/J+n/cLXuTUOUB+HDhs5nE8T5N
u5CZdnloDXvXRiIU+JOCKlO6axAB7JKVmFmadlNZeeCWKqfhMK+lJSRGfdTX75uq6g7h2GHIJ38l
CrhCKU8ulCQEXW7Bb7o1FK3HsgP/zXNzUIIFVzRqXWat04FjBSsAMCGfSzukRtm6ZWskNS8xZp8l
MZW/pOG+p/GoznIEOOAhfgy9p/ey9b6aWAEUX4UeeCYEgHYMiRz4cCnjk4cstBLue5KVtIeBt26C
pYBvye8WZ6HIf9FMgMDa93ARbfINLrjTOU+YrucF8Q2ibdsdgHK60L6FVjGs27pc/+uXW6I9n7eM
WHX8+fYDIUuyisMCADSmPTZt6xQ9EfrLsEIYGvKx5vwCV9w3CM2WD502DUgPEsXZfADgUMVzq9zh
IheaxmPsmhuq8hGV83UjOxMuT2iYHqoJAhB/YkgZGDNXa5zWuPR+zCbv2vmZriDnLpLoOSxDaqEu
ohueEtOfZ2JAfQSPbwlCkG/JuoEl8jkZF7VbM/air9vaeFRhvY1EqiNqgos9L0w8vSR9Pddpt3SY
iO99s/PA+f+Wnwp/hkFl9ikIzI2xxl+OVw+PZtd1P+AvqwQXQQO/xX5uUggM+Co2DXfsWEYCXg25
RVlmUIBgqZHUpRTTlikCS34U0nSKIGeLEqazRxEDRFOP6Hw7+lQW5HXcYuUS6DMM7cxj7GeAGMvZ
9MXy+ezmJ1Rhtx1pVkDa9Grnj31E0WnSMQwBFSuf08RIFSZNV3pctoFWiqijacpWlwUdKlFjzceE
2B3yPcsT2g3PAqwE0hpzxZYJ1OgCzMHVFa+Q0vqfB0F2vrYIS6WL5ObC+jcv6ZB6RrLRgjEjJiPG
t8FAC4fql6CCTj/Mqt/wljDqG+6KqIXuJ4fmpv0yXVte1Ubgrsm09seWsg/BGp5joZ+wsx0I7DWX
RvTtzTWf3lxqb/rUnV+PrCD5JVqdR23InEMl5QcQ7Bd50L3ZqT7LxFJGCeskj4fhX4lhwiiuYnAv
d2OYzCcU/5YQQHI/w3h+C7o5R4/VbB3gZgf74wAHtTbIUdGEbkSPMQKjlnRrKhfCKH+YsmcGfzyt
20i7SyAcr/FPYEbx+bcThfqe3BY6bCHy+/xUUgpoInLiQtZsDbxTfgWgVD7LF2uXhZw0yZxKE5fN
vE/vRmc4u1FdIxWUWE6CJxdK4WeYlvmSOyyGo3PTIwoJcUOCHvNFEGWE8Hd/1NLJT/4sOtz4ij8p
Etu0MM1g90V2UOqgzq8q1N4hcHBnHRUuM0+Z1dBn6wqYEd5OTscEEOVqYpTRh7sZRdbqS1/+iIaO
F2dFLUecxky1TvojplioqlzNC5V09uTvw/c5i06bhRzOrKVl+abJmz6c/wlS9wq9K54BGPY9dSRp
uLfFJG5ITH/XZguwu/KhTAlD9ayM9QLClZcIQaYYLmQJSN6kbVu/fHXHO/P74Hfop7+BydI1JpIG
L8EBYGAeA1ZnbSqcNLXcGvhQefF6VIcEBJInNm5wQTTSz+oY12ZOIK4BVoClYzDvCBuOXQ8zeSHq
nIaidiI0LZlGx3Vs8523QLgYVTZUjmZ5jYhAvs1gD6nCK3cuTV+4pcgtiTFG0Ck85cKD9KYDBp2h
SQ+a9lCEymUWCdzHueX55KYfC+uivyeWT26zGbVIdpO3TKK8jwEXmiP0M+h+zObHHlI0YzJEAXBh
ZkFsopwQmCne7VIH70OjDFSut54jXFKFSJNf8uRoqjOTn8BbgkLxpPTYtMhsompn/GyVxb2p+92z
/uxzaGCny+PWqFqFkP5KCpLOas2q4fXTtdFf/Uz31Zd2pTwtuXcyMgN23xm0xV5QujkloFynuior
bD+JcSkOUQIe9H6lgKbFlr3F+oqEgWwtWqgPqxv3yFALfWE+sQRb6YDwLRpuMdrsQmNDDhDo6QBa
+HQKB4p35w0pzlZU3PGOB0hpFYJu8oUBjsjaNiexQ7ZTh9n9nyI+TqgbfB8nUAmleaYbbLUV1aw3
mmsBKUCued972fuLcHFS8hARLmabl4O3SY52wUkE0BTcbJivB7q5ipE+1LF7U17BPX0WZ4InO3Qp
lvUdAIr5jquoDDbVCY2ROmhIb25euc5T8FxqseRS8itoqAI/2ggxhetFivo1qoaEqvLQ1O7OCJnu
IuxbIE4R5qtrzFKn2FPiMfV2w0qYjqIX8vntG9jOdi9N415S2rbbMQ3DzHCz/ISgsIkdenj2Kz55
Y4iK9A0wI8EAwo0JS1bviK5ZftywIOQ1yzQONtipzMVX1tslWtMIpCqxc8MHB0eaf2cJcMho6AW0
7p8iXa4XM/iMziE7QodgdAHfsS7NFBQ8Zv4+UK42/+17w0lZXgCclGkplEQKMJmY91xjGABn6Q6H
qLNOXdC1PKWkhPO9aulyF64bPjaNmnx7zA9ymrY1fkkI426S90yC9kMgBNlmeoa14f8BIs0xORsJ
UQS6x8K4Qv346Od5MQRIvBO7/mLDl/M3YqmWC0NgRFz3n3xgjZQ1bJ6jpW+bTaVl6Ulf8xGrtc1f
YqS9SpmEO9yA0u36NAw9Fg6/sMHr+/WqjkRg5HeV/8vk+IEmbIZ+GdA2TJ0ArT0TlR8rWEsN+5Yf
J6RoC5mU+qEse5j0lmiqMSMEtyUCW9QwBlRr0I+mFyaNg3EJ+FSYiXlIW9LwOxh8clgL4Yb9dfUb
Ak37Lhu6PbdWcokVAFDe3HgOM9jn7bcUDPOTrtyS52zNBKvpU1poS0OHU082owpXxl735U+R7gvM
PwOUzuIFNAlIX+oQ44yAJ/yJSWuEC12ZPXMixNHFl1cTwe2CDiJ+1tp+AlZvAjlsskcCZTa4ivRD
YbJI+++q2lYTloaf+AINqxw3s5fTJD+NZP5uWKYexXUelSdjUigUmIQ4BbXbA/AasXc3m9pLLOX5
5YR6TU/GDUhVcrYWcRjqAs7tFCUw2260nhlGhsgEQmlgPcqPniWMtTQLH5U3DJKx8k7SlUB0xccn
YjeJXDTw8OKcUXkXMc9PByvZeAUqqPaGdH3hQMRL5ha5D70DUCzaW4181pFnpzGGrIuydISSlJnr
fKl+m+IXt015Tjbdziv060hrIHwHXI2BDNHB+Wy4yqX9a3lOxewdsXwEXLqAgclCv1PSqxMRvSc4
wdjBOYJz4Mf8h9hu+f+kc7JysM9ub/SW8J5CV9IuB/5/X+CQvhbgctueE1DfFU2Px7WV+oLRvONI
Shvi+Ax4LeVaQQuXq61rSvt8fI0aYqId1OG3DGqgGTx0WSaiz7+U5yVYyqrGr3NzZE9y6LKDT4gz
Lge+fivOkGxO1gaWthNsyUeX7RvGoJRGuYHXyldPlyE1TcPBCqbV5mXqf41mKK1aulx1fl8RboVc
AgJrcRMumIyLQ8oYvLIe9htjEkKjXl7XQPbJrt3swB4m7DhPHOCVFbTbnIrb34TurAH5TLY1rI26
wSeTY57dhjtk/Gh7mlcBIooHJ0+dkYaqEekRwrZ4ztasDzGkt0x3mtZigqqgGshwmN9a/9ND5oXo
1bq8sqglx+I1o/gyTm8vHVN0pWHpiCCv5Lb9TDRNH4c5KM6gZ2FqWN/yZCWs0qr6Y98qGCZedsmW
ENQhH1SLLeMijiFrErearL774v25KMUD6A86w2HKVvywZ0ivCoiwGIe9YniYiVvMKIYHckIJQwdF
z3Soq5NtE+3cMZ0t5Y6hi7kNcivUvi7PTmatQMKGUr6ykacB5CU0oZFDx7bgAdCYgQqKSLljZR0E
jJBXDK6SreNrx86TIrzq1yu1tYnJ0W9Fxy4KgzaSByLzzGfZsvScPQv07kwuZrTaRLbU42VcdC2a
fTRX+41FW/4Y8k4DUoaNckUyLXRMNC8FL5ee6xF+T74tRaZartYKBCIrCpcg3CazO0FIWLpTF55M
Ql2UWuZh/rxCP440o3vaXnQcvOqAgYdUJxuGEZbDjmx7G8JJ14aeEzEx3UvjBUjBB0gUKbGyNYrD
VEX5U4vr1cRz5kU3iRUuARqBQtlvZaIj8oq4nTXHn1hghfPOuhX+zmqpHkTK4vkaA85aCw42EvAq
4p2yee3RT6foHTJkyDu5Mf1nbtV+QPZKhLSPTso9BzJJX4IL2Iibu4Oc/RNi0G6cOVCpYP3Qojys
nkJBQuWHVZ/Z4H1/y4Y5CbbCQZ66kK7GCjR/WNlDC0/+/+FYt0EUjYeSi7WyW38Px+YOxi9StB7P
Nu/1m8qq0/xXu5pLp4Eq+FiuBczKv9IKzD1iIFIbcs89AYDxHRJo7U8FWVKH6ODPQicC7LPflZRJ
n1iMzLOFqI9H/rnp7N8r5MhD7wKjImSVPI/p4RNtidQwczExb7lNaBZWcfyDgCPVRvgxkSe6Mfal
o+I5arj4JbhfNb1Ed+Sh+BIu1Mo0hO8aVl3WM/IwmrHn/kc4fNrfd6ByEH6AEyL8gzuxSAuz7oiz
iMNvUiD36n92Oq42Xi4ZMrJwPivfucFmOlUGHWGFahOp18veOgfF+ZTDWQv8f7zggH3ex+mwhXfJ
nRB7BIMDFfFpQ82Ly8CkKTJQZ74HReliLmeCbwf1C3MG4Az9D/gjX4F2XEeNjgFvopUmoOX+QpYS
sj692WW/r8OjdrdxiVCTbWTTJvq21IZOysO5v+myCl5Y3/mBLFrfONmZvYqEfR8CIOxlVBDeXD0S
RMC4/9LQ8nPhusWW9S6wo3pwjbw5m3xyY9nOlFw2GvlVRLY1Ea7C9TRmiQH61WrV7utBoAWxEzrQ
Gg28gd1Wet/SEMC54FjSzwHaG10n3/r1u5aa3dJYGSadYWPiQYWMYt9YU9S4h/dUscqE96YWEM55
0TTsOhIymVApr5laTsHzcf1c7AdJGYxmooTAIDBs9GORKd1kosYDFMiOKydcQbtXIXQzXBX/rZLY
ZtIhQxx/OfsI2p6u3anwyRKbLs2c3YryzbyPI9Tj5/JwYFOGR1LFX5XFQt3BBKZqBP4SQxqHuzYi
0jtKeDrQKB08Znl6BTxj6WP/9qc0aHpHaDrOjaufsIN7Al6eG4ApripXXyZ2TGax2rXJto/CFA56
pXpA5fNuM3dJ6IJ3C+vPeX3Cbc5BDimQPgXWaSu5zJ5ViiiaOwIrHlpu49sgNxaF4Hrz70RGn+lN
dz4TAF+uoKokPGqmIWZqnhvt0KXojbYKM9+FYg+vcQxuo4wsU34BlqXWxni+Z04OIQlZWo2DSq0h
vC8jh6YsukBCBxVV8iLAEsjQSaL1S/6Sa8Xu/KIUiuLLfjOhDTp0ySAgrCfnAsvBdGyCsYFbP8o/
icsTnudusaVoJDXAlN811lpt0E8vZnZPV6vcUXB3F7YLg4KefwA2a4f80K4CATBznwjS3sOETNu7
vJTaffOH91q/ZlalQC3XzIElo1gCpLj6vnqNF28tclUcGrg4zXE9QVKZrKb9/vD9t+ib9FhIbbWv
fdk80GoD5I2YpTUxbX4+pPLMTB0i0saDjLKwO5tmaF9t3RHicRjVG+xfMcypEbLzFSTRQXAcuplc
Zw2ZmA6zPSiD/QOeCg0bBcgcUiucmG+BrnvqlWcrMVd/YLELUFcX5XdK2/GnYCfzS3RH0/lbra2q
UlAPAWiE4i0KBjZ5s7HrLybhZBJWksJpobCxW1USU6OtFgiFQ2j7HOj+UU8ja4Mdp9Gz9gK3O750
bx4K6RasqYuB1XB3tAzRdNOPnkg//riaCZptuik779Go//aQt+QyirhXTh67BfVAtIAT75Jwkk+J
sCHYmK/WuB99LMaEacfpyR4TAG6DdEQyuPFtBHT2r+1FbSgBpP30VhvrHmPVSW3sFKXBz3+C3mQb
QouKzvRA63Gej76BoUtauWNKp5XlghzM+NbD54963n0JsJRE8sy22y/TWAwKqvkbO6mFXQjbN8Mp
7cM3EH5No1RUq+fuXyZfFK+EndFRTe79H2W0vVD/+FxMcLtqjW/1HYxPSubdnjV0TigfoxAsxyx0
ofU7je3qhu6YGkXiggECyKjS4+klDVEvJcLlLwBcZlUn1mwqw7N/VNRkUU6IIx8u4rZEUjqmiZOZ
gYSRV5fcA0Q+U7OeznpngurhrbJHH9E/KWxma2F0JaWUYJ13pXApMtjJT2hxiJiHsH5kzR3/YIgh
llYyZJ3qCgfhnNDAcJ6JmEwnhEtSVw3gX0DPJvxqFPiKMswLewenogl43FuZXeqgo5Dg5QxaJ4SJ
b+eds5ihuIniE8gqRdyUbsp100W1rlNRiLDUAFw3UDKRJhH97Eu0WZIwQw8s6MC+cX1wvuSItOsD
g/QloQ/7/j2/XvwuEAi7URF33uWub3odF08eZODYQdgIZyZDOUlaid4UDde8u/1NIHK2O98xXvAu
WKZk0pd9NtmhPy5V8kck87OrJw307q6SJv8OZ5K2HjzgOn7ucJDpRkWOe84HDYaC7H9aAfSRWCGM
1jn/m5jqZYfzT6UaOZ3orCZkeUCsVHDJ/9E3IQHR6PMJT2UPL5cr2OKi2EhMqif4VxJLjtFiJtfS
k8UxAFM9B54WchO/MzX08kXk5HGArfrux6DFKAFYPgr0i7+BONGAc0ru6hDJNB71cdL4bDz15CLZ
7UswKLs4br/7xY7U1KuH3cFZkf6M1h7pGjcuDz/gie/o7PKHXVH5C+68+gPi8haFSdrLtLlYw31f
CxNok/lCob3rPvKPmkov3p+wUdqdtuOQ7YQxRMMbfnxpcLakPfhdhXaCUIuC1aBPa3Y6MtaVtAHl
VPo8e7ansUaSluCAZL9i4QdaXazlwswNgaN+K6Dr7sH1LUXI0nacQ142zz1Oa5Wn88CEtVK+Fxfj
ASl3X2My3kOGVlN9I392o8H0Iw2Difq6b7WJx+C0VR5u8ePmOyJkl1t+M8N4uFdsDIK+tjbs/HLS
8cS+emN+l5DUyG/ieto7yslGUi/fd+wFuMCCBetoStSgo04Aiy0RHz29wjR+LLovpc/z4aTikS3V
J2qjgvXh+25Cehgquu58r7HRqp5ouhshYrH1Ge82P8jdZWbQ3uRp7OoDKjUOJfgK6IgMBR48EU84
E9ktiqz+J2JTa4YF8k0/KYTUJfOVQEe77luoRAM9tAusL0SVx0oTgtTn/2Ugbkx4mjs1EBdgn9J5
bEVXGzXU6RdI3yQucgZp6XLc6oq5CeGXDff69DKWpxALhgZgaPOQc8qdFvOWPtnD+pHOoLLBCu0k
xeNui3v6D9luiKnfqc+uXHYNl2j/2RkatrkIZ+RZM2evQ9UROxftLPEqH9QGFd4I9a1T47UgEhJ0
xeRACKBmXlYE0qcGDTcgyOMp2YLQ82204Ao/3Yn3aTeC5NlEnpSMaK9Mzhi/sY6UbbMx44EaXr8h
uC5LXYw7aHwotVXDzcoMcle/ZarRY1dzgaFrC/OiLO4/Vx8J1WaWOWnIAw9nKO6n1oXo05t87VsV
Z2sjRXQgBnEYo8WYp+4f71eyANWthaXnwGmr8T3dlsGivjoG3IC+d95Q/yHq8LHJ57M89hHlajpE
3urRmVcyV+y7mjTAtX7btB5MPEYwOSBTo6UsYSoH6WvF7sg/NQpXr5f0tFfM7I/IXYeKX8CuK39b
RvjKZQGPKWD8j0NqAhSUOF8eE81H/xJJ98MkRh5vVUQjyUjLbvHaVZTtID08bVileMvDhqk+/IFV
n3pA6dj6WQq7gS++HnLIWZr/BZmOOiQfU2yplQvvaMVk3zZftHuDFV+FfmiD/pUmds2NShApA/cw
Y3wpaOGHvW7PqEryKmVyvXySGHzWQXAGHJME/SN+5UD5Ebs2nx1tBBnIU/uO0dsytqh7O110AfH/
lBTA4LLPpQi12IRgDXWm+tK1yzqOlX3ZVQPjGqKWn/PT7sGPDRC1taAAPNnLTDL2O3D5OwhsaPB1
uTJeoByqTUIIqYV/2isZ3Ogu7WHprWyfZhA7BXsqMy9Zt6BP0v1SYdx6X7CEWurmerSgpfClF/dV
zJj49ClAFUiEWD0zynEI/LRoXf4XCJwd/cKTHmwE+Wa4KeW5wO1yKbJEi4Yhfzv2Gf6YEIU1BYBl
cVwiyLMqJpUmxKPvA5lweKFDqFQRaiF70HITS0g6qM27HJMdPIy1hwuy8h/9nYJOJy/2C8tkYLkb
gbX9qis0qsQSsTao38NQGghjb1Ffkn3046hsOpkkb2m0kwfZGHTO2C/XIYpaNBWK9sY+lRbn2Z2/
nROdnWOlEckV8yXIEiAYHHx+uQsP3aN4ATtaKDr+SOTAlA1lLzaV2X85zIYaDIvDRVrIu0H+bGTv
p6QhfdUsRvnKOoyno9hlYvPbESXdR0blK3DT51PVe8+LR7itSR0jSaNwpKDHM9BAjVASTD7fORXV
PP+4hRz/+JBR10mgIQU+yJ1+1ocRRpsPbyIIvbd84wMSwbQfWxleEOpsBr6/D+jN/2b/N312qSxS
1gdMuwHUk07L1Ai/QFV2NSKc67zYr3eTCsdNQzAJZg9GdIx8jOVtSn74ZjaH8jIVIVYTe/hahsXu
Nc9Nnd0/CZsNYKTpZ+R2cHviR0Idm0OLgyl9fqoG/3KhGrnJxIZr0TMZyQWCTeMT0ONShxjZfMUd
o1q1SK4wSS7yqnhfKSFcOru1wZ1wXHfaBajKzASMCGQ954hhNhPja3r4XsDemQymAjfNyRDkbB6s
zbR39Sv5pypOJ6/qwy3cE8vhxygmFTBPtPoUfS1DmF/MleHEI4oW8nVBfSPIPQDhEljsfQsAHaEc
R3yBeE+yVkA+IUixGua5AQOxLETMUtXH1Jlwfv7APAzV65PXZcAPbnYCsmqEBVGHOVBqujBYcLzi
LiUnE04hgbyGZnzb8wkpRCF9/U2jHF0N675nG01DhTtayxNKGC3qWgBgGfEFfzIwgtTTtwaYS5mm
9hG323IkP5tx38Fdx2wYc9C1qwfNfiMJ+H3HbsDcfygAl+jxSA4wu8UHBSLf0ttikbfPDzox0fni
lYWSdEuUHK3wpLz3JOuGV8imAIMaJmzpvKUfCKMqPIUKVK1OjaeI0Q8D0qFH2ZJXlHtj6Gosc6CC
thKyJd/2M+g3UwebJtJTjtsmEHmVIP1I89UXexKSxRdfx0PHtAcTVEEMIeFAdBPeVyLkCJPBqpmq
Dbj35E4paLn0hYf34su4gOb9yvd0SoaJAtDOBsW17BimU+eQyyDt4dkxJOo1ek6C+ROsppoK35Od
2EwZlRm8aqCrMc43CmRwHIhy5b/WxcyCbmg8aqLAvRW6aYEDK6cJN8Bfz8RwhdhQmNEuwYtz4MPN
BD/HVKNpTjl9BTwicdZcCrYBQ0UbG8dJeutz9ij0OPX4qw7FGT+3SZ/YqIcotexv6eQrEyusNw1c
Aqj1ySyg0e1KC/5/BEbQzLI7X45Xjz+vFe1jfTGPgTzdhfed6LQw5lxz5CPGm4zosKkMPVlsIFcm
rZdWdTHDXI9x26qidNP75rUn7Ir2SGZvYUBJX4DFaqjf41OwPEPbGgsMOccOClwluZWrIPNxx+Ei
dKnsfYHkeTq4Ph9YwOSLKDFcEA6rTMTOqySmj/ne0HawfyBdxMV6FBrZL6UQlvli2K1rpwDpJpWp
p+yURxt62ahHROvb1sM9ebYgeFTm1Q4dcz8av80lFWIj7FtFGacwO7WaPz9SZG+8vT7kQ55NEnZx
4//ACEqpoVcLdRG7eoDkUrj1p3dW3FvyDPLqAEtUmXJ743WBFVInNx1MCmqPkeD2lFELgzM0umvE
ON2O2Jo0HEyoHbBIjfjTQEgV9mN9czp83l96bWaJJ14d1mW26vHovLwX7CV7LienZpMe1oKK8SaR
ODEHwumBXv3dqTMb+oAihfaQCxVcxGOHp1Y81WszRXHBh35hGTqFP/cW74BiKGThUPVUqvEAXGvk
lDJDBdmg4xpikclV4fSV4Q/zk34YUvUmrprEGEZgPJFdZnLO7NjVInWfppU9R5r0vw9XCpi9mSsh
c9VLV/VDGKftO+rwXGMKJ+VWtin9IRERhLQA48IpsVH/ARALXZP7TxQh2NOPbfXd26g01gEbWKV8
Yv7UeUvhbHZrjmjGR9UpL229BZWWCHgLAwHLASfeUzdlsauh9TJj+puNXoGQg1J6jdgeTtSlZmSh
Lpgfm7cXYnw1/TDx3I7D8Yq7EpTlLWgs3j+I1yZaYPeACMrTUCP7hS7U5C077Vvw9yzUbS9taXK1
kRz6bvi4mtsl5r57wr4P9hNJr4Uyh+KJAqIkA8cfAkan7jwevdUdBD5HLtQ2jaXPuYc+uqCISJqU
OC4kiy7FSusf6SUOpIGtu8VM8I6ZWjqsEICDmr5Dvy41RTw7ZuAicwP5LPNsw4i/NIG907WiFk/Y
d69+SIT2nFFifjyh+fz48lClGH5lhuS0/DASb4aRpZihMwsISNWOVXeMqJhHVB+mSfwZJ5WPfKKD
B9qUjUGuEbcXUrllaR96H6E6zpyhwWppocQ59b0SsVdGT5KnGOlCX3h4bldPImkGVJu0EB8DOXce
2hAzXk2J/zIuGGLNHOy+a9gMS0BkRmDlJSG8jnYX6bfQMt8yFb1hZsHamm4F4jw0e4eGNTiAr2Ow
cUKq1EgIh+6ifcq8ulbBs96gEH4lN3n2559gVSE0Zp6Ro6EMI6C3we5DIn9VWgC1XCoJvGbu8A1i
fEzBuIAardlz4yT7j4RyvkDtkVgwbNYVMrHUdKMRMNyf1F1A0KmoWlqF6VczqgiT/4eThwDBUPza
UH5OAXRXKH+Gal8iMS09tqGV1w0YdCrx8SHYJYBLCWvN669dZYpK4mCyt8nRBXt/SJJid9ow59qT
KASeXjoXnMBu44MTmHzyxn052uKxe2D1ouLtYy/0eno3dier/efYVdoGGCx8sZQP7xkxxcHG1m4D
HuhHQmIBHdHQGaFjO0WF99/0la/UCfyhi8ej1l+idM9RcQyZkl9YAQAhemZ+rQ5839mpH4wXPAim
Iqg36BrX8NZV7rYjkkb9SyY6jcK7ejg26jK3168mTSEdalxOQyhQ5cqDOaHAvKwWn239l8kBZM9H
GUVwQqkhe54Ir63tXel8lTl5nZOcfVMMhywbjwHSlvhySBCMfXwWK8W0T6mF55E30BtnJIbLZcpm
AeqA6uQZSpXfogNIDn6mAkz+gvk6ehqyOQePTeXO3skCy/vzlBVMD9z8YzHn4aNGzBO4n9c/aEoL
SdHLioc3aSPHjaS419trnaKWgeWFydxh913Fd9IyPm3H9jWqaypRxApScCTfB+JA/9twAHRExxno
+3DB8lryq//Y4sFk2BU29fXC4DLdFGEUIV+eVpaEAwILw6rie1fH+srZ6UcCgK51zGmZqICSu7gS
kKhMiujz6cHyr/qTp8dmCBS7VhLCj5hVXAYUNowLYNCE90SBgc5HX7U6vSLvLA8FaJgl51vbpHWh
mqtch68THJbWZ2YSVlNW0UhXoA+PsCtDXjJlQL+hx8NQfua2Miq6Xev2y9qteLVEHcdBqj+wIp41
U8ZYTCWyJ5ZBqlRvW8ECy+Sa203oqrkpUs+ENghjlRDZox3XFYFz4mI+cAWurrCJQ0xPHWbqXrjO
KymJHLXZzk9W1Ziv6mMcSSReVK5PlXR4PrnWMaMAV8Vw+UWwIUnkxUMZqtisHLz3l6KtmDkup0En
45KNKKn/8aUceCjQEJ/Pgf2YB4+hpw8jZmIqjee3Mew4Swq8WX18tScHJIG+h3INqT1JmE6t9rER
/ZgmXl5OSnIWCZxeJ0qXXqJBr58yojkb+bZT9GWzDm4UpKUJYYQjWHjumX92hMhjougPY/jIMiOh
usSqKcAl7qIigW8afUkyglDaCKlOdwsmLLG+K42bKsgqkBJeGptYbSpS1Jg9yURvknqaU5eLjxvw
wA518Zh71XvZwudnv+D5ORLHP9GH7uuU0Rh1o+XX/jq8tsHTU1g8XyQgrJFUNQC3G1/Y0pOJ47Rj
+8hadYX4nZOIt7YNqMnW2CpAh1IDMjLzDi/uqs7HG2xIBkCzxndiSaKHO0noaH7SNEMjdA1QKAD2
Xe0Y27GXYq7w1f4oA84CH57xxBv4MvRDOXpbzMvlxcTl/mYEeDI+U5mMuN2FNmx5CQFBgXFbVpMa
1op6c7Yhtzrm13G9ttMuHntOxyh6OpSg/hzv0KDqZzDjMN//xCs+4mNMwSGr47oce0/Vtk/HotOQ
PRkDsWh2uKsVCGVQoalt5FTFw2F00ZIFJdPDcqIqDmZIFtvBrybe+k367j3DAuec0xeJxWtCugB8
3wtrD2O2ihrV2pZ8s6LAp4XEbkcZYhhwkIKscu5hyilXYb9OF29xzg/fCSpmOO2umbb0ZN2CI9v6
ut/1c5r08YKonXOtQpw5iOZtOXDX+LwVqR4t6f50D73hH/zy1KHfkexFRhPM6gGK8wtwTzL/aMll
/4NHBs4uP/95ZK77SF3xTNwxMZUKyKwSjFFbmuQkIVEQLsYhxqG5YfSNCu7dbkUgHtynzIJdigjR
0NBmd16UhFoCy5p00KGDq/hPVsmwl495jEmobZn5cxE49xJSt84a/Uc36ZpzYCcGXcSEo5P4/TtZ
ciMhAHR3mJSy1PfWmvVKd5JSpoOEV6urWm9O5zMCGRaSOwfFOGFv/IstiMcc/MwC6eoSQmuiNOGc
G+t6Tvvi/o1hbZANym38akihL6TPM/Gw1oBWZEhAAETiTeuhpEtId7kd4KTRMXdeVd0ABQ1LP0kO
7dW95mAw0m8vAx/QdyNuN2nhRT8re2F55s0lUDfqFoTahksv9wisgOjkI7inJ6Hz7442V7fpzkM5
JmMdDUr7eDk+qvZ04mB9KmROkwoX0n1yeEnX7QpDOl7FyjLiG6oD1WnhbgBlAIcvn8AxDYe34uBz
Ypy7cTSSw+r6/0M4wPyUsNFzR1KLJmhf2a1Fpz8h9nBqsXSnaBI7H/u4Mnyf+8gBQGAT3fUU/35B
+bhsGul+mcaQoYSVYScd9HxR1gKd+XOWaD38D27s22OKy3OSrjjA5TAHTZGXV/M5n2I4V/Qgd0zr
6VFzMLe8JGnWW/scj25TrSKDaYUIqaYmXJxDNS9Mhyq/P0LLLQAc1+6J633Khr7C3vwtk5pp7pRs
0qqkb5kg0ZpeFb9/vsykmIUpCpbhIkJDw1QC+4Hp4HlEZJm5TMiRrTwGddmc7kQURy6P65dHBGDF
Y5u3rzCTuFI1pDzwRMnqoN23VJhLFQr3wLKtSayVe0wzuUSgYJLJXrE9aI+ITVNeDXfMBFoeUugy
qWm/p5HM8ee5we1wFwPIs2qvlDXruQx6pDLUXmeXTnbQf3SNgonNbBINk4xXgqsu4v7JChDLe+Ka
4+jgW1LZOKoSnEjAV86AQdlDdciqKeePbWBvZ76BZ+eRDyz6F10L6oOsd4ChJi1CM/WPHIsWCKu3
XfmjCa4ScHOanb/rrmbrrSGpo3AQcRq3euuQKCqXCIZZ01ZG4z8vUzWEOAn6M02FBmHNs3RDtktx
oyjb9caexrPp0+Q4aKMfk9Q5pXYzxNzQk/fSxvo4dZeLP5ZIlHimkMmhJG4TqVr7oJUaNujSftS9
YGOB+pq1Q8UEo74PX+r5QGEs9sn0G2TooAFA3p3BOazhvZQqwYt8vvqUh98Rr/+Or5mWNFLfFcES
H0fbmMrd5ikmm9m4fo1SJ5B1Fq6mzh8qT14+RCNQQ1GZU5oSOD6Y6uM9BUxq4yY8PI/iQzB/8l//
eDqYIfGaNOJ2iSXP1h1z6bJpURX2nk04uA40RIvOND9Rc8JOVCwrxFOhJ2Z8IjbI5Xoi4KnAV4Mh
bvg+vFXZFK7+OQPeK1IvTh1Z7BDVdeBL1bBmJTTVIlaQnCf69zau/2xUktKqCvmeSEYYyksk6y+x
fjrHBKd6pORKd7lV9NJSEpL4hcWBp83ppcYMw8V9iHuPGeQLcYT80fn979sdsJ7asbLX9psZVshs
B5OcrQ6XCo8yTjYy2Xcq/ca/LGf6bq9Ov/kZaD+AgwHen4ug3Vt397DlS7+CMcNutHI7WuKOw1CX
RfMpG7UaD09ULlteGzr1gWHDXwZNMOoFrLN+X40SATJhPCj/mxRPGg+7eWiDlROnbeyJE/B2zpck
VBcTQY+smn+9FEWSeQKmeGekho9IM6CrM0g4qLkHR/Rp/Ji7frQVERvuoczU/M7IUAQ128LZkizq
2UCdmLExX7uDfnK8IykUfbteScxK+ZLonjgPdnGRD3/Ws1WZ1ZTdEAFd67/89YpT6ahQYYRXEKDW
mbasSSY/GUy34XFILq3mH0+/m0a0TFcwlvlCXWoNWdDp0MY8+W7Vxr/IZAXqtO6nh2HuPZNTkDLC
XRy+Ifl8cYCszv51lRQw/sTIOQwFoO2G+RebPSCmBDjOZ9iJZtdOUF1wzwCwk4cFLxBKzN5u/PEX
gsSOxMc3mkGrW199qOuvTRB5Q68rHYKrLMaSJzGhaxfJCxnTZ/fhADNY5Vyw7zRN8kUs1iw6vKct
UMSHsqFLmhbn/18kqZjZ4bJxzyiMGv3bmT/oLjCdTfIZbgvX4BdFLijYqiMVeGK6GHwi1eOV4G+V
qytIW2IJi3RZiEL8gJ67s4nyGac71dCiIpdKVFYfE9q+xFilA1B5NClDfbvfscE609xLnwxRxWsD
ntEE8/Qvj6J68/oS7ZC4khEF+59XXGwF2BXwQPp04F38jqBeafV16gc7+WLfYSZc1woCD6uVyhDl
TVv4veHkDXkYa5J5RTHDyI7YQ5Bp9w1iZBbIzyPx34w9xfIXm8RrDSyqQUPy7VBSoZtZ3Cr9yueS
KsFRitbTltzYlHUIRQwQDk/ZAEWx+VmURRoZW75V5AJ8OQYIQOy/Nlj+El5GmCpv/vZaVTqpomOP
4J1b9FGA9NBhlOt63f5Mctxpvhrj8WUNdElfi24q9UWLb9WSp17UxvuqQf0vms82ERvRh7WC993Z
N4DxrAKXdbPLG7zsV9B0qcGqpbWr6/j2ahR4rAhMnwM5kogDANHf/E5tTFssa6Jd4ri2PDnZ5UYb
5F4RBZdcDNv1QECGyuwOFE5NMa90/K1OaLDMdbZXPJcajEooEOpNtatfEjOLwN+dbA99MNWONLGg
xVhhZJGfbe7R2wKviRoYzWRpR3W9s6Swung53g+/zY2rP4LiPIgK2B85MlG7f3ao0pGCWSwGhXOo
cqRXdYKzxlFEpESWa5PCHTncvGIit0sL8O/OMuqyyhW3cq8LFVYthNRNcNzDaYTrUMQ/HNsJo3/s
mLky+pwnUiMwRDp+1kXop61KzluxWgR+Wyry7JX3CmDaZ3sDoKnIKrw7Tp0QhzkwH9GFZmNUI3+S
AU6cCaFpsGQ/d6cqxVH6UAfkqWq0B6voC5k4WVKrT5XWudH3cZsot67R7JHFjeMRcKv2eX9IrFLn
gTQRyszlrX/KfUKb4SrAeUFStwpwzX1cTCPMq2NFA793CPLzdNCtlOdJVg+slj4YEc+G55xiVLYi
a/hS/MXMW/xQJHS7h+2aIBxgIgnbaqxR3iBPoSVvbFHZSJtOkGmFh1lgMq4FxCvo9G6G3cYBUlJZ
OQ4WfrAsdII9E3Y4dnplwoeGFUJfcO/u3HOAUgalGOnKNWZH/AZ7f6t3fLD/ZJUJcR6W1ksDwvq+
7nUXdILr3F9fNOjhxX73GJEf3zXFsJVVmwEqyqbmxkFp/ebmWP69dbuwtbJxvBUkpWV7e8xg97WF
g5kMLIKy5HtgKybXrniqpseMvr0F3OjApbYxTOXy/vHPhgEF6gJJUIPi+cT4bYoYCndRrR/m1vGu
XiCql6ce7oAM2XRWGFywWoPrpC7OSbzU9TdyPMqozKb6u8iay1bDQ1+t3YQwDNkS7561TLziPShj
NCxio1i9UnXUKyMpOlprpnY4s2EcTO+kWSZR7Vxud2vdnN5XcWOnKAdkHvkSYTnQTmYKSDvHlpb1
QuV8rMOlBFW1QRigqO5jxed08dACsg2EyeAF2GKKoJAdykoufq1b1oQTH+6HI8iSlycggkRykP5m
OqJsK6l+dIZuGSRyD6IWkLcagslRo6r70SQxHta4KwWXjFFBUloxcN+M8Y9qNo1WK21NiVyhP665
vUerXHxxJWwVcuZ6K6jecZfCpItRqnNIMpTLh2U3a//ahhm7s/T/MiMTFdkk2e/NG1kN6beFEwH6
a2v5knK7FENb0IVU0V+s3InxMZueq5VV2Zv7gU+orbkjzA3kPPpOuxBTZqxeJXQySGGJgEWETvUa
IudZ2RuHS+3ZVw5Hpz78AT6e1XQMtxyIsymzrKI9Y9l1NdK75+86IG3eOrf7d1s2N+7VWccrgLCw
eoFplmMJkLdZvCFxkk3m47MHF5BQUQDn0dWAw0UTIkYlLbUpPivbOypcxTCXbHNycBJarTLx5mdZ
CxFMsQhRV+Iqzr37KWdhAgF/R++iagJFaUop/7heWbfZ5VX5ogvROIKWKkIUKoMcTp2ScvneyNuh
mCBHhCka76p5Mv+2bqO/XQJ6+cbVjWXJ6sPcA4p/APuuqpBD6V3Hkc7XBHUETnxjn980fDd0CRUG
a8cXOU9Uh5+nHicxqVR5X8FbcjpbIB1OTOit5aPdUahtmE6I5C7i0IDIYn6XghOogYNiEC3RITs2
Z/u81rzM6cAoqsLW8Ex11kqCcb0eTtVqsmu6ABLbVsGNqVrUCRUnxwKHQyvb5VY3wNL9I3pO3Kph
kAPLfIfJCeXJnKT9BplZ4W1eGdYbF9PnjDccETVjM6syLlzK2PkhZ3WH8dEnAUzTI12EtNL1B8IU
HPuUcpq7i0N4ZjSOt3ZfoCsM04TjXgycCj36r9M1mH4UzHVWGf4yn98UqM0+Zu0vuWYAIRhWWWK9
huU1WpK23Hi94+RQOdWhfkC841j7/gDTno8K741RUg2zUAxt4OHTIm7EZQ5hUzddLcmrpIeUBXmc
xVGj9OfJ/1w8Ns3Nine49v262wBVXIcDNP2K8hGdW/6dDGJO56Ce6NfllAHkbEG93SnP3XM1GVfc
XlqNkCXzuFVifurJTHW8ijVitaKH794rXI0+j8rxBSHEfY6Uos0i+l8RS2Ha0SZ+GCLmpPp+pGRx
ZQ+O2UqquiqCp+MzuDvJPzgTav0FkAcA/+cqvy5VpacPvJSUZDsZh63RNm7vB3xTPhCqYceHmuPK
8lpjwPtTeHBfFYUROxKAgqmHVmsfV0VgxnqnQIP7HDYgSpHdnG1G6iU4qrVb3aeDwYCS5hihTne3
Yom6D1gX3vbTUYtX8XmAyCDhGGrfhAN+iNIZr6P3TpDz3yFdRtMpkxLGittjp8g1wrL6AOc2qC3R
ionweOzDnUQ+LwVNRB3etgZmy29TJH/hexgY+tWAwr/VQ35Zs+STj7s73Py71xEGKdS1QrBadvRw
1KPcybNVibAdRg8AKNw2VR9UNiaOjRtt7Yfdbo9AwNQKXkMBQwe4U/u76UwjYEb8J77rSVkuWgp9
hAqkF1pAM3egQSok2+UP87Q3w2h8kX8/PTrB3L4a5QHXX2jXAJrAGvjAgJlA9DRD8tbrumfW8fB2
gbtq3YAdS8ufXAyejtSCVBIoJgmbnywkuWFN3NGHzxXfNNen0xafUBbqas42jXKFy4jtF3mDR7fD
Uja21j6WRwiUGt8qb/dNiVa87PEjELpGkhjxteNmsiDb40gCyQuoybZuE+1ZwE2x8DJTT6Fq0u7a
3JVvBtpNDi3mQ675sRJGZ/VV/JgVM4Ns8HVkUaCetY87Kd09bGos8YqmH1jlS516dQj1kyxqGevQ
cqNDWCgDSoBQuXIF9wHLdfAEYNsgjU2TTdZqCyfqmjedF8I2/4pyx/kmQp+H/iGVmuiBq4BCILyy
tmRF/cH83fNIRmYV42wIwaVuV6RPmzybbpmIAhgvpL7X+/+KaFlaKZr5hYOxyHjWUIdiFiNRPSOu
EQicY5QaJdgkKtF9p6nDkqKLwgU95vcrmQrKY+gYFAhOknDr0wSQpgpmlSx42t0veWmUCbeIKkH5
YA7wdndxyb9et+QjNQbTg/yCl8+nIccqSCU1mVwXB9zBAND1/C+DlVs68rr6RaohqbMB31V76tIZ
V7xCrjthJY5DyE85u1kuOcNmuvzeD6EM0sro/3WERFh5QrnNIkU/ezqCda4oAWwj4875789iLMWb
vRzvE7ZZwR21TM+ehVvuIIJ+WvxIc69hJveA7F7hoCHzpk2RGm7ttnP+MiuMcyGFsAZ38T04O3bX
vzJ0XIGkCbcXQRCgexR7lNNS+0rn2LeXSkJdznxFZEok9LLqnelRxW3PTCCemnk5DWLHymeaHUje
SLLo62YECJ9VUEz7Nu01K0L7ZDB6kRA+stGmwDf6Ba0eok1mp6Vq9y9N3bJ6aJhfsxl1Cf7o/2z/
UOjD08Y3UbeyV+J82Ew6l/7jcuqzZSnzzc5rz2u3evd05JzCMO7ENdJBFnIeZmecg4ecdRTlWeAW
VZyI4SgmGAH8ogIPVf8oCJhWLHX1j63o8ugjE2AH/+kKTBfTbMb92NbIpo5KnFu2cECCoZ6tYOW/
OtZ4Ti6EXSwt0bWjak3YXB4fYdi0rZj0vokghxLIV/8CQ9SxAeJE5RqgiGAd1CQcIRnbeUrjbhOe
jJ42eZfvl6Ox2B/fpn1qhNoaS0PG8RCksoPMMOgEQP0Y/qXW/3DOyi0Rk38Snz8pG4beKi4PiX9O
DznItmwHQhiVaJWEpiyBLn9HOoEkmaA5lj3rmprBwnkTkxgh6DpaHr8sRphJIWLdwA6N+q6kH2Zg
tg3fckNJXmMiSIR0WtEpCgxnAXRZolTzI5zhX7+PoCcHyDwixUqTbxubG983LOTC8LgufVo0F/tK
whm8pOO//fW8zNVKrnSErJVyFm6b9w2ApU9N+XsZpU7ZQDBIXbPN4/fiMUQBDgiUEGbT74MKPMT3
EMrd6m8XDNVL2Vn8FC8sdxlk35m6SIvSN6S8sXS8vNM9eirpBBNg/Q/zpyT8RWDlNNwFATB7FipS
H1IQr3K26XH/J7pySSRXx9t9EoScjc2y8N252GnSX25jXJzbRG2xtKecZwbGI9rRewPdYAcaB83h
78ZPeuFLxreWk6gh20JEl59C+ht1MyozME9NTeBFEGhi/N4ZaZwVxtkO+wUtEZnCTk9/FOyxHDwv
QfYhqwJ1TxDHw/t2Gc64qhUxxHXeP9gOvi5WmgKVO4uWyoWIElK7HJdrzJSr1rvuGHyTzOYWwAq8
CEx4wWFeSqXr7RpcvQO+XIgYzsxibcbVpLGqx+hilwAIH1sbbboBjFJSi5Y0xjYiOn7hWj/VHQH3
DckkLPKH2lT00DE3t7fkvClRMKFN8U7TAN+gUdnblkC5CcZHEDnlFVBSgdNKt3IbDj3cs4/z/U8c
7XAr5B3b9XLYRO5OP/sW6dLEocZLo7GpOgZE0N+7yoh5q1uofjY9E3Hudb7/E61/zrOoev6WnYt1
Pb2jThwBhrRxjZhRaGTM8RaFXEGgGL6lwtPbVRPeUbeYghyTCchp6oqssmR+CZqtXlWMhICq+JEX
7BDM31v2upvS809gef1fFZybQ6S2yEU0krAkSIpHpm4iDRV1RWz4w9Q7JF3d0BezyMkhDuIMQHBj
+PKZBOcxJFb6EXCddaOSIuoacgCt+MXyTuwBC4VEnmfaJY60kDV2YxRlRTXNBxTelZrcpMBRiKIk
NkZGDw3nbXA31AeKWreBlsfwJc9v4sZovj8QsXKGuUhq+IBMwWFa0mkpEdPDklKAMricOV/0TmRk
VPadXdzoR2F+rF1EGuYF4jwYf1xlI7f+zcrn+VImJHgu27MwrQXRt8Uvaw+03Q7ncEPbBkqc1+H7
QsQMvR+BRupaZtEuMB55OGbi8cExuKRcmQ9YUIOTRHl03StSy7LGuVhQH3zyPhmIxG3aZ/gqeEf/
+9Ab0epA5RqUBXEzRtpEtLqKWZ/5rOLQOEpDQK5FcaJ2aAn8OnOCUg9hVc57UC/Jnl54SO/G47ox
7t2moqPyszeXmvZcOXFfu82lFYUn3kJPh1448GyoJIhGaeq+rpLMSncr+p51rvUb6sQGe8TGAhrz
blOZrJuYvlRbX8VzdyfdZ3n7rHE5an9jcq9n0KTFX84OpH24XqoNUUNGZm8UXvEWQXB3bYxt8e58
NNac/g3oab3z7wxv3qFBmtbGRgQgbYz1bkjw7vXL3Nu52bN+qKoXa7eClFYloM/n4vYgp8hSxs7Q
boWP8aKZywWbUgw0rqZ+Ft7MTl500lEBqwxvHlIAzrJ2IicvP4aXJgtdXefPjEFDKJZeBRDrs4dz
bcJMWNkv9qrL7Q5UeTQ0/e9pM3g/zkrtVOdJOKoHttBvQ8aOFKuvT/kf0iQQJHtXB7ro4+MWU89c
CE4wfwgxCGCy9sFr+I3IojHq5Y3MNIyAuGpv5ymdskU1fxS1yM4pa8Mkg6RzIvNZENt6o18ULCxj
piAbVP6iJsdZg57BffM8sJAhpLVp1BgbaQ3e5SCPypFBHi8/kImHwL+po5owZRgM0s3vPgAVQD01
6o1Y2uwmAuJvUGia2tWE25anrMSa6eYygBwCxsWj3963unl8K7aez008Rnj/WjR+7+xvakBOzYfH
eBXiD9MDuF8UEtXGTvaiUyv5BkVOuU3hJGtQI9tRKP765D1+6GQr1A1r6pfw3DKpracgGOiDwfFt
XI/vAJZ+eBaCmfnsonh/a/aQDQxfWcuqtVYEUf0HUoeSSHZEx2u73AvkdlR7FUuqpyS0//MvpPsT
nbm6uYCIQBHQ82fX5Qy5eLF8C9MIRtlsoppboV09gNzxUFETmm7I6NV5YsFNPeGPXVRu7A/ug/Y6
c+g8CWSt1KDy1I3kIv8E8VEfgJH/KYrI2O43wu8gFFnPlQe5Ltx0rnB1UVOJ/igHosnwtCwI1sUw
1vStxvAzIhPWluUv5NMX59n+BEX3+qgcKT4M02E/4vXRru6DMUp4P8Tsq1Wr2+oCM+Ubgd8svmO7
L/+pdDcAEau4T5S8Io9bOJ57bke7hoNXWmxC16CLhmhn2DBGOb/6olrBSIQX7O222kfQI7YLfD0k
VP8+t51Bxu6pZ1XBas80duH90mybzBSWTnRDHrmjEDOszVub1rWFNaxWUStoC6Upz717U0e9J75e
DSshNC+7i5gwNwo0cRUKHcuz2BtIcn0LMX3KQw85i/tld+C+tKKjTa6VZp8ZQu9LOxbzzfzowzv9
0dgKKCZLY/Q6zTlrzT+iF270BrgRRPBAmK+ONLhfTjgM6JiAbC9Q5ExkBpersfneULCTNeb1zdfe
IhPDQtuX8iNE6RP9uaYDZO0Iiv+7dVUEHdTHGAHyRWdJS8GvCW11bYJLoVZ+iaogNUINI5yJrkV3
IJgD3Jwob/MEvyXlf8PyK/YEDZnhTRevs6vHup2Nxdbvh7ZuhSwKqKgd+6+Y7Kx2/6yf0slt0Pl3
b3XHkxx1knVCqAtPX/H9QrmJ87dOzWt5+19A+iki0NXmdRmrIAJzlatoppe8xsna134bkhCHa8mb
fJFeTVlxUjL7DuCDnfSe9uvSLLbdD18sQNhdMbWc9JTU2kZLuHtxxkGFFKIDESko9kl9kZPztOeI
Dy2ke18rhqjsruqzz/3E1lP3CTCTcbLShVhryzZEK4x2h8RqasGTgRy8Kdx2riXuEWwp8Aam8Td9
7FvmsFkgF6Pspi0FpMNf2ltImm2ZV6LqNxrYraVm3r/tyRzzeX1yHV5U9q1d2CZRCWJCOiyqooPz
g6zpzuqSco+73P7mk9Gu+BoqDUATfDWQCB+mmTHVmo3OV9xLgytzRD6lFr6wlIg6VIhTfjbwtb/9
OQfRNg1LItaTPFywdMiccQUwDH7+nZttHsU5yiqUQBgGM+vK709jujoXCBRaIdx0iqNCipFsJrWZ
GoicvUub0IwnG0+j+KdeYZHBDY6i+ghBjl9bwHeLQ8YE/HZZtBhls3vmWKqQ/Xifv/XFDTlmmZlB
HMVU9iUAaU45g0JC5bgkOR0YIyKQRwZRCFma7DerMwVAxcquLvC/ST+W5TdAmOrv7LflmtJIybrl
KnHq9mTF17v8lwyrYXdEmA/dAzEu+pYMlUui3nFCAY38afyfE3puFiQuzVtaNzgzV6ps4xMkfN9F
lWXDulqKP8B3zM8M+5PpTUsvNrOd3ndlFeQKBiw8oO71vYF0Tq50eBT/Zbc6T74X7gIAJytb+Vxk
GDPLkbb7ZLdo/9y+qwoVvKQqe1f1Hj2Yigp30iFWwAlxjqZaQ9UU92EsjUNQRYJClVjstHtDXazi
DhydqZRsuKAfSAbrLsSmvU8IFedD4zdFmLGoLHu8n6PsqfWUUbuIaivMeprdsOfmXn/t7oeZI+tk
Oqpslw7cDCfYK/elzMgCcteCdTt884lD3V41g+YTK6MZ4dYlKhgSMZjIt7qt7vrc6hWEsC5jom1/
irUR2SuqS2oiGl+azYeOBo3vrIHs1WTiaQJsHTq7oDaGh2+mHqTOZZ1c/Rt7aETryw80A2Y+hoYL
OO5GSdFgXn23P36RRgu4gHtIXMjPb8zqH55Zn9uAnGegb51IfMRqy4gBUNdTjq7voxGXplWP6ItH
1iT7tj2VmK4tmd6hC9dJMsImJ6YZQdE10RLxmp9+BzfOrSqagNfFf9JRIDLGjxD3UYp1vUjxLYbt
CL/Mhc5e/NuaYUJP+HhK3C+H3UYt/9GDEAO6S1yQAxpmYfs8EGixkee/cwT8UtMrbQynQxvKv6Ai
dpZzYTO+bNfTWW5GRKKcx0tG8WxGW4OMnr0uMYu7ElZgxQfbmcvyZEOli5UwtHP7lLW1+HuV3UQ8
7UGYmMtpWQ7Yiks15Y7FL42z3FW0QP4n7zunashtW6DFt5uXJyqmxB8jrm1f2ji8D5m+UZPr4EWB
fl030XQ2oro4ePStZqgF51eyRotWJo3yS9NRKsUtRvu9M2Ymb0dqCFMhrJ0ZoUgqhnRYk7ATN2Mj
3PwwIHLrDROFG8UphW/XeEOQoCl3nBZftJi10wP1DBj46RGA1y2Kw16eDAt3dATawZYlE5I2JNuu
UqnMzHC54bI0iyZ+k7dzCRocVEzsZ++18UajxRhiNi6Ez7dd7XimLsASakgP4RFL/UUAcNmpr6v0
7Ep3Xxh0jFudhX00BlO5yZcSUNm+KB2FIEvib9nBnf4U8TvvHPXTcUQcyNu9sfFeMFBkX/1TlTHD
vOnmfPiUAwGcInWadolQzljYKWA9R/jKVJKreQtXMDHgiKbUB4Men+T8flujp5FoEKa1n+JMOwMo
CPwv07gpMiDy6JMYDDDmRQNSJO+Uh6yljlunMFImbZvQbmiHKL+czqwaElzsfONM9tKooAI/5ENi
J/8hUgRwtAXOAdIcNe53Yk3ZH5Xf5R9JOhEGlCmuKZYOetYSq5EThLXiaaH5E4MCD7W8uPN1cPcf
Gd4A8NjZoMendSJhWb/ZRqvINp5uL2ZSychWgffVQ+xKlZMrXd71EabzZC/iXMkkMFIu6CPz04NA
GLa/SzuiY01ggTQ7lzNeM1UqoM6sQ4Ir/g5YHG80SrZeeXghs7wpOV96yDETik91BRxO0hpG4DQw
HED/hn6mV0AiPSCjN1G/oO4sBmqWALNaXZlHvYRKBsGbo5Pg4zDofSZrHQVvCd7Yeh+KRhNONFBG
vLFk66QRS17QtSp8BexW3Qpgku4lGxmsSvs7n2G36FTqzKoODpuIWBkx9B3A4LZCidTeOrj7ipxb
e08FCIEAHo7mMuYtb0tvYX8upvQM9kU7me2uj51FN85g5u7ZdL0WjA4WLLJTKCiknlvlwX8tNLA/
VZngnDgWQR+X0ARqpG/qTy7MZLLJ9T9LX5qKNk1XSw9RCLZuqTx4uHAAaDKYAbfvTPiC7QlzMMBu
Cp7M6oZc58z1B2mM46IDPetHr6f/iGubI18+4JPWtPusbnN+Tgjlm4qpuNQPpfCSVXBGdVRrgQwB
niSCdouK95vxaIqPdCBz5V+YmrjrpwySWr8lABmdAkdRBImuJrpxcIRN32anJjKfTuWLNapHMuAi
PSG1ozEG82Ty2GcpI8nQPRJeOqhhJM2XvdStIomcoC1+N8lzNzdAwqqSqPs0zmPtAAuWNMz2Y7su
WC1psl38nOteUuYEaBdSohH3uCNaxQNBuOg107wsWO6YOEW3nYDDHdupcjosYM5uhtAHVrQHgTZR
Qj7wGqO82xAHx0dPVmAEK4e7514fvlHTcUKvbFqVdNAIemcCG/3bTFQ8Vfnpa3wFIoClXGGdUK19
KOASaOPQFv0jyvSgBRUJLFkh4N4f1F6avMc45zn7C7IgfkSRKXWcmYfI2WIZbCgrXm2LAMBnDs2p
WDpKUlWl0EtM5YmeEL8MZ9HHgEKOent11oYevjNEBfFlXaZx7Dw8VEj3L7h6T6lKxRWfNxvV0PD7
CEFW6czjIzECsFIaSoGK/vCnciNXNspjb5WYSRLB88VPnCEP47Y66wT/1wTRszYW3GspfAyxmzfq
A0lLS7FLwWgFVXIVR/NRSbAh6uT6JlRL3LHYL7E+i169vu0QhhRg8StMFoLQYwkTbXagu6hwtPP7
1mNI9pvGRm2j67hVwILkmhSjbNZpZpOBD0FmWsAHDzTtjridtMDpBQuurtCCxvEKB9p/gsodqRdO
M3Ehh+NNB+tWH2Y1Dw/+MtXNTtpLblR9wpwoutpWzSUcGYbXQggBDqN9kyRn1CPn0yu1aJ9o4Fr0
SOYX2ArWAGFsvyvgLue5Exk26fKipBk/L9dlDjo3gBUjqTIO0c2G8Vtt3m9pa6xKLZfyJemYslbc
Ca0Q+utWieYL966aVPOH36ZHt5dchB91MU7UwXNctp0KpGpahKijGRgGnVSYoMeA/pj4ZueXMzmu
63L2MBmcif+dYhltX+vUXgNIBRm0iEpB9kyWsKDgu8TMf/kXipG+RfX8e6T4A7/6/XsZXTAtihUp
kcfh2EISXNTlJ9vXRY7ErZRta25STgHiLMCrIy3qk97XTMShJKQSBTarXkZT8VRMnvU6TYaGXcWp
6DJB8+5oI2DeDwyI5Jnu1Nizbtnw/t1BPjpBvPU4kSFpwXWykrhneP7dPCItBsQobg3V6ScQKY9k
rJc/Yiprp3neJ2SSwkad46PXTfoDaALi+K8JHbAAxvBMCrrRSEHaXiUpWkaY8xIqWWPWJhBA9TFa
q5TT+H6dhmtqxQKt79kIFdEY64riZalYOv3tO4T7D1CBLex7ok9m/hFQfVyS1k5FlY+86heti+c5
NV3i+iOsXwQx2nS7RMUOafSSDksKGpq11C+viXos+siaU+uVCIbnw72bCCZ7VEf4vsFEUcyhKcg8
dxKaVuCC6yFK6jRygef3Id0kqAz9tv58zRGj9Ki/MxdZ9fjfME43XZywa1B/Q/A5r0FEKsGQtfw3
OWFBhFF+2CrLFlF6QTRQ1zMPzLnUixN+dgZxrdi9Cfv3uWE8hSN7hy89oSdyKvt36nwCYfJoNESp
rVBtbQzE+jlTOyaHwqy3MyXp19XvihIyjBlX6e6nUyir/42MFweXIAjCYhUQAkMZ+C+EPvNcISw8
LvXCVk7b6+e3I3/TXlnhp6zU64k79cl3CWuvgsYh7UhULtXhJxCfjzopGVej9rtV8GOQgRXagqs7
iKHYeuRJzS2NupwrkuV1rOSlGefeMP4po2HmHd0MH8rsd8K0PijwJhDm+G4nsJahs79/mBmqiaqq
qlT/zpUzeA6VOS6oaNyR/T0sODZ+ZQAbhFI6hYvK/Mj29njQGHuoCZ1Uppiw1RCdU6bsaEHx0iAg
2VKZVDclVW/17Eqz2QDmEIj/Qa/I8UOkNADNJWlOC0KbKbpLHh97uU4kSYSs6BmOkwds93o5NGP6
NYl/4OfkJQQQ2f7GEEhh5QiW9nMYbkLAkS9y/kFd05YasMvdgGjOGowCNB3ntOpNyGcImxO6sG4i
sjZj1tCpBcfQ23YEKpz5yLLK6Eqye8uLyui3T3vAJRk0139phh1K3qe9dyzhQiHjJ6E4yzUFajxf
wpkvTPH7W4mSpACSTCIYda8FfBrg9dmfua4vwy03gdA07a57ESYLqxLVEvJUVulGl3YqReFw9FWo
jx9McOlIbYXD/ntuZKFkp3H529yE/fM3FUOK/2qpfK9z2jtd6ZiklFHKJb4EnFeUQZ+lhQrk13aH
t6nPQsox6pyavn5sqef2BH0omuokh2JDoDbZr/OgmGs9ng9ZcsouVZ0Ib1jRApiVIn9dgBwyI9Y7
BAldRf+rTS48mQ2xNTdfWlZ0M6HksKN0oHLPKN9GXBDdIY/kIOBYQze0LshjFhYrctoMNm/Fo+Df
MsrGdGW0V9liZgzN4E2fuXDG32zUl+VeXQECLwH5Xwplh9AqYUoFPiEA8895G20gCxdzDF4qPjeh
s8ni8Ph6p298k68jUZ3Xm/WZxkI7OW6hqIAR3bux2TtPJNoqtHVoFNIfTXeOiqBeFcMWirrB2bZM
cCLDDltXqKeJccUemz2+ngCQwHYj/COY6I+DHCa5iDtDDufqIMKIUSnK40gRX/BVKnYDkZkTgYwv
pWwem+A1wFepzrIgkaq2qRtytTVaCJNWrYdDT4zz0spVu2yKQJGHsYc30ykJ/Aqnf6PdP1JAjVNC
tUrX4y/igsuLh6SNgxUzr6oC1xvBPnFFwC+M6dBy9ZVwugN1zlucXmtwn9wi/0ljBXcOBtyQgs0t
5EYEWMPaErNXbt95rV1+Hfk9Eb1R6/eTlii2LnqAofJbDFkEpLua6H+ixGXOsl3UWM3GSfgLy7Id
7/mFrsMoZS59cbY4lWqcgp2zAwqAWBI0l8KR0j9daIc4+onI+ijBt24DOdIFOU4h01HkH2bLdBBw
PiMQcnDwsiA1Doicqa4I/d/cSD0DjXzPOjvHr3MezmHEInJiLX0Mxa83+MZNZfpUwAyIEtTK57dF
QEdz2/9VLKxyd/urhTFcSxp/jhfKTZSBncCId0jFC2yGzQTfijLRcjpUNe8UdS6UlFJR3g5ypn3/
IdOe02fuAim3eQOpic0ZbN4QwV6W05Y/RI+1Xys1rk+Ot6AIK8WC8cincHMNNvmzfjlpSMIhnhbV
NTAUfZ/aHK3nWAWxYp1V4+RqdHi35H0S1R1NHq8L3CZ9LbU6O15LurB0rXnk7ky8Jp2eKs8efwK5
sGucK9gkFTTBgSyDylX9SmoCCLMssb1iJmssz18fUy9ZWccLIQ9MznehYbQR3A0G08mr0kClX7Gw
ybroiFXFx/iyK5W/aLakc0HRM5VdkwclrXtdiKkDYq9Kx+M77Ofvsgvt2qJSrrUwmPTfxYfir3jT
crkr0iobxn9ZnUYucZOhwc9RAsxotBtb2Q3UwR/4vztEVj515mJGWIwzCMnYDcLyso0kyNkwZH9E
iA4kp1j1zf5zLIy62yFc4Tzs4iLGL0YjV9RN0E48H/n/J4Ju6pq7XB2DKB64sv2m4XaZxPq5DYED
iIoOX/1GGoGbx5SHOgBTl7mVBoydDi89udEK4aKeshavMBxAAYVJAiqYPoPE5IuoPzKdc/V2IwXs
ZC1+9Jm++KF+/3xJ2fttYdt/xNbZJ7En9XzhMfsy7z5ujReQxiD9DX7K8B2vWaqI2Bip1u6BRxr3
HFmExxBZ5omg8nrhMS+qMl+ufvArOhaqn1cHuEFgQUHQP8gZjpo1e76ALyiZcr899jCeZn0E0Pzh
dBrXDz2Twg+Qq9SSvWDXlqNdZWMpQpWpLlOwFapGhBChSErs7PPiShGJTqeWh8fY0+t75ZusTWct
tcgW+0JyPZePvJkGycaIW17Zyb0tEfKxn1sf6tL1dqB0gDk6HRDjltPyRKvo1N40gAilDVhr86Es
ZigXH3HianHiRPVjPrVu0vx0IZ0M/yG3TCd0IbL/MrWLE5vzJDaWjhT/yXoL0GW8pJy7EEpblxeJ
imAq2a+3B17xz+8oqNAMqn0Ma0TMWdIZ6lXOwEQOsWl8eJgb9KD5jOOd76eHPi8RnmAT4Fc6oYUv
ZsspOd0Uog5KoxQLMSipFxYNkc/njpw+p6SKDctVRP2ZnrHZpgpn7YXAuA7UP0acR7RsfhtFzjTZ
VgeXSi98C/CfjOm8DbPXKfIJzWz1tyGOwb0bFgDlZh+33viVVRPt1SXaJhtFqwGhQmijze3eyu5+
tlvHjewRZCV7tttGIOqvvQ28hzeaJn+9p4m9N242BbbzsNdLjswt3nHp3vDfIYUjSuQC+jU4mvZN
skJRUOHwelw7ppU4CAO8sOT9wzM7hkfcP0+8wkY9zGzksLxBh2VfwbFz11NE6wZuHmM5Y/Nb3GU1
uZsX3AkP7jqRdUMFFuBoPywZJfl1e8r/fcgY1ZPvrjHxxgGetDSy7GuINSKIyE8mOPAGRtzZ1yUm
n0WP7LUWGiR3Ksw3x9gsNXjetUf/PYaRKpAKKG134YOe22H7bSA0WbfmMilo6NlyHXYZKyPEfpwq
23f6SmssbzfxK7TQ8kT3l8RWjMf0pWB9jsoYFANuNul8D+Ph+YPmzshgoOwWzE9REhdtaSKjOThL
Z1Z7j+t1eiQfNUWg0HxKDu6u4tRjOBFGhJmFOhdqR8sGlmhmX0PdbrfmJGW7HF1a7meb/XDtXyNq
7EZUvleft9gFc9Vh8XbOKpOrQS4V7MxTTUfF/z+KK1nKTE2vvTen/hwnMyLR2YFXloEwBU7ii5Vo
tJKdldcebF0/SiU7FkVcCKK3ODVuZcKVR0VgbT6bO8l30lYOQIsElhQySEkpMKNaeGHoQIye0nAt
gAJKEukAiLaI7YjD2xp9s1GpbKWGo/aMiCjSV3XNmnMYrrYznENu+4r6e56zW3vFkjJpTHFtpRNZ
BdXxQK/dIDUlg4C4MB3eyBUH9LoRiyNXo7dFbYUC5pOzCIKdoP3o1CHFan+CmzaIh6vJV/MMsMSx
OUq/Fc0VAXK8R2+pfkBvvCT/dxee9XISJELRJ6Tlqn/YGSOxbqiEgo3iWwt93JaKlRNad/KV2VbS
ilnQyv9meknr+oPsTqf4EecEXZSho/X6XWJ0u1tyld7oVTW285mEh+ceETNpCrpAZLZtXw6nxrXq
mkPEC8Y/valBlqSk0CkYgSLGTfPHA7c5bH/hG7SZsS0Woqp+yY89HRnnx5EadajY0VTaBtQ0a8b9
1zP/MDVsq4uOybmuFRIU3wxnga/+nL2eOKpPYZaxpcD9oYuXuyEpusCATMr3lXVVQfb+wrWxDsob
b5lwYAnzOo8s1Wl1Bup8H+z+i3MXcGYcWTsObyywLzxqO6O/gth/eKi21f/BCinNJn0jcWHUcEGu
IujfUaNgHvitanqIwDtLd6GOPPhmHUwbLxIsVDE7+U344guq2nSRz3DM2vvwC5IyCF5PT0oYgCjR
+v05fEb8zouboXwx2iezJRsrl5KVDbL32UPpNmZ8oEhkkf4oXn/T8ASTsS6PWFxZCRPieqGh2JOt
l3sx7nvNe2pZX+fihGKcwwgTn0n2TEPwG9rU2VQ7dIO7FwQ0kFWm1LbuMlg51D+rwM+FzM8QpQdW
z6+ZKZ+KppC8CZlHduqHFvQZ1HZyq6Sj3HIVLwXFcjIo8TFZhHEiC7trvRtAQS8B4XJtL0TztmM7
+8yi1LiUkSPLnivL4AqSpjmzAriNE7Xx8t1r9iPWGp9ubiqg78EzkeUAd1FbAbJAhjNdgZnlUEdr
SmooLQBSAAyXQwTU+rGsGon2gB21oRvWoj9eDwmENO7QkZHR7/TFkIRMveu8Ccmp3zsK28iFF3cN
Rr19lE/g39tiWcWAnlbtOXH+5rLoTO7n6CWBmo99Zwg+bObf61zWoQ3FdwglOl2gyNPh0Tjs9ija
n0270nDB/BG6HV+Pi/Qbz2es9N24/xAsGT0ubc3MXA2p6wPjvDBlEjOwqRfw6kJX8BTawvwb7IAF
berl6l63vw/Nt9W+UP7mdvuqVeHSLmCKC5pY7zQyn2MOWQphKRUV8xCdR4+tdGWr5P8c18Z5Gi7U
Z3ul74IlTSo7oZo2bwpY6xu2SWlA33OfS1KgycSlZKCMmy2LFUry1wLwdUoosiCvS8uSacYU0OQN
zUUmqQJGvK3EEhG0JCCWkMK9dU1MV/hoUosaV7+BbIghPPtpObZ5YPyZCfXupyU3NvVxa9MuSowB
z2vgLay3nft2ndwpreEceCZ0kzk5CW5dGsmumL07+JgBcVI+j7gTG8YImDn9fIxFekfGBFcI5y2r
ICRrjMLPkjdrQF3x3QdRWWwD9rEG+J0NC2fKGVIKuJdwqRsxM93U2m0JCLDaSBtaPm0jJmG02d21
mcSMxylh35Nvq2qOmH8RbL2y+mf6I2MYA3tqOECSKAsM6kFAPtD46G9nFS4kyOPimzLqIMZBvrl6
mKXDHLiqDtYquCCS1IBwKHCHPjhgIbJ9vcCQbC3Pm4gREPMSWj0IOXmCVCizJINfz7mdNPmmfYfd
pTL5nwY0QIzHC0NSNENGRXTdnme3fuz9YeBTKRRgBBYZlmZjaYBv6hXMWuuXbSvKL65hJeDWHi++
wIL10T2qqxIIzmGkG+SGUjayyS+H2HFbO/Y5u9qhQc0PkFwBJNi9OJZ8CzVYG7h5YMNPZOeP7M6C
jaywfC2c0rMgabvmG6pRCEKB8PrilOKao/dIo7sznLPwjieZeBZnx1Y/wkWzSrgYcKFQwLiE3hjp
8LzgN0FGKTAjhPEOzC98lEut58w6yd19rJim6iwmct3hflGDm3FGBPOZfCUHszH+hS5JhPaXmMry
E33ohDFx6bi9Ua+8qWJpGQTmZnWavb6HCQfFgTIZ1rjjVTrl9r23tBlE6UH1BkCylet+CNbu+yGW
MWJa9Tzxn+rxIwSKUYqaPzUMZFcd7e2ZM7k8EppVftn2/rVlrXM97ArSD8UJPnjbDIXgzSX7nhMr
MVIzC0EJqKfDSGbtZ59ULj/V4eMIaoivoJ4VlyGaErP9a8E1nsal5675LQHVDR+QciRMuBvewVeI
o0F/tf9eV+l6AbU8xgHZizFn9qMTzMS7CRleXxyseAU3GuFy2bMEUoZxhe4sQveOQz0To8CLquiC
6pvE722xHSP5yxK0ClHzFXJfzGzfyTJIty16zGEvmpBbvJeLw2M+YO23xHTUqcJ6COWbPDT8mfkQ
OjYT+bGjDmLYWtwEMEpre1WTmz5OUiJp3s1uk2+2yc1+CzARGeUtlDsFbO1TYcaMwCT2reSLTAMU
nyJ8j4hyB5LlV+1fwOPSjzEL3a6yHDouA13ihSv0pRZBfd9yd7TZW2xa5Vc2Y1D4CmFmnDF2T9ow
i+oEmSf//L8Ifx7XtXKZkA84ZtZNpOLFwVNWeQdZqgHF+tklwLoQKG12OFsValONBqHJhg6pFIQf
B2aF62+4xB2qMJ8ima78i2QwoDrIZZYcXBz2iNuC/oY0fMNsJnOp0UqvmQvSG8yCdsqJUwnoZZfP
LTbOm4YjMAbK3+ZcpG2Rq7DFIfqZFbAQ0gc1TfYoCX5dY4ASOuiRpBGcAULAQorAO6S9OPv9xYQE
u8PSt227Z0zuDTtfy4r9WiD64lrujlj0srAt2luGMCSBPUkHjx7iqJJWKdWDGcZNaFtN+hhE4CG5
Rycmg1wMDbKXLWZCecgaadMJIU+ZsGIemgX4E+Tv1KoWf5DkxxYBzovt16bYsuxn6dchdFmygfso
MJn6FLfYO3rr5SnFwrhQjIBr4X4AXgr8v+AMCKuaKOw3TOW3GFlHJfRHzIl2D1FcauRPaIInHVJg
s4EEHjhEk3lsco5X+F+g5ChUI6YUgATH9aKBU7B2SbmnsUi2fDv/y3V676m8IEBo8Ql486Exeqat
EtlnWY6rs2rqJGJu8P1dbmSee6cB/OtAKQD62yyPVvnFTFYiTxWiVxaARN8p0o8kk1IrsgmocMaq
ZdqlRuQqt8MZfIBijuKUN7nc8Lq8s6erZGC0PQLBO/Hr75lIudY9vB4dVt7/NcBYHPOf0iqOc8II
kUpqe6sBJZN2cXhlj1zTX51+vjW/A5Wf4R041ZjbEY1x8FBZNkT5b+Bicq0HA+/lt+GYHka8Gmf3
Yl6Tjbf9JZFf1D92y6ir8nzfZTvBCNZ9aJZQgV7+XKjoczk1zUkX1alva37Iu+Qf40i/sZK5UaGl
EYY7Efyowe/2pc4kxoTUG8FCr2IS8ZrbzNS0skj+qHda/VDLsASE5J4wArrw48vTUaklbXlzg9bF
ZLbk7JBYC+9nD2yRRSZaKJfJb/m59/Dl4lkVINIKfXoMqdoffLdbP4sRmUoNfVWVTGecls9GLLca
i3aj10PLQV+YeOWp5HF92awwphocralhhvM06OaRe2mvWU0zi0wtcAAsw6xbZ7/5+ULFF8nPnmz2
avcyPgkH9iDnXbn3k4MLamGhdNfsZQU2KkxHakx89lXCDiD8fNljs0lcjylgDdtVIKkjU+AyfcxY
J2KC9Cru5fhkD96pS6dYX46ROseYQZFCEepH0s4TK489Kkv1P/PHinxPBoBrNGZmQ5kl24eW7MZP
jQ2s01SNgzbEDsE0JSQMLIR1Nv223GlLBXzj+Fps9ZGS54os/iC8gYCLrXAhuSWCJUU3bFQEKkUK
r7AD37rq4ugQTylSE6wXuTA5ENOV5HUXIG2gG/jYiDRXm95st+Nt4ceo3YGlOll4lNWcKpZfM7u3
DcJg0NmHU+9EaQDU6Cb8ELMdFkmyeOjGQTKQM2f1ByR92XrGJxbRivoW6ZUGPHmgT01zdhAG11Vs
V1bkrEugPoyhkYfEGPM/RGodY9A5P6PfuuKWJilYsL0lfm+mfM9pULFbrAV8refmJ1LO9Mhm252a
bABQE4y6GYq2lKIahsIJj3wRA05UkR38GvfIJEh/AjrQ7LUbU7ipR1Yowmzl5g+nXyEzqNIIGCE2
O+qb3qxko1cLNuaevgvchluZPYLRRk0bPJ4N6uQ4PJcsiSh6LjHD7X+EQdsOz40w7PchQE0weaY6
N2+8zhh4h647aaE3hvR1p0FdlPw+zTyhjIsUoH++8ZFiYdvJ0Opo5R9IiIWoOCM8XVRZiE3A0eKy
QeiGy9FpFAwpwDhIQykOuv4gaEZPchLOqNjmMFL3mYbM5x4Zo5aVzNBhckDV9Dox6E2i7xPjsSJu
lEVNU6dKSwrs80qYQWLBlpz6fozU/D/2idUkCEwM91PQsHNwdGQw+2yAohwlKt46kL9zlb/hn7f8
8Gcqip7M7KhQ1y4/71qlION6L5ZbOaAkx4n+dBfcYrBfZtp60eRoK7w1TQOCGYzCei6HsqSp0ih+
pRTaC1R+N9FL1dp/Dnu+/UX/b3kkFS0FEwbpMDTEi0JozkZw4wJUSBXW4iW/2pPRhg1FfJK9b6L2
ft2d8U6L+eEqmveQ9alV0Q1NuQSJQt1x+Z97OntrUsa4dQ5Jj0eld54dJxs4RcFkNccsqVeSwFhM
36U0UJ2RXLWXUDsk8r6CY3ZtyhE4FPuwDLB5CzzoAb5mAVSnSGrQmo13CDOXxDUlc7vXJ0xHWWNa
ZzZTo3b/5dinADC9MVUqjz9X689QTeORABh1TxgGNgnGofA2aCmeyHL+eB6KfYqXDgCwQ2dgJUIp
74AYMoDOaxa9mIO0r1spLOGISt71Nbk1Miw2wv8Ba+GP1RgqBGA7ma4qGfcZlxaGH4QjH8gWNlrm
dN5f/DcUUMTEKwu54Se8pAmMdk1LNdJa1w7Ht5qA5ycukWuo7/8sh6aplC8oTiaoasjcwVNv9fBG
VT+vUv9F4YePOWpLOzDdYhdewYaEW2VwVzHfptP5FHCkKzW+Pzn/tBr/5hmTLoLDP2iFcTygJPtT
zmMQR/M9QhuhBX/rsxGbBtYTOA56citRx7tAsAUnSgN0UZY8q1ktORlpEY+kGzap8aZGXmWfCPZI
FJU88ByGSbYulPRQgFbi3czboTFVX+jXxAUfu8EV5Da3F0p5GJPI7sjrb3NJaVNTj5qV4vvFn49X
XPK/u2XGDJBfKtRTmIVdKJzheq3GbVLZPd3PUk5cuprbos/GfdcMIhD0CA1NYqBlYsyZKsDQzbEj
L6SPTry6CHEFzklpf/QvDFi3z+PZLXM4930udOcUeeQw1dUm8nrN/E9aO4UAq6c3vEyDtYdWuAkD
JAJA5wvc8Y0yQxV0Znf//Ql/Js7dBpVA/paypYW9fgwlv6s9caAgI1RV9IiI3+RK/71GKJAIHWN1
23aMh1hxM7Wd+7N+26Ij2fGaKycNkIFZENIjUlKkgFphLEd6FH4v6GWTxSrpxBUXDUKomVVOzCeu
0y6FR5a+xgL/tG+dvwk5eMg6ssgfw+AJRlWtDSukcyG8VaWvdTmZmwLoAZtYOFhVpZzj73V2MBJo
xbRSNvffxUMi7wDiuasKA9xBOsgN1CWyX1UTR0ROGIz9Q+GDCs0Jnq0WZTHK5Oujuv8Q05+z3/yl
Uiyo++LuXCRxQL/M/5EcmdF6QpHCwKSGSUIUnODYDSGF3107FI1+IFR0P2YdyV+gQYXRjJG0qkoM
RTzSmS1yFhknkzwU+Lm9Vcvcs7fwsYRQjA6N9m9BE9mXj+h8ZCTBUXzrdrj8uKMZJQxhwql9+XHG
WOo3iDziUfFdogKZ8hKGrEApfGG2EgvjThAbVEDSPgTurnN4NBqGeAOZhe1aA1nKvYgpC1Q9K9pu
4wi+ZzkdCC71P6PuwX/iU8ZQ/hUV8KZp+fAjHZo9kETHMWNfr1CN8iD7E4VyDEtov+KSfpW2MMjM
cG57CF+Dx5m4vTbc3D/GzR6r3PrCNV223N+FcqynHr4ZEilSYMhCc/C9qyr6mOKNstzt8vDo1Kyn
tqguYm5iJ56YI3xfs3tJK+7+j8HP9h0lUaLaGZxy76o+5BVKP+RgqAhj5bMQPNMso1Z3DqoKKSrw
jEIrXn5+LlHJX+0K93HaIPdXFqR1+xXRHZtKxi6IQXD7RKArAPUj+6LHera9qrAwAzWOSzwHLo7Q
C+k0cduyaCrGZY85E9B3lI6sOocf6Wq8Cu9okZM16DLGOIHCXJkOzUA13BaQnN5TlHORTm3KyHAC
/2h7S5RtmWNmnJWVDh1ZF5DSwffKWISuJ7rGGjWaBNxYjAe949YlFHm8bV7CPqFl/vBtTAn9bgQM
PTVqlPxjDXsS1UzB9K3FrnFdFF4sx+1TYSPh+BC9IQa6quSc5UHLuaN6oKVIIYy7J1YE226WE1UI
d9x3t4EHz1GOMtidN43jbNDiUJuOUwUgOSx2B3c13kxJBBCuoI8Jy6pZm6090WLXyksv0coQqAxy
ZNVUjtc9md9DIlt2dUrlo3NoUgPpEl2yR+KTzHUKcOhaUjRZVmVednekQ27SyuiN0/rQtvVVZKp0
lm9uyE2WvnpEybFeOwYI6K8Ywf9+cLd4qjDwjZbhxTIGlI2VR4f4aVIzTMgbBC+qvUKmrLM8xVjB
YOKrZlnqo3XBSKVql7UMcs6OSzKh+/P8Jq0uzqs0ymhZGC6lluELLl0/BvoMWGAFNKoN5l+W0UgI
EW5PfVuaMJwyAYWgPyaFtw5c0A22okXvJIxfSH/yLj169MBHggqEQasNN/dvA+Cn1fAqIujN8iBT
AzAvqACl+G5kT4V1wZsyueJw72CQYFTfzTgVpKYDVXlMTar05oHLZYfoKyjt21Wm5CXJDKOK6BGz
ob+bsq2aazc/igN4m/behBRWmPFHYxhhkyqJa44RbL0mPMLODlADyoqV62J7BucJ0GSH95IyvCMj
Exg7Vn8KGdk0z1NIYj3Jnf5qZBQe0jkl+o8yITm9lReoPd1hprWjVAm+qjwgqyuke3bqdQyyrzAM
RBluIOPDwmNgAxi5RnYhKvwp7nlBzf1+fVqoOPlv8UBH6MSTPDoEYGhY7w4WH0Q7FCc5mx10a98D
kfhRUY4THARQ0bsNCQ2hvYgB4aEoq5v2ujCezgjgIUoTPtXMh0vNsRymwU93jpMz6FUcJdprmQAH
wioqxhf3PBcFoRtm97qh3UJWPfD+EOxPHPKeLsuhlkalL/YI85Slc2vkTWTnI/poQP9ZVIiaUwC5
Wf3M4SAgdAfC/ILTNfEQayY1jYpEiqo5WH4mwvjnV/6Br5rZ1D/8ImjZe5BJQPD3p7008id8ByGa
5/bKgsRLtPIHDMaHxz/jrvcDg/hFor8P1mIIKUh93kCytZtDSdKoFNVFzVet6yhLZ0W76sJB3l0Z
VtUwnkQuWw/fg3NGBTs+Uu+cOzOIWuq2zFms1KOKF7vrKxvrwWPVMtm3A4IwFoSpJnygBo83/jGb
n8hjuLAPXGd+8j7NYCY3srhDRxeudSlLjk8vjQeRJGQPHN+5jukXoYRYmVpOV8V/XvP1/TVCDERT
T6E2/0fiH385J14936+eB9i7Wi32y1m9U8bEg6BBtEc8d6ut+TtLphJE6MPjW/x0s2cjEo57knVf
p0EBpqQcnGkLJpkt2Fy9JSmWtKPzRRfpZBWFl3sN1IvDVef9t+cr+Nq0TkUaKNa+stdurrHyaEjm
jCv8tAgIaBOZIMEy6nMvK4AV4k75QxHoaIVCl0OQMOmtvLqSHduWnTGFqfxbUOX5wmMxxpsz9tKn
gmBFRY5n0VJ/GLlBTK9nYbftHcQRIWQJ0HU7kSmHxxSK+UsPm119q2xRKLjnHB4f06jJY5dIubat
eTfVMjK0WL52p0rZ+tocTG/uL7dTqbB6qRvljyIsc3DGhEl35v24zfer6etM5UY+96Tx8Ezr4Qcf
im6SYjlwsVx9UoSSfa9km9S28G2n0J9WwOBkQmHX/7t+nEZBYYFbplqW3K0nizMV/8qVoSevf/va
1zwzfpkarJCJ1dLClpMmbmljMDlGS+TlboLd1SCK2btsnR2dwn0UlIyfz4mKb2foY05SAQkgfkrz
lziOb1PGprvBrNTj/8hZiGpyMUp0wE++6tbq6azGE2xHpx3oxgm9Z3GF2ZW8ywNF49DuaorFyU86
nv7ddJVil+31zbb2YaeKg3AdJG2XT1Mn1CKuLaTYCNLF2sChEVSAx/pBZMDNohrrUgNsIuYm32vN
xl6uMJ60cCEKTaVGRDoJqnFAmCEP5Iv5RyrWPRPrz+FqIewaiIPg61o3QSe6KyL3//4UZsNizhrA
2++Y7g4s5bec9H0LdPsSJnK2U5RMveooG9lgqGEwQ7OoEE3rIV0qLWQX6Z/vSAwjEk1CqHZGVugz
XXTKR3tjEC88ldhj1N+FX0JTK9Chw76IpQbg0YES+OGf5s/+U7iHKwbVEp9KTeRt5DuEk13HfPuh
KGiZ2PxFMXBwdLyf47qZ0i199QOWQt+lrSjWDVqrNZKY7ytDRQgsUM6ZlD7VP8cycY/hHwys3xc3
I4zzQI7ZjdFtZbzopCzWjuMNkHSHGLWDMakP3veJUKtkwjDQ+tTRBMEGKdhAKBLefXwmGRV0ytrv
9GXUhYA676FYyxCCsIvSqXo7mMrGRUXSUGSpcb42meUycB7Zhfr7tWu0B3XwBZ9froSuadUmQSPt
ZHtKMVU+cS3I+evT2a0UmxmrVno4n+9OtiL8EGeh6I92yxmx8hPXDNvXfP0pEl2HztSqlGtXBpP8
emz03gjDwex2yeFptVJwbulqhs2B7F6Qey86othBYAiMn6jc+WdSYEjilvGcka0NWijl/JZWuREa
CqC1wM/pQ9QG7G7YTMRBv5rwUNqat+p7OJXCpSPTwe2p1edfWzJHTaEuClUAQDdOFQ8kdDPMbz6v
lHPzcN+DiLx2f6fksMU35CSTdDAiZmlQ/JJUKxcPOhRoD5Dxy6qbtdo8bp5JqUpMt6UiId262s9O
G7EDxwr0GwnPBQFr0wo82KK2MrEn6B7JpUXLI7cGpyzZtX+jrQmpUiEp+HmD48IrsCDd4Qw3Rgr0
MJQ1iDvQ4Bp484fcF7rLr+0R49u0kyMpVxDmCvsV0yw9/QSFxkCb3PtS+7zj5zo5Rha9P0oVgDXr
3ltOxTKkgYPP/zwFCPHgFMzs+KoDNird+OjXqMZSkCxvTsa7u2lxlvN0+9xJXFx8/uTtjY8P1F74
+Fv9hoQmS0zFqlHBD4KNTCr+4/VuL+bDuFcSAkN7S85oZAVBT9seeDK1/NRzY1CFYhrfO374PHPT
0++zo7/t4rr+OF7y3/Tx7+lfh2HxsVUdPhkLdFLgNAivJFu/1qLkcw6e7WS1OezzeXjvBmPoGgYK
Gco/T9TO7sGS+g5821O1VWIqeFgUAfCCsiMK8A/x917RtpDWHS/UXIaLwhf3I5FATd7EtVyYKSL9
d27XRDAUM5RhqcW3+4Rt+iAHq6ldsihh5G7qVuDVx05fb2Zvv3kjFyUkxxJ76+qCGEs31qSfD35r
x/jkiKa8OG2B9k/2cpbr6p24IQ6NnSm5Y7ydHkfBhTcNr9KpR4epFXqfeNjdj+e30NHbZyx+xxat
FyMEoMl/A3ZP7I5EYaH0bqFuPhCi0vHk2yHUqzDpq4amCcmoYdvFNLdmGsz8e7uHwjyNqtXdVFZw
v6GRdVCq7vQTYy6tVVHVOtfaKZmDrkrsiljzNSsQA2Oq1whnijTHKP7Y85OWeyC63+ozEUtq2RBc
5+XP6GRFyFzzONNFgoc3IdDMxbd6ktA/fuK8N1kvt5BKzX99DfeSQQfjVWWUcU67WG7JwthLR1PH
p71WUW+9wD1P5zOPBhQrepLBWb4CPaEmPhQmCqHSrgCgziamiEI0ErQ7tRaFHXeYFWxRPesvNnBa
uLdvEKQjRWy98WtUYsL//FJghlG8uxvi52NzuAAcjD++ZNB5TEtJFTs0pY3zuU7mLB5XkUMgiGqx
ZuAm0CQqp2lVMl/iOwLDI/gmtZvwAMkSWpBWX6BlD2tM8ThMuPQsPHkP27moID3QK0br+av4yQOv
jDfUhpmcB2ekBG5H9McYYJ5taqhraXBlzZdJ5R6h+9useM/37YFHoAayANzYHg8Td9NOqweAExhx
hNAdNz4i18hvwEpGZqmW83QTTR4t618s+K1OTUPR8mHjjGQ2cGV2EtReCqPHzE0V6UKYq2xRpg8J
W5Bvn67QUhVv/9v8SdMF00OjDH7aKuqSDTahr0txq6L8ZBS/OQww6jf/BnZmi9woXOQsLajfoswN
6k/SQ/SOwVHHsUcIj4wNLDWzD+ZptMyQbkDnREBH0lCr+pLXZTB9OvYf8eP42X4oLcasjNl+Nv5C
1+WTBLga2gJjB9x+iiBoqle3c/yT4YRwn7/5pJSEDsd9eAQtmxzGgLlJwy+6JOOBzeLmFv0AJu2g
IE2h0pwZ/RgcEjsF6uSqsE/3MjyAt0G5tbSdx+9tPygvfX2BeRWInKNT6d6U+RpPeHajeoDZhZrd
qD65w4iTOvuntHziCj1Bf/NCXU5Ax0qAncuY0KQW2DIQIPXEqjqxDksQRs1C7pf/tZRXVtNOS3H1
M4cYnoX9wX+cWYeq31nOfhDY5LLtnOSyCTksZWEh0PQgtQzll+RCteLrb5ae1amtwi5EhKp2Oi6O
rOH5U/9+QJNJ6K7uZT/2TYBnAMYX5SHsFsi/IwVVOkgL8uH/wu3uRIDUT3dmki5RC5vtR1BYlWES
nThJmelGt9bH+8TmQPW63sp/SEbVN2694fS2EPwp62Hvcqmx2S9AMi+mVbg1QBWNlAYSnNWTIFqZ
MXYq3fhCeUJZsQfNsxqetuzkVxMJm7laZ9nZEjY+7KzmGWxVWO7NRM0ZpcwEjW15rW1L35R6sAkr
jrw7SU0pmemEiLZLxPOqPK0xIXRdRH412bstFXjEzH1kfCjzEM8kr8VqufLz3zw/gG4IhUy4Agj7
388IVvZfHjPE5JS+19OlRx9qYRTMnnEGvZPYscXReESjnDGQAnqGVGmRAPNQ+lM1I/KbdVK40Lxk
f3R8qznLyuqwFfoFB4VOORUEs767QtAXbgyxhhtRU2KBKqMm1bBVyVxo8EOeUSIIFkrfZsUv+sMR
Kp61w4oHUW4G3QaExqWRM3XgW3OSw785LZpO+bugNZXJaZ3qElrCma5zZMaFrMUpmA1nHLQHKCj3
6pFYVqsY2k+EzFol9Y+QA6d/KShip1NGbSP/8AAuO6vuVaNRFtDjNxEKhPmhAPsk9wK8BnQyjbGZ
7ueBKxT+1+KexqECeKRjUqEGVslN+IgnJZ3FeJidGJyDvKQkakv5Y3JK5uTCtczl/AWn1KSV1h1P
hXMG8vCpkuFcfc1DT/yyuL5T8QSM+RnGI1FUlm6n9p5VSVzQJ8wKN9FYJaETantCxl9fYJOhFlXL
DKucdS4viCInxUB0Q/eduNk/OTY8SUc6XEb1e6QUjJL/6c7Ph4WoLdmRXpcjpPfZ4tXJ+q3yXc5s
zei44gHmSpxHIfbkEYOEZLGMvWn1akQCH7P2czAFGM8fcHQ37QtceA9YN7OpIX2eONa2N3EaYQS7
h5zBnUk8W0HXboypCHGFtM8y9BFoAxn+qanXx4ZBPx07HVfRPrDlvpS2QHhWw1aKQBigrugOkPsl
/BYrx5NS3L70fsSzzLq5G4O5bcaR+UyUhve4SiCJ3Rw/p0ckzKQlVH96ZcdnBifoJVGJIRMb0Dmu
FR0v5CU7PUysvCDqx5G7psIcKa8KEGwqskCwh0jx3gwfGoH3+a0tEgtTUlOicUoB30M2cEDVPwlH
YMgeR6CJzF9LIEXmlbDXAJ6zSNfl/sQBFzrhlvuGTranbv5B7x0aFT49VRcendxkBqLKA/RWlZA7
ky+YdqPToNm7Ho7AwAbX9Eh8Wvx9ncsUKjAy/Gs9F08BFdDQ2HzUJeWUjuXtcIMExpuv/3n2GQlQ
te2z5zQHCO8hir5kBmJWfO2FuQp/3QZv8ZFR/uUYKEAUlodV8bmPcfJouesFZPEiuBej+o8rQaWK
L4E2XokyezS1ni/Lf6gDp7xbbHxHCBnBXFvhNP3oVpKNQT+GoiqvxAumh3QHPt76rIA4ltlHO3pG
VLi8dHHDC9suHLw/bn3IZSOScXdnV3DvwVvu43aYUcjCJ4tS/GR/ILnrbwVTo1M9a+2df0/Ll2fb
2KG1pOY7qlJpOl5UeJaHWzl05cFLfQ/mI8jmL30A3d8PdHAHVKcEReb697ilv8NGJXgBqXYYHTUt
oVgvSnG876mKVpHH2iSLNsPwAzwKUkOW4Wg+M/7pTU3xpLEzVYRe9pXQVd7PFPWrDiLwM3QnZ/DS
N5OY7etzk7GWxsbMZ5KyoVJOzPbLJj1IrrJHa/0ikEQqwtuXJBCUKOM++Xll2Go69ryzTTlkzRuO
OHsZOoD2oJBBM8PmSNbn79Ixb0YSay8/j7pOVyECvMHNGttcTESxfWvSWqsslizIrleUJBG7wUZc
GTsW8yy9r+3havt5JIYHHTCBmDBVyg7TTAtpT3RFtDWiSFnWt7TKx3c6SRAu9eOewMlJP/sK1+ys
aWJXA77PKs7AuQU7Nxf6BEDsFrDPVRqORQweuV7uYQh10E4nvVZ6pwH/lClwhIXXDrOqyMSfAvvI
EO0P6qJLK+9/xyfJOB6+mTo/BU8ZeYlY2tKelA9PR9+osl2fBw7yt1+e9IKyhf7toeJr0ktDnyfh
5jQQiebbI1dg4GPE8NfclOhecPIYpBmkXxrj98WQdM1Ap5CqK9UFr3rff1Ianwydl3yiDvAcbNZO
jUWjePDrUC1knEBm0LVe/UQ6RHky7xl5RSa3pvxZKkWpUVmcEqTk7fISNo4Gs144bPeAgSu/rn72
g/Xffj5692eXMdqVx5rY2gFEafEEQHwgknkDbeM1nGDo6MXTGFqgLw38+Jrp9eqaIq3OevZ7E5uA
v6y1MfcUB8bRHuwyOKKrhuGYfJscKnNQI4p0z2T9S/r8R+fTcr7f35z8guS9ecDCMCp/E2kPyN8f
E88/oCMx+k4CSJEObDFlzM3KI0vuS4wOHL/3KZYxr70Dy4fTRrbcbNU6yEC4lHKozjn6iWuFzfbP
L6iToW2tMPGMZtZp6wDJ7Gj7mhzIqCQsB6xl0VVLKSabUg+mBpeheeWyu7x+GMrundGyPb5kduAi
Kf+aLbmtnpx8RuX8ASUU8fV+PcYDeN0vrYtdeP9ZYzjchvkOB3C+fw+EmVZ0WJ0sZexNcWjVMlZP
Tg+GCPCUn35Z4f3BS/d+RvyWUWovc+b2v5TfvpnhILAXLekik8ql4iBGaYZIS1Ablj3aBvm0jEFw
iiu3vwL1RHwaiUvuX7hinaI326I0NCcsParKVwNSuMLrQMyQetgnz1Srsd31bkDYCQFEi9u1vrah
agwluMBMLzUBIfRmEprOt9DPNTUqm2jqgY4mmlvtPPjOgvFS3V9KIfU1TWHdS802lahWnXqj5bI1
yGDGcI/gE3/VgGRgPemRGOZKiiSe1vcRDY/wsNShFQQDFjE/gjqlC6Asgdy0LUALaP1N3qqrhxNZ
1s1z5BHM993izV3pEuO6mYJO7NY4SkT8Fl6d93p/LFDUnFIcY3LVDf5US+71x0de+c4CG6eiA2gj
60tvWK3XzDc68JItALjyYyoUpl149hY6soPpAb3ycBdgIQgvE4h+NuJ0h5KK/DH/2TWRMvEbtkL+
GwPpECmrR3gzH8cW5viv8AdjDLbypZO5wKypIY5nrq855cQg8HzpQ1eO5QvCdbqnIuPHUps8LXwr
iXgQtDhQ3rBdxMkoS+AzSJrhd33DPTUgS+Yg77QWA03kEzqvcCNktN/wq+F8Nre+CmRgIq4YDvmv
qwakO9Na3NC6KqVQEb/HOmpGwzyQ1JUpGuwk7lBQxoBEYZdexdubbt0VI3d5yhMGelyjGiCsCXW7
+H88RweHO1D4/+vAR3hr9UO0hP06RUY9nEMu2TZBinpUCKL64YtUndyIu7zRn1GX6vA+st4cHbq0
1Yz61u496FI3b/2Ye0PQ0DLlsDlnWvu4euZmEClMVTFz4+g6pG6mVPuYJeAeKaZKGscqHUSJbyNM
TLrPa0HDOReJUXRnvRBs/omZGAjdpnndrC06q/iEW8Vs/jpqAb0D6Ai4I6N/pNenqYHJ417xvsGd
gBA7DPX38cixXFvtVHYWU0puf9zX068X7u9xblMiL/Zy31ZEyCbCH+rwiT9cNgKXbJDzYAmG3oAe
9m6l8Tmrnu4xJ3T7s8RJpbwPYrvs/bln90cJQktyow9onwFBaUsw2JBRrX4feTE57neY+aYgHOma
Slynk/xk13GpMaE6yy/s92Qsn6ON7vy/xQ0XPCPh/T0QvhoBdaiPPaA3fAEdahHzvapDyFHdoIHg
PNZYiA9dnW3fwRqkqHIIP3HLUSz6HbjNvjbElpHQUib4Qc505Xst57BvDhCHsTe2iDjiJm5JRvSs
lxIfxUq4UydJh8Qckt/S5JJd62J58nZDL+hTpwhV5zZPEy4N1hhjcXs0pWUfDUEEYy+xwtB4ZuDy
HekmgvQnlREYVHGqN9JLXjQi18wndroFr9vvDjw+tnfAl5CWZ7MN2qYIpZCASebfwNmNfBMspHhe
/BcwjaBsfeKDmR7QRZYxbaQn3K5zKi/X264pWLiplp5p2XheAjhb0QV4nJ1zQz//g7i1uEvqd6ed
f9pfqctBFpqzoIv37sIhRZiR3nbqzZm7YLaLN0aqMC+YdIwpUGVbRAMns0HblTggnwBPOZIgp8TB
CKQ6CX9ezO8nXwlZVoMbOt3WKrqO5eyYuipHtPJcUUJDugrD0sYK0x/T0TMUGtHi/vhQtZQL76A4
uUpu4OpKC2cVt/A4KtMiSTiFofP9If+Qzcoqv3RYIDdnEuns9uxuZ6XSurQxMpt26zZsa7kt0U/I
GqNKWnuqYFjKdz0Zhs4Gu2wLcavMvHF/KVwFl95DDlEkfKBux3AXYMPAdEGN+GL6dy0QrvbphKVa
0QD3HntEfDT+aq5YbguDiTg+y1SVHN8zsEUVj/sYQ8yAo1yePUKRYGK6zjr55GbwqFh+I7djtKtF
KE0au5GDcDySFpqQ8Fs8pmcwZFkZoNt/wcve5ahEoC04rmoA4KY9VYrtbg2Nw8YQOOMVETIQ3b3y
uNpTn3Oequ8NuUJQUKvET9gj1imSBd9nTofKAtFZgxBWxEcicwb7WiGX2nhlaMON2APpZ1x7Kh4i
I8G+CERfDqvPOUM/g+HSSbyIFG9BVsYURVM7u8clHMZTfhRuPFLK70V0rty1GpTHSiZnRfaCmgTF
4a2sHYqNvPSGNqGz0rby8lgFN4hJ4myr1zXFNOfXgbmoJkp2S2EMSgRqXiCJ6SSXra+O7aCSeauo
rVeMbHppoNDxZI68Dy48G/iT9PeArENz513rJVxOthGoKGHpYFuOJp5GqkNShfYhCGEkUZblzsk6
2ikDpwGi/ew9RM+BBcAonYDpjtVbKBlH6evx7d9l79/4X5tJwgwOInxCkGNEyrJLClL8D/BnQ66h
A05kk9+sUKVzBfogPA2utOYzhz+Oc+LYQv4cpmLH1S2d9OyV+XZfzRthHFjdEbWFLDZYjXD5aRdp
iK2DDOQpccPYiDh32DYCrYvrat/w8SAmftMvKDii++NEbPuOL9O0G+yuNQ6fuuSkcPMqDmP4ayFy
ooECnfHn0NuKer0trvHU+eHbBfVMMgNgrQreN9MMl8jKH9r9TDt5bSSpZbxq8I7WHjdFgENpC0FR
Ntns17JL2zl6rGkOot5FJczIlQhnni9uovKfZu0zsgcsrnsm0a7K6GsogBx2aZrSmyHRNTVvGc6L
1M7jyMSnzVsagNtpSqa/RC4n23Ywm69C/76JDHSvZyyPBLeAkbFFkujQPl0S/+SJZnkrzpHlOLj3
oqF0Qctvli4K7Kce73a4wIQ95bXFyYOEtK/hkq9DblUwyeirTTiox5SRxyMkjyWoYkmZAyc7v6rg
XZpc+YIHdPDcDiF4pZjFS+h8spFBvVIZiF3Iyf4WAFRH74sSwHy3FnbuyuL2CrQo/VFqAZPjs+bJ
IHhm3bM3Is+4vQ4IZF3zfOR0MBPE/s+UdXwj6NtoQ58KRHz87UvXGCk6SHExKUL6rZtu673EpHDR
XW1UM+ZzqajBP4XRdfT/SPnXr6gAJ5nnKz16AyWCMxsjTjWTPFHtlxhGoLVD1NWqO6s5ObeKu5cP
yx9LpcwxKhJtvt2cqKd6+XfUZuhyfngonmHCOG/LGSOlpwqmza4uaEsHFrQgEcQ9K8CY8LmI9jpS
5fvdTqS1lCQl6VOiSNJB6pA/4eZY9XoAwvabi5D4b0uGrs4gRz9SYNOENWnpHO8IFnHCZF5+jQ1i
m4rJXlG/ruEuOVxb4V2ZOOiDkFfqw7oT0OpZEYc21w0ug108uDJhrP0nvCgU9fyZQONcnCHv88Sj
+sxWox5HqredRGHgEw4XTF/+rIz0N+yNztrNM+TSHFRBqP0svUGyTZ9URUeF4SASKsN0Pa6uA2IW
Jb4msxuprlHL/sZjPoIWkqyYiaPB8WB36O1uqpVXbeHA32O/U4PLMHSxUOj80NptqQrFai2sbBgv
Y++i73LbQ/E4A08OaisL+wOe9WmBXA2T7ot2JBlX6rmX+bmzB7v/4f0nF0e2zncJ+t6xrhpJOZFZ
rH5Gk59xMgLsUNUpulXHi0qupOZvvJJAXaP9e4Hhg1B1FWKEtnn8sE0ZUWuefGGaO/CrdxFArzVW
/W9YZv3cYyMnIL453f3cYFoFtGA1U/EtKCd7cgV7L7moKRlfBx17XZSmvBnFru+YG1RphuWDGGXX
BgOKsMZC9N1M8a6b9QQNDglsWi6H5Xs1pDmSANqL2aUalBqIUlp008geMC+ZGmtLkIdEbnavCbI0
j+qUZeEDZ51kWgj7sRdBJswvbRFWZiN92mFjGk82TRBfKvfOTkei6OpMjKZMXfiEk2uBCYvDv4uP
fgiRWWZm7ncnOCX0u5OSRhTLlQTVKHaGnfOKeMGEEaX75BR6HSfJke5OTo0zkilZWKSWJbih5Mt6
zjMuhJZ8imTPP79x6WRDiPc/CQMWHlDtSivFA9kZBtYeHorhDhH5k4y28tPTJCNGKjps0NjNPcPN
C+z3aD64Du+hdEFIU3sYMBmznvU4YzGrxzUnT34PgK0cV6vITPfBm9/b26sGzjl29d26e6pp3j7x
c8o+Vc98sBTk4ENknqMN5bIryMqJxIApd9XfziE9PheQBcGdI73VNPVnqb48IqqnmaCSPJQMnWX8
IhFUddrrDexkjaVbEiibG34uQmflQpnhPavZAQ1Qoct61GBSI9zRbQ54bDKtR5jYIujJK3eAd07e
nWaIO2GxKQm0qx2ip+kHqKpDQtxvHT9UTQiX3D9QcvEZS3tp3GDN948AvJVigfHvbaxa1zuCOUsS
OgkmDs09w/9tVkzdu8gIHj6KNO8habjRyRHaDPJ2+Iq5rM7jOd84WD5ymhBw6iKn+nPdFfEVbHSH
v6dnXS0HwZKgCGs0FG9ur29FVte683MgMnybB9KA0EtTBAqoE4VZ+ZBe4qO8yUDoIc/k6aJpXKL9
92CCJ7SNGqsejCkEn7n5P2ACNmLJxnDSHCUYPe8bvbrVq/bgNV1UPnIbmv8nhi/gBnyVbtV/uooI
8mpo6hT4HjfgcF9+Mx3+olRZRQI9V3j8cvS+cki4qMkjsDzj4TjpOACQ81VKnQBr1OPqnzhnA2Ib
07cXX3mi0RWWL2P4obBbeSaQmf3y5cgr4F9WvYHyUAmxMWPEWa8NnVJ9rCNa5yiowwW1itJQNHKl
1oaml/b+/XcqDHlhKM0b1Az4xaItIZQ6SkIpEHjjVkllQrlSamujVjdv3xlUfvWzwUbt75q/cxQm
bGcK0SdH11rfu5Jr6TIGoQJhCtokUnfgS8DtfQKRDuysqBeOZ383r/BoJefpcJDHyB7KkkjR6c0I
4169tlV5mEnmy7OjOnSCQ9sEoxohNrSvd/fPrjtoJCEi3zXGpnoEqQCKFctainPZAvwc+bYdUXnd
v80K+HOwIAPiOJdgpKNNtXUDdBDRwrl9s7Qvny7SsCRyfRkqtTkm4yeRrXhoia0DTvZs52LNLduT
vGtoG1CU9a3AOwDmJYmtRXxCU0kK5mKhdytFZT1960o7+jZEvWYU2gimmIOQzPl0JkHrs2zhiveP
Iu6fBjxL0LPQy9k7Te/Qjij5HTDb8lGt5fU/8PdG2eoRBlFAOSwh4PBOp+Y+S9djIRIuD35Xxx7S
6lZH2DsQLNs1IvwEQKS5v10G4TnnJLgyHZwUshtM3GEbOVtOVSYFo0JfdbEkYR5l0708MaOHrQJN
T+A0wrgPnpkzVq88rDZfO7UUhy4BG0SuiHAU5AuT82twAKaAvs0ZGqLeAV2mKIET+E8mAFcbvClv
Qccp0Aq2WOEBgHuBDacHtQ2pQbX+7KxnLj/5tptaP6HFXU2p7jZ/1L2zWqql0PJgecP252ixdX+o
eZgkqgHP7H945kOZbSEVR1yOzvIdARFIJT25+b+SdNBfWeUj1QYDUqWI5HSwwV+IZHilLJa7U1L/
hkgC+mW1+gV/px+Bldh7D3mT/ZPoPciI6fLGUIIzcuJvy34Kesu0xzesONEbtrvVA35IHfqUuKiN
K0sdTO0U0av3nYcMz8bZqgK4+OYxupOTVSgsgWdaD3SOOg0Nik1mcWOyNMIZMbP/YCFsF0ijbleD
caSKvqp3mfuEUc3aQ7Rqo8zlp+4unRr39olkF1rW6eQR7TU9d8YdQ8ziPNyRy6jvJEHCBJoqUTPF
bROrVFT2UInyXWWJ1Q841rddDem8/av9Rjn8vtAWaOyO9/3d2fs4ezQco5gWSlNPu7OeieqNA79Q
uUpvWqZ2UJGYeDhdSNcIXVOnLaxIq7eKY3h98H/5miCkr016kG7VpSzSze5VZua3JA2fnRo9D0vt
dbV+vW4jua1r+iy1rGSYLXncH2JVkov5inIm68rFKI3GQbZ5OVq7VK3ddnyznBS0v3N7L6tb1G0i
vUxWkzFV3tUDfRekpIKH+7g1r/9OGuRVaCGKvihRppAzeVH8zLbOeyXR5meUOdk+zvT+Pd9qOK5Q
z+eKjNGgPeCyL1OM215uGvqA3VBpos8c8hItCvcgNNH54ot3EuJreyz7QyL3IvSmGdAz6pyZN5VV
utMQs9d7Hf513NS4rahasPr6ViUN8Leytj1hVbhrWVXzXVXwTjIoN6qmQnuPuuKgkCMHUir0QYqb
YEVytDnO9MwRMHJlhmv4qcGBae7O1wJdO+Ltgin1T/LaoVHAGyuMTh6hyl+TyqVAD0P7DO42ffzo
ci9+hlHksY6a6EZUIqKmFkyNoNpd/8NvWTuhB6AxyxZ/JGpog0yKsfWvgE1msvJ3Dd2F7f59Ya8P
r0KhR1rmoRP7rI2GglPGkgFdn2FSjrLx6m02g5ZQUjVYFtS4XxXPRDjWtmZTfoLc9t971s8u78ug
QQhoGiWNWihSuIn3PxjD5Gtch91BrlhqFJTzX5u0mmIyVXnl0yM+wzVo+86Ain7NnIthoguFj0FE
Uk7xy4xMz4f/hDi7XG3JR2Q+R/68BdNdWQNBSLPweIhbfYa5XRSWx70UAP97UykvbGQd9x1/SBz+
WaKjcyGe9VwDm+M5i19OxoCyDAyC5D44/xNNWDXkKlgR7U76PzuADmL6uDSD4T/J48HatxbciLFM
QBOk5OvgdEEsXxgQ8mmU+hMHqUTELJqKffOfya+ENeBWfQFMUQ4CFWJ2VDOeQinSIwRwZCqyGRNJ
D/+kfflWJIIlsb0D5EusA1AOdK7zs08jsQSojWRbIPA8VZoiE5BnIsTb4tFMGzVDIEOgUfO/Jz6w
4vAeV+i1C4XOdlt/9NZg60uaCHQH/+0kaKgMU3rtguD3DrrkAlSb2X6wq42E+6wzEHvK1lma3HbW
XX6nCUzOKnuMPqby7HIvUKYLe095GkGveuZsgKcAR2iS/87qjraG6Eamx30U8jcwgyMJA5I8MyTa
rEWxN40oiAmp2spZNX8E8iUi/PkYkx0jdCpo1VIg3D0mxhnAjhlZmnwu46KSaQMNhF5o8C2StcCQ
HCKSOiVgT+18tlkNl3Dnmumrvxc7veMbzXQJptHoVO6YHbGOZByeRNcyUu27BPSrjFvRjrDgeE0F
p34FVeYjmip43f/1dW47zhjilR/aBck4/6k9yQ8aA93rKpTXBYPGURwUulsMKclIZaUiaD42RHbM
aCXd5vVnzIBxvYgfhxV0R9+PFp2lVpbayAaksLIa4kVzn/21blmYVvHaDCe13/Jz2KX2Knb18qtQ
PuAG+w2hV/nzImvNH+Ex4H1dexshORG1kkWMA7L4Ba9aVIVzh4mkySS5HbiQxg0qlXKxBsOJfAm8
e5ECgK4h1MuOtlNPAzHffZPjV4YUIoLTG8Qe/HdaEWHCXIUeXrh5V/qGVdk0N/qC0lOrKYZIdNT2
pqB6qb6r8ZFW4jXxdsPzuq2NKlQdNNrEv7T+uHN77j+oNrSWKaQ5LCTKIGs0mN+Dd6NQk8QV9bh1
MyiJefRGwJKXNpMg6DdPTk/eyFGFPil0NLG52C9h8UWBQwA4mhlcoXg+R8daGa0iHSlA90Rw8rmw
2jTcNSFlmoUPPd8mAaBUQtByxvNi+tA6gTYH29rPxLpBlqsZz5qWkg7+GVP/UMlVNeVNDPbVNgLx
9boWYsOiyT1iQW9amnc0o57LW0bEILeZW4tUKitfM2vrTdbfdLmu50y2g1MPcCAHc8fbaPq3axf6
GEDVnlkcD97yzRkYgAXCppGyjuVVBggMO2HrVBefvUojeGUAWfOORwrZq+kIs6BI9bDeSkimFQsm
VNEtTgxDAQkLVqCVi6waVPqzrZQw9MYVWg1Mx/RBh9HVyB6E4pANBOdMtc8T7tbuP5IUAq0ShWop
1KJlGw9W6o55O949f1GApgXzxogdYNJLeSxi5tVUJSSwohedgpfdZCdwrEkTpkUkkgdWQLLP+w+i
IEKqWe+p5KrnRW9xEXp4JlmyBKfc/18wMdwgr7UiCWsTf0EeK+1YE1k9sdtx4EjsjOhqUgi+WF0F
ma/jMWcNM17c7v6eZ0fCJKvoXCd4o4KfT/bLJypjMw4QDLFQwf0aCskK/zXaBauWRxxmjfuCkwMl
0v28CRIVfu6vtfGqyfR1BszYMh5mGxQYX/EN791Mj6ntBwP880rmaqM/8nfDCXiY/kxgtWT/qNpn
jBPcTq35Lr3BpfkcbGre26Uginiq5IsoBI1bwi4AqLC7anmI55D91BU0pnot2kCH5E0Yjb8vgj2o
SU7U11NiQVIjjyFC7iRNuOuzzNF+qneUcZgmqsCRBcGbMKmjWf5Ojx1MnQbPaHmvcT7FkBcb0XjR
zjmpnXo5y1BjAylkuzJk5CO1bKvrIiD16mV1In0HSO0c9icszngxB5zDoxnIZgPeDCMlPeyELF6e
Iq/pHr5NLXSHQPGRoiS3Pg4rA197Xx4IUteZILZc8DZzp/5F06BCQnGOkvQZmtf7yIUF/FBo0RNo
yWWp0tXlm+JQPOxAMaCmFVQiJ9o1eDTRPSjY3e8ViKUleiRUo91lxFuLlcQPYCWjqFpaxQ7LD57a
CwIbypRJ618TA71H36medSSbvhE0tmwbhdWiMGrvW5WAi0UMzbfBTEkLG4C8GLWFG8rybDC+yT7x
Ni1ggxUTG9I/4u+qXH+y7STk4ADiKTuf4PYnyrdo7OIaBZRbwYP1lc8EEip4uqVvGG3reegNF10m
HNKmXzpl70DPIKB6XXge6Mp3lHtVYyyvB0KyhIrfsAfHAsrKdc5O+/8noIB5GzhTb5Xdc7TaPSlP
y7OST9ibP+t5zTCbeuv9Afh1Gu8sEaSQDNvSZWi/dgAWFnUZkAdkkd62ZSzpH/8pfm227Vqa/YTj
CmyVFV2r76kULIuYSlRzTjeR7oLJF0wuD2wxyk49h/IvOdeunbYEamHeI+m/+NW/11AK3eHmtajx
9/3GR9rzC2J61ttdBPbUlu75u6p0zE1K/Vh4hG+uZdVyuSlVhSePFy4NybNaiyWeYjxhlcXsNfWm
4nGZmOjvYxGXIJ3eSfm8T8oWU59DI9m7ffuKy4Y1FxlMTllwaQM2RESKV5xXTY2MtcKrhCGTPjMb
0rs4ycxXQhFVlS/d41P5rNXHLlVT0sXjzJBvZJfrf5IRMQqrDzayUFTzE412RkRIdb0QlxoZcdXT
0w0Rnzky79hofNZ5Gbrh/V16WWBvq8LK+kVjlFI+wpLNz39ASHDUWpz9gkL8ajL5L3zZvbxlFK+q
p97S4XpZUFCA31anax9RkM7rhrCuPT7cVm9qbuDWSONCYKVfkRhdhNzHhOO0tdED9AP0Yx9o3SQ5
s8s/AzCEHzVJXk3HbPQVZNGzincr+Uh1mj0PibJwX1M9trbOUhMSxQVLpyTZ3lyF4eX9qtP3fFok
RYdplilN+Y7tQMBm+eXHQ3BZ9kYzOHKcVfqNgQt92k9H9zSTKG0LeaNBOg4qY0z+7u9YvHdF4n92
AdE9txBWedGb+zdqW52Rf/DOSwCl/AgPj0K2NPROGFkRkJ8yEPuDqmY7dWpa3eOKfL3fraAgtyIj
UctLdD+aENnonVBkJSXtdRXVsZRyqo125EW5CAYA7sId/UOLfdreJg68PRMNGRtMRYhl6QtJ7VoJ
gghqgbXBO8nzkV5PPD5Q5oqXdqafwRYisH1jRVqbuxwUIEXK5vpU558Bxep6269r908PM8+966t9
PFd84nPx02j5r7/je373Lhrb5t4ukN373CL6+b7O6JVDUQj/MmpnICiJjOv6Ker05CYeiM02agp4
yHSX8Kpq64v0rjP7lqiS3UiB+mFRIXiY8mgTh8kfGDmc8Y5efZyLNinZ/1vontOrA3jdNRqJcazu
dkbPMWw3rL3o5b7foprqqhh0E99OffJ1d+7Y75euNs8oNzt/as5JV++MeunhvpJq2upnx3T/uh5v
ZNGorAALOYGCmUMhLvFdu8yiNmhAuZ0oCaHefj2jUWviyrq2rZNbtrco9Vam5iBOf05pSptbfWZR
4QjABYV+7r22Mw1LnD0QCawiFQmwsNA2rDqyExe8SmQGFA7xUjmJDX1n6Z89vjgdCt5HzxQbJvhX
sEE6ZTDeNF3rrd/oy3LcUj7YSqFgu51WJzffUq4g18to1ysJ1QrWgkik0jmg0vyotZ0I72+d/hL8
52IJbaw6J1OF6hVf0L6B7INgR/SFesL1io6exhMpBUBwqm5/bRSYsHTzv1fbyr7QhZg8KEFJYpXn
LxS2eLzZcn5tDkAZ/5yFUhT09hk2xcxO1XOWhrt+r1dwscnDxOLrEiLwG5zHDgHH6HjHJbytLuE6
ko2cOw/5FfkfzLfgondqySMYjvidqm1HUFeQ6TFMG1PJnHF37XYbngO/hGJf0bNNejimiQSgH0xx
kCSVYGywB85Z2RTZ4Zf7N7eNocQ7ewj59u3MiDnMkC1VDUweYVd2/NeqTSDaGO/FnRJZYz1ukC73
r9UXBiiXcoh59hWtRKQRU/ZJai7WmCAZxT7LLMX8aWjle9NTJH/BM5eZZAUEeOhZZ73Nu0IdQZba
+xaGVQwkdp6gM0WT62rEZhWEArl0ZVq1dK/WnF57yjMxEBPThpUEk2K9SQ/5+443ryjopAiiKeES
1IXDfu0oqA+pswxZwxaDnmxMr+pco9k0bD6Y7HIP3kl4NSNk/+EcgOBZVVzbtQNihpJ9a0heIwQx
yN7w6ZNLVhX10dl8AreDmrpxPDbfW99D+QBC6HVQ8WkwH7huyi+peUE3cysw0a/3DTM9hvwvUzud
/C+8HcLB92fdVouS033paFzxR097ZuwFSpbeSm3kJ/G2Y4nHiyKfWaFZ+k2xlJ5CKE6u3GEeVSzw
kPMfvIp29vUZyuMjmDN95ormXwGicTIjKKO1mZtxD2WcNqhaZMD9KTYphqRGq/GSff7L5hUVVJSp
GwcMTTLT4FGlxIBSraUnhRCz0a7PLWIUJP0XGsajQOZwRbsjawGN10BXNxm1aoCkhDZ9Xei0sXap
2HDzKh5SM+ep3W7W2lJ8/TxgWRlyjIsDD66I5CBFQo4ehGIjwz8YFkv+94mca5R0DYl/6aohShVr
UOkIB1PiE3qPQwmyr96iG91Tw+y3kXtiK+kxATuiy/yv6Knn/aFNUNH8Qxsv++2H0fekyoRbNmmv
0hG1kwEx28j2NEZJshv3qy2Np2AbIb4QMRdQ81Q/pGlNlsYsC/fxx2m9fvItjHLsmpXbCpH+Xi6m
cM93gjDwJLkfb7+OPaAK79a6/19L1KV616z2pePBHufLhDOlVPp2tB+FGTkiOYDdeaIp3ymkyATb
Mwa4jD9a5IJRw3jgT4XWvBcZV98FUJplliVKhmk7VBGXxXOJMDNpb5DFBIl0bJMC8eevr5ZxjZ/X
nibMSaufNXBFjtSUaImIKe1ycewCmqwvESC34cyXRFeH47OHAHHROT6VsCAK8ZAxpdbKrAjjvrdx
gecqEY0iI0dy9UD/RfuL+uDNjxtVY9JYafP7m8UMAQZipYYrRgWmJnsNkqpwybm6Fz8V5+EdUVxQ
BaqqWxyztdSjxDIPXvoSmRl5WX+xwNwyymmkXKR4y/KP7qTqkzwDVOd0yT9MxCpuzJS2WmRzjAHb
OdFiJKWKt/jFkFwTKBiSaevFeLGH3d7fBPbykgUEg/UDOrIBN5DmyRv1KccfJFngmYqs5K/Zr/5w
QnCJXJxPUqRcoJx4sTvdiGLG3epEysDCn2n2Ryn+xKqLDpQP9x7Dq6g5SBNwq5aDmGxxAsq5lZzG
/1t1q8Rg3NsvzpOvBVNEReZsFv2QwLucnZLSIYYHPUzaDqBTbIwiIeziyCS8hvOLcMO62I7nSC+X
JIndMru5ybhNJXkdfYkrhKaSPJ2dHyc9CbDCJSQNCuxN/7QkzOYWAFOQ35yyEHANpEBKpJmwPId5
swBF8viVryRiu3KW3sW0S05W53bR7VHI0NfU3eqC7yESUjOcuOKilFsL/Zz6HsHJKQs6ZSf33P6m
2MLFlCEcnXHNy8FYBTYCDH5LuqKQQv8vGPaNt9PCD/mGVtT4MP+ouFcA6slYbRAAWv+dZvcg7eaq
/Qjuq2mjTpt8RAnRBiPZZsZcVyZijZc72dBRM3gi5FrlvVUjzIQuXxs8s7ddTDhhvNKiPES7A6vH
90OZ9elgxGTO/GcJ5FsBT2G1aZeE2polx36I3nE4Dg2u/Cn7gp/Bbg/K2UnIFL2xMfylvhVx/CO3
0/F5JPKXEAOpFcXpzTcqzEutlyJfwTRQ8YbAtk7yVofbwkE7IP8JmT/ZqhRcGfJAgSVmP29DjB29
sT+ObqHuXVyqtuzVYUPAwgyFU8Y5vdazxbyzXp280NVCHLuXx2azIeS+2rDDRyDYUG4mE9Am5VSg
BJjMZkipEn25LlUeonsWRUIBwOtGc1G5azLLQxLWbjdqOh/CN2Ylb8vrhNYYsPgzCnRGHzdq45s9
HWeVdc18474+5bHHzXwPAVeHMXTDPor528mQmhGqrd1QUTJeQlaKhNUu+SsiAyUuDrkV9gQu9rGz
oOGVhdi1BMJoJj2Gt4YKwRaGFRhoP2EXWZmkO64bbyMfQOIeH/O2Z2m/gMfI26EzjLKHFBXBo6fr
eK5AV7Xjx4o25HzUW5hafFm0qn6J6IuskTl8L06w4/IkmLPEoi0GYB51oAa6QdTODIcSuWUPUqTO
q2iQ9GndVNhd6HhTgk5XGwregdKt8BggWaAcmSQy5DjgX0E62AEDSrqeP71nmVikTeMygtBSNnU7
T2mqZBFWEC/V2FCIuAZpbIRqACHOu1X4KTa8NwC6EISf8fG4l6HBL3Y6nA7Uneao0Jc7aVcu0t3m
XLI3/V+T8KJcVkg2FyChfHONm2CT8DB6PI2nlOPB50ZuvTl0wMHydr9lsuKhh2KxLg7k20LsqlYK
1m9tXVduDrvL2ktOLdV2ieB8WFgPp57XrzSXzJt2ZDY0AT5S2oBPHo+BuyxWE2ph6xR/AvPJeSbK
A3/QDTRzAtJqzFTMzh2+rcnLKz4LMAl+Y5L3ka1NkRer156I1u8mj+xeUDBfiB+eLCEaM86tLFaT
W54akM/WyOkmBHRDtBHa1wAAJsN1tJpQC92+pq8a43pjhcNfpg2I+CR6hjxhvg6hUm8fumVV4YYU
WNJrgFQGGzalzNgi4fwihm1eBG0FTX7Ht0fiKLEUnvY65vvMQDD9JKU2K+Ls6jzrmvfSTjbUAIxF
VzSWAguwd2/X4F5nfbsT9eH724ozFsI2b/Vu6GcJhluK0JvQLAoUd8mh669BNJcfew5fzFXVdxP4
5ltB2iDDIuT3I189r6QqAYsctyivSCNeHC8ygLizXKmu4tDuj7m4JCOrPeB09nvPd2gMKuUnbdCG
4C1jaIkIkvi9sAVyqXP1smaSVjGvf9igUvlqp3juOiyhTrvM79DURoxXPbBeVaw+h1bCZxbt+xD6
+6vFIWjfezqfxvkbaYntgEsJoHj9XMlxtEbGZlhfSvND/SWL6389dxvBrr2jzY3tjHQAYaf1rKzf
FhGjHbiZdjPZ8rv/ZkWuYj0rFiTukMbSIstQ5mhGZ2PoMtKteE8MJSY/EWaDGKojDYdyF5wxt4Q6
7k2TCZ01TzcjfQ5BIvJFc5tcmZTB4AsVoIIaIY8vdEmvq3lrVoO66RBdJOf4mIR3ffg6CG9IPiKq
KY9ARbU4qHfbqPPWfVy21roNKfgLv/ZQ8R3y/WzR8hGj0bwhIyc2wZqFpA9C0p/MIrEkjTzdcAXH
irqar12INZNcFEe7qoKC8hxkgRUMLXRcPYmysdKWgDJ+6bdr/lNY+4Nqx1KySTHOtcH2/i4PmoRn
5TSDBpb5sNJ+lKdxzDEZf7uKvto6jB5BolUQfXnYFDuNwghIvtUgxtx6nQp8KIV+7RiBmkQYb3KA
vGVMfDI1xD87BgcEVp+yyR9sKVCHmctLd2tyvKtcgW29Qv7mbKZjVnJzDYyEvls6gsNftaBf4YqS
sF6Ll8nyo9v6Pqs6RVQ/RHjQMfwtrsShZjawP3A9nJF+iGY0UAR7uJLGLVaI3t53ZUxKFcQClug/
SR/YEevXUC8rqu0t0l88yyZTVp86LmjC77oDmppv2HsBHWTB7IaWbPBn8lCR4Gp9caaCjRvUJRjo
RrEdmLIrJrp6LSIDPtfJHmFv2ikoKmsXk/uCMdCnpd7awIr1rjDRRyqU+x7+rjVYCDsR4H44goe/
YmMxPcFW7h+3cPxGb7Z8OD4LcacNlln0wNDPydyfZyde7fygPjvHO1X+D1PSJ1JH6a4ofEOt4SYp
NcheWmua/uGvLnCYa18P/LgPkoFCCTOn3ITyL0GBbS8LhdU+ObFwdaBC7bQeVTTb0oQZhTd1+HRv
/pRjq34+glOUcJGVMnGXLvHhJi188qZIHUhxVYXo2/hmHoZXyF4V/5Q43DsrRUHoIc7kBPWw7M1G
1zRvIGbhJnVqMe1AVJMPVa1ztvcz9tx21V2hwqXedCnNmvYM3aEaFEFq9oLBHOVuWZNgiuc3JKJi
cHRTIAoOwcRHFfWdw9S10DHjOjitkq/8YufgX83rULSYmFSfTK9uWEkv9iG/wAdqM10xNIiwJCrX
nwbN4xSlWDVEfQShYzGfdE6sYnB/Yv6opSezZDz7WxgVRM5vNHRwuTH+grSjnLWveC8EQcCsa2AO
ZorBlCmutvHW5eoZPqTsRm2D480TmnU3pflwwPdmDjsNApHLQOVp5MhNzG739j1JtNzjWbtOzBtJ
tJnxlRyv/8bzZ58k4HiY+3IHEaFnqqizKv7VmoMLIjIs6qLRksFfQRgrS7C51mCn169vBsPUa1ho
Gt3Fnhb1arMbE8pHp9FekueXr94UkgvEtzQbpfEs58x16+aAqWpg3zkkQY9e3Vu53dlLgadLpv9J
ZZdHfj2ihG69Yty8dZh2pJiVD31L6o7ga/yJvBYt5HyJ8h/ThAlHsUm++boS4MHR7Gc4zmCvLg+Z
dfbz8i0sNYYL48vJ31m3pRrY/kB3sr5y4jy2SOOZAFWlcWcxyeRX2JnhWnb8kfyNjIuVp1igAZzu
hf/43nDF9zpq77UIdZtd58RiIIIewS3er3olS2d+1UbtQ0T725M+X6TAhiDRQ8NL/X3nDCmdG2Gt
9xgpMyxzWzDJIsqg0Z0JcL+q75Nj+KOKr7du4OxZP6K9NHEpcKiaj0C5qC1EGo3jJS/bkvLEAix5
VL27T3ny96fftKWRXO8hE21xTQbOq84KqmcvHxPXHvyxoxArBV7wTwYlSjrHYhhDhL5BiVz3ZOO1
Rvd/ZSJeg0iMQyVVMy2b0UC56NSYZSh0KOIVJT+Z8CG0riNG29GJJfwbUf5g2w0RVCEwh++cVA6d
/tFvO+ei+e3/hnXEVKlBxArbgIE/6PHYIh/ggnbdnGmmJBAqB0wpKi1IlIy9KiHmHyia/b+eR0Wz
Jpm161i9GQLlSSKQyszDEOdfbV0wrlB9U6EDuM0FE3Vhf/wAlbpgZoLt7T8NTZtT5JIMgAdKG4YR
n+2VBCD7T97GAt64PIQmBkwNtBOpWYRS5aE+RGoAOYwrbjOesvE+rZxNZiE7+ZjkfMHOahIHsXn2
lCMDpt8vsWuTpm62PcjRhkqLMv+GPQcFKIOWXaslqfX8+crklB/jlQKTytUbj7MrHvd9mJmPAfV2
tGc7nBoBqPYp5ga97LuZX3Lxy6AiQNV7pUC09SBt4qrnTD4PNYBGvFoI6l0y7hv5pc0bQOweW8NM
aiPQv/VtFX08LOjmMCynP+dXWmzgAKtP+SQZVs7GiDhD6IjsEC20IIW68y6gC4U8NovGgoF6qkOH
sYJXMI5GTGVhDwsJphIzOAMl/YMFucFEFCMzJ06gashe6umIbudBOFEz6fHqhICk/cfFzcppnB8a
qd7BokC4eAV1Gbj6C9pIuJK3ooD9lQ7szL8yDrnISdaFoDDtY1AFhmNbFUUnVLjZ9InFKprc5Mw0
k9BXvHjRP9yHXY1zyFL01YETq8h18qxSiFg2u2auHUe5HlkzBFuxKC4ZXcrVtvL1ZDNSk4yzAPjk
WFclUqAeiu7OcOSCYuqE6ursN3QZTLZlT+rnSsNc2r4Ocaa5SnAMnYTQlIS7i4+FNOJ5o2BKrf57
FXf00+k5vyfudTYGKVlIjss4QX9mS9fvHqMtuxb/+kUuVLx048Ljdt4SjAlR7eBG6T9zUj10syzp
OkQQObtFUZ+0gvH04D7ZJdVLKXj5F2T3ERgaRIYDRYVvHucMzJphYaR4BSFhNUyx+r2uEub5BnmQ
AEmjXK0viR338HgrsnKYOIRzqkDNxS7C6GWEXwxV1wvJfYXGHym8CWLX5LLpAeGeoGHjuF9L2jrQ
fpyYsSw5ZqDpcZcalUaMxox36p3vFjOEUaXECU2Bu69x4zmIdiGvbOaKSfN3t3QDwQ90hspibZG0
NLpFaLHb/1U3rsuoiJvDwYcaw12mhsnSSYJf5Cyppq1xvUt+zfbOgC6XRKcIM0znzACUIO3aosNY
UI7vDohprwiryUMUIq73fbQxfx8dXrrzqm1tfh8n3oo7p9rYF4z9DK5073auyf7IATrsmHKX8tm/
J7r5jkEJtYeAUN9LjEKMVZiRWIpBTry9YCKj33IZvaNzMcqi/5CZgJJ3TRGwB9Lhj//jyqtMfHL2
llGpApaHyCaKfsOQupoYvYGOZRS1DAIHxWP2rvm0DgYRsVxOAMc4af9rVsEZfpQForTinWL+vmtC
f4xp0rf0qFO7zY4GiAbZRfh+EYuzBzGOmyI7iYrCwzHTAwuaT4ZX6jLb2RicjG4x40Qwxequt/W0
W+HImyXsWrXRRuBSVl9+O2HFPJFltLNTkpzGDxXM+n5khboCHH32FdDtElGi7Zh3XEptDCBHLSQ7
9XvVhvGyHEnOpaeoCO6wecZWDm93nzqtFRUNFg9cJWhJ/CIHXNDUrm8XAeDJnDyDgok8i+6zpVP7
ko9xBuiglavgP5pwnnCgsIzs996oepZCrMYURl9unvVjkCyWTWRit2Ppcit1A2OU6ZMO47Zu8AIT
zIbhAXdTLQsvje+o9ia/JcjiEzp89azAcg1bR6buWvVd1mldErRhmW0YxzSOM948wHzAtgqQtaYd
hZ15Xij6HfUMGktQ+aGEjxGk+STaoghGCrFywc/1NmZL9HmZuK54yUJByiuK/GY1jwBGyNmFmN2w
gtj/cPmkWKFw9vBQ70i7m0eQO3VAh8nbGY5eWuSli0z7IKfub037CCOgSm2o4mbiYRbpeI6UbKi/
Xr2ptURlN9uYN+LfXPRpmvR8feG6KDSwYZrNFdJnbbq5lHS7r7iv/ReAfW6sHh1l3KHu654cdByW
RneK5dVppLiXRjitXxtuvp6lD3JfS+SC19X+EjpteNsq8SDxM/VbWVJRAC/fy4pj6rYZijVtK2yx
0HXTRYR67m5jwZTgk/XV2WIXeFnGaiVUntcSsD/I/AF+NlHwB35Dzmat512vIk8wDgWttZiN1eAO
yj0jVpBd7/AoPXvglyiF7rNJOkTOOG2q9za5rPBhghyCvIXWvOse13QmvKyquTRp1z/OkkANsuVG
1YOBpfczWUUSBL45c1tYzx1wXCzVgB+ED+sIZMNV9NCwNgQw1TWRzDzdI0Zph/E5bBxWGqTO9PKt
PnoELJyq4rPghfQz+K+5QVPzCQR1/FFE3EcrdlGpnRcUfQa7wpdEzjzFCJqkLcx+TnIw/fjznbT+
PoQ5bAa03BUQQ+afLe2LWRhSyBYw7FfsaUrgU5DPuli1VPOgAUhuO96zElXnUuu0d94tR26910Zl
37/p6ftB06r3ubn09cL/xZVwaqynlHh127bs4cC5BOfHFgRRocptMwwTjWBCce9NNHES9o1JR3wi
2dtMo0oNmCQ2/+Ud9G8j0p22qWV4kYb3l+e6qF/AqQfVOskYZhEXNyZWgHKoo+LY5Jw5GLvcf1n3
hKDnfMluk4y89kOvK4QRC3PIRtR3HvvbX4PB/wvMpZJjZO2/mZuBwLPC5eSCszJc35quHELziJnD
W3ENICSzXFAeFN/1vqTpLXSkInjtvHpN2aNMw0DY0eY2QAyam6328BGoZ3BkkRAV9+bYJtorSe3s
W7UE1FSU6wj/OBbY1mEmhVQOvkBoNO6rjh/cjWKpJ1xCiwpSY0Nisn4eITh8DEjr4kp1egseu5gx
yos8Uu9c1lCiL/jK68ra93itbfw9X7HdqgHyNZoeMg1g1rpSUkcasRcniotXDFxJHlPkKly8zTy2
27p2g/vmg1eXgUpdvZLnDrv2sdRSIxMiHZ1wSP3mA7bfjzRyABoK47n4Pc1AEa+Fh7ruAyPufOPW
fWucw+QpGSG+FkvEdFu/cD7/vTXLM2qB/ekTHqOMViTdpKm1Qa0THyN/TyD6tEiX3t813lQJUt+2
/xOG+3fF1NvL7IJNmF3tQaVUFQvQy0U+JmSth7TR758uuyiWOzl5idi2TMbK9Wr2EM1SjLwzQSLW
XiLUhUHMhmrUOn0ZJdOAQnql0EOef/o2o9XKQ1Jq4xIJVH2jKc/yJm2E1iZPHYOfre3gvMu2JdGF
OQmhGvYGQYwTvXwc8h9rtxUPEco/BRRvaCjoYxprBr0LDw+AhmWUcVduCsw7O2YkbcdChPO/R9DW
68Ohs5+GTctOl8pOvbEn2ZURTf9kN4wfIywU+KkugXRzuq8o/L8ISVqS/n3ZRGNGpij3e5sADHIX
kdFepJld+dDYTNnV3dV2AwWTDA/NXd8lrCS4PByhLdkpE7y0UzYQoWc3BlhIhAEZxzelymzCIr+1
+y0PzK1Ey2+5Yw87n/SGynC6fLNddztgXKJE5IvfzIwTdI+CwWa4h8XZBcPqoxJGKymQ9pW9UyWm
SZ52EZERcRJd2Mt+utXVjfVoErTfNtEroduvrehdwuTI54cFWQD5oq6XBkxhRsQHkaviAzy4ZT+3
QOAsd1vK+2Yzt+YnDMYSSep2f9Q3Wl5cPonPuxQ9G+j4hr8+l+d9ql7+mLkyLflicWHJuz4aQ+s2
EpJIYLV1/4NWVuajDfc/QW1xomMTCqpJWMjwH+ZjG5sJUeykJ/YTiQSqxrFui5WdTc5BWnzec/em
4H3LKg41lsIIcycSFzRRq88Fs7997d+nE4IYS2Bze3QNa6EShu691Cm3/siQnmjRSGwBXGy1DDWu
nwl2VvS521BMYMCxCEIf3E/0uIgBI3GcjkMeMF3tbFvk4gKTfhz61DRbvoEbJDkOpjOTUV9YjJKI
M8yxU4dEbIlx1U/BjHhU1/OFJah6ub2JAKUiGJLY2hxh+87wakKH3hHpnOBy7GyqUzGCK0iDRsXK
gaODFC0eEA88/ST3LZGD6ThFYct82WEjtIIX/KKtvLKTok2hLrF52pLGCFaevGtrR89T8vxKYxdp
WH+QbYhGa/BSqRny4uDTeKrn2ddNNQpcEeIHIEuetCNeREEUs6WI1BYO3B2GgNIksvkV/0QcXvEY
Jpy2P97vqZuKJpUuAa5kMz5+iIvATIJt/LhJEi11/YAgVO0K7vyIdmvU5ZX4N5O/36WgPMHlMPnz
z85Yg7zzSSS2CgD3Kvc/Jj0vJpO/x7rwQXrJp69pofNjOCS6jSiSyEaQbT8gVekh2eWRwRXGwTzL
7vIWyCb073h//rMwDpUkx3jhJb5A2PMSAxasMZYTrpEzw7rsbYY8rqzGf4gqcPNndrdgD1vjvWFD
CxNt1MXI179VfOe/Rr9AQPH4AXSm1ab+PeilrzKoJ6CFrFVynjgy8dbZC4RJSOaYv0uoh5iIaYkw
rK1pUQASaI7yOoonE2qoj4mCZhBXQGVkYMTzFanFW37ecuZOmMTys3sscE3x5vGCcO4LZnRhrl0a
1o8U/hXJVid0MnrqbLoogQVjcKH7t9bcJE44bQBDYzGBVpy1vub6gknMutemz7Ct217Jl8OyiC67
DhJqe8ZoNu1sAr/Wd9gG2QU9pYIMEWxOEE28PEJWT486AFMObkrAPTg8IzH2gKhRDmEsetLEasiw
dNdMqllvswRUG1NZ6ba6ZPCFPKNAVrAf3M/cavt87WOIWojiFpJXAHqxH4HYiE8hfcdEDUS39m/G
KML5KylBNo5viPAXLUVgojUwhfuP14gUPG/iXvbki4NJIoy1xt1/ZJEcTZpHnfHLJc8MWl6DXycm
vuxvITYAzdiucYjLc1E3ojLaWROTYiJwhzud82KIwa+Fsr8MA9w1PLkfM5nnKj5qnGw/b8WMaQtp
UQnHX+zrnkX0U5tsDd9zAaugBkufS24xlk7HF2b5fYLFgUh4UZtCPgLOYj15wvrRmNALMXSjrdHK
0xh2/xnr4HMUdnPNPue4d+Lu4MEVvNViOQ9NfkUkV05n/ZY3REvGrUJXwlgyE0bmDgx8FHNJUrH5
jcZVGCv4Udeg3x2Dm72SQICdn2ESVfqZ7LHzVmWWOiXUJuuIgieSdN8sHOb6bkYOsqHxwtNEzI5v
SBf6fEzc1uQDNIg0EQTpvGAeFLDH1gI96YTsFqUZVphzI9iZp3lzeNTWRqtk2AbWRbfSJW2O93lo
KvkwhpnoHx4cPvCB8uq/UBFABhdz3VFennb/FcWx/kcbwILNkjVmo85XNOlSKrlH4r/xxei4EYOT
CeDaV0syqe/v47b8xf2d1IEfrShOFUnqSmRY1p5Co/P7ym5iJOqpE1pz18+XgbL/egZ/qaojKd1d
1HX9Qt0BfE5XFuAp7IlB+UZzaH2nomgJqDqDpRTh2PPiaY90++CYL4L+0HFe/Q/mGRTRzljLF3+b
mL6IZwexH7nuO3zY42SYvXTWp8TpxvI7n9Lm3UQjw0JLVj39YfddcHaFAYFyr63zUGIXB5AFaMK1
Ug4S3kWIDPN2QExwv6WPSRcClSXfDmUueeC8gNB2SEzxZoRXHnlvdsZkpk55MZqNApm80lLJ+iVh
8EZvQilmtYGv2xRN3PDPWtHuH27553UFG6RVqcgErjDcueSqa1Qa6fQqg8JzQIiwhi81BeQuJwyX
Rea24/u5x8H3JkdaBthYCvmIVPlvIgFG158aO5a73myhW+Z28ZoSbhbP68aNoVTgJnn3pWAExIPf
IuH6/Nfs4z7v66HudWnbjKnk2XwylUiZNjPRfH8mQa9ygmQepbDKjAXEl5rp0OWBJMT/j78V8YLe
lr8q0Nyhe+YbLkONL5JTOzJtJS6bY7QSm7oApG3coSfxr1TsGyh96G+P+E6O7iSqqyZo+wnvj+2H
G17KAYB4hEh0nlBphWg3GnFx/JKwFb5mo3LivtONcDnZU/buk3J44GKtLItlBap3lmPQBJrlupCj
XAAL7bwxSdJZp5IQ+22ZpwX2PZHQpkdEb+e2vtx9xm4Q5r6eiJ8tFAgOTa/WhZNw7V0VvT8Xuhv/
/Zeh8RNBMrEX0CQhS9NBE9CpGoY1a6oX4LDBDiwA0b+uVsokvxKAjXK4/2sOy86CpbTGEsSq7NkI
RIcEKl4Jt5XPzFursNDIClsfS2LrySve8K/Uo2z3hYAx
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
