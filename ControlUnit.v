`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 14:04:50
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [5:0] Ins,//Ö¸Áî²Ù×÷Âë
    input zero,
    output reg PCWre,
    output reg Extsel,
    output reg InsMemRW,
    output reg ALUSrcB,
    output reg PCSrc,
    output reg[2:0]ALUOp,
    output reg RD,
    output reg WR,
    output reg DBDataSrc,
    output reg RegWre,
    output reg RegDst
    );
    
    initial
    begin
        PCWre<=1;
        InsMemRW<=1;
        Extsel<=0;
        RegDst<=0;
        RegWre<=1;
        ALUSrcB<=1;
        PCSrc<=0;
        RD<=1;
        WR<=1;
        ALUOp<=3'b000;
        DBDataSrc<=0;
    end
    
    always@(Ins or zero)
    begin
        case(Ins)
            6'b000000://addu
            begin
                Extsel=0;
                RegDst=1;
                ALUSrcB=0;
                ALUOp=3'b000;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
            end
        
            6'b000001://addiu
            begin
                RegDst=0;
                ALUSrcB=1;
                ALUOp=3'b000;                
                Extsel=0;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
            end
        
            6'b000010://subu
            begin
                RegDst=1;
                ALUSrcB=0;
                ALUOp=3'b001;
                
                Extsel=1'bx;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
            end 
        
            6'b010000://ori
            begin
                RegDst=0;
                ALUSrcB=1;
                ALUOp=3'b011;
                
                Extsel=0;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
        
            end
        
            6'b010001://and
            begin
                RegDst=1;
                ALUSrcB=0;
                ALUOp=3'b100;
                
               Extsel=1'bx;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
            end
        
            6'b010010://or
            begin
                RegDst=1;
                ALUSrcB=0;
                ALUOp=3'b011;
                
                Extsel=1'bx;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
                PCSrc=0;
                RD=1;
                WR=1;
                DBDataSrc=0;
            end
        
            6'b100110://sw
            begin
                Extsel=1;
                RegDst=1'bx;//
                RegWre=0;
                ALUSrcB=1;
                PCSrc=0;
                WR=0;
                ALUOp=3'b000;
                
                PCWre=1;
                InsMemRW=1;
                RD=1;
                DBDataSrc=0;
            end
        
            6'b100111://lw
            begin
                Extsel=1;
                RegDst=0;
                ALUSrcB=1;
                PCSrc=0;
                RD=0;
                WR=1;
                ALUOp=3'b000;
                DBDataSrc=1;
                PCWre=1;
                InsMemRW=1;
                RegWre=1;
            end
        
            6'b110000://bne
            begin
                Extsel=1;
                RegDst=1'bx;
                ALUSrcB=0;
                ALUOp=3'b001;
                DBDataSrc=1'bz;
                RegWre=0;
                PCWre=1;
                InsMemRW=1;
                RD=1;
                WR=1;
                if(zero==0)
                begin
                    PCSrc=1;
                end
                else if(zero==1)
                begin
                    PCSrc=0;
                end
                
            end
        
            6'b111111://halt
            begin
                Extsel=1'bx;
                PCWre=0;
                RegDst=1'bx;
                RegWre=0;
                PCSrc=1'bx;
                RD=1'bx;
                WR=1'bx;
                DBDataSrc=1'bx;
                ALUSrcB=1'bx;
                ALUOp=3'bxxx;
                InsMemRW=1;
            end
        endcase
    end
    
endmodule
