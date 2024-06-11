module chargenrom(input logic [7:0] ch,
						input logic [2:0] xoff, yoff,
						output logic pixel,pixel2);
						
	logic [5:0] charrom[2047:0]; // character generator ROM
	logic [7:0] line; // a line read from the ROM
	// Initialize ROM with characters from text file
	initial begin
		$readmemb("charrom.txt", charrom);
	end
	// Index into ROM to find line of character
    
	assign line = charrom[yoff + {ch-65, 3'b000}];// Subtract 65 because A
	
	// is entry 0
	// Reverse order of bits
	assign pixel = line[3'd7 - xoff];
	assign pixel2 = line[3'd7 - xoff];
	
endmodule