# BASELINE26 — basic demo repair and FEC diagnosis

## Verified source of top corruption
[HASIL SIMULASI] Read-only extraction of REPORT25 run085246 WDB: encoder marker offsets0,3117,6234,9351,12468,15585,18702. Encoder-to-CDC2 prefix10156bytes and CDC2-to-TX prefix10148bytes match. RX acquisition begins at encoder offset12468 (fifth frame). This single acquisition mapping is not an ongoing resynchronization oracle.

First observed RX-to-CDC3-FIFO divergence is byte1976 after acquisition: RX expects52238a54e7634c6e..., whereas FIFO writes000000000000000052238a54e7634c6e... . Two artificial32-bit zero words are inserted while RX valid is low. Subsequent bytes resume identically. The same insertion appears at CDC3 output. See evidence/CDC3_FIRST_DIVERGENCE.json and TSV traces. Coarse GTH edge estimates bracket samples by500ps with measured period checks; they establish accepted byte values, not optical timing. Encoder edges were measured at5000ps. Dense extraction was stopped as unnecessarily expensive; retained partial trace is explicitly labelled.

[FAKTA SUMBER] Restored CDC3 interpreted any en-low partial four-word group as end-of-stream and wrote zeros. Production GTH's valid pauses are not frame-end indications. The same RTL capped reads at780wide words, a finite-demo limit incompatible with ongoing IDLE after DATA. BASELINE26-CDC3-01 removes synthetic writes, preserves partial FIFO content until genuine continuation, gates accepted writes by full/reset-busy and removes the fixed read cap. Interface, FIFO depth/IP, clocks and read pacer are unchanged. Historical comments retained with a superseding revision. Continuous demo runtime remains unverified. Finite original unit tails may remain partial; do not fake padding to preserve their previous flush expectation.

## FEC original-pattern explanation
[HASIL SIMULASI] Independent extraction of production RS codewords and RS decoder inputs after LPC/descrambling from clean and error WDBs: clean reference matches TX codewords exactly over128header bytes and1020payload64-bit words (four codewords per lane). Header errors0 for all four frames. Payload changed symbols by lane, lane0=bits7:0:
frame0:6,6,9,6,6,6,6,6
frame1:9,6,6,6,6,6,6,6
frame2:6,6,6,6,6,6,9,6
frame3:6,6,6,6,9,6,6,6
Each frame has one lane outside t=8. Original39decoded-word mismatches are not evidence of a decoder bug within capacity. Original mask and failed evidence are retained. This does not guarantee failure/detection for every >8symbol pattern.

[FAKTA SUMBER] error_demo_single_group.mem retains the first three original XOR entries and sets remaining45entries tozero, preserving48rows. Original error.mem is untouched. safe_words15 and max_error47 remain unchanged. No injector feature or direct-RS fault is introduced. The production injector still has the documented burst-relative contract; no new absolute-frame-coordinate claim. The same tb_RS stimulus, clocks and byte transport are retained, with non-driving codeword/lane counters and <=8symbol/header-protection assertions. The new pattern must actually recover data before any PASS claim.

## ARQ monitor only
CASE2 causeX arose because the monitor marked expiry only under FAST, although production expiry uses timer_tick_en in both modes. A separate tb_arq copy now observes track_timer==1 and actual timer_tick_en, with reset initialization. No CRC, replay, stimulus or expected-data change. Only CASE2 is selected to validate this monitor; other passing ARQ cases are not rerun.

## Build and execution
Three snapshots compile/elaborate with Vivado/XSim2025.2: report26_top BASIC_REPORT1, report26_rs_demo CHANNEL_ERROR1 with the named mask copy, report26_arq2_monitor CASE2. Source resolution uses the previously frozen vendor/RTL library cache with all unchanged official source hashes checked; changed official CDC3/top and explicit supplemental TBs are recompiled. Not standalone.

Runtime is pending local execution because the agent XSim startup exception was previously established. No redundant runtime attempt was made solely to rediscover that exception. One local command:

bash audit/20261102_baseline26/scripts/xsim_local.sh

This selects only the three affected configurations. All setups validate actual root/parameters first. Masks are staged explicitly per test in the isolated run directory; original workspace mask remains unchanged. Top generates report26_stream.tsv for the first100us of the same demo; this observation limit is not a new stimulus. A post-run accepted-byte oracle checks encoder/CDC2/TX/RX/CDC3 conservation and3117byte marker spacing over the captured interval, with one explicit acquisition offset and no later resynchronization. The original top's packet/MGMT/drop assertions remain. Result requires both top acceptance and stream checks; observation beyond100us is not claimed. A source change requires rebuild, not Restart.

## Waveform and report readiness
Existing ARQ WDBs and runtime WCFG/openers remain in Report25. Six formal English technical/evidence slides were appended to the existing editable REPORT24 deck; previous slides retained. The added-pages PDF is a layout preview, not a native export of the full PPTX. Actual ARQ screenshot locations/windows are specified; placeholders are explicit. No fabricated waveform. New top/FEC screenshots await passing runtime; GUI_VISUALLY_VERIFIED remains NOT_VERIFIED.

No FPGA programming, XCI/XDC updates, clock changes, synthesis rerun or stress test. Old synthesis results do not establish equivalence after this RTL fix; hardware work remains separate. All old failures remain evidence. Acceptance is not complete until new runtime passes.
