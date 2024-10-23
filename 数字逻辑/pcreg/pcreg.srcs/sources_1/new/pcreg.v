`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/11 18:00:25
// Design Name: 
// Module Name: pcreg
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
    input CLK,//ʱ���źţ���������Ч
    input D,//�����ź� D
    input RST_n,//��λ�źţ��ߵ�ƽ��Ч
    input ena,//1 λ����,��Ч�źŸߵ�ƽʱQ1����D��ֵ�����򱣳�ԭ�����
    output reg Q1,//����ź� Q
    output reg Q2//����ź�
    );
    always @(posedge CLK && ena, posedge RST_n)
    begin
        if(RST_n)  // ��λ�ź���Ч����0
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

module pcreg(
    input clk,//1 λ���룬�Ĵ���ʱ���źţ�������ʱΪ PC �Ĵ�����ֵ
    input rst,//1 λ���룬�첽�����źţ��ߵ�ƽʱ�� PC �Ĵ�������
    input ena,//1 λ����,��Ч�źŸߵ�ƽʱ PC �Ĵ������� data_in��ֵ�����򱣳�ԭ�����
    input [31:0] data_in,//32 λ���룬�������ݽ�������Ĵ����ڲ�
    output [31:0] data_out//32 λ���������ʱʼ����� PC�Ĵ����ڲ��洢��ֵ
    );
    wire q;   // 32λ�ֱ����
    Asynchronous_D_FF D0(clk, data_in[0], rst, ena, data_out[0], q);
    Asynchronous_D_FF D1(clk, data_in[1], rst, ena, data_out[1], q);
    Asynchronous_D_FF D2(clk, data_in[2], rst, ena, data_out[2], q);
    Asynchronous_D_FF D3(clk, data_in[3], rst, ena, data_out[3], q);
    Asynchronous_D_FF D4(clk, data_in[4], rst, ena, data_out[4], q);
    Asynchronous_D_FF D5(clk, data_in[5], rst, ena, data_out[5], q);
    Asynchronous_D_FF D6(clk, data_in[6], rst, ena, data_out[6], q);
    Asynchronous_D_FF D7(clk, data_in[7], rst, ena, data_out[7], q);
    Asynchronous_D_FF D8(clk, data_in[8], rst, ena, data_out[8], q);
    Asynchronous_D_FF D9(clk, data_in[9], rst, ena, data_out[9], q);
    Asynchronous_D_FF D10(clk, data_in[10], rst, ena, data_out[10], q);
    Asynchronous_D_FF D11(clk, data_in[11], rst, ena, data_out[11], q);
    Asynchronous_D_FF D12(clk, data_in[12], rst, ena, data_out[12], q);
    Asynchronous_D_FF D13(clk, data_in[13], rst, ena, data_out[13], q);
    Asynchronous_D_FF D14(clk, data_in[14], rst, ena, data_out[14], q);
    Asynchronous_D_FF D15(clk, data_in[15], rst, ena, data_out[15], q);
    Asynchronous_D_FF D16(clk, data_in[16], rst, ena, data_out[16], q);
    Asynchronous_D_FF D17(clk, data_in[17], rst, ena, data_out[17], q);
    Asynchronous_D_FF D18(clk, data_in[18], rst, ena, data_out[18], q);
    Asynchronous_D_FF D19(clk, data_in[19], rst, ena, data_out[19], q);
    Asynchronous_D_FF D20(clk, data_in[20], rst, ena, data_out[20], q);
    Asynchronous_D_FF D21(clk, data_in[21], rst, ena, data_out[21], q);
    Asynchronous_D_FF D22(clk, data_in[22], rst, ena, data_out[22], q);
    Asynchronous_D_FF D23(clk, data_in[23], rst, ena, data_out[23], q);
    Asynchronous_D_FF D24(clk, data_in[24], rst, ena, data_out[24], q);
    Asynchronous_D_FF D25(clk, data_in[25], rst, ena, data_out[25], q);
    Asynchronous_D_FF D26(clk, data_in[26], rst, ena, data_out[26], q);
    Asynchronous_D_FF D27(clk, data_in[27], rst, ena, data_out[27], q);
    Asynchronous_D_FF D28(clk, data_in[28], rst, ena, data_out[28], q);
    Asynchronous_D_FF D29(clk, data_in[29], rst, ena, data_out[29], q);
    Asynchronous_D_FF D30(clk, data_in[30], rst, ena, data_out[30], q);
    Asynchronous_D_FF D31(clk, data_in[31], rst, ena, data_out[31], q);
endmodule
