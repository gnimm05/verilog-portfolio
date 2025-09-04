`timescale 1ns / 1ps
`default_nettype none

//initialize module
module sr_latch(Q, notQ, En, S, R);
//declare output and input wires
    output wire Q, notQ;
    input wire En, S, R;
    
    //declaren internal net, inner wires
    wire nandSEN, nandREN;
    
    //use structural verilog to develop the relationships of the 4 nand gates.
    nand #2 nand0(Q, nandSEN, notQ);
    nand #2 nand1(notQ, nandREN, Q);
    nand #2 nand2(nandSEN, En,  S);
    nand #2 nand3(nandREN, En, R);

endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 06:06:49 PM
// Design Name: 
// Module Name: sr_latch
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