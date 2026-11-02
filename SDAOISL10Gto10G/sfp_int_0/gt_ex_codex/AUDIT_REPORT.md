# Audit fungsional workspace — 1 November 2026

## Ringkasan hasil

**Demo lengkap belum lulus.** Audit menemukan tiga kegagalan fungsional yang direproduksi, satu ketidakcocokan RTL–IP pada mode hardware, dan satu kesalahan kompilasi TB asli. Tidak ada perubahan RTL, TB asli, XCI, XDC atau XPR asli; pemeriksaan SHA256 akhir menunjukkan nol file baseline berubah.

[HASIL SIMULASI] 21 test audit independen lulus pada **Icarus 11.0** dalam cakupan masing-masing; tiga test audit gagal: baseband IDLE deadlock, kehilangan feedbackCDC, dan pengiriman telemetryMGMT duplikat. Sembilan TB asli juga dijalankan, tetapi banner PASS-nya tidak dipromosikan menjadi bukti independen keseluruhan modem.

[FAKTA SUMBER / HASIL ELABORASI] Vivado/XSim **2025.2** dipakai untuk compile/elaborasi dengan IP vendor asli. Top SIM_MODE1 dan TB grand-top berhasil dielaborasi. Mode hardware0 gagal pada port PCS/PMA. **Runtime XSim terblokir sebelum simulasi**, juga pada smoke test tanpa DUT/IP. Tidak ada PASS fungsional XSim. Daftar lengkap72 entri run/elaborasi ada di [results.tsv](evidence/results.tsv); jumlah entri bukan jumlah test independen yang lulus.

## Baseline, provenance, tool, dan reproduksi

- Root: `/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)`.
- Baseline audit: SHA256 manifest `ab25b50fbc1642b055ddbdf0b134190db43d5245d0f015397af2310842dfa307`; [baseline.sha256](evidence/baseline.sha256) mencatat setiap file asli, mengecualikan folder audit/onboarding. Bukan commit Git.
- XPR asli SHA256 `230379480adfe7df53271f1a56ec795eda304b3d17320e9889dac6f89c6343be`; top `SDAOISL10Gto10G_top`; part `xcku060-ffva1156-2-i`.
- ZIP12:55 SHA256 `7d67c455f6a9f8130cece7c3555369ea304d3725e9453a8cdf7e26b0550146a6`. [Sembilan diff, hash, alias dan dampak](BASELINE_DIFF.md); tidak mengambil file ZIP lama untuk mengganti workspace.
- Tool: `/2025.2/2025.2/Vivado/bin/{vivado,xvlog,xvhdl,xelab,xsim}`, seluruhnya2025.2, SW Build6299465; [versions.log](evidence/versions.log). Icarus/vvp11.0, Python3.10.12.
- [REPRODUCE.md](REPRODUCE.md) menyediakan command. Setiap run menyimpan `compile/elaborate/simulate.json` berisi argv lengkap, cwd, exit code dan elapsed wall time, serta raw log. Seed RS2026; seluruh test lain deterministik tanpa PRNG (seed N/A).
- Timeout proses: compile90–240s, elaborasi120–240s, XSim180s, vvp120s; TB audit memakai watchdog tambahan bila menunggu completion. Status run dipisahkan dari status temuan.
- Export dilakukan pada **salinan proyek byte-identik** di audit/project_copy. Perubahan property top/export hanya pada salinan. `sda_codec_0.gen` ikut disalin karena dirujuk generated IP.
- [source_postcheck.json](evidence/source_postcheck.json): `changed_original_files=[]`.

Pencarian literal `2022.2` pada SH/TCL/PY/PRJ/INI menemukan satu skrip historis: `onboarding/evidence/collect_inventory.py:60`. Tidak dijalankan. Script aktif audit menggunakan path absolut2025.2. Tidak ditemukan referensi2022.2 pada script build proyek yang dipindai; copyright2022–2025 tidak dihitung sebagai versi2022.2. Bukti: [legacy_2022_references.txt](evidence/legacy_2022_references.txt).

### Klasifikasi compile/elaborasi/runtime

