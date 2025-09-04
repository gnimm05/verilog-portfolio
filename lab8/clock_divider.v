`timescale 1ns / 1ps
`default_nettype none

//initialize module
module clock_divider(ClkOut, ClkIn);

//initialize input and output wires
    output wire [3:0] ClkOut;
    input wire ClkIn; //able to drive regs
    
    parameter n = 25; //This is a parameter that is able to count to n number of bits.
    
    reg [n:0] Count; //This means that the count bit width is based on n!.
    
    //now describing the counter
    
    always@(posedge ClkIn)
        Count <= Count + 1;
        
    //now we wire the ClkOut
    
    assign ClkOut[3:0] = Count[n:n-3];

endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 05:39:50 PM
// Design Name: 
// Module Name: clock_divider
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
