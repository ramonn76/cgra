
module branch_stack
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [1-1:0] push,
  input [1-1:0] pop,
  input [1-1:0] din,
  output [1-1:0] dout
);

  reg [1024-1:0] stack;
  reg [10-1:0] top;
  assign dout = (top > 10'd0)? stack[top - 1] : stack[top];

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      top <= 10'd0;
      stack <= 1024'd0;
    end else begin
      if(en) begin
        if(push && pop) begin
          if(top > 10'd0) begin
            stack[top - 10'd1] <= din;
          end else begin
            stack[top] <= din;
            top <= top + 10'd1;
          end
        end else if(push) begin
          stack[top] <= din;
          if(top < 10'd1023) begin
            top <= top + 10'd1;
          end 
        end else if(pop) begin
          if(top > 10'd0) begin
            top <= top - 10'd1;
          end 
        end 
      end 
    end
  end


endmodule