| Pemeriksaan | Actual | Status dan batas |
|---|---|---|
|Export/XVLOG source top + IP asli|exit0|PASS_TESTED_SCOPE compile, bukan simulasi|
|Top default/SIM_MODE1 dan grandTB|snapshot berhasil|PASS_TESTED_SCOPE elaborasi|
|Top SIM_MODE0|port PCS/PMA tidak ditemukan|CONFIRMED_BUG integrasiRTL–IP, OISL-IP-001|
|Front/backend RUN_MODE0 terpisah|kegagalan port direproduksi|CONFIRMED_BUG yang sama|
|TB asli `tb_x_gth_logic`|identifier beda kapitalisasi|CONFIRMED_BUG TB, OISL-TB-001|
|XSim DUT, audit kecil, smoke10ns|unexpected exception sebelum marker|BLOCKED_DEPENDENCY runtime lingkungan|
|MEM RS dan stimulus asli|tersedia di export/xsim setelah export|tidak ditemukan error missing-stimulus dalam run final|
|Icarus awal|include functions.v hilang lalu terkompilasi dua kali|kesalahan konfigurasi audit; diperbaiki -I imports dan exclude file include sebagai compilation unit; logattempt1/2 dipertahankan|

## Temuan dan reproduksi

Seluruh temuan di bawah memakai baseline di atas. File RTL berada di `gt_ex.srcs/sources_1/new/` kecuali disebutkan. Pengujian fungsional memakai Icarus 11.0; tidak ada model IP pada jalur tiga bug fungsional tersebut. Test CDC menggunakan ekstraksi **blok logika utuh tanpa modifikasi** dari sda_encoder, bukan model perilaku FIFO baru. Wiring top diperiksa terpisah. Semua usulan perbaikan di bawah **belum diimplementasikan**.

### OISL-IDLE-003 — CONFIRMED_BUG — P0: start IDLE memilih kode MGMT

- Alias: tidak ada ID lama untuk kesalahan selector ini; berkaitan dengan upaya perbaikan **OISL-IDLE-001 / D03**, bukan bukti D03 selesai.
- Lokasi: `ethernet_fso_framer.v:199` (`idle_trigger_now`), assign hierarchical:222; `arq_tx_controller.v:551` IDLE=00, MGMT=10 pada:509.
- Pemicu: reset, ingress awalnya kosong, kemudian dua paket2000 B dan triggerMGMT satu siklus. Framer memilih IDLE pertama sebelum paket ingress siap.
- Expected: IDLE berisi478kata termasukCRC, header/seed konsisten; scheduler kemudian melayani DATA/MGMT. Actual: `state=6`, selector00, `frame_busy=1`, `idle_start=0`, `idle_ready=1`; **nol payload frame dan nol paket keluar** selama60,866µs. Ingress menerima1000kata Ethernet; hanya dua segmen pertama lolos ke framer sebelum backpressure.
- Reproduksi: `python3 audit/20261101/scripts/run_iverilog.py tb_audit_baseband`; [log](runs/iv_tb_audit_baseband/simulate.log), [TB](tb/tb_audit_baseband.sv). Seed N/A. FEC/CDC/GTH dibypass dengan koneksi header/payload langsung, sehingga kegagalan tidak bergantung pada vendor IP atau channel.
- Akar masalah: predicate start baru memakai10, padahal scheduler memakai00 untukIDLE. `payload_streaming` menunggu tlast yang tidak mungkin muncul tanpa start generator.
- Usulan: gunakan decode jenis frame/selector yang konsisten, hilangkan magic-code ambigu; verifikasi handshake seedcommit tanpa mengandalkan standalone fallback.
- Dampak: memblokir startup demo dan transisi DATA→IDLE→MGMT→DATA. Retest: cold-startIDLE, DATA-first, semua transisi, TXFNwrap, stall start/akhir, CRC dan byte-scoreboard dua paket; tidak boleh menyatakan integrasi lulus hanya karena unitIDLE lulus.

### OISL-CDC-001 — CONFIRMED_BUG — P0: domain sumber feedback masih salah

