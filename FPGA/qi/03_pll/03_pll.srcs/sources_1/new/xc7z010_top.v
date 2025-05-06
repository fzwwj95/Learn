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


reg           r_bram_en    ;
reg           r_bram_wen   ;
reg  [9 : 0]  r_bram_addr  ;
reg  [7 : 0]  r_bram_data  ;
reg  [7 : 0]  r_cnt        ;

wire [7 : 0]  w_bram_dout  ;


bram_8x1024 bram_8x1024_U0(
  .clka    (w_clk_125M    ),      // input  wire clka
  .ena     (r_bram_en     ),      // input  wire ena
  .wea     (r_bram_wen    ),      // input  wire [0 : 0] wea
  .addra   (r_bram_addr   ),      // input  wire [9 : 0] addra
  .dina    (r_bram_data   ),      // input  wire [7 : 0] dina
  .douta   (w_bram_dout   )       // output wire [7 : 0] douta
);

always @(posedge w_clk_125M, negedge w_locked) begin
    
    if( !w_locked ) begin
        r_bram_en   <= 'd0  ;
        r_bram_wen  <= 'd0  ;
        r_bram_data <= 'd0  ;
        r_bram_addr <= 'd0  ;      
    end else if (r_cnt >= 1 && r_cnt <= 10) begin
        r_bram_en   <= 'd1           ;
        r_bram_wen  <= 'd1           ;
        r_bram_data <=  r_cnt        ;
        r_bram_addr <=  r_cnt - 'd1  ; 
    end else if (r_cnt >= 21 && r_cnt <= 30) begin
        r_bram_en   <= 'd1           ;
        r_bram_wen  <= 'd0           ;
        r_bram_data <= 'd0           ;
        r_bram_addr <=  r_cnt - 21   ;    
    end else begin
        r_bram_en   <= 'd0  ;
        r_bram_wen  <= 'd0  ;
        r_bram_data <= 'd0  ;
        r_bram_addr <= 'd0  ;
    end
end

always @(posedge w_clk_125M, negedge w_locked) begin

    if( !w_locked ) begin
        r_cnt <= 'd0           ;
    end else if (r_cnt >= 50) begin
        r_cnt <= 'd0           ;
    end else begin
        r_cnt <= r_cnt + 'd1   ;
    end
    
end


endmodule
