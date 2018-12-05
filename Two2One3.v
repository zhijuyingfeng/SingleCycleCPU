`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 13:45:42
// Design Name: 
// Module Name: Two2One3
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


module Two2One3(
    input [31:0] ALUResult,
    input [31:0] DataMemory,
    input DBDataSrc,
    output reg[31:0] DB
    );
    
    always@(DBDataSrc or ALUResult or DataMemory)
    begin
        if(DBDataSrc==0)
        begin
            DB=ALUResult;
        end
        
        else if(DBDataSrc==1)
        begin
            DB=DataMemory;
        end
    end
endmodule