- Alias: **B14/D05**, audit12:55 melalui Guidelines RevA.1. Bentuk kode berubah, tetapi masalah integrasi clock sumber belum selesai.
- Lokasi: `sda_encoder.v:190,278` source writer `clk_logic`; `sda_decoder.v:144` deframer berclock `clk_gth` RX; top menghubungkan RX pada `rx0_clk` dan encoder `clk_logic` pada200MHz.
- Pemicu:100 event satu siklusRX, kedua kanal local dan peer, clockRX nominal322,265625MHz terhadaplogic200MHz. TB1ps membulatkan periodeRX menjadi3,104ns; perbedaan kecil ini dinyatakan, bukan pengukuran hardware.
- Expected:100 tuple diterima tepat sekali dalam urutan. Actual:**64/100** pada masing-masing kanal;36 hilang,62 posisi indeks berbeda setelah kehilangan pertama, counteroverflow0. Tidak perlu memodelkan metastabilitas untuk mereproduksi kehilangan sampling ini.
- Reproduksi: `.../run_iverilog.py tb_audit_cdc_actual`; [log](runs/iv_tb_audit_cdc_actual/simulate.log), [TB](tb/tb_audit_cdc.sv), [blok ekstraksi](models/cdc_extracted.sv), [provenance](evidence/cdc_extraction.txt). Seed N/A; tanpa IP substitusi.
- Kontrol pembanding: event sinkron denganL lulus195/195 local danpeer; destination dipause setelah readiness,35 event mengisiFIFO+pending3, lalu drain/refill/wrap160 event; mismatch0, overflow0. [Log](runs/iv_tb_audit_cdc/simulate.log). Ini membuktikan cakupan queue, bukan kebenaran wiring top.
- Akar masalah: queue baru memakai clock kontinu, tetapi bukan domain yang menghasilkan pulse feedback. PulseRX dapat seluruhnya berada di antara dua edge200MHz.
- Usulan: port clockRX eksplisit untuk sisi source FIFO, atau handshake pulse/tuple dariRX yang benar sebelum masukL. Terapkan reset synchronization dan constraints Gray lintasdomain yang sesuai; jangan hanya menambah depth.
- Dampak: ACK/NAK/peerACK dapat hilang tanpa overflowdiagnostic, memicu retry/drop salah. Retest: clockRX/TX bebas fase, sparse/back-to-back events, full/drain/refill/wrap/reset dan report_cdc; simulasi tidak menjadi metastability signoff.

### OISL-MGMT-002 — CONFIRMED_BUG — P1: retransmisi MGMT diterbitkan ulang ke telemetry

- Alias: tidak mendaur ulangD06; terkait cakupan **OISL-MGMT-001 / D06**. Banner `deframer.v:33–42` mengklaim duplicate/stale telemetry suppression.
- Lokasi: `deframer.v:200` data-plane demux; `frame_demultiplexer.v:73` validMGMT hanya digate frame_type; `mgmt_extraction.v:110` selalu menerbitkan valid. HistoryMGMT di `arq_rx_controller` hanya mengontrol ACK/non_data_seq_adv, tidak memblokir payload telemetry.
- Pemicu: MGMT validTXFN10,11,ulang10, TXFN12 denganCRC rusak, lalu12valid. HeaderCRC16 dan payloadCRC32 dibuat oracle bitserial zero-init sesuaiT2-15. Tidak menggunakan encoderDUT untuk membuatCRC stimulus.
- Expected:ACK4,NAK1, **tiga** telemetry delivery unik(10,11,12). Actual:ACK4,NAK1, **empat** telemetry delivery; retransmisi10 diterbitkan lagi. Nilai range tetap415312d000000000.
- Reproduksi: `.../run_iverilog.py tb_audit_mgmt_duplicate`; [log](runs/iv_tb_audit_mgmt_duplicate/simulate.log), [TB](tb/tb_audit_mgmt_duplicate.sv). Seed N/A; test diturunkan dari TB asli dengan urutan audit dan CRC16 independen; sumber asli tidak diedit.
- Akar masalah: suppression control plane tidak tersambung ke jalur release data; perubahan executable deframer terhadapZIP hanya mengganti sumber hdr_crc_ok pada ARQcontroller. Komentar tambahan bukan implementasi historytelemetry.
- Usulan: simpan keputusan accept/duplicate/stale yang koheren per verified payload dan gate release MGMT; tetap re-ACK retransmisi valid agar trackerTX bebas.
- Dampak: aplikasiPNT/telemetry dapat memproses transaksi lama ulang. Retest:A→B→A, lostACK, stale history/age, CRCfail, corruptedheader, wrap, dan memastikan ACK tetap ulang sementara delivery tepatsekali. Kriteria ini menilai kontrak ARQ dan klaim revisi; bukan klaim kepatuhan PNT menyeluruh.

### OISL-IP-001 — CONFIRMED_BUG — P0 hardware: wrapper Ethernet tidak cocok IP

