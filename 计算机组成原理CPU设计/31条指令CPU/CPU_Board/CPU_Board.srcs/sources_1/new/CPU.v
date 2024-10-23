`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/14 10:08:10
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,    //��������Ч
    input rst,    //�ߵ�ƽ����
    input ena,    //�ߵ�ƽ��Ч
    input [31:0] IM_inst,      //��ǰҪִ�е�ָ��
    input [31:0] DM_data_out,  //��ȡ����DMEM�ľ�������
    output [31:0] IM_addr,     //���ָ���ַ
    output [31:0] DM_data_in,  //Ҫд��DMEM������
    output DM_ena,             //�Ƿ���Ҫ����DMEM
    output DM_WR,              //�������DMEM��д��/��ȡ
    output [31:0] DM_addr      //����DMEM�ĵ�ַ
);
    //PC
    wire [31:0] PC_in;
    wire [31:0] PC_out;
    //RF
    wire RF_W;
    wire [31:0]RF_Rs;
    wire [31:0]RF_Rt;
    wire [31:0]RF_Rd;
    wire [4:0]RF_Rsc;
    wire [4:0]RF_Rtc;
    wire [4:0]RF_Rdc;
    //ALU
    wire [31:0] ALU_a;
    wire [31:0] ALU_b;
    wire [31:0] ALU_r;
    wire [3:0] ALU_aluc;
    wire ALU_zero;
    wire ALU_carry;
    wire ALU_negative;
    wire ALU_overflow;
    //PC ʵ����
    PCreg cpu_PC(
        .PC_CLK(clk),
        .rst(rst),
        .wena(ena),
        .data_in(PC_in),
        .data_out(PC_out)
    );
    assign IM_addr = PC_out;
    //regfile ʵ����
    RegFile cpu_ref(
        .RF_clk(clk),
        .RF_rst(rst),
        .RF_ena(ena),
        .RF_W(RF_W),
        .Rdc(RF_Rdc),
        .Rsc(RF_Rsc),
        .Rtc(RF_Rtc),
        .Rd(RF_Rd),
        .Rs(RF_Rs),
        .Rt(RF_Rt)
    );
    //ALU ʵ����
    ALU cpu_ALU(
        .a(ALU_a),
        .b(ALU_b),
        .aluc(ALU_aluc),
        .r(ALU_r),
        .zero(ALU_zero),
        .carry(ALU_carry),
        .negative(ALU_nagetive),
        .overflow(ALU_overflow)
    );
    assign DM_data_in = RF_Rt;
    assign DM_addr = ALU_r;
    //controller ʵ����
    Controller cpu_CONTROLLER(
        //IM
        .IM_inst(IM_inst),
        //PC
        .PC_out(PC_out),
        .PC_in(PC_in),
        //RF
        .RF_W(RF_W),
        .RF_Rs(RF_Rs),
        .RF_Rt(RF_Rt),
        .RF_Rd(RF_Rd),
        .RF_Rsc(RF_Rsc),
        .RF_Rtc(RF_Rtc),
        .RF_Rdc(RF_Rdc),
        //ALU
        .ALU_a(ALU_a),
        .ALU_b(ALU_b),
        .ALU_r(ALU_r),
        .ALU_zero(ALU_zero),
        .ALU_aluc(ALU_aluc),
        //DM
        .DM_data_out(DM_data_out),
        .DM_ena(DM_ena),
        .DM_WR(DM_WR)
    );
endmodule
