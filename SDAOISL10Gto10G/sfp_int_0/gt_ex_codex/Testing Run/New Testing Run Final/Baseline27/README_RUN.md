# Run and waveform guide

Official project: `/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.xpr`.
Vivado/XSim2025.2 only. Design top remains SDAOISL10Gto10G_top.

From the official project directory, run:

```bash
bash audit/20261102_baseline27/scripts/xsim_local.sh
```

Only snapshot report27_top is selected: original tb_SDAOISL10Gto10G_top, BASIC_REPORT=1, one2000byte packet including dummy FCS,1900+100segments,IDLE/MGMT. No reduced mask, FEC rerun, ARQ rerun, wrapper or stress test is selected. Original error.mem is staged; the BASIC_REPORT clean configuration controls bypass as in the previous run. Build uses frozen official inputs and existing vendor libraries, not a candidate RTL overlay. Requires this workspace/vendor dependencies. Runtime command retains500us watchdog ceiling; successful completion must come from checker, not elapsed time or exit0. Stream oracle additionally checks the first100us accepted-transfer trace. Expected completion AUDIT_PASS REPORT_TOP and stream PASS_TESTED_SCOPE; retry-drop/fatal/mismatch is failure. Rebuild when source changes; Restart is insufficient.

## Open existing failure recording without rerun

In Vivado Tcl Console:

```tcl
source {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/Baseline27/scripts/open_existing_095201.tcl}
```

This opens the old run095201 WDB and a populated diagnosis layout, not the corrected RTL simulation. Inspect13.125–13.145us. Data hex, flag/read/reset binary, counters unsigned decimal. Real data are in WDB; screenshot capture is still required in PM GUI. Do not confuse serial byte-display helpers with actual accepted bus transfer.

## New GUI simulation

Open official gt_ex.xpr with Vivado2025.2. Select existing demo_release simulation fileset and top tb_SDAOISL10Gto10G_top; explicitly set BASIC_REPORT=1. Close old simulation and relaunch/rebuild. At0ns set report_top,report_parameter,report_expected as below, then source setup and run. This GUI launch route is documented, not interactively verified; the top-only frozen CLI is the acceptance route.

```tcl
set report_top tb_SDAOISL10Gto10G_top
set report_parameter BASIC_REPORT
set report_expected 1
set report_offline 0
source {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/audit/20261102_baseline27/scripts/wave_setup.tcl}
run 500 us
```

New local-run WDB/WCFG appear under audit/20261102_baseline27/runs/<run>/runtime_report27_top.*. Open the matching pair only. WDB hashes are indexed after runtime; no nonexistent WDB is declared ready.

Original-mask FEC: REPORT25 run085246 runtime_report_rs_mem WDB/WCFG,0–32.55us; firstmask1.05–1.18us,firstdecodedmismatch8.0375us. ARQ CASE2: BASELINE26 run095201 runtime_report26_arq2_monitor WDB/WCFG,0–51.349472us. These are existing evidence; no rerun is needed. Original-module TB/WCFG records remain where previously indexed; this repair does not claim all25TBs qualified.

Markdown files (.md) are plain text and can be opened with any text editor.

## Latest completed run102343 (supersedes pending runtime statements above)
Top BASIC_REPORT=1 PASS_TESTED_SCOPE,58.228273us. Open the existing result without rerun:

```tcl
source {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/Baseline27/scripts/open_verified_102343.tcl}
```

Overview0–58.228273us; CDC2 previous defect window13.125–13.145us; egress ending near48.225655us; final counters58.228us. Expected: input/output2000,packets1,segs2,MGMT1,ACK3,NAK/replay0,outstanding/delete0. All values are hex in the extraction TSV (07d0=2000,01f4=500); WCFG counters use unsigned decimal. Final GUI screenshot capture remains pending. The old open_existing_095201.tcl deliberately opens the historical failing run.
