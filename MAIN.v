`timescale 1ns / 1ps

module MAIN(
input CLK, RST,
input PBC,
input [3:0] SW,
output [7:0] SSEG_CA,
output [7:0] SSEG_AN
);
wire SlowCLK, MainCLK;
wire[3:0] num;
reg FF_CLK;
reg[7:0] AN;

reg in = 1'b0;
wire out;
reg[2:0] State = 3'b000;
wire[2:0] debounce;

Debounced_Button D1(.CLK(MainCLK), .PBC(PBC), .D_OUT(out));

CLK_50MHz Main_Clock(.MCLK(CLK), .MRST(RST), .CLK_OUT(MainCLK));

CLK_1KHz Slow_Clock(.CLK(CLK), .RST(RST), .CLK_OUTPUT(SlowCLK));

Anode_Driver A1(.CLK(SlowCLK), .RST(RST), .currentState(debounce), .DIGIT(num), .AN(SSEG_AN));

CA_Display C1(.Data(num), .DP(SW[0]), .CA(SSEG_CA));


always@(posedge CLK) begin
    in <= out;
if(out == 1'b0 && in == 1'b1)begin
    State <= State + 1;
    end
end

assign debounce = State;
endmodule





