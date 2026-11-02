# Current demonstration handoff — 2026-11-01T17:38:51.922924+09:00

DEMO12: main run170951 and eight run155406 regressions VERIFIED_SCOPED; documentation closure and comment-only equivalence completed. Saved WDB ingress values verified. Interactive GUI and real screenshots pending; timing/DRC/CDC/hardware open. Current instructions: audit/20261101_demo12/GUI_REVIEW_PM.md. All earlier status snapshots below are historical; their original text is preserved.

# BASELINE10 current status — 2026-11-01T16:50:02.906587+09:00

BASELINE10-OFFICIAL-VERIFY01: SIMULATION_VERIFIED_SCOPED for all eight official run155406 tests, ending16:35:05KST. No source changes in this review. APPLIED hashes remain unchanged; no rollback required for evidence-only update. Synthesis completed separately; timing/DRC/CDC remain open. GUI configuration/capture pending; hardware not tested. Evidence: audit/20261101_baseline10/OFFICIAL_SUITE_REPORT.md and OFFICIAL_TEST_RESULTS.csv.

## Earlier status snapshots and revision entries (historical)

# BASELINE10 current status — 2026-11-01T16:20:35.456312+09:00

| Area | Status | Evidence / next action |
|---|---|---|
| Seven approved RTL files | APPLIED, BASELINE10-APPLY-C02-01, 15:49:41 KST | applied_20261101_154941_KST; seven current/run hashes rechecked identical |
| Additional source revision comments | Documentation-only; RTL tokens/directives/attributes preserved | APPLICATION.json, documentation diffs, token hashes |
| Official execution run155406 | Five completed tests: clean, payload8/lane, header8, payload9+ARQ, peer clean; remainder pending | Raw logs/results.json; no duplicate suite |
| Candidate runs1344/1420/1513 | Historical VERIFIED_SCOPED | Not relabelled as official execution |
| Synthesis run155203 | SYNTHESIS_COMPLETED; hardware generate with explicit timer overrides | Separate copied project; reports available |
| Timing / physical signoff | TIMING_NOT_CLOSED; DRC/CDC/debug black boxes open | Euclid WNS-4.433ns; PLIOBUF-4; CDC10/6 |
| GUI configuration | GUI_NOT_VERIFIED; script prepared, official XPR unchanged | Apply/check only after active suite completes |
| Waveforms | Recorded clean counter values confirmed; five ingress paths need corrected capture | OFFICIAL_WDB_VALUES.tsv; gui_preparation |
| Hardware | HARDWARE_NOT_TESTED | No implementation or programming |
| PPT/screenshots/final English ETRI report | Deferred until baseline verification complete | Required next phase; no layout work now |

No further permission is required for the already-approved seven-file application and verification. No unapproved RTL/configuration changes are proposed in this update. Final ZIP waits for complete official results and GUI/observability review. No partial release package has been labelled final.

## Revision entries

- BASELINE10-APPLY-C02-01 — 2026-11-01 15:49:41 KST: Applied the seven PM-approved final files. The final framer combines timer parameterization and CDC1 C02; it is not the earlier timer-only version. Functional behavior is the frozen tested candidate. Added formal English module history without changing RTL tokens, compiler directives or synthesis attributes. Checkpoint and guarded rollback reference: audit/20261101_baseline10/applied_20261101_154941_KST. APPLIED; official suite pending completion.
- BASELINE10-RUNNER-PRJ01 — retrospective entry at this review; exact edit time not asserted. Joined PRJ continuation lines before shlex parsing. Failed run155144 and before/diff retained. Saved export retest resolved121 files; subsequent official compile and completed runtime tests provide additional evidence. Runner-only; no checker/expected/DUT change.
- BASELINE10-GUI-PREP01 — preparation recorded at the review timestamp above. Added separate proposed GUI configuration, functional report and read-only WDB checks. Official XPR and active snapshot unchanged. GUI_NOT_VERIFIED; corrected ingress capture pending. Rollback consists of removing the prepared assets, without touching RTL.

## Historical entries (retained verbatim; statuses below apply at their original times)

# RELEASE09 current status — 2026-11-01T12:53:56.143670+09:00

| Revision | Category | Status | Official application |
|---|---|---|---|
| REVIEW04-C01 demux | RTL | ACCEPTED_BASELINE development | Previously accepted |
| C03/RX-C01 + PROD08-TIMER-C01 | RTL/configuration candidate | VERIFIED_SCOPED cold-start/FEC/peer | Not applied |
| RELEASE09-PREP01 | TB/runner | VERIFIED_SCOPED CDC4 unit; system probe diagnostic complete | Audit only |
| RELEASE09-DIAG02 | TB/checker | VERIFIED_SCOPED localization, not recovery | Audit only |
| RELEASE09-CDC1-C01 | New RTL candidate | IMPLEMENTED_UNVERIFIED runtime; compile/elab PASS | Not applied |
| OISL-RESET-001 | Functional finding | CONFIRMED_BUG CDC1 premature burst; acceptance still open | Candidate under test |

## RELEASE09-DIAG02 — 2026-11-01T12:53:56.143670+09:00

Run12:46 xsim_20261101_124621_KdiwnH (12:46:21–12:47:58KST), explicit2025.2. New TB files cdc1_clockstop/reset_clocks; no expected output modified. Reset-edge contrast disproves missing reset edges as actual production cause. Production probe observes correct framer CRC and first CDC1 mismatch27752.5ns. Zero-edge reset unit FAIL and16-edge control PASS retained separately. Probe ends85us, not a recovery PASS. Rollback: remove additive TB/runner only; no RTL modified in this revision.

## RELEASE09-CDC1-C01 — candidate created12:50:48.965401KST

One new RTL candidate: x_gth_logic.v. Before9177cc7cd57faebae57300f459c74224e080629265c47a78112ece6c4d9795ad; after4a2411538aa5286f08c5ed584b46a0d76725fc18bb634ac0b93291cbdccfabf3. Related OISL-RESET-001. Old: nonempty admission and valid-only writes. New: complete header/payload commit Gray counters plus accepted-write gating. Port/clock/size/pacing unchanged; initial latency/backpressure and new CDC paths are regression risks. Unit before/after pause TB compiles/elaborates2025.2, runtime NOT_RUN at this entry. No official application. Rollback candidate by selecting parent snapshot; preserve candidate/diff/logs. Any future official application needs explicit approval and hash guard.

## Presentation update

Original23October PPTX supplied by Williams during review. Native master/layout/theme/background imported; historical waveform images are not reused as current results. Draft25slides, screenshots pending. Native renderer still unavailable; same-geometryPDF preview visually checked.

---

# Current revision status — 2026-11-01T12:35:01.213466+09:00

| Revision | Category | Status | Application |
|---|---|---|---|
| REVIEW04-C01 demux | RTL | ACCEPTED_BASELINE development | Previously approved |
| CONT05-C03 TX/wrapper + QUAL06-RX-C01 | RTL candidate | VERIFIED_SCOPED cold-start/FEC/peer | Not applied |
| PROD08-TIMER-C01 | Parameter propagation candidate | VERIFIED_SCOPED run1115; reset FAIL | Not applied |
| RELEASE09-PREP01 | TB/checker/runner/docs/presentation | IMPLEMENTED_UNVERIFIED runtime; compile/elaboration scoped PASS | Audit area only |
| OISL-RESET-001 | Functional reset finding | OPEN / NEEDS_VERIFICATION root cause | No RTL fix proposed yet |

## RELEASE09-PREP01 — 2026-11-01T12:35:01.213466+09:00

Baseline PROD08 REVIEW1115, source manifest f506261d6b0eaf5e3f45ce48252cc6e2e616487d9cd5cdc1d28773c622d50947. Result source RTL is unchanged; additive audit input hashes are in RELEASE09_INPUTS.sha256. Checkpoint created at12:24:34.488245 KST. No Git commit exists.

TB/checker: add CDC4 cold/partial-reset/new-frame reproducer and system reset boundary probe; expected data is not changed. Probe CRC/GF analysis is diagnostic and does not substitute for packet acceptance. Existing TB hashes unchanged. Risk: monitor association/width/latency errors could misattribute a failure; cold-case checks and independent codeword syndromes are required before an RTL conclusion. No interface/clock/capacity/latency change to DUT.

