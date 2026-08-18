// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Aug  5 22:48:59 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bram_rs_sim_netlist.v
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
        .regcea(1'b0),
        .regceb(1'b0),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23440)
`pragma protect data_block
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
wzOP719svLTzsAtgwA==
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
