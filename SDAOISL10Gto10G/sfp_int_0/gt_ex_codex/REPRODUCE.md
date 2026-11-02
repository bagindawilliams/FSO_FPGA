# Reproduksi

Jalankan dari root workspace. Semua script menyimpan hasil pada audit/20261101; jangan menjalankan ulang jika ingin mempertahankan log run lama tanpa menyalinnya dahulu. Tidak ada patch RTL asli. `prepare.py` menyalin proyek ke area audit, bukan mengubah konfigurasi asli.

```bash
python3 audit/20261101/scripts/prepare.py
source /2025.2/2025.2/Vivado/settings64.sh
```

Ekspor dilakukan dari `audit/20261101`:

```bash
/2025.2/2025.2/Vivado/bin/vivado -mode batch -source scripts/export.tcl -log evidence/export.log -journal evidence/export.jou
```

`prepare.py` menyalin gt_ex.srcs/gen/ip_user_files/imports dan sda_codec_0.gen. Seluruh salinan berasal dari snapshot workspace yang sama. Tidak ada pencampuran dengan ZIP1255.

Kembali ke root:

```bash
python3 audit/20261101/models/rs_reference.py
python3 audit/20261101/scripts/extract_cdc.py
python3 audit/20261101/scripts/run.py compile
python3 audit/20261101/scripts/elaborate_audits.py
python3 audit/20261101/scripts/run.py tb_SDAOISL10Gto10G_top
```

Semua command dieksekusi melalui argv, bukan interpolasi shell. `run.py` menggunakan executable absolut2025.2; output disimpan pertest beserta JSON command/cwd/exit/durasi. Perhatikan XSim bisa exit0 meskipun runtime gagal sebelum time0. Cari error, marker hasil dan cakupan, bukan exit0 saja.

Fallback yang benar-benar dijalankan ketika runtime XSim terblokir:

```bash
python3 audit/20261101/scripts/run_iverilog.py tb_audit_ingress tb_audit_packets tb_audit_packets_stall tb_audit_baseband tb_audit_idle tb_audit_rs tb_audit_rs_cadence tb_audit_rs_header tb_audit_rxcontrol tb_audit_txcontrol tb_audit_memory tb_audit_delete tb_audit_reorder tb_audit_feedback tb_audit_feedback_local tb_audit_mgmt_replay tb_audit_mgmt_duplicate tb_audit_cdc tb_audit_cdc_actual tb_audit_timer tb_audit_timer312 tb_audit_timer_exact tb_audit_timer312_exact tb_audit_gearbox
python3 audit/20261101/scripts/summarize.py
```

`tb_audit_baseband`, `tb_audit_cdc_actual`, dan `tb_audit_mgmt_duplicate` memang diharapkan FAIL pada baseline ini; expected oracle tidak diubah agar lulus. Seed RS2026; test lainnya stimulus deterministik tanpa PRNG. Timeout proses120s Icarus,180s runtimeXSim,240s elaborasi; beberapa TB mempunyai watchdog waktu simulasi sendiri. `run.py` membatasi simulasi asli2ms; grandTB watchdog500µs.

Model RS memakai behavioral `bram_rs/sim/bram_rs.v` dan `bram_rs/simulation/blk_mem_gen_v8_4.v` asli2025.2, width8/depth256 dengan output registerB; bukan model RAM64-bit buatan. Model vendor memperingatkan collision tidak dimodelkan secara presisi. Icarus tidak menjalankan GTH/secureip atau FIFO VHDL encrypted; tidak ada stub pengganti untuk menyatakan modem penuh lulus.