- Alias lama: belum teridentifikasi; ID baru.
- Lokasi: `eth_rx_front_end_top.v:104–123`, `eth_tx_back_end_top.v:143–162`; deklarasi IP aktual `gt_ex.gen/sources_1/ip/eth_10g_pcs_pma_{rx,tx}_0/synth/...v`.
- Pemicu: elaborasi `SDAOISL10Gto10G_top` dengan `SIM_MODE=0`, lalu front/backend standalone `RUN_MODE=0`.
- Expected: semua named ports resolve pada generatedIP2025.2. Actual: VRFC10-3180 pada `drp_*_i/o`, `configuration_vector`, `status_vector`, `qpll*` dan lainnya; staticelaboration gagal. GeneratedIP tersedia dan dikompilasi: ini **mismatch integrasi**, bukan missingIP.
- Reproduksi: `python3 audit/20261101/scripts/elaborate_audits.py`; [top log](runs/top_mode0/elaborate.log), [RX log](runs/eth_rx_front_end_top_hardware/elaborate.log), [TX log](runs/eth_tx_back_end_top_hardware/elaborate.log). Argv lengkap dalam JSON pendamping; seed N/A; vendorIP asli, tanpa behavioral replacement.
- Akar masalah: wrapper memakai interface yang berbeda dari deklarasi IP aktual (contohDRP aktual `core_to_gt_drpen`, `gt_drpen`, dsb.).
- Usulan: cocokkan port, lebar, sharedlogic dan clock/reset terhadap XCI/veo instansiasi2025.2; jangan mengubah XCI untuk menyembunyikan mismatch tanpa review.
- Dampak: SIM_MODE1 dapat terelaborasi sementara integrasiEthernethardware tidak bisa. Retest: mode0/1 compile/elab, lintwidth, PHYsimulation dan clock domain review sebelum hardware.

### OISL-TB-001 — CONFIRMED_BUG TB — P2

- Alias lama belum diketahui. Lokasi `tb_x_gth_logic.v:132`: `out_header_Byte_idx`; deklarasi:78 adalah `out_header_byte_idx`.
- Pemicu: xvlog2025.2 testbench asli. Expected compile; actualVRFC10-2989, module ignored.
- Reproduksi: `python3 audit/20261101/scripts/run.py add gt_ex.srcs/sources_1/new/tb_x_gth_logic.v`; [log](evidence/compile_tb_x_gth_logic.log). Seed N/A, belum mencapai IP elaborasi.
- Akar: kapitalisasi identifier. Usulan koreksiTB pada revisi yang diizinkan, kemudian cek assertion bukan sekadar compile.
- Dampak: TBCDC1 asli tidak berjalan; tidak membuktikan DUTCDC1 gagal. Retest dengan FIFOvendor asli2025.2.

### OISL-ENV-001 — BLOCKED_DEPENDENCY: runtime XSim

- Lokasi lingkungan, bukanRTL. `xsim`2025.2 gagal `unexpected exception when evaluating tcl command` sebelum test berlangsung, termasuk `tb_audit_smoke` yang hanya menunggu10ns/display/finish.
- Expected smoke mengeluarkan AUDIT_PASS; actual tidak ada marker, walau exitprocess0. [Smoke log](evidence/smoke_console.log). Environmentsettings2025.2 retry sama: [retry](evidence/xsim_settings_retry.console.log).
- Probe socket lokal menghasilkan EPERM dan strace/ptrace juga ditolak sandbox. **[INTERPRETASI]** pembatasanruntime/IPC mungkin terkait, tetapi akar exceptionXSim belum terbukti karena tracing terblokir. Tidak meminta atau mencoba melewati pembatasan.
- Reproduksi smoke: `run.py tb_audit_smoke` sesudah compile; versi/build sama. Seed N/A, tidak ada vendorIP pada smoke.
- Usulan: jalankan command tersimpan pada terminal lokal Williams dengan2025.2, mulai smoke lalu grandTB; simpan log baru. Seluruh runtimevendor/serialGTH tetapNOT_RUN di lingkungan ini, bukan otomatis bugDUT.

## Hasil test audit independen

