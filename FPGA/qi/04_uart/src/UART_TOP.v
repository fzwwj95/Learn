`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/23 10:26:55
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

    input                    i_clk                                   ,
    input                    i_uart_rx                               ,
    output                   o_uart_tx                                   
); 
 
wire                         w_clk_50MHz                             ;
wire                         w_clk_rst                               ;
wire                         w_system_ppl_locked                     ;

assign                       w_clk_rst = ~ w_system_ppl_locked       ;

wire    [7:0]                w_user_tx_data                          ;
wire                         w_user_tx_ready                         ;
wire    [7:0]                w_user_rx_data                          ;
wire                         w_user_rx_valid                         ;
wire                         w_user_clk                              ;
wire                         w_user_rst                              ;
wire                         w_fifo_empty                            ;
reg                          r_fifo_read_en                          ;
reg                          r_uart_tx_valid                         ;


system_pll system_pll_u0
( 
    .clk_in1                (i_clk                )                  ,    
    .clk_out1               (w_clk_50MHz          )                  ,    
    .locked                 (w_system_ppl_locked  )                       
);


uart_drive#(
    .P_SYSTEM_CLK           (50_000_000           )                  , //50MHz 
    .P_UART_BUADRATE        (9600                 )                  , 
    .P_UART_DATA_WIDTH      (8                    )                  ,
    .P_UART_STOP_WIDTH      (1                    )                  ,
    .P_UART_CHECK           (0                    )                    //NONE=0; ODD=1; EVEN=2  
                           
)uart_drive_U0(                           
    .i_clk                  (w_clk_50MHz          )                  ,
    .i_rst                  (w_clk_rst            )                  ,
    .i_uart_rx              (i_uart_rx            )                  ,
    .o_uart_tx              (o_uart_tx            )                  ,
    
    .i_user_tx_data         (w_user_tx_data       )                  ,
    .i_user_tx_valid        (r_uart_tx_valid      )                  ,
    .o_user_tx_ready        (w_user_tx_ready      )                  ,     
    .o_user_rx_data         (w_user_rx_data       )                  ,
    .o_user_rx_valid        (w_user_rx_valid      )                  ,
    .o_user_clk             (w_user_clk           )                  ,//for sim
    .o_user_rst             (w_user_rst           )                   //for sim

);

UART_FIFO UART_FIFO_U0 (
  .clk                      (w_user_clk           )                  ,      // input wire clk
  .srst                     (w_user_rst           )                  ,    // input wire srst
  .din                      (w_user_rx_data       )                  ,      // input wire [7 : 0] din
  .wr_en                    (w_user_rx_valid      )                  ,  // input wire wr_en
  .rd_en                    (r_fifo_read_en       )                  ,  // input wire rd_en
  .dout                     (w_user_tx_data       )                  ,    // output wire [7 : 0] dout
  .full                     (                     )                  ,    // output wire full
  .empty                    (                     )                    // output wire empty
);

always@(posedge w_user_clk, posedge w_user_rst)begin
    
    if(w_user_rst)begin
        r_fifo_read_en <= 'd0                                        ;
    end
    else if(~w_fifo_empty && w_user_tx_ready)begin
        r_fifo_read_en <= 'd1                                        ;
    end
    else begin
        r_fifo_read_en <= 'd0                                        ;
    end    

end
always@(posedge w_user_clk, posedge w_user_rst)begin
    
    if(w_user_rst) begin
        r_uart_tx_valid <= 'd0                                       ;
    end
    else begin
        r_uart_tx_valid <= r_fifo_read_en                            ;
    end
end

endmodule
