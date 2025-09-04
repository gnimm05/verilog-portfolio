`timescale 1ns / 1ps
`default_nettype none

//initialize the module
module d_flip_flop(Q, notQ, Clk, D);

//insert the output and input wires
    output wire Q, notQ;
    input wire Clk, D;
    
    //insert the inner wires (internal net)
    wire notClk, notNotClk;
    wire Qm;
    
    wire notQm;
    
    
    //using structural
    //create the not gates

    not #2 not0(notClk,Clk);
    not #2 not1(notNotClk, notClk);
    
    //instantiate the d_latches
    
    d_latch #2 d0(D, notClk, Qm, notQm);
    d_latch #2 d1(Qm, notNotClk, Q, notQ);
    
    
endmodule

