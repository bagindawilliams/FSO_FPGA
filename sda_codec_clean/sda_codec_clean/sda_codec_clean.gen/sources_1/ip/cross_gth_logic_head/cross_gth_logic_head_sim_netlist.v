// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:11:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FSO
//               FPGA/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_sim_netlist.v}
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic_head
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
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
  (* C_COMMON_CLOCK = "0" *) 
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
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
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
  cross_gth_logic_head_fifo_generator_v13_2_14 U0
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53248)
`pragma protect data_block
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
3wseXxMvcBSmOA==
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
