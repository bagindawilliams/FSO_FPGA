Latest: audit/20261102_fec29/SESSION_HANDOFF.md

## FEC29-MODEL-01 / WAVE01 — 2026-11-02T11:02:51.247458+09:00
Read-only causal diagnosis of original FEC28frame0. Independent GF/polynomial,PRBS,LPC model matches actual coding/transport/decoding; EEA/Chien/Forney and255BRAMreads match in lanes0/2 after explicit trailing-zero syndrome convention. Lane0sixerrorscorrected; lane2nineerrorslocatorhasnoroots and fails in both model andRTL. No newRTL/TB/mask/IP change,no simulation rerun. WCFGexpanded11groups92signals,batchvalidated; GUIunverified. Evidence in audit/20261102_fec29. No rollback required for analysis-only additions.