Runner/configuration: add explicit test selection and optional waveform logging; source parent is tested run1115. Defaults select only small reset diagnostics; final eight-test suite requires explicit final selection. Relative Tcl filenames and MEM preflight retained. New runtime is NOT_RUN, pending local XSim2025.2. Compile/elaboration logs under compile_logs. No simulation result is inferred from compilation.

Documentation: update application plan stale status, signal/TB catalogs, waveform instructions, English report and23-slide draft. PDF preview is same-geometry rendered layout; native PPTX renderer unavailable in agent environment. Screenshots remain explicit placeholders. Original PDF/PPT is not overwritten.

Rollback: remove only this additive audit directory after preserving its ZIP; no official RTL restoration is required. Root REVISION_HISTORY entry may be reverted from checkpoint/REVISION_HISTORY.before.md only if no intervening user edits. All candidate application still requires Williams approval. Older entries below are preserved, not newly retested.

---

# Revision history — SDA OISL

## Status terkini — CONT05

| Revisi / temuan | Status terkini | Batas |
|---|---|---|
| PROD08-TIMER-C01 / run1115 | VERIFIED_SCOPED kandidat | Clean/FEC/peer PASS; reset sistem FAIL OISL-RESET-001. Tidak diterapkan resmi. |
| OISL-RESET-001 | NEEDS_VERIFICATION akar masalah | Dua test recovery sistem gagal CRC payload/0paket; bukan CONFIRMED_BUG RTL tanpa lokalisasi. |
| RECOVERY07-VERIFY1002 | VERIFIED_SCOPED kandidat/harness | 8 test selesai; 3 recovery800us PASS; RS9 hanyaobservasi. Tidak ada penerapan resmi. |
| REVIEW04-C01 / OISL-DEMUX-001 | ACCEPTED_BASELINE untuk pengembangan | Persetujuan pengguna eksplisit; hanya demux teruji diterapkan. Bukan hardware signoff. |
| DIAG03 / OISL-CDC-002 | VERIFIED_SCOPED | Alignment unit05:09 dan integrasi05:59; bukan CDC signoff. |
| DIAG03 / OISL-CDC-003 | VERIFIED_SCOPED | Residual/gap/16frame dan empatframe-resume05:59. |
| CONT05 / OISL-GTH-001,002 | VERIFIED_SCOPED unit kandidat | Run0654 unitPASS; belum diterapkan. |
| CONT05 / OISL-GTH-003 | VERIFIED_SCOPED kandidatC03 | Run0719 unit4096word danfulltop28marker lulus; longrun/ARQclosure belum; belumditerapkan. |
| QUAL06 run0752 | VERIFIED_SCOPED audit | XGMII/transportlong PASS; overallFAIL:RXzerosdrop danARQmaxretrydrop. |
| QUAL06-RX-C01 / OISL-GTH-004 | VERIFIED_SCOPED kandidat | Run0922 RX512/512 dan fulltop800usPASS;belumditerapkan. |
| OISL-ARQ-004 | OPEN konfigurasiSIM500cycle | 5dropsebelumACK;pembandingnormatif16frame run0922 PASS_TESTED_SCOPE;default500cycle tetapFAIL. |
| Euclid/shared-refclk/constraints | Terbuka; hardware NOT_RUN | Bukti pascasintesis baseline lama terpisah. |


Lokasi baku: root proyek. Entri diag03 di bawah merupakan **pencatatan retrospektif** berdasarkan snapshot/log, bukan tanggal edit yang direka. Tidak ada Git commit; identitas menggunakan SHA-256. Waktu Asia/Seoul (UTC+09:00). Status VERIFIED_SCOPED menyatakan bukti uji terbatas, bukan persetujuan rilis/hardware. ACCEPTED_BASELINE hanya digunakan bila persetujuan penerapan/rilis tercatat.

## DIAG03-ALIGN-01 — retrospektif, OISL-CDC-002

- Waktu edit persis tidak dicatat. Source sebelum tersedia pada run 1 November 2026 04:58; source sesudah pada run 05:09:15. Jangan memakai kedua waktu tersebut sebagai waktu edit.
- Baseline asal: audit/20261101_diag03/evidence/before.sha256 dan checkpoint/new. Hasil: after_fix002.sha256; hash per file changes_fix002.json. Log run xsim_20261101_050915_PeFDDq.
- RTL: encoder/x_gth_logic.v, encoder/x_logic_gth.v, decoder/rx_logic_gth.v. Tambahan register respons FIFO menyejajarkan data dengan valid/metadata yang sebelumnya mengambil respons berikutnya dan melewatkan kata pertama.
- Interface/clock/kapasitas/valid counter tetap. Alignment data terhadap pipeline berubah; risiko regresi reset, batas frame dan respons FIFO menjadi acceptance unit sebelum/sesudah.
- TB/model: oracle terpisah CDC1/CDC4, counterfactual source lama hanya diganti nama modul, marker72bit,37probe produksi. Model IP tetap vendor. Runner: suite diagnosis terarah, snapshot dan log unik.
- XSim2025.2: before errorsCDC1=506/CDC4=982; after keduanya0 pada32byteheader/956katapayload. CDC2 normal12468byte cocok. Produksi paket berhasil tetapi stream masih gagal padding.
- Status **VERIFIED_SCOPED** untuk alignment yang diuji; bukan closure residual atau hardware. Perubahan sudah ada pada workspace sebelum instruksi persetujuan kandidat terbaru; tidak ada catatan persetujuan rilis terpisah yang diasumsikan.
- Rollback historis: gunakan diff/checkpoint file terkait setelah mengecek perubahan pengguna; jangan otomatis restore keseluruhan workspace.

## DIAG03-RESIDUAL-01 — retrospektif, OISL-CDC-003

- Waktu edit persis tidak dicatat; setelah snapshot05:09 dan terdapat pada snapshot05:29:39 tanggal1November2026. Checkpoint sebelum: audit/20261101_diag03/checkpoint/after_alignment.
- Baseline asal: source.sha256 run05:09. Hasil: source.sha256 run05:29 dengan SHA256 manifest **1b132775ad20233af708231283fa4196533c1c6b578276e2296c932d5b028023**. Hash file lengkap pada review04/evidence/baseline_check.json dan package/evidence/snapshot_diff_0509_0529.json.
- RTL CDC2 x_logic_gth.v: tidak flush1–3byte sebagai word32valid penuh ketika FIFO kosong. CDC3 rx_gth_logic.v: tidak membuat padding saat validrendah; counter hanya bergerak pada write diterima. Interface/clock/depth tetap; residual finite dapat tertahan sampai kelanjutan stream atau reset.
- Hash CDC2: 41be9652d0b68c6742c9f54e3ed0986669aeae91280c237115ebfaea88c6cc64 → 787fc27fea597bd1a59d9b106491721837b92a13bb55b94fbda184165660421b.
- Hash CDC3: 433122abcf09508da935f2860d8a517de9b1ddfeb403bfc1952d43cfb8b51648 → a3d520eeb338db334f1cbab653c67ce18890d21f24a2723fbc7d1121451062b2.
- Risiko: klaim drain partial-word tanpa keep/end-marker tidak sah. Uji empatframe-resume diperlukan, jangan hanya memakai ukuran habis dibagi16.
- XSim2025.2 run xsim_20261101_052939_IOxDak: CDC2normal/gap12468byte cocok; rantai16frame49872byte cocok,0padding/reject,16marker interval24936bit. Produksi mismatchCDC2/3=0; demuxunderflow dan lockloss masih gagal.
- Status **VERIFIED_SCOPED** untuk normal/gap/16frame; residual/resume empatframe masih NOT_RUN. Tidak ada klaim acceptance baseline rilis baru. Rollback berdasarkan snapshot05:09/diff hanya atas keputusan pemilik baseline.

## DIAG03-CHECKER-02 — retrospektif, TB/checker/runner, tanpa RTL

