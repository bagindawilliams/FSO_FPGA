// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:53 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ delay_rs_sim_netlist.v
// Design      : delay_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_rs,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52672)
`pragma protect data_block
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
DXlC3A==
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
