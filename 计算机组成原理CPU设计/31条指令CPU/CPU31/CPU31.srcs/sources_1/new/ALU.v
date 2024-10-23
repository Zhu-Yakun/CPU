`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 23:15:57
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] a,              // A�ӿ�
    input [31:0] b,              // B�ӿ�
    input [3:0] aluc,            // ALUC��λ����ָ��
    output reg [31:0] r = 32'b0,// �������
    output reg zero=0,          // ZF��־λ
    output reg carry=0,         // CF��־λ
    output reg negative=0,      // NF(SF)��־λ
    output reg overflow=0       // OF��־λ
);
    always@(*)
    begin
        casex (aluc)
            4'b0000:  //ADDU ADDIU
                {carry ,r} = {1'b0, a} + {1'b0, b};  // ��������ͬʱ�õ���λ��־
            4'b0010:  //ADD ADDI
            begin    //overflow=1 ���λ�ʹθ�λ��λ״̬��ͬ
                {overflow, r} = {1'b0,a} + {1'b0, b};
                overflow = a[31]^b[31]^r[31]^overflow;
            end
            4'b0001:  //SUBU
            begin
                {carry, r} = {1'b1, a} - {1'b0, b};
                carry = ~carry;
            end
            4'b0011:  //SUB BEQ BNE
            begin
                r = a - b;
                overflow = (b != {1'b1,30'b0,1'b1}) ? a[31]^b[31] & a[31]^r[31] : ~a[31] && a;
            end
            4'b0100:  //AND ANDI
                r = a & b;
            4'b0101:  //OR ORI
                r = a | b;
            4'b0110:  //XOR XORI
                r = a ^ b;
            4'b0111:  //NOR
                r = ~(a | b);
            4'b100x:  //LUI
                r={b[15:0], 16'b0};
            4'b1011:  //SLT SLTI
            begin
                r = a - b;
                if(r==32'b0)
                    zero=1;
                else
                    zero=0;
                if(a[31]^b[31] && a[31]^ r[31]) //if(overflow)
                begin
                    negative = a[31];
                end
                else
                begin
                    negative = r[31];
                end
                r = negative;
            end
            4'b1010://SLTU SLTIU
            begin
                {carry, r} = {1'b1, a} - {1'b0, b};
                if(r==32'b0)
                    zero=1;
                else
                    zero=0;
                carry = ~carry; //carry=r,�� a-b<0 ʱΪ 1
                r = carry;
            end
            4'b1100:  //SRA SRAV
                {r, carry} = b[31] ? ~(~{b,1'b0} >> a): {b,1'b0} >> a;
            4'b111x:  //SLL SLLV
                {carry, r} = {1'b0, b} << a;
            4'b1101://SRL SRLV
                {r, carry} = {b,1'b0} >> a;
            default:
                ;
        endcase
        if(aluc != 4'b101x)
            if(r==32'b0)
                zero = 1;
            else
                zero = 0;
        if(aluc != 4'b101x)
            negative = r[31];
    end
endmodule
