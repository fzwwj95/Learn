onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib system_pll_opt

do {wave.do}

view wave
view structure
view signals

do {system_pll.udo}

run -all

quit -force
