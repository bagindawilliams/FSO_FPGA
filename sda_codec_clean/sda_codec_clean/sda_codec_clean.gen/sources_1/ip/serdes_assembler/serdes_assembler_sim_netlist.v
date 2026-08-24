// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:24 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top serdes_assembler -prefix
//               serdes_assembler_ serdes_assembler_sim_netlist.v
// Design      : serdes_assembler
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_assembler,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module serdes_assembler
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
  serdes_assembler_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53936)
`pragma protect data_block
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
5kJt9bUB5pWCY1Of9ac=
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