| Test (`runs/iv_tb_audit_*`) | Expected dan actual utama | Status |
|---|---|---|
|ingress|2×2000 B diterima;4segmen475beat;4000 B identik+3600 B pad internal;metadata awal2000/100,akhir1900/100;stall stabil|PASS_TESTED_SCOPE|
|packets|2000,2000,64,128,1516B;5708 B cocok;5preamble,5/S/,5/T/,IPG legal;0mismatch|PASS_TESTED_SCOPE|
|packets_stall|5paket5708 B;data/last stabil pada ready0|PASS_TESTED_SCOPE unit reassembly; backend tidak dinilai saatstall|
|rs|12frame×8lane=96CW;3060kata encoded cocokoracle;2868kata decoded cocok;0mismatch|PASS_TESTED_SCOPE RS255/239|
|rs_cadence|sama,499siklus200MHz antarawalframe;tail drain1000siklus setelah stimulus terakhir|PASS_TESTED_SCOPE cadenceRS, bukan optik|
|rs_header|12CW shortened32/16;384encoded byte,192decoded byte,0mismatch;0..8symbol error|PASS_TESTED_SCOPE|
|idle|7seedTXFN0,1,62,63,64,FFFF,0;478 kata/frame;CRCbitserial,heldbeat,last tepat|PASS_TESTED_SCOPE unit|
|rxcontrol|14kasusDATA/MGMT/IDLE,headerbad,CRCbad,peerACK,duplicate,FFFF→0|PASS_TESTED_SCOPE control plane|
|txcontrol|MGMTbaru1,retry2,drop1;DATAbaru1,NAKretry1;delete2;staleACKdiabaikan|PASS_TESTED_SCOPE fasttimer40ticks,MAX_RETX2,busymodel8cycles|
|memory|478 kata RAM direplay saatstall;delete saatread;slot3dipakaiulang;3824 B replay cocok|PASS_TESTED_SCOPE RAMRTL, bukanDDR4fisik|
|delete|ACKbersamaanwriteDATA;3write,1delete;slot0/2/4takbertabrakan;pendingqueueakhir0|PASS_TESTED_SCOPE arbitration|
|reorder|0,2,1,duplicate1,4(missing3)→0,1,2,4;4×477 kata;stall;16ticktimeout|PASS_TESTED_SCOPE CFG1,MAX_RETX0|
|feedback / feedback_local|MODE0 hanya peer;MODE1 hanya local;invalidsource tidakfallbackkejalurlain|PASS_TESTED_SCOPE mux; bukan dua terminal penuh|
|mgmt_replay|478 kata snapshot direplay identik meski live telemetry berubah;stall;lasttepat|PASS_TESTED_SCOPE satuoutstandingMGMT|
|cdc|195 tuplelocal+195peer;full/drain/refill/wrap;overflow0|PASS_TESTED_SCOPE sumberL yang disengaja|
|timer,timer312|128 interval;51×803+77×804 atau96×779+32×780|PASS_TESTED_SCOPE hitungan siklus|
|timer_exact,timer312_exact|precision1fs;mean2493,599756484ns /2493,600000000ns|PASS_TESTED_SCOPE timer, bukanclock hardware|
|gearbox|1000 frame,3117000B,195000 beat128,0mismatch;tail13 B/frame|PASS_TESTED_SCOPE packing; bukan CDC2/optik|
|baseband,cdc_actual,mgmt_duplicate|gagal sesuai temuan di atas|CONFIRMED_BUG|

RS payload error counts perlane adalah0,1,2,4,8 (posisi berbeda, termasuk0/1/2/127/238/239/253/254); header menyapu0..8. Detail setiap posisi/magnitudo dapat direkonstruksi dari modelseed2026 dan MEM; [rs_vectors.json](evidence/rs_vectors.json), [header_vectors.json](evidence/header_vectors.json). **Tidak ada klaim64error sembarang dapat dikoreksi**; maksimal64 pada satu frame audit hanya ketika8perlane.

OracleRS menggunakan perkalianGF0x187 secara software, pembentukan polynomial produk16rootsα^(11j), j120..135, dan polynomial longdivision. Setiap codeword juga dievaluasi terhadap16roots. Tidak memakai `rs_encoder`, `multiplier` atau `syndrome_unit` DUT untuk expected. Test membandingkan **seluruh encoded codeword dan seluruh decoded data**, bukan hanya syndromeDUT. Tidak menyatakan BER fisik atau kepatuhan seluruh CCSDS dari test ini.

Model RAM: behavioralvendor `bram_rs/sim/bram_rs.v` + `simulation/blk_mem_gen_v8_4.v` versi8.4.12, input8bit/depth256/outputregisterB. Vendor memperingatkan collision tidak dimodelkan presisi. Tidak ada modelBRAM64bit yang mengubah geometri perlane. SerialGTH, analogchannel, jitter/metastabilitas dan timingclosure tidak dimodelkan pada fallback.

Sembilan TB asli yang berjalan: `tb_FEC_RS`, `tb_rs_decoder_rx`, `tb_Scrambler_LPC`, `tb_FEC_Demux`, `tb_arq_tx_controller`, `tb_idle_MGMT`, `tb_reassembly_and_backend`, `tb_fso_payload`, `tb_fso_ethernet_deframer`. Semua menyelesaikan run dengan bannerinternalPASS, tetapi tetapNEEDS_VERIFICATION untuk klaim banner100%/normatif. Misalnya checker“independent” tb_FEC_RS memakai `syndrome_unit` DUT; oracleaudit terpisah diperlukan.

## Konfigurasi demo, FCS, dan jalur feedback

