module battleship (input logic clk,
						input logic reset,
						// inputs
						input logic attack,
						input logic izquierda,
						input logic arriba,
						input logic abajo,
						input logic derecha,
						input logic [2:0] barcos,
						//  outputs
						output en
						);
						
	//FSM
	logic [2:0] barcos_put;
	logic to;
	logic [2:0] hp_pc;
	logic [2:0] hp_player;
	logic en_cont_seg;
	logic en_put_barcos;
	logic en_player_attack;
	logic en_move;
	int matriz_pc [4:0] [4:0];
	int matriz_player [4:0] [4:0]; // rows, columns
	
	// Contador Segundos
	int total_seg;
	
	always @(reset) begin
		barcos_put = 0;
		hp_pc = 1;
		hp_player = 1;
		//matriz_pc = 0;
		//matriz_player = 0;
		matriz_pc = '{'{1,0,0,0,0},
						  '{0,1,0,0,0},
						  '{0,0,1,0,0},
						  '{0,0,0,1,0},
						  '{0,0,0,0,1}};
		matriz_player = '{'{1,0,0,0,0},
								'{0,1,0,0,0},
								'{0,0,1,0,0},
								'{0,0,0,1,0},
								'{0,0,0,0,1}};
	end

	// Instancia FSM					
	fsm maquina (.clk(clk),
					.reset(reset),
					.attack(attack),
					.barcos_put(barcos_put),
					.to(to),
					.hp_pc(hp_pc),
					.hp_player(hp_player),
					.en_cont_seg(en_cont_seg),
					.en_put_barcos(en_put_barcos),
					.en_player_attack(en_player_attack),
					.en_move(en_move)
					);
					
	// Instancia Contador Segundos
	contador_seg contador (.clk(clk),
									.en_cont_seg(en_cont_seg),
									.total_seg(total_seg)
									);
	
	// Instancia Comparador
	comparador comparar (.total_seg(total_seg),
								.to(to)
								);
	
	assign en = 1;
						
endmodule