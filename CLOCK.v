`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

/* Clock divider to convert 100MHz to 50MHz */
module CLK_50MHz (
    input MCLK, MRST,
    output reg CLK_OUT
    );

always @(posedge(MCLK), posedge(MRST))begin
    if(MRST)
    CLK_OUT <= 0;
    else
    CLK_OUT <= !CLK_OUT;
end

endmodule

/* Clock divider to convert 100MHz to 1KHz */

module CLK_1KHz(
    input CLK, RST,
    output reg CLK_OUTPUT
);

localparam terminalcount = (50000 - 1);
reg [15:0] Counter;
wire count;

assign count = (Counter == terminalcount);	// Place a comparator on the counter output

always @ (posedge(CLK), posedge(RST)) begin
    if (RST) Counter <= 0;
    else if(count)
    Counter <= 0;		// Reset counter when terminal count reached
    else
    Counter <= Counter + 1;
end

always @ (posedge(CLK), posedge(RST))begin
    if (RST)
    CLK_OUTPUT <= 0;
    else if(count)
    CLK_OUTPUT = !CLK_OUTPUT;	// T-FF with tc as input signal
end

endmodule