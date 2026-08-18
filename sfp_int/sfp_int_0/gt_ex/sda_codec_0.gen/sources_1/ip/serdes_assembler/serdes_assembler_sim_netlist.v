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
MYLunns7p2D+FaVrH1E=
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
