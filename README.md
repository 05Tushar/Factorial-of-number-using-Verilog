# Factorial-of-number-using-Verilog
`timescale 1ns / 1ps

module factr(number, overflow,result,clk);
    
	input clk;

        input[31:0] number;
    
	output[31:0] result;
    
	reg [31:0] result;
    
	reg [31:0] counter;
    //integer counter;
    
    	
	output overflow;
    
	assign overflow=(number>32'b1100)?1:0;
    
	initial begin
        
		counter=0;
        
		result=32'b1;
    
	end
    
	always@(posedge clk) begin
        
		if (counter<number) begin
            		

counter=counter+1;
            		

result=result*counter;
        	
	end
 
end
endmodule
 
