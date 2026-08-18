transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+gt_example_top_sim  -L xil_defaultlib -L xpm -L gtwizard_ultrascale_v1_7_22 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.gt_example_top_sim xil_defaultlib.glbl

do {gt_example_top_sim.udo}

run 1000ns

endsim

quit -force
