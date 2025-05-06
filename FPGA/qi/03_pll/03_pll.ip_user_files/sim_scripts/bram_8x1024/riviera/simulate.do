transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+bram_8x1024  -L xpm -L blk_mem_gen_v8_4_8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.bram_8x1024 xil_defaultlib.glbl

do {bram_8x1024.udo}

run 1000ns

endsim

quit -force
