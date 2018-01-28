
module mux16x1 #
(
  parameter WIDTH = 16
)
(
  input [WIDTH-1:0] in0,
  input [WIDTH-1:0] in1,
  input [WIDTH-1:0] in2,
  input [WIDTH-1:0] in3,
  input [WIDTH-1:0] in4,
  input [WIDTH-1:0] in5,
  input [WIDTH-1:0] in6,
  input [WIDTH-1:0] in7,
  input [WIDTH-1:0] in8,
  input [WIDTH-1:0] in9,
  input [WIDTH-1:0] in10,
  input [WIDTH-1:0] in11,
  input [WIDTH-1:0] in12,
  input [WIDTH-1:0] in13,
  input [WIDTH-1:0] in14,
  input [WIDTH-1:0] in15,
  input [4-1:0] s,
  output [WIDTH-1:0] out
);

  wire [WIDTH-1:0] ins [0:16-1];
  assign ins[0] = in0;
  assign ins[1] = in1;
  assign ins[2] = in2;
  assign ins[3] = in3;
  assign ins[4] = in4;
  assign ins[5] = in5;
  assign ins[6] = in6;
  assign ins[7] = in7;
  assign ins[8] = in8;
  assign ins[9] = in9;
  assign ins[10] = in10;
  assign ins[11] = in11;
  assign ins[12] = in12;
  assign ins[13] = in13;
  assign ins[14] = in14;
  assign ins[15] = in15;
  assign out = ins[s];

endmodule
