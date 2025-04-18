`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/15 23:20:57
// Design Name: 
// Module Name: LED_Drive
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


module LED_Drive#(
    parameter    P_LED_NUMBER    = 1       ,
    parameter    P_LED_CNT       = 1000    ,  //ms
    parameter    P_LED_ON        = 1
)(
    input                             i_clk     ,
    input                             i_rst     ,
    output  [P_LED_NUMBER - 1 : 0]    o_led     
    );

//**********function**********//
//**********parameter*********//
//************port************//
//**********mechine***********//
//************reg*************//
reg  [P_LED_NUMBER - 1 : 0]           ro_led    ;
reg  [16 : 0]                         r_cnt     ;
//************wire************//
wire w_clk_1KHz                                 ;
//*********component**********//
CLK_DIV_module#(
    .P_CLK_DIV_CNT (5000         )
)
CLK_DIV_module_U0(
    .i_clk         (i_clk        ),
    .i_rst         (i_rst        ),
    .o_clk_div     (w_clk_1KHz   ) 

);
//***********assign***********//
assign o_led = ro_led                           ;
//***********always***********//
always @(posedge w_clk_1KHz, posedge i_rst) 
begin
    if(i_rst) begin
        r_cnt <= 'd0                            ;
    end
    else if(r_cnt > P_LED_CNT - 2) begin
        r_cnt <= 'd0                            ;
    end
    else begin
        r_cnt = r_cnt + 'd1                     ;
    end
end

always @(posedge w_clk_1KHz, posedge i_rst)
begin
    if(i_rst) begin
        ro_led <= 'd0                           ;
    end
    else if(r_cnt == P_LED_CNT - 1) begin
        ro_led <= ~ ro_led                      ;
    end
    else begin
        ro_led <= ro_led                        ;
    end
end
endmodule
