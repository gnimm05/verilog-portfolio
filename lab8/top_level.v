`timescale 1ns / 1ps
`default_nettype none
//initialize module
module top_level(LEDs, SWs, BTNs, FastClk);

//setup inputs, outputs and internal nets
    output wire [3:0] LEDs;
    input wire [1:0]SWs;
    input wire [1:0]BTNs;
    input wire FastClk;
    

    wire [3:0] Clocks;
    reg SlowClk;
    
    //behavioral description
    always@(*) //combinatorial logic
        case(SWs) // SW is a 2-bit bus, there will be 4 different cases
        2'b00: SlowClk = Clocks[0];// case 1
        2'b01: SlowClk = Clocks[1];// case 2
        2'b10: SlowClk = Clocks[2];// case 3
        2'b11: SlowClk = Clocks[3];// case 4
       
        endcase //end case statement
        
        
    //instantiate upcounter
    
    up_counter UPC(
        .Count(LEDs[2:0]),
        .Carry2(LEDs[3]),
        .En(BTNs[0]),
        .Clk(SlowClk),
        .Rst(BTNs[1])
        );
    
    //instantiate clock_divider
    
    clock_divider clk_div0(
        .ClkOut(Clocks),
        .ClkIn(FastClk)
    
    );    
    
    
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:32:42 PM
// Design Name: 
// Module Name: top_level
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
