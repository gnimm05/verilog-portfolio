`timescale 1ns / 1ps
`default_nettype none

//define module and interface points
module full_adder(S, Cout, A, B, Cin);

//define the output and input
    output wire S, Cout;
    input wire A, B, Cin;
    
    
    //define the internal net (inner wires)
    wire andAB, andBCin, andACin;
    
    //now using dataflow to describe the schematic
    assign S = A ^ B ^ Cin;
    assign andAB = A & B;
    assign andBCin = B & Cin;
    assign andACin = A & Cin;
    assign Cout = andAB | andBCin | andACin;


endmodule
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 07:20:34 PM
// Design Name: 
// Module Name: full_adder
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

