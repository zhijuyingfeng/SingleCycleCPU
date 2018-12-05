`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 13:56:33
// Design Name: 
// Module Name: Two2One2
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


module Two2One2(
    input PCSrc,
    input signed[31:0] PC,
    input signed[31:0] Imme,
    output reg signed[31:0]PC_new
    );
    
    reg signed [31:0]Temp;
    
    always@(PCSrc or PC or Imme)
    begin
        if(PCSrc==0)
        begin
            PC_new=PC+4;
        end
        
        else
        begin
            PC_new=PC+(Imme<<2)+4;
        end
    end
endmodule
