onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib tb_demux_preamble_hotswap_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tb_demux_preamble_hotswap.udo}

run 1000ns

quit -force
