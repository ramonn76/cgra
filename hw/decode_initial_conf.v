
module decode_initial_conf
(
  input [512-1:0] initial_conf,
  output [64-1:0] num_data_in,
  output [64-1:0] num_data_out,
  output [32-1:0] num_cicles_to_store,
  output [32-1:0] num_conf,
  output [32-1:0] start_loop
);

  assign num_data_in = initial_conf[63:0];
  assign num_data_out = initial_conf[127:64];
  assign num_cicles_to_store = initial_conf[159:128];
  assign num_conf = initial_conf[191:160];
  assign start_loop = initial_conf[223:192];

endmodule
