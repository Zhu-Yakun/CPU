`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 11:12:54
// Design Name: 
// Module Name: IMEM
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


module IMEM(
    input [10:0] im_addr_in,     //11λָ�����ַ����IMEM�ж�ָ��
    output [31:0] im_instr_out   //32λָ����
    ); 

    dist_mem_gen_1 imem(    //ʵ����IP�ˣ�����ָ�����ַ���ض�Ӧ��ָ��
        .a(im_addr_in),     //�ӿں�IMEMģ���Ӧ
        .spo(im_instr_out)
        );
endmodule

