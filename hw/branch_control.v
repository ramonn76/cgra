
module branch_control
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [16-1:0] branch_set,
  input [16-1:0] merge_set,
  input [64-1:0] branch_net_conf,
  input [16-1:0] branch_in,
  output [16-1:0] branch_out
);

  wire [16-1:0] branch_stack_2_branch_net;
  wire [16-1:0] stack_merge_set;

  branch_stack
  branch_stack0
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[0]),
    .pop(stack_merge_set[0]),
    .din(branch_in[0]),
    .dout(branch_stack_2_branch_net[0])
  );


  branch_stack
  branch_stack1
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[1]),
    .pop(stack_merge_set[1]),
    .din(branch_in[1]),
    .dout(branch_stack_2_branch_net[1])
  );


  branch_stack
  branch_stack2
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[2]),
    .pop(stack_merge_set[2]),
    .din(branch_in[2]),
    .dout(branch_stack_2_branch_net[2])
  );


  branch_stack
  branch_stack3
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[3]),
    .pop(stack_merge_set[3]),
    .din(branch_in[3]),
    .dout(branch_stack_2_branch_net[3])
  );


  branch_stack
  branch_stack4
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[4]),
    .pop(stack_merge_set[4]),
    .din(branch_in[4]),
    .dout(branch_stack_2_branch_net[4])
  );


  branch_stack
  branch_stack5
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[5]),
    .pop(stack_merge_set[5]),
    .din(branch_in[5]),
    .dout(branch_stack_2_branch_net[5])
  );


  branch_stack
  branch_stack6
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[6]),
    .pop(stack_merge_set[6]),
    .din(branch_in[6]),
    .dout(branch_stack_2_branch_net[6])
  );


  branch_stack
  branch_stack7
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[7]),
    .pop(stack_merge_set[7]),
    .din(branch_in[7]),
    .dout(branch_stack_2_branch_net[7])
  );


  branch_stack
  branch_stack8
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[8]),
    .pop(stack_merge_set[8]),
    .din(branch_in[8]),
    .dout(branch_stack_2_branch_net[8])
  );


  branch_stack
  branch_stack9
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[9]),
    .pop(stack_merge_set[9]),
    .din(branch_in[9]),
    .dout(branch_stack_2_branch_net[9])
  );


  branch_stack
  branch_stack10
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[10]),
    .pop(stack_merge_set[10]),
    .din(branch_in[10]),
    .dout(branch_stack_2_branch_net[10])
  );


  branch_stack
  branch_stack11
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[11]),
    .pop(stack_merge_set[11]),
    .din(branch_in[11]),
    .dout(branch_stack_2_branch_net[11])
  );


  branch_stack
  branch_stack12
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[12]),
    .pop(stack_merge_set[12]),
    .din(branch_in[12]),
    .dout(branch_stack_2_branch_net[12])
  );


  branch_stack
  branch_stack13
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[13]),
    .pop(stack_merge_set[13]),
    .din(branch_in[13]),
    .dout(branch_stack_2_branch_net[13])
  );


  branch_stack
  branch_stack14
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[14]),
    .pop(stack_merge_set[14]),
    .din(branch_in[14]),
    .dout(branch_stack_2_branch_net[14])
  );


  branch_stack
  branch_stack15
  (
    .clk(clk),
    .rst(rst),
    .en(en),
    .push(branch_set[15]),
    .pop(stack_merge_set[15]),
    .din(branch_in[15]),
    .dout(branch_stack_2_branch_net[15])
  );


  branch_selector16x16
  branch_selector_2_stack
  (
    .merge_set_in(merge_set),
    .branch_net_conf(branch_net_conf),
    .merge_set_out(stack_merge_set)
  );


  cross16x16
  #(
    .WIDTH(1)
  )
  crossbar_branch
  (
    .in0(branch_stack_2_branch_net[0]),
    .in1(branch_stack_2_branch_net[1]),
    .in2(branch_stack_2_branch_net[2]),
    .in3(branch_stack_2_branch_net[3]),
    .in4(branch_stack_2_branch_net[4]),
    .in5(branch_stack_2_branch_net[5]),
    .in6(branch_stack_2_branch_net[6]),
    .in7(branch_stack_2_branch_net[7]),
    .in8(branch_stack_2_branch_net[8]),
    .in9(branch_stack_2_branch_net[9]),
    .in10(branch_stack_2_branch_net[10]),
    .in11(branch_stack_2_branch_net[11]),
    .in12(branch_stack_2_branch_net[12]),
    .in13(branch_stack_2_branch_net[13]),
    .in14(branch_stack_2_branch_net[14]),
    .in15(branch_stack_2_branch_net[15]),
    .s(branch_net_conf),
    .out0(branch_out[0]),
    .out1(branch_out[1]),
    .out2(branch_out[2]),
    .out3(branch_out[3]),
    .out4(branch_out[4]),
    .out5(branch_out[5]),
    .out6(branch_out[6]),
    .out7(branch_out[7]),
    .out8(branch_out[8]),
    .out9(branch_out[9]),
    .out10(branch_out[10]),
    .out11(branch_out[11]),
    .out12(branch_out[12]),
    .out13(branch_out[13]),
    .out14(branch_out[14]),
    .out15(branch_out[15])
  );


endmodule
