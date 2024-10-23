`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 19:18:23
// Design Name: 
// Module Name: ram_tb
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


module ram_tb();
    reg clk; //�洢��ʱ���źţ�������ʱ��ram �ڲ�д������
    reg ena; //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У��������z
    reg wena;//�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����enaͬʱ��Чʱ�ſɶԴ洢�����ж�д
    reg [4:0] addr; //�����ַ��ָ�����ݶ�д�ĵ�ַ
    reg [31:0] data_in; //�洢��д������ݣ���clk ������ʱ��д��
    wire [31:0] data_out; //�洢�����������ݣ�
    ram uut(clk, ena, wena, addr, data_in, data_out);
    initial 
    begin
        clk=0;
        ena = 0;
        #20 ena = 1;     
       
        wena = 1;
        addr = 5'b00000;
        data_in = 32'b0001;
        #20
        
        addr = 5'b00001;
        data_in = 32'b0101;
        #20
        
        addr = 5'b00010;
        data_in = 32'b1101;
        #20
        
        addr = 5'b01101;
        data_in = 32'b1010_1111;
        #20
        
        addr = 5'b11110;
        data_in = 32'b1101_1011_0110;
        #20;
        
        addr = 5'b10101;
        data_in = 32'b0100_1101_1011_0110;
        #20
        
        wena = 0;
        addr = 5'b00000;
        #20
        addr = 5'b00001;
        #20
        addr = 5'b00010;
        #20
        addr = 5'b01101;
        #20
        addr = 5'b11110;
        #20
        addr = 5'b10101;
        #20
        ena = 0;
    end
    always #2 clk=~clk;
endmodule
