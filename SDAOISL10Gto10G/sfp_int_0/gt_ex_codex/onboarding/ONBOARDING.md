# Onboarding dan rencana audit — 1 November 2026

Tahap pertama selesai sebagai inventaris dan analisis statis. Tidak ada revisi RTL/TB/XCI/XDC/XPR, simulasi DUT, sintesis, implementasi atau pemrograman FPGA. Semua hasil fungsi berstatus **NEEDS_VERIFICATION / NOT_RUN**. Pemeriksaan pembukaan proyek read-only berhasil; bukan PASS desain.

## A. Baseline dan struktur

[FAKTA SUMBER] Workspace: `/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)`. AGENTS.md asli telah dibaca dan dipertahankan. Direktori ini bukan repository Git (`git rev-parse HEAD` exit 128).

| Artefak | SHA-256 |
|---|---|
| `gt_ex.xpr` | `230379480adfe7df53271f1a56ec795eda304b3d17320e9889dac6f89c6343be` |
| ZIP `gt_ex.srcs/Keseluruhan Codingan SDAOISL10Gto10G 31 Oct 2026 (12.55 pm).zip` | `7d67c455f6a9f8130cece7c3555369ea304d3725e9453a8cdf7e26b0550146a6` |
| Manifest snapshot workspace `current/baseline.sha256` | `f534eeb8ad9827c516e3274ff33a2b04a68c0e0114c07f1a76468ac0ea2dbd28` |

Manifest mencakup 1.410 file sebelum pemeriksaan Vivado, mengecualikan onboarding dan AGENTS.md; termasuk generated artifacts, sehingga bukan hash RTL saja. Inventaris sebelumnya berisi 1.411 file: perbedaan hanya `agent.md` yang kini tidak ada. Tidak dihapus dalam tahap ini. Hash file implementasi pada inventaris lama telah dicocokkan ulang. Inventaris lengkap: `evidence/inventory.json`, pasangan identik: `evidence/identical_files.json`, keanggotaan XPR diperiksa ulang di `current/project_sources.json`.

XPR utama: 155 entri sources_1, 2 constrs_1, 1 sim_1, 1 utils_1, seluruh path ada. Top sintesis `SDAOISL10Gto10G_top`; top simulasi tersimpan `tb_demux_decoder`; part `xcku060-ffva1156-2-i`; generic sources_1 kosong. Konfirmasi Vivado 2025.2: `current/inspect_project.log`.

| Area | Isi dan penggunaan |
|---|---|
| `gt_ex.srcs/sources_1/new` | RTL aplikasi, TB, encoder/decoder/RS; keaktifan ditentukan XPR dan hierarki |
| `gt_ex.srcs/sources_1/ip` | Deklarasi XCI yang dirujuk proyek |
| `gt_ex.srcs/constrs_1`, `imports` | Constraints dan contoh vendor; lihat daftar XPR, jangan memilih hanya dari nama |
| `File import` | Salinan/alternatif; banyak nama sama, tidak otomatis aktif atau identik |
| `gt_ex.gen`, `gt_ex.cache`, `gt_ex.ip_user_files`, `sda_codec_0.gen` | Produk generated IP, cache, script simulasi; bukan pengganti XCI/source |
| `gt_ex.runs`, `gt_ex.sim` | Hasil run historis; status lama bukan hasil tahap ini |
| `gt_ex.srcs/gt_ex.xpr` | XPR kedua; bukan proyek utama tahap ini |
| `Project_Doc`, arsip ZIP | 15 PDF, 17 ZIP pada snapshot; dokumen dan revisi dipisahkan |

Inventaris ekstensi: 502 `.v`, 16 `.sv`, 42 `.vhd`, 90 `.vhdl`, 79 `.xci`, 51 `.xdc`, 42 `.mem`, 11 `.tcl` (termasuk generated/duplikat). TB dapat terdaftar di sources_1; jangan membatasi pencarian pada sim_1.

[FAKTA SUMBER] ZIP memiliki 150 member file; sembilan member RTL berbeda dari padanan workspace: `ethernet_frame_reassembly.v`, `arq_rx_reorder_ddr4_wrapper.v`, `arq_rx_controller.v`, `deframer.v`, `arq_tx_controller.v`, `ethernet_fso_framer.v`, `sda_encoder.v`, `fso_idle_generator.v`, `fso_payload_top.v`. Diff tersedia di `evidence/archive_vs_workspace.diff`; jangan mencampur revisi untuk build. Identitas baseline kini adalah snapshot workspace, bukan label Rev 3.0.

