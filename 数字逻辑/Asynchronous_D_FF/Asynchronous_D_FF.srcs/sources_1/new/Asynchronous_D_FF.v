`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 20:04:13
// Design Name: 
// Module Name: Asynchronous_D_FF
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


module Asynchronous_D_FF(
    input CLK,  //ʱ���źţ���������Ч
    input D,   //�����ź� D
    input RST_n,  //��λ�źţ��͵�ƽ��Ч
    output reg Q1,  //����ź� Q
    output reg Q2   //����ź�
    );   // ʱ�������غ͸�λ�źŶ�Ҫ�仯���첽
    always @(posedge CLK, negedge RST_n)
    begin
        if(!RST_n)  // ��λ�ź���0
        begin
            Q1 = 0;
            Q2 = 1;
        end
        else  // ����Dֵ
        begin
            Q1 = D;
            Q2 = ~D;
        end
    end
endmodule
