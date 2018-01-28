
module pe_io
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] start,
  input [64-1:0] num_data_in,
  input [1-1:0] available_read,
  input [512-1:0] data_in,
  output [1-1:0] req_rd_data,
  input [1-1:0] available_write,
  output [512-1:0] data_out,
  output [1-1:0] req_wr_data,
  input [64-1:0] num_data_out,
  input [32-1:0] num_cicles_to_store,
  output done,
  input [8-1:0] conf,
  input branch_in,
  input [16-1:0] ina,
  input [16-1:0] inb,
  output [1-1:0] branch_out,
  output [16-1:0] out0,
  output [16-1:0] out1,
  output en_out
);

  wire [4-1:0] fu_op;
  wire rdy;
  wire [16-1:0] mux2fu;
  wire [16-1:0] rf2mux;
  wire [3-1:0] rfaddr;
  wire [1-1:0] rfwr;
  wire [1-1:0] muxfu_sel;
  wire [16-1:0] fu_2_mux_out;
  wire reg_s_mux_2_mux_out;
  wire reg2_en;
  wire [16-1:0] control_in_2_mux_out;
  wire rd_en;
  wire wr_en;
  assign wr_en = conf[2] & (~conf[3] & ~conf[1] & conf[0] | conf[3] & conf[1] & ~conf[0]);
  assign rd_en = conf[2] & ~conf[0] & ~(conf[3] ^ conf[1]);
  assign fu_op = conf[3:0];
  assign rfaddr = conf[6:5] - 2'd1;
  assign rfwr = ~conf[7] & (conf[6] | conf[5]);
  assign muxfu_sel = conf[7] & (conf[6] | conf[5]);
  assign reg2_en = conf[4] & en_out;

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
    .en(en_out),
    .rst(rst),
    .op(fu_op),
    .branch_in(branch_in),
    .in_a(ina),
    .in_b(mux2fu),
    .branch_out(branch_out),
    .out(fu_2_mux_out)
  );


  m_register
  #(
    .WIDTH(1)
  )
  reg_s_mux
  (
    .clk(clk),
    .rst(rst),
    .en(en_out),
    .in(rd_en),
    .out(reg_s_mux_2_mux_out)
  );


  in_control
  control_in
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .num_data(num_data_in),
    .rd_en(rd_en),
    .rdy(rdy),
    .available_read(available_read),
    .rd_data(data_in),
    .req_rd_data(req_rd_data),
    .en(en_out),
    .dout(control_in_2_mux_out)
  );


  out_control
  control_out
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .num_data(num_data_out),
    .num_cicles_to_store(num_cicles_to_store),
    .wr_en(wr_en),
    .rdy(rdy),
    .available_write(available_write),
    .wr_data(data_out),
    .req_wr_data(req_wr_data),
    .en(en_out),
    .din(ina),
    .done(done)
  );


  mux2x1
  #(
    .WIDTH(16)
  )
  muxout
  (
    .in0(fu_2_mux_out),
    .in1(control_in_2_mux_out),
    .s(reg_s_mux_2_mux_out),
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
