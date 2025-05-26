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
    parameter                               P_UART_STOP_WIDTH = 1            ,
    parameter                               P_UART_CHECK      = 0              //NONE=0; ODD=1; EVEN=2  
                           
)(                           
    input                                   i_clk                            ,
    input                                   i_rst                            ,
    input                                   i_uart_rx                        ,
    output                                  o_uart_tx                        ,

    input    [P_UART_DATA_WIDTH - 1 : 0]    i_user_tx_data                   ,
    input                                   i_user_tx_valid                  ,
    output                                  o_user_tx_ready                  ,

    output    [P_UART_DATA_WIDTH - 1 : 0]   o_user_rx_data                   ,
    output                                  o_user_rx_valid                  ,
    
    output                                  o_user_clk                       ,//for sim
    output                                  o_user_rst                        //for sim



    );

localparam                                   P_CLK_DIV_NUMBER = P_SYSTEM_CLK / P_UART_BUADRATE ;

wire                                         w_uart_buadclk                  ;
wire                                         w_uart_buadclk_rst              ;

assign                                       o_user_clk = w_uart_buadclk     ;//for sim
assign                                       o_user_rst = w_uart_buadclk_rst ;//for sim

CLK_DIV_module#(
    .P_CLK_DIV_CNT                           (P_CLK_DIV_NUMBER  )    //5000000/9600=5208.33
)CLK_DIV_module_u0(
    .i_clk                                   (i_clk             )   ,
    .i_rst                                   (i_rst             )   ,
    .o_clk_div                               (w_uart_buadclk    )  
);

rst_gen_module#(
    .P_RST_CYCLE                             (10                )   
)rst_gen_module_u0(
    .i_clk                                   (w_uart_buadclk    )   ,
    .o_rst                                   (w_uart_buadclk_rst)
);

uart_rx#(
    .P_SYSTEM_CLK                            (P_SYSTEM_CLK      )   , //50MHz 
    .P_UART_BUADRATE                         (P_UART_BUADRATE   )   , 
    .P_UART_DATA_WIDTH                       (P_UART_DATA_WIDTH )   ,
    .P_UART_STOP_WIDTH                       (P_UART_STOP_WIDTH )   ,
    .P_UART_CHECK                            (P_UART_CHECK      )                          
)uart_rx_u0(                           
    .i_clk                                   (w_uart_buadclk    )   ,
    .i_rst                                   (w_uart_buadclk_rst)   ,
    .i_uart_rx                               (i_uart_rx         )   ,
                  
    .o_user_rx_data                          (o_user_rx_data    )   ,
    .o_user_rx_valid                         (o_user_rx_valid   )   
);

uart_tx#(
    .P_SYSTEM_CLK                            (P_SYSTEM_CLK      )   , //50MHz 
    .P_UART_BUADRATE                         (P_UART_BUADRATE   )   , 
    .P_UART_DATA_WIDTH                       (P_UART_DATA_WIDTH )   ,
    .P_UART_STOP_WIDTH                       (P_UART_STOP_WIDTH )   ,
    .P_UART_CHECK                            (P_UART_CHECK      )
                           
)uart_tx_u0(                           
    .i_clk                                   (w_uart_buadclk    )   ,
    .i_rst                                   (w_uart_buadclk_rst)   ,
    .o_uart_tx                               (o_uart_tx         )   ,
             
    .i_user_tx_data                          (i_user_tx_data    )   ,
    .i_user_tx_valid                         (i_user_tx_valid   )   ,
    .o_user_tx_ready                         (o_user_tx_ready   )          
);

endmodule