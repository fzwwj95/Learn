vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../ipstatic" \
"../../../../uart.gen/sources_1/ip/system_pll/system_pll_clk_wiz.v" \
"../../../../uart.gen/sources_1/ip/system_pll/system_pll.v" \


vlog -work xil_defaultlib \
"glbl.v"

