`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kookmin University / ETRI Daejon
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: top_rx
// Project Name: ETRI FSO Channel Coding
// Target Devices: xcku060-ffva1156-2-i
// Tool Versions: Vivado 2022.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 1
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Ini adalah "Cangkang" khusus untuk Receiver (Penerima) tingkat lanjut.
// Modul ini rencananya akan dipanggil di dalam top.v (menggantikan rs_decoder tunggal).
module top_rx (
    input           sys_clk,
    input           rst_n,
    input           de,
    input   [7:0]   data_in,
    output          valid,
    output  [7:0]   data_out
);

// 1. REGISTER INPUT (PENAHAN DATA AWAL)
// Menyimpan data_in sementara ke dalam flip-flop data_d0 agar sinyal stabil.


reg [7:0]   data_d0;
always @(posedge sys_clk)
    data_d0     <= (~rst_n) ? 8'b0 : data_in;



// 2. BLOK MEMORI (PENGGANTI FIFO)
// Memanggil IP bram_rs yang kita buat. 

bram_rs bram_rs_inst (
    .addra          (addra)         // Port Alamat Tulis (Address A)
    ,.clka          (sys_clk)
    ,.dina          (data_d0)       // Data masuk
    ,.ena           (ena)           // Sinyal Buka Pintu A
    ,.wea           (1'b1)          // Write Enable selalu aktif
    ,.addrb         (addrb)         // Port Alamat Baca (Address B)
    ,.clkb          (sys_clk)
    ,.doutb         (data_delay)    // Data keluar
    ,.enb           (enb)           // Sinyal Buka Pintu B
);

rs_decoder channel_A (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            ()
    ,.data_in       ()
    ,.valid         ()
    ,.data_out      ()
);

rs_decoder channel_B (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            ()
    ,.data_in       ()
    ,.valid         ()
    ,.data_out      ()
);


// 3. PEMROSESAN PARALEL (3 CHANNEL DEKODER)
rs_decoder channel_C (
    .sys_clk        (sys_clk)
    ,.rst_n         (rst_n)
    ,.de            ()
    ,.data_in       ()
    ,.valid         ()
    ,.data_out      ()
);










endmodule