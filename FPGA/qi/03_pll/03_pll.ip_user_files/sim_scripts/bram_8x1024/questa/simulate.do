onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib bram_8x1024_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {bram_8x1024.udo}

run 1000ns

quit -force
