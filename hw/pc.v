
module pc
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [10-1:0] max,
  input [10-1:0] loop,
  output reg [10-1:0] pc,
  output reg [1-1:0] pc_rd_conf
);

  reg [10-1:0] pc_next;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      pc <= 10'd0;
      pc_rd_conf <= 1'b0;
      pc_next <= 10'b0;
    end else begin
      if(en) begin
        pc_rd_conf <= 1'b1;
        if(pc_next < max - 10'd2) begin
          pc <= pc_next;
          pc_next <= pc_next + 10'd1;
        end else begin
          pc <= pc_next;
          pc_next <= loop;
        end
      end else begin
        pc_rd_conf <= 1'b0;
      end
    end
  end


endmodule
