transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_fso_header_top  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_fso_header_top xil_defaultlib.glbl

do {tb_fso_header_top.udo}

run 1000ns

endsim

quit -force
