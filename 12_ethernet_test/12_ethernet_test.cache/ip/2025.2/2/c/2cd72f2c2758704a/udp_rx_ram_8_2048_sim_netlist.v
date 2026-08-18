// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri Apr 17 22:29:41 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ udp_rx_ram_8_2048_sim_netlist.v
// Design      : udp_rx_ram_8_2048
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "udp_rx_ram_8_2048,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20384)
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
