`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/15 23:20:57
// Design Name: 
// Module Name: CLK_DIV_module
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


module CLK_DIV_module#(
    parameter    P_CLK_DIV_CNT = 2
)(
    input        i_clk              ,
    input        i_rst              ,
    output       o_clk_div    

    );

//**********function**********//
//**********parameter*********//
//************port************//
//**********mechine***********//
//************reg*************//
reg  ro_clk_div                     ;
reg  [15:0] r_cnt                   ;
//************wire************//
//*********component**********//
//***********assign***********//
assign o_clk_div = ro_clk_div       ;
//***********always***********//
always @(posedge i_clk , posedge i_rst) begin
    if(i_rst) begin
        r_cnt <= 'd0                ;
    end
    else if (r_cnt >= (P_CLK_DIV_CNT >> 1)-1) begin
        r_cnt <= 'd0                ;
    end
    else begin
        r_cnt <= r_cnt + 'd1        ;
    end
    
end

always @(posedge i_clk , posedge i_rst) begin
    if(i_rst) begin
        ro_clk_div <= 'd0           ;
    end
    else if (r_cnt >= (P_CLK_DIV_CNT >> 1)-1) begin
        ro_clk_div <= ~ro_clk_div   ;
    end
    else begin
        ro_clk_div <= ro_clk_div    ;
    end   
end
endmodule
