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
t9+RdFek8ihXzHcxWTfMdSZ3pWdvVHTHDPZSKkwKGgVkWiDy9BTIsPDDfrCD93IS/ep2Le9LGDjZ
q4oqOXciXoSlcJ5dGSRzTFkxYLmWRqSVrDN1rcSvOy+BdvclPs6S4COKVPH1I0E2/rQ+viu+sSbq
+E0nyInljIA81Gcv5/oE0o/ygEJLtx/CtlbaZG5QHpDTjCn+r4pK10g1FKneEj4Yt1z3pnIU3+oV
AgIqyXKTqbFvuXU4TsIIg0K35VOwstBnjKfs+Oinzux7TFBMUdQGKtASbsFg7HyUbVqzgPwfP+vj
SSPhGb5fIWbO1/lOGG10fEEHLXAs6P4dwGcCZmkbK6WFI8Qes2bvb/bsIY9E6ahRud26UBWXa9Yc
yM9dfUt7YhWczt8JCvwNQe2ePqvZmKj6MOD+HVvKO3RPRp2C72TcLxyjDb0+WhcBc5TR8FIMBRUO
3R7Cg86CixgRDtVt8dFFMPmp1hzxl0ZaSJtNguJZTYa3hCK19gZnDpkPnqvdc+CX4V0GF1sLJkZP
1bI1+ijobTZLAEg6c1ZlrTzWxug1OOczLhLU7FArpL8SceLAPgddgqW0EtXSLOb/mSfjbZT1MYkm
ghfqBh8J+f43ihHbZUgk+lN4NrXiCD6yxwcb3xizWgIJUXBwk0DLmn2v5t4ZXRHKOuLZZRBfxHzj
R23iCgUSCQrZuVGhr/6mOEVe5NImdJs0jSMwDw+5kBHMza2gBliGODUJUrGlOxtGZvg3THCn44Zt
V1FMINbANmQD25Az9jIMoHYFs3HoexvqGV0rQEO8fl/nNAj4RhxuaKx2rdP4klR8CHwaEFZiuoYf
+k9vNsMdEP7BF/+OjYQ+UUrfuEv7iPkK0TeHxKKHOY99TKZlYh6cYy9pTBSY1mv4nY+UvXS9zMUL
hn7U8/B8ndlTMkqcPLIYDc6RSkx9/m+i9puVT/vC/A7+QguQ4pgfSjcl1j6d8HR35cBRW+gyYlEp
JJ6SyO4bRg+g/k32akGgRuHYupkPa5FQBYqFVN4A+i4Zg+n4Zybbzezk18W41OQ2JSsadWbFgUrz
lVXuNXBphCB1CpCYygBz/QHKnU7sSrYdkXxpsts7465ofFtSMyVPpz/ZMtX3U7lQLIeax4i8qYnp
6lJ8uOxbkNtlC24/r+WFprtvo/dvBw1grVBSQ08jktH35tBMLIHUMUYV2Rq+Ds4//Cur3kZeec9o
c3i8Io8tS+CG7Pei8rBuhgqjS2bn8jFHNyNUiFrnqJpG7lHgxSPsNa3BOR4vB61GhXYM2hcKZ/VP
Q6221aLWert/wfB6vKCAFF0RFrbOSEc4h3T1n1hl3FtPW4QrSeezaTFWjZI6z3ZvUJRK88QGAhKF
WHskgRtxS9Sd2J5A1wjwxmcQ9p90OqNX43gCWHq67FTrfhOMQ/v3U56i+8MkjgoWQaVVyTj3xXXZ
YaD7rn86MDcbaxGdPMiA+si04LdqekVJZQStClTH07GRFAJnMMUr0NmS8MpOP8u1oMSqAfRjlru7
xPU9l/wibYLaskHFqi6owccxk6dmAtQh9ba9fZT8oJPkEsQB9om1bUcHIPcOdO+8dk221+q/qGjo
kMajU52f3WGhr7m5bxmoPUE8viu4btgsCIJX7wwhis68KZWIRdaroWCicdF3s8fYbf63Kd7QlG8x
+AajLpJlCE12TSWdwLlYYjAW2s+0nGZ4wyKuIJXKF31n9hzYigA8xg1LG9ptb9iLI2fWJZda7gKp
lia4ub+MuC0IYGAcjYBrubIniNcgW8fxdiOsyrDWwfUahz3R+OzYCkV4eELNbl4TpK3XxTUhkvr9
LdcebhtZY0JFDKQY85DA6Wd5kExAYf7oQ3lIeChPk8cvcdwQyIK03tQUxbrlhWzCInzWNcl3eZQz
PN2F3k6kqz/4n9uivltsDNLiwa9rEb45ZYisX3kaBDHoSvoHNPsuNXLW09268l9Z+waeqcztncli
wNMF0ghBkgaaqGeKgGG046ntPmygRPcULkhXAdQxj51Z+UDsPLCnIDkqcaNcQA5DTtMW4JH5rijW
Wksfr5ceF5HiV4mq9Nj1UcxdQP9a8O9/LM/Jfa48NC1Kka2eVUwPVK7x4t1q5N/UoM25nga88ot7
d24PsyzLpPNMQB7VK0fYJDXLIU4S5aYEgAB5N/X6tdTmkfIbTaLiGkYo/93hnUfAKCoJSIlf6qaF
FR4seLOax3yJ7RFvYsW75eDHvFYBiqj2gm7sSzwahj6/PC1Pl1qtsrhpBh8xbfY1VddH48ghMhHr
V3Gp7U3o86eNVtZ87meBlHm2vj0SQDXckwEybiVAX8RAZsoSj+Fssba+mRPcNpRljhdnTDurV75J
SPzeRcqPEzBEsUk8AH7H3hd+3Nsoor9dUJB3R4srJ+Lr3P/ofUcx4BZAExT2TiiZCEbDIi4ZAncC
OWE7p7QTeOcHm4ef7icW03iKSBFBRoDkQIgmntXZBTsFsa8yglhaQbra68sIghTCpsJkMtzS7IJO
hzzKLct5sZoA8XsbEhkO0UpJwCmRtM/dE5lRmFfQd++H+Tw0GxD1VYHI35MoCYAiylvSnlV17fJT
f77o0fnBNG5JGHRCaIvG2fnS7aDslr4CHtK3ivRbJV4ElShEwORc0/KaGLCM9dYmQPv3dJEi/652
5tShgoXqQ/HKl7XyAQHwKT+y1/ae2kAvh0vORIPJ3DscoJmkMIKjRaY2OANNjuOhqy6yDSh7Oztj
Wlxbr0x3TSw9qtaAzZfAC9Ke4bfPuZIxG+w1jssrxl0EIGo/Cze2WVw4GWJ9ElG/Y729xq2SFkGG
yK4D1I+OYQOdJovXPhYHeBgBIik3V+8dlF4fc2zTAMMYRhoq3nPqVxrDE6U4UXEvA1w0HFeF1c6S
/C8Jf00oD1A8CG21KHx2TJe64rSwYSZgpil5118zo38Q9sob8yql7bknPFsF41UPcPNTCBzq6IJU
1HL8f4o3+iFY0v45VyUq4pHdpTsRz3q1xL8ncwSdTSaHN4VsQ1zAOvU54xa0O8jV5e4y0URcb3+X
wE6XH1GVvGb1vcDgYEE1o+Rz3VL68IOvfRqjnrP9qeeDS+9z+Mia740hxvvXla5HQuO460TmCC4P
rCaDbvc81DANFA0Iwznht9yV2hYgLmfr06KUKQGdHbX/hdlnk8Igt0XKy5mlk9qpHiqVHmnSEZ2o
E1cEEV7LHPGORVyX52ah8bvJ+Q53fKbQI+m5gtcifQDwBfPWbEFB2nwPMn6l9ixK+IUZQUmL1MyM
UP8OOcQtWWVJC+JRsJTJRrd9A1dBujSMLCo5r680QW/ylu3vQIaS8GabkO8wRzImipnKg6QL7awu
zPdo7RenWK9p3oHnQeIUOkmMaWnAKPRN6HhmCRrcKJcLmSmq59rF/4P+ZA572Se49dj21CC2PjGF
Fc9sezw6DDysE52Q+ErhyN4GuUWFTGVtc3/z6qkjxcMehRj6eYBueVLLCFbQ18FdXBaNhqLKQrnn
OUsFkn/iZMDcbNOgRNGaf6cE6WdNnLpGV7RIB58LxT5WnF9a0MzulhF0yyVbZdtbpdGWjfgnlmuE
zrMmy9DoRfeubPWcbz7NjPU99zxxy9qc15unBs22A6FgQVWl238xxNgeEfh+HGqczIp/CZFMEXL3
eh1DTlPkcHyC1MsAiF11gFoio0zxysTZAJTcdnphPTxZtNcNl2RnszY5I5ZJ1bXSF3gU2avWpKjS
oO0Gxy161hOIZNPUeglbhtcBvBZCuAap+MDYpEOir41ie3Z/tIQXT/qKOkXaMQnGj9r6WzK3Bttx
JWW3t9m9jQoKaIfjk2a4dQCeuTlNrgzbbyzMyVHS3VY5XY8B/E6TzauGt0hE46O2jXz4ICK+SXPo
SPmDRMPR3YvsPbMOSyTdq2Kfu0zC5iDqq8naX9JkGinPCBRkONDyrdlxNnttJIHBjU0Usphjlii5
7gQdu/j4RaNawMqEvIdXJY/VNKzHU18e5prG8PsfUDK+9/yK8t0dgqvFGK7DRcFQzhzsPpLujJZj
+5zRbovVMddqMm0aBHJohwP1uj6Zxy6siG6rKZPZRzcy/Ouf8qhlNoP9hAJvc5QFenFs5iMi00Eg
rVuy1YoHVwHQ3bwhi8pbAVME7pRn1CtxfpT/RnpABqONqnk4DMzrEgGgVnkBdL6QVOq6Pp2lyi2B
5JPeIDqF+SDaM6N+AYiH5dm2jFtcjKUvg0cUef6867qpjdAMLAeihQsP/DAvgvgG1bN1R1fKGGcy
qu/cMmY8JlICldxdoZrF3b+RhIA2Zrw10IDun1cUHqSjVy7e6sMq80jmfCrovsnT51Y9FLyXZl0K
gNYbMgW43FrDaQ4Yquci87YVupE71cOdjI5s4xz9FQODjhU78pSyjLo/hvA3DcbimRx62N3awkT/
cqfbtfXko5DPdrYvb5Th0tx4k0ziR1rLbmzeaa2wO90GZ7qSH716yVxZBD76CrvUUGPGM3uNR0zg
nseiuCN4VJjfRl9UC0cNT5JoWK9gR7YV+eUDAqwoE9hxicN0z9b4Q/ZJIrh9T5W8t5Zk+yUsDI1L
cB312JV1T56azheh/XmBMq+gevH3Rr/7JUzbKrdMhAS+83BmiKOpMvzTuCpXMnih3No+J//kMqRq
BlG00NpTOPY5zB3Efw1QPpkFud9407gz7lI3vr0AqTibwd8kvXZJXPY/RC96qi85qJiuZPFeAJ7f
kppfKcVdYe/WUPAw6kT2H7RzN/G7EPStjOJd51IOGgw/HBbK2XQMw73B0eo9frLjTzI//26XYa1Y
k9ikhyPXep6iH+RZovfUJFazp4hBK9LyST9tM3WstPmj0dFUXkEtvW9ETVGoEAqSYtbnzU3Squh5
8q5Hve3rJj8tJiMk+lcwAy01euyMiqJ9VaThLulV+DnP2iB3+W0cPx55r65Jkt4TST8x6yDxGE+6
YtgFDoqULTFcvJUDfmKNTmQxK/404CDQbriGY9UZqBTd0ee6U6kdXcUIgSxAPzdy9khRMjLsfVeN
7/3btEjW1Z/zVnDcrvWiPfdrM/9W/IPwfML49XLAPXzUSut4FayJk6ZljHme9E8PmQQsIkeZrT3q
XQO1Kf39WMhEWmDYXC8CKywgaVRP4PKuhlJ2DxN/7WRc5WwrU08O6T3TEyDypP5/NeoFbIzWkd6B
nTrg/zNATupExxBJppsqC2txK6j+0d4eRTekspSJKYJcpP8KJAmLEYL/edurUO6OKMVSjs+7+jqC
GCKwDFNpS/39ekF7ebcCRIgvErhAJM7hmgpC6uIemyk5/xbDiaSETEKkxUgN9lMXpMmaEAgBG9ZL
CGoHczyqzzjv6y+jgTJ8tBc+h13TX9ud/zdKBAfG9Lvgpgwtm+5czXRAtcH4fHPW5nTsSMMxwf9L
nfelMbj3oPpmQJNMYj57+BSNGLdyoHuvAiRfBO2PbZ3Ma64TZhCffTDrwjXzf7dfFrLkUoGomXB7
fkVP7B7wL8XA2f9I8MkD+/ggnxDMKmSfMcBiJsRS3iQ+CeSfHcvvNHQuWRUSlpjK4GMeY38H2gR+
LGGyfimqlTcIUyN5pNnZtiktmKMDJZRYDxQMLXLhwbWTAVqOGTbC8LJ9cHeAvezJx324inuVL5Ps
DaHvOaQ+gLDszGFENTU2+8lfFz9BsWCe4Vd0EQUrhcPIoQb3qHMT35Qhwhzdne2L1DzmLS9KYkqC
mRHIFCHynJxAo5J8FLYDJaMfQn9msHseInB94G2Hv5UQditz8m948uor9rKGKVrbnHgKet1WdEsL
BqabErZmVgUPG/u0A/OdnEnE64L8eRFFY0EKivm97iosJr3njREIB3JslI0JW6f0iMzP+Yzd047e
W6upnD9KVEBmsDcHSLhiY9A9KS1NYkLm7omBV4VCjvNoaW8IhF4S5/huIXsCAHdzCsJpn38951Op
zsn2OsgFhubHxHvC055x/GsQvYMWWDzZouY1E30UePD6afzPgrxaVACqN7hon/by+q1Hcv013Wsv
CXiOT4/V3XyEGVZUDwqh+2P2L75MiCzp7DVQ1Yx3M7bn4OKRFgV/8JRvGSg5SJ4sTTDRwuA+bgT7
LLSxWei7CkYOMXwp6m9tTi5m/cYUEB301sVn0aZUi/wo6Wram9nZvDXCeXSvUeOlyOPFlQGJj+jS
KxmWuvu/GEJaLZZ/2vvaTbJW32HCasRsP/g6Cfm0tGhDGGAIvtHbq757B+FHXn/KlYRsFtlYY9oL
hgpXq9hMfcgkwZzVu3wLENuiwLp/C3pepP+x7bBPOppdNuZcGtmFzJWcROvqH4i+k5TRSHia1y4Z
wvsWm4saDtiD7HN3ennVOHGza54BojLNQX7li/u7o9F3kCEhFlH2O3uGpotHPTKfhOfhInsIWL9g
6PbvwHHdf3k632y718i6NvQj0rpoDKx+FmvnkFW6cZzDZnfdsro7zHOZjyu0bNYI7xJ2POs1jD3O
nMyXVfGHDKRScGmc83DQ4X+As/BgH2EjmO95Sma2GtSJzk7I3o9ThEuUNy6utxOw2KCYG2g+xgtK
IDJofTtlUlzgzyHBk+LX+4CX1RykZZh+44YNtyl8yifrpJM/RWKG5zlq/jFsaQW6/2lslxN3thmb
xDM/AzMMAaQTyVOe9/0egGtS9anteheWSCJ2J4xlebaXSL9XAtqppD/niG+6f1koWw7caYokifEi
YnBtDoUuz0nIYQgEmmnOL98+CgWXlm1/rGrTk9raDsjPvL6GcOGgM/OC9IsjOHeNj8/sYZw20YG4
i2boVF5pyaBpyd9qpyDtpBLex1fX4eujM7Fqxzg9KTKqLOLfpXSSrEs1HV1Epravq4CvR4cNJxsb
sIufOS4QdXivYEDcXoJuNS8c+ICTl0gwtbteLfu1U8zaXYadO7EJQ4Lqb+3MgCJHcTGrTJVVXD5i
CT6I1sxyi0LC3D/SDphAWtIOM1N5vSdPcf79irk3SwEYT5f770URoWBBVxnWuBgS6HX9PKg02eZU
ZmreDfSQXNHxxG0brSuRMMPUht7q7KqznIq0Om20HokKlujUKqcYNlylns4OYyGBS7rzfVCnd4tL
k4HX/rEct1WbXTaDZnMZMxJsig9CMx4Z3X+vZ9Q+fbKuNBCCmM5xHs3z/dLS9yr+TlWj7YbXLkse
uHHND3d+IznGG8TIGGn74Tm/+ja68a2Is2Ss5qVUvuIkqzyyG0HdBjhG4BAYG4wevngJ+qyLh/Nr
aY6K0ofYzVU/hDKGPA6obWZB8sXDVQahylKTAo+rG/gZS1KBMQYxgthybWIqIbL3+G6HXqiN41sw
l0cOXdwytt4z7i6fyJMsJe64hMw+7O+N1mf3QNRLUtvyABcz3NVZYAyRp7oq7cId2arOjucJIMh8
ufKyaeHzGNxZHmY+hcyTP9Bq2Bk3NbOo4eYRYb0CuwZOwlIP5H2CQ0Z2pM49hcou7NKAWlEXUWuj
ea2PnFefeWfsrWIqyNhSFV5YpssKe+WgDFRNLFthG1LolQ9+jF0XA/JZisocuEa2nWrusmC4jPmE
MQdS22EbVIFtqhFrlk99MmD8O/R66n/USu5rAUIc6dMzEsXxauyBfERRHh2oUZS0FOS+JQWK6CcX
6jTglPeaxkd6GRVGF2OovvtB/N5ZSabUrCel4DhckxUKgL0WBqEym/p7HlxFBHChWkaSBrrq/Vte
T9hxg18zJq5Y5mhVj4yChWHi6JMtVvbept9eqYs34KH2YlWln4VZoCCjemBTh5UCI9Tvow+azWQt
UGhSA/bYdsdgvZYsZ0UrYMvCBnhy0rY+nOTGy6tsH2hH1xjSpfTBGO40JV18evvgb8h8pAkJSnu4
AG5kRFN0N9jyJmDJ7RM8li+T3IZuUQC1h+piT73g92noTaQ9gTFCu2ys2A662wH4fj2GELthd6tc
KVq3eA9C9kz5L7Zv/nPMYaNVcUCwZLbg/qU0dfk4Ar+mFkfk5SdGHWl2JtDPckzqvEtXPpWfZWIt
gntBm1m5JHPGWxm0L0hXg9YtpFq2zGUb+Jvar3q23hlXP4+Q/moc+TB75QqOoC8JXWruhww5Fk/l
f89I9DDFO+8kRb75R32Pa8GvW8xcaBO3Y9HWNrCAUoe4LjsInCi0VGrfM/V7GbL+MKpntFsv7uG2
XBon9bfzyLt9sZkv6PMU2kHcX7RNNx8UNClM+lhdXk+oyhCFjg5nrqqUu7pqc2qQSChJxGSezWog
TJV6eiBRTrmU9yEXa6ncFHfgTnJure20E09UoqWCTV/lTG7ln6t1nJWUMXfYfftKORNGk1mICNNe
8gmppqJJqYuE7GETkz8iP6U6TkpSuib6ZznuJvGVv5nhHYtjna4rnXJLL15z80B9FmnEiXYlVhVe
tDPIW+rz9Y+BWpO0GWL89Z8OYncN4rJugTmNS8ib8g3QTThF/Hp1ntn31XsDsPI0iV9uYsJhzZyn
3/Lv196Kl0YzVZiBcE6C1U/zAsHj6KdxpcJqmUSHPD1BXgeS4BBt51gjJSIn7/SIPOq4DvdrkBmb
kgqs9XXLyoj7/17ZeJj/I9EYEtHWnlfu0WxKA4lq8/3UPaPTjve+13VRoRs0y/3cdsulfbaBtxQi
ndA/nyP3zs0b10CtyJX0fCgpytdaMEhlOC6hAMdB3D0R4gPwCNPjXOZqWzNRJGNt3htk6wd0ctr4
AiimehT2uTI1B+GoNqF/Iv21YKEdzj+ucIwMmUYVya/PT/U/Pb5BN1UaXAYh6bXhffWO7na7ztWF
JKCqs0ZpDCzr5sVh8zUD+Fsqw292NEg4rES8wqLpZCxUsrwjHmrD5qBrz6kMOxzudFJY/hb08aNU
4ms5jnj1nEGiSs2a+Qd65U4rUGKQNDtHv9n3K9g1W3Z1fj3DiRyPoaqqpsxmka9m5RKmeHE9gaz/
qIvaV4Puh/hwdPTpW2bVa8Afa+sEPycCU5Re2vYIa0RWa9pNmSfkrnyAgZl2pBVQFEiFXhFopPGw
uVLQMgCW/6KiKaJTd6SuC4wS/A1Mx3YI0+T/VY6AYBhKtR7mpGlpD25z7TQFdvvG3Syvm9w4cKaD
ru2FA+U7J73SrW25KpDMLP/rmWJag3X+bAgPdR0olzJp5a9xRpIT8Sh4B+dEpDIbx/RkaRQ5qDOJ
LzpRI/UynzZqwAz8UU84/W7cUFt2/CqMSDJwMJeREjfXBQOJ+2S55Qgwt8IAQ3Fl9kRHPOzZ7HL9
w9Al3RbB/yONtlDIYQ6bd9MasnDePYQRoQdBbJ8xsxRLRkv39vlDFLG4KxanZFz8FwxJL/HYjsl1
s0bnH46D9fvygMuOnbSqhB47yUq0Q5A/40R9w6y8K89/iJzh9Ax5UjlNkoeJvZ8Tv3eWJOfiSQvJ
vButq5XZ0Z7X42usHLmb4I69V2T/jes2DR0/U0X2mazCYdGMNZjOZwqJFWNJrbv4KDpgIxccIim3
xaJ8pE4uEZkabEcPUL+c8F4sZNtHlaR5F0c3+HIGkF0PbfSRpdJqgS42Mg3mOjQafLJ8CrISzFz9
7d7imQ0UCtOj1Qwkgh61Q11K7GglDm3y1XSQp+Kc3hvEwaWZBmXzM3ukOcoFtRiJ7Uabz1DUHGhp
AvYOu9VoQsrZXEleueHxfzVLIDlMRDG9IVAjpmsWu5FaFzHX8dWqgpEGMoFLUAapmrbTMkH0Q/AN
zri3fmlOh2G3axpXb8jQvz8Jx7vF0Z5eY/GfVjP6UNev8xGB9f3X/nWVZFpRhHu8qm61SYgsCrr8
1CEZoPf1lXDysDpx0DF3le56OooTv1Swml0wb1s8cWX3hIZAV+Ht/jrdrbtCuD5FJCa4fAAinj6h
Zc0LLgwAXLyqid6Mz0DConoTLMwUHGT+Ft6UjAR8zibVDItyNzaWj2lNzXGW2+6PhsLOM8oUhbY8
+1xCHvZq9gjBi53xVSTIdEKvEnt/we0tCl/EdtZA+tddwsTSXtRJZYKXPMLHY3nDR3+KIG1oLZiF
aBAhIkuFwSgAnyCQIV3NfZ38N0rT+y3uMguSR/Q34ORGA7imBunTi85P8icpRbKSyuq3NlNbfCta
PybvxDJ4a7gH3KxYDBYKidxow6ye6LlVQT3zcTjkmv/e0RK62i4tIEF3wKADvlhWUOZy85Rp89UE
+eavtW7qzcx0itzHfexQwK7clTkIfMu16qaRX4PPQ2zU7UtHnXLORFM9c4n1Ro5PbCVPRDEftJuJ
NBLiItokxmhNP+VSDtA4qk8zhw71mbI8/pZY6tehCR3rfQiAWWqHZDrQjnWUQO2ZOwwRY4YfXGQ3
ahgv4Ae0WaCFWTapghjmqeu/iM9kwYWjbgqRHj6pFkCxSkLfxG42+WnzzFZpoG/8l/P0NcLPzGlm
QAH1NJ5zJlHAFRGlwlumDTM3Yw4unhB6hQviR+N7TmDLBl7Tbw3GhBvlGNlIs7NhTD1wCUc3QBLD
EAoV73g9qO86ygDWfIHYQ7sz6ER7cPIqaGBmhDk0GmkzTxowETlvpKOHOh0LMc6pgZPjam8k9cuR
AwKkooNCnBLW64TR61VhEciYjOrSrEFb6HMtLEfKWrDTyLGbH6gIctbxC4WsAnDzvdpI7hO7phCG
x3gReKP3ccSMFKZEDDp0PJ992kMUsQlt5GQx4M7y/c+HwMcbOnSgsb1SOjZaProx3LlHqHl5SoMj
tZYG52BTqPY26sjN9lALOMPscLc36QYnlXnELS0RqcX0Pbig5ebtfq57HRKkT4IFpHU0MXNMaWkR
2JmWFVTwSACvNCC4qavUj3iULzQwfGtolSCVGS9Uqx4h2uxK12EtyCb8Ox9kGhb/MkYnegwUadrF
ryi5FvtjsASoHJjr37aioHIbq2gcVYvwwY/5AmIbk2vWlR4UzvMATpeRDQmldI2Fo7wEwnC5xWtu
aSR37r0cAek3U7sLbNRKjIRxaN8NuY4npwTEsyPIg6oSZkyrNEP5IkxkspsnmyReRGsWqKDHB72Q
Or35SdteQ0vSbNXB4L5OChhSPE16XyDUQxtEey7w13CwuSUCK2LXPmJGdlgO5FqQ6MgkqnEsK4yB
DRXeBEtW7xEoHFLXWslVLoWKVZvot7H28nzi1XfDu7bmWLuA4+jG8LuuBHjQ88yJ8O6htkb7Zlg8
+5R6sunJ+FY4RunCMroKU8CdByjh6ah9AqBk+0OEFIR3GUtaWabXzptDu+XYV1zZkNrnxkJzmmBw
IhOoSvu1pAMRRfNRjvMG5AFpn4KLKpYYz5NxPbTcqFZ9e39JsgEUXIRn2xQeSBeixxul5PXZDHsf
dXFkwmdsSEAuA47EAtlKck9Z+qYckrjgponCJb/SW6cwP4p83vjvjlbmc9v/2WhzM9vGo3FQAdkg
jscv3SDGUIGQjtV+p5HHkUu2Hr4AVv609kaMx5tMd+MgfHpWV5hCBFRUXeFNhEYy9C2lniomwVeE
G7rEvTKaR3KIyo/NXAGP7OT6/kSVPp8/Sl+pC4oCss3/+0VUDWAltKBuZJba3M+l9sqqww/WK3+4
ZaSQmytdCy/NMYaZ7XUcSbzg15X1cm9Fs36gLvca370VFypwWNzGvcP1A6wHcX+WfefESgoaPWsK
mHSouBHZSnttNhMUDyjJZqjElwESQ05uQyZ+J/sKFsu7mC8K+8ZL7rbrATqmdvg37UCp3oc/BhCK
1Vl6dmj3eTB1ihslT4IZXBE30Fh4tj7/s3RuHhEm5T2GfOZt2NG68j6VQb+OkxtkbYDBRtC9BPaD
dP++3GwccTcBxyBP9+/xVawjUhEbkh6+vQEZzNBdiyzEOnEKiYZWcig8ab/ogVdTKEULOxrpDxIl
Oor1aGLnED9efTBtPHgGJMSAgOyUbrP2tQ5hkIe8RHBQln1+Wl3KasdF6SlVmMVfsfFF4sDSoVG6
9Bo1OtcnkSEPAUieK6u/ggdrO13MMzlPfT6djv8hMsWj79TdkUpWslFTp6D8V7Mrx9QD9JOmeT/a
nI0oIXYk2Jm6JcKxNd4oCnVtD+zPFMHG27WooVstNlErvLsuThBiw9OaAKucwUZNbQEc+D7SB/Y7
ZLedfV9Ywu4dPIt2Nq+yZ2cVPInganhir/X4hNU8a8H7+bPZw6/BSvQZS9nslTdFt34P/qasT8TI
TaCrWBBHPJNMmBuGWxwJstd9HtvVMiwDxVNK4cb01sh1szuiGTPoU+od8bXFZpfrguOaUwBAMyH/
SFD30AuFc9VU6F+S2E+x45kZ2qmZjGZaYQmOvytOHIPrSmNysXU1/mZ+WQtDAuoDBsWNXOR7AGp0
+SW4WXCCgpoFNoOvKrUPb5kAZMCqLJlJxmHpkpl4ES/5X8lFCJqIntugIJu5SzPtZNbbQEtx2iZa
FtBXriPb1pOxVYNPhFO5vAxk83rLwhHk1UKH7HQ6jjO0aXaSz3HmZBt+NwNkrwi0iXtWn6UUr8pg
ea2ZUs/gMOBcvkBR+0la4QxFLpf/F2PNXm8PnlAbfEwIvU5pdBHKE3d6S46JXqp/F85YGa3GpBuE
iCsWbSkmmcEozvSuzjy6Ho7E9fNo8+H+LqPtnBi+0zeWN3ucRB8FTMdunSOxwt/z5zFGRq/ygqWd
YJMVNEhc9sbuG5zRKbODFd2R8MsGlyn4ERI9Tnepf2HNbeR3gpvqaZTMF2cq5aPGyYocL1ybJXh2
fPLf2/oa9R5rEzO8hD6GZkz/Xy/BsFnTne6wFna5CdUx2GYQ0MwRudj2i2dheFgqo+SK+RvI3E0v
sQG5G2gDa/5nECUPyP0EnHTLdQ3UNeUPJyWxkGkCDyGeq+BsPFWZgSoMbIlMk0RFitHhTN6RBqik
cqPOyIIc/DLjfZbvxV3mk3iJMnKB0JUfACmaKSpTVOYBLWqUhy000O2BQaONgqbG2espx0Nfg6XA
BkBmLXR7IUqC+qmb4i68zotUKsRsXvXVyciYgZoXRNlOnSEx2W5EqFNgcp8vYUJTvgVujfUSgQYb
ZzVuQfD87T1S92BXHVTl3kYRY56H1ikN2ucvFH0LHEXbtbc3941U+hoz0g7EHaakY8NfOFyj+bqb
ORPHJcVzWa/t4DH+FQBnzKiBrEzE1V/4flk2N/8Zw36kepEXNApY2NLy9KQscTVsmWmSRcFObPIY
T5bBvhBG8sw6h6Dzt9wc4vFdJN14b/25zMWOmLgcfUgMZSrR75p8qE4GrW2+BME6FjNOoUfkQsIh
SRjHMFAtxdeyA/pxMIWzeqqlJICY/GUKUi/reNxAScOdtvfX2oCIHJQNzMRb5bd2CDzIC4q8ti5A
5enyJvUTTvEiLOSzjJUkWoIuoqegzT3sfz8tPsyhLnFlKpfWL7ogEhI5K7XaIDCQAG+pSphRvgYH
fG7iYf4NkfozNKekYKDnrdn4lIgOIyql6up206Qg3JfMEn0wSHB+LVVoN4wUp/0KapIB7rNSnd+7
mSjjkLHL4Bo1fxTRGp2JFiEo6z6D3EpUoV/yaYjFSyTs8Ud2dtYDDxIIAqdYMyN1rsHiRyP8G/Gq
fMK//WhBU4RB7j1o8TkXdJWqhYNJ9695ukoqDVdm4veUL3qrdLmFQdjzCZhzi3IirKsGxIRfGZmg
w1zFgJBjiVt4KILEX1sGl2FTg0OfERzjCclc+IAzjjmBGFvI5WaYE3tDIycyo3bv4Fvs8Q2YXchF
qXHwjbQ/beClZkvlMRoE3926ivECLFPYxeA4ogqHnrjbuo45upK6cdN77RNc34CQSfOfbJBZdV6H
NiTgqdF7hSNDsEE94rz0FTyrfBiDCy5rfKuL5mRSDJoLK+0x4CQ+jxDqhg+ZyO+Ipszp63WEDIS5
fudWnA7F4JN7Fdq/4T4T5nX4FpuYwS5gLUbzr7ww5QXgXupJzQllYF5q7lfC05uC9p+pK+avj/5L
vrpakpGknuhxsaph34vPvNaDk5ZGZe6lIYyrHACDwf9piUNGH48NfRl6SipuBHY2WyGWEaPR3ldN
n6kszipAseR34uRDLZ/CLjlfoYcTLS/vbw9PF+MXf5MQzN99/38dIRI8yQ/qeINt+fYDB4rM0AQx
E3yEXeXzE89LRCl0P3nZMUuDy3HU4CHrvns0Jhcc6Rk8vHPGpVCQe7ZpE1ZhtFb59z1DmzN2GO6Z
i2mGyQfk7FMHRDxaU7KREBCxdDbglUP4ctC4RoY04bkHLzKR8msvAq5+jE8VQme4lajVir+StDFw
tsKi2ldOVpuqM7gW+e+y1Y/fYisQ8by0eDdYr+Vd3ti+Wa6MDDgTh0TRek/fuXnlI3R6AGbwu3ZT
Zky2UCi+ZSUVNK/QImZkKnveJP6CLhg+82swA98ta5QI3qCg88Ftm4JjTP5j+fbINb1JWNpmRV7/
yQPEKjpUQAIjL3i/gduucW+HJlwt/NHnz/i0VMynrw567BEvZIxCIYJZqsTHXPeHe+31rQHnlkib
lIY3bYRbdtF/AGK3y3EOSbdqK0VFgusi5t62PFAGgGTuWTpuanSZeWesN2uzRKiqCIfamVhncDlz
t1+2XN3y00Yd9L+lV0g4ssieauGDMJWYfoPg4S1FT4qoT934bJTuQyE2H4DeDu2Scn4//GQLYsN2
bw9/oeWE/c3vFRI08hIIM/fDOlSd4juwyp+Oez4yhpR4AARnRZmq3PdGJPgg+iGPPKqdjyaF8PXM
3ZWiEiYbkDYL99W2ZibWLq1oKqCbzBV2lwLHMOnyMDg/S+gH5JE12L4pGWTNLb2MYfFKalq3LDwA
isHczRkmNvO/UJyuOCkjhmYnAL2APNVnhsXkTx9SyXr7h80A6zaQ75mvMCyKvB5S0CnTm4yElh0i
GEyh7KSAUmE+c8HA9Ec0jF8la57nODLcZ6oMTT4Jz/52fAAtQkJtb4cVqoxh2hzNTWRJ96DrCSFz
K76DOz3Yxy5k6k5m0Dimq93WPnfRCBPORg9st3br4HQljsO/8xZHI0jP3yA2PvbpMgOqKIVIVfpI
YyNR0l4ro2Wpn57oELM3c69BzHPMkCW1Zvu1gqhyqgGyyFURENU0YJ4Ivb/YAlpWejfNBZmA1Bl7
zv8Ie6N1vjVDg9jj01aw1dKZ9y9cs99C3//n0tHiqGr6ezTruqcoVGZ85ubZYDFmwxRkWThPCC0J
ewhKRxHKPsFAG3i43F+ECk6K76U764sBfsoYMxotd3p19dfZjtMdy1pud3IIwFkNJMoL4Ru7Jp5R
dkFYmt/b/6hT2E35yvds83/mxCq36CYSqeaGSyuPtwJw74Q4k4OynHr2IFjwWAidScdKTKixyx+l
H3xWsyLhmMf+VWmIw9dVJrUccwoLbyvh3r+jAENueKUsXJ9hgV9XXChgkSdZM0EVqCn5zP3QVTN9
8Ud9SLIwfDVhGvg2GV+vNFB+E21d0cgJ6gAcvEOhVQ58gLX6XK85ifa8Cq3lqXCGNGzWSzrRG+YR
TxZH09Q1M6tCOrRngP/hgCdaBRjSw1LZVvk+Dp1uCbBpIi70XsH+68S3rOtubRFUms/SEzOAKrhS
3VA0M2erKXPO8lzcrLBupwoXfJAqkO7Dv0ZzvZiG9O4KeZIo+o6Q5sNBJ4bQ5miHaYP8A1vnXv3a
0YEaTQZLEc2OseAsnphHcTOprQ6ZJRRFsi/rCsDr3s0kRB5xQ5akc+/wsJE3qZWnxIYfZPiJ6Y1/
ZvsFASBM4gyLFUugsa7qlZM64TVM+y/uDLjXp5jNGhmU0aSAvdOh1/CSE2moIqp01snWrjWYdqoo
xBFSiXLI6O8b4sA3Ygv/cQ0BLq28Y3+f1lv+CJxPlqrj3NpA718kCWhdw74pJYA1Po4YxCG+hobq
747ngYCVCWDCUhKi355sDEPcxPGudr82I0reaJaklKFUmTwEiikLkr6TVk9O6Ov15hSft9aO8b9z
FGQyJQjD3PofnUrdpAmW3WQEUj1iB/89r0HGU1VcXfqPVzUJJIKNB7v3VvdVZuTkEvi/dmjgWOL8
PzyGDSV7nUi/urxUHW4/yf4JDxM9GOLImmxFkUxSYh8UiLsWUQ7uu8xfwTkyDDoROBRaIkmhimvM
mkhHnTluNh/SiomcSF71QK4z7rBlWIggN6uGHOcBbtBL58qtibTjpsFQipweUzJEyVoMt4Yuxrbj
lMSU2qnEep7W05srbx34JIVfkfxRTtRCoGs4a6NC+mS5i0sjt2vYvQNrVa28WFJfMR52RxRoiv79
7YWiL9i47jU587D2xmit4fPtDT6bAJTvY6LwX48iPcwL3KXdSwsk7Y6hWeiGnU/6sHeF+8JELs7v
ZiZip/fgSjBiYxKFwvp0YPSrNhcCg72xGVoAUhcLJO2MhMgnYTbr2dDlfCmZDJhh1NBukc2njTJ5
V2KbW7A+l71TdrrSBYxpeDmlrfQ7C/E/puUJ40oTJQvk2Vzy11yBCLuWK6q59BKsvt1H9xNfqnMk
iCxfrJPGfb+7/f9pHAM03PLdb0NhkkEifSvPfygnrORXmbbuDSoouatCKcY+t28GI1S52DEkO2l7
eROQxI1JhASEWDn6TUdKivA1ZxkXm3UMsoxj+ZKdNWuG7jAPH/odkK5S5xeW5oWdrX4ErWLQuYqj
n3YQEVGBpO9Aut0+mwsQ4pF9tcIyJTmkpGeuN2DFuQoN5zeCXxfOPOlXeyIfVE1IbQqqnGkVtyfV
IpeYjxDNd/L3KglVe1st9pGFL3QQ4pH4GHyuHyiI7xthFrb46znrNParkC37D3awne2Rh18i8Ean
Fc8Q/BR77tJtPzcAbuRWh78ZgMUkroBOzjpidoslIRkEX0WQ1adY8pnTSj0qKYyRIPj9fd7hiS5u
aQ5RIQT1ZNyUTPW6EMFUezHvTIcLzHgxOUu5ylNAx5C0UQM6/cfLylzQ/Z9v/OnBtQ0bX4cBo31H
/abHQAnVlW3PVKtaWAOlbXE5r3RjA0n+Kr6xV5LQGJrGE8h06Li6LBZ5DzaWaIgOqd7vlE2IhA6c
sN7qWhesv3xsv3KdDOZSZccuXqav0VzpSAGKd0GiiOO2sQMrleBFu7dpm8zyydCyV8Z9y1iC57YD
yWBm32aZznWpyQrW7WBIitZ0yy1m9WRdHhLdEi1yPF0vb1OHttx9HWUfB0oBxxc9J9JgsrAg2S2U
61D9dgFRj4BFq2rWnUJMhM2qz+UT4wQBguJ27Jy5SBM5hNlTwvU11OxoqadjHYQveAgP/1n/2Eo1
FOlKdRqUpSi+49f5gmkyJ7KDKx3SF4W0Nq/ir+sgVHfTReR1Tc6KzY0wWW7ydAbkVFiAxewekWvq
ofHuW5eqsonC8/S5pRcS28M2dsCsyTWgItb9rs0z7Ukfr9sSnAL0tgOPsJsfqQx54B/S06HfuPo0
cgtYqbgdvnS8YnRZzYoHWM3WQkaMXHPfeTabFRpPNW5dXScds8WXGbeA2++Xu2ZZiZqOCZXSpNq9
daTPYKZsLaDDDZ7hYUbqwpS9XeY0wzFk5mW5kwSrpUxI5STesDKEkvQNxcWr8xX4TCTDoWFbNWLB
dkxHNZrNHS1NXUm5VdgUiz2F3TEujK8JO7EXpYhlt3ID1eKEvvexJ68gj7+eTBHDbk6BFeRITuTm
/lC4fypbi58wDki400fNz/THXB6wZNptldQhXBKRB5+4rM7HLS+MaOkv4dz9zlfMU+++A6Ic1Cx7
Cftmbqz6MT/vqrf4FcFmqOumkPfcQTaTYKSkabAvwLMX48d01ISazhF3DqCGlTQbSn4yVgGvhRxv
S8y1qNHgUUaaaefQF0I6ApJe9qfc3CP4wM6Dn8LfWWHoW4lS0lhuBudCGBWM9xS68WBGwIYQHbo6
LVmuG40UTBZegywly7EFVSSWmITwdDAr4nCPScC+9/I95mNMdGznWJ+MWmj9bUF7kW8mt1vycgym
lVVG6baYT/OcmJEeV3iqdgovxUfoZEFdgy3xWagahl9SmgCwvkoEUe0MpfBeUDIriIGGAA25LL10
rdau/3/9kgjnIF9rFSOJCgojBFLnQqCWs202ZnH+roEDEOlZam6de5ZnmdCmHw/cAv/zc5FU/Y1F
A/RCEAA3aWZ0D31OrfBttFVhcXs6QDA/w6maHAc9KygKHiczzrlDJ9UM2cnkC8WP9duPAKdDhB4y
/rpcY4zfQ19fdDroI11NmOikgBmDRzqEkLCJ3Ws9ovHEeeL9CUuZC7EkJx+YyVrSbsVpfFTZr6z/
dn+KfzkiIjrOf7atsjZNwVY8+61h2Ap3GI2mjRfOTqH0sMtp99F2qGdpLMiECfwd34BTipdlP//t
b0sGIGfZ8uezLSK/PEcmsMoSWf2vGWF8SyqpBAEpIz3MQO1FafgMHUzptPAj2DtO+HA177ixZg+H
i+76sIyUplaUmHEdhnYc0h5Ek9IXYe1DGtronKFUSGLNWkeWHgm1U2N+MpvDZQv5E/kgcNvHxe6y
/eVpsCs4rXhzpI12jqjjB5rFmOfnu3J43/Kk8oZwaJ7xhqVBSA40oA/lgAiF0U6GaxBCaPUlvOIh
W0wE/kehfPIlG1P4jPO/ujYIC+82/I4gMBWheGoDoLQToXIYfZqjz/M1z/UWWJcX5PphBK+coZO8
aw4ZKut86FmH7AH8VCavGDyZx4kECstYzT+1tbcXpHxJfCBMlcbPNmH219ShJnpYLBY0hxi1qC78
GSQ4VnHAiGDlUokFxdYrRe5RRBrhur9fJe/bYLjQUKxfGgYp24dq+FgLgwMG8YZFueWbZ3kgI9St
9QNFIFvjy9I0zMf5UhOk4IeU2FPk0uXJiMx/QKuqZKPxeucs6MmXa/Xtlld8uDCnU60FQLDPgjWT
lDIxUJUAy9/G/VOpXM6aYnAF/H1azxmu+S1zy/voO/d0RE1MNmlaQdUN9CZzuZUfD+ExN0E53ZcU
an9s1TwT9uodjAmlM1BHYDo2if+DQBkUIJbYEjPoRd/pytvpDx3QB4RTyPOcXPkm4DiDFIQv6GW6
BSbQWIZptpYUatw+U6UB8oMAB+cK4JRZvv9+wsp8o0DMnTgyNqYkJn7wv5lcuY/mXozU+NC6LXH3
KjVW04KA0pfM9I6MGXwBa91mVgEjsVNBkKYIWpM+ukFnQUhyzcL3gSpZLkokojpy0agDI0jPYvtU
Kzin5Wg40819fjLRK/TEb2jOW9q9vYb2wmTFdYgvrFajctAsZpzluXLdJ6fUcNDLa+nQ5UXjhMDE
m/YMu1yrcgff2acRI3GKZQVnhHc8n/0tJBbZbPVAp2FSdBIDS343uQFvtbRmM8nta8QR0YbsFxFj
wJiWzLhRm1JnElx7qkdTwZXRfFz4AzrX/+MShEbJ0Lu1k5RGWrEK26uTNVnrSUjGnvh86KJBtoIZ
AG1AMGhhVnkiAnf6KgKQHsbaj0G2N9/EZEuFDOQ2ghJ9XQIX6OEEjt596j8+NHizISCAsyZblbGS
kMKgDZjoTxeremoDQlmAYy3r3fNAAPDw3sunRfloIOlxbkvgQerhZHQn+FzflsBhjrkGubCCXSrb
NSWRDdHznj1nsu4QcYGk8XmoWivK9GGWpQfn74rw8h8oKIb+rvCj7WOzhT3Rj0QkJ0LgnWaZIhCH
YyCoh+aZloxZKEjf1IQPa2JbMHM4MLYEXncLbrslL3abwPHcr/eqaqu2/6jHwP/f4vWG/iPo/z4f
J2dY55qNlK+Go4IjPptmrjnoMspmwhFmMKkFVbZAlb2K6Ta+gVivUmhuKEUX9ill43BTIRAYwIN9
Jyk81DweSqXSW/is1q7J2Ka0JAnS8cCQokTvoSc5tEGMzZ/oPxqEGKABTZcbxwMAyOJbseJAwxim
3l18oyAhk4aSuck4xRPTUyDTg2Ikj5zCc1uQTMqd7KC0XhANKWkTcC5b+7tXTZ947BSOWWjbsbS6
j8f6LW54ssXUjsVeJvE0jRu8sig9pWgglp6W8mIMw76W+Ts9yHFhXKv6JUCL6dZL/q8vOhI0KF11
rk6FQ79Cqw7oC84oHo3zEIroz5857Uylu47wm+LV5jfDo0Mk5jtkZlKeFHbIRv44xcWYINoEc1Z/
XEL9lJBRPeZi4EHuugI8G/5bF0wosBF1sdHRPRa78f1oTrVpuwP33aAVceUPLxjqT5JFSDsmxKFb
Gkk+NzOISd1MI77waQNJHI05HfTaUMI2OPC13pMZpn9EyPqpxbnd6KRlm5tjsU5vYEXdyDbbGTsG
CHYUfSXmiju3Hywo18SMZkHwFRj9yXyrDnKuoX9w8d6Hv2wxqJ2ju57y4wa0GcLVXVYlYqZ+liVE
wOZXVSSwPz9TLaE939VLJCMKME+5FzVU4+BTmZv0gcPvs3ieQLshs3E0KC9y7IW9o1g9c9dNd3/Q
Ev+gSypETy3mpUc6U2Q8T6/Q56tATFTwJnm0ldhjwrXXL9DMNnign7sTPx8RGWUJzCBz0awF8dBa
aDxC7CQOP5GXGoHQsJtm/fI5DwL1kapkbvC9L8zlhDG3j9YG4HVUgVlneE0rpuq+ybmKLjg3hjB4
//p76on90BpFDWUunCtLr/OudpYeMLz9ieJQHIU5/kCkMp+FNz6ASE8IlZ35UtGcZQt9Lm0MCps4
IBozG5sZ06h0XuWPLbITIdcsJAd3tB1UEayNAEkxD6iIArA5fZ8gjltX4p+G0CvB2Ju232W8cjC2
vF1kwD+GK9h31dXafm0eu6nSm6c1LW9DM92/wUoYItUkL95nea6BW6srdYyG2GnRZ+OLJcUIYrlU
s+N3OSSRpoyHcn+OgxMd9W08ARr0Zns5auYmKPtMF+/QKbjJ4rkTJKkWGwYI8u3SW6jUXspiNUsj
SIk8sm8h75vUjk/AxyJMdsFBRf9NYBX9/nbRWxKKjbyok7tJaQPXmHj9TpkvHTjg27g2b5G+ZH6X
KPivSecsL9sW64BG7MjrlQQhQCPh5L7FKOwceDQTyvnv382CIwW6SaDa0uMCOQe1HIfU4YiELRZ/
v+T4wlGznpWQzn9Jl6zfqmf6M88C3iFs582HhgdlWv7PqgAjUh4vrtX3ZfHXuzlyDAn0Jfnl7Rz3
reCaZceYfQLA6M0MzOJUjNOujhGYpfcTblZYaA6HHFncdQ2ZPiaqpf7GUnuionkR2YiIrWFJO5N8
01RBiqMa9C7sToJKCx+ykTD1+tuH2j1Ej70kxU1p620Y0D3RJH9IOR1jBvBSY8/F4PaB6rSGEkja
/nuDASCG7LACqx1giA/EVNZp/D1k6jjSdmsld4HxmHB3ThbvhXwTLZ0dxFBdQzs140WAxKsBSzvM
oxHNAXz5OuRufE37M02dPNprAWJZsetyeVb/QHvRAjRmZhgsacQoA9b2gtH4ugJugGfgxArQf++q
u96rNqit95tfGMc3oWKc4a1hMFSR6Uk4aGUVRjPue4vNFYclNGkfg/cucab/IiZGyLZqAxKlvopw
r0yn6cSBSeYE3S6fmtListwNb3Z5YbKfz55nBUNmysVJHhSmd8mjdr/ugtOEhec/KUUBB2rI1iso
aRgJK22icRP3KAAubC2g9YrkwoI/l/PcfcbGshGUNs6Wti61++TQC6cN9DNpK06ay2PMJ5rsnh+1
9519G0x0MFhaY2osBv6PdmK5UACunU5cng5rRJrpIC9N2m/xvAsIdz+WW3wOqz+psnRgRxea/mAT
+eBSHxx8um7JZKsIC9loGpHdfs/cf43bTuOf9NbAOt3eJrk3ri2Cl/dAZa/bRxfyirMHqSuJoltO
tz/yvZ36kAOCkxkbF0qDzHOBL6kqtgT/ec21n3Bf0a0lKybtTb0WtyBvmLIeC6czE7+7DsAZ6U+C
4uHfg95ISeeqVKQxqvCSzPiLizAFScsbx8YOZtBGWdAcgchR8EmS8wtW5+lxzwrq1cjF05WK1CdL
pvrZP89w7sTV6nb9BDdSpW6kVvnK2XAVfAIgXJNZDKAA6YgDU71zkIK+fenty/GfdIn8PJMTx8Uu
nPvVwLSLFCILFOSoZeTaAqMojXze3yVTTc1u14jPvr/zzMvw827NdKM3DblT7qx/rk05sWikrFSl
AMEQxMU++/eQIwS3n679NeBTT9YLZ3lOOdE6aba8482YRYWOPAJfp9J8FMKpC8EFFuR/Y/SaZYcX
J34/WsTMYQK9OBae2xs4tEOV6oKQExqjqbDirsvJ5QGb31Lyg2QuH2HDiZvShUZEb8QG7uR5QbnK
l5kJnq23eGa7Ftf4G7oZaCHQ0dcgmPJIk0dS9HYzf99PsdS60zB9CS2DMpeF/wRFtVUkBWPo3hnM
Po3Mxjb4veA8DJ4Rm1iSBCuj/69Zp4EwSrhIsYtDftBe8wCx/4R/2EQyzfhiyK4uBTwJnfrukSyT
99XRyeJ61KWSHC6NoaHpuewJbqYOgOhkh7VHbypgsXnzRis9EvScuR0Z70YRYRFFgUdAS6scjotF
Jf63nSmzYmWRenAQE2wib14gJTtkRyU+FOcRmB5wcU+/n2sB2Ut1QA5E6yR6+0kkUWRYTnWzbC+4
Y1Ls/mWWny0IfO3xMJzi3ogFa8ODUscSFNckXRi4JTEXKDylV/0ghaHsG27hzE830iXEXPGZAvSm
WJNlNev6kK5zMplPrIcwWTD7NSAHBIfAimaktzGIQP9spVYrbBLy9LT1iQAzTJ8FCvHSYY0xe8rH
8HhMzXX7s0ta7pgz7l7CUTPaIY3l6plVAaa2VbRDqvSmmT56do6n3Vcia9Img61vBhPjOrMvYIpt
Q75rAxzw7LcmG3KSGAyv0kbfjIO4tMHW4wUVjPXMzpdmuMbYXwwn4j3W+KBDna6K2pZ80LVCN9K+
4DsBWluoNG0R4sKWDUQryWPPFJm5Zq6yotIiobcINHRah9DNonGUL7CSKVbNRB2uKs8Nrkiwv3Iq
jR1tPnHALnG4HzfUPBgoxicW0D1zRCI8pt/VIVq+ayN45n4bvoqeGDg+jBJGAIRd2Yy17ngoMSBq
Z/tQU/PLyZWIzxP8U6MVqbXFG67+UlkO7wmemCv0RJNfq/WKp/WgyHF6lxOcASnuHY6/eHKr3cHS
JMTwC789sjBle5V15Fldx0D55Cjw/e3PkdOW+qcAPXeoQxgEITFCWzRU8tk9R4KBQoZwxbTE5gQT
P9HL5etwK8KOEpNJnFSSlYJZfp8l7rqlGiRu3BJa0+j5vzAThQACXZqbKTwtfhq3JPeA/UsG0HdY
qXVc73qozzbppLdySA8O3Qsum8AqfVEmjLoTX+VDspm3StxyXepq1ZdSPpqkWBwimWbm59jp1kel
Nu/lmMYdYMkNTIrpYJWQIdO3vkjKZAg8CW+eRgPCbYsjyYsS7PHxzKWdkDm0SlSh2yWIZj6nQ1gy
DLyrVIECnWMa/jJAXp/+hNWuiqTcNzqpbbDlO4Q5KkedousT6JME1EqGUqbweNdkxXwtmVTTteDx
/TEjXdAGd+LYN4T8eFA97UTElZ6a5J2LSeBOVr4QF7ayz1zDJn1lmGUtr1xJURl5J/uCnEOg/q/E
qcGghF7vMO3aykaf0dlAoZHFSXt8RtUQK4aIx2KXsXVOeJ7hQRNiUukzgGNIqxV+t9i+8PvUAdOF
q5Xo4XrsHQzmup0EAdOh1gIgdPLRcknHLyNf8T4xSbNDPO+LCg1tT+hEv6JhNCtW7NyCwYigx5ML
3MVc46QRv85m709VXAzYMMowu88RKG+Lx4dvfvPhJDNR7eihIsEM0Ur8cV2fxj+zaeQRMsA1Nbj8
GgfimfoFgTbfY3zRZB/eBUHMwF0QVrSmoAsH8ZlQvC1vlOCGGpC/8tV0w3yZr3+3s7UBdG0WhFIj
jHYsXmJOTb1FqPuycFkMPcBfJCo95eenWH0FkpCQnBi8A/Vu0CKTHx3ovLvVoFT6WnrGPBCdPUnd
EbRT8Yz7NfYLykDPy/kV0SLxeYveCSIC1CARW8WkzSTki6waTOTHVzharh/SFB/oE91uwOorxdoh
aB0HPmhcXvkArhbX+6lVnZrd+BHZnbKsr4oR4mf85DyfNfY/kmM1xFO7m3+Buifa6OvuOO7ovH95
DrNRwwmxL0b3OAkGAkfnSNtETVwBen6xW5N+jcQA8hfgdljFcoJLfq9wBXUPsfJScjq1Z2nKZlNR
T5Qdn1pjLiDtUaWJhBLzCZY3uKZLJsj+1NAog8I1KGH1171zORITxbGWmC9uRmyzKCU2FmGJLiUy
Su/84pH1oSYt+d6sgKFU5BRsjMiBhJeF6IWV7DZ/QdodGSEk2GgSWBWs+imRtHrDj4f+iufO3SSS
mI40aH+a0bhQx03mnFr9leVKMD/iLKDOCir/UXwR5WEaPDoTafr9UyNYQhQmpQ/Taksy4pBLfDhE
/BlvEzRaRHia/0ZaBZEc8m72K85v+pwrzxjpf1rOk7QZXVbcQC2C5FyLKDSkGleb0X5ugB7wM1N0
R02NjhuwltCD4dOyLb7/v5bhh6NNPXgfld17+tBcs673BfKvP34F4y6VU7DAyt6IyxsM3LSciweB
IgpbK/S7K9LZd0oDYUGrQFKYMazqDx+89onWUTCknj1kxSwVbptFkjWoKKvR2fdes1XqaaxX12Xg
2tqX0rRJtoTN5fvtjXC163b7AOuzZE5yuNsGjJ4w/wtW7Pc6qdZUQvu7v1ujarAKLGwYX3dp8C12
iWrcDROKFg3YGV+lEGK5MSclewq+u3an6qbExyWCp8WheffX1mHfO7LlGMe+sMpxYBwyZn7suBWt
vDUrlisdJy7fX0m4vJBkaRFgBvnGcNvnAfK3QkGd38RDH9K37C5sUehGiLRWcrYyDZrzwp4ugA2t
wgdPYcQVa9SDLeWssnGohWZaC3P0yZcN2qRys/tl3Mum5mI6rlSVHEK6exEp01k7pJmrufT4dcX7
howrqRlwu21lJKHUgqVVe+Bj4ORWdAmSg1f4UJDgwdrpIcGBJck1CiPTUhHMXmO3eLMyBMwQn7tq
JKoKNYin34EDXixeZTrfnIWBM7OA/P0XD1SdOvwy2LakVQoUXXNxIfmwEPU7oZHXmbsEq0G+FTzI
Y6KhFzER4XZINoubx1f8qF9ZRk3zmyp2zCmw8XfVHpmncCzkIB29gFs8+13De9EMaN2msJ3QRv7X
k56GlNgL017Etft1B7bd8yggfv+xvf4SizumzEsqq5M8/M0/xyQc7lszG6961zoeS3BO2VlyUjqm
rPEITzUwSQEKTNboympBqVskFiIqHmCoijvwxvXkdu+6WvuxZbD1EQyl75Jz8BOQyCTBgQf5R8zE
VlvYqmp8UkGq3c+Rx/rnoqUYRBrXtZpZXFaq5oiCcLCmtdDSgisUncvIi70wXdN8SEEKwOwQF40M
nm3FHiJNxU6hFYozPFMRl2s+B/rUDCV7ugMYxGWMZoC4G629/xmw7aGjFNQu6B8VDc55haQPylYZ
l8mIujuhKY+CSHzc5LoGHOnpvyHobg8q1dT1/DuzLmEVDj3z+wsCmZeelY3Ra2Np6quGm/xmPZP8
Kj6qYlTRh71JOf2Uw/wGZY/nNnQOh+hs6CIZV/lfrRxURUljzIYR5rUnvlMdqqpzuK7bnwwkVSF2
Lib2sqMlDlihdoQEWeUDPKkTbGAwWHoNMtCaxW7L1ovvErgMBOddFCIG9AM0q5NMcXnv+g+z3gE4
qJgLh4TqAEJap8AAR/nMjAjmOdxMRUqJx7eCQ1s43jMpnmOMkDlpz85zNNuQErOquhfHPctuZUXm
vFaRH12hW+p5qKh6v0QikIvsbTZX3tNKP2CgyFEq4Fejt2sj2b9PzPiw1spHqk62KIvRUG8CjjTd
pUcpPheaG3icyzhH+XuIxmW2xEwHx8hMzLVuWx+sYl1j4UCu5buz1mNC6VHo9SplzuPj+xiienQ9
51i7qneilTfpBnbM6UH+hZKkOwtHXDmZxJrkrFyf6MBylSgbRlbqm9fw0dTz80OHEbbebPV7nI7M
n9yX4K4itxYyB7KUeT2Asc1cTs77OovXbZTjaGpCFyi/DWWcj6HG87J6jDPmiiifMlmyQl6Tmhgs
MaeOwdOhX6vuRExVNo64LiaqKyBD1bJmrefueIqKTAwQU4XWrLhcvoOL7kMDSuXKWHQEZKuQHmPC
AU1KCtt30dBAB6PaB4Cisg8FFqFksDy/FREkm3bar2zy7tCcNzs7Gd+pXv9uX+JJhkKNvVTIKyvy
Wn3mlBhgS7aXXBEmYNd9QStn/0m5Yfgoy3OqYPgbImvaHkERX2/w5hMlhq3PNQcDfmgja16ik0pQ
LG8sWLaBnWbTTVyX5OXvqR9djepUszpkvebRCbjTVgtbM7n3wFSUjPU4XyRfm11z6Ahi2fw+t8Cp
u2vKA7IXoUtKomDZbWrvFiS8KOihWdJ/xOwKUU33SWPTsGDhZiie5ds27mA7BozzrzSzEXtDulRY
wxh/vn4aovsiMNFxc1rSqLkyS25rmsjAtYNk42TUmLQeGhN9vl4MgJBpQ/UXbHtu1yL+4qrMv07x
qG4OfF1LB/R2cYDlpQ6UG3k2culkXnZrZNr7xHjURkudB89cHwaIxBqAldFrpyUh3CAR/uTUZtCZ
cSQMel7K6o3B41L7Zd3w5ddPIAGPMSG0zYSmMPJI4i8P7LfyN+D9euHBck5aFyrQ+0kHhB/yU1Ro
2bJhvBFaEyQgkKfdEOCCbPGgIf/wjHFllrekg5+FWd2WOzO6K7c1G3r1bdIVl/0xbYnlBFOP84dy
OtvkE9rFZJEgs4ZXRz+hJbNFlOsC/MyBX/VL7trWZhkb71Tef4d7YLSv2clCpsNKVNTAUK4fZ+J7
OgGwOnXcMGDtU0sS2NJMCF2Sj9YnT6nyMmsCV56tP5zPDneHXVsvL/DzFN00FRvXXEb5atWeYkw5
56O2eMZljYV0fMrUkM6UUfNa/4zmZYwpe0Dv3lwhplTvK0qQK0Q1JPEvhCVL0YwEgk5eMGnCRx43
EKYE++Hg0BfgYRZFtWLKL3SqBgLkbV6XaDOrd8ExsvdiuxxiTc+AC/UGTdK7GNo93m8MqRhuum+4
V9YjY0T8mtJufqNBg+BuBELu8WSFsbn6cTSze/JjksPRsSpC5W/oJwwsgHzxJZ55koy5y8Z1LO04
+4xz/O97V+FZObxXx1mpY6UtXgiVmL0YQ3/z3DT23pm31eWJ/+xQdWNkm7Mku3tvolSHzlfFZaSV
DsDrg+gWHQxM3+0Ft7k8AKYFHOvSUjjDnmCwPB0OBhRfcMZkqcSCQifzqChk8L1jBny1tKKPOjYJ
5i+Hkt9WD36z4SoSympiYhVLi0PcdGCD7N988ufVT3rboQAB6dHp9O8WPN1ZV1S3NjohAO+tKhS4
n5u5PGqmxZ/qm5WukChcwj35zUONgJNoXX/pymp/fYVuY842IRDW7q18cvnisNeypfQZ8j7x23Wk
Er9nALzMtbgITydJVw4KkL+ooPjxyLBizK7JvIbDE6K9/wFIVM8MCI69O9GT9loMOpOHKwf9XBQr
GwMmL4ahXdu0lUP6265VBY0setDkknjzh0cIsqhWrwmr054veh6eKoBM3FCAWquYqPfV+XHegXem
sxx7cn6cOHwiC8yYksIwAS06sEM7Wi3LvxzW/scob6n5D6fNovyWL7/SAQDamNb6p+ocmxzh4Mcb
gfsrFkv8aMDkhaYlsNmKnlJhwumtvP/WnTZ5i9Xy/amMs69G3VlI6tqW+hWN1wQW4/xehykHilGG
IMGPznwR+KUCniVKIEl3TDbI4CiSwDLVilqa7vOExYYzjmnpk2ajLn9dXRZoaLm4XprEu8ieSywG
SVuT53v/vwM2PzvTLVtORf8GgkR+7iWLYZY2Wptko3DUdX083AKlnsRKXtHdRjgEQFzf3VNnzEsZ
vg/NXKhj310D5TCVWDZ7VJoabCCtu574Fv9IjhsLSNUGTfCGWP5uY327QeVr4/dl/m36F3AHT0jZ
76uAAVnvL+sXnRRxs8wlWBuu1TTFbPBhNFBqo8NeTi/pGrrupdPXbhGV5rBeXGLIN1nkMdA/WP3s
2xdWJ2qli+Z0xdi2N1DziZPEJsZsQjoziyEdcqk9wmymCQGdcFkuiUOQV4KOc8xJXDKE2Lso7yd6
Ig3KCg6qxMPI/PmNOtv0FkVblAuJO2r+ueI9uE5KCeG3AxkCOhwG9UfEIWH9By85xgmVTOwmyVQn
Rj/dT6ju0oXlsCPsj+XViIyUEE+VIeKeqf/6K/GiqBbfm9xHVs6FDpwKgpfPjTS0uAuZVHvi1y2V
4Cw7GTFKobXzJeBx5+ktXG0Q65Iww+djahJhSudW9AfdIpaif6gzgkE1D11ZXNpJz7/nsF2o+XL/
p9rmbpZKTAKEWKHMTQuptGYvqBEpxkoHs8k4vy7ttHbxAEAC1wP9GtG7Pe/UnkxYtJnMPm8imsp6
Pq1PeV5idtTcHcRvnEUopdd+I10vLPQBVY6hgqU16Ljv4k6j9TtZnCGiSIucAju7vbCjRwaqfRfF
a19AeaHR34VUtRMm27LtdWHgLHvW96LTPdWlU9NWTYsoswCNIchF/KUEaB2TCQ+NgUdkHPY+sLKU
+Aup5SsrTHboyhc6ESA5Qn1BnvkBBHFDhkyRcj6jk2O+dbFt+gSG34NtrTrq9gJ70UfGFjMx/k7g
hXh8MstHXFv1BVANG8K7ZQ77+T47sDbC8H3qDPl+lIuq6mdJrtCaUXAPNC1dipHFsx+4ABfLRu7F
k8EySng8x8JWvY/kHwm6WCCtYf+6a90IlT3bUJ0oEVv61oc7xbkivEkS8qhUigyYi+yv3S5Lg5Mv
qT7YHZAqmx3XqpDwiAAAKgh4EHa0IW0oV5lfLI3C2vA75OKla50E2Q4HbVQ5Xaz4fLVvRYJjcybG
aGSSgznjew+ei6y1IsRfXDSCVGAu+gUYaCXty8ERHMlEXAg4RezLF6/vwk1vxFSxCZD5NRZhNGxM
SqKyAwl37AMgu5DSM7t751Ls6zknodSyMrmDGku5LBhaRzaOpJnoIsdlEQQ+vtnNekgF8L6GFoHY
iqKuDHO51fVpvFo/WpQg9uKNqEDrLzLcVwbPXz6tyEvKc6eb8deEX3+yDJKnsT22tjrn7bQflIA3
hXH5KUQgUAHaPQmMfeBkUrr68rogRaRP9nj2b+oENq3M4sj6yMFU0QboO8TsO17L7WiADhmL8xIP
b/N4jtN0mLF0mShznICwv6don+liP7ekuCRJ3YIkURjSLk1D/zHLeDhe8zGsXBjDePSM7IMxqQG+
T+SV4u5y4dFXY6zAaHx0bLg/SVtBWY3H8Om4ohm2IaMK+MgCqXjTAYfmnCPOOjUit0VFyNluXvlu
oE1IjP5tnm0DXhX5WyndjZ1A8lJNy2ZXOPRKFzhBRl/XJmI6+MFAf/Eff/ScanJcwfS23OZCh49T
Kz4ccBcPKLs4p9roZnzZpu6TWojo0dXiEmf+Dx385WRUCo6DIdYtMdB2szRsmrJmZNTN9vFUCrJH
RuPtBawwmWpu9XSoW6Ff7TD0rjxiD83lTTWACRtVqavNjDBQTUmXOfMTcHgtEJxAouiIC0N3nvjY
FRt5dnmwQVbEXBjyIGuvT1nrHjyA9t8cnD+kqG6sLTo6skNJB9hU6j5RjX5QIQrP/e3k++xniTpt
nOMU6R9wYWCR0zM3KK4dTdPkrcFfx7gjg+A+1OrtTfObUk2JLPWQtimUbZI52lkjUJwFL0xLOOe0
TuBnZf9x3+4yt1FKcvCnz0tbzbOlKBmiMHV9FagMoKxl6yZTRhkpGhmd3RHnig/3FUoskB65IwIT
aqTq0Kh4yy8E4SBv/icdi9arZ/bhCbwXXe3pjZl7LIkOpAVvLl6O4DECARpW6zYnUyWUL4jtTBsE
nrCygCroHhV1V4C2QCchfemwRhjQzpEOel/MoEiZn6lLd7NIz/xh3duTlIex+gtBRJoisExAqkYC
5h5O0JVNqj7pPnp6Oq91eVdem9LPgtRLI9MnaztD8PBQ8oUEztmsIZPeR/MedwC22ToMo0OLS0mv
ngnW6GKn67kSS5GDWkneUUV1tEppTK1yPMkMT5OhuZ5637GiJdMXGRZwdz254kEb0HeP0e+mDAfo
sIYrBQbkKVXSQabUcOn3AwYgn/bAoMHOG6ZjKQBQDziline9LVBxxLAXnTnyHIJJ6BkIG9PJ4rt6
RrCpPyqRnBaWWZOfO+eu2LZV0CSwdjPAdNvI6xny7RvY4JZrRNgUqU0YHQBNhtR8H/ZSGc3+7TV4
OFvfBun5JCTLn/Wf5qhja3n+3XwHHYJytC89ohZK42hPdTsN4l/StpHrn2BQhwWNdLmBfrzBSK3l
s9+Xb8etk3LoaVJWAORG4IIzcKf40jsrxXkGCY4wN8M1l3b/KlAhiaqL8oeRtvZcKoE91+YEraOG
l/yePLUh4VRjdB3q5ZJhd1TgWKS1IZOcoid+Uyq1SrOsXEpzZXy2mFQOMS4ZyhVgn5YWGiLPkYp9
4sNg6ykV9yXbSWZqOjITscjr5dzxQQ/ei2Y2xqef9dSuGZs3uDa4uiwUutd/X7IFLpGK/k3F864m
wsALeNkXhM9UUO8fcX5Xi/nEM8QfhUZYZlwYixLyijz6ekFisaQwIQlCx0N5G5+cdfLfi8KsKroh
Qw9xd1fFqJw0mYKW/M5X4vUh7YCpChVNCQUph03yNysa2tq9WWFGYFBd4nRsxxv893KXZ93lhUbX
WrDCk6G+dH7HwIiKY7lWUO3S7JH+vL+Tk1AOf8OQ4/hIbHHftF+7Z8Cvsn9oqlT7UkrD0u1Rhfus
W+6TMlnjtJXPBhJjSieAm2cHCDRUWX7PRSnPJpGswOacU15zhVSPZSKUIvPidHoA8opUz7uq8bnI
VsjfeS3ignVeRSGg5iE8R8TlhoURD8V74HAPfEf5M+A2uu1CmbMRprJEWmUbhrkQI7gqpbvn3hhO
7FOz4WBULSxM8mWZOZFXRd0Ouyeatwsoi5PYMIaqz3DD6c1ShyuotGbolDr4xewz8jGjhiNBTQhy
vcl61ltTizoikXRFwpe6nukRkhVEgHtKrOXxduVvJgWSXnKm8i9niHQgerrGFdUp5wtsk33hBb/L
MDRkQVDjlfwgFy49W6y3U7tKqHYMDZCQL0uZMj8C6Na1uZjOJFEfeFsSarwthzosc3UYJHJ/c30E
XY6O0zL0lbESbOsvQ5YpT8gL0MUhG9QZbaXwXyuaTvXNqHP60F+/TchuF/L58OELVgppvGXUsYXL
8Wtwc5RNzO7So8wav/RYcgxroqu6W3cpMAVuKPKNH9KY5yXb6KBMSBb4h1LYcT6W28ph6Oq5DR/s
1xSFiSktLGKVZ2zFJYW4v++CEasy2CxHR4BSUPHMCAGzYAXASAoiGhag0Zq2zJsiQ6UbddQImXNI
Y8TrHtZJvcaIAb0uykxuW71NjY+2tIx/3mPE7m30AmH2nOB0RjvYpBtYxe/XXrOLkWev3kTqDaeh
E97po7GdozH2GT+x6VxQKyOb03jdTWxPIV1cQ68lIffsAu02yLM0LD1opIRQHhYXlD8zr1ytbmW5
Jcys5M1GfBmSimQTU/nzdrb+bvIAk5QPMgqKrOHyqOnQWyMPLSWtXJp8KPapf5txJ7uqs0rEKx1i
Qizi1XjXjPYYVveZe0fGcTtyqRKOK4l9R4N9gi5/oNFHudYrQWmteU/vvOnXxDQZmqzccsp9nyYC
YCEuyaATzb5v84unJKVcaK2/ufl9Ty4QoBUUaqcq+/e0yqbtoDx4g8MqhkygGVGbhA10aJqiCkA8
WfxlEn0pCI+bjY8ijQ0qhRtJg1ZS4+PArOuHnMj0oRkdnMD7fiav98BZR4WW8KS9rcrVwmx4Yju4
e/bz2AfzyB81fzRLKxPRHlJserQgvgiCYd84HuEi28FLhyyN9lfWVyf6KZORb3k5Pxf+S1LjDzUZ
toDylaneFQMPYbnh8cEYSlSHpe/vLSxbdQHQ0HIEk+rKzkBhDGrQrfJEiaYHqVoTqAs4/v5FDQHd
ErjGOu93hooW1Xwrgk8f6Bqm/I+SooCHux/1gUypIzQITZqyzeZoy6ZaXnSjP2AVomLBqMHyKLRk
W862elJta1sJ2PNSp0nKBOLstaOuP5xeh/ucQJiPA9xWpbiuO7xtiFKx50MP4RszIe6nF39la+tv
j2kmOjKfEoEaP3vPot4jyIw7iYnZaDJI/as2+DkcADpIfY4g+fozjah8+aChfhutFUbTEgk7gifk
CzDZdYPA683QT2W0ECCHP/YiSYsvgBsVEZ/2/lMMowhZ2vWz9YCFJL5BL5H/xWiZD6Sk7kuca8as
4X7w/ZBH1wWCD54brEIW58evsbrty80l28SeddKssnl6lnctFob8I6rbhyvU3xtHq0RrzbjSvJ3b
ImKSpsI9upbm9sUJPDITWvYHW4iaQJILOSPYwWVnia6TlbqWaBk3XHE6/ud+S4gI3Tguayht59xp
MufKFCKvjTbY268l/5jPYI33/WoXysnpNQCGf23XqkOhngR6Hz5S/XEzvpyAPT3IZ8k5lI+54T4q
m5vZZIBNBGs1yRpuTAJbc1zRofuz301Umrq34Kp4Q5+xFkN6BtbSNQ1Ub749Kk2oJMRMlasxpQSs
st1cC7c4pPHGO4uL3RioTCqdCMcwWuT/3e4mEXIm6mUVHqtmywYMaxQI+hM7V8QLcHeFPdbJhfd9
AP4X9XU1csGGK95bBesrHnJsoYq5K+ir5xtn1XQsUuVeJOkQ8AApcorFn3WspCIWSgGSxTW4/Qfl
TMd7fQLPUEzvDctaqUo+mMXNN8gcQzCwS1VPNoa71bqlm4vyCg9lakSMKDaRpdz7ongtWawvB47n
tnCAOu06yZworiMNlH5I1WiuHrpSpOs5671JzyaRseZ84XMe2zwZBW39QS1uj8LZeuy/qpCjRnBg
ZwX8nqZ/uw1QwKGC0mqVHz2tsDL6Do1dn0i8zUL46+5C5Ke6VFGtyeCONGnJbquefbQ4zuzUWkt+
+M1GcSc989SxnWNEmohfkm822GnVJLiHyW9mlqejT2OQOJT+6ZytCEml/vzaZHfqtkFntfnMC+Or
XUVPE6sKfKX2vu4tXExwBitA8xFnW7N2TIM+FTXkgeBZZxvPIwjeBugc45KNi1DQeUV8NWgMLTto
vQr1cqDrWO4rgNH4VCI5i6WDUcOEQLt3JB4RoQLPQL91XtE/CyqxDqnWpVxfLAyIeBrb5BrG1So/
x4pFIHuIMFPoeZHri7rq1PI9KiyqKBeD07TRavWZSBu09/oQnGhbi/7D1mcskxZhTPyYp2h9Wbjr
X3hzQBAX2u5D+5rhF7OhhcgVvOxTaSZbmnJVQdo3ZbQQmjTB5bAFulefiXQOFp99ZKb1rXDYZy+6
qOBs+KqtreHU4dYeMJgTXCob9MVHTkWhbm4JIwImBLkHnVHlVxnPo34zml2qmiNeEtF34UxkZfVo
vGAf1+xIGaAeJ5ahFYcTX8tGyqZ/FvTN2jL3AIJurz+XEwG9K3UzK9k0l8R4BJd2L7J0tWY9US8m
G6nBIUhHk/Dot07CeqjsZ8BMIV/CtWXF1JXtj3oWEsEVXf1o0kku9SsQEifhtTYWipDBVn0hzxzR
BJ+6ZKSqnlh1tk6uAghbB0ZAaMIcKgVy3Sq9PkHDpJpCOU7xweIxkG0dtYJpPJ72rr/VUn1h7dUh
NAqGvcLYEdrrIo6Y8p1YRDpdkDuFK7dVBgGXDKpmdYWpSzaLowcwp8Fjc1vRP6yYdto/9dP0BxlC
rMbWIJRQp89tQ8WlJuPUWMXeCH42syqQOfc6JubF+FhGTcE8wrADV9TtSWQNjIZsLlmQCplPjlvn
doSjLOy63YIfQ8aLDbgjYj7sE5oJT70IVa81fjWb5IN2isXW3PsHEdZDHX5Cfo8fnir4129NfcnR
u25cuSFdI+WY5rK+6TXogzaCnXVJ7uj1CUUX5p9IYgiuKwIKVvLItCM8pbAOCJ0wbGmCXF2A8oX6
MQfuCvV8V1RToIWuAe0zHL7Zf2uJQLkQ+dJDIkgNIVI6dJbOQyCQw7KhfWkjrqhnJC3/0OKA34F3
EFq5xAjFtJeEx5pN+grnFg5rglXhyGH2FpUpoIRKG6KcP6slwRvTexZdj/UFvMzjMV8IlCKDoKX7
OaC6Kn6d9/nOv4AIY34zMC27l7ZDOqBPrcUMq4BAeVObtOBDrPNPwWytOFy1KCKg3g/IFPUlz5aK
rZtdCgkRTdx+FFwtTw+71842M4BzY1dGwm1Xm0jIDW5zyJLao59uXrYJb9h8e4ln1TPtrXLviEF0
G0QkYy02GNt2o+E1lX85A58m7h/YZ7rz9rkdnsn5Ir7lB5w21p103QjxKSxw2rlfAfopD+yLRpNx
nGL9yz21MbMroXjOPoNlkoClUnwQbyEVvRRZWIOqXRbDXZsM6HAEWhH3hPd89ZDPnla3Jsv+EIny
+PB7jkMmyK9FUxjO7kQIoYKwAaGZ5xYy8QP0eQkqkE8pfrPMPYdc5GC6j2hMTjTIhxnknmmeNLeU
AXb/AsciuUoQq2Ib1ei3hCKoV4o/APKOZWQdS0P6xgyTl7E96UbNnAgaHfiKfMM8+BThyNF1x2Ri
tdNhkhIHQ+DDkYsnUI7VnIDloUwRBnayPI7Kdhxl3Q2V2SH+XHwMGAH70ll0IyI068zvlB7qKDeP
hG6v3+HJ1z2A2K4mBMBM3itDAVjr9d7p2hBE1W89/nJWbRgU/pF/+rQd6UlM4G4UURs6/nHg41rR
I2u9p3HVO8oDBHcpgHpnKQ7qv8B32etq+gEdhWusE57oxOwfHgCmYr2zvKNs98Dykt46c4IVuZcs
2h8EbdaR+lNEsfxenoYLS000Dni6twn7rVVwpdK3IC5nqvp98/bb+T3Gs2Nduw4j2ScsUlliDQB9
Q8bvxOG8gD6xf5gBv8Kumacdtux8EBg04bKfohqLni8snAP2tl+shBcGubtaLCHCsfXwxSEcgJ/d
XAeWQs+VhGncd/StoWJ/K9YIH4ZgJE61IKQljJyuUSjs9VpL8oTOHHMGgWV3WMBYYGjqoWGDTPJG
+OX0mpPhHts2PTwEd0idvxyXQ4IVSkmsFEcVxDC2gvj+bKQR0HF2ekv4Vg924nBgDTe/AD/rNWD2
Xg45UkFm81Xql7NEvQ7nx04Ic3rF4GqwgbwR2GPQTO0ZhmNB6uPCxoe/GVhoXqg8edyyWaCgXh6e
r3sFy/ySLcvGF+9hIoH3Jrc2wNfwWP6y2P7MBmn26beosJBuGeTWmkV0TdGiVHL+3bgJOYBL4n8f
C9Rvo0UiRLNICa77H1AAUO9B2MxIda8p33VkpCgheTOgeT3Vx7JgwNM03wT4ShqzRfge5lHyERp+
3KDSxoaS0hiRwuOsCrYVAY1Khi9ATJvRLuv8bzE9HDHq7I2KAOGDzFcMpZcT1nfBRNwSfrca0xdX
0rdFXcTaO0nYel9ZVWXt0WbBtMhNCNq7L8BiZ+VavpUBolE+FEI+/0zLQ+9BNLsPPtpeuhdpeLOk
9vE/nokGbjxbM0ZV6k0RRr3ioLRfeSFkRbUn1m7gjiwrWiih6i9RjEVh6ZQrHCLh4r5caJKAhvxu
U78rcguv9kmVjxIQmA8OqXuKpl7oloQGipVLISU1VgKcUeFuMJ4HDNG3YWYmG+dWoLKksiLNgpTx
jh8xXpjyQK+5RqJiwDXynJZNSKlHLfWoEVCFPc3eeM7IWvW1Hdzo7H2olePHCS754pO+ROzFcK53
JCyv8KEGwbXTZAzmf2cLCgKNpuxIKPj+E8O/INAFwipkUtzNlYXfvhrKRVTGrrwbKISgqdnqM/ny
N5P+Xzv9yXpNvEBry0kzFOwjISNuMhWLG0I0257Xcohi6xDY64RehNLX7nt/qXNW317iahrZj+r2
pWh+IZFFz8m4zIHKruCP1wVGngSkY4dCmBQBHtiU8jXe0MhOlrKziWcC30QnKGWBzrA6y603hMk2
iGYljFaos0cxL2CffF7bxA7sgX91etIT9QKi1ytIVZdW5zyx4djepZhI1fQ5DkOXIOsgMdhGC42a
prnX4P8aDOEdwTAU8z7uQnHmh+giHNPaydBr4mrdLsj51ZVY79EvsiS43BzWe3L2u/xVlOrnCyli
hwmOp0K5QXpjlMzWA9kIhL1r9xqLfyqXcaSUZq2oab2cGG+6O2r0JUyq77x7UzrT+IYyNG0vRrSI
nNeVjNH6kHSYIsPJ4yD01qORcqHuqXq7MCWYR4EjGyxjcvNoe6gwjalhB2KxKisxKWR+PM38769v
0fE3Kav4oP0j8O+qkki7YPnHMYQ0qnnOX956vkfvR4i1Dez0OUuH8u4+ZuKzX8qpbWIuYcZdZIes
LdeF8ME4Dun1cPK7hgvjTe/4fbxVHYo2Yun16ZpcELKd+C9r1q3zn4sMhiawXvySuVMx+V/ADGsF
C8k+pWHPB7FRTFCad94vVrQ16p4yDTmR3rGUKlwWHnbrTBqLyoAb8bl9MWI8YPLnPW4zDNpU3OAp
e9qymi2oPC7LRiGOOML39tFfY4pffcDfKVY21Pe69NtsNdtxJ2IrQkdrnV0vvKwgyGCtaaMekaLu
+/1FuvHYQHX7y6Y0BU/2AZwLh/b5G5/kCtjJWjJr4fO0miRswfR80EmJYNLr6Zwo0e9IxEC05MSj
eFMgBv9MBZ0gaHBsRyTLiXK4ENNKarhCR5o06VgVhPZiQwU5gqWbjKabRZdkIBhRypT4qr2BPfp3
DhCUiwDl99KxeoXiVRY24Wwb3drTiG5FcqoLol9EhVHszlTfXxytPnae3UUCEyD5WIyZT0typkKE
AtdkUz0s3n85PFgQ+BoBm2OqFK/4laLmP4St7+GLDzdy10HpqGnvkpqcj2AfrmdscPo7EIME35xt
SdcD7IRkVO/57YvJeirLhZNz9UafORNabdxooryXy+CDF13L/PtqzShKHMu6EyrxQ4/qreQwMm/c
AATj0XHvpLg5E+wOs1yvG4pwlAJcojWFdxSL57Oh39at4wBHiTsEe0WqFH/R5ls3T6fgeRb/CtIT
G3w05oyInm/Lv5UdpEh1hxUoGhxb/X5r0t4PrWDE3o7SaPxBmLhhY5NEeLwJ6lvAclJYKPotiH80
riO9ltO+jmNzjJZaFi/L8hjAlSEGlIQ5s73kB6Bds/LxcIvJJrOiiMdz5mEXSD79Tic+VwFGr+43
DpkVsWhPUzI1u65tpjMgHDhJ9NjiybjeQwm8iLRnUabt4oC5q1K8NXsHHujYc7a0iqAsDgIeWpjf
TBDKQa/vgOz8qlXmCHBxFYUJN5JKIbhRtfj9lDSGSOJj8V+g1W3u4AhlzljE5WBLKvM5byDAYQjh
E+23ILwWoGtokKtRsXNbOYY3xwnLH+p1Yxccy0IcxNnTJCcs7PLtlUsVlynpnq+ntdqjhH5ojdz9
NOFaNUy6NdLWKtQczEEJrV4WkD6ip9RwjbKvMh5e0D+3PF+lSmaVsDXCfYZy0XIwjEiZYzicuDtW
YWsZg2ZVxW0VqMmvklWTXpP7gzAc3pc55g0/xyFctZivi3i8emqdzqkMdc9jYLN0g4DvwbOpDv+V
7+uVrq+1Jrxvl0vF2hzjhpLi8lOIMUASW664jntO/b58lg7qC7mRZPhQ7oXibXxQ/6X3jtCHP6JJ
ECsbkBKlya9rq8R3VKVLUgFLEuprsb5tT4Xy9QI3fZqaVRnTnY7ZYiVIIIoj3mwYS3pEE0cCakE2
2QOBQfloXlecX2LneRfMHUv00Ia1UZYlblfuRc32IxsUYArEDkVFn5sSKCqJJ5lwFtWypUKMffZz
7Z57v1tMl/HZKCG9Ui8VbnJxB/tEeNwIe6mWcpLK6m2wQzQMJ8oFENUhTOpn8kksw/myjDkd20IE
w7bz6zcxKBJnv5V66Xkp4RnKWDsQVK+fgsbaH1Fl+FiLl6Cg8ARlY6PSppKifNsqGvDdvRtNX04E
Zm/G8zyk4bXjG/qGDWUWMRRyefWtiaC9oRm+Znxs7Olfv6oQJO1II4Oecnqhuq/I+2hcbya2A+6V
Wf8WTuRBmWe91o3SNWNsP884gV2I++Etk21jJFP3Be2nj+KGiz7hEc0B+s6o6YqL1N1TPJsKxKl7
MYrw/UIroDLP6AeX1odSJM9bCFTOBEzhRI/uxrfBMw4WNCc2YBa6SG6KssQtA6kLdwoIlJHL55Nz
7YfgH+GbtvUe1ufO9rmucgULy2nZJ/NRlcnZYX11YJw9ziO9ev3OjAXvtWa5Fd1EUFaxXJx2vnEX
LppaX1K8g2926wmxiLe8LL9SSsWV0l/n/T/54kZWM64CepKwuSvfs2ruyGRtc+2Btab3FVQUiu2Q
rKdDZRfopvCk5v+xo/8phApnjqKOiX79jMuz0Dw6GtX8t3hbRDNKgJTNagTBm2aGy+Xx1A7oBF2d
uw+zUVHZ+ijL08gc0SGzKmA7GwOJWtKovG8z9HIuOUH/AtCiLzJT8bMbCVVHyQFaCz0kfp9efpO+
LEkvwCuTFoof7oEWNgGIzfAY/NMdpQlU3smz1DdCRaAAVgv8sfCesHhDgRS/+cibO4djMMtOMaJq
wgF8IXJKyIfaMUWfsXqmQlX8bUnjm2PT9XaLHlA3oXvVafyv0BAFncLQT9WAH7yFkUcmDHLVOwHN
ZepeGWgB+SWFgUjw+Y2Ozgo2eLexnW8OQ3uRDkXl4i4IRQDTmZYh7GZy4NXXd6GdQRJmhYaNknvr
HapIl/C/odw/8Pew5iJWm4kj+VfDc5uQYYcCg0X49XunMh5L2mpdEX/vzb/5tpzonewpwErRtC6/
5mKnnxVtJ7QSJB8sF100U/THbgC3niCtKrAngsdrLw4XU2xOAUGTJ1drjy2aLquGoFl3nscpiAOe
AbgIEtc8fWaN4DIYjP0nXuWHNF1Xl0YTOAtTnTqWqDD5S0kMJ5E3558vMcbZsQ0q1aMEQ3vYBxzv
0+trbFFO4nVu/ihvnR/j9SdybQ0smtjNPOy1btSw32JpZ3fxqWN6CqdGr4dYGVHeg06OpSaSua0f
3JcvdGFE6anhpL1JiyEmdfT9mJN0cEIokp/iQtmNjR/IyAiRrajTtxcb8T6iFJ6W7TeRX6hTd1Ah
ForFrpBJso0awbTWV0rD9WJs4aS+pJ6FMsyT4g33UofqMIOGU2FohIh170CfKcwAPiKxxDDNn9yV
gOSZELYykd6dLkIx7W2uWSNbyPlV/PG4cxkhwnzaOjkayl5EAve0QHaz6YqvhKZEzwxEVbQaohME
kv6jI8xfmptldq2nj+jqT4ShjQoLaDlAIkbcUHx53NKaCFsVBTKMAFHK95RrtadPwLNlDGyRw/rx
F9oGcJ4HQL0cs/4gijfi+5jPS6V2jamVCdUZyVJ9bApm3sF10GuPjlFEPIk8fvc2B4P0IN4ynP2L
wqxmHXvwD/afKKizE/2RUwHBigTp36WM/Og1kgwNY3qu3kjG8rpE0Ps8GujP4s7MI1QpBvoxc3Rp
qEdZWH1GEJJPru0GfVj87eSQ0xpE5Egq82J+yp249LG0A6yzTRWk4aPiX2tz3WoJJjTyyfGnlglL
zA5FKW2erjgfMkq5HUobsG4+25sEtQ4H9Wus4nZY/RGSHlWNrfAt9wnZ6SJtjn20MhGDR7+s2QD2
qN3053ry76f+bfoWrgYUiMc3Gbpot6akYCZDI8gOMPUk4z9BNhQAxWjX96VreO+hmN2jNIpj1tf8
wr/jTttpnbe8uv1pTQgzYVXEi/+PM9u/1wj3zO9Yz711wKeFdz9/4BcCkKIK6295q6U84t5AJeCU
bvnsqW3PjOMOkQ8wYtgj3zy3TuH0IRnooqVN11DjRv3Mlgypi6RXjYQcDVKjAN95Yn+NIM9YUYGH
f1OqTlMDfRHNGBJlHOLaq5yZo5OPOe0lnCqReubX8vy+DFkygDXIX0n3f3Sffx/EY7GRCahi0mjs
yB5XFHZ855fa0BEQPXZyuBWlKUslSO2jLumFo+1G1B0MxHCulSnzN58XWQxCh6DNsKdtYKDTjpuD
Xkcxw8hPpp2ZFhTm684UTYIp6YNnZCkzq0zypHC1wqRuDXurQwjxFMFekVrFz8fStUjoY2/xHCTp
KWRQ1bL9wfv8RFsyQA73DGVedOGtHRFdGD9rT+dFxJmeh6jztoE1IcfEnCJzkKy+eF8ns0NBC91H
irSEvFWKC1PpnYqX+WDeUq8Pr8h+vKjaERhvFNsYq3CqneMDp5BCchTGE8OSNKkYR6Zj5Dt6iqsc
4lGJ/r5pAB+7PryZaglxU6GKeWWdtEFFH/3zOJfmJcuNtiv3bfZBAFwmtpfPM3nYqumm9kzn7kS2
hhZ5TSRAsV4QEYV7ZWd0mZg+ZVH9vsaSV2MxxWOu5Sz4IOKZEmrU7G/eROmrW5e3hh1kjY/+yLem
jXIANXJy60TdHQ1cTgmtzoKXuDEGY59vtPHvmBhjLCVx7yGZ6yNGdnb1N7RtjfUDN+Lo83i6hjlD
S+Yl8MOazDCPHpM88aLmLZSX2LuvybmxS6PWOCKpCFHiY/VZrJK7xjtmWhcnftb6gd3cuK3+61Ux
zSYV5LdQ572e8uWF+hHaljSfw/OvRabs/l6Bs3v5j3Xv2pVU2vExY65MUUV5kvAhgyExrVjkBd/c
rh+Hx4AvRio3WjTRq+9v7to34CD6rPdM5GT0R7p/OI+VPdiAEMrlKpgqBMUibw4mgQoSmx7YX4jk
aOScRKtY6MbLzy7DN6X6vV8G8f/YAh7bUhVx8RwCspCgughW8L4DWTDUNiYrrcX7bn7FEN058SIK
d6q7GT9KvRu9zSE7oP2HZVo6whIE4qSzOymJTUDBLeNu0DM5RrPi+8NC/JPlsmKJk5//ELP4BLq/
RthpZ9jqECl4Zgm4F7Jkmw/A5JXwBGAwTV9ByqRlNg+TXNNUWXcc3g56a7na3PuXnJNjIENjVsyL
lrto5JkDHabiyTv+cQAf1KN2RoRrc8RXi2sMCRQ0HzbM6v69zgatTr5IqCqHu6XX7/yaT7cesnXt
IGeTTvRgKmJEyxPkEoPc4OsxfpMz+XxXveNCb7Ug32mJMWzod0IlRwgj0Zu2jrAjyIzHdnM+Mvh0
n2Lzpq7AC8O1lEPDk8AING241H67IHDVUwPf1ozVQtUS6cDNNL6hZX2eJOKElGd8wGONH6zj7p60
5dWC9Mke7kJzQ9FAR3BGdGZyv2XhmEgcmeuxDZFPmUpdKj8kSQenOFieycsj+H+vjaTyaTDtCSNf
1RZ8OgSIwbLPCRuST8/M+JlmuXi1gEuc3YMyAsXrNVoRKhVUN4inALrFYS8uyAAL7eMcEhE3gbfF
JA4GH5wsBPyATgPM97JHvlgjNQxK6PbnwTy8HZdmLQ1aKJs6q1DGd1Q1PnQIvkEVbGFmEXLdQtCk
CgUHBG62i8eUNMVXJeUTTPL0cSDI5AtkslrPpRb95AwVXtRXxEbRQSx03ez8k4dJXzjpsFIA2VS2
nN/fVdpPF3IQoikrpLmV9U1x+z1reBTj2huYwdkB7hcwBHEEBne/0RxzFmHjXQ+3boJFR/wE4+gu
mluI5+Daa4tqtOoXAxTpvLWN4xdljwuyBRNbFCQU2RGY4HuivHXqJXdEIJ5iZvEcwYYAVseozg9l
hqf5QG3/FkhY/KS9G1oTIlJqlAaga7ig7K5Pu4ZPx3wFSvNBGShvTaIFNUKd+VJuk4tSP3lSA2No
zXJTR/vavbQ7+0kpqNT3KojiYzE5UZ/3CQ6am06hCh4sL7sGyB8VB0pFN5x8rhh91/qkt66OthDz
+KGgX0mzuZEpDBaBqPSErPGZxwccvsbPTGvhXEOvyzoWPutSSSSgE/3q5kwr6v/AQJZfWx3SWOI/
nK5DeiTfWP3lkj4QjN+WaNP+cdNLODz3tvyxQJ7RoU2XYmsUikMyjHyf7KqM0oNMEYUesyDsGMKB
fR1Ygcwi8PoEcBYYKyV6gNhrCWMVJ2HwOvl1jkbCiTT1MAAgPM6UH97CFMieA/wKcbf6y/bVRPT0
fMsKUZtS1imRkxwQglntiqPtGblkyl15IYd37N0NWK3y9+tBY7ILvRNLWfzG0QsKjI+TQSXmOl9O
3D0JSnE6O6q52TIBSE05EWZ6PyrrNzoKo5PzlXgyYe7Xelbudf7uNB/Q40FHmRp5ko6rs4zJ2zVS
z+3PleB38YMW6QyZq3gsralMIOeC0VmpG8fSsL6ZlBtN7vR5dvDe9r3zvk3uSRXEzZtrQwR6zpZG
dw86cCthCH11Xldc8m6kU0zGF5rNKujuyMktNXOD25Vq496MWPa86vOclAdbxTR5dQ9M8l6j9pmQ
40TRaCdB8VV37pqLFS58VWIICOTom32ym+vr6eGGUqdFZe72gjvyjGv8PS23WY/XrdFva3pF87fn
0DnrwL4no3lLPgxds/PiLmsNl+WOw05u/BqdegiRs1suVoJXdSmy2QQl76II+V4NnWH5OJRkXAZz
8b/PpixWd9JNgfdVu5fkc6XRvDSRfzBBfRCNHfYqCavzE51Z1huFw36zrfqsQB+yxKtzuP0hy4G0
igcoor31cx4mSO14zkfOCXoNBreT7drrUYc3MFffKWu4TRVwsUCbgj1vu5CazN9ImSS0IBGTASWX
h3j+A14ZvA3iX8JsSyQfjIlYtGs3HKuKaSGLVWzl8jpaUvO9zKEGXVUYT125DbcpMAzehVgVPMWW
dgGn08TK91QdXI6sD53txm0EJd2I2CwFPgG9/S2xRuggU+frG5OEQRJo9EvpZ8gtc6T7Bo4Rxls3
Uz3TmL1YMRG5rleZZTKdjFJJletjHdOkiHUAeNbq1kgi5iL3x8siShtv9rScXNF1m0J3pf+057sZ
Q5RRj4kAcXFALvRhjTcya6xt5AtNOX/rh32RxFna3irf7WvxPsV1nrGYyd1hlENimn2ulLIR/uNM
FciSN7EAHwsaWRA8ysYcN3GFgNFfDpKxduA3Q6QifT+awEZ2BNhgk53W6V+1ObCHuBLSw75Coini
77Pl3Pg0+oSprDKMTPEsgk5kcYxX3m5u1ZCiidqcleP2wC/vcXfRSNjNx4kGL+t2DXwsp8Jv6Wg9
c3v3HEitX6jIhNjtpNuUzeaReIdJ2WSmNKWY26YuHgOWAmKi3aiIL5834mUct0NzKZXOX817fY3N
CwP2+8A0mKPw5g6DUOwe30PNhKSQA+vB2J/Qqfn0NpHDe3blsn81AQAH1PzvgJ1euIXjMtlQyE8E
HahDxs1vUUf12pMKJj4EISFaDyvhWXYSfZIgRhHfO16OA8Tg+Gd6nTIVFODGx+g5NTWhErCExDYf
HWN58tJOS653pDONRUHp+PMIKegnlpQA1979PUkURr17y2bVmxrloSCay7ioBMMtWKW7m8M5SC5y
I+Ld+9JbGVb6n/5wl47jhz8Py27J43LkXD+48SP/NhWGPpqrjw51N+t0+u0oeu3vb+C69G1lHNka
6VwQv2TCKFrodjtY99WIm1OL2+t9+ERG4WQ9o0c3ZdVgw55hB+5GldCRgei1LAXnn9ZHNzWuNvcB
xRZLid/Y6jGPLKXTSzU3C6c3SqbMocxr7am1hN7yY7xJj0AKSvlsAOnQ2bgLn8eA93BuGCFfzLGz
qM4gI1Wi0RYPBYfafPBnK4xq4JKCHptU9jZPiJZpKsqJo10atrsc7BqXVO6u+JWsSmItrzgF8alD
kvrhfrt4mYkNYqriof6ueAK4uDoVWQLcc3lWsOqjo5xE0hJT5DHEXdMHO+BmVyCxUNE5/f5fZg9T
/IqXv2qpo8cYIKaAQX3lbd1EuhJi5DCOHatH/G6YRVLZmSA+n7UELG9w0fWjqv3/SXvMKR+uGJon
IbbFap7iodhBD0/MA21ZaXdyuSv6HvL4GhkRORlwZv/WFoDmr+HfG8EK1DpdP56B5Wy9zQrfBZOw
nPcv6qIMJKagly+A+mzqeNwHw03yAq5tWDqi4nso4yVHqYrtaYinMWCdu7bpMlA6fPDWFWgAimFY
jfJqyY/u8P/mMwAYKgPINHcFqb/42RPVQWrDB4bIwe/MyoUWwyjf9uhk6wRmJntix8e5qGpPHfzv
LjocH2fajDzVJi+8bpba2GV11HA+bNBbijEr+YmG91wyn32qkU/I+qJRV8OcMzieo9HbAfeUP0DI
2DVUZBdpdZHgxydxgijx7ofTaokwXo7VBvwXc5e9wh0zl4qyGcRUU63blPGb0l1YJ+kuGIfXM26i
fioXwfiBZEz2IcnkzEQMwtflJeiB+Jq7R1NyFhLY1Skxm/moZ6pByUQuJWwwvGfwb1F9los5HXbY
2gRGBBPc0jRvI9kaNble67JXgdqIm6RIUmPjTC73rbM9+MF2s+D+vAGEgHW2xUUagc8BiwaGOvpz
iTWGufFOdFHH7F/P7gcXiVVmOAuXaaucdJEE1QTUp4ixZZZuessas5lSMTfWKCZSy68fEYpukNT4
fOaK6vncY5n7KPyhZeAzOMzAYVnMXbiuLWWCz+c4m3h23tOk3bmVPfvCFIdSuKXno9AT2tLQ11jr
mnQDyAlHVVtdhGKTdn0ZLtn0fpWkAKVQ6Cb9za2JweHTnMBIcVPy4w/hljO+dMnLtZA4krhOoCX5
j10hZvvUmBE920+FPFRT4R0CfNa7vV8gqDzTECxhhA/D7+or8skFJ49PSdVx7tJXwrg0UKnRmums
ITnXQG1H+sWQ0MUO0lJGDDLOvqlVNI1ar/gvU9PQiOnSFgj8pnDu9E0o9MJHtvcbSk9a40U3gh/+
TOX1W3jGz/0Eg62YGDoTqysA7dkfX/5EvBdTXlzAHQTegeI9ZHOiFwE5YYyP31/lC1rlZWm7WKFq
fc+2UYEXOtf948tipAM6kAUIDJ00gLrXrxfcVZhzY3Rgv/OLzCbXX69xVRHWVeHaZahKhEYlxzBR
02ByrmK8Upfv+sJsyl0qltWZ4jGOcEgEcs96ZXeQb39lUbrsQW6IUxKIVZdREtMpwCZaHQH9bOgM
YSIBFFMJ81XuxlhI0gSp3TI4WA22PAQQgBuJVe1Ma9TEIuLT/708jLCNanW0jgTf9HTW1e4YJlT7
JLlbA7C7qKifi1QhGPZLRpjEB+6SDMM2nSbzs50QSYtemiJRc2vloAfFCAmQwBBAbg5sMjJxIKEs
OA7Rem/x+JYgEeKS43SahoJW0cioD3tKVYGZivsdm2DfsoQE0hj8uYuEBmfiPuSc7OtBmVLyddR0
BZ73nMWJhNu558onLSFE2c0OSzXIzqnzUeNgah9WmKnSSa0BXxEa2Wajp9pmBEgxfCr5l+8JG3Sg
4NdEwNtnJqsOdUNYDMw71nI1mkLIw80fpV+8qFYvLCznVPSuPmjSU3AwMaIJjBp7QR9gJ6sx9gXn
K3lcvY/G3NZPaawBtwL2bwNtUxZ0uGKF3vycm+LkXxHllweJ+Pox4YEdAfoVab6ZAjW7Rcol1J3g
amHT3Rg3JobSqNbTBIT/CeO7s4gHn+EOVlP50UMGPcgbMn8hwoUfKxDjQ+/WHMNJyGGVzbEL3bW6
Vb5/Q3DV113RTyL9LS/EQ3NYwvx8AkwFkq0CiFEQZW98Mv1I0EVs/65iZVHGxPt8xBDKp0t2sNwo
17ly5ceOXEHVG53rvwKP53Oq0uqqbAPrzM75PTLxEeZOxeuaJEAZYzR6rj8uQrf6IN0FtCLk3aRE
GRJSVTvtOceTpmkUqlc0fq2LYR5rk2TbvuoefzyOon1mdx1S2A8ggR33KFEsgcv27YSRGUI2u6Tb
aTF6s1ekyhpTwNOREBmiH+um/HPygvwep/yp3pdVzYkegzYYDWEckaUtr7RVaRHk0ZHHy534e3MP
elGAkd+M86djH5HGUp1N2+mxfzR24JeuQ3iGuJyvVQeZFau1ioIC1ySwWf9qF06x4Nf1cCrlOb+N
DBDgxRoBXHYBimSjys83PiTi4afn6lLZ+xyWuGfT7UuNlqihE3rtx4yhShjUheMIR6zOBo56KZGY
dnSOCTgs2HPewWZOb7YdqAluNBJbIHk3AJbO/0y1r6hIHQejL6sexlxGmUd7GUxkWbKmfNg9XiON
jO1hdWWU6QjKGn1dGf8TpvRxKFmEXQXP1CdAyI5+SwKcoAPol/eUp2R04ro+V0daRLxfLmXYhwV/
wO0hT44tXonTXfOnLbcwuprhYUxiBL/zGH3qFrFeBjQiC8O4SMJ4DiUVoiYB0yOkQWFHXjkQnxuT
NJl5xCPP29G0gdTg7ogkp2xMeT5CdIKuLClxKj5GfTfctdI7nnfrF69EDBjW9MC0ozrzLFYS0tJB
9xWf4d5kNGZkQlKOv0j54c+b0LPRIJxEC7h0lReLsxj50ojwKQt2IpIGe1rRJyr2i1/Uk2S7uIlJ
FLhxvFq5sOC7tUQCgy3obnawPmENB7f+rw1JV+Ik/cJXNRlStezMPq4TlBogLTX/VMBau1BMlS5P
CWjoWxK9JuErLW6sVgseuS4vYNQbRx8s00LYNleVuajrRvz7rXMw+IFukwbzCYtTP2/1bRs+zD83
qMqguJhVfBwBssyPcu1D8Ys4C1WgZMRkMKhzrrVzxc4PMwo1a+HwE9UNt8hbRH8BxsmanJ7Ye6Ix
/ha44YFuXHzb7kwaEKcY7wCcIRZVl107ALsSfw+Z5qVcQ8FEEblLRYJg9JCXnEUdKfoMjzw+svtr
2gjkKgopae466hQFkUviZHVlUAY1qANgC61uxV1TvTTCbfUqT51D9cx6Jh9nj2XwZwoGOjPHPhAs
2dMResaiNaZcVvSLo1qYfvAeMve6cT2c6ryXk9sMfu3WrGcpkZh8eb1Fs7aNA9+UGdV2IWj8AAKp
qwinAg1eSR6byeNpcDXhu7ImO5N/WuPP2hk98G2i3iex6gwq23TqrMl6CwdJhWmHM0jrbwYtfXwV
7XszJKiQemKxqbQ+ITZvFbIJwbx066qF/+4SSSasMzszMlwysTT9nlOgZkKyUp1SnHelF+qen86J
fsaMkP3nQpUiF9BZWofMJJh2qGTXSx8XpRT09UAqOOueB3rnck6z7tmk9CrhXyqx9Y3nHJFqFJAu
W0y+78Sc9eZFxMLvr9ayrGOBFiiM6n5ZRAbOC32MyDuCVeDiwl5Z9mw+W4cNOqCctNj/ZY3giPVH
OR/sfIcBNfIVwhU+KgRkNfI3VNMZzMo2e+O6a+jy0AQqwd2ba6g8ZJCX9StS1Jmt8DnlpHP2Kg/7
Z9k7u2JML9fvC3jMYoYJoTcnLm8Sf5yTBhHIqJAVdZy45KvTClhhZ3o5rZEPlDJ4wH6T6cMYpJbU
oGFfVzqU1uWMtOC1B0qw8yxP3mPc6JFbCFaQnXWlTm5g09B3Q63hB/A5Y/1esGZLw98BOMbZsh50
BHlH5oKIP8rGPuEv5EEUv3H5Zk7TYCNF7gaEkaEF0MkmqtIXRvCQT53zStW6ix2wuF9rXiSOezDd
jUdA7TG1u8kXRNJFIV2TY1Fm5etOInkiTyuqVlr+PZouAWkEH1zmZYN7aGwCdg4s5B8hiTgnhBx+
82Tqts1v+dY5nZalnBA5ZR+F6aT7yG4gc1G2z0CmI/ODpfImIQCx8nUzuMo0CQuuP4mUGRZJmzX4
PdXPjsBig1C7jFDJPFGq8qeaqRjuo+9xYCKGIv8S7hXTVz6Rl9kuCLbOrkuT2igKjT0z8pyKm3eN
AxMdSPfe4UU+ucBYvn/UBgqEoQkvLtI0MIt49RCtQ3/YXYse4IxXA8FLhfZZKU/EibhpnNx7m9S8
VqAyTQcCdqmSW4AmCVcD9z99M7dBoGZYaAPtHxanh+7AH4hfs46AstlLlBB9VSy61gJQQoinszEZ
DTU8SfAejQ4LB8DQaXv5tIAHCDb71jqO/qesiLxyfXYPQtAyNNJd8eKmmVC4tlGAvfKMprviLCKi
Em66smiTHi59su0CdyyL7fItN+iI7aiDhgp7EVRNuQpHi9i5lL95FWEeTLv39E5FgblDGTb+shzy
5Nu4gftSyPZY0TY53H0Q1LS1W0worJ2tko0p3IPxkGOl76TY68Ihoe5PQpZzZF02RBxOjIIhFkyl
Zd+esWDksSG9nTMa6vmoULPQ8xn/A7a3e9bLX328hVg+xc+B50SRYisjCPWYJMEQbTxYXnVFDbrX
ZyU0iPExk12U0DBd3DXtA+SM3i2B8XUX3rtMvPfgbYsTwfTrsXWI8Or5C9ZOW/WQmenMCIE9p03y
zJlFhQQHmnNtPr29tdGPQgxqms0kC1qb7Cr+zIrF9H/ucpTi9VFQdxX0kubYZ/RxVBIytYQTyYgm
uWI0bhPat/jJVXTFqALWeVRh3gDjhOWam0ULnfaojnTI9HwnE54QSyGcRX+HzeMMdV6mTuiGerh7
dEVfAxLRtehCK3YVEMrwUiCWqzUW3Po6gazqFO9pq0s6zop/TCi8/X1RLrJgiaqWuSae6phCZPkA
yBEKEgamloNcwbnFYwxsUZD+P+e0agaJVNqmd5u9Q2I7AYKo1YesJayNxRdu0D2duhSjNcP5vLyX
73xVdzqQyTMB2N102f589OdzdICZsCxLz9KRkhV3O7V3WoxaRFIG9PBW//zeY6EdYkyqb8tbhXIt
nsQK1/J27P/O+UV8Vyffn9KzfJrkcpb4meKiE+AJPrwMRoDp1BYMKNeUijt45hZ80oWSCbVcfIbt
Lw8Ln8ZCiawmykc1jxDOYUjthJdu7wKuff2+pj3MtwvZgRvXKSkWxyCV2GVqhJYqJjFHla13Z21G
LE2f18CK9e/e5s6lEezfIgtd6QalcDmfUBEqYimjp1Zz6YcVgiB0x+RTs35LAathvZWopyhw7bLa
l5o+yPyXjTyQtVww3LAlSQfBPQdnriXTah+o5/uYPJyesr4w5uBI6unOnP1LKoEhtQL4X8QNxosz
bu56Kd/2X/0EViMKNVWfMljqPmfoz/2YEjJy1K/Ke0tIOQL5m6bnLVY296AMZ5d4A2MqWckobVgr
Y7WNL4l/SfO0BtqiFvEjJaX17i4G8Q/OcNKjW89ZUNG90H81tnPXwqVLCzgJJDa28UAnxmNvLPWC
ST4t4kJuAMg9lkr8Aq4uaKt6aGohl1v7koS+TyGO68Y+cAv5ocPG/vGQNJzK49/g920hez8je//L
/db1Cc/d3knfvaXgFOzIlDFgPEFSh+b2RM19nSmoDmIp3/n8LlpNiL93G7MjWxYajUlzTcmsaswQ
lT4+cXLhFqKuH+s/KZZQDR8TF946qeKrIF0KpNdXMe0BE24I3b4cNXmDjgbUb44Hbot2LdGlgENj
vLWylT13X1ZkTyclFmp2maKKf3tviE0mITOhjSbt8+zU84mzTCDuxL6838TjmOkpRopomBfg7ae3
Yd4xvzVJIRbXror/ZLsxKOsmWzH8Jdk8KKFreRToV38L43Da3I3vfcyibVcjoJYI6yabzL6wtlLy
Blcpmpd3HLW5OqXHQ29UOwn2RBYC41W7unz8ouXkFQn0uRyIz1DgS8VFGTcJyml01/DkEvNIa2H+
AijQK7T0xLVIp3sOpVk3qrwCG5KEtwBbtZ/ogc/hUwHNMCZoQzsOQ9RHAuBSUCYxyALttF7xKya/
GEWbMZ/OxUBMhJqw7S4BzU7l/cARsr3pZgubfPd2tX4Bg09VYfS9DFNjJG0EDkMfV5vHqF+0ZlFD
YKEj7aKZ+/D+7DbEsJXEfvuAqhYUyPGVOPyQ//wZK7t5uanQCABhXgyKrahPIi53qLh5/HcUfD57
rVF5c1n5HjbcpYKojQDcQ69Y09bpJLDjDIb60XXX4TIOfnoxEzVELnjwmPwxvOxSnAg7fklCJLlb
lThIZ64C6VJxpCNKYspi08EAEf1Co8+1fm4DPzYvWJatqFP+0O2+JkKYiSn79fzOURrebwWvj92S
W+iigYw9P2j9C1Rtflh4QU8SQ6iaiJTgI4EDio4/ExSR9j2Z00ULmrx6x/m8ymKIHIcLqKwIB83q
yHMdoR8S/TLzhixnmKOr6f6Vw48HjVhXhUoWfnVL/Z+gBi7J788KA6LGOZiNGDdqlIPyRq2PWL46
EHvb4j1bGzwBWelkhugANcvUpUhPQHRK9KBYMSWuqOxHC4Qa3TCcpClzvNfAv61fb1zKTOGQNLWh
s5u7WltuQZ32ezaVjkp/BHUCMMT8YqmlVu3wikXr9q4j2tKkOWCfxDOXDKLcSel7Qz6eqGaXPAfV
iADjJcV6LenIdCPUkEBPpJg9YPLuERpIBcjyxyKqreLB6WNR4VmeQ/FzQIrlt/n0p4TPy9cjxmey
/JWk8i3/WmA6zVokZv8YhiwwneEXv6tAJpU1T/8mtlHNC5o2ucTcsP5iY7AMNjhYGNiS+5pjhIaN
JpQYV03aZV1/gzBe+qYo+wpYKWv4JpWKdOqhz52TW2Ic4dOPJ4GEwN5YyE2TZ//WyDCVgf5GtOiy
s0uMmDw3M4UY4ATK04lsYIya2k1/aRC9d8hoGJ7aGY4NyWX52CT7rwNSMOCKMwsZfjO0ZlUFDHtj
zXYx0LYV/Pn5jvFtLbkuvDqXQBqp7RgYxlZP9zK05FqcZhVYzSCmnePzxsNIbgMi+7S2P2HwCO13
snJZeiD+hPZ21/o+04GOi6rZd8OeVIh4QMWbMMIHBARYD13JKa8znqxLX5YRmBYeGH8hm5id1QNi
4xPAuG3YQefvSD8dE6rDO8SvAU/isEs7ZGCg9nz+P/Wqxg1bAwme/BmXoDntix5uSWxHvlCnLUtq
HQpzp3hYd2DQdyC8ZX9LBoDtSXzMkduFwnRzltRYeGZEGttIFQ/RCvrk6jBsOGnQPw+DtSfSyiXU
EWIezRWiNdcDEzDzqWrltzV1DBfI7PLR3h8w28YHDfnYjjMWeeLgDIFDAsOEeRaTPqY0e0F1OTL3
dIDIStosCnp+zsLobj5zA5EQtiFUXkrJXu/3OPJGuKcJ1N+M23/R8Mz2FDVazV/9w0Iw+03Bg12G
7/cy5ShpoV2N2W8GqnMsaBH7nrgoC8pap/HOJEisWzxDnhBKkdASyycg3hLXuAKf3/u6urUvX+uY
OuBgVYrGXnvOJS43C/9lratl5F4REGheiJ92lI5cNB/xvHLjkdmeGiURIseZvRtZg5d3XmnqtGrr
GWNqYvQja/UARilVb9tJpLqsp+I6sfzQj6mYSzkSGexvV4BZ92KTUrly/goUfdiNHzoCAJX70Pdu
X+kCKGVlQ8dlQL3yTKsFjOp61nIMBSE4DRbFh73sSafkSQ9xE63a3flP5vTr5DaWAxJ8rg5BphQs
2GNIInAwhj29RI9zL1Ng+ZzM8MMnpCI0/ERmaPWEaSTjxa/VIR/o67rK0rXERU1evJRNWR+gyr+W
GWHclr8pR3sKZ834jt+3k8FFJVt2een+78SCb6Fwt5qE60KNrPLghbL9oTV7ehRHV6Hqvoewe+qv
4NQciw+bq3X12G8U0RxaQLx7gToTZcSh0IgBwy/OJkZqh2hwkfjeuAxkyHfxisFmoSJZusZs1Ke0
4RUxfX3QWyTiA+lmZGOy1SielkWVmfvFJ50Cyh/Lds5vyIIxQQqao0FAjL1y5/rx6tBj/Y6WH/MB
zENigGFnI2PBjWYu3FTcyzmzfUlrxNVUpZK9ec7Nn2mYGWY0vLJKiVjRq0X+EldYNRm3vb5K+3tz
A+d399YoGOF5uQRGSLN7dBjVA2eeW5Aym/L24QKM2UFHqmB9mEVoPTsy/z7mey3qHFZUTFfl+s6u
GU6uZfKJvozOFl6XOBxkNgaxrAKO1VZ6Z2jYLT52iMHmY7KcPI5wfXtGHhJtC5IEpbQH1K3mqDHl
HTGvqLYnwfbxfk3kjiqfoFrDpf+43uSMrL76NjEZ1HB6x3GbWSwo45pW+h4OafQ1JXcyBcqPYL9P
lkn5xA2b6iQE0/c4TpFx1T2xvriEGXSghgURqrF93xUrZCR8XwjqefPfC0w63W4urcrqwrPNbUBY
U366nJ3pA7XSljMbaseF3cPuGQW7rc6qMBZTnxGj6EO7NE3R2qHk3nRPPdVvbfkk61rzg+YGBrtg
S/78txUHjcCRVnAilCDNXQJYz4hz+a9ExJoDtcY+H7+LeaBT2VXqgINMwNEbxJRqrePOg0P9GvhJ
UWCGpk2Z2DePiVuWfUpQbw3zsYHhxuCq3bnypw59CHjBedWkf/f4HnBMYzd3QQ8igFrHdLqjp4g+
VhZPetYoW6F0dAN5Txkz0fDeFoWllqsLS/htNpKkquSk/M5cGqKe1PzVERnYZvLQICiTGRg5jpuM
g7Fso3sT35eEKRR0MnSSz1EQt8sUADZOAz7p3wb5OuWxOx1S83AjNopN87UCr3gQR+Wl3SgP/wZw
4P8zzNzRZGiDQRTxkughXCTUs+99wW7UqH3oq2Vs4z3NZzmbIqmf/w7WdrXZVjYAY3suOuZj1Wjx
kB79+QXpc6dKviMRA1PnsILpaIyTgnzEWz/VhMmWzgwRtXl50BKBJLmZvrIYeuiWNIRe2hBNFmte
C4hWrTI1Hn0it1J75oOBY3tWC9TQfRhYIogGrAnn8JkPbb/EkFczvjRpxeqUXRXxhEd6evtPx1Du
MMNyZ7Fd9eKfijjQXiXLjvechVU0Gma+z5zdZ7SI+mHYsLWS/x9I70GEOK4nJvrwZi38qv206gdQ
YsDTS//AM7oHYjMa8KaPTXO/G9pQEcL+2KGFFcIrp/XwRy3H5dMDi/+uLSY4Z8OFcjnFxAoJR/V4
GoFSvHdb8vM+RRSXwKBiWzkL60/VG8uX7MDfKU5nCFavYbVe4ziY7r4TNc1OmdI2QMtLsd7QnXfR
y+P+vV+AIqE7l6rVF58tCxcOWN60cTzKU9h9LilprJaHiZTv5CSTjM9npQ6K4ARvYWdt/Oc/+aCp
KO4tCiCA0Z2XDk0rZDI/tB1ZlD1iOAZUfecdRGeGYhHfIQKF5051K4p6HBmJwydjSk7751UZo80E
gCt0DIwG/omuZzH1ci6vMvNowfO0iw1NUMoXsFdCFJJDPIHuyFWB+UgUPajH5tKUWhs2ZbsFo88s
Yp5o+df5sFSvS2WuKVZeYqNYB1rNdh67TbnUdLS+uKs5oIv/9H05IcrHe241+/55658c/mElJGLI
ojWTRFu3lEGbunf6IwvcDD9ZiuN9pIizN7MHw3IpPHEnkcDpbd9xsjV3zrfzPuMjVeKMdm7J6noY
96UpREnC+WDcJpSMU0F1sIeDRxgE4X16VpmsPS5ZpLl9vu7OpPCq0wC7qe0WcQlu+XEK6GsHxL0U
ZWhNWAH/2TBUraCSNGs1EHkXJa/5PU9lyE9M4dPPoYe3QjduMbhTHJXSOVRDwblcuLWso0nsTvvE
91Vklg91818J6/XuZxlOl4MnQ1aN4gZ5A8SGiCWwlheh7Ob/b1ADt//Z11sOvhcsHO+welnggQnG
Rsv4LQ/L9QBFNPlk1DWDAGsRVkD/46r9lAjSe3uR9d8jlWlnyrabNlOHLaZSHCJSAJnV9t4Qm1GM
EYKkNaNLJrmd7DNnzEOGzoTzh7jy22KBad31bolI9EcLWOLrxwqXUyqIzVVS/xeJJbyzq/iiCBDZ
fbysh7QimAjuvXw+zpehfZISyX/beukCsABZA6nVgPu0e3aqASibDGm11qttzPkaBRkXnj+Xl5EN
+XoRo991uQKgXqqGdqgXGyRJ4G+B5Vy04m0qArsSbJCqVrWac8lljj61zLvBY23xZpAfyzg3gurI
dVG29QVo+/mFfMZIgmsp+62q3gJNx+rf95GufbBaFIAjpcNEgfwAKPooJW7alko2+OoCdRRxjNNo
kqfqkHg+N3TJnBWtTYrSOrIVSOutsew7k8NFZPtY0k2onYCi9pSDxJ7kO9Eehj/cOyNohb0Td9S9
zntL+0xJ+O/FhCER+CvZp2wa3kzVWTJ8JlIUTaCVPgi6cILb0Z1aJxlHWwG7wiB0pDBLcbb4fTqR
pEvzbgP8MiZoBC0ieV+jyQiJyyn44HGrSDU7T8FxPQqauyGXTYdQFkJuGFOJGKNvqo8oBts1DO6r
xMOKhYFvw7WMOLRewIIqe7KszMeVt37WRl3zC9XXFhjAkilO2csa7I9qXJ5857+nsuKjXKIwYLTi
vIECe9kdrB0vhQsM0emy/M6Ks7t5VEY+4LopXZTX+qNzzck9YtLVosO8TL6pmiWUnU0m9V+n5Gw/
JLsgsMknvJZT4jOWX67oTN6cUsX/sm/xvdVLCEiUAgBFvJ0I2mEOzQfQsYFyNHTzJwZU3NcRV95I
HI2RKa8hblIYwbRpuDRKuKbMcwHlYz0S4mr9Em0cCn/D+/pr4FsJ0Y4nSrhk6eIFfEmQTM572XeO
gZFE8XqDRBVrDjaYZkfrcpIcgZyslTTOoa4CzC0Qy650lTUrpxA+ntCeSZbbOoAFHqKVzqaKsSqY
Mm5kTM6Wr10DWWuqSsF2VX+AJQFWsKW7P34jqLizGIJ0wP9FXS/lth7VCr/kJDsYo7WsvwVeHPKo
IwlGVK7GdUgQSqWU5LF9AeSalh0IyG+Sf9gIOXCaGxn+Cl6u6Q2yVH0xO0MOEv4I/XIi/zfNedn7
7fSmb+WWv6b307A3nbE4I6JlBvZrRimnzAy3Lf9ibdrVyqSNGqx9j2zd7WwgAyHoxhYcHiRN7/R6
+AEydWRstnKW7C8ftjGZwemygNzeZhc7zRh8hyYN9ePMHoBfhfdIoQ1JYtHmiICdjIqqcBPmqDVt
3RHg8uarXloDB92SboVu5c8NeN9A98ycDhxQ0573FFwLf62YcYgp8sspOAVCYJ0cE93XDSVJuW2W
AEMVC9OSKbiiE9ZtbHw/QVQoG5KaWKMS7HSxpKF/ONu1mJR7eA/ZUvixW8HaeFIlDyNkKVf5iYkZ
tWLVdBJM82Ijugh4V28mh5q1KCtRMyxwGrFM1ivwcMtXq25nsLCZEO+zapoxJRimIVnnTFJt/CMD
Cc5AU9fkM0TgkBtOqIGot4VbmuZZbUNkOh4m7XhHgf1HdfptipUJgNJ/ZKMNY2zzY2E5OHacsMGE
OAHBH3GbSxw7ukZkzqAs1JOGMpOft5weEF+/CJGJJncVh4X48pzQTtBA45osPqtaVBllVLkkRzAR
NDBXdVB7uCElpY6J+SL1Dfrzz4cxrMep13rpBwifPZXTyv4WVq1/b6/KwmNUS8Kz1uHD/fgG6cGb
j1qIZ7IR66eBr9K8j/FnlW3flQrmmQgaULLzS0CWOQTyi/L79HZEhPMQLKuAmxonYHk2+bLpqm5g
QtU1dVisCg3Xkwb/GdWMPqdDNqCpt/BX6SN/dJzmuzSx/+gvoRKJd1GBXfUxEc9oBI6XZQBYrqRj
IwISDLyRVxO1VaSJPuiNbpduj/tkJkO9SdLVn+rft2uiV533ur62guCV8hNuDrSF/hWHBF8k3ZRB
ixxtQK4CdVE4zYYPotm4SZ77pOWoSg3eZCq1QpgIzp1ndL/uGFB9xqRO1x0Ji9hVyA/FcrKwNEOY
SKEKYvzqGDJJOQSu4fi0lJ+6c38IhmOoPIkcaD9bBeeNFlRJN9uPuWeSeYpuC7CQt1zpOX5lOuyX
MzriIWSxl2ew6ptfvIDw9HkGGgWyLKrHXitv94wZ8nuzMonrOTLyt6DH6Y6sk3JjaEFmG7MtBxjZ
glshW041lVnLi+w5IP3QXHNBF5Je2uSzYICCk6BdvVwVEoGBS7yNOaZsNESUYYvU8GAaXf73T6ZR
7lhoosMKMfLSAZkAdA9/TTtE/JpPvw1g5Dpn2CAknGzlJ5xRjQPTIgD2OPDpqIbf6Ax3Xp84U5IK
VB0FKjZRucaFV5oklVFx8Dz7g1W04AipniDS58X8WF2EnmMKp1m9qYA/4FzQeHDGRZ5hCd51gOXq
cmWwC8Ugz+2ReBmIDu/tplChoCjJy45KVExLzFBrHAQQQoUMyMX+1AVb4RhMBW2MCPWOWIhT7eOp
GHC8aDkbG9mW3gWTgr7XS4NwMaj/Hz0OhTfDab3Y9+43cEHJCRa81RIjR/T32mU7MneuX63OGFEd
ovqNnUmY3OIuBrUtICSAYrMl+tEzp063nbBcHCxQ2GMkIBk5mr4wM9GHqcOCifjt9UmAgmeQE9eS
TMBaCtQwB1Hss3Wnt178tFseZERva3wX+MYXHUbgrTE1txwBO2ly1Y+C9nFLm+4dwe0sNnDZzYr0
gZgyPTZQPYOQRp6V4IY+POREH3RgJg6+ow5XkNIcAaVUZkCKeBHj3Yi+XPzVJAx+INwgAErfoG3u
gCYIAdYgiV6xCgydWTN3hcFbYPxLPRLZ7xoaGkNJuw+/tB/CUFPuccITxqb+PIYgh57tzFk5i/e3
1fCnZOLj+VPYaDQ/2MuaqokhNkhAFtpMNxynZs6nRkFzKh3osjGde2vDKvyc/12wLrKwrqi3oyEl
GKamTR4jLRIVRW3NLquLeztb7TKnoyWjSDXOf1TKh/ue0q4kPyEe9lOt+GGP2UbYWp/TCzZtJ0Bg
S0N2NNnE4PSJRzC/URWaWrFlZXmjYUs3PFRW1oOEsWGxgxliBPBYOmP9xqumzro7vgI8xFCnUnwm
YzN62YmvCPi9E3EUzs/l6ojDz+P1IWayhWiOkQuQo7ReT6KzyZR7W9DvMhXB3pkjZhNvG5/TXuum
AxwmxLSL9ORTc4GffOcH0bMkkBFK7+ezz2ZeB8K3j1X9YlopHKIlzrXmKoEPqi8f8EQ4ha/HvVmx
3VRq/AFlapc+5xkHlFpHcYnHcPOASgMng9H2idbRbz+837MN+Ig1iLxnYo3PLk9HcIjqUDviHr93
zNpvxIUwLrqkC1bq1Kolx+A3XNWFCC3eDR47tVnrVmQdHI+qdL3jLEn+nC9B3SuGfWnRuoVkBhSg
//nt0tK4stwakOY221KoLacYvTYyz5F9Tj8nXj2+l/WLMopTS0eh2p8oJchzBalsj1atppvA6T8b
xRtqrC1yS3o/MPIBWK/6dsDWlsB/zSUtUFWKkE2jUuqZPPcZtaRx6RmoQW7plcyE3zCkNYXWhhOw
nug9wH8CIw+xbZWeiIkHeB8JgEOEse9xz5HS/I+Ju3LFVwBBmewhWi8nc0kHwmPv87Fb6AKD9xYx
de3hJsXdLhOn5YGKnu/SXTArYnSSijvTnjrd6UfilRNkDoQjLVDXIqZ9yH1pAQ0P5TJJ6Gg+287z
mNAtqbL9QGe60V6lUNxE3lvx2yIqU7xEQ7pkNaNyO3EkXTz6W74Y41eRfAmB0B6RgUhyC8lfA8wY
MfwGdMlRgniIr1bvXhP1E+Mb/KzAJnta+9CGOpCWZ1idDzlAOx3MwjRDHLiCLfdOP6x768azIkmd
IZitRH62KKkNXIsuRhlAAUlnDj6ZC1TtzuQ5iYKDuHvgujHM+BK1ic6YRRV/NEEmLynOmb0D5Q0q
i5W+uNpVXnPnvZELqf6fyja4e7wge+JT/bKeNt1PQjJEo/OGK5kkK6brx8ocO34/MBNpQQw2dXd2
q+nJ0HijglU7z0mS2t8x9iR41zX5iBOtvX4Zri+E9N7O7fcwffVhDlFHCXwCyqvAOvRJf0dP+4AF
quSg6+PKsJScseEyfuMmGg9HvzylKk0UEmfpGdao5qjKoj/GHk4fApgPAtUAajKES0IlPP8Mpq/H
oQ/lEL68/RWdFUhkyykuiuhtsVp6lWhEptfI3LT004eCCStD19L6X1ivhaZ84DvSnkrdlOCXzD1J
4g/swcxHaPZ7MALJZ9wLo9hN1jnPxClG7iBEkUqoNfBAzbLc/5b1I2iOOFi6fX5rdHGsNKkbpPK7
64qN8jXhyPDoWEZLi+51choO400/vbpFNgenzEKkUbAqkEIrc6OUX+7RLOOHRftIjmWCX9FIwf9i
hZlDhesEkMKOolJu5MXdtgTM9XJYJN/KZkIY4DEZaQ9UdWooRKIQ7VC6aJHKrLnL+L+7C2thdQP8
VUEOgZcckWW7SN60KQO6FVAyHrv5LHJ05dXhSxywf/YAhAcykerDE3Xk8+avI21zrHpr63G7X7cJ
mbSN0uqSV/LQ8pMMTUFasqj/vek1ZLmeMVpMeX6nyannlebJZYtMskc+wobfS4alsMKTm7nExCGZ
zl0hWsM/s4syb72gjxll281SdlVdsxdMOdDun4wG2e8KxVLeA4Sc/Mcf9Cfx0xBHwPSOb0+pg/0I
gLs9dEiv/fM+CFfJ9mF09uRqAD8NQT5RgUPkjHLgGck41tactJEIJ33OQw3gAO4nNmI52zkr7LZk
6QrAcDc8/WdC1i7bXWIx0i5XcXbec5vA3xGv9NuEHEXNb4A6iFq9XQa5jYLO94I7pifBHOH2MgQW
/t3ULLgiOT3BXlMwAaXBDkik2hb/Qud/VK33DOLhOghqObgrEhXao1bsBH4GF/EKsVWy0LY4dJvk
0W8uCggYR/q+yCHEfWKoQvOEncEOC3l+fg+KN3B4nG/VF65wnvFdFKvVEDVpRif41KeWmJRdf4nP
EsKYltFNDyL9X/sAp02m2WVyqQwpAdN1bCnU5ctoxdYx9MJZgYu6YRc02nfCm2GnsTddUB5Anpr6
LScICPdsazrENJpBDizOh3njiAUCM5gl92Vb1jsv6scTIr7DxSgWdoMD3qcL4VBuaY3+LxSDfFZh
OQQiPGFAHrex2HmEX+VAW0YP16t1ngNsn39b/qb9MEV3Dym4wMppKtmaNHnqgTLE0XT/LCkRo1/7
CRYGUvBpk483Rere9d6RRi/ir330s8TARMufdAkTr/uVg5KVJeMzfoUJvElzY6wW+1lXyfQFp7mL
VwSY0L2FZnTs02HlYjAlctSzTHDmbiPdWnQKXCnoOvw11Xh1/Erh8kqr/c7/HAT3DhXVIJIbbtG+
AyRgpxdQw3NT/PiEjqjXaajCg0sbOGv+59K143FG29VJK30zNva6WxutL0A0BCHYmh5fqWLWxOIV
T351ZMMHTLeaeScvAroQVajsDlt1VLrywrvpjwNClGj3tS70l02z7U9tqNZm7W/OulTsNqbC0hMV
5GBON5CzuD3R9IKq+0gQqoLv0q3kGUxaH3SeIbBnsVHt09SWPlUV9dH59djVA8fWNfUD21XA4ide
rIVFc4cu9kP44VVXuUMrWHPNIhNzJjXWRg4MskXEwOa+GaHyPKDTkfnnWjhN9qZ90m8qpNfieIVB
v9idUH3Fm3TWM4aeAGSy8NA25+JnYQLd59uyB6VeNEk5m2wSvbxkBw0K4MtbGB82Dpm12Sfg3upp
I2p+zQi2+JpmO+z3NC8UP6/7ut8IweQ/T7okjhPqtVDg3IHQdtyLWkqddyylvDHdfUYw2dtN5hBP
lKOsx+kgYvr+q+lIF+KZpbIeAf/CUJm9EcC9J2NHKWJeAGgHgAFgQYfCZW9ZqmQrB5kSY3/jj7+7
VDERI+DR4ILu4oWro7jMCjlirODdu2sWhG7xY+zaMYyx2HHPouEu61faQkQHJZ4oZeqoTnmMB1E9
1uxCYEX6xyVwTRZHDMTvPZBVZEBOgBj42EsXxYtWJzBZYxsoE+Y7kIxTFbFDwQfE5y/ILp3/Ihcf
rNiRWIrmp6bzKJBM5cQiLIvfwq0zhfrKVF4L02FIx/Bf8La6ZW6ktubawsRbZnTIobZhrKCirzwd
uSQahOTyoyNKD7nVYtNNl8edw855nFs+menlM183GnUNV97j3P2UfPsAEIASaeQuFYuJBoITGEKM
6q99GvqyfBcPkmJ9j9uTtlZgNJ7E6gQ1FhiytLGNzUr7DKTSW/IATr31Xzar0EGI+avwFVfK2G0J
BcCSHU3DW8O85zbJqd+j5g2I8W7WW8nOXGRZhz67yrKWGVpTJEiHsFKeZNwoI8rShtVUGcm9JCGC
fYZ/Kv+Myi3oGy9Qqc0L19t0SV+SR+XPBmvF3ubluC4qYNsU7oj5v1JyS8DbjG4FG9iDPMFpjp09
UQJWwlOvQGLxh4+bC0k0lpFqi87rK0x3d+Y1ywxNDGdpVW0IYX0XiHLx9KUopUgFG5m4QdQbZOgY
JdZSMPu6uypG9qGU09imun7ZuiVaQs72F98wtTRQPrnb+FWmXO+532rLhqn+9IAxRNokgessgiZf
shuIb1Oii1t2MpGBmWxKaMWE4DPEOkqzNc7Cyf+qmDySLkAEVwLGkv5aavL+3/8tLVH7uRcBhqah
1AKqV195BA6YEkE+sHzu6ljEABI7nWGDXem58wHT0DniHyDEIp5PCtvBFiwgPg0X/H4CLDVrjMdN
+7SZbv3HKT/elxD81aI3CB5rB7M/A7i4fvLUqlZh+OwkEzMGcVk2GwOt+MTAsSmSRYyd3+S0eLD0
cufNx2liWuy3AHi8j+us3LGzeupzd76/BsAjhDq/W17anSl/sqRMZvDHWXbN5z7RxI+KhhksYR2g
CVyfarxT/eLjBYsM8AoxMEG1XP+8QefqyYJ6mRYgKqFqE5YMIYv70X3/ujVJgUCW9jzEhkFP0exF
HZ78kG/2c6o/i5rvHq46mk5zRZxA9xFgE0mupISwfvZaX/nJlfkavX7mx4NLp80UktGLfhnQv9dC
6NGsyIhw1mim5/Rhm/G7GFUx0mHiEqj+EtyDWPs6gUd3/CsFQ/w/GzktUMMhg7hG+xrys+Ce8WCd
6Oe9475wU008QEx5ciqFPISjirnSa0oudE4rM752bAjWKj4efIevbufNUt/sEc9GHZASkYO6tHy0
Px9bLZjA3c5zN64tRUaooUwsIUW/E+bYg0sdQSET/0TMg35nsWygWJ3XkGdv8VgKJWsU7nokCmHm
SnmTkDI9OqLLtGk5dxrc/BZdNG2tlznJhRd5OD7/yz03EZYT21KkYgmWaI2+Snif1aurksFRz4hK
iSS6ZvrrpGPz3INB3ZTtkLNsAhuiikF8C5xEps2D7/AesgVp6oDZHlXXgDyzxDw+o33gorEn4Qnt
Q3gI1247q1XZCOA8g5fQs0ixyI+GMWOKE+VGTnKTsRwZRZoHCcY3DuzL9kgKWc0+Pj7+j6kpeGjT
SZh/Iiy/OMJ0HIjUFTErNdPuXrsurtMQn+gk21nEDu2ynScVJduz0pRXGVtXuO9h6W5aaTTp7W8L
77TtZ2pzgyEwkI6QAQMzgDkymSjugBCU9u/xpJ8VSi0+pKwnyAk/ShlTr37LNmAY6coc2lOuktWZ
GDi6n/7ttthhXyFrv7e1APYhdbwUoE0sEkpbMx0BKak5PGvwjdRR7DXFYQ58CBKqXk+vR5QuADiE
yGfdRy+bzyHaylBZYMLPK4467LBycdbPjmXFnQBqeNvM4ZPT0piTWDsbSA2sU/i4NX4garzlEKCa
XMQCeoaWmCOntOZ++Zj6+MdYNHFMK3tZMXhtJW+ERQyyTUxjDGUo8Zvl78f6tGbCocPYi8pSsCda
SJjzS0QLS73AaOhwjYiaFNcFhg0QDOCJ4YoFzueUsVh/DXdFauKJGSMkXC+qkzrsC3tyQbOSxW9Y
YoUH+DRpMW/8iSQuCeJG4RIRvFiaxE+ScMfmHLTmywAsk0pr1/2CJXfChEUANcwFsyd6EQX6MCcR
WuSeNgAzmYruW8s4hqkr4xN4GQR14aS/pGwzuSVpPCneW/QPRZPD+c+9dhW+cxP6WHmaVePlWwJD
o7x9YZR+YMtKc2aST8ygfTwLLmdSBk5+rOwUBHpsX3SkXQerPLxvi3irGCmh4Tad5hjqODKKgBlJ
OYOiK9uylTsZehsfuok7AbK0Tf2YkE1XAuDCcjEFGpZVo/7QVHc4dEJGpD2vDV6PvNTG4rBvRKvr
Ro1qaHpXqDYDE5rxXDtHfgtCe3Q0sujsyqQZxejaAlg+SNNxROWtKin9zXXdSYZL9D0aIIU9BDQ3
+mmkYPJwwKwAGUDwGdd54eNZ4IPQ+BdAyg5LbkhSWbgIuuXdMC6Rv3pT6w4RIQxLMzD0uESsp8BC
Azi58qIv5rpaHBMASsjmIRbBHWSf0FejqMm9xapDeV+XNqEPJvvf1xAmQR8+naIB//SsXA8b148Z
4Gfv6LYgdN0ePMzxIMq89NZixZHlad60TBYDlbvuji+I39r+f2Hd/uTeJywX0TXepiTGS/YnqCFo
U8gWJDE2X+A8qrGLmRjYpFTpm/jvRqC+TqPdGOjpEc3Oxy9kdjvoEa5fzzziGYvB4ljtJckIfBfh
ZmDUO8q6eUo3T7bLwtaypSAZvaub8JdRke/gZBgTNaShHAmf0uFs5CvhVGr9nSSW6/BYb4CPFrmB
Q2n5Up5G+vMq+LEgSW01wuM2QD1P+d62B7SUajp2V0JjlyBL+pYuEH14OddrIsavM2YxpDZbECV2
DMlPClriKyYxKX0O8MVi0jl8xhBHrXiyrfgDyXvdYfICFki9pAlcuyzNngj8PZOIYwwmNvdJ7ACk
4rqHxUtISXKuQ+xOEZTXEv4Vq5CcREuiFfFklMdb/7SLCogkxlOzxRaB++UMQpjRTzCzE798rAlR
sZzHfTWkuOGk85CKhGgKl7ekSSZydfyJY/Llt+ft1fWc/83UhAfppWR1tD1/u1G8a/pTpIxImvOi
Di3w3yWCNpD9qD7whnVW5LE6isWVlM1X00H0i/7pMCPNd82zhnCYLABxLxWCqoNVrYU3QrMUJOtw
P9D10lnCHx9El1SDpRh4sYeESuAe4ZZNjYJuYXtDIhLwc8KIKKKvsv+0OECaj++3t0by+EDaqvUD
C3qtGPYqQqNZLJeiYduWOt+AajASA7Hnf2dD9GDkEh3BPBt6lTqBQryoaMuowalzguKDr88NdXsG
gY6nNhTkHSaudL5W7dsbI1OJewantwo46z0x2gwehWB8CDe7p56wdu3a924TQNoPPUnSEKEwc0S2
fSe3PvsvuawyIr7tRYjIUR47YwM7TdHTGuyYuidrSgKjNPY09p2ndvC4o+qPN08t8gaVUCc1GwXC
pONcD8ZJRjz9hT3Jz1Y5c9vK734Gmje1xwIrXHxZHMIx5Zy6ba/y7ciiteAd9kGg42YO2qknkPVQ
tyom0w55mjz1Qaegtk5shKyLY4tNXdjxgNYIotW5FJTJNvGePPdPUxAP1LPcCwrOOv7I0qvUBKWX
JJbl6FvZjpL5ZGDWVVMPB20EKgp6havCCdNWYJPTkb6e4RTWKFwN+YOFxSGn6fqlnoy5pCTyxJYY
VURQzlTQgk/Ql5dXG7VN8m8BlcfhH4JRvxwOrGS+h+epcf703kb+nVZN8bGhKiWum+jWRipF3qaM
X+XGOOZdgRErC740AQk/r/1H8ge8jwyypcdPjjbsGVRkE3wN2tTxg3zjjYyhLKUKS/8qdxfy/YWa
iuhV+jAuXK0TmpWGlWCO/kAe++7H+N89YMr1c2iNALWSrelPO76/rr66xnMLG5wOs92j3f3n3Yqg
o9RbG3wZ66km+m1YWn7ZBu5+NSrycBwgNeH7DIQzrCPx+0N9hSkoA0QziaiUS246rh31b4QTLtVa
fZ/REbhybfyL1MiWP05sadgkqcrgQXb9MNnW6luKn2RB6fuBJhEx2658Rs+x//9xKtEzSxzJqNm7
pMvUgWoohC1P2FPzi72ReTcmXF/0LjgqRXjy/OMXlZAlXEHHMLu7FIgRw/CwgXlMxyTu1FJPsdtH
C9Sy27fhSvvQxmi8faTk4CJt/E8H+u6zS1z22gTb3hB/m33MKur8W+YfjAbxaeLKi4OzUXzH7AkV
3IQ25+GvtSt8vNeWYlKigY3feW0Mj8w7qQJXVu22aBVXSFJsOvrJVWCtGtR/Pz0+YEtOZc+RFmm3
iVgPzDTkP16FhUip6LJpzhIxyNcE3dUgw5dUnbAX3USkaPGO9yREndjMOO1d9yBf4iE5/FzIIaYK
zw/VU9bFk+gRtCgm9QvkMIfq1Albe5BCUE1qBzHbMeuARU5Tv+MEbzzYlJy3dvSUSA2s0p2L8gTY
S+ExGYepFTzXMPIjXcgUAsxXW0aY/65nnG+6lurDKmMENTyDWYwxvbLUgvkQQ6nEBJcL1FdBFIoh
QvdHVbzP5gsexE+zR68lT8NQbF57fkotYLSFgp7cJJIa9T6Hp6CliIwv9IeilX7/4p3KcOH+fyE2
M/KgD07IxnziPqmrEUjbNsrfvFxlejzMAuWKlKvvWThA6+iLjylSxYhvFal3Hr37gY7HOW0Zy0aa
KhdvhQvRwk0Onl48LUv6XNwNx90qWjM0zICtUvCE9kYYUVJSsBzNC12HZYixTtegxPEXfzlXAjsr
0IMd//m9TTuxgC8tiSqkCCZndJYdk6ELs1EiZZ7JCmJtBwIllqKmIjLVAhO6AXvdE8zDizBAJTCR
HnuvGi8A7HJwzI4hdOGpxoqLBwexMx7JRyECM7rOK4+0+wmegSx1TTFyWFPc+Hg0/mpfY9dhCL97
OeLGo+Eo9L6PZQFt8Tay7qVBsJqYtjco2Rc/7f0fV0y0joxAJp6KekKmoQsnrO/teHbzGgkdotjk
2GDI1GVVhFjRnQAU7GGbPUPN/Dd4zKM62c7YSJgA4uiqOv1sZlmVlKA9xX74/wefwTZ8cxfOM1xb
xCPRnaBsu0XSP/YC/V/DfmKBdMGmHS2Gt7l1suNNYHE3xzZp9OFLcW71woFu/62PI/TuOvz5lqp+
s3RxDv4w4/hTjjJ654suuhvfxibWgKIZ2r85kMtiZChRSfv2lUcWfzmbhurmY40d9+x7gfwfdW5m
wCcoWT4waFjeM+4FtadpJzuHGiDyJkllPQilLFPVkn+5lw3vk42uRXxAG7NXOEo5cql7VhmVvYs5
4DLh0Fn7+ftRqr7Patt2Owy17YwR4MMX5skHywawQmSXRnnibvf93B2waaKi6EUjDlnww1bChf/P
DBTXTLTUb/E2+v+FhaBP8NMD+vc5m/0u2yjg8BmkQLiWw6xDLlGz2RC96G2c/TdFSyxXNYLVuyhF
ToLtzysPXwhl+3K/kCudfgLIE43aITN44J9llLw+QGEm/ckWTqhfd63AmbrZ3SFwI9xG6+qlnHVL
Ci4AY1Raq1z7hYqYh4PmkWe85pqyekTtg4XDI76udvll4HxsCNb1x3/n4i3R81XaacUngK1YWeTH
gnUeB/76kQStW1vJ3bJJqmJLEbzDQj7d6WF+Dd2fPgK1egt7kA6XsGp0iYLyqsbJmN3AAjAsq+lG
pTt11NvtDndwD+IcnEsgY3+2jtDny/1Fbk+7Qdq9Op1Zbep0MjJDTrllxhZC4oifFrAKgR3Dqjni
jGMYwmO/SW0e1hzFnWfdfErrF2vCWv+Eff0MtS8X/G8xSOSJHTZzJ41U01C03AV9E4Y56VK+vmUx
lueel3SGsdyc6X4Lbsg8FJkZCltiPTMKG45GxDfN/GlbmbMWl3v39HGmWx7ePN+qvnPpKNYFi1q1
/4Pc3aYB7/Z+g906f6CSNMnotKeDh9/YHXbq/KvkPrIM2gkP9T6xI29oJiUXxBC+W8FaJsoMPaSE
viadu5U9iFoePKLdBi5JsJeI83+538IODdAFVB4K1/LQ+eaYYnTYG4kTPTktxIj5mBRE/qGNKefu
g8yrtH5go7FirDf4F9jBxswnPhvKDehoQPyMOcDyr+i3bn2u1Xr+q2te5lG1tZ8++rxV0bMS3HjV
r9QDbOjJM7cJBs3lUKRWlqY7pEznW1TGPIGLrFNbG6cSb6cs7GUvAsCaVeTSqMMmZ2lKDVysAOtq
oDi3HtvEGrIMD6jC+p6lfaJPOlqO21PSc4AAHZvIC/opkvDE+3ulJKoSHzcLS5FF2gUMWXVVVV/Y
SU1edO4zyU7jOXNAoE8q8uRr2MMoVfA4jviaUr1dYiK16aFg4WwUzSHpz/t8rKEyjFo+l4iNMacr
8WbaRUox3ltEA+Y4Qdvrf+mHSEpYLv36rgz04wdp0mMMGLnmeM5hX8qj7oyj5argRa7oYHaY0DLW
jBa2U8BCB/qay+kjnTn7qfBlekDf53ogztA8jcdmSVrbMe1k3Xm7z4UeVr7O+sdqkhpPuA0SB/v3
YLa+G9wkhP9nFZcu0eW53jrao0KW4HLLHCN57EDvgKfTUa85b7aH6lr9E2/yFpcYGakfWSdeyVsC
mOthwp0ChGM8vrkhMhR2MwDPa48sFBWeloIxRE9lOYkfSzDpuGMqGFOkcKQS7DCdBjhmb/RDeuUt
vS/vPk7pj3M4sjvdlCB4VJ30JdQvJmyp7apKLwF0HjcZ2t6jlRdrvHN8tC4ld8Uq4J3ICbbUHnnN
y3hVwCZDHGqQtwMNOMpH7IsZXF2cSTqB5KuaIxRMS1vhh1krYMsrJMQNVdGKBKSh9b0+EvqMceAy
kaXY6QEbybGikg/OlM0Z7B8Bk7sp6FZhodxueMkzCzyDZATXg8iSaRDvS+kZ2qjvFZjXK1XsQ3rI
SKiRtwLOOrJNj3306pNihcolL1EqOuIUwf6bgGlOR46m1jgHd8R7xrz2Is1CigBUFEaX6cDt2h3R
uo18Erc8ubj32BsxwSGxQ934YC44ZhtOSnOF6GK07ruFbAbhGiivo9VYAEKqN5rhFz3U1PO+wOYC
xfQHTd6yu8MlWF5ReLRo5zGdkoxuhyJhyLq2/z+ZXOA3tR2hUm2NEZoCx7nHsK1tLBx1TVKdsFo9
qjaWeirA18L6gCUMkYKzfBypPM+2A56C9ed5W5UxI1sOv3l3EPw2vSswJX3+v7owIozngtqQ4Jhy
+9bOsRaqz3c3yCgHXsZXSlsSrq9uivpqJHsGnfXZN0yYCa9Vcwqpy6JWpa1YxYHGQGbPSSQnQTg/
pqF2N+VmcsxdMjKyInQz4CFYOswPgqxLUSnnAYltNO11tWuJxBUoFDVWJF4zB8vITWiF4ERKBl8s
dFB3O8yARVvwU+hEsKz1Ga1ke8vkhb1rU7mDMgdjq6DgGUbq5PeyCy9HOek4VZH0JH2Lsda1A2TQ
rbHjJnsmEKHsPZYVlDKdxqxs0EMTWAytgi25UsyUy4OOJ9nMK+6NkoTBWOl5mDWe9gxKEMZyvX6g
qz5AePvjjb2srWgPAog6pNBgmL8neZvRnNV39lrfHoymWi5WQkU3VEmuGgDhReEPWm6gQlQh8JB2
EI7Pno7av30zEysHIAZESpQmNEvx5FMEiIn4eVFOnSqYAONnEnJalgeo7yXrJukCcMFW204Pawjw
kIm0AT11QOYj23Ap/KF8pkJlvhs7K564so+R6lPwKRVP9WuTUU/MjER7nFQfjbxqe1SaViFqIwE2
eLfIDAq8thRshHLypA/J15ZzCUx8Poc3YMq1e4Jphij4mHi5g2M7KTqO+SBBteOd+sq0UwNjeP9x
HFCqR6sy4HXfXYAQKCNBVq2nmyh74m2Gmx4is2zNjIU0xnoV0VR/PDYVcqN3ZNB5wWoNxoSAHMQH
kb4zLUiM7L9Zk+0Beo3hqoJ16e6tR4mC1J2YLuih+ghjY2TkG/R/rndnGTR8nFtusizBRgzHAvPv
jm9E6FWJBCURp1lcPHOMFoWwIBp23ODe0Zm0KuL+dQn4snPQ+jBTP7nN0KVwKX1a58+ueAkptvOC
HKlLIYYrPZn6/9weWENxIt3ElzAVxVnIhyRNbBE6wftcAWQ993iAhnjZ6WrbtV3EcouD4ofrNe9L
lkiFEy4vppP3kt1X6fWspw9FgBT7DtbSFDQ33fApZVCAIv3yCUouLhl95alcNxXxxwc7S2JueJns
GR/oB1k77/t7mh9kLuasklaprPa9iA5Kln+vZsl4pQv/pCsPjCmd+nKSqCKhLi0I68fJ+OLMZmHL
BpBXsnSVuZbqNjMAtMu8jTHlhLkrVgpGZY9OpnskalHPousa64qC8gY99p9pWkmwikezT+uBlQ41
KhbtuOpVne2fBmoevKA27vHMVKt9nCtordRCjgcMRRGgd8w0xeneFEqvZ3FE8VXAxEG1m6+BFI9Y
aNet1AcKkQVCQk9ZFYhHHzv16hNzMA0iRfrDF9pQnSMunlhZ7os0AVFVccYG744g5YOE+NiLywpu
ivTJxp4zClQYH5NzThkxCFsAqGvcqF8lpxGWlX1bg/F78pDz9UWfpQ8aQ/dncYHvNT5KGPcutprW
21HLEETOIgFcvTgjrDU59uiKlkr26M9CO62kFoQMHG+8i9JEkL/NFbvb/r08QTjnc5mSNbgA3/ps
SufKCbNQpW5PWI97yEai4hEHXSaPF0PxIjvMer6LQvMOA+NyYZNTSx4DbRhFpIHoVQ+F9xDazaBz
scNLrDXC1PsPlA0xlNnTIYIe/uOeABBPQKJ1NcK+NaYsnGuJg/YHLeNi7sYBs5mlgrpqwi917jPD
9TDK4JnFi4WakmrtbHi9eiAoXb5eWSdYG+rMgfBd6YxCCPZ9YFOeAsmuflOnieUYLaiDIbfSRlTq
HywauvmAs/Lo+tKpJbodYVQf0kqxH5vfO10tSBv855E7EBAknqI/DjVvfcckCEW6o9PJhzweP0ab
1VXixkVgf4DjanAWZtIwy8J6RVKrZRaLNgrRN8yXxZxJBVefW8bncgi/UZ83gGy+lAFHtXXeg51Y
YmjiJ/12tdKAfqs+qjhIqOSgtMDH1ImXy2eUpY5UFglbyECtPGgMkkWc2aFVkQ5kGJd1qEEzndKe
gWYmrF/N4CScK31Kw1cnyvw09tosoaQxbj7+8U0/e+1Y7tuD4gjF0xH/PDih3ICX7znSfeYcYHV3
qdcjjgA4jZiEzJu9cJCg1DMC6m4yH/shFfhhNIAGTBptj6sQbcslYjJuedneAu03OsEuiPv9M5Zo
cHfw9caSSDebk0Sk9fQJGgId2zOFaEVgndOgxyaY6TiUw1VbNST/SMOgbTjHcB13Jy2y0RXzzS79
S3sh1jkyVYiXiseYByiny3kRiZKpXQEzN1HIJjkPLppM9N70JLIykUIuunkpcSPmicUHz3KvaPDL
m3Z4sSDuHvFfcaVaHvYdkX21bzTpz/QL0ArWetUD/VAEJp0/Ray0D7WLRpektEowCS6rxsSCUsIm
VBK6JQuPdUVt9r0xVukXmLIRaGCIXHPdS+m54IVYvCjKAwER2YX/Wr8dscJ3hyEANAKrvO5rVX6o
Er3Oyan+oT2somgd6FRrqd8GFZR/iPzeKj5JIsL/OqMokB+7s35dx5lqtYBb88Cu79JRYoc8Z4Yh
uuvYQcmY30xWk+g9Q5NZg5GQ+kyNESszdFw6jqzrOPnXG7vDeZToWiw8iHe3DWj3LWYldwNMI+CP
lmRV1ve2dN7cNsPYKwtLRkG3vVN/vCya2+z0dY72OaO5bZiiQ+xxe39kEBuRtvpTGGvzvtzcSB9M
W6z906TwLFT9TEOm0znR8NPlXm2UbNzI5KgTzkqGGznU3H5Rc9HHHdbEY5Jf5A1gSohR51Jo+FPm
SkzJxjvzgoETDwFqKwCNyFdK/bqERe3b2TLJpS8Sq9jK0l7O5khrsCuUZtCzamg+CqK8CUgzAXe8
jWSf2zPC93sAfzERtQmKJ3X/0nJMId2gd5SbdE6H1ktKLe0A4znCNSU6g3b9e2oenZeFc36QoQo7
3ywPFzwfzZukzLDaakX3eunFOyo1feKz8erAUwYyWlUks0aNDb9vKDI5qx49Iq/ENk/vV6rTROhs
ciMUeJatrmCNWjmXXd6JTPaiIULDbRzCm3SiMElS6YMxei0N1X8o7SLj7LTwXDQ4FS7TXN3VT8wL
s0u2BEJvhRvRKs2hRGU2lgDbScgRPOuMQHOGbpkInQIe6q2+l2X5j9rVxSp9VIqv4h1Z18m5clNZ
xo7YIto9pjrH3tEZpu/vj2573fK377DvXsKoE0urJpb2MP3hsjq4XHll/SzZhS5u+a6W+wbueD9k
/4BFv6SlWajrLgPtjyKbLP+EOGad6kSVmyogPI4BPASDAwksMvH07DquZxTiqF+O8DFeznbOaN2p
RgnDuiQLuzNFVNjYwH1hNirh6Q3KJ3EkwG6QQ4dO77MpjyTDqaFtFDHUkMk7/5GNCP7TRz9sDq1H
SBBLqNem74IVazv/brC3FfbVICt2ECLJ6C5tmpE3EQ9LktuGz4icrgx8JI37G01kgo8+VD2XL4dz
TYUHCYbTchGSVXch1oPKTcmk1k9gmgQ9jX3vOKcoJfVmeHc8N5Ryuqo8BOfnYBWWEXaKB3APpS6k
IbpCKcFSrxYFsrO5bhcbn3eQBcF9gj8ny1IjlaY0MSvkROc/qyy+Okh/wDrM9OsNbzmxuOVV6CQ9
qehtcKSsiUPIOI/zc2ac6UbUwiEYfhFlNq9wSi62KQrK6Y83Agv3a77Z+m+r09HKN9DvjlKbd1kr
pg1DokSFs122iyM4OtN5eXWYq3Ar3cDIoZUImeNhd90k7ojvnA1QhMWT/QS6yIM6Z4574h7053sp
6EEQ/qR6xlTTumil5eKrRXbteEuDkLFRCbA7DxiGhVRp5q4I6WpK0V4GRSy8Tw4fPSyQgVrluA6h
OMYO0BUUTdLsbUbM4sI6kdjNfDPQd8voBYp46FFb1vTJn0WiehLLs+C8eVJNCQvsCtSnwn0Qz3TH
IstxRJMT3i1Cd1eEF8X+YaBAyNlNQDgmXGpNvmA65t0YLF8QS0TM+bqowIEVVmxTU5qQPTCsY1uI
cFNXrkWysKN33Ot37Kdvje56VmQhAJe09Xd1J7T8S5UJmnwBPA2UOqwY6HkQDqVLEe18vWQ4Os1+
BPp+Mp/mBRZbEGUloC3PElkAzdPXBpqo4v8tjWRH8/wH3qBRgidhhaewpqmuAl1WdsHn9cczRq8O
bdyGb8rfizKCcPdgMQib6Ed/q4eXAGjHAQYKlXu6SHhOsLpYUjnpHhEgE2b1yDGx8vtjyZv5f0kV
6v/qXYY0bpOxzTrH6iy8gZkLHZHQ+o43zHC5812yT2fNj+p+ZtqU5QUT8PBsMrbqzQZ7XzeW8T2x
z7qsLp8wCE6QNucgJ0tL28tKsyBaVOZU5qJe93HdnfGJgjqeqFS3kuc7NXLFwqi8xP0M8nxaaFZM
bcrni1IKUVQlNdVy3vLibRsa1IHY94gPB+12Mb0akJeRVLG6r8p3fR/v6wzu4OihR78NvEogCcWc
wsR72qyuSZ2LlOkW+oXNFzLqgY33Jhvs9tuOtFaSgJoTV4j6JWOoqlUSMFWvzShA8je++YWhbuKf
Jh7xlbKWVhl01bHtzacA9BtNVlBVM31eRN96yLA+K4iEDhS4vDGOC8KGek3k1oSV2VNoZ93G+NdK
meEnRAijfrW4PD5aPMzK7NqVGrGVO62DZGlRKzEYyKNyGli9h0r3ffDGlwR/J+DtRqW8hihbu/Ti
Za6JB3YAIjGn1FnJuTFvVa2zSdvWEnrv8P4ZXg3F1vXyde+tdb00O9nfkB5kCj2++PwR1YRELAB2
cW5VeB2UHA6RZxhq3ps3HTXJdKTmq0OCTCoC6+M2+s5AWneIqlGJKa+dWH543q1/kthVhext+nOU
5CRoJKioCZLPq0vpL0w4mWRNbmd4McJO3beM0YBgpiueXGEiTeki2SumsMBofn2cMR7qyfLbjY86
JwCc0UwLNc5qr4o/CFXCUh5s8YljBGGLk6ZF02pRFEYkt9OqqdwjNVozRlV6CFuwuhxdj6ptu+SJ
7pVxWORkIgEC6OoYygQPsDQk7kGfP4ALrFxr8ip24Zpa08SY/aZuiX4raVUr0h7zR18qHzP/TADK
k46r8DM6R4xlHKJZFzOrmS+mgmoPgsEB7c6Ai5yqGsU4w8x1Hoe4OqPU6p0PxB+I/corcWlbYK/2
0R5JS6IokRPQiRoVuNmwK9rV8/IaDVldPNHgaAy3EU6gabaZxDLL1QDJUJjIoKKjT+N29jjWyCqc
mcXgeIHFIoBPm1ayChP46ijhnfB46M/0Zj+Fa9+jDhWvfvuKbHDyh36XBVMywRuZ1LmGaQTaaupP
UukSM5Q2NQYLlqG3oUhOnTZ+jcFxzMJnNMuvEuwDWqGaLa096hqHXtf9zIzPiGF+KpKtRiRghliF
NDY0msYc/nEX2nPzFvD3HJMQVqc+bIFwE75xruWWxwnzRdPNWnsJaSAOl7pJDiY0orNAl1FQAtHY
up2Nyqk5xPIjtV8PuDnl3fTqPxCXedrrVtgnC1f2h1cy0jgGAXstY7yrtYALMB80SYYQF6sRjkCo
sMeDVEFrAKjNXYedI1KE/7VI2e1Nj00DiOL83iJcVosX0QhXsbH62NJ4e9f9XiEcdeo2JoNtVe5j
qSfbAhTmgtPvwH/038h2SmVuGw679aMU/NGcKW9VtSxvlmwPzqVz9eMvNoOR1gfKj6F4hv4o/t6Z
pvV3KvO8epjt9LREgLt8uPMGawleXuBgCL27vLNtITGJ+uk5M9K0xa/ZX/JK1kFu0ny/FR0xcb3u
wK6nVZR5wJmnjVLAyRqz8zk0vhXmWEttlJiPRTFlVkMb7sxzOaWYPoq36lL4r/VvV46yEYJdzTpY
Vi8chjBT+bDaCJry480=
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
