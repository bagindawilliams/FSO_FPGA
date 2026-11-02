# Active priority update — 2026-11-02T06:57:03.861645+09:00

Use original module TBs for the urgent report. Full-system choice: `tb_SDAOISL10Gto10G_top`; `tb_etri_main` and additional diagnostics are supplementary/deferred. See `audit/20261102_report_priority_065703/PM_PRIORITY.md`. The procedures below are retained history where they refer to the former main-wrapper priority. No new functional PASS is asserted.

# Report waveform workspace
This folder contains separate historical-recording views and prepared current-run views. The word Final in the folder name is not a verification status.

Do not replace original Williams WCFG files. See WAVEFORM_INDEX.csv for actual top/profile, recording hash and limits. Two gearbox views remain separate.

Open existing evidence: source the exact open_recording_Tcl entry in Vivado2025.2. This does not execute the DUT. Recorded source may differ from the restored current baseline.

New demux run: official gt_ex.xpr, demo_release or report_modules, top tb_demux_decoder. Close the old simulation and rebuild. At0ns source scripts/setup_tb_demux_decoder__counter02.tcl, then run all. Watchdog20us; expected1036output words,12432bytes,4frames. The full byte checker must pass. Current counter runtime remains pending until a new successful run is reviewed.

Main: simulation top tb_etri_main instantiates original tb_SDAOISL10Gto10G_top and design SDAOISL10Gto10G_top. One2000byte packet includes dummy FCS DEADBEEF; segments1900/100; TB-triggered MGMT. Run until checker ends at approximately800us, watchdog1ms. This is a target, not current-baseline acceptance.

Data/control/counter radix: hex/bin/unsigned. Scenario strings ASCII. Valid-low held data are not transfers. Live-word indices refer to the currently offered word; accepted totals refer to previous sampling edges. Synthetic unit patterns are not decoded system frame types.

No interactive GUI visual review has been performed by the agent. Do not represent batch path/value checks as visual approval. WDBs stay at original local locations; missing files produce explicit Tcl errors.
