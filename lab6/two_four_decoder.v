`timescale 1ns / 1ps
`default_nettype none
//define the module
module two_four_decoder(    

 
    input wire [1:0] W, // 2 bit input wires
    input wire En, // declaring inputs
    output reg [3:0] Y // declare output as reg as it will modified

);

always@(En or W) // triggers whe En or W changes
begin
    if (En == 1'b1)
    case(W) //based on W
        2'b00: Y = 4'b0001; //4-bit binary value
        2'b01: Y = 4'b0010; //light up y[1]
        2'b10: Y = 4'b0100; //light up y[2]
        2'b11: Y = 4'b1000; //light up y[3]
    endcase // end of case
    else // if enable false
    Y = 4'b0000; //disable outputs
    end
    
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 06:40:42 PM
// Design Name: 
// Module Name: two_four_decoder
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
