`timescale 1ns / 1ps
`default_nettype none

module tlc_controller(

    output wire [1:0] highwaySignal, farmSignal, //LEDs
    output wire [3:0] JB,
    input wire Clk,// clock signal
    input wire Rst, // reset
    input wire farmSensor


    );
    
    //intermediate nets
    wire RstSync;
    wire RstCount;
    reg [30:0] Count;
    
    assign JB[3] = RstCount;
    
    synchronizer syncRst(RstSync, Rst, Clk);
    
    tlc_fsm FSM(
        .state(JB[2:0]),
        .RstCount(RstCount),
        .highwaySignal(highwaySignal),
        .farmSignal(farmSignal),
        .Count(Count),
        .Clk(Clk),
        .Rst(RstSync),
        .farmSensor(farmSensor)

    
    );
    
    //synchronous reset
    
    always @(posedge Clk) begin 
        if (RstCount) begin
            Count <= 0; // non-blocking statement
        end else begin
            Count <= Count + 1; // non-blocking statement
        end
    end
    
    
endmodule





//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2025 06:06:54 PM
// Design Name: 
// Module Name: tlc_controller
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