## B. Source aktif dan jalur data

[FAKTA SUMBER] Hierarki kandidat leksikal memiliki 87 modul/IP/primitif terjangkau termasuk cabang generate alternatif. Detail parent–instance–module: `SOURCES.md` dan `evidence/hierarchy.json`. Ini bukan elaborasi: conditional generate, atribut disabled, dan primitive resolution perlu dikonfirmasi saat elaborasi. Daftar compile-order Vivado tersedia sebagai `ONBOARD_SOURCE` dalam log read-only. `project_sources.tsv` mempertahankan AutoDisabled/UserDisabled.

Default efektif secara statis: top `SIM_MODE=1`, `LOOPBACK_ARQ_DIRECT=1`; tidak ada generic override XPR. Generator internal → `xgmii_tx_encoder` → `eth_rx_front_end_top` (`xgmii_rx_parser`, `eth_preamble_remover`, `packaging_and_segmentation`) → `sda_encoder` → `gth64b66b_tx` → `fso_gth_core_wrapper` → `gth64b66b_rx` → `sda_decoder` → `eth_tx_back_end_top`.

Dalam encoder: `ethernet_fso_framer` (scheduler ARQ/header/payload DATA–IDLE–MGMT) → `x_gth_logic` CDC1 → `core_tx` (RS header dan 8 lane payload, FEC_MUX, scrambler, LPC) → `mux_gearbox_128` + preamble → `x_logic_gth` CDC2 → `error_inject`.

Dalam decoder: `rx_gth_logic` CDC3 → `core_rx` (preamble/demux, LPC decode, descrambler, FEC_Demux, RS) → `rx_logic_gth` CDC4 → `fso_ethernet_deframer` (CRC/header parser/ARQ/frame demux/reorder) → `ethernet_frame_reassembly` → backend (`eth_mac_packing_tx`, `xgmii_tx_formatter`). IDLE dibuang dan MGMT diekstrak pada demux; tidak menjadi paket Ethernet.

`SIM_MODE=0` mengaktifkan jalur Ethernet PHY, tetapi tidak otomatis menonaktifkan `SIM_SCALE_ENABLE` pada ARQ. Cabang hardware belum diuji. `top`, `encoder_top`, `decoder_top`, `fso_gth_bridge_hotswap`, `eth_mac_segmenter`, dan contoh GT adalah kandidat alternatif/tidak terjangkau pada graph ini; jangan menyatakan tidak digunakan oleh proyek/TB/script lain. File bernama sama pada `File import` perlu dipilih menurut XPR, bukan digabung.

### Matriks data-in/data-out dan kontinuitas

Frekuensi berikut adalah konfigurasi sumber, bukan pengukuran hardware. `T`=tx0_clk 322,265625 MHz, `R`=rx0_clk konfigurasi nominal sama (recovered clock), `L`=clk_logic 200 MHz. Clock bantu 100 MHz dari clk_wiz. Angka beat adalah geometri yang harus diuji, bukan hasil pengukuran.

| Hop | Domain/lebar/kontrak | Expected data/beat | Buffer dan risiko yang harus diukur |
|---|---|---|---|
| Ingress → segmenter | T, XGMII 32+4 control → 32 valid/ready/last | 2.000 B → 1.900+100 B; tkeep diperiksa sebelum konversi | XGMII tidak memiliki ready; IPG wajib legal, antrean ingress perlu admission/overflow audit |
| Segmenter → framer | T, 32 valid/ready/last + valid_bytes | header 16 beat ×8; payload+CRC 478 beat ×32 | DATA FIFO 1024×32; stall harus menahan semua metadata |
| CDC1 → FEC TX | T→L, header 8→8; payload 32→64; en/flag | 16 header bytes; 239 payload words | FIFO head 512×8; payload 1024×32→512×64; cdc_ready bukan AXI ready per beat |
| FEC TX → mux | L, 64 RS →96 LPC, valid | 32+2040=2072 B=259×64; LPC 259×96 | tidak boleh mengubah urutan saat bubble; latency belum diukur |
| mux → CDC2 | L→T,128→32, valid/keep→flag | 194×16+13=3117 B, 195 input beats | FIFO 512×128→2048×32; residual byte antar-frame; full gating tanpa backpressure ke mux perlu diuji |
| CDC2 → GTH TX | T,32 data/valid, tanpa ready upstream | stream lintas batas frame; 3117/4 bukan integer | elast_mem 4096×32; pause 64/66; tx_stall_out tidak diumpankan ke encoder pada top |
| GTH RX → CDC3 | R→L,32→128, valid/en/flag | urutan bit/byte optik dipertahankan | FIFO 2048×32→512×128; tidak dapat menghentikan link fisik |
| FEC RX → CDC4 | L→R, header8, payload64→32 | 16 B header;1912 B payload sebelum CRC dibuang | FIFO head512×8, payload512×64→1024×32; cek read latency IP |
| CRC → ARQ/reorder | R,32, valid/ready/last | 1908 B=477 beat setelah CRC | reorder 16 slot×477; duplicate/stale/missing/wrap |
| Reassembly → backend | R,32 valid/last; ready diikat1 | 2000 B +8 B preamble/SFD =502 beat pada format internal | packet boundary dan full backend; tlast harus bertahan hingga terminator XGMII |
| Feedback ARQ | sumber R → encoder menangkap pada L → tujuan T | tuple RXFN/ACK/valid utuh, tepat sekali | sumber clock penulis queue tidak cocok dengan domain pembuat feedback; prioritas audit CDC |

