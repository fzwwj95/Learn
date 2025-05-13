`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 15:08:20
// Design Name: 
// Module Name: uart_rx
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


module uart_rx#(
    parameter                               P_SYSTEM_CLK      = 50_000_000   , //50MHz 
    parameter                               P_UART_BUADRATE   = 9600         , 
    parameter                               P_UART_DATA_WIDTH = 8            ,
    parameter                               P_UART_STOP_WIDTH = 1            
                           
)(                           
    input                                   i_clk                            ,
    input                                   i_rst                            ,
    input                                   i_uart_rx                        ,

    input                                   i_user_rx_data                   ,
    input                                   i_user_rx_valid



    );
endmodule
