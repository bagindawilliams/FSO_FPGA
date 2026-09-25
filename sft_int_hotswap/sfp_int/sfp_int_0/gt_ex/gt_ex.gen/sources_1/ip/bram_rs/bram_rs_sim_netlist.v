// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:29:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top bram_rs -prefix
//               bram_rs_ bram_rs_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23120)
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
