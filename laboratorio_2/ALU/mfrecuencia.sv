module mfrecuencia  #(parameter n = 4);

	
	logic clk;
	logic reset;

	logic [n-1:0] in1;
	logic [n-1:0] in2;
	logic [3:0] mode;
	logic [n-1:0] out_in1;
	logic [n-1:0] out_in2;
	logic [3:0] out_mode;
	
	
	logic neg;
	logic cero;
	logic carry;
	logic des;
	logic [1:0][3:0] num;
	logic [1:0] [6:0] out;
	logic [6:0] mode_seg;
	logic out_neg;
	logic out_cero;
	logic out_carry;
	logic out_des;
	logic [1:0][3:0] out_num;
	logic [1:0] [6:0] out_out;
	logic [6:0] out_mode_seg;
	
	
	
	
	
	ff_in_n #(n) mfrecuencia_in (.in1(in1),
							 .in2(in2),
							 .mode(mode),
							 .clk(clk),
							 .reset(reset),
							 .out1(out_in1),
							 .out2(out_in2),
							 .out_mode(out_mode));
	
	ALU #(n) mfrecuencia_ALU (.in1(out_in1),
							 .in2(out_in2),
							 .mode(out_mode),
							 .num(num),
							 .neg(neg),
							 .cero(cero),
							 .carry(carry),
							 .des(des),
							 .out(out),
							 .mode_seg(mode_seg));
							 
	ff_out_n #(n) mfrecuencia_out (.cero(cero),
							 .carry(carry),
							 .neg(neg),
							 .des(des),
							 .num(num),
							 .mode_seg(mode_seg),
							 .out(out),
							 .clk(clk),
							 .reset(reset),
							 .out_neg(out_neg),
							 .out_cero(out_cero),
							 .out_carry(out_carry),
							 .out_des(out_des),
							 .out_num(out_num),
							 .out_mode_seg(out_mode_seg),
							 .out_out(out_out));	
							 
							 initial begin
							 #5;
							 
							 end
							 
endmodule