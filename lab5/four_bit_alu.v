`timescale 1ns / 1ps
`default_nettype none

//declare the module
module four_bit_alu(Result, Overflow, opA, opB, ctrl);

//declaring the output and inputs
    output wire [3:0] Result;
    output wire Overflow;
    input wire [3:0] opA, opB;
    input wire [1:0] ctrl;
    
    //declare the inner wires / internal nets
    wire [3:0] andAB;
    wire [3:0] Sum;
    wire Overflow0;
    
    //instantiate the 4-bit andthe 2:1 MUX
    
    add_sub add_sub0(Sum, Overflow0, opA, opB, ctrl[1]);
    four_bit_mux four_bit_mux0(Result, andAB, Sum, ctrl[0]);
    //and and0(andAB, opA, opB);
    
    // assign dataflow gate-level schematic
    assign andAB = opA & opB;
    assign Overflow = ctrl[0] * Overflow0;
    
    
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 07:49:46 PM
// Design Name: 
// Module Name: four_bit_alu
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

