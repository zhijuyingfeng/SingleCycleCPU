`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 23:22:34
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input[4:0] ReadReg1,
    input[4:0] ReadReg2,
    input [4:0]WriteReg,
    input [31:0]WriteData,
    output [31:0]ReadData1,
    output [31:0] ReadData2,
    input WE,
    input CLK
    );
    
    reg[31:0] registers[1:31];//1~31号寄存器 因为0号寄存器不可修改，始终为0   
    //从寄存器读取数据
    assign ReadData1=ReadReg1==0?0:registers[ReadReg1];
    assign ReadData2=ReadReg2==0?0:registers[ReadReg2];
       
    integer i;
    initial
    begin
        for(i=0;i<32;i=i+1)
        begin
            registers[i]<=0;
        end
    end
    
    always@(posedge CLK)
    begin
        if(WE==1)
            registers[WriteReg]<=WriteData;
    end   
endmodule
