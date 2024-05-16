
/*
* Copyright (c) 2023, University of California; Santa Barbara
* Distribution prohibited. All rights reserved.
*
* File: ucsbece152a_counter_tb.sv
* Description: Starter file for counter testbench.
*/
module ucsbece152a_counter_tb();
// Parameters
parameter WIDTH = 3;
// Create clock signal
logic clk = 0;
always #(10) clk = ~clk; // flip `clk` every 10 timesteps
// Instantiate counter nets
logic rst;
logic [WIDTH-1:0] count;
logic enable_i;
logic dir_i; 
// Instantiate the "Design Under Test"
ucsbece152a_counter #(
.WIDTH(WIDTH)
) DUT (
.clk(clk),
.rst(rst),
.count_o(count),
// part 2
.enable_i(enable_i),
.dir_i(dir_i)
);
// Simulation
integer i;
initial begin
$display( "Begin simulation.");
//\\ =========================== \\//
// Initialize counter
rst = 1;
enable_i = 1; 
dir_i = 0; 
@(negedge clk);
// Turn off rst to enable counting
rst = 0;
// Count 16 times
for (i = 0 ; i < 16; i++) begin
if (count != i%(2**WIDTH))
$display(
"Error: expected %d, received %d",
$unsigned(i), count
);
@(negedge clk);
end
// Test reset
rst = 1;
@(negedge clk);
if (count != 0)
$display("Error: expected %d, received %d", 0, count);
rst = 0;
//Test enable
//Count up 8
for (i = 0; i < 4; i++) begin	
@(negedge clk);
end
//disable counter
enable_i = 0; 
//"Count" 8 more (output should say paused
for (i = 0; i < 4; i++) begin	
@(negedge clk);
end
//Check if output is correct 
if (count != 4) begin
	$display("Error: expected 8, received %d", count); 
end

rst = 1; 
for (i = 0; i < 2; i++) begin	
@(negedge clk);
end
rst = 0;

//Check decrement 
dir_i = 1; 
enable_i = 1;
for (i = 0; i < 2; i++) begin	
@(negedge clk);
end
if (count != 6) begin
	$display("Error: expected 6, received %d", count); 
end


$display( "End simulation.");
$stop;
end
endmodule

