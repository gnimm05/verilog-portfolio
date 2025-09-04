`timescale 1ns / 1ps
`default_nettype none
//initialize combinational lock module
module combination_lock_fsm(
  output reg [2:0] state, //ease of debugging, output for state.  expanded to 3 bits
  output wire [3:0] Lock, //asserted when locked
  input wire Key1, // Unlock button 0
  input wire Key2, // Unlock button 1
  input wire [3:0] Password, //indicate number
  input wire Reset, // reset
  input wire Clk // clock
);
  //internal net that represents the next state
  reg [2:0] next_state; //expanded to 3 bits


// lets set parameters to make the code more readable, and to represent the states as bits
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100; //changed it to 3 bits, added S4
// assign lock to: if state is S3, assign to 15 in binary, if not true, assign to 0.
assign Lock = (state == S4) ? 4'b1111 : 4'b0000;

always @(posedge Clk) begin //nonblocking statement. At positive edge clock cycle

  if (Reset) state <= S0; // if reset, set state to S0, next state to else state
  else state <= next_state;
end

always @(*) begin //when any signal changes //ADD NEW S4 CASE
  next_state = state; // next_state will stay as the current state if no cases happen
 
  case (state) //case for S0, based off of FSM
    S0: begin
      if (Key1 && Password == 4'b1101) next_state = S1;
      else next_state = S0;
    end

    S1: begin //case for S1, based off of FSM
      if (Key2 && Password == 4'b0111) next_state = S2;
      else if (Key2) next_state = S0;
      else next_state = S1;

    end
    
    S2: begin //case for S2, based off of FSM
      if (Key1 && Password == 4'b1001) next_state = S3;
      else if (Key1) next_state = S0;
      else next_state = S2;
    end

    S3: begin //case for S3, based off of FSM
      if (Key2 && Password == 4'b1111) next_state = S4;
      else if (Key2) next_state = S0;
      else next_state = S3;
    end

    S4: begin //case for S4, added for additional security
      if (Reset) next_state = S0;
      else next_state = S4;
    end
  endcase
end
endmodule //to answer qiestion 1:e on lab document, The simulation waveform did not go over all cases. 
//Some cases like if it was in state 2 and went back to 0 were missing