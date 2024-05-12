/*
* Copyright (c) 2023, University of California; Santa Barbara
* Distribution prohibited. All rights reserved.
*
* File: ucsbece152a_counter.sv
* Description: Starter file for counter.
*/
module ucsbece152a_counter #(
parameter WIDTH = 3
) (
input logic clk,
input logic rst,
output logic [WIDTH-1:0] count_o,
// part 2
input logic enable_i,
input logic dir_i
);

always_ff@(posedge clk or posedge rst) begin
	if(rst == 1'b1)begin //Note that a reset signal needs to be sent to the counter to give it an initial value
		count_o = 0; 
	end else begin
		count_o = count_o + 1; 
	end
end
endmodule
