`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 10:38:11
// Design Name: 
// Module Name: UART_TOP
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


module UART_TOP(

    input     i_clk                            ,
    input     i_uart_rx                        ,
    output    o_uart_tx                        ,     

    );


uart_drive#(
    .P_SYSTEM_CLK         (50_000_000    )     , //50MHz 
    .P_UART_BUADRATE      (9600          )     , 
    .P_UART_DATA_WIDTH    (8             )     ,
    .P_UART_STOP_WIDTH    (1             )     ,
    .P_UART_CHECK         (0             )       //NONE=0; ODD=1; EVEN=2  
                           
)(                           
    .i_clk                (              )      ,
    .i_rst                (              )      ,
    .i_uart_rx            (              )      ,
    .o_uart_tx            (              )      ,
             
    .i_user_tx_data       (              )      ,
    .i_user_tx_valid      (              )      ,
    .o_user_tx_ready      (              )      ,
             
    .o_user_rx_data       (              )      ,
    .o_user_rx_valid      (              )

    );


endmodule
