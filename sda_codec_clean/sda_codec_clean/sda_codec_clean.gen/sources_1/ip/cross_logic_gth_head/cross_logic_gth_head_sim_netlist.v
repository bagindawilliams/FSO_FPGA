// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:11:28 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FSO
//               FPGA/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_sim_netlist.v}
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_logic_gth_head
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
  cross_logic_gth_head_fifo_generator_v13_2_14 U0
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
rkia6nXYLB4Hdw==
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
