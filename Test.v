`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/20 15:30:40
// Design Name: 
// Module Name: Test
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


module Test;
		
        reg clk;        
        
        //控制信号
        wire Extsel,PCWre,InsMemRW,ALUSrcB,DBDataSrc,RegWre,RD,WR,RegDst,PCSrc;
        wire[2:0]ALUOp;
        reg Reset;
        
        //中间数据
        wire[31:0] _instruction;
        wire signed[31:0]_PCOut;
        wire signed[31:0]_PCIn;
        wire _zero;
        wire signed[31:0] _ExtendOut;
        wire[4:0] _ThirdReg;
        wire[31:0] _RegData1;
        wire[31:0] _RegData2;
        wire[31:0] _WriteData;
        wire[31:0] _ALUResult;
        wire[31:0] _DataOut;
                
        wire [31:0]_IDataIn;
                        
        SingleCycleCPU uut(
            .clk(clk),
            .Extsel(Extsel),
            .PCWre(PCWre),
            .InsMemRW(InsMemRW),
            .ALUSrcB(ALUSrcB),
            .DBDataSrc(DBDataSrc),
            .RegWre(RegWre),
            .RD(RD),
            .WR(WR),
            .RegDst(RegDst),
            .PCSrc(PCSrc),
            .ALUOp(ALUOp),
            .Reset(Reset),
            
            
           // .ALUSRCB(ALUSRCB),
            ._instruction(_instruction),
            ._PCOut(_PCOut),
            ._PCIn(_PCIn),
            ._zero(_zero),
            ._ExtendOut(_ExtendOut),
            ._ThirdReg(_ThirdReg),
            ._RegData1(_RegData1),
            ._RegData2(_RegData2),
            ._WriteData(_WriteData),
            ._ALUResult(_ALUResult),
            ._DataOut(_DataOut),
           // ._PCIndect(_PCIndect),
            ._IDataIn(_IDataIn)
        );
        
        initial
        begin
            clk=0;
            Reset=0;

            #50;
            
            clk=!clk;
                       
            forever #20
            begin   
                clk = !clk;
                Reset=1;
            end
            #600 $stop;
        end        
endmodule
