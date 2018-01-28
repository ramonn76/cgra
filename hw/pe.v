
module pe
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [8-1:0] conf,
  input branch_in,
  input [16-1:0] ina,
  input [16-1:0] inb,
  output [1-1:0] branch_out,
  output [16-1:0] out0,
  output [16-1:0] out1
);

  wire [4-1:0] fu_op;
  wire [16-1:0] mux2fu;
  wire [16-1:0] rf2mux;
  wire [3-1:0] rfaddr;
  wire [1-1:0] rfwr;
  wire [1-1:0] muxfu_sel;
  wire reg2_en;
  assign fu_op = conf[3:0];
  assign rfaddr = conf[6:5] - 2'd1;
  assign rfwr = ~conf[7] & (conf[6] | conf[5]);
  assign muxfu_sel = conf[7] & (conf[6] | conf[5]);
  assign reg2_en = conf[4] & en;

  rf_mem
  #(
    .DATA_WIDTH(16),
    .ADDR_WIDTH(3)
  )
  rf_
  (
    .clk(clk),
    .we(rfwr),
    .raddr(rfaddr),
    .waddr(rfaddr),
    .din(ina),
    .dout(rf2mux)
  );


  mux2x1
  #(
    .WIDTH(16)
  )
  muxfu
  (
    .in0(inb),
    .in1(rf2mux),
    .s(muxfu_sel),
    .out(mux2fu)
  );


  fu
  fu_
  (
    .clk(clk),
    .en(en),
    .rst(rst),
    .op(fu_op),
    .branch_in(branch_in),
    .in_a(ina),
    .in_b(mux2fu),
    .branch_out(branch_out),
    .out(out0)
  );


  m_register
  #(
    .WIDTH(16)
  )
  reg1
  (
    .clk(clk),
    .rst(rst),
    .en(reg2_en),
    .in(inb),
    .out(out1)
  );


endmodule
