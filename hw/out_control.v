
module out_control
(
  input clk,
  input rst,
  input start,
  input [64-1:0] num_data,
  input [32-1:0] num_cicles_to_store,
  input [1-1:0] wr_en,
  input en,
  input [16-1:0] din,
  input available_write,
  output reg req_wr_data,
  output [512-1:0] wr_data,
  output reg [1-1:0] rdy,
  output reg done
);

  reg [6-1:0] index_data;
  reg [16-1:0] data [0:32-1];
  reg [64-1:0] cont_data;
  reg [32-1:0] cont_cicles_to_store;
  reg [3-1:0] fms_cs;
  genvar i;

  generate for(i=0; i<32; i=i+1) begin : gen_1
    assign wr_data[i*16+16-1:i*16] = data[i];
  end
  endgenerate

  localparam [3-1:0] FSM_WAIT = 0;
  localparam [3-1:0] FSM_WR_DATA = 1;
  localparam [3-1:0] FSM_DONE = 2;

  integer j;
  
  always @(posedge clk) begin
    if(rst) begin
      fms_cs <= FSM_WR_DATA;
      index_data <= 6'd0;
      req_wr_data <= 1'b0;
      done <= 1'b0;
      cont_data <= 64'd0;
      cont_cicles_to_store <= 32'd0;
      rdy <= 1'd1;
		for(j=0; j<32; j=j+1)begin
			data[j] = 0;
		end
    end else begin
      if(start) begin
        req_wr_data <= 1'b0;
        case(fms_cs)
          FSM_WR_DATA: begin
            if(cont_data >= num_data) begin
              if(index_data > 0) begin
                if(available_write) begin
                  req_wr_data <= 1'b1;
                  index_data <= 6'd0;
                  fms_cs <= FSM_DONE;
                end 
              end else begin
                fms_cs <= FSM_DONE;
              end
            end else if(en) begin
              if(wr_en) begin
                if(cont_cicles_to_store < num_cicles_to_store) begin
                  cont_cicles_to_store <= cont_cicles_to_store + 32'd1;
                end else if(index_data < 31) begin
                  data[index_data] <= { 1'd0, din }; // SIZE 1 IS A WORKAROUND
                  index_data <= index_data + 6'd1;
                  cont_data <= cont_data + 64'd1;
                end else if(available_write) begin
                  data[index_data] <= { 1'd0, din }; // SIZE 1 IS A WORKAROUND
                  req_wr_data <= 1'b1;
                  index_data <= 6'd0;
                  cont_data <= cont_data + 64'd1;
                end else begin
                  data[index_data] <= { 1'd0, din }; // SIZE 1 IS A WORKAROUND
                  fms_cs <= FSM_WAIT;
                  rdy <= 1'd0;
                  cont_data <= cont_data + 64'd1;
                end
              end 
            end 
          end
          FSM_WAIT: begin
            if(available_write) begin
              rdy <= 1'd1;
              req_wr_data <= 1'b1;
              index_data <= 6'd0;
              fms_cs <= FSM_WR_DATA;
            end else begin
              rdy <= 1'd0;
            end
          end
          FSM_DONE: begin
            fms_cs <= FSM_DONE;
            done <= 1'b1;
          end
        endcase
      end 
    end
  end


endmodule
