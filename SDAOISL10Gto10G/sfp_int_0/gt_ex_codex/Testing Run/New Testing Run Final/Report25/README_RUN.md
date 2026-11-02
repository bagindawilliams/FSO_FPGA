# Current runtime status — run085246

All setups passed. ARQ CASE1/CASE2 PASS_TESTED_SCOPE. Original-mask FEC and full top FUNCTIONAL_FAIL. Runtime has completed: do not rerun unchanged. See audit/20261102_report25/review085246/RUNTIME_REVIEW.md. Recorded WDB/WCFG openers are in Report25/scripts/*runtime085246.tcl. Earlier pending instructions below are historical.

## Historical instructions

# Current status — WAVE03

All four parameterized WDB setups verified offline on run085051. Explicit flattened generate aliases corrected. Four functional runtimes remain pending; previous setup run stopped before runtime. See WAVE03_REVIEW.md.

## Earlier status entries (historical)

# Latest correction — WAVE02

Actual parameterized RS root and CHANNEL_ERROR=1 verified from local run084725. add_wave list quoting fixed; offline setup42signals/7groups PASS. Four scenario runtimes remain pending. Use the same REPORT25 command. Details: audit/20261102_report25/WAVE02_REVIEW.md.

# REPORT25 — current status and run guide

Three REPORT24 results remain PASS_TESTED_SCOPE and have not been rerun: original ARQ controller, clean tb_RS and clean tb_arq CASE0. Four configurations remain pending acceptance: original error.mem FEC, CRC32 recovery/reorder, CRC16-invalid handling and original full top BASIC_REPORT1.

## Actual diagnosis
[FAKTA SUMBER] Original xelab commands and xsim.dbg identify parameterized modules tb_RS(CHANNEL_ERROR=1), tb_arq(CASE=1), tb_arq(CASE=2), tb_SDAOISL10Gto10G_top(BASIC_REPORT=1). The old prefix query returned no root for these four local sessions. The precise live scope spelling has not yet been observed. Do not present the parameterized module name as a verified path.

[HASIL SIMULASI] One live agent probe was attempted on report_arq_1; XSim2025.2 raised its pre-script Tcl exception. No simulation time or scope dump was obtained. No identical retries were performed. Opening the four killed-session WDBs cannot establish live scope resolution: the first was rejected by Vivado2025.2 as incompatible/unfinalized. No DUT regression is inferred.

## Changes
REPORT25-WAVE01 enumerates actual root scopes, then matches the elaborated base module with an optional parameter suffix. Objects are enumerated once and indexed by exact relative path; no guessed prefix object queries. Effective parameter is read and compared before logging or run. Missing signals cause failure, not silent omission. Actual scopes, objects and parameters are saved with the run. Current live proof for four pending snapshots is still required.

REPORT25-RUN01 catches Tcl setup exceptions and quits. The host checks explicit failure markers and pre-script exceptions every250ms, closes stdin, and limits setup to30s. It validates all four setups before executing their scenarios, preserves all logs, and never reruns the three successful cases. Simulation acceptance still requires expected marker, $finish and absence of errors. Expected data and watchdog simulation durations are unchanged. A deliberately missing-root Tcl self-test exits immediately; this is runner validation, not DUT simulation.

REPORT25-TIME01 changes four display suffixes in original tb_arq_tx_controller from ns to ps to agree with default %t precision. No stimulus/checker change; inverse string replacement reproduces original bytes after removing the new history comment. The successful historical run and frozen binaries remain unchanged. No controller rerun is required for this string-only edit. REPORT24's old source preflight will now detect this intentional change; use REPORT25 for pending tests.

No modem RTL, IP, XCI, XDC or XPR changed. Controller test source is the only official source edit. Checkpoints/diffs and hashes accompany this handoff.

## One required local action
From official project root run:

bash audit/20261102_report25/scripts/xsim_local.sh

This first checks hashes, then performs four setup-only probes with actual parameter checks. Only after all four pass does it run error.mem FEC, ARQ CASE1, ARQ CASE2 and BASIC_REPORT1. No full-suite or successful-test rerun. Runtime logs and WDBs are in audit/20261102_report25/runs/<KST timestamp>. A setup failure stops promptly with evidence instead of waiting ten minutes. If the environment fails before the script, the runner also stops promptly.

## Already available waveform evidence (no rerun)
Use Vivado2025.2 Tcl console to source Testing Run/New Testing Run Final/Report25/scripts/open_report_rs_clean.tcl or open_report_arq_0.tcl (quote absolute paths in braces). These open old run075031 recordings, not a new simulation. Revised layouts validated offline: RS seven groups42signals; ARQ six groups43signals. Recorded samples at1us,5us,10us and near completion are in logs/RECORDED_VALUES.tsv. At22.745us ARQ sent/recv500 words, packet1, segments2, ACK3, NAK0, retry0, outstanding0, errors0. At32.549us RS hc64,pc956,mismatch0. Radices: datahex, flagsbinary, countersunsigned. GUI_VISUALLY_VERIFIED remains NOT_VERIFIED. No screenshots were synthesized.

For a new completed result, set report_run to its timestamp and report_snapshot to report_rs_mem/report_arq_1/report_arq_2/report_top, then source scripts/open_pending_result.tcl. Confirm runtime PASS and correct run before using screenshots; initialization-only WDB is not evidence.

## Scope and pending work
The new four runtimes and their active-window waveform values remain externally blocked for the agent. Fixing setup does not close earlier current-CDC integration failures. If a functional failure follows successful setup, diagnose it separately without weakening acceptance. The clean FEC run does not prove original mask correction. The clean ARQ run is local production-CRC baseband evidence, not GTH/XGMII or remote-peer proof. Existing GUI fileset preparation is not interactive GUI verification.
