module buffer #
(
  parameter DATA_WIDTH = 512,
  parameter ADDR_WIDTH = 20
)
(
  input 						clk,
  input 						rst,
  
  input 						valid_in,
  input [DATA_WIDTH-1:0]	din,
  
  output 					valid_out,
  
  input 						deq,
  
  
  output [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] mem[ADDR_WIDTH-1:0];

integer i, insert, getindex;
assign dout = mem[getindex];
assign valid_out = (insert!=getindex) ? 1'b1: 1'b0;


always @(posedge clk) begin
	if(rst==1'b1)begin
		for(i = 0; i < ADDR_WIDTH; i=i+1)begin
			mem[i] <= 0;
		end
	end
	else begin
		if(valid_in) begin
			mem[insert] <= din;
		end 
	end
end

always @(posedge clk) begin
	if(rst==1'b1)begin
		insert <= 0; 
		getindex <= 0;
	end
	
	else begin
		if(valid_in == 1'b1) begin
			insert <= (insert == ADDR_WIDTH - 1) ? 0 : insert+1;
		end
		if(deq == 1 && insert!=getindex) begin
			getindex <= (getindex == ADDR_WIDTH - 1) ? 0 : getindex+1;
 		end
	end
end
  
endmodule