- Dibuat antara snapshot05:09 dan05:29; waktu edit tepat tidak tercatat.
- TB produksi menolak PASS apabila transport mismatch, padding, illegal reject, lockloss, demux underflow/overflow; expected paket tidak berubah. Tambah trace underflow dan reproduksi demux-pause. Tambah konfigurasi16frame untuk siklus alignment lengkap; testempatframe tetap disimpan.
- Source audit_inputs SHA256 manifest05:29: **8f3a30d42be683c6bc5fb541ddaacf7c2c9328fe00a95595c3fd6509c02dcf20**. TB/model/runner exact pada frozenrun; tidak ada modelvendor pengganti.
- Runner memilih6test relevan. XPR salinan berubah oleh export Vivado (top/path/metadata); bukan perubahan XCI/XDC atau baseline resmi. DiffXPR disertakan dalam review04.
- Hasil05:29 produksi kini FAIL meskipun paket benar: checker mengungkap underflow/lockloss yang dahulu tetap mendapat bannerPASS. Demuxpause24underflow/1511byteerror. Status **VERIFIED_SCOPED** sebagai checker kegagalan tersebut, bukan DUTPASS.
- Rollback checker akan mengurangi deteksi; pertahankan bukti lama. Jangan mengubah expected untuk mengejarPASS.

## REVIEW04-C01 — kandidat terisolasi, OISL-DEMUX-001

- Waktu pembuatan aktual: 2026-11-01T05:43:18.343165+09:00 (KST); bukti audit/20261101_review04/evidence/candidate_creation.json. Waktu review mulai1November2026 05:42:22KST. Bukan pencatatan retrospektif kandidat.
- Baseline asal: run05:29 sebagaimana manifest di atas. Source demux asal e67bb29625e082aa1d0938e855504d20e67b063af31988319efe400d281b55a1. Hash kandidat 2da0fec0958ac3cc313cc91318d8b90d02b88d942c882968106ac53b35d97396; diff pada evidence/demux_candidate.diff.
- RTL hanya **candidate/rtl/demux_preamble_128.v**, start threshold1600→3117byte. Tidak mengedit gt_ex.srcs. Akar terbukti: burst meminta byte yang belum tersedia; kejadian produksi51.268µs, kata258,buf8/consume12/q0; unitpause mereproduksi pada kata132.
- Interface,clock,depth,259wordburst tetap; latency awal bertambah. Occupancy dan ARQ akibat latency harus diuji. Tidak ada perubahan constraint/IP atau upaya menutupi timing.
- TB terpisah: empatframe lalu12byte continuation diketahui pada inputCDC3; expected asli tetap. Trace demux ditambah got/expected/time. Runner mengambil snapshot beku05:29 dan overlay kandidat hanya dalam run baru. Model IP vendor tidak berubah.
- Compile/elaborasi Vivado2025.2 berhasil, bukti candidate/compile_logs. Runtime kandidat dan residual/resume **NOT_RUN**, menunggu terminal lokal; tidak menyebut hasil kompilasi sebagai simulasi.
- Status **IMPLEMENTED_UNVERIFIED**. Williams harus menyetujui penerapan setelah kandidat diuji dan hasil konkret tersedia. Baseline resmi tetap tidak berubah. Rollback: abaikan/hapus salinan kandidat; tidak memerlukan pengembalian RTL resmi.

## REVIEW04-DOC-01 — dokumentasi/bukti

- Dibuat saat review1November2026; waktu pengemasan aktual ada pada PACKAGING.json dalam ZIP. Menambahkan file ini pada root dan laporan/manifest/diff/log/TB dalam audit/20261101_review04.
- Merekonsiliasi hasil run05:29 terhadap05:09, mengidentifikasi OISL-DEMUX-001, mempertahankan ID OISL-CDC-002/003 tanpa alias baru. Source resmi, TB asli, XCI, XDC dan konfigurasi proyek tidak diubah pada reviewini.
- Status **VERIFIED_SCOPED** untuk pemeriksaan hash/log/paket; bukan verifikasi kandidat/hardware. Checksum/integritasZIP diperiksa setelah packaging. Risiko: paket merupakan tambahan bukti dengan generatedIP dependency pada baseline sebelumnya, bukanbuildmandiri.
- Rollback dokumentasi: simpan salinan riwayat dan buat revisi koreksi; jangan menghapus bukti run lama.

## REVIEW04-C01-VERIFY-01 — 1 November 2026, review mulai06:08:27 KST

- Run kandidat `xsim_20261101_055931_aRadH4`: direktori05:59:31, runtime terakhir selesai06:00:24KST. Vivado/XSim2025.2. Tidak menjalankan ulang test untuk review.
- Baseline manifest input d16fc9f00ce9a983fcc3747325fd76c6c589c3dac0a9c90e2b99a8a5aeba02c0; audit_inputs e8995b28a8d5e7ecb391342d32c0d99ad20109032092fababd7a3f34ebb0a7d2. Demux kandidat2da0fec0958ac3cc313cc91318d8b90d02b88d942c882968106ac53b35d97396. XPRsnapshot berubah saat export; seluruhRTL/inputaudit cocok.
- OISL-DEMUX-001: demux-pause0error/underflow; produksi4000byte/2paket,MGMT1,ACK5,NAK0,outstanding0;transport mismatch0,lockloss0,underflow/overflow0. TB produksi persis sama dengan run05:29 yang gagal.
- OISL-CDC-003: empatframe12468byte dengan4byte tertahan dilanjutkan12byte C0..CB;akhir12480byte identik tanpa padding/reject. Menutup kekurangan bukti residual/resume dalam skenario ini.
- Status kandidat sekarang **VERIFIED_SCOPED**, menggantikan IMPLEMENTED_UNVERIFIED pada entri sebelumnya dalam cakupan test tersebut. **Belum ACCEPTED_BASELINE**, belum diterapkan. File resmi demux tetap e67bb29625e082aa1d0938e855504d20e67b063af31988319efe400d281b55a1.
- Dampak terukur: lockacquisition3858→5038ns,demuxoccupancy maksimum99→194word;tidak mengubah port/clock/buffer. Risiko full-topGTH,reset/kapasitasluarinterval dan timing belumtertutup. Fulltop/injection/peer/sintesis/timing/hardwareNOT_RUN pada kandidat.
- Bukti: audit/20261101_review04_run0559/package/AUDIT_REPORT.md dan candidate/runs/.../candidate_*/console.log. Laporan/paketbaru tidak menimpaZIPreview04 sebelumnya. Rollback kandidat: tidakapply;baseline resmi belumberubah. Penerapan memerlukan persetujuanWilliams sesuai instruksi eksplisitnya.

## CONT05-ACCEPT-01 — penerapan REVIEW04-C01 yang disetujui

- Waktu aktual 2026-11-01T06:32:35.967571+09:00 KST. Persetujuan: pesan pengguna LANJUTAN PROYEK bagian A, mengizinkan hanya demux_preamble_128.v hash2da0…7396. Salinan teks persetujuan dan hash lengkap pada audit/20261101_cont05/evidence/acceptance.json.
- Asal SHA256 e67bb29625e082aa1d0938e855504d20e67b063af31988319efe400d281b55a1; hasil 2da0fec0958ac3cc313cc91318d8b90d02b88d942c882968106ac53b35d97396. File resmi diverifikasi identik kandidat teruji run055931_aRadH4.
- Checkpoint file asal dan riwayat: audit/20261101_cont05/checkpoint; manifest sebelum/sesudah dan unified diff: evidence/before.sha256, accepted.sha256, accepted_demux.diff. Perubahan workspace lain tidak ditimpa.
- RTL: hanya ambang mulai burst1600→3117byte dan komentar sesuai kandidat yang disetujui. Interface,clock,kapasitas tidak berubah; latency RX bertambah sekitar1.18µs pada test sebelumnya. Bukan perubahan durasi frame TX.
- Status ACCEPTED_BASELINE untuk pengembangan. Bukti runtime: REVIEW04-C01-VERIFY-01. Full-top GTH/timing/hardware belum ditutup. Rollback hanya melalui diff/checkpoint setelah keputusan pemilik, bukan restore workspace massal.
- TB/checker/runner baru CONT05 terpisah dari RTL resmi: oracle adapterTX/primitiveTX/primitiveRX/adapterRX, occupancytrend, metadata segmen/MGMT, observasi panjang. Tidak mengubah TB demo asli. Model vendor tetap; belum ada kandidat RTL GTH.

