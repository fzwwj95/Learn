`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 23:27:34
// Design Name: 
// Module Name: SIM_uart_drive_TB
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
`define    CLK_PERIOD  10;


module SIM_uart_drive_TB(

    );

reg    clk,rst              ;

localparam                         P_USER_DATA_WITH = 8 ;

reg    [P_USER_DATA_WITH-1 : 0]    r_user_tx_data     ;
reg                                r_user_tx_valid    ;

wire                               w_user_tx_ready    ;
wire   [P_USER_DATA_WITH-1 : 0]    w_user_rx_data     ;
wire                               w_user_rx_valid    ;
wire                               w_user_active      ;

assign w_user_active = r_user_tx_valid & w_user_tx_ready ;

initial begin
    rst = 1                 ;
    #100                    ;
    @(posedge clk)rst = 0   ;
end

always begin
    clk = 0                 ;
    #`CLK_PERIOD            ;
    clk = 1                 ;
    #`CLK_PERIOD            ;
  
    
end

uart_drive#(
    .P_SYSTEM_CLK           (50_000_000           )                  , //50MHz 
    .P_UART_BUADRATE        (9600                 )                  , 
    .P_UART_DATA_WIDTH      (P_USER_DATA_WITH     )                  ,
    .P_UART_STOP_WIDTH      (1                    )                  ,
    .P_UART_CHECK           (0                    )                    //NONE=0; ODD=1; EVEN=2  
                           
)uart_drive_U1(                           
    .i_clk                  (clk                  )                  ,
    .i_rst                  (rst                  )                  ,
    .i_uart_rx              (i_uart_rx            )                  ,
    .o_uart_tx              (o_uart_tx            )                  ,
        
    .i_user_tx_data         (r_user_tx_data       )                  ,
    .i_user_tx_valid        (r_user_tx_valid      )                  ,
    .o_user_tx_ready        (w_user_tx_ready      )                  ,
        
    .o_user_rx_data         (w_user_rx_data       )                  ,
    .o_user_rx_valid        (w_user_rx_valid      )        

);

always @(posedge clk, posedge rst) begin
    if(rst)begin
        r_user_tx_data <= 'd1                                        ;
    end
    else if(w_user_active)begin
        r_user_tx_data <= r_user_tx_data + 'd1                       ;
    end
    else begin
        r_user_tx_data <= r_user_tx_data                             ;
    end
end

always @(posedge clk, posedge rst) begin
    if(rst)begin
        r_user_tx_valid <= 'd0                                       ;
    end
    else if(w_user_active)begin
        r_user_tx_valid <= 'd0                                       ;
    end
    else if(w_user_tx_ready)begin
        r_user_tx_valid <= 'd1                                       ;
    end
    else begin
        r_user_tx_valid <= r_user_tx_valid                           ;
    end
end
endmodule
