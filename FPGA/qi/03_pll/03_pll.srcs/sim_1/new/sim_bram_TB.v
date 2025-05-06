`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/05 16:37:31
// Design Name: 
// Module Name: sim_bram_TB
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


module sim_bram_TB(

    );

reg clk ;
reg rst ;

initial begin
    rst = 1 ;
    #100    ;
    rst = 0 ;


end

always begin
    clk = 0 ;
    #10     ;
    clk = 1 ;
    #10     ;

end
xc7z010_top xc7z010_top_U0(
    .i_clk    (clk    )         ,
    .o_led    (       )  

);

endmodule
