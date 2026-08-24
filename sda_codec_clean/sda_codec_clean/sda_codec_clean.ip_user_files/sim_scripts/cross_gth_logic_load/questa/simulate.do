onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib cross_gth_logic_load_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cross_gth_logic_load.udo}

run 1000ns

quit -force
