module cgra_shell
(
  input logic 	rst,
  input logic	clk,
  input logic	[511:0] data_in,
  input logic valid_in,
  output logic [511:0] data_out,
  output logic	valid_out
);

	wire available_write;
	wire available_read;
	wire req_rd_data;
	wire [512-1:0]rd_data;
	wire req_wr_data;
	wire [512-1:0]wr_data;
	wire done;
	
	
  uut_interface
  uut_interface
  (
		.clk(clk),
		.rst(rst),
		.start(!rst),
		.available_write('1),
		.available_read(available_read),
		.req_rd_data(req_rd_data),
		.rd_data(rd_data),
		.req_wr_data(valid_out),
		.wr_data(data_out),
		.done(done)
	);
  
  
//	buffer_out
//	buffer_out
//	(
//		.clk(clk),
//		.rst(rst),
//		.valid_in(req_wr_data),
//		.din(wr_data),
//		.valid_out(valid_out),
//		.enable_out(available_write),
//		.dout(data_out)
//	);
	
	
	buffer
	buffer
	(
		.clk(clk),
		.rst(rst),
		.valid_in(valid_in),
		.din(data_in),
		.valid_out(available_read),
		.deq(req_rd_data),
		.dout(rd_data)
	);
  
endmodule