[FAKTA SUMBER] Top defaultSIM_MODE1/LOOPBACK_ARQ_DIRECT1; packetgen2000B. ControllerARQ default `SIM_SCALE_ENABLE=1`,HOLDOFF_TICKS500,MAX_RETX5,CFG255,MULT16,TRACKER_DEPTH4; framer tidak overridefastmode. Jumlah500tick bukan4080frame dan SIM_MODE0 tidak otomatis mengubahnya. Reorder default16slot×477kata, clock parameter322265625,CFG255,MAX_RETX5.

Reset top berasal dari clk_wiz_locked. Clocklogic200MHz, helper100MHz, GTHTX/RXuserclock konfigurasi322,265625MHz, line10,3125Gb/s dengan64 B66B. Hardwareclock belum diukur. GrandTB clockref156,25MHz dan system200MHz; errorchanneldefaultCH_ERROR_MODE1, target2jumbo; runtimegrandTB belum masuk simulasi.

MGMT top diikat0. GrandTB asli memaksa inputMGMT satu siklus melalui hierarchicalforce, bukan timekeeper1Hz. Auditbaseband memakai pulseTB setelah dua stimulus2000 B dan2500siklus tunggu; karenaIDLEdeadlock pulse tidak dilayani. TestMGMTunit memicu generator/controller langsung. Tidak ada klaim periodicMGMT atau GNSS/1PPS/OCXO nyata.

2000 B generator adalah seluruh stimulusMAC/header/payload **termasuk word terakhirDEADBEEF (4 B FCS tiruan)**. Tidak termasuk8 Bpreamble/SFD. Ini bukan EthernetFCS sah yang dihitung atas1996B sebelumnya. Ingressaudit membuktikan DEADBEEF dipertahankan sampai segmen100 B; reassembly/backendaudit membuktikan empatbyte itu dipertahankan diakhirpacket dan sebelum/T/. Pada buslittlelane byte urutnyaEF BE AD DE, sesuaiwordDEADBEEF. CRC32FSO terpisah dan tidak“memperbaiki”FCS Ethernet. Penerimaan oleh NIC fisik **belum dibuktikan**.

Scoreboard ingress dan egress menguji dua bagian terpisah. Tidak boleh menyambung keduaPASS menjadi bukti seluruh2000 B melewati modem: basebandfullchain justru macet, FEC/GTHend-to-end belum berjalan. Feedbacklocalunit/peermux dipisahkan; uji dua terminalpeer penuh **NOT_RUN**, terhalangIDLEstartup. Counterpackets/bytes tidak mencampurpaddingFSO, preambleEthernet, headerCRC/FEC, slotXGMII dan retransmisi.

## Matriks normatif dan timing

[FAKTA SUMBER] SDA OISL v2.1.2 lokal, Tabel2-4 halaman19 (kolomrequirement:312,5shall;625/1250should;2500/5000/10000may):

|Mbaud|Frameµs|EffectiveMbps|FramekHz|FCCHMbps|
|---|---|---|---|---|
|312,5|79,795|191,290|12,532|0,201|
|625|39,898|382,579|25,064|0,401|
|1250|19,949|765,159|50,128|0,802|
|2500|9,974|1530,318|100,257|1,604|
|5000|4,987|3060,635|200,513|3,208|
|10000|2,494|6121,270|401,027|6,416|

[HASIL HITUNGAN] Frame9+48+3060=3117 B=24936 bit. Pada10Gb/s T=2493,6ns, f=401026,628168frame/s; R_info=1908/3117×10=6,121270452Gb/s; FCCH=16f=6,416426Mb/s. AngkaT2-4 dibulatkan, bestcase tanpaMGMT/retransmisi. Ini bukan jaminan10Gb/s payloadEthernet.

|Acuan|Parameter/RTL|Bukti aktual/status|
|---|---|---|
|§2.6.3.1,T2-8;T2-4|24936 bit; preamble72; mux_gearbox_128|1000 framebytepackinglulus; physicalnocontinuity NOT_RUN|
|T2-9/10,§2.6.3.3.2|TXFN16,FRAME_TYPE; header/parser/arq|RXcontrolwraplulus; schedulerIDLEgagal; full header field mapping belum diauditsemua|
|§2.6.3.3.3,T2-11|holdoff16×cfg,retx0..5; arqcontroller/reorder|unitfastmode/max2 danTBhistorismax5 berjalan; fullpeerNOT_RUN|
|§2.6.3.3.4|timestamp40/TOD6; TX_PIPE_LATENCY_PS2313200|statis; kalibrasiegress/timekeeperNOT_RUN|
|§2.6.3.3.5,T2-12/13|FCCH16bit/frame; topF/FFFF|configurationfact; opcodefullsuiteNOT_RUN|
|§2.6.3.5,T2-14|IDLEseedTXFN+1; MGMT1Hz,ARQ|unitIDLElulus, startintegrasigagal; duplicateMGMTgagal;periodiktopabsent|
|§2.6.3.6,T2-15/17|CRC0x1021/04C11DB7zero-init; RS/LPC/scrambler|CRCunit/independentRS lulus; LPC/scramblerTBbawaanterbatas; independentfullLPCsignoffNOT_RUN|
|§2.6.3.7,T2-18|1908 Binfo=477 kata,478denganCRC;1900+100|ingress/egressoraclelulus; modemend-to-endgagal|

