`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 20:24:28
// Design Name: 
// Module Name: JK_FF
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
    output reg Q1, //����ź� Q
    output reg Q2  //����ź�
    );
    always @(posedge CLK, negedge RST_n)
        if(!RST_n)  // ��λ�ź�����0
        begin
            Q1 = 0;
            Q2 = 1;
        end
        else if(J == 0 && K == 1)
        begin  // JK = 01��0
            Q1 = 0;
            Q2 = 1;
        end
        else if(J == 1 && K == 0)
        begin  // JK = 10��1
            Q1 = 1;
            Q2 = 0;
        end
        else if(J == 1 && K == 1)
        begin  // JK = 11ȡ��
            Q1 = !Q1;
            Q2 = !Q2;
        end
        else
        begin
        end
endmodule
