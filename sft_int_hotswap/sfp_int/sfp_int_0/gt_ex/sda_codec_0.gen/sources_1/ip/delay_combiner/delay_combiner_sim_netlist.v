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
