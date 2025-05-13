`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 14:33:29
// Design Name: 
// Module Name: uart_drive
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_drive#(
    parameter                               P_SYSTEM_CLK      = 50_000_000   , //50MHz 
    parameter                               P_UART_BUADRATE   = 9600         , 
    parameter                               P_UART_DATA_WIDTH = 8            ,
    parameter                               P_UART_STOP_WIDTH = 1            
                           
)(                           
    input                                   i_clk                            ,
    input                                   i_rst                            ,
    input                                   i_uart_rx                        ,
    output                                  o_uart_tx                        ,

    input    [P_UART_DATA_WIDTH - 1 : 0]    i_user_tx_data                   ,
    input                                   i_user_tx_valid                  ,
    output                                  o_user_tx_ready                  ,

    input                                   i_user_rx_data                   ,
    input                                   i_user_rx_valid



    );

wire                                         w_uart_buadclk                  ;
wire                                         w_uart_buadclk_rst              ;

CLK_DIV_module#(
    .P_CLK_DIV_CNT         (2                ) 
)CLK_DIV_module_u0(
    .i_clk                 (i_clk            )   ,
    .i_rst                 (i_rst            )   ,
    .o_clk_div             (w_uart_buadclk   )  
);

uart_rx#(
    .P_SYSTEM_CLK          (P_SYSTEM_CLK     )   , //50MHz 
    .P_UART_BUADRATE       (P_UART_BUADRATE  )   , 
    .P_UART_DATA_WIDTH     (P_UART_DATA_WIDTH)   ,
    .P_UART_STOP_WIDTH     (P_UART_STOP_WIDTH)   
                           
)uart_rx_u0(                           
    .i_clk                 (w_uart_buadclk   )   ,
    .i_rst                 (              )   ,
    .i_uart_rx             (              )   ,

    .i_user_rx_data        (              )   ,
    .i_user_rx_valid       (              )   
);

uart_tx#(
    .P_SYSTEM_CLK          (P_SYSTEM_CLK     )   , //50MHz 
    .P_UART_BUADRATE       (P_UART_BUADRATE  )   , 
    .P_UART_DATA_WIDTH     (P_UART_DATA_WIDTH)   ,
    .P_UART_STOP_WIDTH     (P_UART_STOP_WIDTH)   
                           
)uart_tx_u0(                           
    .i_clk                  (w_uart_buadclk   )   ,
    .i_rst                  (             )   ,
    .o_uart_tx              (             )   ,
             
    .i_user_tx_data         (             )   ,
    .i_user_tx_valid        (             )   ,
    .o_user_tx_ready        (             )          
);

endmodule