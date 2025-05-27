-makelib xcelium_lib/xpm -sv \
  "/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../uart.gen/sources_1/ip/system_pll/system_pll_clk_wiz.v" \
  "../../../../uart.gen/sources_1/ip/system_pll/system_pll.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

