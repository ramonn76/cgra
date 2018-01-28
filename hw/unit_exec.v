
module unit_exec
(
  input clk,
  input rst,
  input start,
  input [64-1:0] num_data_in,
  input [64-1:0] num_data_out,
  input [32-1:0] num_cicles_to_store,
  input [352-1:0] conf,
  input [16-1:0] branch_in,
  input [1-1:0] available_read,
  input [512-1:0] rd_data,
  output [1-1:0] req_rd_data,
  output [16-1:0] branch_out,
  input [1-1:0] available_write,
  output [512-1:0] wr_data,
  output [1-1:0] req_wr_data,
  output [1-1:0] stop_exec_out,
  output [1-1:0] done
);

  wire [512-1:0] pe2net;
  wire [512-1:0] net2pe;
  wire [160-1:0] conf_net;
  assign conf_net[9:0] = conf[21:12];
  assign conf_net[19:10] = conf[43:34];
  assign conf_net[29:20] = conf[65:56];
  assign conf_net[39:30] = conf[87:78];
  assign conf_net[49:40] = conf[109:100];
  assign conf_net[59:50] = conf[131:122];
  assign conf_net[69:60] = conf[153:144];
  assign conf_net[79:70] = conf[175:166];
  assign conf_net[89:80] = conf[197:188];
  assign conf_net[99:90] = conf[219:210];
  assign conf_net[109:100] = conf[241:232];
  assign conf_net[119:110] = conf[263:254];
  assign conf_net[129:120] = conf[285:276];
  assign conf_net[139:130] = conf[307:298];
  assign conf_net[149:140] = conf[329:320];
  assign conf_net[159:150] = conf[351:342];

  pe_io
  pe0
  (
    .clk(clk),
    .rst(rst),
    .start(start),
    .available_read(available_read),
    .data_in(rd_data),
    .num_data_in(num_data_in),
    .num_data_out(num_data_out),
    .num_cicles_to_store(num_cicles_to_store),
    .done(done),
    .req_rd_data(req_rd_data),
    .available_write(available_write),
    .data_out(wr_data),
    .req_wr_data(req_wr_data),
    .conf(conf[7:0]),
    .branch_in(branch_in[0]),
    .ina(net2pe[15:0]),
    .inb(net2pe[31:16]),
    .branch_out(branch_out[0]),
    .out0(pe2net[15:0]),
    .out1(pe2net[31:16]),
    .en_out(stop_exec_out)
  );


  pe
  pe1
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[29:22]),
    .branch_in(branch_in[1]),
    .ina(net2pe[47:32]),
    .inb(net2pe[63:48]),
    .branch_out(branch_out[1]),
    .out0(pe2net[47:32]),
    .out1(pe2net[63:48])
  );


  pe
  pe2
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[51:44]),
    .branch_in(branch_in[2]),
    .ina(net2pe[79:64]),
    .inb(net2pe[95:80]),
    .branch_out(branch_out[2]),
    .out0(pe2net[79:64]),
    .out1(pe2net[95:80])
  );


  pe
  pe3
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[73:66]),
    .branch_in(branch_in[3]),
    .ina(net2pe[111:96]),
    .inb(net2pe[127:112]),
    .branch_out(branch_out[3]),
    .out0(pe2net[111:96]),
    .out1(pe2net[127:112])
  );


  pe
  pe4
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[95:88]),
    .branch_in(branch_in[4]),
    .ina(net2pe[143:128]),
    .inb(net2pe[159:144]),
    .branch_out(branch_out[4]),
    .out0(pe2net[143:128]),
    .out1(pe2net[159:144])
  );


  pe
  pe5
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[117:110]),
    .branch_in(branch_in[5]),
    .ina(net2pe[175:160]),
    .inb(net2pe[191:176]),
    .branch_out(branch_out[5]),
    .out0(pe2net[175:160]),
    .out1(pe2net[191:176])
  );


  pe
  pe6
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[139:132]),
    .branch_in(branch_in[6]),
    .ina(net2pe[207:192]),
    .inb(net2pe[223:208]),
    .branch_out(branch_out[6]),
    .out0(pe2net[207:192]),
    .out1(pe2net[223:208])
  );


  pe
  pe7
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[161:154]),
    .branch_in(branch_in[7]),
    .ina(net2pe[239:224]),
    .inb(net2pe[255:240]),
    .branch_out(branch_out[7]),
    .out0(pe2net[239:224]),
    .out1(pe2net[255:240])
  );


  pe
  pe8
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[183:176]),
    .branch_in(branch_in[8]),
    .ina(net2pe[271:256]),
    .inb(net2pe[287:272]),
    .branch_out(branch_out[8]),
    .out0(pe2net[271:256]),
    .out1(pe2net[287:272])
  );


  pe
  pe9
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[205:198]),
    .branch_in(branch_in[9]),
    .ina(net2pe[303:288]),
    .inb(net2pe[319:304]),
    .branch_out(branch_out[9]),
    .out0(pe2net[303:288]),
    .out1(pe2net[319:304])
  );


  pe
  pe10
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[227:220]),
    .branch_in(branch_in[10]),
    .ina(net2pe[335:320]),
    .inb(net2pe[351:336]),
    .branch_out(branch_out[10]),
    .out0(pe2net[335:320]),
    .out1(pe2net[351:336])
  );


  pe
  pe11
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[249:242]),
    .branch_in(branch_in[11]),
    .ina(net2pe[367:352]),
    .inb(net2pe[383:368]),
    .branch_out(branch_out[11]),
    .out0(pe2net[367:352]),
    .out1(pe2net[383:368])
  );


  pe
  pe12
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[271:264]),
    .branch_in(branch_in[12]),
    .ina(net2pe[399:384]),
    .inb(net2pe[415:400]),
    .branch_out(branch_out[12]),
    .out0(pe2net[399:384]),
    .out1(pe2net[415:400])
  );


  pe
  pe13
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[293:286]),
    .branch_in(branch_in[13]),
    .ina(net2pe[431:416]),
    .inb(net2pe[447:432]),
    .branch_out(branch_out[13]),
    .out0(pe2net[431:416]),
    .out1(pe2net[447:432])
  );


  pe
  pe14
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[315:308]),
    .branch_in(branch_in[14]),
    .ina(net2pe[463:448]),
    .inb(net2pe[479:464]),
    .branch_out(branch_out[14]),
    .out0(pe2net[463:448]),
    .out1(pe2net[479:464])
  );


  pe
  pe15
  (
    .clk(clk),
    .rst(rst),
    .en(stop_exec_out),
    .conf(conf[337:330]),
    .branch_in(branch_in[15]),
    .ina(net2pe[495:480]),
    .inb(net2pe[511:496]),
    .branch_out(branch_out[15]),
    .out0(pe2net[495:480]),
    .out1(pe2net[511:496])
  );


  cross32x32
  #(
    .WIDTH(16)
  )
  net
  (
    .in0(pe2net[15:0]),
    .in1(pe2net[31:16]),
    .in2(pe2net[47:32]),
    .in3(pe2net[63:48]),
    .in4(pe2net[79:64]),
    .in5(pe2net[95:80]),
    .in6(pe2net[111:96]),
    .in7(pe2net[127:112]),
    .in8(pe2net[143:128]),
    .in9(pe2net[159:144]),
    .in10(pe2net[175:160]),
    .in11(pe2net[191:176]),
    .in12(pe2net[207:192]),
    .in13(pe2net[223:208]),
    .in14(pe2net[239:224]),
    .in15(pe2net[255:240]),
    .in16(pe2net[271:256]),
    .in17(pe2net[287:272]),
    .in18(pe2net[303:288]),
    .in19(pe2net[319:304]),
    .in20(pe2net[335:320]),
    .in21(pe2net[351:336]),
    .in22(pe2net[367:352]),
    .in23(pe2net[383:368]),
    .in24(pe2net[399:384]),
    .in25(pe2net[415:400]),
    .in26(pe2net[431:416]),
    .in27(pe2net[447:432]),
    .in28(pe2net[463:448]),
    .in29(pe2net[479:464]),
    .in30(pe2net[495:480]),
    .in31(pe2net[511:496]),
    .s(conf_net),
    .out0(net2pe[15:0]),
    .out1(net2pe[31:16]),
    .out2(net2pe[47:32]),
    .out3(net2pe[63:48]),
    .out4(net2pe[79:64]),
    .out5(net2pe[95:80]),
    .out6(net2pe[111:96]),
    .out7(net2pe[127:112]),
    .out8(net2pe[143:128]),
    .out9(net2pe[159:144]),
    .out10(net2pe[175:160]),
    .out11(net2pe[191:176]),
    .out12(net2pe[207:192]),
    .out13(net2pe[223:208]),
    .out14(net2pe[239:224]),
    .out15(net2pe[255:240]),
    .out16(net2pe[271:256]),
    .out17(net2pe[287:272]),
    .out18(net2pe[303:288]),
    .out19(net2pe[319:304]),
    .out20(net2pe[335:320]),
    .out21(net2pe[351:336]),
    .out22(net2pe[367:352]),
    .out23(net2pe[383:368]),
    .out24(net2pe[399:384]),
    .out25(net2pe[415:400]),
    .out26(net2pe[431:416]),
    .out27(net2pe[447:432]),
    .out28(net2pe[463:448]),
    .out29(net2pe[479:464]),
    .out30(net2pe[495:480]),
    .out31(net2pe[511:496])
  );


endmodule
