# tb_RS original-mask run guide

Official project: /home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.xpr. Design top unchanged. Use Vivado/XSim2025.2.

Run only `bash audit/20261102_fec28/scripts/xsim_local.sh` from project root. Snapshot report28_rs_original; top tb_RS; CHANNEL_ERROR=1; injector SIM_MODE=1,safe_words15,max_error47. Supplemental TB source audit/20261102_fec28/tb/tb_RS.sv. Clock5ns, TB precision1ps; production injector1ns/100ps. Runtime ceiling100us, expected ordinary completion around32.55us if decoding reaches target. No new GUI fileset was applied; use the explicit isolated runner to avoid picking the historical tb_RS copy. Source changes require rebuild.

After a completed run, set `fec_run` to its directory name and source scripts/open_recording.tcl in Vivado. The opener requires matching runtime WDB/WCFG and does not rerun simulation. For a new live tb_RS session at0ns use scripts/setup_new.tcl, then run100us. Do not claim GUI verified: runtime WCFG generation and recording still await the local run.

View0–32.55us overview; first injection near1.05–1.18us. Use trace timestamps for subsequent frame boundaries and the actual first mismatch; do not reuse historical screenshot timestamps as new measurements. Hex data/mask/CRC; unsigned word/byte/frame counts; binary controls. Packed position fields contain four12bit decimal coordinates, lane MSB first; use the TSV to read each lane unambiguously. AddressesFFFF mean protected/pass-through. Legacy serial byte helpers are display aids, not transfer timing.

Expected reference totals: four decoded frames,64header bytes and956payload64bit words. Mask coverage:48addresses x4bytes x4target frames =768zone2bytes for those four frames, regardless of zero mask bytes. Whole-run counts can include the fifth continuation frame. Symbol counts are measured after LPC/descrambler, not inferred from channel-byte counts. A decoding failure remains FAIL even when zone coverage passes.

Latest run104414 completed: injector contractPASS,decoded payloadFAIL36words. To open without rerun: set fec_run 20261102_104414; source scripts/open_recording.tcl from this folder. No need to rerun identical inputs.
