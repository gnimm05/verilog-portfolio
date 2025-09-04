`timescale 1ns / 1ps
`default_nettype none

// define the module
module four_bit_mux(Y, A, B, S);
// declare inputs and outputs
    output wire [3:0] Y; // added
    input wire [3:0] A,B;
    input wire S;

//instantiate the two_one_mux modules that are user defined
    two_one_mux MUX0(Y[0], A[0], B[0], S);
    two_one_mux MUX1(Y[1], A[1], B[1], S); 
    two_one_mux MUX2(Y[2], A[2], B[2], S); // added
    two_one_mux MUX3(Y[3], A[3], B[3], S); // added

endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 07:00:44 PM
// Design Name: 
// Module Name: four_bit_mux
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