Semua hop: latency aktual, occupancy min/max, burst/bubble, underflow/overflow dan throughput **NOT_RUN**. Gap internal legal hanya menurut kontrak; gap antara/dalam frame optik dilarang §2.6.3.1/§2.6.3.5.1. Pause gearbox bukan bukti gap fisik. Ukur serializer/decode transport secara terpisah dari valid internal dan IPG Ethernet. Kondisi input lebih cepat dari output harus menimbulkan backpressure/admission terdefinisi atau drop yang tercatat, bukan korupsi diam-diam.

## C. Tool dan dependency

| Tool | Hasil pemeriksaan |
|---|---|
| iverilog / vvp | `/usr/bin`, 11.0 stable; hanya pemeriksaan versi |
| Python | `/usr/bin/python3`, 3.10.12 |
| Git | `/usr/bin/git`, 2.34.1; tidak ada commit workspace |
| Vivado | `/2025.2/2025.2/Vivado/bin/vivado`, v2025.2, SW Build6299465 |
| xvlog/xvhdl/xelab/xsim | direktori bin instalasi yang sama; masing-masing melaporkan v2025.2 |
| PDF | pdftotext tersedia; ekstraksi PDF asli disimpan di current |
| Waveform | `/usr/bin/gtkwave` tersedia; GUI belum dijalankan |
| Vendor library | glbl.v dan data/xsim tersedia; IP XCI/generated model ada; compile/link/license belum diuji |

`type -a vivado2025` pada shell noninteraktif: not found. `.bashrc:122` mendefinisikan alias `source /2025.2/2025.2/Vivado/settings64.sh && vivado`. Versi semua executable diverifikasi setelah source environment tersebut. Jangan memakai fallback PATH/2022.2. Skrip lama `evidence/collect_inventory.py` berisi pemanggilan 2022.2 dan tidak boleh dijalankan ulang apa adanya. Log lama 2022.2 bukan bukti untuk run berikutnya.

Pemeriksaan read-only menghasilkan warning Board Store untuk part lain; jangan langsung menafsirkannya sebagai kegagalan KU060. Elaborasi, library binding, lisensi sintesis, timing dan report_cdc belum diuji. Tidak ada dependency vendor yang sudah terbukti hilang; statusnya NEEDS_VERIFICATION, bukan CONFIRMED_BUG. PDF CCSDS rujukan lengkap, Master Handbook B.1 persis, evidence audit lengkap dan email keputusan ETRI belum teridentifikasi pada dokumen lokal. Verifikasi terperinci yang membutuhkan sumber tersebut: BLOCKED_DEPENDENCY sampai tersedia; pembacaan SDA lokal tetap dapat dilanjutkan.

## D. Normatif, hitungan, dan implementasi

[FAKTA SUMBER] PDF `Project_Doc/SDA-OISL-Standar.pdf` menyatakan Version2.1.2. Tabel2-4 pada halaman tercetak19 cocok dengan angka berikut. Kolom dukungan:312,5 shall;625/1250 should;2500/5000/10000 may. Demo10G tidak membuktikan dukungan seluruh standar.

| Baud Mbaud | Durasi µs | Effective Mbps | Frame kHz | FCCH Mbps |
|---|---|---|---|---|
|312,5|79,795|191,290|12,532|0,201|
|625|39,898|382,579|25,064|0,401|
|1250|19,949|765,159|50,128|0,802|
|2500|9,974|1530,318|100,257|1,604|
|5000|4,987|3060,635|200,513|3,208|
|10000|2,494|6121,270|401,027|6,416|

