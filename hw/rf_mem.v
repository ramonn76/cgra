
module rf_mem #
(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 8
)
(
  input clk,
  input we,
  input [ADDR_WIDTH-1:0] raddr,
  input [ADDR_WIDTH-1:0] waddr,
  input [DATA_WIDTH-1:0] din,
  output [DATA_WIDTH-1:0] dout
);

  // (*RAM_STYLE = "{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
  (* ramstyle = "no_rw_check" *)
  reg [DATA_WIDTH-1:0] mem [0:ADDR_WIDTH-1];
  assign dout = mem[raddr];

  always @(posedge clk) begin
    if(we) begin
      mem[waddr] <= din;
    end 
  end


endmodule
