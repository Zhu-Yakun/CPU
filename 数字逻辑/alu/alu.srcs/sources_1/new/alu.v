`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/30 16:17:24
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,     //32 λ���룬������ 1
    input [31:0] b,     //32 λ���룬������ 2
    input [3:0] aluc,   //4 λ���룬���� alu �Ĳ���
    output reg [31:0] r,//32 λ������� a��b ���� aluc ָ���Ĳ�������
    output reg zero,    //0 ��־λ
    output reg carry,   // ��λ��־λ
    output reg negative,// ������־λ
    output reg overflow // �����־λ
    );
    integer a0,b0;
    always@(*)
    begin
        // ����ALU������alucѡ��ִ�еĲ���
        casex(aluc)
            4'b0000: // Addu
            begin
                {carry, r} = a + b;
            end
            4'b0001:// Subu
            begin
                {carry,r} = a - b;
            end
            4'b0010: // Add
            begin
                r = a + b;
                overflow = ((a[31] == b[31]) & (r[31]^a[31])) ? 1 : 0;
            end
            4'b0011:// Sub
            begin
                r = a - b;
                overflow=(a[31]^b[31])&(r[31]^a[31]) ? 1 : 0;
            end
            
            // �߼�����
            4'b0100: r = a & b;// And
            4'b0101: r = a | b;// Or
            4'b0110: r = a ^ b;// Xor
            4'b0111: r = ~(a | b);// Nor
            4'b0100x: r = {b[15:0],16'b0};// Lui
            
            // ��λ����
            4'b1010:// Sltu
            begin
                r = (a < b) ? 1 : 0;
                carry = r;
                zero = (a == b) ? 1 : 0;
                negative = (r[31] == 1) ? 1 : 0;
            end
            4'b1011:// SLT
            begin
                a0 = a;
                b0 = b;
                r = (a0 < b0) ? 1 : 0;
                zero = (a0 == b0) ? 1 : 0;
                negative = (a0 < b0) ? 1 : 0;
            end
            
            4'b1100:// Sra
            begin
                b0 = b;
                r = b0 >>> a;
                carry = (a == 0) ? 0 : b0[a-1];
            end
            4'b1101: begin// Srl
                r = b >> a;
                carry = (a == 0) ? 0 : b[a-1];
            end
            4'b111x: {carry,r} = b << a;// Sll/Sla
            default: r = 32'b0;
        endcase
        
        if(aluc != 4'b1011 && aluc != 4'b1010)
        begin
            zero = (r == 32'b0);  // ������Ϊ��, ����zero��־
            if(r[31] == 1)   // �����������λΪ1, ����negative��־
                negative = 1;
            else
                negative = 0;
        end
    end
endmodule
