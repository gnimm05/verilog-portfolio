`timescale 1ns / 1ps
`default_nettype none

//initialize module
module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);

//define the outputs and inputs, using regs as it stores information
    output reg Carry_reg;
    output reg [1:0] Sum_reg;
    
    input wire Clk;
    input wire [1:0] A, B;
    
   //define internal nets (inner wires)
    reg [1:0] A_reg, B_reg;
    wire Carry;
    wire [1:0] Sum;
    
    //instantiate the adder_2bit 
    adder_2bit ad0(Carry, Sum, A_reg, B_reg);

   
    
    always@ (posedge Clk) //trigger or positive edge of clock
        begin
            A_reg <= A; //non-blocking statement
            B_reg <= B;
        end
    
    always@ (posedge Clk) //repeating abouve for the output side of things
        begin
            Carry_reg <= Carry;
            Sum_reg <= Sum;
        end
    
endmodule //end module


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 01:25:07 PM
// Design Name: 
// Module Name: adder_synchronous
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

