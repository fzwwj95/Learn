`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/22 15:48:55
// Design Name: 
// Module Name: xc7z010_top
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


module xc7z010_top#(

)(
    input    i_clk         ,
    output   o_led  

);
    wire     w_clk_125M    ;
    wire     w_clk_5M      ;
    wire     w_clk_20M     ;
    wire     w_locked      ;

    reg      r_count       ;

  clk_wiz_0 clk_wiz_0_u0
   (

    .clk_out1    (w_clk_125M   ),     // output clk_out1
    .clk_out2    (w_clk_5M     ),     // output clk_out2
    .clk_out3    (w_clk_20M    ),     // output clk_out3
    .locked      (w_locked     ),       // output locked 
    .clk_in1     (i_clk        )       // input clk_in1
);

always @(posedge w_clk_125M) begin
    if(!w_locked)begin
        r_count <= 'd0           ;
    end
    else  begin
        r_count <= r_count + 'd1 ;
     
    end
    
end



endmodule
