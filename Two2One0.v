`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 08:25:09
// Design Name: 
// Module Name: Two2One0
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


module Two2One0(
    input RegDst,
    input [4:0] rd,
    input [4:0] rt,
    output reg[4:0] Output
    );
    always@(RegDst or rd or rt)
    begin
        if(RegDst==0)
        begin
            Output<=rt;
        end
        
        else
        begin
            Output<=rd;
        end
    end
endmodule
