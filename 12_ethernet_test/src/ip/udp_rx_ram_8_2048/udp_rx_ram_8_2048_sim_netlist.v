// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri Apr 17 22:29:42 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/yrzal0/_FPGA/12_ethernet_test/src/ip/udp_rx_ram_8_2048/udp_rx_ram_8_2048_sim_netlist.v
// Design      : udp_rx_ram_8_2048
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "udp_rx_ram_8_2048,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module udp_rx_ram_8_2048
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [7:0]dina;
  wire [7:0]doutb;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7927 mW" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "udp_rx_ram_8_2048.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  udp_rx_ram_8_2048_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20400)
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
