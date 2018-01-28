
module mux2x1 #
(
  parameter WIDTH = 16
)
(
  input [WIDTH-1:0] in0,
  input [WIDTH-1:0] in1,
  input [1-1:0] s,
  output [WIDTH-1:0] out
);

  wire [WIDTH-1:0] ins [0:2-1];
  assign ins[0] = in0;
  assign ins[1] = in1;
  assign out = ins[s];

endmodule
