transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_demux_preamble_hotswap  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_demux_preamble_hotswap xil_defaultlib.glbl

do {tb_demux_preamble_hotswap.udo}

run 1000ns

endsim

quit -force
