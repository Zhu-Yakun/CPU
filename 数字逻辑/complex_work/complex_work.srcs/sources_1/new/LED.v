`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/13 15:26:21
// Design Name: 
// Module Name: LED
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


module LED(
    input to_left,  // �����ź�
    input to_right, // �����ź�
    output led1,    // LED��1
    output led2     // LED��2
    );
    assign led1 = to_right;
    assign led2 = to_left;
    
endmodule
