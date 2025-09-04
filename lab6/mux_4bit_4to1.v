`timescale 1ns / 1ps
`default_nettype none
//define the module
module mux_4bit_4to1(Y,A,B,C,D,S);

//declare output and input ports
output reg [3:0] Y; // declare output as reg as it will modified
input wire [3:0] A,B,C,D; // 4 bit input wires
input wire [1:0] S; // declaring inputs

always@(*)// the * triggers when anything changes
// no begin usage as it is one clause
    case(S) // case selection based on S
        2'b00: Y=A; //when S==2'b00
        2'b01: Y=B; //when S==2'b01
        2'b10: Y=C; //when S==2'b10
        2'b11: Y=D; //when S==2'b11

     endcase // designates the end of the case
     
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 06:28:27 PM
// Design Name: 
// Module Name: mux_4bit_4to1
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
