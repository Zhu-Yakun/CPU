`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 19:26:06
// Design Name: 
// Module Name: post_sim_tb
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


module post_sim_tb; 
    reg clk_in; // ʱ���ź� 
    reg reset; // ��λ�ź� 
    wire [31:0] inst; // Ҫִ�е�ָ�� 
    wire [31:0] pc; // ��һ��ָ��ĵ�ַ 
    //wire[7:0] o_seg; 
    //wire[7:0] o_sel; 
    initial 
    begin 
        clk_in = 1'b0; 
        reset = 1'b1; 
        #1 reset = 1'b0; 
    end 
    
    //ʵ���� 
    
    sccomp_dataflow sc_inst(
        .clk_in(clk_in),
        .reset(reset),
        .inst(inst), //���ָ��
        .pc(pc)//,   //ִ�е�ַ
        //.o_seg(o_seg),//�������
        //.o_sel(o_sel) //Ƭѡ�ź�
    );
    /*
    CPU_Board my_CPU_Board( 
     .clk_in(clk_in), 
     .reset(reset), 
     .inst(inst), 
     .pc(pc), 
     .o_seg(o_seg), 
     .o_sel(o_sel) 
     ); 
    */
    
    always #50 clk_in = ~clk_in; 
endmodule
