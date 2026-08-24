transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+top  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_14 -L blk_mem_gen_v8_4_12 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.top xil_defaultlib.glbl

do {top.udo}

run 1000ns

endsim

quit -force
