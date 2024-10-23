`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 23:36:39
// Design Name: 
// Module Name: PCreg
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


module PCreg(
    input PC_CLK,   //�½�����Ч
    input rst,      //�ߵ�ƽ��λ
    input wena,     //д��ʹ��
    input[31:0] data_in,        //д�� PC ��ֵ
    output reg [31:0] data_out //��ȡ PC ��ֵ
);
    always @(negedge PC_CLK or posedge rst)
    begin
        if(rst==1'b1)
            data_out <= 32'h00400000;  //Mars ָ��洢��ʼ��ַ
        else if(wena==1)
            data_out <= data_in;
    end
endmodule
