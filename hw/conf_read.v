
module conf_read
(
  input clk,
  input rst,
  input start,
  input [32-1:0] num_conf,
  input available_read,
  input [512-1:0] rd_data,
  output reg req_rd_data,
  output reg wr_conf,
  output reg [352-1:0] conf_out,
  output reg [10-1:0] conf_addr_out,
  output reg [512-1:0] initial_conf,
  output reg done
);

  reg [32-1:0] cont_conf;
  reg [3-1:0] fms_cs;
  reg [1-1:0] flag_rd_init_conf;
  reg [10-1:0] conf_addr_out_next;
  localparam [3-1:0] FSM_WAIT = 0;
  localparam [3-1:0] FSM_RD_INITIAL_CONF = 1;
  localparam [3-1:0] FSM_RD_CONF = 2;
  localparam [3-1:0] FSM_DONE = 3;

  always @(posedge clk) begin
    if(rst) begin
      req_rd_data <= 1'b0;
      conf_out <= 352'd0;
      cont_conf <= 32'd0;
      wr_conf <= 1'b0;
      done <= 'd0;
      conf_addr_out <= 10'd0;
      conf_addr_out_next <= 10'd0;
      initial_conf <= 512'd0;
      flag_rd_init_conf <= 1'b0;
      fms_cs <= FSM_WAIT;
    end else begin
      if(start) begin
        req_rd_data <= 1'b0;
        wr_conf <= 1'b0;
        case(fms_cs)
          FSM_WAIT: begin
            if((cont_conf >= num_conf) && flag_rd_init_conf) begin
              fms_cs <= FSM_DONE;
            end else if(available_read) begin
              req_rd_data <= 1'b1;
              if(flag_rd_init_conf) begin
                fms_cs <= FSM_RD_CONF;
              end else begin
                fms_cs <= FSM_RD_INITIAL_CONF;
              end
            end else begin
              fms_cs <= FSM_WAIT;
            end
          end
          FSM_RD_INITIAL_CONF: begin
            initial_conf <= rd_data;
            flag_rd_init_conf <= 1'b1;
            //cont_conf <= cont_conf + 32'd1;
            fms_cs <= FSM_WAIT;
          end
          FSM_RD_CONF: begin
            if(cont_conf < num_conf) begin
              conf_out <= rd_data[351:0];
              wr_conf <= 1'b1;
              conf_addr_out <= conf_addr_out_next;
              conf_addr_out_next <= conf_addr_out_next + 10'd1;
              cont_conf <= cont_conf + 32'd1;
              fms_cs <= FSM_WAIT;
            end else begin
              fms_cs <= FSM_DONE;
            end
          end
          FSM_DONE: begin
            done <= 'd1;
            fms_cs <= FSM_DONE;
          end
        endcase
      end 
    end
  end


endmodule
