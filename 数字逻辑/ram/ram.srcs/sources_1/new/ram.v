`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 19:01:40
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,
    input ena,
    input wena,
    input [4:0] addr,
    input [31:0] data_in,
    output [31:0] data_out
    );
    reg [31:0] file [31:0];
    // ʹ����̬���������������ߵ����
    // ��ʹ���ź�Ϊ����дʹ��Ϊ��ʱ����Ϊ��ȡ��������ָ����ַ�����ݷŵ�����������
    // ������������Ϊ����̬��'bz'������ʾ��������������
    assign data_out = ((ena && !wena) ? file[addr] : 32'bz);
    // ʱ���ź������ش��������ǿ飬���ڴ���д�����
    always @(posedge clk) begin
    // ��ʹ���ź�Ϊ����дʹ��Ϊ��ʱ��ִ��д����
        if(ena && wena) begin  // д
        // �����������ϵ�����д�뵽ָ����ַ�Ĵ洢��λ��
            file[addr] <= data_in;
        end
    end
endmodule
