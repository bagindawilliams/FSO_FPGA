// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:09:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bram_rs_sim_netlist.v
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23488)
`pragma protect data_block
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
Cv7gSA==
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
