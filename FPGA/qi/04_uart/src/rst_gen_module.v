`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 17:18:06
// Design Name: 
// Module Name: rst_gen_module
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


module rst_gen_module#(
    parameter  P_RST_CYCLE = 1     
)(
    input      i_clk               ,
    output     o_rst 
);

reg            ro_rst = 'd1        ;
reg    [7:0]   r_cnt  = 'd0        ;

assign         o_rst  = ro_rst     ;

always @(posedge i_clk ) begin
    if (r_cnt == P_RST_CYCLE - 1 || P_RST_CYCLE == 0) begin
        r_cnt <= r_cnt             ;
    end
    else begin
        r_cnt <= r_cnt + 'd1       ;
    end
end

always @(posedge i_clk ) begin
    if (r_cnt == P_RST_CYCLE - 1 || P_RST_CYCLE == 0) begin
        ro_rst <= 'd0              ;
    end
    else begin
        ro_rst <= 'd1              ;
    end
end


endmodule
