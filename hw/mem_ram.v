
module mem_ram #
(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 8
)
(
  input clk,
  input rst,
  input we,
  input re,
  input [ADDR_WIDTH-1:0] raddr,
  input [ADDR_WIDTH-1:0] waddr,
  input [DATA_WIDTH-1:0] din,
  output reg [DATA_WIDTH-1:0] dout
);

  // (*RAM_STYLE = "{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
  (* ramstyle = "no_rw_check" *)
  reg [DATA_WIDTH-1:0] mem [0:2**ADDR_WIDTH-1];

  always @(posedge clk) begin
    if(rst) begin
      dout <= 0;
    end else begin
      if(we) begin
        mem[waddr] <= din;
      end else if(re) begin
        dout <= mem[raddr];
      end 
    end
  end


endmodule
