`timescale 1ns / 1ps

module ALU_tb();
    reg [7:0] a,b;
    reg [3:0]select_line;
    wire [7:0]result;
    wire  zero_flag,negative_flag,carry_flag,overflow_flag;
    
    ALU_8_bit dut(a,b,select_line,result,zero_flag,negative_flag,carry_flag,overflow_flag);
    
    initial begin
    $monitor($time,"  select_line=%b,  a=%b,  b=%b,  result=%b, zero_flag=%b, negative_flag=%b, carry_flag=%b, overflow_flag=%b ",select_line,a,b,result,zero_flag,negative_flag,carry_flag,overflow_flag);
    select_line=4'b0000;a=8'b11001010;b=8'b01100111;
    select_line=4'b0001;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0010;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0011;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0100;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0101;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0110;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b0111;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b1000;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b1001;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b1010;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b1011;a=8'b11001010;b=8'b01100111;#10
    select_line=4'b1100;a=8'b11001010;b=8'b01100111;#10
    $finish;
    end 
endmodule
