`timescale 1ns/1ps
//


module count_module#(
    parameter                  P_CNT_WIDTH    = 4
)(
    input                      i_clk            ,
    input                      i_rst            ,
    input                      i_en             ,
    output                     o_led            ,
    output [P_CNT_WIDTH-1 : 0] o_cnt
);

reg  [P_CNT_WIDTH-1 : 0]       ro_cnt;
reg                            ro_led;

assign o_cnt = ro_cnt ;
assign o_led = ro_led ;

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        ro_cnt <= 'd0;
    end else begin
        ro_cnt <= ro_cnt + 1;
    end
end

always @(posedge i_clk, posedge i_rst) begin
    if(i_rst)begin
        ro_led <= 'd0;
    end else if(ro_cnt == 'd10)begin
        ro_led <= 'd1;
    end else begin
        ro_led <= 'd0;
    end
end

endmodule