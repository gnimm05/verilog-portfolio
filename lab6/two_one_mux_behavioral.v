`timescale 1ns / 1ps
`default_nettype none
//define the module
module two_one_mux(Y,A,B,S);

//declare output and input ports
output reg Y; // declare output as reg as it will modified
input wire A,B,S; // declaring inputs

always@(A or B or S)//always block triggers when inputs change

// behavioral, works like standard C++ if and else statements
  begin
    if (S == 1'b0)
        Y = A;
    else
        Y = B;
  end
    
endmodule // end the module


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 06:09:03 PM
// Design Name: 
// Module Name: two_one_mux_behavioral
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

