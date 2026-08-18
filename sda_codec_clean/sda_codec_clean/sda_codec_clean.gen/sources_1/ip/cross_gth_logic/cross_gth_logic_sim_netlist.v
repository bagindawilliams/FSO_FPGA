// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:57 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_gth_logic/cross_gth_logic_sim_netlist.v}
// Design      : cross_gth_logic
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [127:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [127:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
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
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "11" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "128" *) 
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
  (* C_PRIM_FIFO_TYPE = "2kx18" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2046" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2045" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  cross_gth_logic_fifo_generator_v13_2_7 U0
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
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
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
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69792)
`pragma protect data_block
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
47nn4YHHW3KDukh9g7YIpFduXVcrY013
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
