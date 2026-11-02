# New Testing Run — 25 TB profiles,26 WCFG files
Twelve original WCFG files in the parent folder remain unchanged. This folder follows their process-oriented group style and retains both gearbox overview and detail.
Open WAVEFORM_INDEX.csv for the actual top, run, WDB, script and limits. Every displayed trace comes from a real local XSim2025.2 run. WDB files remain at their recorded audit paths.
In Vivado2025.2 Tcl Console, source the absolute scripts/open_<TB>.tcl path. This opens a saved WDB without running simulation. Gearbox has an additional open_tb_mux_gearbox_detail.tcl.
Do not call setup_<TB>.tcl on a recorded WDB. It is for logging a NEW matching simulation at0ns. select scripts are configuration proposals, not proof of interactive GUI success.
LAYOUT_PREPARED and sampled WAVEFORM_DATA_VERIFIED are separate from FUNCTION_VERIFIED and GUI_VISUALLY_VERIFIED. Interactive GUI is NOT_VERIFIED.
Missing/blank reference signals remain documented under audit/20261101_wave16/views/<TB>/missing.tsv. Some require targeted logging; an object name alone is insufficient.
Counters are unsigned; data/CRC/masks hex; control/clock binary. ASCII companions are limited to meaningful packed text; IEEE754 range stays hex.
EXPECTED_CALCULATED groups are not measurements of actual frame duration. Historical/debug counters are not acceptance scoreboards.
