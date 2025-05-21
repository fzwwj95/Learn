transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" -l xil_defaultlib \
"../../../../uart.gen/sources_1/ip/system_pll/system_pll_clk_wiz.v" \
"../../../../uart.gen/sources_1/ip/system_pll/system_pll.v" \


vlog -work xil_defaultlib \
"glbl.v"

