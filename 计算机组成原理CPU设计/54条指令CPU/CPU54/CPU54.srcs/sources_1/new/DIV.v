`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 11:12:54
// Design Name: 
// Module Name: DIV
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


module DIV(
    input sign_flag,    //�Ƿ����з��ų���
    input [31:0] A,     //����ı�����
    input [31:0] B,     //����ĳ���
    output [31:0] R,    //����
    output [31:0] Q     //��
    );

    wire signed [31:0] signed_A;  //�з��ű�����
    wire signed [31:0] signed_B;  //�з��ų���
    
    assign signed_A = A;
    assign signed_B = B;
    
    assign R =  (B == 32'd0) ? 32'd0 : (sign_flag ? (signed_A % signed_B) : (A % B));
    assign Q =  (B == 32'd0) ? 32'd0 : (sign_flag ? (signed_A / signed_B) : (A / B));
endmodule

