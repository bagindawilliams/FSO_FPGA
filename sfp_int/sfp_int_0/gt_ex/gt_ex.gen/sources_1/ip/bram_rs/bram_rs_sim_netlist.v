// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:29:11 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FSO
//               FPGA/sfp_int/sfp_int_0/gt_ex/gt_ex.gen/sources_1/ip/bram_rs/bram_rs_sim_netlist.v}
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module bram_rs
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.508931 mW" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "bram_rs.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bram_rs_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23392)
`pragma protect data_block
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
/xIhptArq/m4hnEroTOCzHwRJW6ExQ==
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
