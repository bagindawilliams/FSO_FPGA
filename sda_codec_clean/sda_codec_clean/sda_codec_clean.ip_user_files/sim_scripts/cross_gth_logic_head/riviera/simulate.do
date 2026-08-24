transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+cross_gth_logic_head  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cross_gth_logic_head xil_defaultlib.glbl

do {cross_gth_logic_head.udo}

run 1000ns

endsim

quit -force
