
module fu
(
  input [1-1:0] clk,
  input [1-1:0] rst,
  input [1-1:0] en,
  input [4-1:0] op,
  input [1-1:0] branch_in,
  input [16-1:0] in_a,
  input [16-1:0] in_b,
  output reg [1-1:0] branch_out,
  output reg [16-1:0] out
);

  localparam PASS_A = 0;
  localparam PASS_B = 1;
  localparam ADD = 2;
  localparam SUB = 3;
  localparam MULT = 4;
  localparam DIV = 5;
  localparam AND = 6;
  localparam OR = 7;
  localparam MOD = 8;
  localparam SHL = 9;
  localparam SHR = 10;
  localparam BEQ = 11;
  localparam BNE = 12;
  localparam SLT = 13;
  localparam NOT = 14;
  localparam MERGE = 15;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      branch_out <= 1'b0;
      out <= 16'd0;
    end else begin
      if(en) begin
        case(op)
          PASS_A: begin
            out <= in_a;
            branch_out <= 1'b0;
          end
          PASS_B: begin
            out <= in_b;
            branch_out <= 1'b0;
          end
          ADD: begin
            out <= in_a + in_b;
            branch_out <= 1'b0;
          end
          SUB: begin
            out <= in_a - in_b;
            branch_out <= 1'b0;
          end
          MULT: begin
            out <= in_a * in_b;
            branch_out <= 1'b0;
          end
          DIV: begin
            out <= in_b / in_b;
            branch_out <= 1'b0;
          end
          AND: begin
            out <= in_a & in_b;
            branch_out <= 1'b0;
          end
          OR: begin
            out <= in_a | in_b;
            branch_out <= 1'b0;
          end
          MOD: begin
            out <= in_a;
            branch_out <= 1'b0;
          end
          SHL: begin
            out <= in_a << 1;
            branch_out <= 1'b0;
          end
          SHR: begin
            out <= in_a >> 1;
            branch_out <= 1'b0;
          end
          BEQ: begin
            out <= in_a;
            branch_out <= (in_a == in_b)? 1'b1 : 1'b0;
          end
          BNE: begin
            out <= in_a;
            branch_out <= (in_a != in_b)? 1'b1 : 1'b0;
          end
          SLT: begin
            out <= (in_a < in_b)? 1'b1 : 16'd0;
            branch_out <= 1'b0;
          end
          NOT: begin
            out <= ~in_a;
            branch_out <= 1'b0;
          end
          MERGE: begin
            out <= (branch_in)? in_a : in_b;
            branch_out <= 1'b0;
          end
          default: begin
            out <= 16'd0;
            branch_out <= 1'b0;
          end
        endcase
      end else begin
        out <= 16'd0;
        branch_out <= 1'b0;
      end
    end
  end


endmodule
