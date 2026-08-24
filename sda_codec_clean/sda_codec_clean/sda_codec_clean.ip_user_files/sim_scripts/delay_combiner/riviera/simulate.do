transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+delay_combiner  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.delay_combiner xil_defaultlib.glbl

do {delay_combiner.udo}

run 1000ns

endsim

quit -force
