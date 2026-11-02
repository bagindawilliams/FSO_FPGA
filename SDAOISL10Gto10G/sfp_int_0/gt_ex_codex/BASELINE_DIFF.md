# Sembilan perubahan terhadap ZIP12:55

Baseline workspace: `ab25b50fbc1642b055ddbdf0b134190db43d5245d0f015397af2310842dfa307` (hash manifest). ZIP12:55 SHA256 `7d67c455f6a9f8130cece7c3555369ea304d3725e9453a8cdf7e26b0550146a6`. Tidak ada rollback. File sumber berada di `gt_ex.srcs/sources_1/new/`. Diff lengkap perfile ada di evidence. Alias D/B berasal dari Guidelines Rev A.1 lokal yang merujuk audit12:55; nama laporan audit asli untuk setiap alias belum seluruhnya tersedia.

## ethernet_frame_reassembly.v

- SHA256 ZIP: `3c074d54fcb14a69eee500a4d81dc694c3e18bfe2181b86b08273694ad37c57d`
- SHA256 workspace: `1577dc213ea6d307e5ae98555da36467881946dba88860aa7b75f738a1d09501`
- ID/alias: OISL-ETH-001 / D02
- Logika: FSM drain menambahkan DR_IPG empat siklus setelah paket, agar backend mendeteksi valid rendah dan menghasilkan terminator.
- Dampak pengujian: Scoreboard 5 paket dan stall lulus; batas paket kini terbukti untuk stimulus audit.
- [Diff lengkap](evidence/ethernet_frame_reassembly.v.diff)

## arq_rx_reorder_ddr4_wrapper.v

- SHA256 ZIP: `4aa1f4e57fed0dae2e87dd23e3261493a9abb1fd4e7f247bb26c48abbb13c86d`
- SHA256 workspace: `2c9823f0dd9124a4d7c8772ee59ac7f341c93dd8ea80c6d7ff2d2de004b78210`
- ID/alias: OISL-TIM-001; B12/B13 terkait reorder/timer
- Logika: Guard frekuensi hanya312500000/322265625; nd_is_forward_or_cur/eff_nd_seq_adv menyaring non-DATA usang dari sequence dan timer.
- Dampak pengujian: Uji out-of-order/missing/duplicate/stall dan128interval dua clock lulus; unsupported frequency belum diuji.
- [Diff lengkap](evidence/arq_rx_reorder_ddr4_wrapper.v.diff)

## arq_rx_controller.v

- SHA256 ZIP: `cd8fc97d48a0718ae67c4022615a382422e33067685a491491daf2f51431f56f`
- SHA256 workspace: `5fd6c1ea45457000a7e2dbc2c2d04774495680926e446056c6696a11232b9206`
- ID/alias: OISL-MGMT-001 / D06
- Logika: Latch identitas/headerCRC; MGMT ACK/NAK; history64 entry dan age24576; duplicate tidak mengulang non_data_seq_adv.
- Dampak pengujian: 14 kasus kontrol termasuk wrap lulus. Tidak sama dengan suppression telemetry: integration duplicate gagal.
- [Diff lengkap](evidence/arq_rx_controller.v.diff)

## deframer.v

- SHA256 ZIP: `7c059e12a63dc1f09af2e419cbb279a7a189ba2338f4ff1fff3f154ae7cd9681`
- SHA256 workspace: `f3c0443b45baebd74cfc5130919d86e6cb02a3d7c762cde61e58c42ebf856be8`
- ID/alias: OISL-MGMT-001 / D06
- Logika: Perubahan executable utama: hdr_crc_ok ke ARQ RX memakai active_ing_hdr_ok. Banner tambahan mengklaim history MGMT dan stale suppression pada jalur telemetry.
- Dampak pengujian: History/suppression itu tidak ditambahkan pada data plane dalam diff ini; test10→11→10 mengirim ulang telemetry.
- [Diff lengkap](evidence/deframer.v.diff)

