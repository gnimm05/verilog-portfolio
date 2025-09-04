`timescale 1ns / 1ps
`default_nettype none
//initialize module
module half_adder(S, Cout, A, B);

// initialize output and input wires
    output wire S, Cout;
    input wire A, B;
    
    //use dataflow
    assign S = A ^ B; // XOR gate with inpus A and B with output Sum
    assign Cout = A & B; // AND gate with inputs A and B with output Cout
    
    
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 06:56:50 PM
// Design Name: 
// Module Name: half_adder
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
