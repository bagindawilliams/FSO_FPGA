// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:58 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/serdes_assembler/serdes_assembler_sim_netlist.v}
// Design      : serdes_assembler
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_assembler,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
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
  serdes_assembler_fifo_generator_v13_2_7 U0
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uS/dIpDTldS7400uyLsI6bJxO+WmZJrKXsU8qB+wpyI+d4PWZVO6Cm0qMQFNUZb63p6zCI5fvnQy
SxjaSP1nCte/oQZc55w1rQbTqy54T9kryRoH26nDjSBVZvJ8hffw7NONwiKrqeB6I7HJKX5RKw73
wIJxNNH7BCiCEtRLIxc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L7q2sHnC0pU7uHs8shPm9nAcqyU+hUFnNkd6BPHl+ureEVBUvubWhEbLRLiFFJveufcmAfAXTzae
tWbKcVVt/zKzWEtv0onUXoSEgyS4+QaTAFeCPHR2bbnlP0aCCG2SYmC1dv16cFoAk/NLitClNXAv
h+UBGzod+suWv55DaNHeHtSZ/YLZxHdn/R47atTiQM+A1TWQkpa3faF/L9ANZISSe/OR6mPfQ/Zk
4AptHNmW/pWpd3JL4e06iK9P6ZLLRqSMR9mu6AFIeWYBVz+KkxgSIWgQO7/AHBUFjlIiMFhyQR5Y
UC1fo4CPZX7fMdUPwQiC+eZ7UtxMAUzovIzwEw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KZhqqPnSEvcItoYRHrFT/Wt2IEXHe7pq5lmAOfYqAaaoY8mpIG3Kd8B/C4s9kNUbktSOX78NnnrJ
brxcu/1EAlI9itnDH8ahxble+2Nt/Lj3dQ1/wbDy3HOKlwBVuOvVDArOpgho+BAnoLUZXrpsw8EI
FSIPKmsETVzLzZDw6m0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WZbb0PsQl1vn7dY/rZzI8ZGsAP5Ad4C/d2cBXS49yTbQqKMTY7r1YHlrjBGteY6wrhKVmM92u/3/
/UJWPyNVqwcsrRAHhR/Lp3Mg87NIhYzETdNAOpnc7rWC9ieIeEiyPM734sI7QtAMVrZxXoUXnCjp
fjQhaMqv+HsuEWpFhDail+v8Ftwmr5xP1JSpqPfxLz5a6+q8/lTxRGeWZokM7vP2YFKg7L7Yoowh
gOm5w3JhR2fXZsksWxfQk7885JzsI4yZOrU8dY667YWWhkjZE/SKo2TMksiasL22T6CpyUbMwQm2
DJ+cMJbr9/8csBEifIsopc4V9zFbSU9eoxlqZA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Adid/GOKDljgmM7UpkmD6EVL+5rt6bnWK9P8RIZiI3EkLW96rM6eCs7jkLeKnEW/WPGRhlZrGw8p
C7Ni27oibJKJT5xUBJDymbO+yheaaTI0GaeDMIzks860gYA3qdvTPxTBotaOg6MIpnYd070NhTod
Qq5XNnxLuF7/s5rAZANJHyRQKwu4gVBfs5SU2FSjF546M5FvN7BX6G7B76ALW6vKqGyKxwoHkc52
Bm8/jGTxJ6zbwn2v31NEfjO6nM5m6yYwY0476QLXWI6+7/ILkSvDVTt7B9HpcaRg3n3T4AEQDMyX
8bBPgm0qFbWZue0dlr9ljYOl0dgwaO8G9uYe9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tq2b3cw7fnIOEbRUxnQIgAjXwRE3aRwj2IBVmS0S998fvCLPMUtm5MVXAqk0TwuEzKG3br/oRham
Oe5KAx6FauTTVpRhLH5RY3832M9OVTSW/bNq12/dXnJyOfYS76FQtd9HNFrSkVPMONGMD0ZQXRic
Yr0MaeflUHQmU6QUCt5OJkbG4F8qJLMWJsg03K7dNzDfkvev3QVf72bmHTm4SF6/cs94NXQl/NPr
CzQorTZ5BgCzVAui7mM0eu3mu6OPkecNQ3Ih+1zsJuGkAHWC7aFgh7ii6xEj1upD365TzJUF1ZCe
0jZj/Ub1m5OgZMbjbLYn/Fh5nqi+fAmL7jDAHQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S+EkimFGNL3D/SKyjUVYhIZzRbEoTqlnv2kHD0e4rYYCt/O4IYecNmch6HRfd2U/WSZPkAoJ+xa7
GKQSo51PL81HSvqURo2CxltObyTYiklnzGtbdWUMpOSCjDe8LpQjUNwhSksWjZjUQypyYXS4hbCR
VJy96ow8zi5m1XMzoLaVMDYoJYLtOVh7eaL7InaIL5gXJIHWkhoKYh9bR/O5HE6YTsgZl+Ofmx/3
0mQ/bL5ZKSY6gBEUD8f5+SoMIjfXrGkjMj1+fEAIv0fO/wKyJQMKnDOgWMvcUw56dOJ7FWkbNvbC
kzquuXhk5LuzZfXWmhyDSyMGBWK1wN7iyMKMUg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
LQ4hjhkD/G9XJd+gVR5WF2vSll/p8/psR+nHjJ5/DHrtiRqVWFVc7B7T9XZuJBmTqrQV4iSBYWDo
zNaVdq26mGk6TTNo11Dcici0hEwC2Bg66k9kr1if+0iZo3VtB/ZuEOj2w7euhFo3ja1OovnDXxf0
8t4WMUK68mfUiMuKgVcbOFhm3Jdnbnz4u7SggH2/rkfOS8jbon9q9n0EXlK23tz2NzDLCS8B7ERx
dYvwqwBiySKoP1/EcfSwFNIWpr6p7kbRo7iM/JbP6UwBbkDHgE8HGS+3lTXIUXsmGmsx6EDSr/gY
i7lHwZTmDuhuIEJaf6gTJgtqMSxVyDVsrnba5umKgV8z5OOWUkM3FjVWIXOG7Ef2iKFCzBPmp2Lk
8XbrXk/bb9H/jr4UR3hgdbizISTysLTJd4n5uyeDhDgkxAc+1FudacmuZyBlA/VTR1f0i9+cOgLI
kdqbo1u5hQwnMphluBKjdTA3nZ8VnpDbdq5R7hIF61tIrUfdjwQw02je

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JzhYMwmYowESMI19XNb+BEFcZw3IXZpwZO3gzrVg2CdSjbAR3tiIVbPHI5Rgu59SH7H8abU59Atd
+nrPiG37rmU6CD+cMV2mU8SHfCDLYsnrbd9YLZ1GEfqTovR0NZHQTHj+7c5dP7nqm30C/kg1adqd
DOV7F128PbmM5U45xRxOJKUgS/Waz0gvmYKKJejkiyFPOgGbN5f844mtysoOckLrAU/BzRs8SB9G
zzisK/a8hM5af8/opZ64TGhH44Npzy8kcP+gI+k+U0oF0SOqW7CjadKaJhr2oDkTScVVCbBqFEjc
2gH862vcCfZu5Cd0Sp2ALgoqVxA+91lAIHJp3Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ooNS+XjsaWLRgvcrNWVpR3ihKtIJNT1oT4D5ivD5mCfw+4/SAyx9P4cmdvOotLNPE1eqvx1Smd9Q
LDImL/GqS7Cq3KEUtEBbvQAOp+0SjiW74cC6nyOqCA8NQcn5JM+vUzGSsORPnM5qP96axGmyEvSi
p3uL9Gmx+3S3KUJuAzfuqZwJD7gdcA0Zv3hPRl+xhx8qFtkPCfT5uj7wpFVaaJ8tTl1SDd2uRUIx
rgVgV+oERCg71oEVN7PqPK1y7pFVgSW9uhP1wuvO/EsbyrLYZV6HtBn3tJDcxhTsQWrrou3F1kFQ
cFnl9tcL1wXJo/F3wvsbYM1W0UPHv69XAsEUhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d8YRbu+fllaHlNDedyRNDRtn9CBoVbO9fZCdhKpy0yf9dL6A08sFZuWVtVGljxF/L9volGB0IRjl
KbH2N/JBQA+tZWuh75kK5pjveAAKLVACS8A+Jmt/mrxzlolPWsruJ8o1Owrjq5tGWspdqmeDGS7U
/Ww7cN0C9ExUj4cjRDcKaqDS9MGwRtx4LfcQbQbRDZBk+cyRaWCchvmhjoum4uTizvqMq2u4oSym
t2zyKFjAuMO4zC2LbPbODeumm+FhlOKAHRyEBKA+VQeLB4apkMYparuD5AFWAuVvdWEbGq/L4cJ7
pEGz+6Hqi68CfF/4tMNiyHveP1lxnyAaiW6Kjg==

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
