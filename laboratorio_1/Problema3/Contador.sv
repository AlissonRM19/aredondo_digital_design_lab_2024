module Contador #(parameter n = 2) (input clk,
												input reset,
												output [n-1:0] out);
												
		always @ (posedge clk) begin
			
			if (reset) begin
				out <= 0;
			end else if (out > 2**n - 1) begin
					out <= 0;
			end else begin
				out <= out + 1;
			end
			
		end
		
endmodule