## CONT05-DIAG-01 — review run0642 dan kandidat GTH

- Waktu pencatatan 2026-11-01T06:56:26.640836+09:00; waktu kandidat tepat pada audit/20261101_cont05/evidence/gth_*candidate.json. Run064221_eSYOeM selesai06:46:50KST, Vivado/XSim2025.2.
- RTL resmi hanya demux yang sudah diterima. OISL-GTH-001 kandidat register-only TX, OISL-GTH-002 kandidat direct simulation wrapper; IMPLEMENTED_UNVERIFIED, bukan ACCEPTED_BASELINE. Hash/diff asal/hasil pada JSON/diff tersebut; sourceasal snapshotrun0642.
- Bukti: unitTX128word/126mismatch; fulltopFAIL500µs; produksi tanpaGTH PASS4000byte,MGMT1,ACK5,outstanding0,311frame lengkap,0transporterror/lockloss/underflow. Rawlogs audit/20261101_cont05/runs/xsim_20261101_064221_eSYOeM.
- TB/checker terpisah: metadata1900/100/1900/100,MGMT477word,observasi panjang; fulltopprimitiveprobe dikoreksi ke inputIP aktual, FIFOstarvation eksplisit. Runnercandidate overlayduaRTLhanya, counterfactualwrapperbefore. Expected tidak diubah.
- Dampak: TXstartup beberapa clock; wrappercandidate menghapus resampling sim-only agar sama dengan synthesis, bukan mengubah clock/IP hardware. Risiko cadence/underflow/startup/ARQ belum diuji pada kandidat. RuntimeNOT_RUN; compile/elab parsial berhasil sesuai log.
- Rollback kandidat: jangan terapkan; hapus salinan hanya setelah menyimpan bukti. Officialdemux rollback memakai checkpoint dengan keputusanpemilik. Fulltop/timing/hardware tetapOPEN.

## CONT05-C02-VERIFY / CONT05-C03 — 2026-11-01T07:00:02.679607+09:00


## Pembaruan hasil kandidat run0654 — menggantikan status runtime NOT_RUN di atas

[HASIL SIMULASI] xsim_20261101_065447_NRbjE3 mulai06:54:47KST, selesai06:58:58KST. Vivado/XSim2025.2. Snapshot keduaRTL kandidat diverifikasi terhadap hash kandidat dan dibedakan dari source resmi (cont05/evidence/candidate0654_verification.json). Log mentah di runs/candidate0654. Tidak menjalankan ulang run untuk kemasan.

| Test kandidat | Compile/elaborasi | Actual | Status |
|---|---|---|---|
|tb_cont_tx_adapter|PASS/PASS|128accepted/128observed,0mismatch/empty|PASS_TESTED_SCOPE|
|tb_cont_wrapper_before|PASS/PASS|128word,108mismatch;firstindex9,t3616ns,actual1234560a expected12345609|FAIL: reproduksi sumberlama|
|tb_cont_wrapper|PASS/PASS|128word,0mismatch pada inputIP aktual|PASS_TESTED_SCOPE|
|tb_cont_full|PASS/PASS|watchdog500µs;7slotTXstarved;2intervalsalah|FAIL|

OISL-GTH-001 dan OISL-GTH-002 sekarang VERIFIED_SCOPED untuk reproduksiunit respective; belum ACCEPTED_BASELINE. OISL-GTH-002 kini akar masalah terbukti pada reproduksi wrapper, bukan hanya dugaan. Kandidat direct wrapper menghasilkan cycle_difference0, actualprimitiveTX→RX0mismatch sesudah acquisition, RXmemory→decoder0mismatch. Tidak ada dasar menyalahkan vendor/FEC untuk kegagalan residual ini.

**OISL-GTH-003 CONFIRMED_BUG**: adapterTX memulai tanpa cadangan yang cukup untuk burst/pause CDC2. Pelanggaran pertama t55437.330ns,seq1,wr=rd3297,avail0,upvalid0,sourceaccepted15585;output00000000 tanpa kata sumber tersedia. Log expectedxxxxxxxx berarti oracle belum memiliki kata untuk slot itu, bukan dataX dari sumber. Lima slot kosong t55437.330–55449.742ns, kemudian dua slot t105321.646/105324.749ns. Tidak membuang/resync mismatch setelahkejadian. Karena itu total138928txerror adalah divergensi lanjutan, bukan138928akar masalah.

Encoder199marker/0badinterval; adapter/actualprimitiveTX199/2bad; RX197/2bad; decoder195/2bad. Seqerror0,cadenceerror2. GTHlockloss0,slips33,lockfirst9248.491ns; txmax431/rxmax16,overflow0. PHYoracle0 membuktikan preservasi stream yang **sudah mengandung filler ilegal**, bukan kebenaran SDA. Packetfulltop belum lulus. Startup yang dilewati oracle dicatat pada rawlog; tidak diklaim lossless saatacquisition.

Kandidat berikut CONT05-C03 di cont05/reserve_candidate: tambah initialreserve780word=ceil3117/4 sebelum pengiriman pertama; kapasitas4096,clock,sequence64/66 dan cadence setelahstart tetap. Tidak mengisi nol untukflush dan tidak pause gearbox untukrefill. Ini startup latency, bukan durasiTXframe. Cadangan sekitar satu frame merupakan kebijakan implementasi konservatif untuk meredam burst; bukan requirementnormatif dan tidak menyelesaikan defisit laju takterbatas. Testbefore/after4096word dengan pauseproducer300cycle, wrap pointer; unit128word memakai START_WORDS=1 secara eksplisit untuk regresi perbaikanbypass, **bukan** bukti default780. Fulltop menguji default780. Compile/elaborasiempat testPASS; runtimeC03NOT_RUN saat pembaruan ini. Perlu bukti fulltop/occupancy/startup/ARQ sebelum penerapan resmi. Hash/diff pada cont05/evidence/gth_reserve_candidate.*.

Perintah lokal berikut: `bash audit/20261101_cont05/reserve_candidate/scripts/xsim_local.sh`. Log baru reserve_candidate/runs. Tetap menunggu hasil pengguna; tidak ada perubahan GTH resmi. Sintesis/timingimplementasi/hardware kandidatNOT_RUN.

## CONT05-C03-VERIFY-0719 — review 2026-11-01T07:30:35.096385+09:00

- Run071933_TcdkUL mulai07:19:33–07:21:04KST; Vivado/XSim2025.2. Review tanpa simulasiulang atau editRTL. Source manifest 7204aff8539ec53da1c51370ec31f41829586fd8aeaebabfe224d791acd19da5, auditinputs 8444d009dfb771726457ae8cc70cc0fe47c8d9784eb72f084876a20bb634db9d. Hashperfile pada audit/20261101_cont05_review0719/package/evidence/review0719/HASH_VERIFICATION.json.
- Status VERIFIED_SCOPED kandidat, bukanACCEPTED_BASELINE. Unit4096word,pause300cycle:0error; pembanding3072error. Fulltop75.445437µs:4000bytecocok,reassembly2packet;TX/PHY/RXerror0,starved0,28marker/0interval/cadenceerror. Checkerfullidentikrun0654gagal.
- Defaultreserve780,kapasitas4096tetap;startupTXbertambah2423.467ns,TXoccupancymax1175. Tidak mengubahclock/IP/throughputcadence; risiko longrun,reset/overflow,timeoutARQ tetap. FCSDEADBEEFtiruantermasuk2000byte.
- Tidakmengklaimtrackerdrain:21ACKlokal,ulangRXFN;finaloutstanding/replaypayloadbelumdicatat. MGMTfieldteramati,bukanassertionpayloadunik. Observasipostpacket≈161ns,tidakmencakupkejadianlama105µs. Sintesis/timingimplementasi/hardwareNOT_RUN.
- RTL:tidakadaeditreview;candidate0719/rtl memuat snapshotteruji. TB/checker/model/runner:tidakadaeditreview;frozenfiles/logdisertakan. Dokumentasi/kemasan:laporanbaru,CSV,manifest,diffdanrawlogs;hasilreviewdipisahdariresults.jsonasli.
- Rollback:officialGTHbelumditerapkan;abaikankandidat,simpanbukti. Penerapankandidatmemerlukanpersetujuanpemilik.

