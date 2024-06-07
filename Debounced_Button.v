`timescale 1ns / 1ps

module Debounced_Button(
input CLK,
input PBC,
output D_OUT
);

reg[20:0] counter = 0;  //counter for 20ms  debounce
reg buttonState = 1'b0;

parameter timeout = 1000000;  

reg [3:0] currentState, nextState;

always@(posedge CLK)begin
    if(PBC != buttonState && counter < timeout)
    counter <= counter + 1;
    else if(counter == timeout)begin
    buttonState <= PBC;
    counter <= 0;
    end
    else
    counter <= 0;
    end
assign D_OUT = buttonState;

endmodule
