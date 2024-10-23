`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/12 22:12:33
// Design Name: 
// Module Name: Divider
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


module Divider (
    input I_CLK, // ����ʱ���źţ���������Ч
    input rst, // ��λ�ź�, �ߵ�ƽ��Ч
    output O_CLK // ���ʱ��
);
    parameter N = 100000;
    reg [32:0] count; // ������
    reg temp;
    initial
    temp = 0;
    always @ (posedge I_CLK) begin
        if(I_CLK) begin
            if (rst) begin
                count <= 0;
                temp <= 0;
            end else begin
                if (count == N / 2 - 1) begin
                    count <= 0;
                    temp <= ~temp; // ÿ�ﵽ N / 2 - 1 ��������ת���ʱ���ź�
                end else begin
                    count <= count + 1; // ��������1
                end
            end
        end
    end
    assign O_CLK = temp;
endmodule