## QUAL06-AUDIT-01 — 2026-11-01T07:52:30.047732+09:00

- CheckpointC03run0719danofficialdemuxdisimpan;tidakadaeditRTL/XCI/XDC/clock. StatuskandidatGTHtetapVERIFIED_SCOPED,belumACCEPTED_BASELINE.
- TB/checker:salinTBdemoasli,buatend800µs/256frame/drain/postpacket100µs;deadline100/600µs,watchdog1ms. TambahXGMIIbyteoracle,segmentmetadata,MGMTidentity/payload,ARQexactreplay/trace,TXoccupancyconservationdanRXzerosunit. Oraclecadence/streamsebelumnya tetap.
- Runner:modelvendor2025.2,frozensource0719,preflightTcl/MEM,unique logs. Checksumprepared di audit/20261101_qual06/evidence/PREPARED_INPUTS.sha256. Compile/elabdiisolatedwork;runtimeNOT_RUNmenunggulokal.
- Dokumen:inventaris24Project_Doc,hash,metadata,konflikOCT4.0.0 vsOISL2.1.2,proposalholdoff/PNTdipisah. Cakupanvisualterbatasdicatat,bukanclaimsemuamanualdibaca.
- DampakRTL/interface/latency/cadence/buffer:tidakada perubahanbaru. TBstimulusdiubahuntukIDLEpanjang/DATAresume;expectedpakettetap. Rollback:abaikanfolderauditbaru,simpanlog;officialtetaptidakberubah. Sintesis/timing/hardwareNOT_RUN.

## QUAL06-REVIEW-0752 / QUAL06-RX-C01 — 2026-11-01T08:00:49.464001+09:00

- Run075200_bP03fz07:52:00–07:56:56KST,Vivado/XSim2025.2. Source/auditmanifest qual06/evidence/run0752_hash_verification.json. SourceC03 tidakdiubah. RX512in448out,firstindex64;long800.001694µs:2packetXGMII4000byte,318TXmarker,0streamerror;5ARQdrops→overallFAIL.
- OISL-GTH-004 candidategth64b66b_rx.v menghapusendburstberbasis8zero;tetapstartguard/prefill16,port/clock/depth. Zerojadiwordpayload,latencyzero tidakditahan. Hashwaktu/diff qual06/evidence/rx_candidate.json/.diff. StatusIMPLEMENTED_UNVERIFIED,belumofficial.
- KonfigurasiTBterpisahOISL-ARQ-004:SIM_SCALE0/CFG1normatif16frame,setelahtrace500cycles membuktikan timeoutdrop sebelumACK. BukanpenggantianhasilFAILatauubahdefaultRTL. ARQ-004berbedadariARQ-003SIM_MODE0 padaverify02.
- TB/checkerRXidentikreproduksilama;normativelongmenambahdefparam saja,oraclesketatdipertahankan. Compile/elab2025.2PASS;runtimekandidatNOT_RUN. Rollback:abaikankandidat;C03/officialtidakberubah. Hardware/timingNOT_RUN.


## QUAL06-RECHECK-01 — 2026-11-01T09:16:16.317021+09:00

Dokumentasi/evidence saja; status VERIFIED_SCOPED untuk pemeriksaan identitas. Run0752, hash source/audit input dan log dicocokkan ulang. Tidak ada baseline RTL baru, tidak ada runtime kandidat baru. File RUN_RECHECK.md dan recheck_latest_run.json ditambah; hasil FAIL sebelumnya dipertahankan. Rollback dokumentasi: gunakan ZIP REVIEW0752 08:03:57 yang tetap disimpan.


## QUAL06-RX-C01-VERIFY0922 — 2026-11-01T09:45:01.704332+09:00

Status **VERIFIED_SCOPED kandidat**, bukan ACCEPTED_BASELINE. Pengujian lokal09:22:20–09:27:10KST pada XSim2025.2. Tidak ada edit RTL baru; kandidat RX yang dibuat07:56 terverifikasi:512/512word,0mismatch. Fulltop clean800.001694µs,2paket4000B,313frame lengkap,ACK5hit1,drop/retry0,tracker0. Konfigurasi TB normatif16frame dicatat terpisah dari RTL; default500cycle masihFAILhistoris. Hash asal/hasil dan diff RX pada qual06/evidence/rx_candidate.json/diff, snapshotrun0922 pada manifest. Port/clock/depth tetap; nol sah kini dilepas, capture berakhirreset/lockloss; risiko pola/reset/peer/error lain belumditutup. Log runs/rx0922. Rollback kandidat: pilih source RX hash6235e681ca406244cc78336b72a90179da6568ef5ccc12416cfc62c05fe078de dari snapshotrun0752; tidak perlu rollback baseline resmi karena tidak diterapkan. Dokumentasi dan review diperbarui; log mentah lama tidak diubah.


## RECOVERY07-PREP01 — 2026-11-01T09:57:46.482380+09:00

Status IMPLEMENTED_UNVERIFIED untuk harness/configuration recovery baru; baseline kandidat tetaprun0922 VERIFIED_SCOPED, belumresmi. RTL:none. TB/model:8skenarioterarah,physicalRAMmappingDATA/MGMT,oraclepreserved;runner/preflight:newtests. Konfigurasi DEMO_LOOPBACK_16F sama0922, bukanubahdefault500cycle. Checkpointmanifestsource/TB/runnerdanofficialdisimpan. Compile/elablogpertestdi audit/20261101_recovery07; runtimebaruNOT_RUN, smokeagenfailedbeforetimeadvance. Risiko:injeksi/harnessbelumruntimevalidated,resetadapterunitbukanfullpipeline. Rollback:abaikanRECOVERY07,run0922utuh. Tidakmengubahclock/IP/constraints,tidakprogramFPGA.


## RECOVERY07-VERIFY1002 — review 2026-11-01T10:24:12.174366+09:00

Run xsim_20261101_100259_hricug,10:02:59–10:16:55KST,XSim2025.2. StatusVERIFIED_SCOPED. RTLidentikrun0922;hashsource/auditinputdi recovery07/evidence/run1002_hash_verification.json. TidakadaeditRTL/TBuntukreview. Header/payloadRS0..8symbolPASS;RS9lane0mismatch11byteobservasidiluarkoreksi;RXreset/lockloss1536wordPASS;controllernegativeexpectedMGMTdrop1;fulltopACKDATAhilang,ACKMGMThilang,CRCfaultmasing-masingreplay1identik,ACK5,drop0,tracker/deletequeue0,2paket4000B,MGMT1,800us. Bataspeer/headerbalik,serialFEC/fullpipelinereset/hardwarebelumditutup. Profil16frametetapkandidatkonfigurasi,default500cycleFAILhistoristidakditutup. Log runs/recovery1002;rollbackpilihcheckpointrun0922,tanpaperubahanbaseline resmi. RekomendasipenerapandevelopmentscopedmenunggupersetujuanWilliams.


## PROD08-PREP01 — 2026-11-01T10:39:56.712033+09:00

StatusIMPLEMENTED_UNVERIFIEDkandidat. Fase1tigafileGTH/RXrun1002VERIFIED_SCOPEDtetapterpisah/belumditerapkan. Fase2PROD08-TIMER-C01:top,sda_encoder,ethernet_fso_framermeneruskanparameterARQ eksplisit,preserveddefaults. Manifest/diff APPLICATION_FILES.json. TB/model:productionRSsymbolfault8/header8/9plusindependentrootoracle,duaGTHpeerheader,resetepochunik/lockloss+coordinatedreset. Runnercompile/export/preflightnewtests2025.2. Hasilcompilepertesttercatat,runtimeNOT_RUN. RisikopeerRTT/queue,resetpartialflush,FECframeidentity/injectiontimingperluactualrun. Rollbackkandidat:abaikanPROD08,run1002utuh;officialhashdicekbelumdiubah. TidakXCI/XDC/clock/timingexceptionatauFPGAprogramming.


