`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 23:25:21
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input[31:0] DAddr,
    input [31:0]DataIn,
    output reg [31:0]Dataout,
    input RD,
    input WR,
    input CLK
    
    );
    reg [7:0] memory [0:63];
    integer i;
    initial
    begin
        for (i = 0; i < 63; i = i + 1) 
        begin
            memory[i] <= 7'b0;
        end
    end
    
    always@(negedge CLK or RD)
    begin
        if(RD==0)
        begin
            Dataout<={memory[DAddr],memory[DAddr+1],
                        memory[DAddr+2],memory[DAddr+3]};
        end
        
        else if(RD==1)
        begin
            Dataout<=32'bz;
        end
        
        if(WR==0)
        begin
            memory[DAddr]<=DataIn[31:24];
            memory[DAddr+1]<=DataIn[23:16];
            memory[DAddr+2]<=DataIn[15:8];
            memory[DAddr+3]<=DataIn[7:0];
        end
    end        
endmodule
