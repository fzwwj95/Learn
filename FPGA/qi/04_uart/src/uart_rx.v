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
    parameter                               P_UART_STOP_WIDTH = 1            ,
    parameter                               P_UART_CHECK      = 0              //NONE=0; ODD=1; EVEN=2  
                           
)(                           
    input                                   i_clk                            ,
    input                                   i_rst                            ,
    input                                   i_uart_rx                        ,

    output    [P_UART_DATA_WIDTH - 1 : 0]   o_user_rx_data                   ,
    output                                  o_user_rx_valid

    );

/**********************************function***********************************/
/**********************************parameter**********************************/
/**********************************port***************************************/
/**********************************mechine************************************/
/**********************************reg****************************************/
reg    [P_UART_DATA_WIDTH - 1 : 0]          ro_user_rx_data                  ;
reg                                         ro_user_rx_valid                 ;
reg    [1 : 0]                              r_uart_rx                        ;
reg    [7 : 0]                              r_cnt                            ;
/**********************************wire***************************************/
/**********************************component**********************************/
/**********************************assign*************************************/
assign        o_user_rx_data   =  ro_user_rx_data                            ;
assign        o_user_rx_valid  =  ro_user_rx_valid                           ;                              
/**********************************always*************************************/
always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        r_uart_rx  <= 'd0                                                    ;
    end
    else begin
        r_uart_rx  <= {r_uart_rx[0], i_uart_rx}                              ;
    end    
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        r_cnt      <= 'd0                                                    ;
    end
    else if(r_cnt >= 2 + P_UART_DATA_WIDTH + P_UART_STOP_WIDTH -1) begin
        r_cnt      <= 'd0                                                    ;
    end
    else if(r_uart_rx[1] == 0 || r_cnt > 0) begin
        r_cnt      <= r_cnt + 'd1                                            ;
    end
    else begin
        r_cnt      <= r_cnt                                                  ;
    end    
end

always @(posedge i_clk, posedge i_rst) begin
    if()begin
                                                 
    end
    else if()begin

    end
    else if()begin

    end
    else begin

    end
    
end
endmodule