[HASIL HITUNGAN] 9+48+3060=3117 B=24936 bit. T=24936/10^10=2,4936µs=2493,6ns; f=401026,628... frame/s; R_info=1908/3117×10=6,121270452 Gb/s; FCCH=16f=6,416426 Mb/s. Best-case tanpa retransmisi/MGMT; overhead encapsulation, padding, IDLE dan distribusi paket mengurangi throughput Ethernet. Label10G-to-10G adalah antarmuka, bukan jaminan10Gb/s Ethernet payload.

Header14 B+CRC16=16 B→RS(32,16)32 B→LPC48 B. Payload1908 B=477×32; +CRC32=1912 B=478×32=239×64; 8×RS(255,239)=2040 B→LPC3060 B. LAST_WORD_IDX477 berarti478 beat; reorder477 beat berbeda karena CRC sudah dibuang.

| Normatif | Parameter / turunan | RTL deklarasi / override efektif statis | Rencana test / status |
|---|---|---|---|
|T2-4,§2.6.3.1,T2-8|24936 bit,72-bit preamble|preamble_gen,mux_gearbox_128,x_logic_gth; keep1FFF|serial oracle; NEEDS_VERIFICATION|
|T2-9/10,§2.6.3.3.2|16B header, TXFN semua jenis, RXFN sah dengan ACK-valid|header_generator/parser, arq_tx_controller|field/CRC/sequence wrap; NEEDS_VERIFICATION|
|§2.6.3.3.3,T2-11|holdoff16×cfg, cfg0..255; retx0..5|arq_tx_controller:cfg255,mult16,max5,tracker4,SIM_SCALE_ENABLE1,HOLDOFF_TICKS500; instansiasi framer tanpa override|sim ticks bukan4080 frame; NEEDS_VERIFICATION|
|§2.6.3.3.4|TX_TS40,TOD6,TS-applies3|ethernet_fso_framer TX_PIPE_LATENCY_PS2313200; top timestamp statis|rollover/latency capture; SCOPE_LIMITATION waktu nyata|
|§2.6.3.3.5,T2-12/13|FCCH opcode4+payload16|top opcodeF,plFFFF|uji No Message dan packing; NEEDS_VERIFICATION|
|§2.6.3.5,T2-14|IDLE seedTXFN+1; MGMT1Hz/CRC/FEC|fso_idle_generator,fso_payload_top,mgmt_telemetry_generator; top trigger0|transisi/CRC/retry MGMT; NEEDS_VERIFICATION; top periodik SCOPE_LIMITATION|
|§2.6.3.6,T2-17|RS,LPC; scrambler25-bit seed7 per frame|core_tx/core_rx,rs_codec,scrambler/descrambler,lpc|oracle bit serial dan lane≤8error; NEEDS_VERIFICATION|
|§2.6.3.7,T2-18|AB/seq10/length14,CDEF/length14,continuation|packaging_and_segmentation MAX_WORDS475 tanpa override; fso_payload CONT_NO_PKT_HDR_EN1,DEFAULT_ETH_PKT_BYTES2000|2000→1900+100 dan multiframe; NEEDS_VERIFICATION|

T2-10 mengharuskan reserved bits=1; bit CRC MSB-first, TXFN/RXFN low byte lebih dahulu. T2-18 seq10 bukan TXFN16 ARQ. Scrambler mencakup RS header+payload, preamble dikecualikan. Detail CCSDS harus dicocokkan ke dokumen asli sebelum signoff coding.

| Timing | Expected hitungan | Konfigurasi aktual sumber | Actual terukur/error |
|---|---|---|---|
|Frame nominal10Gb/s|2493,6ns|transport GTH64B66B line10,3125Gb/s|NOT_RUN / N/A|
|200MHz|498,72cycles/frame|clk_wiz clk_out2=200|NOT_RUN / N/A|
|312,5MHz hipotetik|779,25cycles/frame|opsi timer reorder|NOT_RUN / N/A|
|322,265625MHz|803,6015625cycles/frame|GTH TX/RX usrclk dan reorder defaultCLK_FREQ_HZ322265625|NOT_RUN / N/A|
|Gearbox|32×322,265625MHz×64/66=10Gb/s|pause cycle64,65 pada gth64b66b_tx|NOT_RUN / N/A|
|ARQ TX percepatan|500 ticks pada clockT|SIM_SCALE_ENABLE1 tanpa override|waktu expiry FSM NOT_RUN|

