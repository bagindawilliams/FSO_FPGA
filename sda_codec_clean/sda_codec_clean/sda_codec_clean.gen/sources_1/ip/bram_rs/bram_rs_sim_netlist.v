// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:09:10 2026
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