## arq_tx_controller.v

- SHA256 ZIP: `167e9ffc7783e924e338afa5582c88a81468d2b2c08af1645eb4e994a1554ec4`
- SHA256 workspace: `d452185515b3efc9a1044523951d45d64d43d331a86cf97d6b00f20545f48237`
- ID/alias: OISL-MGMT-001 / D06; OISL-ARQ-001 B11/C-A005 terkait
- Logika: Tracker track_is_mgmt, mgmt_in_flight, restore type/TXFN ketika retry, snapshot writeMGMT dan retry-drop counter.
- Dampak pengujian: MGMT2retry/drop, DATA NAK/retry/ACK dan delete arbitration lulus unit; frame completion memakai model busy8/12cycle, bukan serialized frame.
- [Diff lengkap](evidence/arq_tx_controller.v.diff)

## ethernet_fso_framer.v

- SHA256 ZIP: `d591dc4c4f56935eca22f9b11f1b70064774d85f5e671965dbf0d2a712ead57f`
- SHA256 workspace: `435aa57b86a19bda89184db9eb1bd9c73ce2df017c8abb32da9305a62245d9f9`
- ID/alias: OISL-IDLE-001 / D03; temuan baru OISL-IDLE-003
- Logika: Handshake startIDLE dan TXFN committed, diikat hierarchical ke generator; predicate memakai payload_mux_sel10.
- Dampak pengujian: Selector10 berartiMGMT, bukanIDLE00. Baseband deadlock padaIDLE pertama; perbaikan seed tidak bisa dinyatakan lulus integrasi.
- [Diff lengkap](evidence/ethernet_fso_framer.v.diff)

## sda_encoder.v

- SHA256 ZIP: `e5dbcc675f302b1f12ff2104f2ac0973fda9a3c2f3efbf7251d5185cd9bf9835`
- SHA256 workspace: `9d683508807678a70a2745882dad34fb3987fcf06fc43ef947657f0de0b83aa0`
- ID/alias: OISL-CDC-001 / B14/D05
- Logika: Mengganti event-clock dengan FIFO Gray32+pending4, reset readiness, source writer pada clk_logic dan destination clk_gth.
- Dampak pengujian: Queue intended-domain lulus195event; wiring top sumberfeedbackRX bukanlogic, uji pulsaRX100 hanya64 diterima.
- [Diff lengkap](evidence/sda_encoder.v.diff)

## fso_idle_generator.v

- SHA256 ZIP: `f5e475f03a39d7a71d1332a56ae3714e9674cfe6d4d3b0febb3d4995ac70a0ff`
- SHA256 workspace: `56ad2013e6b4eb1643c89e80077ad7751754a1a0342be9fb95f5353b86c1923b`
- ID/alias: OISL-IDLE-001 / D03; OISL-IDLE-002 / B15
- Logika: Menambah idle_start_valid/ready, explicit start/seed lock; fallback bila port tidak terhubung.
- Dampak pengujian: Unit seed0,1,62,63,64,FFFF,0+CRC+stall lulus; fallback TB asli tidak menguji handshake framer yang salah.
- [Diff lengkap](evidence/fso_idle_generator.v.diff)

## fso_payload_top.v

- SHA256 ZIP: `290920e259e47add79c9a4c609a8fecd2d1c23647d81c3e7b0314a224a925454`
- SHA256 workspace: `49fdc16fd18330250ab378664cc7f301c2741f67e522ecd92885e2a82712a5ba`
- ID/alias: OISL-MGMT-001 / D06; OISL-IDLE-001 terkait
- Logika: Snapshot478kata MGMT, bitmap ownership slot, pemisahan requestDATA/MGMT, replay mux; portstartIDLE kosong untuk hierarchical binding framer.
- Dampak pengujian: ReplayMGMT478kata lulus walau live telemetry diubah dan output stall; tidak membuktikan full-link ACK lifecycle.
- [Diff lengkap](evidence/fso_payload_top.v.diff)
