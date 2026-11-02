# REPORT24: original testbenches and basic report demonstrations

## Scope and current result
The primary presentation uses the original module TBs. The full-system top is `tb_SDAOISL10Gto10G_top`, with explicit `BASIC_REPORT=1`. `tb_arq` and `tb_RS` are supplemental integration demonstrations. Neither instantiates tb_etri_main. Their current status is compile/elaboration PASS, runtime NOT_RUN; runtime acceptance must be reviewed after the local command. No claim of current end-to-end PASS is made.

The original top legacy profile remains available with BASIC_REPORT=0. BASIC_REPORT=1 issues exactly one simulation-generator trigger, bypasses channel error injection, uses SIM_MODE=1/local feedback and a16-frame holdoff, checks1900/100 segmentation, 2000XGMII bytes, packet delimiters, MGMT delivery and ARQ drain. The packet includes dummy DEADBEEF FCS; no physical PC/NIC reception is claimed. The input scoreboard now records only valid && ready. Original tests are not silently replaced by wrappers.

## Run from the official root
```bash
bash audit/20261102_report24/scripts/xsim_local.sh
```
This runs only the named baseline demonstrations, sequentially. It freezes no new RTL at execution: INPUTS.json must match first. Vendor simulation products were compiled against BASIC23 official RTL, verified unchanged, with the changed original top TB and new report TBs recompiled explicitly. No candidate RTL overlay is used. Vendor generated libraries are local dependencies; the evidence package is not standalone.

Optional selectors: report_controller, report_rs_clean, report_rs_mem, report_arq_0, report_arq_1, report_arq_2, report_top. Do not repeat a completed test until its result is reviewed. New logs and WDB/WCFG go under runs/. If smoke cannot advance, the runner stops before DUT tests. Exit0 alone is not PASS.

## GUI: new simulation
Open the official gt_ex.xpr in Vivado2025.2. In Tcl Console, set report_choice (top/controller/arq-clean/arq-payload/arq-header/rs-clean/rs-mem), then source:
`Testing Run/New Testing Run Final/Report24/scripts/select_baseline.tcl`
The script selects report_baseline and the requested simulation top. Design top remains SDAOISL10Gto10G_top. Close old simulation and Launch Behavioral Simulation; Restart alone does not rebuild. At0ns source `Testing Run/New Testing Run Final/Report24/scripts/setup_new.tcl`, then Run All. Use the table for the watchdog/runtime. A waveform-path error must be resolved, not ignored. All seven configuration choices were batch-validated on a separate project copy; interactive GUI and runtime remain unverified. Ensure error.mem is copied to the simulation working directory; its required48words and SHA are recorded in INPUTS.json. Do not substitute another error.mem silently.

## GUI: existing recording
Set report_run to the reviewed run directory and report_snapshot to its snapshot name. Source Report24/scripts/open_recording.tcl. This opens the WDB and WCFG generated together by that run and does not execute the DUT. Runtime results must be known before claiming functionality. No GUI visual signoff is claimed.

## Counter and transport meanings
TB clocks: tb_arq3.10303ns source delay quantized by1ps precision; tb_RS5ns; original controller5ns; full top uses actual vendor clocks with6.4ns reference. WDB declares effective resolution. All new TBs use1ns/1ps. Accepted bytes/beats are separate from elapsed cycles. Scenario indices are not decoded protocol frame types.

RS header16bytes includes CRC positions; RS payload1912bytes includes CRC positions. In tb_RS the deterministic values are synthetic FEC-boundary vectors, not a valid Ethernet/CRC protocol frame. The entire16/1912bytes is compared after decoding, parity excluded. core_tx uses32header codeword bytes and255×8payload bytes; LPC maps2072to3108bytes, preamble adds9to3117. Header/payload launch offset is156logic clocks, matching CDC1 output timing. Four target frames plus one genuine encoded continuation avoid invented zero padding; GTH and hardware CDC are not included. The original48-word error.mem is preserved. Nonzero mask counts, changed bytes and flipped bits are distinct; no RS-symbol capability is inferred from channel byte counts.

ARQ uses the production Ethernet generator, frontend/framer, CRC16/CRC32 checkers, TX RAM, RX reorder, and reassembly. The finite478-beat frame transport is a TB model, not FEC/GTH. It captures every accepted payload/header, then emits the required continuous RX burst. CASE1 flips bit0 of the first DATA CRC32 word477 once; CASE2 flips bit0 of header byte14 once. Replay is not faulted again. Header CRC failure must not emit feedback using untrusted identity; timeout is expected to recover. CASE1 also requires a DATA2-before-DATA1 recovery/reorder observation; if scheduling does not exercise it, the checker fails rather than declaring reorder proven. Physical RAM slots are traced separately from TXFN and the independent replay-oracle slot.

## Known limitations retained
The restored CDC2/CDC3 path failed BASIC23 full integration. These RTL files have not been changed in REPORT24. The new top profile may reproduce that failure; do not claim changing TB selection repairs it. This run is needed to determine the original-top baseline result. Original controller TB has edge-driven stimulus and command counters; its four-scenario run must be reviewed, and RAM contents are proved only by tb_arq. Unit controller timeout/drop is distinct from successful recovery. Missing current screenshots, WDB values and GUI visual review remain pending. Timing/DRC/CDC/hardware signoff is outside this phase.
