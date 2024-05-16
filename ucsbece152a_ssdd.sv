
/*
* Copyright (c) 2023, University of California; Santa Barbara
* Distribution prohibited. All rights reserved.
*
* File: ucsbece152a_ssdd.sv
* Description: Starter file for seven-segment display decoder.
*/
module ucsbece152a_ssdd (
input logic [2:0] data_i,
output logic [6:0] seven_segment_display_o
);
/*
a - - - - - -
f b | | | | | | | | | |
g - - - - -
e c | | | | | | | | | |
d - - - - -
*/
always_comb begin
case (data_i) // abcdefg
3'h0: seven_segment_display_o = 7'b1111110;
3'h1: seven_segment_display_o = 7'b0110000;
3'h2: seven_segment_display_o = 7'b1101101;
3'h3: seven_segment_display_o = 7'b1111001;
3'h4: seven_segment_display_o = 7'b0110011;
3'h5: seven_segment_display_o = 7'b1011011;
3'h6: seven_segment_display_o = 7'b1011111;
3'h7: seven_segment_display_o = 7'b1110000;
3'h8: seven_segment_display_o = 7'b1111111;
3'h9: seven_segment_display_o = 7'b1110011;
endcase
end
endmodule