Pola hitungan: pada200MHz18×499+7×498 per25; pada322,265625MHz51×803+77×804 per128; pada312,5MHz96×779+32×780 per128. Ini target rata-rata, bukan hasil pacing DUT. Timer reorder bukan scheduler serialized. Actual clock hardware belum diukur.

### Perbedaan dokumen dan source / register temuan

Tidak ada CONFIRMED_BUG baru berdasarkan simulasi tahap ini. Status lama tidak ditimpa; alias berikut berasal dari dokumen lokal `Kelompok_A_System_Guidelines_SDA_OISL_Rev30.pdf`, halaman8, yang merujuk audit baseline12:55. Nama laporan audit asli untuk alias D belum dipastikan dari evidence lengkap.

| ID | Alias / lokasi sumber aktual | Pemicu; expected vs actual statis; prioritas |
|---|---|---|
|OISL-ETH-001|D02; ethernet_frame_reassembly.v, sda_decoder.v:181–189, backend|multi-paket; satu terminator per paket; ready top diikat1, reproduksi paket tergabung belum dilakukan. NEEDS_VERIFICATION/P0|
|OISL-IDLE-001|D03; fso_idle_generator.v,fso_payload_top.v|DATA→IDLE; seed harusTXFN+1 saat commit. File telah berbeda dariZIP, akar masalah revisi kini belum dibuktikan. NEEDS_VERIFICATION/P0|
|OISL-CDC-001|B14/D05; sda_encoder.v:190,278; sda_decoder.v:144|feedback lahir diR, writer sekarang memakaiL, destinationT. Clock sumber kontinu sudah terlihat, tetapi domain belum cocok; metastabilitas/event loss perlu CDC analysis. NEEDS_VERIFICATION/P0|
|OISL-MGMT-001|D06; arq_tx_controller.v,fso_payload_top.v|MGMT CRC fail/lostACK; standar mencakupARQ MGMT. Implementasi berubah, belum diuji. NEEDS_VERIFICATION/P1|
|OISL-ONB-001|top.v yang dimaksud SDAOISL10Gto10G_top.v:50–54,214; framer:301|mode demo defaultSIM1/loopback1, MGMT trigger0, ARQ fast default. Bukan konfigurasi dua terminal/periodik terverifikasi. SCOPE_LIMITATION/P0|
|OISL-ONB-002|gth64b66b_tx.v:35–36; GTH XCI|komentar312,5 vs konfigurasi322,265625; gunakan XCI dan koneksi aktual. NEEDS_VERIFICATION/P1|
|OISL-ONB-003|mux_gearbox_128.v; encoder/x_logic_gth.v:52; gth64b66b_tx.v:65|full/tail/long run; residual3117B harus utuh; full-gating dan buffer tanpa ready dapat menjadi lokasi drop. Belum ada bukti drop. NEEDS_VERIFICATION/P0|

PDF Guidelines lokal berlabel Rev A.1, bukan Master Handbook B.1 yang disebut instruksi. Dokumen Audit Response berisi klaim perbaikan/reproduksi lama dan ukuran jumbo lebih besar; bukan bukti workspace ini lulus atau perlu scope MTU9000/16000. Modul wrapper DDR4 tidak membuktikan MIG fisik. OCXO/GNSS/1PPS belum menjadi integrasi yang terverifikasi.

Generator `eth_axis_packet_gen.v:94` menempatkan `DEADBEEF` pada word terakhir dari total_words; untuk2000B, empat byte terakhir termasuk FCS tiruan, bukan CRC Ethernet yang valid. Preamble/SFD8B berada di luar2000B. Kontrak ini berlaku generator top tersebut; setiap TB harus diperiksa sendiri, jangan mengasumsikan stimulusnya sama.

## E. Rencana verifikasi dan acceptance criteria

Semua test berikut **NOT_RUN**. Gunakan baseline hash, command tepat, top/parameter efektif, simulator2025.2 atau Icarus sesuai dependency, seed deterministik1/17/2026, expected/actual dan exit status. Simpan timeout eksplisit dan raw logs. Mulai directed lalu randomized; model oracle tidak mengikuti bug DUT.

