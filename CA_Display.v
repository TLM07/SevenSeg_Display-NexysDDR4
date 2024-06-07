`timescale 1ns / 1ps

module CA_Display(
input [3:0] Data,
input DP, 
output [7:0] CA
);
reg [7:0] SSEG_CA;

assign CA = {(~DP), SSEG_CA[6:0]};

      
always@(*)begin
    case(Data)
        4'h0: SSEG_CA = ~(8'b00111111); //Note:  to lite digit, cathode must = 0             
        4'h1: SSEG_CA = ~(8'b00000110);
        4'h2: SSEG_CA = ~(8'b01011011);
        4'h3: SSEG_CA = ~(8'b01001111);
        4'h4: SSEG_CA = ~(8'b01100110);
        4'h5: SSEG_CA = ~(8'b01101101);
        4'h6: SSEG_CA = ~(8'b01111101);
        4'h7: SSEG_CA = ~(8'b00000111);
        4'h8: SSEG_CA = ~(8'b01111111);
        4'h9: SSEG_CA = ~(8'b01100111);
        4'hA: SSEG_CA = ~(8'b01110111);
        4'hB: SSEG_CA = ~(8'b01111100);
        4'hC: SSEG_CA = ~(8'b00111001);
        4'hD: SSEG_CA = ~(8'b01011110);
        4'hE: SSEG_CA = ~(8'b01111001);
        4'hF: SSEG_CA = ~(8'b01110001);
        default: SSEG_CA = ~(8'b00000000);
        endcase
    end

endmodule
