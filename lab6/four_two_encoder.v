`timescale 1ns / 1ps
`default_nettype none
//define the module
module four_two_encoder(
    input wire [3:0] W, // 4 bit input wires
    output wire zero, // declare output zero
    output reg [1:0] Y  // declare output as reg as it will modified
);


assign zero = (W ==4'b0000); // assign zero to test it

always@(W) // triggers whe En or W changes
    begin
        case(W) //based on W
        4'b0001: Y = 2'b00; //2-bit binary value
        4'b0010: Y = 2'b01; //light up w[1]
        4'b0100: Y = 2'b10; //light up w[2]
        4'b1000: Y = 2'b11; //light up w[3]
        
        default: Y = 2'bXX; //default will cover the cases not listed
                               // XX means two dont cares
        endcase // end of case
    end
    
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 06:52:29 PM
// Design Name: 
// Module Name: four_two_encoder
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

