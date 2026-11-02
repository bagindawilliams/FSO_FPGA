// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:55 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_combiner_sim_netlist.v
// Design      : delay_combiner
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_combiner,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
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
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4094" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4093" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_14 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54592)
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
