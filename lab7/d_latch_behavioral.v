`timescale 1ns / 1ps
`default_nettype none

module d_latch_behavioral( //declare the ports

    output reg Q, //output
    output wire notQ, //output
    input wire D, En //wires can drive regs


);

//describing the behavior of the D-latch below
always@(En or D)
    if (En)
        Q = D; 
        else Q=Q;
assign notQ = ~Q; //regs can drive wires

endmodule //end module



//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 07:36:08 PM
// Design Name: 
// Module Name: d_latch_behavioral
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
