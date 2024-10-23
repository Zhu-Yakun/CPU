`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 22:01:38
// Design Name: 
// Module Name: DMEM
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


module DMEM(
    input DM_clk,   //��������Ч
    input ena,      //�ߵ�ƽ��Ч
    input DM_WR,    //��д�Ͷ�
    input [4:0]addr,
    input [31:0] data_in,
    output[31:0] data_out
);
    reg [31:0] D_mem [31:0]; //�洢���� 32 �� 32 λ�ļĴ���

    always@(posedge DM_clk) //��������Ч
    begin
        if(ena==1'b1&&DM_WR==1'b1)
            D_mem[addr]<=data_in; //��������ֵ
    end
    assign data_out = (ena==1'b1) ? D_mem[addr] : 32'bz;
endmodule
