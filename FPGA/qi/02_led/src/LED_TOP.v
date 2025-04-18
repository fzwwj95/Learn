`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/15 23:20:57
// Design Name: 
// Module Name: LED_TOP
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


module LED_TOP(
    input        i_clk             ,
    output [1:0] o_led
    );

wire w_clk_5MHz                    ;
wire w_clk_locked                  ;


CLK_PLL CLK_PLL_U0
(
    .clk_in1       (i_clk         ), 
    .locked        (w_clk_locked  ),      
    .clk_out1      (w_clk_5MHz    )     
);

LED_Drive#(
    .P_LED_NUMBER   (1            ),
    .P_LED_CNT      (1000         ),  //ms
    .P_LED_ON       (1            )
)
LED_Drive_U0
(
    .i_clk          (w_clk_5MHz   ),
    .i_rst          (~w_clk_locked),
    .o_led          (o_led[0]     )
);
endmodule
