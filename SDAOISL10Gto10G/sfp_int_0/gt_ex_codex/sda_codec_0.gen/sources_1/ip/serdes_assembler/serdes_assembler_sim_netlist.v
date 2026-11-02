// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:54 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
Vq794Qvmf9ZbljLVktE=
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
