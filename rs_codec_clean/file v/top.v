`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kookmin University / ETRI Daejon
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: top
// Project Name: ETRI FSO Channel Coding
// Target Devices: Kintex Ultrascale KCU60
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


// ==========================================
    // 1. PIN FISIK (HARDWARE I/O)
    // ==========================================
// Deklarasi modul utama (top level) yang menjadi antarmuka ke pin hardware FPGA
module top (
    input       sys_clk_p,  // Input pin clock diferensial jalur positif (misal: 200MHz/300MHz dari oscillator board)
    input       sys_clk_n,  // Input pin clock diferensial jalur negatif (pasangan dari sys_clk_p)
    output      fan         // Output pin fisik untuk mengontrol kipas pendingin pada board FPGA
);



// ==========================================
// 2. KONTROL DASAR (RESET & KIPAS)
// ==========================================


// Menghubungkan pin kipas secara permanen ke logika LOW (0 Volt / mati)
assign  fan     = 1'b0;     //Mematikan kontrol kipas (atau diset nilai default rendah)

// Deklarasi kabel sinyal internal untuk reset sistem (aktif-rendah / active-low)
wire    rst_n;

// Menghubungkan sinyal reset secara permanen ke logika HIGH (sistem selalu berjalan tanpa reset fisik)
assign  rst_n   = 1'b1;     //Reset aktif-rendah (active-low reset) dibuat konstan 1 (tidak ada reset eksternal, sistem selalu berjalan).



// ==========================================
// 3. DEKLARASI KABEL (WIRES)
// ==========================================
// Deklarasi jalur kabel clock internal
wire    sys_clk_in,        // Sinyal clock setelah dikonversi dari diferensial menjadi single-ended
        sys_clk;           // Sinyal clock utama hasil olahan IP Clocking Wizard yang didistribusikan ke modul lain

// Directive Vivado synthesis: Mencegah compiler menghapus sinyal-sinyal kendali (control flag) 
// di bawah ini agar bisa dipantau secara real-time menggunakan Vivado Logic Analyzer (ILA)
(*mark_debug = "true" *)    // memerintahkan Vivado agar sinyal-sinyal ini tidak dihilangkan saat sintesis, sehingga bisa dipantau secara real-time di FPGA fisik menggunakan Vivado ILA (Integrated Logic Analyzer).
wire    en,                 // Sinyal pemantik/enable utama dari modul autorun untuk mengaktifkan aliran data
        stream_dv,          // Sinyal penanda data valid (Data Valid) yang dikeluarkan oleh generator data
        encoder_dv,         // Sinyal penanda data valid setelah diproses dan ditambah paritas oleh RS Encoder
        fso_dv,             // Sinyal penanda data valid setelah diberi simulasi error pada kanal FSO
        valid;              // Sinyal penanda data valid akhir setelah berhasil dikoreksi oleh RS Decoder

// Directive Vivado synthesis: Mencegah compiler merangkum/menghapus bus data 8-bit berikut
// agar dapat di-debug nilainya secara langsung pada chip FPGA
(*mark_debug = "true" *)    
wire [7:0]  stream_data,    // Bus data 8-bit (1 byte) asli yang dihasilkan oleh generator data
            encoder_data,   // Bus data 8-bit hasil penyandian RS (data asli + byte paritas RS)
            fso_data,       // Bus data 8-bit yang telah terinjeksi error (mensimulasikan data rusak di udara) 
            data_out;       // Bus data 8-bit hasil pemulihan/koreksi akhir dari RS Decoder




// ==========================================
// 4. PENGELOLA DETAK JANTUNG (CLOCKING)
// ==========================================
// Komponen bawaan untuk menyatukan detak diferensial (P dan N) menjadi detak tunggal


// Instansiasi IP Primitive Xilinx (IBUFGDS): Converted Differential Input Buffer
// Mengubah sinyal clock diferensial (sys_clk_p & sys_clk_n) dari pin luar menjadi 1 sinyal clock internal
IBUFGDS sys_clk_inst (
    .O      (sys_clk_in)    // Output: Sinyal clock single-ended internal
    ,.I     (sys_clk_p)     // Input: Pin fisik clock positif
    ,.IB    (sys_clk_n)     // Input: Pin fisik clock negatif  
);

// Instansiasi IP Core Vivado Clocking Wizard (PLL/MMCM)
// Mengatur ulang frekuensi/fasa sinyal clock sesuai kebutuhan sistem internal
clk_wiz_0 clk_wiz_inst (    
    .clk_in1        (sys_clk_in) // Input: Clock masukan dari IBUFGDS
    ,.clk_out1      (sys_clk)   // Output: Clock utama yang sudah teregulasi untuk seluruh logika modul
);




// ==========================================
// 5. PIPA DATA UTAMA (PIPELINE)
// ==========================================



// Instansiasi Modul Autorun
// Berfungsi memberikan sinyal trigger otomatis untuk memulai transmisi data setelah startup FPGA
autorun autorun_inst (      //Menghasilkan sinyal pemicu/enable (en) otomatis setelah reset selesai.
    .sys_clk    (sys_clk)   // Input: Menggunakan clock utama sistem
    ,.rst_n     (rst_n)     // Input: Sinyal reset aktif-rendah
    ,.flag      (en)        // Output: Mengeluarkankan flag 'en' (enable) ke generator data
);


// Instansiasi Modul Stream Input (Generator Data Uji / Payload)
// Membangkitkan aliran byte data sintetis yang akan dikirim melalui sistem
stream_input stream_input_inst (    //Generator data uji (Payload Generator).
                                    //Output: Mengeluarkan byte data (stream_data, 8-bit) disertai sinyal validasi data (stream_dv / Data Valid).
    .sys_clk        (sys_clk)       // Input: Clock sinkronisasi
    ,.rst_n         (rst_n)         // Input: Sinyal reset
    ,.en            (en)            // Input: Sinyal pengaktif dari modul autorun
    ,.valid         (stream_dv)     // Output: Mengindikasikan stream_data sedang valid/siap
    ,.data_out      (stream_data)   // Output: Byte data asli berukuran 8-bit
);

// Instansiasi Modul Reed-Solomon Encoder
// Menambahkan byte redundansi (paritas) ke stream data asli untuk ketahanan terhadap kesalahan (error)
rs_encoder rs_encoder_inst (    //Menerima data asli (stream_data) dan menambahkan kode paritas (Redundancy/Parity Bytes) sesuai algoritma Reed-Solomon.
                                //Output: Menghasilkan data berformat RS codeword (encoder_data) dan sinyal validasi (encoder_dv).
    .sys_clk        (sys_clk)       // Input: Clock sinkronisasi
    ,.rst_n         (rst_n)         // Input: Sinyal reset
    ,.de            (stream_dv)     // Input: Data Enable (menerima indikator valid dari stream_input)
    ,.data_in       (stream_data)   // Input: Byte data asli yang akan disandikan
    ,.valid         (encoder_dv)    // Output: Sinyal validasi untuk data hasil encoding
    ,.data_out      (encoder_data)  // Output: Byte data terenkripsi RS (payload + paritas)
);

// Instansiasi Modul Error Injector (Simulasi Kanal FSO)
// Mensimulasikan noise/gangguan atmosfer pada transmisi optik dengan merusak sebagian bit data RS
error_inject error_inject_inst (    //Mensimulasikan gangguan sinyal pada media FSO (misal: scintillation, fog, atau attenuation) dengan merusak/mengubah beberapa bit data secara acak atau deterministik.
                                    //Output: Mengeluarkan data yang sudah diberi error (fso_data) dan validasi (fso_dv).
    .sys_clk        (sys_clk)       // Input: Clock sinkronisasi
    ,.rst_n         (rst_n)         // Input: Sinyal reset
    ,.de            (encoder_dv)    // Input: Menerima indikator valid dari RS Encoder
    ,.data_in       (encoder_data)  // Input: Data bersih dari RS Encoder
    ,.valid         (fso_dv)        // Output: Sinyal validasi data yang sudah terkena cacat/error
    ,.data_out      (fso_data)      // Output: Data 8-bit yang telah dirusak bit-nya (efek FSO)
);

// Instansiasi Modul Reed-Solomon Decoder
// Mendeteksi dan memperbaiki byte data yang rusak akibat gangguan kanal FSO
rs_decoder rs_decoder_inst (       //Mengolah fso_data yang cacat, mendeteksi lokasi error, lalu mengoreksinya menggunakan algoritma RS.
                                   //Output: Mengeluarkan data yang sudah berhasil dikoreksi (data_out) dan sinyal validasi (valid). Sinyal data_out idealnya sama persis dengan stream_data awal.
    .sys_clk        (sys_clk)      // Input: Clock sinkronisasi
    ,.rst_n         (rst_n)        // Input: Sinyal reset
    ,.de            (fso_dv)       // Input: Menerima indikator valid dari modul error_inject
    ,.data_in       (fso_data)     // Input: Data ber-error dari kanal FSO
    ,.valid         (valid)        // Output: Sinyal validasi data yang sudah berhasil dikoreksi
    ,.data_out      (data_out)     // Output: Data asli 8-bit yang telah dipulihkan (harusnya identik dengan stream_data)
);


//
//////////////////////////////////////////////////////////////////////////////////
//BLOK UJI COBA (DINONAKTIFKAN)//
// ==========================================
// Ini adalah modul Ping-Pong (top_rx.v)



// tops_rx tops_rx_inst (
//     .sys_clk        (sys_clk)
//     ,.rst_n         (rst_n)
//     ,.de            (fso_dv)
//     ,.data_in       (fso_data)
//     ,.valid         (valid)
//     ,.data_out      (data_out)
// );


//rs_encoder #(31) rs_enc_header_inst (
    // .sys_clk        (sys_clk)
    // ,.rst_n         (rst_n)
    // ,.de            (stream_dv)
    // ,.data_in       (stream_data)
    // ,.valid         (encoder_dv)
    // ,.data_out      (encoder_data)
//);

//rs_decoder #(31) rs_decoder_inst (
    // .sys_clk        (sys_clk)
    // ,.rst_n         (rst_n)
    // ,.de            (fso_dv)
    // ,.data_in       (fso_data)
    // ,.valid         (valid)
    // ,.data_out      (data_out)
//);





endmodule


