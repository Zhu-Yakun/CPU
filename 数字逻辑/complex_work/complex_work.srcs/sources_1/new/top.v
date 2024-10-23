`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 19:38:51
// Design Name: 
// Module Name: top
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


module Top(
    input clk,
    input pause,
    output HSync,
    output VSync,
    output [2:0] OutRed,
    output [2:0] OutGreen,
    output [2:1] OutBlue,
    
    output [6:0] seg,    // 7������ܵ����
    output [7:0] an,
    
    output led1,
    output led2,
    /*
    // �������ӿ�
    input wire sensor_so,       // ������SPI MISO��
    output wire sensor_cs,      // ������SPI CS��
    output wire sensor_sclk,    // ������SPI SCLK��
    output wire sensor_si,       // ������SPI MOSI��
    
     input  INT1,
     input  INT2*/
     input   key_clk,               // ����ʱ��
     input   key_data              // ������������
    );
    wire [8:0] keys;
    wire [7:0] score;
    keyboard keyboard_inst(
        .clk(clk),
        .rst(1),
        .key_clk(key_clk),
        .key_data(key_data),
        .key_ascii(keys)
    );
    wire to_left, to_right;
    // Logic to determine to_left and to_right based on keys value
    assign to_left = (keys == 8'd1) ? 1'b1 : 1'b0;
    assign to_right = (keys == 8'd2) ? 1'b1 : 1'b0;
    
    /*
    // ���ٶȴ�����ģ���ź�
    wire accel_to_left, accel_to_right;
    reg move_left, move_right;
    // ���Լ��ٶȴ�������X������
    wire [7:0] x_axis_data;
    accel acc (
            .clk(clk),
            .rst(rst_n),
            .LED_INT1( ),
            .LED_INT2( ),
            .ACL_MISO(sensor_so),
            .ACL_CSN(sensor_cs),
            .ACL_SCLK(sensor_sclk),
            .ACL_MOSI(sensor_si),
            .ACL_INT1(INT1),
            .ACL_INT2(INT2),
            .X_data(x_axis_data)
        );
    
    // �����ƶ���ֵ
        parameter [7:0] THRESHOLD_LEFT = 0;  // ʾ����ֵ����Ҫ����ʵ���������
        parameter [7:0] THRESHOLD_RIGHT = 0; // ʾ����ֵ����Ҫ����ʵ���������
    
        // ���ٶȼ����ݴ���
        always @(posedge clk) begin
            // ����X�����ݾ����ƶ�����
            if (x_axis_data < THRESHOLD_LEFT) begin
                move_left <= 1;
                move_right <= 0;
            end 
            else if (x_axis_data > THRESHOLD_RIGHT) begin
                move_left <= 0;
                move_right <= 1;
            end else begin
                move_left <= 0;
                move_right <= 0;
            end
        end
    assign accel_to_left = move_left;
    assign accel_to_right = move_right; */
    
    wire O_clk;
    Divider divider(
        .I_CLK(clk),
        .rst(lose),
        .O_CLK(O_clk)
    );
    
    Display dis1(
        .clk(O_clk),
        .score(score),
        .oData(seg),
        .an(an)
    );
    
    LED dis2(
        .to_left(to_left),
        .to_right(to_right),
        .led1(led1),
        .led2(led2)
    );
    
    Game game(
       .clk(clk),    
        .pause(pause),
       .to_left(to_left),
       .to_right(to_right),
       .score(score),
       .HSync(HSync),
       .OutBlue(OutBlue),
       .OutGreen(OutGreen), 
       .OutRed(OutRed),         
       .VSync(VSync)
       );
       
   
endmodule
