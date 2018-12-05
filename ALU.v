`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 07:33:07
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] ALUInputA,
    input [31:0] ReadData2,
    input[31:0] ExtendOut,
    output reg[31:0] Result,
    input ALUSrcB,
    input [2:0] ALUOp,
    output reg zero//表示运算结果是否为0
    );   
    reg[31:0] TempResult;
    reg[31:0] TempB;
    
    initial 
    begin
        zero<=1'bz;
        Result<=32'bz;
    end
    
    always@(ALUInputA or ReadData2 or ALUOp)
    begin
        zero<=0;        
        if(ALUSrcB==1)
            TempB=ExtendOut;
        else
            TempB=ReadData2;
            
        case(ALUOp)
            3'b000:
            begin
                TempResult=ALUInputA+TempB;
            end
            
            3'b001:
            begin
                TempResult=ALUInputA-TempB;
            end
            
            3'b010:
            begin
                TempResult=TempB<<ALUInputA;                
            end
            
            3'b011:
            begin
                TempResult=TempB|ALUInputA;
            end
            
            3'b100:
            begin
                TempResult=TempB&ALUInputA;
            end
            
            3'b101:
            begin
                TempResult=(~TempB)&ALUInputA;//It may be wrong here.
            end
            
            3'b110:
            begin
                TempResult=TempB^ALUInputA;
            end
            
            3'b111:
            begin
                TempResult=TempB^~ALUInputA;
            end
        endcase
                
        if(TempResult==0)
        begin
            zero<=1'b1;//如果运算结果为0，则zero置1
        end               
        Result<=TempResult;
    end
endmodule
