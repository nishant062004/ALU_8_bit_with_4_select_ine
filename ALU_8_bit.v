`timescale 1ns / 1ps
//8 bit ALU
module ALU_8_bit(
    input [7:0] a,b,
    input [3:0]select_line,
    output reg [7:0]result,
    output reg zero_flag,negative_flag,carry_flag,overflow_flag
    );
    
    always@(*)begin
    zero_flag=0;negative_flag=0;carry_flag=0;overflow_flag=0;
    case(select_line)
    4'b0000:begin
            {carry_flag,result}=a+b;
            overflow_flag=(a[7]==b[7])&&(a[7]!=result[7]);
            end
   4'b0001:begin
            {carry_flag,result}=a-b;
            overflow_flag=(a[7]!=b[7])&&(a[7]!=result[7]);
           end
   4'b0010:result=a*b;
   4'b0011:begin
           if(b!=0) result=a/b;
           else result=8'b00000000;
           end
   4'b0100:result=a%b;
   4'b0101:result=a&b;
   4'b0110:result=a|b;
   4'b0111:result=a^b;
   4'b1000:result=a~^b;
   4'b1001:result=~(a&b);
   4'b1010:result=~(a|b);
   4'b1011:result=~a;
   4'b1100:result=~b;
   //4'b1101:result=;
  // 4'b1110:result=;
  // 4'b1111:result=;
   default:result=8'b00000000;    
   endcase
   if(result==8'b00000000) zero_flag=1;
   if(result[7]==1) negative_flag=1;
    end
endmodule
