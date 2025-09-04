`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop_behavioral( //declare the ports

    output reg Q, //output
    output wire notQ, //output
    input wire D, Clk // input d and clock signal


);

//describing the behavior of the D flip flop below
    always@(posedge Clk) //trigger when rising edge of Clk
        Q <= D; //non-blockassignment statement

assign notQ = ~Q; 

endmodule //end module
