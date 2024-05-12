module div4 #(
parameter WIDTH = 4
) (
input logic [WIDTH-1:0] data_i,
input logic en_i,
input logic clk, 
output logic [WIDTH-1:0] data_o,
output logic valid_o
);
logic [WIDTH-1:0] data_d, data_q;
always_comb begin
data_d = data_q; 
if (en_i) begin
data_o = WIDTH'(data_i[WIDTH-1:2]);
valid_o = 1'b1;
end else begin
valid_o = 1'b0;
end
end

always_ff @(posedge clk) begin
data_q <= data_d;
end
endmodule
