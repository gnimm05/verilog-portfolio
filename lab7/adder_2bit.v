`timescale 1ns / 1ps

//initialize the module
module adder_2bit(Carry, Sum, A, B);

    //declare the outputs and imputs
    output wire Carry;
    output wire [1:0]Sum;
 
    input wire [1:0]A;
    input wire [1:0]B;

    //declare the internal nets (inner wires)
    wire internal_w;

//instantiate full adders (2-bit)
full_adder fa0(Sum[0], internal_w, A[0], B[0], 1'b0);
full_adder fa1(Sum[1], Carry, A[1], B[1], internal_w);

endmodule //end module



//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 07:56:47 PM
// Design Name: 
// Module Name: adder_2bit
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
