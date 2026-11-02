# Active priority update — 2026-11-02T06:57:03.861645+09:00

Use original module TBs for the urgent report. Full-system choice: `tb_SDAOISL10Gto10G_top`; `tb_etri_main` and additional diagnostics are supplementary/deferred. See `audit/20261102_report_priority_065703/PM_PRIORITY.md`. The procedures below are retained history where they refer to the former main-wrapper priority. No new functional PASS is asserted.

# Official Vivado demonstration guide
Tool: /2025.2/2025.2/Vivado/bin/vivado (2025.2). Official project:
/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.xpr

## Main simulation, from0ns
1. Open that XPR. Select Simulation Sources → demo_release → tb_etri_main. Design/Synthesis Sources must remain SDAOISL10Gto10G_top.
2. Close any previous simulation, then launch Behavioral Simulation. Restart alone does not rebuild changed TBs.
3. At0ns source {Testing Run/New Testing Run Final/scripts/setup_tb_etri_main_live.tcl} from the project root. If the GUI ran automatically, restart before applying logging, then run again.
4. Run all. The checker targets at least800us of observation, completed one-packet delivery, MGMT and transaction/delete drain. Watchdog1ms. A fatal or timeout is a failure, not permission to extend the watchdog.
5. Expected clean result: one2000byte XGMII packet, input/output byte equality, segment metadata1900/100, MGMT1, ACK3, NAK/replay0, no retry drop, tracker/delete0, and no monitored transport/cadence violation. These are current acceptance targets; runtime on restored RTL is pending.

The wrapper instantiates the original tb_SDAOISL10Gto10G_top. It controls the simulation generator trigger for one packet; it does not prove traffic ingress from a physical PC. Dummy FCS DEADBEEF is included in2000bytes. XGMII preamble/control/IPG are excluded from packet-byte comparison. SIM_MODE=1, LOOPBACK_ARQ_DIRECT=1, ARQ_SIM_SCALE_ENABLE=0, HOLDOFF_CFG=1, MULT=16, MAX_RETX=5. No hardware defaults were changed.

## Original module TB
Set report_tb tb_demux_decoder, then source {Testing Run/New Testing Run Final/scripts/select_report_tb.tcl}. The script selects report_modules and the exact original TB. Launch/rebuild simulation, source scripts/setup_tb_demux_decoder__counter02.tcl, then run all. Expected four259-word bursts and12432output bytes; watchdog20us. Input/output frame labels are separate TB metadata. The last128-bit input slot includes12historical zero-tail bytes; it is not a fifth frame.

For other original TBs use a name from ORIGINAL_TOPS.txt and the same selection script. Consult TB_RUN_TABLE.csv and TB_MATRIX.csv first: compile/elaboration are checked, runtime and profile equivalence are separate. Never load a _verified/v2 layout into an original top and silently ignore missing paths.

## Read existing WDB without rerun
Use the exact open_recording_Tcl in WAVEFORM_INDEX.csv. The filename names the tested profile. Scripts check that the WDB exists and do not run the DUT. For main170951 use scripts/open_tb_etri_main__170951_historical.tcl. This opens historical evidence, not the restored current baseline. Large WDBs are kept locally with hashes.

## Review status
Official project open/fileset configuration is batch-tested. All25 original TBs compile/elaborate in the current snapshot. Interactive GUI operation and screenshot capture have NOT been performed by the agent. Do not call batch setup GUI_VISUALLY_VERIFIED. Screenshots must show the exact top/run, valid controls, word/byte counters and an active transaction window.
