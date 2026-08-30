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
