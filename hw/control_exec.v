
module control_exec
(
  input clk,
  input rst,
  input start,
  input [32-1:0] num_conf,
  input [32-1:0] start_loop,
  input en_pc,
  input available_read,
  input [512-1:0] rd_data,
  output req_rd_data,
  output [352-1:0] conf_out,
  output [512-1:0] initial_conf,
  output start_unit_exec
);

  wire [10-1:0] pc2mem_conf_addr;
  wire conf_read2mem_conf_wr_conf;
  wire [1-1:0] pc2mem_conf_rd_conf;
  wire [352-1:0] conf_read2mem_conf_conf;
  wire [10-1:0] conf_read2mem_conf;

  conf_read
  conf_read
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .num_conf(num_conf),
    .available_read(available_read),
    .rd_data(rd_data),
    .req_rd_data(req_rd_data),
    .wr_conf(conf_read2mem_conf_wr_conf),
    .conf_out(conf_read2mem_conf_conf),
    .conf_addr_out(conf_read2mem_conf),
    .initial_conf(initial_conf),
    .done(start_unit_exec)
  );


  mem_ram
  #(
    .DATA_WIDTH(352),
    .ADDR_WIDTH(10)
  )
  mem_conf
  (
    .clk(clk),
    .rst(rst),
    .we(conf_read2mem_conf_wr_conf),
    .re(pc2mem_conf_rd_conf),
    .raddr(pc2mem_conf_addr),
    .waddr(conf_read2mem_conf),
    .din(conf_read2mem_conf_conf),
    .dout(conf_out)
  );


  pc
  pc
  (
    .clk(clk),
    .rst(rst),
    .en(en_pc),
    .max(num_conf[9:0]),
    .loop(start_loop[9:0]),
    .pc(pc2mem_conf_addr),
    .pc_rd_conf(pc2mem_conf_rd_conf)
  );


endmodule
