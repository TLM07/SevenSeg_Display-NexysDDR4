`timescale 1ns / 1ps


module Anode_Driver(
input CLK, RST,
input [2:0] currentState,
output reg[3:0] DIGIT,
output [7:0] AN
);

reg [7:0] AN;
reg[2:0] Selector;

parameter S1 = 4'h0;
parameter S2 = 4'h8;
parameter S3 = 4'hb;
parameter S4 = 4'hF;
parameter S5 = 4'h3;
parameter S6 = 4'h6;
parameter S7 = 4'h5;
parameter S8 = 4'h1;
parameter OFF = 4'h16;


always @(posedge(CLK), posedge(RST)) begin
    if(RST) begin
    Selector <= 0;
    end
    else begin
    Selector <= Selector + 1;
    end
end

always @(*) begin
    case(Selector)
    3'h0 : begin
    if(currentState == 3'h0)
    AN = 8'b11111111;
    else
    AN = 8'b11111110;
    end
    3'h1 : begin
    if(currentState == 3'h1)
    AN = 8'b11111111;
    else
    AN = 8'b11111101;
    end
    3'h2 : begin
    if(currentState == 3'h2)
    AN = 8'b11111111;
    else
    AN = 8'b11111011;
    end
    3'h3 : begin
    if(currentState == 3'h3)
    AN = 8'b11111111;
    else
    AN = 8'b11110111;
    end
    3'h4 : begin
    if(currentState == 3'h4)
    AN = 8'b11111111;
    else
    AN = 8'b11101111;
    end
    3'h5 : begin
    if(currentState == 3'h5)
    AN = 8'b11111111;
    else
    AN = 8'b11011111;
    end
    3'h6 : begin
    if(currentState == 3'h6)
    AN = 8'b11111111;
    else
    AN = 8'b10111111;
    end
    3'h7 : begin
    if(currentState == 3'h7)
    AN = 8'b11111111;
    else
    AN = 8'b01111111;
    end 
    default AN = 8'b11111111;
    endcase
end  

always@(*)begin
    case(AN)
    8'b11111110 : DIGIT = S1;
    8'b11111101 : DIGIT = S2;
    8'b11111011 : DIGIT = S3;
    8'b11110111 : DIGIT = S4;
    8'b11101111 : DIGIT = S5;
    8'b11011111 : DIGIT = S6;
    8'b10111111 : DIGIT = S7;
    8'b01111111 : DIGIT = S8;
    default: DIGIT = OFF;
    endcase
end

endmodule