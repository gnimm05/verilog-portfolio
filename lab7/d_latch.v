`timescale 1ns / 1ps
`default_nettype none

//Initialize module
module d_latch(D, En, Q, notQ);

//declare input and output wires
    output wire Q, notQ;
    input wire D, En;
    
    //declare internal net, inner wires
    wire notD, nandDEN, nandnotDEN;
    
    //declare the not gate and the 4 nand gates using structural verilog
    not #2 not0(notD,D);
    nand #2 nand0(Q, nandDEN, notQ);
    nand #2 nand1(notQ, nandnotDEN, Q);
    nand #2 nand2(nandDEN, En,  D);
    nand #2 nand3(nandnotDEN, En, notD);
    
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 06:35:54 PM
// Design Name: 
// Module Name: d_latch
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
