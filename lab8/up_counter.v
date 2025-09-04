`timescale 1ns / 1ps
`default_nettype none
//initialize module
module up_counter(Count, Carry2, En, Clk, Rst);
//setup output and input wires
    output reg[2:0] Count;
    output wire Carry2;
    
    input wire En, Clk, Rst;
    
    //setup inner wires (internal net)
    wire [2:0] Carry, Sum;
    
    //now we will essentially call in a module that we initialized below
    Threebit_counter UCI(Sum, Carry2, Count, En);
   
    // reset flip-flop, asynchronous reset
    always@(posedge Clk or posedge Rst)
        if(Rst) // if rst is true or 1
            Count <= 0; //reset the count
        else
            Count <= Sum; // save Sum to Count
        
            
endmodule //end

//initialize the threebit counter module
module Threebit_counter(Sum, Carry2, Count, En);
//initialize input, output, and internal net
    input wire En;
    input wire [2:0]Count;
    output wire [2:0]Sum;
    output wire Carry2;
    wire [2:0] Carry;
    
    // instantiate the half adders. three for three bit counter, and chain then nased on the carry signal
    half_adder adder_1(Sum[0], Carry[0], En, Count[0]);
    half_adder adder_2(Sum[1], Carry[1], Carry[0], Count[1]);
    half_adder adder_3(Sum[2], Carry[2], Carry[1], Count[2]);
    
    assign Carry2 = Carry[2]; //assign the result to a variable
    
endmodule //end

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:05:57 PM
// Design Name: 
// Module Name: up_counter
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
