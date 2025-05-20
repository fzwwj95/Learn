`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 14:33:29
// Design Name: 
// Module Name: uart_tx
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



module uart_tx#(
    parameter                               P_SYSTEM_CLK      = 50_000_000   , //50MHz 
    parameter                               P_UART_BUADRATE   = 9600         , 
    parameter                               P_UART_DATA_WIDTH = 8            ,
    parameter                               P_UART_STOP_WIDTH = 1            ,
    parameter                               P_UART_CHECK      = 0              //NONE=0; ODD=1; EVEN=2  
                           
)(                           
    input                                   i_clk                            ,
    input                                   i_rst                            ,
    output                                  o_uart_tx                        ,

    input    [P_UART_DATA_WIDTH - 1 : 0]    i_user_tx_data                   ,
    input                                   i_user_tx_valid                  ,
    output                                  o_user_tx_ready                  
);

/*******************************function*************************************/
/*******************************parameter************************************/
/*******************************port*****************************************/
/*******************************mechine**************************************/
/*******************************reg******************************************/
reg                                         ro_uart_tx                       ;
reg                                         ro_user_tx_ready                 ;
reg   [15:0]                                r_cnt                            ;
reg   [P_UART_DATA_WIDTH - 1 : 0]           r_tx_data                        ;
reg                                         r_tx_check                       ;
/*******************************wire*****************************************/
wire                                        w_tx_active                      ;

/*******************************component************************************/
/*******************************assign***************************************/
assign    o_uart_tx       = ro_uart_tx                                       ;
assign    o_user_tx_ready = ro_user_tx_ready                                 ;
assign    w_tx_active     = i_user_tx_valid & o_user_tx_ready                ;
assign    w_tx_check      = i_user_tx_data                                   ;
/*******************************always***************************************/
always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        ro_user_tx_ready <= 'd1                                              ;
    end 
    else if(w_tx_active) begin
        ro_user_tx_ready <= 'd0                                              ;
    end 
    else if(i_rst >= 2 + P_UART_DATA_WIDTH + P_UART_STOP_WIDTH -1) begin
        ro_user_tx_ready <= 'd1                                              ;
    end                           
    else begin                            
        ro_user_tx_ready <= ro_user_tx_ready                                 ;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        r_cnt <= 'd0                                                         ;
    end
    else if(i_rst >= 2 + P_UART_DATA_WIDTH + P_UART_STOP_WIDTH -1) begin
        r_cnt <= 'd0                                                         ;
    end                          
    else if(!ro_user_tx_ready) begin                          
        r_cnt <= r_cnt + 'd1                                                 ;
    end                          
    else begin                          
        r_cnt <= r_cnt                                                       ;
    end
    
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin 
        r_tx_data   <=  'd0                                                  ;
    end                          
    else if(w_tx_active)begin                          
        r_tx_data   <=  i_user_tx_data                                       ;
    end                          
    else if(!ro_user_tx_ready) begin                          
        r_tx_data   <=  r_tx_data >> 1                                       ;
    end                          
    else begin                          
        r_tx_data   <=  r_tx_data                                            ;
    end                          
                              
end                          
                          
always @(posedge i_clk, posedge i_rst) begin                          
    if(i_rst)begin                           
        ro_uart_tx  <=  'd1                                                  ;
    end                          
    else if(w_tx_active)begin                          
        ro_uart_tx  <=  'd0                                                  ;
    end
    else if(!ro_user_tx_ready && i_rst == 3 + P_UART_DATA_WIDTH -3)begin
        ro_uart_tx  <=  r_tx_check                                           ;
    end
    else if(!ro_user_tx_ready && i_rst >= 3 + P_UART_DATA_WIDTH -2)begin
        ro_uart_tx  <=  'd1                                                  ;
    end                          
    else if(!ro_user_tx_ready) begin                          
        ro_uart_tx  <=  r_tx_data[0]                                         ;
    end                          
    else begin                          
        ro_uart_tx  <=  'd1                                                  ;
    end
    
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin 
        r_tx_check  <=  'd0                                                  ;
    end
    else if(!ro_user_tx_ready && P_UART_CHECK==1 ) begin//odd
        r_tx_check  <= ~(r_tx_check ^ r_tx_data[0])                          ;
    end
    else if(!ro_user_tx_ready && P_UART_CHECK==2 ) begin//even
        r_tx_check  <=   r_tx_check ^ r_tx_data[0]                           ;
    end                          
    else begin                          
        ro_uart_tx  <=  ro_uart_tx                                           ;
    end
    
end

endmodule