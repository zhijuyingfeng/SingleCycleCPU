`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 07:23:47
// Design Name: 
// Module Name: PC
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


module PC(
    input signed[31:0] PC_old,
    input CLK,
    input Reset,
    input PCWre,
    output reg signed[31:0] IAddr
    );
    
    
    always@(posedge CLK )
    begin
        if(PCWre)
        begin
            if(Reset==1'b0)
                IAddr<=32'h0000_0000;
            else
                IAddr<=PC_old;
        end
    end
endmodule
