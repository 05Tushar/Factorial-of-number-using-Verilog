`timescale 1ns / 1ps
// Asynchronous active High reset and parameterized Mealey FSM
module N_factorial
                  #( parameter N_size = 3       // Size of Number
                  )
                  (
                    input  logic clk, reset, 
                    input  logic [N_size-1:0]      N,         // n-bit number
                    output logic [2**(2+N_size):0] Factorial  // 2**(2+n-bit) number to represent factorial of n-bit number
                  );

  localparam s0 = 1'b0;  // State to start
  localparam s1 = 1'b1;  // State to calculate Factorial

  bit curr_state, next_state;
  always @(posedge clk, posedge reset) begin
    if(reset) curr_state <= s0;
    else  begin 
      curr_state <= next_state;
      if (curr_state == s1) Increment <= Increment - 1;
      else Increment <= N;
    end
  end

  logic [N_size-1:0]      Increment;
  logic Done;

  always_comb begin
    case(curr_state)
      s0 : begin 
            Factorial = 1;
            if (N == 1 || N == 0) begin
              Done = 1;
              next_state = s0;
              end
            else if (N > 1) begin
              Done = 0;
              next_state = s1;
            end
          end
      s1 : begin
            if(Increment > 1) begin
              Factorial = Factorial * Increment;              
              next_state = s1;
              Done = 0;
            end
            else begin
              next_state = s0;
              Done = 1;
            end
          end
    endcase
  end
endmodule
