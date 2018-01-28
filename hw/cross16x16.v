
module cross16x16 #
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
  input [64-1:0] s,
  output [WIDTH-1:0] out0,
  output [WIDTH-1:0] out1,
  output [WIDTH-1:0] out2,
  output [WIDTH-1:0] out3,
  output [WIDTH-1:0] out4,
  output [WIDTH-1:0] out5,
  output [WIDTH-1:0] out6,
  output [WIDTH-1:0] out7,
  output [WIDTH-1:0] out8,
  output [WIDTH-1:0] out9,
  output [WIDTH-1:0] out10,
  output [WIDTH-1:0] out11,
  output [WIDTH-1:0] out12,
  output [WIDTH-1:0] out13,
  output [WIDTH-1:0] out14,
  output [WIDTH-1:0] out15
);


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux0
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[3:0]),
    .out(out0)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux1
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[7:4]),
    .out(out1)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux2
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[11:8]),
    .out(out2)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux3
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[15:12]),
    .out(out3)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux4
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[19:16]),
    .out(out4)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux5
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[23:20]),
    .out(out5)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux6
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[27:24]),
    .out(out6)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux7
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[31:28]),
    .out(out7)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux8
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[35:32]),
    .out(out8)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux9
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[39:36]),
    .out(out9)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux10
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[43:40]),
    .out(out10)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux11
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[47:44]),
    .out(out11)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux12
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[51:48]),
    .out(out12)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux13
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[55:52]),
    .out(out13)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux14
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[59:56]),
    .out(out14)
  );


  mux16x1
  #(
    .WIDTH(WIDTH)
  )
  mux15
  (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .in8(in8),
    .in9(in9),
    .in10(in10),
    .in11(in11),
    .in12(in12),
    .in13(in13),
    .in14(in14),
    .in15(in15),
    .s(s[63:60]),
    .out(out15)
  );


endmodule
