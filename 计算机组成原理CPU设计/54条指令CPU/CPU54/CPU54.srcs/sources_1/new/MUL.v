`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 11:12:54
// Design Name: 
// Module Name: MUL
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


module MUL(
    input sign_flag,    //�Ƿ����з��ų˷�
    input [31:0] A,     //����ĳ���A
    input [31:0] B,     //����ĳ���B
    output [31:0] HI,   //��32λ���
    output [31:0] LO    //��32λ���
    );

    wire [63:0] result;                 //���ͳһ�洢��result��
    wire [63:0] unsigned_result;        //�����޷��ų˷����
    wire signed [63:0] signed_result;   //�����з��ų˷����
    wire [63:0] unsigned_A;             //��չ���޷���A
    wire [63:0] unsigned_B;             //��չ���޷���B
    wire signed [63:0] signed_A;        //��չ���з���A
    wire signed [63:0] signed_B;        //��չ���з���B
    
    assign unsigned_A = { 32'd0, A };
    assign unsigned_B = { 32'd0, B };
    assign unsigned_result = unsigned_A * unsigned_B;
    
    assign signed_A = { {32{A[31]}} , A };
    assign signed_B = { {32{B[31]}} , B };
    assign signed_result = signed_A * signed_B;
    
    assign result = sign_flag ? signed_result : unsigned_result;
    
    assign HI = result[63:32];
    assign LO = result[31:0];
endmodule
