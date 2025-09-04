`timescale 1ns / 1ps
`default_nettype none

//initialize Module
module add_sub(Sum, Overflow, opA, opB, opSel);

// declare outputs and inputs
    output wire [3:0] Sum;
    output wire Overflow;
    input wire [3:0] opA, opB;
    input wire opSel;
    //declare inner wires
    wire [3:0] notB;
    wire c0, c1, c2, c3;
    
    // creating the compliment logic
    assign notB[0] = opB[0] ^ opSel;
    assign notB[1] = opB[1] ^ opSel; //added
    assign notB[2] = opB[2] ^ opSel; //added
    assign notB[3] = opB[3] ^ opSel; //added

    //wiring the full adders to create a ripple carry adder
    full_adder adder0(Sum[0],c0, opA[0], notB[0], opSel); 
    full_adder adder1(Sum[1],c1, opA[1], notB[1], c0); //added
    full_adder adder2(Sum[2],c2, opA[2], notB[2], c1); //added
    full_adder adder3(Sum[3],c3, opA[3], notB[3], c2); //added
    
    
    //overflow logic
    assign Overflow = c3 ^ c2; // finish


endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 07:33:51 PM
// Design Name: 
// Module Name: add_sub
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

