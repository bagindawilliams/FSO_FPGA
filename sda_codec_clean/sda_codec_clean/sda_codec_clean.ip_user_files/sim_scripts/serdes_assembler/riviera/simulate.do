transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+serdes_assembler  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.serdes_assembler xil_defaultlib.glbl

do {serdes_assembler.udo}

run 1000ns

endsim

quit -force
