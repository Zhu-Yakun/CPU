`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 19:03:49
// Design Name: 
// Module Name: Counter8
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

module JK_FF(
    input CLK,  //ʱ���źţ���������Ч
    input J,    //�����ź� J
    input K,    //�����ź� K
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    output reg Q1 //����ź� Q
    );
    always @(posedge CLK, negedge RST_n)
        if(!RST_n)  // ��λ�ź�����0
        begin
            Q1 = 0;
        end
        else if(J == 0 && K == 1)
        begin  // JK = 01��0
            Q1 = 0;
        end
        else if(J == 1 && K == 0)
        begin  // JK = 10��1
            Q1 = 1;
        end
        else if(J == 1 && K == 1)
        begin  // JK = 11ȡ��
            Q1 = !Q1;
        end
        else
        begin
        end
endmodule

module display7(
    input [2:0] iData,  // ����Ķ�������
    output [6:0] oData  // 7��������ź�
    );
    assign oData[0] = (~iData[2] & ~iData[1] & iData[0]) | (iData[2] & ~iData[1] & ~iData[0]);
    assign oData[1] = (iData[2] & ~iData[1] & iData[0]) | (iData[2] & iData[1] & ~iData[0]);
    assign oData[2] = ~iData[2] & iData[1] & ~iData[0];
    assign oData[3] = (~iData[2] & ~iData[1] & iData[0]) | (iData[2] & ~iData[1] & ~iData[0]) | (iData[2] & iData[1] & iData[0]);
    assign oData[4] = (~iData[2] & ~iData[1] & iData[0])|(~iData[2] & iData[1] & iData[0])|(iData[2] & ~iData[1] & ~iData[0])|(iData[2] & ~iData[1] & iData[0])|(iData[2] & iData[1] & iData[0])|(~iData[2] & ~iData[1] & iData[0]);
    assign oData[5] = (~iData[2] & ~iData[1] & iData[0])|(~iData[2] & iData[1] & ~iData[0])|(~iData[2] & iData[1] & iData[0])|(iData[2] & iData[1] & iData[0]);
    assign oData[6] = (~iData[2] & ~iData[1] & ~iData[0])|(~iData[2] & ~iData[1] & iData[0])|(iData[2] & iData[1] & iData[0]);
endmodule
/*
module Divider (
    input I_CLK, // ����ʱ���źţ���������Ч
    input rst, // ��λ�ź�, �ߵ�ƽ��Ч
    output O_CLK // ���ʱ��
);  
    parameter N = 100000000;
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
*/
module Counter8(
    input CLK,     //ʱ���źţ���������Ч
    input rst_n,   //��λ�źţ��͵�ƽ��Ч
    output [2:0] oQ,  //�����Ƽ��������
    output [6:0] oDisplay  //�߶�������ʾ�����
    );
    //wire O_CLK;
    //Divider D0(CLK, !rst_n, O_CLK);
    JK_FF JK0(CLK, 1, 1, rst_n, oQ[0]);
    JK_FF JK1(CLK, oQ[0], oQ[0], rst_n, oQ[1]);
    JK_FF JK2(CLK, oQ[0]&oQ[1], oQ[0]&oQ[1], rst_n, oQ[2]);
    display7 dis(oQ, oDisplay);
endmodule
