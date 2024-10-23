`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 16:29:32
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb;
    reg clk_in;            //ʱ���ź�
    reg reset;            //��λ�ź�
    wire [31:0] inst;   //Ҫִ�е�ָ��
    wire [31:0] pc;     //��һ��ָ��ĵ�ַ
    wire [7:0]  o_seg;  //�������
    wire [7:0]  o_sel;  //Ƭѡ�ź�
    wire clk_cpu;
    //integer file_open;
    
    initial 
    begin
        clk_in = 1'b0;
        reset = 1'b1;
        #50 reset = 1'b0;
    end
    
    always  #50 clk_in = ~clk_in;
    
    sccomp_dataflow sc_inst(
        .clk_in(clk_in),
        .reset(reset),
        .clk_cpu(clk_cpu),
        .inst(inst), //���ָ��
        .pc(pc),   //ִ�е�ַ
        .o_seg(o_seg),//�������
        .o_sel(o_sel) //Ƭѡ�ź�
    );

endmodule
