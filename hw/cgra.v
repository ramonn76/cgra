
module cgra
(
  input clk,
  input rst,
  input start,
  input [1-1:0] available_read,
  input [512-1:0] rd_data,
  output [1-1:0] req_rd_data,
  input [1-1:0] available_write,
  output [512-1:0] wr_data,
  output [1-1:0] req_wr_data,
  output [1-1:0] done
);

  wire [512-1:0] initial_conf;
  wire [64-1:0] num_data_in;
  wire [64-1:0] num_data_out;
  wire [32-1:0] num_cicles_to_store;
  wire [32-1:0] num_conf;
  wire [32-1:0] start_loop;
  wire [352-1:0] conf;
  wire [16-1:0] branch_in;
  wire [16-1:0] branch_out;
  wire [16-1:0] branch_set;
  wire [16-1:0] merge_set;
  wire [64-1:0] branch_net_conf;
  wire stop_exec;
  wire start_unit_exec;
  wire rq_rd_data_control_exec;
  wire rq_rd_data_unit_exec;
  assign req_rd_data = rq_rd_data_control_exec | rq_rd_data_unit_exec;

  decode_initial_conf
  decode_initial_conf
  (
    .initial_conf(initial_conf),
    .num_data_in(num_data_in),
    .num_data_out(num_data_out),
    .num_conf(num_conf),
    .num_cicles_to_store(num_cicles_to_store),
    .start_loop(start_loop)
  );


  control_exec
  control_exec
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .num_conf(num_conf),
    .start_loop(start_loop),
    .en_pc(stop_exec),
    .available_read(available_read),
    .rd_data(rd_data),
    .req_rd_data(rq_rd_data_control_exec),
    .conf_out(conf),
    .initial_conf(initial_conf),
    .start_unit_exec(start_unit_exec)
  );


  decoder_branch
  decoder_branch
  (
    .conf(conf),
    .branch_set(branch_set),
    .merge_set(merge_set),
    .branch_net_conf(branch_net_conf)
  );


  branch_control
  branch_control
  (
    .clk(clk),
    .rst(rst),
    .en(start_unit_exec),
    .branch_set(branch_set),
    .merge_set(merge_set),
    .branch_net_conf(branch_net_conf),
    .branch_in(branch_out),
    .branch_out(branch_in)
  );


  unit_exec
  unit_exec
  (
    .clk(clk),
    .rst(rst),
    .start(start_unit_exec),
    .num_data_in(num_data_in),
    .num_data_out(num_data_out),
    .num_cicles_to_store(num_cicles_to_store),
    .conf(conf),
    .branch_in(branch_in),
    .available_read(available_read),
    .rd_data(rd_data),
    .req_rd_data(rq_rd_data_unit_exec),
    .branch_out(branch_out),
    .available_write(available_write),
    .wr_data(wr_data),
    .req_wr_data(req_wr_data),
    .stop_exec_out(stop_exec),
    .done(done)
  );


endmodule
