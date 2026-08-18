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