| Urutan / area | Stimulus dan oracle independen | Acceptance criteria |
|---|---|---|
|P0 build|elaborasi topSIM1 danSIM0, loopback1/0; XCI asli2025.2; compile mem paths|tidak ada unresolved module/port mismatch; dependency hilang→BLOCKED_DEPENDENCY, bukan bug |
|P0 data-in/out|1×2000,2×2000,64/128/1518/2000B; scoreboard byte dari accepted valid&&ready/popcountkeep|segment1900+100, tiap paket identik, jumlah/urutan/batas/FCS kontrak tepat; tidak ada loss/duplicate |
|P0 integrasi backend|tb_reassembly_and_backend + paket berurutan dan tail|jumlah /S/ dan /T/ sama jumlah paket, IPG legal, tidak tergabung |
|P0 CDC|empat CDC payload dan feedbackR→T; beda fase/frekuensi, reset per domain, full/drain/refill/wrap|tuple koheren tepat sekali, no overflow/underflow; report_cdc/constraints terpisah dari simulasi |
|P0 kontinuitas|≥10000frame setelah lock; DATA→IDLE→DATA; burst lalu stop; FIFO nearfull/empty simultaneouspush/pop|bit stream oracle tiap24936bit, nol gap fisik ilegal/residual bocor; occupancy bounded, tail selesai; laporkan durasi observasi dan drift |
|P0 IDLE|DATA→IDLE pada TXFN0/1/FFFF, stall first/mid/last|payload PRBS seedTXFN+1 sesuai aturan width, CRC benar, heldbeat stabil |
|P1 FEC|tb_FEC_RS/tb_FEC_Demux/tb_Scrambler_LPC; independent CCSDS/SDA vectors|bit/byteorder tepat;0..8simbol/lane pulih;>8 tidak diasumsikan selalu terdeteksi RS, CRC/ARQ outcome diperiksa |
|P1 ARQ|ACK/NAK/lost/staleACK, duplicate, retrylimit0..5, queuefull, pendingdelete/reuse, sequencewrap; dua terminal tanpa localshortcut|retry/drop dan in-order output sesuai kontrak; data yang sudahACK tidak rusak saat slotreuse |
|P1 timer|reorder322265625/312500000, resetaccumulator; ARQ fast/normal terpisah|pola interval dan rata-rata eksak; normal holdoff bukan500tick; jangan menyamakan timer dengan cadence optik |
|P1 MGMT|DATA→MGMT→DATA, CRCfail, lostACK, retransmission, duplicate|T2-14 metadata/CRC/FEC tepat, MGMT mendapat ARQ; top1Hz perlu keputusan implementasi setelah audit |
|P1 backpressure|stall kata pertama/tengah/terakhir, memory read in-flight, simultaneouspush/pop|data/valid/last/metadata stabil saat stalled, tidak ada missing/duplicate beat |

Pertahankan regresi lama FEC/timer/pending-delete/reassembly stall, tetapi jalankan ulang terhadap snapshot ini. Model behavioral vendor jika diperlukan harus mendokumentasikan width, latency, FWFT/standard, reset busy/full/empty dan batas terhadap IP asli. Tidak membuktikan metastabilitas atau timing closure. Uji fisik, wiring, clock eksternal dan komunikasi ETRI memerlukan instruksi terpisah.

## F. Evidence dan perubahan tahap ini

- `current/baseline.sha256`, `baseline_check.json`: pembekuan baseline dan pemeriksaan inventaris lama.
- `current/project_sources.json`, `inspect_project.tcl/log/jou/console.log`: XPR, compile-order dan IP; command: `/2025.2/2025.2/Vivado/bin/vivado -mode batch -source inspect_project.tcl -log inspect_project.log -journal inspect_project.jou` dari current; `open_project -read_only`; exit0; seedN/A.
- `current/vivado_versions.log`, `tools.log`: lokasi/versi; `source /2025.2/2025.2/Vivado/settings64.sh`, lalu `command -v` dan `-version` untuk kelima executable. Exit proses verifikasi0; simulasi DUTNOT_RUN.
- PDF diekstrak dengan `pdftotext -layout INPUT.pdf OUTPUT.txt`; teks di current, PDF asli tidak diubah. Hash PDF ada di manifest.
- Dokumen baru ini dan tambahan ringkas AGENTS.md adalah deliverable; source implementasi dipertahankan. Inventaris/skrip historis tidak ditimpa.

Acceptance onboarding: baseline teridentifikasi; top/part dan launcher2025.2 terverifikasi; graph dan kontrak awal tersedia; gap bukti dan prioritas test eksplisit. Acceptance RTL/FPGA belum dinilai. Tahap selanjutnya menunggu penugasan audit/revisi, bukan melanjutkan pemrograman papan otomatis.
