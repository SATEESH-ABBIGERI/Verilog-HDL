module tf(
input clk,
output reg green,red,yellow);

parameter st_init = 2'b00, st_green = 2'b01, st_yellow = 2'b10, st_red = 2'b11;

reg [1:0] state = st_init;

always @(posedge clk)
	begin 
		case (state)
			st_init: begin
			state <= st_green;
			green <= 0;
			red <= 0;
			yellow <= 0;
			end

			st_green : begin
			state <= st_yellow;
			green <= 1;
			red <= 0;
			yellow <= 0;
			end

			st_yellow : begin
			state <= st_red;
			green <= 0;
			red <= 0;
			yellow <= 1;
			end

			st_red : begin
			state <= st_green;
			green <= 0;
			red <= 1;
			yellow <= 0;
			end

			default state = st_init;

		endcase
	end
endmodule
