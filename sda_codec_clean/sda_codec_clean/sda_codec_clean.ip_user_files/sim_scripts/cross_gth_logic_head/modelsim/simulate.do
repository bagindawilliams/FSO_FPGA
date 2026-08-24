onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.cross_gth_logic_head xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {cross_gth_logic_head.udo}

run 1000ns

quit -force
