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
Y55t0atu4noAxeQq1po=
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