## PROD08-REVIEW1115 — 2026-11-01T12:01:45.889431+09:00

Run11:15:02–11:55:56KST,xsim_20261101_111502_lgiPmq,Vivado/XSim2025.2. Source/TBidentikprepared;manifesthashprod08/evidence/run1115_hash_verification.json. Enamtestcoldstart/FEC/peerPASS_TESTED_SCOPE,duaresetFAIL0packet/30NAK/25replay/5drop. FEC8corrected,RS9selectedpatternCRC/ARQrecovery;peerheaderrealACK/NAKanddrain. StatusparameterizationVERIFIED_SCOPEDcoldstart;OISL-RESET-001NEEDS_VERIFICATIONrootcause. TidakeditRTL/TB/runneruntukreview;hanyadokumentasi,evidence,applicationplan. Penerapanfase1/fase2tetapmemerlukanpersetujuan;resetacceptanceharusditutupuntukklaimrecoveryfullpipeline. RollbackkandidatabaikanPROD08,run1002utuh;officialunchanged. Timing/hardwareterpisah.

## RELEASE09-CDC1-C02 — 2026-11-01T13:21:37.876265+09:00

Status: IMPLEMENTED_UNVERIFIED; separate candidate, not official. Parent C01 run1316. Two RTL changes: header admission readiness in ethernet_fso_framer and independent header FIFO acceptance in x_gth_logic. Evidence and risks: audit/20261101_release09/RUN1316_REVIEW.md. Hashes and before/after diff: cdc1_c02_candidate/BASELINE.json and diff/. Diagnostic checker qualifier revised separately to actual valid-only header contract; no packet oracle changes. Runtime pending. Rollback: discard C02 overlay, retain C01 checkpoint. C01 clean/pause scoped PASS does not close reset failure.

## RELEASE09-REVIEW1324 / RELEASE09-TB02 — 2026-11-01T13:29:20.857956+09:00

Retrospective review of run1324 (13:24:42–13:26:27 KST): C02 diagnostic header384/384 and CDC1 mismatch0;1packet2000B,3ACK,MGMT1; no full acceptance. Two full tests failed harness precondition at4305248ps. C02 source unchanged from run; status VERIFIED_SCOPED for diagnostic prefix only. TB02 modifies bounded FIFO filling using observed full instead of nominal1024 depth, same16header/478payload expected; runtime NOT_RUN. Checkpoint/diff under cdc1_c02_candidate. No official RTL changes. Rollback prepared TB using checkpoint/tb_release09_header_full.before_TB02.sv; retain run1324 unchanged.

## RELEASE09-REVIEW1338 — 2026-11-01T13:42:53.803336+09:00

Run1338 13:38:34–13:40:19KST. C02 RTL unchanged versus1324; TB02 now VERIFIED_SCOPED by vendor full test, expected16header/478payload unchanged. C01 negative defect reproduced. C02 pause PASS;85us diagnostic has1packet,MGMT1,3ACK. Full acceptance remains NOT_RUN, candidate not applied. File hashes/checker comparisons: evidence/run1338_review.json. Runtime logs: runs/c02_1338. Rollback: TB02 checkpoint.before_TB02; C02 RTL checkpoints retain C01. No official source modification.

## RELEASE09-REVIEW1344 — 2026-11-01T14:09:00.485673+09:00

C02 RTL/TB/runner unchanged versus run1338. OISL-RESET-001 VERIFIED_SCOPED for controlled system reset and lock-loss followed by reset. Four tests PASS; source hashes/results/checker bounds in RUN1344_REVIEW.md and evidence/run1344_review.json. No official application. Fault/peer regression and autonomous lock-loss recovery NOT_RUN. Rollback unchanged: discard separate overlay, retain original checkpoint; no shared baseline changed.

## RELEASE09-REVIEW1420 2026-11-01T15:11:15.424732+09:00
C02 regression5tests PASS on source identical to1344. Candidate frozen/unapplied. See audit/20261101_release09/REVISION_HISTORY.md. Contract observer separate runtimeNOT_RUN. Presentation deferred.

## RELEASE09-REVIEW1513 — 2026-11-01T15:20:00.959116+09:00
Observer only; RTL unchanged vs1420, underlying packet checker identical.322bursts,maxQ48,allheader assertions and clean2packet acceptance pass. Run15:13:02–15:17:52KST. Scoped evidence,notformal/hardware proof. Status VERIFIED_SCOPED. Source freeze unchanged/unapplied; rollback removeobserver only; earlier logs preserved.

## BASELINE10-PREP01 2026-11-01T15:36:32.654409+09:00
PROPOSED only;7finalfiles andprofiles awaitingWilliamsapproval. Officialsource unchanged;preparedrunner nooverlay. See audit/20261101_baseline10/APPLICATION_PLAN_FINAL.md and RELEASE_STATUS.md.

## REPORT11-TB01 / REPORT11-GUI01 / REPORT11-RUNNER01 — 2026-11-01T17:09:24.372908+09:00

Original report TB retained. Added optional external completion and one-packet report monitor, explicit16frame timer, one source trigger,2000byte/1900+100/XGMII/MGMT/replay/drain/cadence acceptance. Corrected historical internal-duration label. Added demo_release fileset while preserving sim_1. Five ingress lookup paths corrected and counter logging added. Modem RTL/XCI/XDC unchanged. Compile/elaboration passed; runtime pending. Runner source-containment failure170557 preserved; explicit sim_1 selection in snapshot export is under retest. Hashes/diffs/checkpoint: audit/20261101_report11. Risks: GUI/CLI source resolution and one-packet checker adaptation require runtime confirmation. Rollback: restore only recorded TB/XPR/runner files if current hashes match report11, preserving later user changes. No baseline10 hardware timing claims changed.

## REPORT11-VERIFY01 — 2026-11-01T17:17:33.009729+09:00

Main report profile tb_etri_main on official source: VERIFIED_SCOPED, run170951 completed17:14:46KST. Exactly one2000-byte packet,1900/100segments,MGMT1,ACK3,outstanding/delete0,318cadenceframes;800.001694us observation. Missing waveform paths0 and ingress values confirmed in completed WDB. GUI batch export/compile/elaboration passed; interactive GUI NOT_RUN. Runner fileset correction closed the source-containment failure170557 without relaxing containment. No modem RTL change or synthesis rerun. Counter/waveform/report evidence: audit/20261101_report11. Rollback references remain checkpoint/diff; do not overwrite later user changes.

## DEMO12-DOC01 / DEMO12-GUI01 — 2026-11-01T17:37:24.171632+09:00

Documentation closure following auditor review of REPORT11: CHANGES.json now records VERIFIED_SCOPED closure against run170951 while retaining original IMPLEMENTED_UNVERIFIED history. The report TB watchdog rationale is clarified as a single-packet scenario; superseded two-packet text remains historical. Ordinary comments only, inverse-replacement byte proof; no functional tokens/directives/attributes changed. No simulation/synthesis rerun. GUI saved-WDB opening script is non-driving and batch-tested; interactive GUI NOT_VERIFIED. Added precise counter definitions and real-screenshot checklist. Source/checkpoint/diff/hash: audit/20261101_demo12. Rollback restores comment bytes only after matching current hash; no modem rollback is involved.


## WAVE17-MAPPING-01 / WAVE17-GTH-01 — 2026-11-01 KST
Separate waveform/report profiles and production-derived GTH continuation candidate. Official RTL and original TB files remain unchanged. Compile/elaboration passed; continuation runtime remains NOT_RUN. See audit/20261101_wave17/REVISION_HISTORY.md for timestamps, hashes, rollback and acceptance criteria. Previous WAVE16 burst-mask result is scoped; absolute-frame-coordinate contract remains OPEN.


