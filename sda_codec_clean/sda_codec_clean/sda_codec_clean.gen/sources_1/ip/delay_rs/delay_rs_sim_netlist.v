// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/delay_rs/delay_rs_sim_netlist.v}
// Design      : delay_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_rs,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module delay_rs
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
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
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  delay_rs_fifo_generator_v13_2_7 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52544)
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
