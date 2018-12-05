`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 23:24:12
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input signed[31:0] IAddr,
    input [31:0] IDataIn,
    output reg[31:0] IDataOut,
    input RW
    );
    
    reg[7:0]member [0:255];
    
    initial
        $readmemh("E:/projects/CPU/CPU.srcs/sim_1/new/ListRepo.txt",member);
always@(RW or IAddr)
begin
    if(RW==0)
    begin
        member[IAddr+1]<=IDataIn[23:16];
        member[IAddr+2]<=IDataIn[15:8];
        member[IAddr+3]<=IDataIn[7:0];
    end  
    else
    begin
        IDataOut={member[IAddr],member[IAddr+1],
                  member[IAddr+2],member[IAddr+3]};
    end
end
endmodule
