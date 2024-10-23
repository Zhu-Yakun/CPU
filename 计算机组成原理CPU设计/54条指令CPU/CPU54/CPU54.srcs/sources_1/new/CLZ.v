`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 11:12:54
// Design Name: 
// Module Name: CLZ
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

/********************** ���ַ�����ǰ���� *********************/
module CLZ(
    input [31:0] CLZ_in,    //Ҫ����ǰ��0����ֵ
    output [31:0] CLZ_out   //���ǰ��0�ĸ���
    );

    wire [4:0]  data_chk;
    wire [15:0] data_1;	
    wire [7:0]  data_2;
    wire [3:0]  data_3;
    wire [1:0]  data_4;
     
    assign data_chk[4] = |CLZ_in[31:16]; //��16λ���,��������
    assign data_chk[3] = |data_1[15:8];
    assign data_chk[2] = |data_2[7:4];
    assign data_chk[1] = |data_3[3:2];
    assign data_chk[0] = |data_4[1]; 
     
    assign	data_1	= (data_chk[4]) ? CLZ_in[31:16] : CLZ_in[15:0];     //��CLZ_in��16λ��1,��data1ȡ���16λ,����ȡ��16λ
    assign	data_2 	= (data_chk[3]) ? data_1[15:8] 	: data_1[7:0];		//��data_1��8λ��1,��data2ȡ���8λ,����ȡ��8λ
    assign	data_3 	= (data_chk[2]) ? data_2[7:4] : data_2[3:0];		//��data_2��4λ��1,��data3ȡ���4λ,����ȡ��4λ
    assign	data_4 	= (data_chk[1]) ? data_3[3:2] : data_3[1:0];		//��data_3��2λ��1,��data4ȡ���2λ,����ȡ��2λ
    assign 	CLZ_out = (|CLZ_in) ? {27'b0, ~data_chk} : 6'd32;	        //��CLZ_inΪȫ0,CLZ_out = 6'd32

endmodule

