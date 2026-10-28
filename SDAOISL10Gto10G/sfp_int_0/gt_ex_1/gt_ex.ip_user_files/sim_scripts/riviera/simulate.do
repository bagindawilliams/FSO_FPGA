transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_gth64b66b_loopback  -L xil_defaultlib -L xpm -L gtwizard_ultrascale_v1_7_22 -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_gth64b66b_loopback xil_defaultlib.glbl

do {tb_gth64b66b_loopback.udo}

run 1000ns

endsim

quit -force
