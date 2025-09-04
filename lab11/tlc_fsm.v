`timescale 1ns/1ps 
`default_nettype none

module tlc_fsm (
    //Outputs
    output reg [2:0] state,  //state register
    output reg RstCount,  //reset the timer/counter
    output reg [1:0] highwaySignal, //Highway signal
    output reg [1:0] farmSignal,  //Farm signal
    //Inputs
    input wire [n-1:0] Count, //Counter value
    input wire Clk,  //Clock
    input wire Rst,   //Reset 
    input wire farmSensor
);

    //width of the counter input (from Problem 2)
    parameter n = 31; 

    //States
    parameter Srst = 3'b111, //Highway Red, farm = red RstCount=1
              s0   = 3'b000, //All Red
              s1   = 3'b001, //Highway Green, Farm Red
              s2   = 3'b010, //Highway Yellow, Farm Red
              s3   = 3'b011, //All Red
              s4   = 3'b100, //Highway Red, Farm Green
              s5   = 3'b101; //Highway Red, Farm Yellow

    parameter red = 2'b01, //Set two bit binary values to color
              yel = 2'b10,
              grn = 2'b11;

    //Internal register for next state logic
    reg [2:0] nextState;

    //Define time durations
    parameter sec1  = 50000000;
    parameter sec3  = sec1 * 3;
    parameter sec15 = sec1 * 15;
    parameter sec30 = sec1 * 30;



    always @(*) begin
        nextState = state; //stay in current state
        RstCount = 1'b0;   //don't reset counter

        case (state)

            Srst: begin
                // Srst outputs
                highwaySignal = red;
                farmSignal = red;
                RstCount = 1'b1; // Reset counter
                nextState = s0;
                end
                
            s0: begin
                // s0 outputs
                highwaySignal = red;
                farmSignal = red;
                // Transition logic for s0
                if (Count == sec1) begin 
                    nextState = s1;
                    RstCount = 1'b1; // Reset counter
                end
                // else: stay in s0, RstCount stays 0
            end

            s1: begin
                // s1 outputs
                highwaySignal = grn;
                farmSignal = red;
                // Transition logic for s1
                if (Count == sec30) begin
                    if (farmSensor == 1'b1) begin //now here is the logic for farmSensor
                        nextState = s2;
                        RstCount = 1'b1; // Reset counter 
                    end
                end
                 // else: stay in s1, RstCount stays 0 
           end

            s2: begin
                // s2 outputs
                highwaySignal = yel;
                farmSignal = red;
                // Transition logic for s2
                if (Count == sec3) begin
                    nextState = s3;
                    RstCount = 1'b1; // Reset counter
                end
                 // else: stay in s2, RstCount stays 0
           end

            s3: begin
                // s3 outputs
                highwaySignal = red;
                farmSignal = red;
                // Transition logic for s3
                if (Count == sec1) begin
                    nextState = s4;
                    RstCount = 1'b1; // Reset counter
                end
                 // else: stay in s3, RstCount stays 0
           end

            s4: begin
                // s4 outputs
                highwaySignal = red;
                farmSignal = grn;
                // Transition logic for s4
                if ((Count >= sec3 && farmSensor == 1'b0) || Count == (sec15+sec3)) begin 
                //if count is longer than 3 and darmsensor is low, or count equal to 18 seconds
                    nextState = s5;
                    RstCount = 1'b1; // Reset counter
                end
                 // else: stay in s4, RstCount stays 0 
           end

            s5: begin
                // s5 outputs
                highwaySignal = red;
                farmSignal = yel;
                // Transition logic for s5
                if (Count == sec3) begin
                    nextState = s0;
                    RstCount = 1'b1; // Reset counter
                end
                 // else: stay in s5, RstCount stays 0
           end

            default: begin
                highwaySignal = red; // Default outputs
                farmSignal = red;
                nextState = s0;    // reset 
                RstCount = 1'b1;   // Reset counter
            end
        endcase
    end

    
    always @(posedge Clk) begin 
        if (Rst) begin
            state <= Srst; // reset state
        end else begin
            state <= nextState; // Update state on clock edge
        end
    end

endmodule