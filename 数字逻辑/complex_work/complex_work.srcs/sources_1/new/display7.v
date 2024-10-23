`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/12 20:28:10
// Design Name: 
// Module Name: seven_segment_display
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

module Display (
    input clk,         // ��Ƶʱ��
    input [7:0] score, // �÷֣�Ҫ��ʾ������
    output reg [6:0] oData, // 7�������
    output reg [7:0] an     // 8�������ʹ�ܶ�
    );

    integer cnt = 0;
    wire [3:0] store [1:0];  // �洢ʮ���Ƶ�ÿһλ����ֵ ,
    
    assign store[0] = score % 10;
    assign store[1] = score / 10;
    
    // Ƭѡ����
    always @(posedge clk) begin
        if(cnt == 1) 
            cnt <= 0;
        else 
            cnt <= cnt + 1;
        an <= 8'b11111111;
        an[cnt] <= 0;
        case (store[cnt])        //����ת���õ���ʵ���������ʾ���ݽ��ж�Ӧ�ĸ�ֵ
            4'b0000: oData <= 7'b1000000;
            4'b0001: oData <= 7'b1111001;
            4'b0010: oData <= 7'b0100100;
            4'b0011: oData <= 7'b0110000;
            4'b0100: oData <= 7'b0011001;
            4'b0101: oData <= 7'b0010010;
            4'b0110: oData <= 7'b0000010;
            4'b0111: oData <= 7'b1111000;
            4'b1000: oData <= 7'b0000000;
            4'b1001: oData <= 7'b0010000;
            default: oData <= 7'b1111111; 
        endcase
    end
    
endmodule
