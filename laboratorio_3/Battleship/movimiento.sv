module movimiento (input logic izquierda,
						input logic arriba,
						input logic abajo,
						input logic derecha,
						input logic en_move,
						output int [1,0] posicion);

	int temp [1:0] = 0;
	
	always @ (en_move) begin
		if (izquierda && temp[1] != 4) begin
			temp[1] = temp[1] + 1;
		end else if (derecha && temp[1] != 0) begin
			temp[1] = temp[1] - 1;
		end else if (arriba && temp[0] != 4) begin
			temp[0] = temp[0] + 1;
		end else if (abajo && temp[0] != 0) begin
			temp[0] = temp[0] - 1;
		end
	end
	
endmodule