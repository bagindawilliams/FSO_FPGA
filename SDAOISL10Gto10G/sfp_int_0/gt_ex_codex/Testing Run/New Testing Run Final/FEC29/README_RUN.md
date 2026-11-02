# FEC29 waveform and reproduction

Source recording: audit/20261102_fec28/runs/20261102_104414/runtime_report28_rs_original.wdb. Top tb_RS CHANNEL_ERROR=1; production injector originalmask active,48words. No new simulation is required.

Vivado2025.2 Tcl Console:

```tcl
source {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/FEC29/scripts/open_recording.tcl}
```

Matching saved layout: RS_FRAME0_LANES0_2_RUN104414.wcfg. Batch-open validation resolved11populated groups and92signals. Values for the traced paths were read from WDB. GUI_VISUALLY_VERIFIED remains NOT_VERIFIED; no synthetic screenshot is included.

Capture windows:
-0–9.3us:first-frame input->encoding->injector->decoding overview.
-1.05–1.18us:originalmask start; show input,appliedmask,output,positions,addresses,zones.
-6.52–6.62us:RSreceived first erroneoussymbols; LPC/descrambler groups have their own timestamps in stages.tsv.
-7.80–8.05us:syndrome_dv,syndrome,euclid_dv,delta,omega and first correction/output.
-8.02–8.12us:lane0error_pos/forney/con_rd/data_delay/flag/data_out versus lane2.
-First decoded mismatch8.0375us,expected123456789abcdef0,actual123456789ad9def0.

Hexadecimal data/polynomials/masks, unsigneddecimalcounts, binaryvalid/status. Polynomials are displayed packed high coefficient first; model JSON arrays use ascendingcoefficient order. con_rd=1 corresponds to stored symbol0 at correction input. Do not subtract counts from different pipelines as latency.

Reproduce independent analysis without XSim:

```bash
python3 audit/20261102_fec29/scripts/model.py
python3 audit/20261102_fec29/scripts/compare.py
```

These use bundled extracted tables and original accepted-byte trace; no third-partyPython package is required. Assertions fail for model/RTL mismatches. Decoder model consumes receivedsymbols only; reference is for scoring. Re-extraction requires local WDB and Vivado2025.2; scripts/extract.tcl and extract_input.tcl record values1psbefore5nsclockedges. Package does not include vendor models or largeWDB and is not a standalone simulator project.
