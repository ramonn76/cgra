
module uut_interface
(
  input clk,
  input rst,
  input start,
  input available_write,
  input available_read,
  output req_rd_data,
  input [512-1:0] rd_data,
  output req_wr_data,
  output [512-1:0] wr_data,
  output done
);
	
	//wire rd;
	//wire[511:0] data;

  cgra
  cgra
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .available_write(available_write),
    .available_read(available_read),
    .req_rd_data(req_rd_data),
    .rd_data(rd_data),
    .req_wr_data(req_wr_data),
    .wr_data(wr_data),
    .done(done)
  );
  
 // fifo_in
 // fifo_in 
//(
 // .clk(clk),
 // .rst(rst),
  //.rd(rd),
  //.dout(data)
//);


  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, "uut_interface");
  end


endmodule
