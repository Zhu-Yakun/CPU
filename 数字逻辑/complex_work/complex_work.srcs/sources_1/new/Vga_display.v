`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 19:53:17
// Design Name: 
// Module Name: Vga_display
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

`define RIGHT 1'b1
`define LEFT  1'b0
`define UP    1'b0
`define DOWN  1'b1

module Vga_display(
    input clk,      // ϵͳʱ��
    input pause,    // ��ͣ
    input to_left,  // �����ź�
    input to_right, //�����ź�
    input [3:0] bar_move_speed,  // ����ƶ��ٶ�
    output reg [7:0] score,  // �÷�
    // VGA ��ʾPort
    output reg hs,  
    output reg vs,
    output reg [2:0] Red,
    output reg [2:0] Green,
    output reg [1:0] Blue,
    output reg lose  // ��Ϸ״̬
    );
        // ��������
        parameter PAL = 640;        // ÿ�������� (pixels)
        parameter LAF = 480;        // ÿ֡���� (lines)
        parameter PLD = 800;        // ÿ�з�Ƶ��
        parameter LFD = 521;        // ÿ֡��Ƶ��
        parameter HPW = 96;         // ˮƽͬ�������� (pixels)
        parameter HFP = 16;         // ˮƽǰ�� (pixels)
        parameter VPW = 2;          // ��ֱͬ�������� (lines)
        parameter VFP = 10;         // ��ֱǰ�� (lines)
        
        parameter UP_BOUND = 10;
        parameter DOWN_BOUND = 480;  
        parameter LEFT_BOUND = 20;  
        parameter RIGHT_BOUND = 630;
        
        parameter BLOCK_DOWN_first = 105;
        parameter BLOCK_DOWN_second = 70;
        parameter BLOCK_DOWN_third = 35;
        parameter BLOCK_WIDTH = 125;
        
        // ��İ뾶
        parameter ball_r = 10;
        
        reg pau=1;
        
        /* �Ĵ������� */
        reg [9:0] Hcnt;      // ˮƽ���������ﵽ PLD-1 ʱ����
        reg [9:0] Vcnt;      // ��ֱ���������ﵽ LFD-1 ʱ����
        reg clk_25M = 0;     // 25MHz Ƶ��
        reg clk_50M = 0;     // 50MHz Ƶ��
        
        reg h_speed = `RIGHT;
        reg v_speed = `UP; 
        
        // �·�����λ��
        reg [9:0] up_pos = 400;
        reg [9:0] down_pos = 430;
        reg [9:0] left_pos = 230;
        reg [9:0] right_pos = 430;  
            
       // С�������λ��
        reg [9:0] ball_x_pos = 330;
        reg [9:0] ball_y_pos = 390;
        
        
        // ש��
        reg [14:0] blocks=15'b111111111111111;
        
        always@(posedge pause)
        begin
           pau=~pau;
        end
        
        // ���� 100MHz Ƶ�ʵ�һ�룬�� 50MHz
        always@(posedge(clk))
        begin
            clk_50M <= ~clk_50M;
        end
        
        // ���� 25MHz Ƶ�ʵ�һ��
        always@(posedge(clk_50M))
         begin
             clk_25M <= ~clk_25M;
         end
        
        /* ����hs��vs��ʱ�� */
        always@(posedge(clk_25M)) 
        begin
            /* ����Hcnter��Vcnter������ */
            if( Hcnt == PLD-1 ) // ��ˮƽָ�뵽��һ�е�ĩ��
            begin
                Hcnt <= 0; // ����ˮƽ������
                if( Vcnt == LFD-1 ) // ֻ�е�ˮƽָ�뵽��ĩ��ʱ����ֱ������������
                    Vcnt <=0;
                else
                    Vcnt <= Vcnt + 1;
            end
            else
                Hcnt <= Hcnt + 1;
            
            /* ����hs��ʱ�� */
            if( Hcnt == PAL - 1 + HFP)
                hs <= 1'b0;
            else if( Hcnt == PAL - 1 + HFP + HPW )
                hs <= 1'b1;
            
            /* ����vs��ʱ�� */        
            if( Vcnt == LAF - 1 + VFP ) 
                vs <= 1'b0;
            else if( Vcnt == LAF - 1 + VFP + VPW )
                vs <= 1'b1;                    
        end
        
        
        //��ʾ�ײ�������
        always @ (posedge clk_25M)   
        begin  
            // ��ʾ�ױߺ��
            if (Vcnt>=up_pos && Vcnt<=down_pos && Hcnt>=left_pos && Hcnt<=right_pos) 
            begin  
                Red <= Hcnt[3:1];  
                Green <= Hcnt[6:4];  
                Blue <= Hcnt[8:7]; 
            end
            // ��ʾ��
            else if ( (Hcnt - ball_x_pos)*(Hcnt - ball_x_pos) + (Vcnt - ball_y_pos)*(Vcnt - ball_y_pos) <= (ball_r * ball_r))  
            begin  
                Red <= Hcnt[3:1];  
                Green <= Hcnt[6:4];  
                Blue <= Hcnt[8:7];  
            end  
            else if(Vcnt<=BLOCK_DOWN_first && Vcnt>BLOCK_DOWN_second)
            begin
                if(Hcnt<BLOCK_WIDTH && blocks[0])
                begin
                    Red <= 111;  
                    Green <= 000;  
                    Blue <= 000; 
                end
                else if(Hcnt<BLOCK_WIDTH && !blocks[0])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH && blocks[1])
                begin
                    Red <= 000;  
                    Green <= 111;  
                    Blue <= 000; 
                end
                else if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH && !blocks[1])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 && blocks[2])
                begin
                    Red <= 000;  
                    Green <= 000;  
                    Blue <= 111; 
                end
                else if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 && !blocks[2])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
                 if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && blocks[3])
                 begin
                     Red <= 000;  
                     Green <= 111;  
                     Blue <= 111; 
                 end
                 else if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && !blocks[3])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
                 if(Hcnt>BLOCK_WIDTH*4 && blocks[4])
                 begin
                     Red <= 111;  
                     Green <= 111;  
                     Blue <= 111; 
                 end
                 else if(Hcnt>BLOCK_WIDTH*4 && !blocks[4])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
              end
            else if(Vcnt<=BLOCK_DOWN_second && Vcnt>BLOCK_DOWN_third)
            begin
                if(Hcnt<BLOCK_WIDTH && blocks[5])
                begin
                    Red <= 111;  
                    Green <= 111;  
                    Blue <= 000; 
                end
                else if(Hcnt<BLOCK_WIDTH && !blocks[5])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH && blocks[6])
                begin
                    Red <= 010;  
                    Green <= 101;  
                    Blue <= 010; 
                end
                else if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH &&!blocks[6])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 &&blocks[7])
                begin
                    Red <= 100;  
                    Green <= 011;  
                    Blue <= 111; 
                end
                else if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 &&!blocks[7])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <=0; 
                end
                if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && blocks[8])
                begin
                    Red <= 010;  
                    Green <= 101;  
                    Blue <= 111; 
                end
                else if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && !blocks[8])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt>BLOCK_WIDTH*4 && blocks[9])
                begin
                     Red <= 011;  
                     Green <= 011;  
                     Blue <= 011; 
                end
                else if(Hcnt>BLOCK_WIDTH*4 && !blocks[9])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
            end
            else if(Vcnt<=BLOCK_DOWN_third)
            begin
                if(Hcnt<BLOCK_WIDTH && blocks[10])
                begin
                    Red <= 111;  
                    Green <= 000;  
                    Blue <= 000; 
                end
                else if(Hcnt<BLOCK_WIDTH && !blocks[10])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH && blocks[11])
                begin
                    Red <= 000;  
                    Green <= 111;  
                    Blue <= 000; 
                end
                else if(Hcnt<BLOCK_WIDTH*2 && Hcnt>BLOCK_WIDTH && !blocks[11])
                begin
                    Red <= 0;  
                    Green <= 0;  
                    Blue <= 0; 
                end
                if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 && blocks[12])
                begin
                    Red <= 000;  
                    Green <= 000;  
                    Blue <= 111; 
                end
                else if(Hcnt<BLOCK_WIDTH*3 && Hcnt>BLOCK_WIDTH*2 && !blocks[12])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
                 if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && blocks[13])
                 begin
                     Red <= 000;  
                     Green <= 111;  
                     Blue <= 111; 
                 end
                 else if(Hcnt<BLOCK_WIDTH*4 && Hcnt>BLOCK_WIDTH*3 && !blocks[13])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
                 if(Hcnt>BLOCK_WIDTH*4 && blocks[14])
                 begin
                     Red <= 111;  
                     Green <= 111;  
                     Blue <= 111; 
                 end
                 else if(Hcnt>BLOCK_WIDTH*4 && !blocks[14])
                 begin
                     Red <= 0;  
                     Green <= 0;  
                     Blue <= 0; 
                 end
              end
              else 
              begin
                  // ��û�л����κ�����ʱ��Ĭ�ϱ�����ɫ
                  Red <= 3'b000;  
                  Green <= 3'b000;  
                  Blue <= 2'b00;  
              end
           end
        
        reg flag;
        
        // vs�Ǵ�ֱͬ���ź�
        always @ (posedge vs)  
        begin          
            // ���Ƶױߺ����ƶ�
            if(lose)
            begin 
                ball_x_pos = 330;
                ball_y_pos = 390;
                up_pos = 400;
                down_pos = 430;
                left_pos = 230;
                right_pos = 430; 
                flag=1;
            end
            else if(!pau)
            begin  // ����Ϸδ��ͣʱ�������û��������ƶ��ױߺ��
              flag=0;
              if (to_left && left_pos >= LEFT_BOUND) 
              begin  // �����ƶ�
                  left_pos <= left_pos - bar_move_speed;  
                  right_pos <= right_pos - bar_move_speed;  
              end  
              else if(to_right && right_pos <= RIGHT_BOUND)
              begin  // �����ƶ�
                  left_pos <= left_pos + bar_move_speed; 
                  right_pos <= right_pos + bar_move_speed;  
              end  
            
              // ��������ƶ�
              if (v_speed == `UP) // �������ƶ�
                  ball_y_pos <= ball_y_pos - bar_move_speed + 3;  
              else // �������ƶ�
                  ball_y_pos <= ball_y_pos + bar_move_speed - 3;  
              if (h_speed == `RIGHT) // �������ƶ� 
                  ball_x_pos <= ball_x_pos + bar_move_speed - 3;  
              else // �������ƶ�
                    ball_x_pos <= ball_x_pos - bar_move_speed + 3; 
            end     
         end 
        
        
        // ���ﵽ��Ե����е���ʱ�ı䷽��
        always @ (negedge vs)  
        begin
            // ��������ﵽ75�֣�����Ϸ����
            if(score == 75)
            begin
                lose <= 1;
                score <= 0;
            end
            // ������Ϸ
            if(flag)
            begin
                lose <= 0;
                blocks = 15'b111111111111111; // ������������ש��Ϊδ������״̬
            end
            // ����Ӵ����ϱ߽�ʱ�ı䴹ֱ�ٶȷ���
            if (ball_y_pos <= UP_BOUND)
            begin    
                v_speed <= `DOWN;
                lose <= 0;
            end
            else if(ball_y_pos <= BLOCK_DOWN_first && ball_y_pos > BLOCK_DOWN_second)
            begin
              if(ball_x_pos<BLOCK_WIDTH && blocks[0])
              begin
                  v_speed<=`DOWN;
                  blocks[0]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*2&&blocks[1]&&ball_x_pos>BLOCK_WIDTH)
              begin
                  v_speed<=`DOWN;
                  blocks[1]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*3&&blocks[2]&&ball_x_pos>BLOCK_WIDTH*2)
              begin
                  v_speed<=`DOWN;
                  blocks[2]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*4&&blocks[3]&&ball_x_pos>BLOCK_WIDTH*3)
              begin
                  v_speed<=`DOWN;
                  blocks[3]<=0;
                  score <= score + 5;
              end
              else if(blocks[4]&&ball_x_pos>4*BLOCK_WIDTH)
              begin
                  v_speed<=`DOWN;
                  blocks[4]<=0;
                  score <= score + 5;
              end
            end
            else if(ball_y_pos <= BLOCK_DOWN_second && ball_y_pos > BLOCK_DOWN_third)
            begin
              if(ball_x_pos<BLOCK_WIDTH&&blocks[5])
              begin
                  v_speed<=`DOWN;
                  blocks[5]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*2&&blocks[6]&&ball_x_pos>BLOCK_WIDTH)
                begin
                     v_speed<=`DOWN;
                     blocks[6]<=0;
                     score <= score + 5;
                end
              else if(ball_x_pos<BLOCK_WIDTH*3&&blocks[7]&&ball_x_pos>BLOCK_WIDTH*2)
               begin
                      v_speed<=`DOWN;
                      blocks[7]<=0;
                      score <= score + 5;
               end
               else if(ball_x_pos<BLOCK_WIDTH*4&&blocks[8]&&ball_x_pos>BLOCK_WIDTH*3)
                begin
                      v_speed<=`DOWN;
                      blocks[8]<=0;
                      score <= score + 5;
                end
              else if(blocks[9]&&ball_x_pos>4*BLOCK_WIDTH)
               begin
                     v_speed<=`DOWN;
                     blocks[9]<=0;
                     score <= score + 5;
              end
            end
            else if(ball_y_pos <= BLOCK_DOWN_third)
            begin
              if(ball_x_pos<BLOCK_WIDTH && blocks[10])
              begin
                  v_speed<=`DOWN;
                  blocks[10]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*2&&blocks[11]&&ball_x_pos>BLOCK_WIDTH)
              begin
                  v_speed<=`DOWN;
                  blocks[11]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*3&&blocks[12]&&ball_x_pos>BLOCK_WIDTH*2)
              begin
                  v_speed<=`DOWN;
                  blocks[12]<=0;
                  score <= score + 5;
              end
              else if(ball_x_pos<BLOCK_WIDTH*4&&blocks[13]&&ball_x_pos>BLOCK_WIDTH*3)
              begin
                  v_speed<=`DOWN;
                  blocks[13]<=0;
                  score <= score + 5;
              end
              else if(blocks[14]&&ball_x_pos>4*BLOCK_WIDTH)
              begin
                  v_speed<=`DOWN;
                  blocks[14]<=0;
                  score <= score + 5;
              end
            end
            // ������������壬�ı䴹ֱ�����ٶ�
            else if (ball_y_pos >= (up_pos - ball_r) && ball_x_pos <= right_pos && ball_x_pos >= left_pos)  
                v_speed <= `UP;
            // �������䵽�ײ������÷�������Ϸ������־��Ϊ1
            else if (ball_y_pos >= down_pos && ball_y_pos < (DOWN_BOUND - ball_r))
            begin
                score <= 0;
                lose <= 1;
            end
            // �������ש�鶼�����У���Ϸ������־����
            else if(blocks==0)
                lose<=0;
            // �����ﵽ�ײ��߽磬ֹͣ��ֱ�ƶ�
            else if (ball_y_pos >= (DOWN_BOUND - ball_r + 1))
                v_speed <= 0; 
          else  
                v_speed <= v_speed;  // ά�ֵ�ǰ��ֱ�ٶ�״̬
          // ����ˮƽ�ƶ�����
          // �����ﵽ��߽磬�ı�ˮƽ�����ٶ�
          if (ball_x_pos <= LEFT_BOUND)  
             h_speed <= `RIGHT;
          // �����ﵽ�ұ߽磬�ı�ˮƽ�����ٶ�
          else if (ball_x_pos >= RIGHT_BOUND)  
             h_speed <= `LEFT;  
          else  
             h_speed <= h_speed;  // ά�ֵ�ǰˮƽ�ٶ�״̬
      end
endmodule
