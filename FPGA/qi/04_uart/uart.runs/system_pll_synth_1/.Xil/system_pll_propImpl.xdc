set_property SRC_FILE_INFO {cfile:/home/fzwwj95/work/Learn/FPGA/qi/04_uart/uart.gen/sources_1/ip/system_pll/system_pll.xdc rfile:../../../uart.gen/sources_1/ip/system_pll/system_pll.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.040