Header14+CRC2→16B→RS32B→LPC48 B. Payload1908+CRC4=1912 B=239×64→8×255=2040B→LPC3060B. RSgabungan2072B=259×64; LPC259×96. FIFO/reorder477beat setelahCRC berbeda dariLAST_WORD_IDX477 yang berarti478beat sebelumCRC dibuang.

|Timing|Expected|Actual / error / konfigurasi|
|---|---|---|
|Timer322265625Hz|51×803+77×804=102861cycles/128|sama,0cycleerror; precision1fs average2493,599756484ns, error−0,000243516ns≈−0,098ppm karena roundingdelay|
|Timer312500000Hz|96×779+32×780=99744cycles/128|sama,2493,600000000ns,0error|
|Logic200MHz nominalframe|498,72cycles|hitungan saja; tidak ada pengukuran frame optik|
|AuditTB umum#1.551515 pada1ps|nominal322,265625MHz|dibulatkan3,104ns period=322,164948MHz; tidak dilabelclock hardwareaktual|
|RS cadence|499cycles×5ns=2495ns|input499cycle, seluruhdata lulus setelahtail drain; +1,4ns vsnominalframe; bukan scheduleroptik|
|Muxgearbox stress|host499cycle/frame|1000 frames/sekitar2,495125ms termasukwarmup/tail; bytegeometrytepat, bukanpacingDUT|
|GTH64/66|32×322,265625MHz×64/66=10Gb/s|konfigurasi/codeinspection; serialruntimeNOT_RUN|

Clock dan initial reset berbeda antar test tercatat di TB. Timerunit memakaiWORDS_PER_FRAME1 agar fokus pada128tick; bukan bukti frame477beat berjalan denganlatency1. Fullreorder test memakai477beat. Tidak ada timingclosure/CDCsignoff/hardwaremeasurement.

## Matriks data-in/data-out dan kontinuitas

|Hop|Input→output / kontrak|Actual audit; gap/occupancy |
|---|---|---|
|Generator→XGMII→segmenter|1000acceptedwords Ethernet; valid&&ready,keep1111|4000 B identik;4×475outputbeat termasuk3600 Bpad;stallstabil;occupancymin/max belum diinstrumentasi|
|Framer→header/payload|16 header byte dan478 payload words/frame|payload0 pada coldstart;IDLEdeadlock; gap optik tidak dapat dievaluasi|
|CDC1→FECTX|8bitheader,32→64payload,T→L|vendor elaborasi tersedia; runtimeFIFO NOT_RUN; TBasli typo|
|RSencoder/decoder|12×239→12×255→12×23964bit|semua encoded/decoded cocokoracle;BRAMcollision/overflowstress di luar test|
|LPC→mux128|259×96+72→194×128+104bit|1000 frame3117000B;195000validbeats,304020 bubble cycles,maxburst4 padaL; bubbleinternallegal, bukan gapserializer|
|CDC2→GTHTX→RX→CDC3|128→32,64/66gearbox,32→128|runtimevendorNOT_RUN; tidak ada klaim occupancy/underflow/overflow0 atau continuousoptik|
|FECRX→CDC4→CRC|64→32,1912→1908 B|RSunit dan CRCdirect test berjalan; CDC4runtimeNOT_RUN|
|ARQ/reorder→reassembly|4×477 kata setelahmissing/duplicate|0,1,2,4 keluar;CRC/sequence/timeouttestterpisah; tidak ada loss/duplicate dalam scoreboard scoped|
|Reassembly→backend|5paket5708 B +5×8 Bpreamble|5/S/,5/T/,bytecocok,IPG≥3idlecycles; batas packet lulus; tidak menghapusIPG|
|Feedbacklocal/peer|R→penangkapL→T|64/100 perkanal,loss36; overflowcounter0; intendedLqueue195/195pendingpeak3 saatpause|

