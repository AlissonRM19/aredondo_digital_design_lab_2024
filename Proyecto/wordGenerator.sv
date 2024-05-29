module wordGenerator(
    input logic clk,
    input logic [9:0] x, y,
    output logic [7:0] current_char
);
    parameter string word = "BTS,ES UN GRUPO DE KPOP MUY FAMOS."; // Define la palabra que quieres mostrar
    logic [7:0] char_array [0:31]; // Array para la palabra (32 caracteres máximo)
    integer i;

    initial begin
        // Inicializa el array con la palabra, agregando espacios al final si es necesario
        for (i = 0; i < 32; i = i + 1) begin
            if (i < word.len()) begin
                char_array[i] = word[i];
            end else begin
                char_array[i] = 8'd32; // Espacio en ASCII
            end
        end
    end

    // Calcula el índice de la letra a mostrar en función de la posición x
    always @(*) begin
        if (x < 640 && y < 480) begin
            current_char = char_array[(x / 8) % word.len()]; // Cambia cada 8 píxeles horizontales
        end else begin
            current_char = 8'd32; // Espacio
        end
    end
endmodule
