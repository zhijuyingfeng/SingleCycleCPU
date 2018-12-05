`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/20 09:38:44
// Design Name: 
// Module Name: SingleCycleCPU
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


module SingleCycleCPU(
    input clk,
    
    //控制信号
    input Extsel,
    input PCWre,
    input InsMemRW,
    input ALUSrcB,
    input DBDataSrc,
    input RegWre,
    input RD,
    input WR,
    input RegDst,
    input PCSrc,
    input [2:0]ALUOp,
    input Reset,
    
    //中间数据
    input[31:0] _instruction,
    input signed[31:0]_PCOut,
    input signed[31:0]_PCIn,
    input _zero,
    input signed[31:0] _ExtendOut,
    input[4:0] _ThirdReg,
    input[31:0] _RegData1,
    input[31:0] _RegData2,
    input[31:0] _WriteData,
    input[31:0] _ALUResult,
    input[31:0] _DataOut,
    //input[31:0] _PCIndect,
    input[31:0] _IDataIn
    );
    
    //获取指令
    PC pc(
        .CLK(clk),//时钟信号
        .Reset(Reset),//PC归零信号
        .PCWre(PCWre),//CPU控制信号，控制是否停机
        .PC_old(_PCIn),//指令输入
        .IAddr(_PCOut)//指令输出
    );
    
    //译码器
    InstructionMemory instruction_memory(
        .IAddr(_PCOut),//输入地址
        .IDataIn(_IDataIn),
        .IDataOut(_instruction),//数据输出端口
        .RW(InsMemRW)
    );
    
    SignZeroExtend sign_zero_extend(
        .ExtSel(Extsel),//是否有符号扩展
        .Input(_instruction[15:0]),//立即数
        .Output(_ExtendOut)//输出
    );
    
//    LeftAdder left_adder(
//        .PC_old(_PCIn),
//        .PC_new(_PCOut)
//    );
    
//    RightAdder right_adder(
//        .Imme(_ExtendOut),
//        .PC(_PCIn),
//        .Output(_PCOut)
//    );
    
    RegisterFile register_file(
        .ReadReg1(_instruction[25:21]),
        .ReadReg2(_instruction[20:16]),
        .WriteReg(_ThirdReg),
        .WriteData(_WriteData),
        .ReadData1(_RegData1),
        .ReadData2(_RegData2),
        .CLK(clk),
        .WE(RegWre)
    );
    
    DataMemory data_memory(
        .WR(WR),
        .RD(RD),
        .DAddr(_ALUResult),
        .DataIn(_RegData2),
        .Dataout(_DataOut),
        .CLK(clk)
    );
    
    ControlUnit control_unit(
        .Ins(_instruction[31:26]),
        .PCWre(PCWre),
        .Extsel(Extsel),
        .InsMemRW(InsMemRW),
        .ALUSrcB(ALUSrcB),
        .PCSrc(PCSrc),
        .ALUOp(ALUOp),
        .RD(RD),
        .WR(WR),
        .DBDataSrc(DBDataSrc),
        .RegWre(RegWre),
        .RegDst(RegDst),
        .zero(_zero)
    );
    
    ALU alu(
        .ALUInputA(_RegData1),
        .ReadData2(_RegData2),
        .Result(_ALUResult),
        .ALUSrcB(ALUSrcB),
        .ExtendOut(_ExtendOut),
        .ALUOp(ALUOp),
        .zero(_zero)
    );
    
    Two2One0 two2one0(
        .RegDst(RegDst),
        .rd(_instruction[15:11]),
        .rt(_instruction[20:16]),
        .Output(_ThirdReg)
    );
    
//    Two2One1 two2one1(
//        .ALUSrcB(ALUSrcB),
//        .ReadData2(_RegData2),
//        .Extended(_ExtendOut),
//        .Output(ALUSRCB)
//    );
    
    Two2One2 two2one2(
        .PCSrc(PCSrc),
        .PC(_PCOut),
        .Imme(_ExtendOut),
        .PC_new(_PCIn)
    );
    
    Two2One3 two2one3(
        .ALUResult(_ALUResult),
        .DataMemory(_DataOut),
        .DBDataSrc(DBDataSrc),
        .DB(_WriteData)
    );
endmodule
