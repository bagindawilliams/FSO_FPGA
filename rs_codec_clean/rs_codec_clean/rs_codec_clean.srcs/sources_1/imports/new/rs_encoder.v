`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 09:45:54 AM
// Design Name: 
// Module Name: rs_encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Implementasi Reed-Solomon Encoder RS(255, 239))
//              menggunakan arsitektur Linear Feedback Shift Register (LFSR).
// Dependencies: Membutuhkan modul 'multiplier' untuk perkalian Galois Field.
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Deklarasi modul dengan parameter max = 254 (total panjang blok data = 255 byte, dari 0 hingga 254)
module rs_encoder #( parameter max = 254 )(
    input           sys_clk,    // Clock sistem
    input           rst_n,      // Reset aktif-rendah (aktif saat 0)
    input           de,         // Data Enable: penanda bahwa data input valid dan proses dimulai
    input   [7:0]   data_in,    // Data masukan 8-bit (1 byte / simbol)
    output          valid,      // Sinyal penanda bahwa data_out saat ini valid
    output  [7:0]   data_out    // Data keluaran 8-bit (berisi pesan asli + bit paritas)
);

// Variabel untuk menghitung posisi byte di dalam satu blok data
reg [7:0]   count   = 8'b0;

// Definisi state untuk Finite State Machine (FSM) menggunakan One-Hot Encoding
localparam  IDLE    = 4'h1,     // Kondisi diam, menunggu sinyal de
            ACTIVE  = 4'h2,     // Kondisi membaca data payload dan menghitung paritas
            FLUSH   = 4'h4,     // Kondisi mengeluarkan (flush) bit paritas ke output
            END     = 4'h8;     // Kondisi selesai satu blok
            
reg [3:0]   state, next_state;  // Register state saat ini dan state berikutnya

reg [7:0]   data_d0;            // Register delay 1 clock untuk data_in
reg [7:0]   Q [0:15];           // Array 16 register 8-bit (menyimpan sisa bagi/paritas)
wire [7:0]  D [0:15];           // Wire masukan untuk array register Q
wire [7:0]  R [0:15];           // Hasil perkalian dari Galois Field Multiplier
wire [7:0]  C0, C1;             // Sinyal umpan balik (feedback) untuk LFSR

// Blok logika sekuensial untuk pembaruan state FSM
always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state; // Jika reset, kembali ke IDLE

// Blok logika sekuensial untuk penghitung (counter) byte
always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 8'b0; // Reset counter
    else if (state == ACTIVE || state == FLUSH)
        count   <= count + 1'b1; // Tambah counter saat proses aktif atau flush
    else
        count   <= 8'b0; // Kembalikan ke 0 di luar kondisi di atas
end

// Blok logika kombinasional untuk transisi state FSM
always @(*) begin
    case (state)
        IDLE:           begin
                            if (de) // Jika Data Enable aktif, mulai proses
                                next_state  <= ACTIVE;
                            else
                                next_state  <= IDLE;
                        end
        ACTIVE:         begin
                            // Proses 239 byte data (0 sampai max - 16)
                            if (count < max - 16)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= FLUSH; // Setelah payload habis, pindah ke flush
                        end
        FLUSH:          begin
                            // Proses 16 byte paritas (max - 15 sampai max)
                            if (count < max)
                                next_state  <= FLUSH;
                            else
                                next_state  <= END; // Setelah 16 paritas keluar, blok selesai
                        end
        END:            next_state  <= IDLE; // Kembali menunggu blok berikutnya
        default:        next_state  <= IDLE; // Pengaman (Failsafe)
    endcase
end

// Register delay untuk sinkronisasi data_in dengan perhitungan di dalam LFSR
always @(posedge sys_clk)
    data_d0     <= (~rst_n) ? 8'b0 : data_in;

// Blok logika sekuensial untuk memori LFSR (16 buah register paritas)
integer i;
always @(posedge sys_clk) begin
    if (~rst_n)
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= 8'b0; // Reset semua register LFSR
    else if (state == ACTIVE || state == FLUSH)
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= D[i]; // Geser/masukkan data hasil hitungan baru ke register
    else
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= 8'b0; // Bersihkan LFSR saat IDLE/END untuk persiapan blok baru
end

// Blok koneksi logika penggeseran (Shift) dan operasi XOR antar register
// Ini mewakili pembagian polinomial: Q_next = R_feedback ^ Q_prev
assign  D[0]    = R[0];
assign  D[1]    = R[1]  ^ Q[0];
assign  D[2]    = R[2]  ^ Q[1];
assign  D[3]    = R[3]  ^ Q[2];
assign  D[4]    = R[4]  ^ Q[3];
assign  D[5]    = R[5]  ^ Q[4];
assign  D[6]    = R[6]  ^ Q[5];
assign  D[7]    = R[7]  ^ Q[6];
assign  D[8]    = R[8]  ^ Q[7];
assign  D[9]    = R[9]  ^ Q[8];
assign  D[10]   = R[10] ^ Q[9];
assign  D[11]   = R[11] ^ Q[10];
assign  D[12]   = R[12] ^ Q[11];
assign  D[13]   = R[13] ^ Q[12];
assign  D[14]   = R[14] ^ Q[13];
assign  D[15]   = R[15] ^ Q[14];

// Logika umpan balik (Feedback) LFSR
// C0 adalah operasi XOR antara register paling ujung dengan data masukan saat ini
assign  C0  = Q[15] ^ data_d0;

// C1 adalah kontrol feedback:
// Saat ACTIVE, feedback diizinkan masuk ke Multiplier (C0).
// Saat FLUSH, feedback dinonaktifkan (diberi nilai 0) agar paritas bisa didorong keluar secara berurutan.
assign  C1  = (state == FLUSH) ? 8'b0 : C0;

// Sinyal output valid akan bernilai 1 selama proses encoding (payload) dan flush (paritas)
assign  valid       = (state == ACTIVE || state == FLUSH);

// Logika pemilihan output (Systematic Encoder)
// Saat FLUSH, outputkan bit paritas yang ada di register terujung (C0 identik dengan Q[15] karena data_d0 = 0 saat flush).
// Saat ACTIVE, lewatkan data aslinya (data_d0).
assign  data_out    = (state == FLUSH) ? C0 : data_d0;

// Instansiasi 16 modul Multiplier Galois Field (GF)
// Mengalikan sinyal feedback (C1) dengan koefisien generator polinomial Reed-Solomon.
// Nilai hex (contoh: 8'h3b) adalah konstanta spesifik untuk standar RS(255, 239).
multiplier gf_0     (8'h3b, C1, R[0]);
multiplier gf_1     (8'h24, C1, R[1]);
multiplier gf_2     (8'h32, C1, R[2]);
multiplier gf_3     (8'h62, C1, R[3]);
multiplier gf_4     (8'he5, C1, R[4]);
multiplier gf_5     (8'h29, C1, R[5]);
multiplier gf_6     (8'h41, C1, R[6]);
multiplier gf_7     (8'ha3, C1, R[7]);
multiplier gf_8     (8'h08, C1, R[8]);
multiplier gf_9     (8'h1e, C1, R[9]);
multiplier gf_a     (8'hd1, C1, R[10]);
multiplier gf_b     (8'h44, C1, R[11]);
multiplier gf_c     (8'hbd, C1, R[12]);
multiplier gf_d     (8'h68, C1, R[13]);
multiplier gf_e     (8'h0d, C1, R[14]);
multiplier gf_f     (8'h3b, C1, R[15]);

endmodule

