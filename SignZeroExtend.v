`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/19 08:08:24
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(
    input ExtSel,
    input [15:0] Input,
    output  reg signed[31:0] Output
    );
    initial
        Output <= 32'bz;
    always@(Input or ExtSel)
    begin
        if(ExtSel==0)//零扩展补0
        begin
            Output={16'b0000_0000_0000_0000,Input};
        end
        
        else if(ExtSel==1)//符号扩展补最高位
        begin
            Output={{16{Input[15]}},Input};
        end
    end
    
        
endmodule
