transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_eth_rx_front_end_top  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_eth_rx_front_end_top xil_defaultlib.glbl

do {tb_eth_rx_front_end_top.udo}

run 1000ns

endsim

quit -force
