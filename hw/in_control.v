
module in_control
(
  input clk,
  input rst,
  input start,
  input [64-1:0] num_data,
  input [1-1:0] rd_en,
  input rdy,
  input available_read,
  input [512-1:0] rd_data,
  output reg req_rd_data,
  output en,
  output [16-1:0] dout
);

  reg reg_en;
  reg [6-1:0] index_data;
  reg [512-1:0] data;
  reg [16-1:0] data_out;
  reg [64-1:0] cont_data;
  reg [3-1:0] fms_cs;
  reg flag_cpy_data;
  wire [16-1:0] wdata [0:32-1];
  genvar i;

  generate for(i=0; i<32; i=i+1) begin : gen_1
    assign wdata[i] = data[i*16+16-1:i*16];
  end
  endgenerate

  assign dout = data_out[15:0];
  assign en = rdy & reg_en;
  localparam [3-1:0] FSM_WAIT = 0;
  localparam [3-1:0] FSM_RD_DATA = 1;
  localparam [3-1:0] FSM_DONE = 2;

  always @(posedge clk) begin
    if(rst) begin
      req_rd_data <= 1'b0;
      index_data <= 6'd0;
      data <= 512'd0;
      data_out <= 16'd0;
      cont_data <= 64'd0;
      reg_en <= 1'b0;
      flag_cpy_data <= 1'b0;
      fms_cs <= FSM_WAIT;
    end else begin
      if(start) begin
        req_rd_data <= 1'b0;
        reg_en <= 1'b0;
        case(fms_cs)
          FSM_WAIT: begin
            if(available_read) begin
              req_rd_data <= 1'b1;
              flag_cpy_data <= 1'b0;
              fms_cs <= FSM_RD_DATA;
            end else if(cont_data >= num_data) begin
              fms_cs <= FSM_DONE;
              reg_en <= 1'b1;
            end else begin
              fms_cs <= FSM_WAIT;
            end
          end
          FSM_RD_DATA: begin
            if(cont_data < num_data) begin
              if(index_data < 31) begin
                if(flag_cpy_data == 1'b0) begin
                  data <= rd_data;
                  flag_cpy_data <= 1'b1;
                  if(rdy) begin
                    reg_en <= 1'b1;
                    if(rd_en) begin
                      data_out <= rd_data[15:0];
                      cont_data <= cont_data + 1;
                      index_data <= index_data + 1;
                    end 
                  end 
                end else if(rdy) begin
                  reg_en <= 1'b1;
                  if(rd_en) begin
                    data_out <= wdata[index_data];
                    cont_data <= cont_data + 1;
                    index_data <= index_data + 1;
                  end 
                end 
                fms_cs <= FSM_RD_DATA;
              end else if(rdy) begin
                reg_en <= 1'b1;
                if(rd_en) begin
                  data_out <= wdata[index_data];
                  index_data <= 6'd0;
                  cont_data <= cont_data + 1;
                  if(available_read) begin
                    req_rd_data <= 1'b1;
                    flag_cpy_data <= 1'b0;
                    fms_cs <= FSM_RD_DATA;
                  end else begin
                    fms_cs <= FSM_WAIT;
                  end
                end 
              end 
            end else begin
              reg_en <= 1'b1;
              fms_cs <= FSM_DONE;
            end
          end
          FSM_DONE: begin
            reg_en <= 1'b1;
            fms_cs <= FSM_DONE;
          end
        endcase
      end 
    end
  end


endmodule
