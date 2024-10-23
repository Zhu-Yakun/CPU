`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/14 10:37:50
// Design Name: 
// Module Name: sccomp_dataflow
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


module sccomp_dataflow(
    input clk_in,       // ��������Ч
    input reset,        // �ߵ�ƽ��Ч
    output [31:0] inst, // ָ����Ϣ
    output [31:0] pc//,    // PC ��¼��ַ��Ϣ
    //output [7:0]  o_seg,//�������
    //output [7:0]  o_sel //Ƭѡ�ź�
);
    wire [31:0] IM_inst;
    wire [31:0] IM_addr;
    wire [31:0] DM_data_in;
    wire [31:0] DM_data_out;
    wire [31:0] DM_addr;
    wire DM_ena;
    wire DM_WR;
    assign inst = IM_inst;
    assign pc   = IM_addr;
    
    //wire clk_cpu; 
    
    wire [31:0] DM_addr_change;  //�޸Ĺ���ͷ�ŵ���� CPU �Ĳ��
    assign DM_addr_change = (DM_addr - 32'h10010000) / 4; //MARS ���������Ŵ洢 ���һ���ַ��ͬ
    wire [31:0] IM_addr_change;
    assign IM_addr_change = IM_addr - 32'h00400000; //MARS �л���ַ��ͬ
    //IMEM ָ��洢��  IP��
    IPcore_Board imem(
        IM_addr_change[12:2],      //���Թ����н��� 11 λ������
        IM_inst
    );
    //DMEM ���ݴ洢��
    DMEM dmem(
        .DM_clk(clk_in),
        .ena(DM_ena),
        .DM_WR(DM_WR),
        .addr(DM_addr_change[4:0]), //���� 32 �� 32 λ�Ĵ洢�ռ䣡����
        .data_in(DM_data_in),
        .data_out(DM_data_out)
    );
    //CPU
    CPU sccpu(
        .clk(clk_in),
        .rst(reset),
        .ena(1'b1),
        .IM_inst(IM_inst),
        .DM_data_out(DM_data_out),
        .IM_addr(IM_addr),
        .DM_data_in(DM_data_in),
        .DM_ena(DM_ena),
        .DM_WR(DM_WR),
        .DM_addr(DM_addr)
    );
    /*
    seg7x16 seg7x16_inst(
        .clk(clk_in),
        .reset(reset),
        .cs(1'b1),
        .i_data(im_instr_out),
        .o_seg(o_seg),
        .o_sel(o_sel)
    );
    
    Divider Divider_inst(
        .clk(clk_in),                   //ϵͳʱ��
        .rst_n(~reset),                 //��λ�ź�
        .clk_out(clk_cpu)               //�������CPU��ʱ��
    );
    */
    
endmodule