Kontinuitas fisik **NEEDS_VERIFICATION / NOT_RUN**. Preamble72bit danframe3117 B tidak habis dibagi32/64/128; muxoracle membuktikan tail13 B pada128, tetapi tidak membuktikan residualbyteCDC2 atau continuityserializer. Jangan menafsirkan validinternalbubble sebagai gapoptik, atau gearboxpause sebagai underflowfisik tanpa decodingtransport.

## Koreksi pada testbench audit dan batas oracle

Tidak ada expectedoutput diubah untuk menutup bugDUT. Perbaikan harness berikut dicatat karena oracle awal memiliki asumsi yang tidak menjadi kontrak:

1. Reorder: port alias `m_axis_tready` awalnya0 sehingga menahanoutput, walau primaryready1. Diubah menjadi1 agar unusedalias tidak memberikanstall tambahan. Kontrak dualinterface terlihat padaRTL; timeoutawal adalah kesalahan harness, bukan bugreorder.
2. Ingress: `seg_valid_bytes` bukan length konstan setiapbeat. Yang dipakai framer adalah metadata packet/remaining padafirstbeat dan jumlahbytevalidsegment padaakhir. Assertion dipersempit ke titik semantik tersebut; seluruh expected data4000B danpadding tetap sama. Log `initial_oracle_*` dipertahankan.
3. Delete: tidak ada requirement allocator harus segera memakaiulang slot terendah. Assertion awal “slot ketiga wajib0” diganti invariant slot live tidak bertabrakan dandeletequeueempty. Replay/reuse slot3 diuji terpisah diRAMtest. Log awal dipertahankan.
4. RS499cycle: checkerakhir awal terlalucepat sehingga43kata tail decoder belum keluar. Tambah1000cycle drain setelahseluruh stimulus, tanpa mengubahexpected data ataucadence. Log `before_tail_drain_*` menunjukkan mismatch0 tetapi countkurang sebelumdrain.
5. Timer audit awal memakai nama `small` (keywordVerilog); diganti `nshort`. Ini kesalahanTB audit, bukanDUT. Testtimerprecision1fs ditambahkan untuk memisahkan hitungancycle dari quantizationclockTB1ps.

## Risiko tersisa dan acceptance berikutnya

- **P0:** perbaiki IDLEstart, clocksource feedback dan wrapperPHY sesuai2025.2 setelah ada penugasanrevisi; audit ini tidak mengubahnya.
- **P1:** gate duplicate/staleMGMT pada releasepayload, bukan ACKcontroller saja. UnitMGMTreplay sudahteruji tetapi full-lifecyclepeer belum.
- OISL-ETH-001/D02: **PASS_TESTED_SCOPE** untuk lima paket danformatdemo kelipatan4; bukan genericEthernetMTU.
- OISL-IDLE-001/D03: **NEEDS_VERIFICATION** integrasi, terhalangOISL-IDLE-003; standalone seed/CRC/stall **PASS_TESTED_SCOPE**. OISL-IDLE-002/B15 lulus heldbeat unit.
- OISL-MGMT-001/D06: tracker/retry/ACKunit **PASS_TESTED_SCOPE**, keseluruhan **NEEDS_VERIFICATION** karenaOISL-MGMT-002 danstartup. Jangan tutupD06 hanya dariunitPASS.
- OISL-ARQ-001/B11/C-A005: delayeddelete/reuseRAM dansimultaneous ACK/write **PASS_TESTED_SCOPE**. Bukan exhaustive semua16 slot/eventcollisionkombinasi.
- **NOT_RUN:** dua terminalpeerfullmodem; DATA→IDLE→MGMT→DATA penuh; serialGTHbyteoracle; occupancy/drift empatCDCvendor; injeksichannelgrandTB; asynchronousresetstressseluruhdomain; staleMGMTmelewati64 history/agewindow; seluruhopcodeFCCH; timestampcalibration; synthesis/timing/report_cdc; hardware.
- BatasFCSDEADBEEF, topMGMTtrigger0, fastARQdefault danstatictelemetry: **SCOPE_LIMITATION** yang harus terlihat pada konfigurasi demo. MTU9000/16000,DDR4fisik,GNSS/OCXO/1PPS tidak ditambahkan ke scope.

Acceptance demo setelahrevisi: dua paket2000 B dancampuranpacket audit keluar byte-identik dengan bataspreamble/terminasi/FCSkontrak; DATA/IDLE/MGMT/RETX berjalan, seed sesuaiheader, peerfeedback tepatsekali, MGMTduplicate hanyaACKulang, occupancybounded danstreamoptik sesuai24936 bit tanpa gapilegal pada intervalobservasi yang dicatat. Semua harus dijalankan ulang pada hashrevisi baru; tidak mewariskanPASS otomatis.