## WAVE18-REVIEW-01 / WAVE18-GTH-CONFIG-01 — 2026-11-01 KST
Frozen WAVE17 run195137 failed TX starvation at86.954850us while source remained active. Exact recorded GTH user period3009ps identified an inconsistent TB reference-clock configuration (#3.103ns versus XCI156.25MHz). Separate TB-only candidate uses#3.200ns; identical oracle/stimulus/thresholds; compile/elaboration passed, runtime NOT_RUN. No official RTL/XCI/XDC changes. See audit/20261101_wave18/REVISION_HISTORY.md, AUDIT_REPORT.md and clock_candidate/TB_CONFIG.diff. Original failure and all668 input hashes retained.


## WAVE18-GTH-CONFIG-01 runtime closure — 2026-11-01T20:02:54.653881+09:00 — VERIFIED_SCOPED
Local runs195826 and195904 pass52frames/162084RXbytes with matching685input hashes each. No RTL/original TB edits or duplicate run by agent. Prior WAVE17 failure remains historical. Detailed finite-window limitations and occupancy trends: audit/20261101_wave18_review/AUDIT_REPORT.md.


## REPORT19-EVIDENCE-01 — 2026-11-01T21:20:26.427804+09:00 — VERIFIED_SCOPED read-only review
Exactly25activeoriginalTBmatrix with current/historical separation; long-window WDB edge/count diagnosis; originalslidecorrections includingpage38(475×4=1900),preambleandLPC; formaldecoder/egress/FEC/ARQdraft. NoofficialRTL/TB/IPchanges; noidenticalsimulation/synthesisrerun. PMresidualclarificationpreserved: CDC2carriesresidualbytes; unusedFIFOstorage lanesarenottransmittedpadding. Seeaudit/20261101_report19.


## CDC-ETRI-RESTORE-20261102-01 — 2026-11-02T04:08:39.375945+09:00 — IMPLEMENTED_UNVERIFIED
PM explicitly requested restoration of CDC2/CDC3 and their original ETRI simulation behavior. Restored exactly four RTL/TB files from Keseluruhan Codingan Vivado SDAOISL10Gto10G.zip (SHA-256 4f4e83c7f391f33784bfe18b0678609a8a8303a6399b6ed0794437b513d0469f). Original comments, attribution and revision history preserved byte-for-byte; this external entry records restoration without altering archive identity. XCI/XDC/XPR unchanged. Details/checkpoint/diff: audit/20261102_cdc_restore_040839. Historical DIAG03 CDC2/3 fixes are superseded in the live workspace by this PM-requested restoration, not erased from evidence. Main170951 and regression155406 remain historical results on their own hashes; they are NOT acceptance evidence for this restored workspace. Synthesis equivalence also requires reassessment. Known review concerns: historical tail flush, finite-test counters, binary cross-domain counter and full protection require separate review; no new functional PASS or hardware signoff. Rollback must compare current hashes with CHANGES.json after hashes before restoring recorded before files; never overwrite later edits.


## WAVE-REVIEW-20261102-DEMUX01 / VIEWS01 — 2026-11-02T04:43:33.553678+09:00
Official tb_demux_decoder.v only: preserve original stimulus/DUT, replace delayed frame-label alias with accepted-preamble event monitor, add full byte oracle and bounded watchdog. Compile/elaboration PASS, new runtime BLOCKED by pre-simulation XSim Tcl exception. Historical WDB on identical pre-change RTL/TB independently checked:4preambles/1036words/12432bytes,0mismatch.26historical WDB/WCFG views rebuilt with correct bin radix, explicit actual profile mapping and blank-value limitations; GUI visual NOT_VERIFIED. No RTL/IP/XPR modification. Checkpoint, hashes, stimulus equality and logs: audit/20261102_wave_review. Rollback TB only after matching its after hash; restore before/tb_demux_decoder.v, preserving later edits.


## DEMUX-COUNTER02 — 2026-11-02T05:00:52.162226+09:00 — IMPLEMENTED_UNVERIFIED
Non-driving TB presentation change: independent input/output scenario identities, valid-qualified live word/byte counters, explicit input boundary crossing and tail labels. Original stimulus and complete byte oracle preserved; no modem RTL/IP/project change. Compile/elaboration PASS in run050007_580846; runtime BLOCKED before time advance by Tcl exception. New WCFG separate; GUI not verified. Checkpoint/diff/hash/rollback: audit/20261102_demux_counter02.


## BASIC23-MAIN-MON01 / RUNNER01 / GUI01 / WAVE01 — 2026-11-02T05:58:23.124962+09:00
Official modem RTL/XCI/XDC unchanged from the BASIC23 checkpoint; PM-restored CDC2/CDC3 remain. Main report TB stale internal CDC monitor references caused an actual elaboration failure. Updated non-driving observation to restored signals and accepted FIFO requests; main configuration, packet/MGMT oracle and final acceptance blocks are byte-identical (ACCEPTANCE_UNCHANGED.json). Main compile/elaboration now PASS. All25 original TB compile/elaboration PASS on the current snapshot; no runtime functional promotion. Explicit runner build-only option added; control/timestamp waveform radices corrected. Official XPR adds report_modules and normalizes simulation metadata; design top and demo_release main top unchanged. Runtime smoke remains BLOCKED before time advance; documented nosignalhandlers attempt did not resolve it. IPv4 socket EPERM is observed but not established as the XSim causal root. Interactive GUI inaccessible; waveform value sampling is batch-only. Checkpoints, hashes, diff, logs and rollback references: audit/20261102_basic23. Status IMPLEMENTED_UNVERIFIED for current runtime; VERIFIED_SCOPED for stated build/value-read scopes. No FPGA programming. Rollback only listed changed files after matching their after hashes; preserve later edits and all evidence.

BASIC23-WAVE01 validation addendum 2026-11-02T06:04:51.023113+09:00: Vivado2025.2 rejects add_wave -radix real; realtime signals now use native format. Offline validation omits live log_wave operations and uses actual escaped generate identifiers. main170951 review:170paths/1530samples/0blank/0read errors; still historical scope. Failure logs retained in main_wave_review.

## REPORT-PRIORITY-20261102-065703 — 2026-11-02T06:57:03.861645+09:00
Documentation-only PM priority update: original module TB reporting first; original system TB selected; wrapper/audit diagnostics deferred. No RTL/IP/XPR change; no tests rerun. Checkpoints and hashes: audit/20261102_report_priority_065703/CHANGES.json. Functional findings remain open.

## REPORT24-TOP01 / ARQ01 / RS01 / WAVE01 — 2026-11-02T07:35:51.046876+09:00
Explicit original-top one-packet profile; accepted input scoreboard; supplemental production CRC/RAM and FEC-chain TBs. Modem RTL, XCI/XDC unchanged. Compile/elaboration completed; runtime NOT_RUN, pending local execution. Checkpoint and hash/diff in audit/20261102_report24. Rollback only changed original TB after checking subsequent edits; do not roll back modem source. Waveform layouts prepared, values/GUI pending.

## REPORT24-REVIEW02 — 2026-11-02T08:33:22.784639+09:00
Reviewed local run20261102_075031: three scoped passes, four waveform setup blocks before run. Raw host TIMEOUT preserved. No source/configuration change and no rerun. Evidence: audit/20261102_report24/review_20261102_083322/LOCAL_RUN_REVIEW.md. Rollback: prior PREPARED package retained.

## REPORT25-WAVE01 / RUN01 / TIME01 — 2026-11-02T08:46:30.403388+09:00
Pending-only scope/parameter enumeration and fail-fast runner prepared. Original controller log suffix corrected ns to ps only, inverse equivalence proven. No modem/IP/XPR changes. Existing RS/ARQ clean WDB layouts and selected values read successfully without rerun. Agent live probe blocked before Tcl script. Four live setups and runtimes remain pending local execution. Checkpoint/diff/hash: audit/20261102_report25. Rollback only controller display edit after checking current hash; preserve historical run075031.

# REPORT25-WAVE02 — 2026-11-02T08:49:13.476096+09:00

[FAKTA SUMBER] Local runs084716 and084725 found the actual escaped root /\tb_RS(CHANNEL_ERROR=1) and read CHANNEL_ERROR=1 correctly. Failure was at add_wave, not root discovery or DUT. Passing an object path string directly allowed add_wave to interpret the escaped identifier and its whitespace as multiple items. The correction passes [list $obj], preserving the full actual path as one item. No prefix guessing, no removed signals, no RTL/checker/mask changes.

[HASIL SIMULASI / TOOL VALIDATION] Vivado2025.2 opened the finalized setup WDB from run084725. The corrected script resolved all42 signals in seven groups and saved WCFG: WAVE02_PASS_ACTUAL_PARAMETERIZED_WDB. This validates the actual parameterized waveform setup, not FEC runtime or correction. Log: logs/wave02_console.log. Earlier failure logs retained. Local runner fail-fast exited in about3seconds; the raw XSim exit0 is correctly classified SETUP_FAILED by the explicit marker.

Next: bash audit/20261102_report25/scripts/xsim_local.sh. The runner still validates all four pending snapshots before their runtime. The three earlier passing cases remain excluded. Other parameterized tops are pending actual local setup validation; do not claim they have run. Current script/input manifest updated explicitly; original manifest checkpoint retained. The agent pre-script exception remains an external runtime limitation.

Only waveform Tcl and accompanying setup assets/manifest/docs changed. Rollback: restore checkpoint/WAVE02/wave_setup.tcl and its INPUTS.json together after checking subsequent edits. The setup-only WCFG is labelled accordingly and is not a runtime screenshot source.

# REPORT25-WAVE03 — 2026-11-02T08:52:12.934394+09:00

Local run20261102_085051: setup RS mask, ARQ CASE1 and ARQ CASE2 passed. Top resolved and BASIC_REPORT=1 was read correctly, but setup failed at basic_report/input_bytes. No runtime phase began. Root cause: actual XSim elaboration flattens the generate block counters into escaped dotted names (backslash basic_report.input_bytes followed by terminating space). The script expected a slash-separated generate hierarchy.

The correction adds explicit aliases to the exact objects recorded in setup_report_top_objects.txt, retaining actual object names for add_wave/logging. No RTL, TB, expected data, clocks, IP or runner acceptance changed. All four setup WDBs were opened in Vivado2025.2 and the complete corrected setup ran successfully: RS42signals/7groups; ARQ CASE1 and CASE2 each43signals/6groups; top32signals/6groups. Effective parameters1/1/2/1 matched. Evidence: logs/wave03_console.log and *_wave03_objects.txt. This is actual hierarchy/WCFG verification, not runtime data correctness or interactive GUI review.

Next local action: bash audit/20261102_report25/scripts/xsim_local.sh. Four pending configurations only; no rerun of the three passing historical functional tests. Snapshot/source hashes are unchanged; only the waveform script and explicit manifest changed. Agent live execution remains blocked by the already recorded pre-script environment exception; no identical attempt repeated. Initialization WDBs and setup-verified WCFGs are labelled as such, not used for data screenshots.

Checkpoint: checkpoint/WAVE03; diff: wave03.diff. Restore script and matching input manifest together only after checking intervening changes. Previous logs retained.

## REPORT25-REVIEW085246 — 2026-11-02T08:57:30.828228+09:00
All four setups and runtime completed; ARQ CASE1/2 scoped PASS, original-mask RS39word mismatch and top retry-drop fail. WDB selected counters verified; CASE2 replay-cause monitor X explicitly open. No RTL/TB/config changes or rerun. Evidence: audit/20261102_report25/review085246.

## BASELINE26-CDC3-01 / OBS01 / FEC01 / MON01 — 2026-11-02T09:49:07.374902+09:00
WDB proved eight synthetic CDC3 FIFO bytes at offset1976 after acquisition; official CDC3 preserves residual and removes finite780read cap. Official top adds non-driving accepted stream trace and rejected-write assertion. FEC codeword mapping proves9symbols in one lane per original-mask frame; separate three-entry mask demo prepared without changing original. Separate CASE2 monitor uses actual timer_tick_en. Three affected configurations compile/elaborate; runtime pending. Checkpoint/diff/hash: audit/20261102_baseline26. Rollback only listed official files with hash guard; preserve later user changes. No IP/XDC/clock change.

## BASELINE26-REVIEW-095201 — 2026-11-02T09:55:40.327454+09:00
Runtime review only; no implementation inputs changed. FEC demonstration and CASE2 monitor passed; original top failed retry-drop. First remaining stream divergence is a repeated four-byte word at encoder-to-CDC2 byte 9344. See audit/20261102_baseline26/RUNTIME_REVIEW_095201.md. Preserve historical PREPARED and failed results.

## BASELINE27-CDC2-01 / WAVE01 / FECMAP01 — 2026-11-02T10:22:31.383232+09:00
Only CDC2 output-valid qualification changed after WDB proved a rejected empty read was emitted as duplicate. No residual/clock/IP change. Checkpoint and hash in audit/20261102_baseline27. Compile/elaboration PASS; runtime BLOCKED_AGENT_ENVIRONMENT before time0. Waveform batch validation passed; GUI unverified. Original error.mem retained, exact byte-zone discrepancy mapped; reduced-mask run historical only. See CURRENT_STATUS.md and README_RUN.md. Rollback: compare current hash to CHANGES.json before restoring checkpoint; never overwrite later user edits.

## BASELINE27-REVIEW-102343 — 2026-11-02T10:26:45.689888+09:00
Original top BASIC_REPORT=1 passed at58.228273us:2000input/outputbytes,1900+100,MGMT1,ACK3,NAK/replay0,finaltracker/delete0. Accepted-stream oracle errors0; priorCDC2duplicate absent. No implementation inputs changed. Original-mask FEC remains FAIL; GUI/hardware unverified. See RUNTIME_REVIEW_102343.md.

## FEC28-INJECT-01 / FEC28-TB01 — 2026-11-02T10:43:40.128977+09:00
Production injector frame-relative byte mask addressing; original48wordmask unchanged. Valid-low holds position, each MSB lane wraps at3117bytes. Interface/clocks unchanged. Supplemental TB independent zone/latency/XOR/coverage checker plus symbol trace; original decoded-data oracle retained. Compile/elaborationPASS; runtimeBLOCKED_AGENT_ENVIRONMENT before time0. Checkpoint,diff,hash in audit/20261102_fec28. BASELINE27 clean result preserved separately; no current-source top equivalence claim. Restore checkpoint only after checking current hash against CHANGES.json; never overwrite later user edits.

## FEC28-REVIEW-104414 — 2026-11-02T10:47:16.320414+09:00
Original mask injection runtime completed. Three-zone/address/XOR contract passed on recorded15584bytes; all48maskwords covered per frame. Decoder failed36payloadwords; measuredlane2has9symbolerrors in each of4targetcodewords, otherlanes6 and recovered. No implementation edits or reruns. Original-mask FEC remains FAIL; no replacement stimulus authorized. See RUNTIME_REVIEW_104414.md.

## FEC29-MODEL-01 / WAVE01 — 2026-11-02T11:02:51.247458+09:00
Read-only causal diagnosis of original FEC28frame0. Independent GF/polynomial,PRBS,LPC model matches actual coding/transport/decoding; EEA/Chien/Forney and255BRAMreads match in lanes0/2 after explicit trailing-zero syndrome convention. Lane0sixerrorscorrected; lane2nineerrorslocatorhasnoroots and fails in both model andRTL. No newRTL/TB/mask/IP change,no simulation rerun. WCFGexpanded11groups92signals,batchvalidated; GUIunverified. Evidence in audit/20261102_fec29. No rollback required for analysis-only additions.

## SOURCE30-PACKAGE-01 / HISTORY31-PDF-01 — 2026-11-02T11:20:35.957484+09:00
SOURCE30 packaged current files without modifying RTL, TB, IP, XDC, MEM or XPR. Issued archive: SDAOISL_SOURCE_20261102_111834_KST.zip; 169 copied source/configuration/reference files; 129 comparable FEC28 input hashes match. The package is an organized source handover, not a standalone generated Vivado project. HISTORY31 adds a current-status supplement to the prior complete REPORT24 revision-history PDF, preserving that PDF unchanged as the historical annex. No simulation rerun or hardware action. Checkpoint: audit/20261102_revision_history_update31/REVISION_HISTORY.before.md. Rollback: remove only this documentation entry after checking later edits; no functional rollback required.
