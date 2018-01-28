
module m_register #
(
  parameter WIDTH = 16
)
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [WIDTH-1:0] in,
  output reg [WIDTH-1:0] out
);


  always @(posedge clk or posedge rst) begin
    if(rst) begin
      out <= 0;
    end else begin
      if(en) begin
        out <= in;
      end 
    end
  end


endmodule
