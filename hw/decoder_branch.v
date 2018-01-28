
module decoder_branch
(
  input [352-1:0] conf,
  output [16-1:0] branch_set,
  output [16-1:0] merge_set,
  output [64-1:0] branch_net_conf
);

  localparam BEQ = 11;
  localparam BNE = 12;
  localparam MERGE = 15;
  assign branch_set[0] = ((conf[3:0] == BEQ) || (conf[3:0] == BNE))? 1'b1 : 1'b0;
  assign branch_set[1] = ((conf[25:22] == BEQ) || (conf[25:22] == BNE))? 1'b1 : 1'b0;
  assign branch_set[2] = ((conf[47:44] == BEQ) || (conf[47:44] == BNE))? 1'b1 : 1'b0;
  assign branch_set[3] = ((conf[69:66] == BEQ) || (conf[69:66] == BNE))? 1'b1 : 1'b0;
  assign branch_set[4] = ((conf[91:88] == BEQ) || (conf[91:88] == BNE))? 1'b1 : 1'b0;
  assign branch_set[5] = ((conf[113:110] == BEQ) || (conf[113:110] == BNE))? 1'b1 : 1'b0;
  assign branch_set[6] = ((conf[135:132] == BEQ) || (conf[135:132] == BNE))? 1'b1 : 1'b0;
  assign branch_set[7] = ((conf[157:154] == BEQ) || (conf[157:154] == BNE))? 1'b1 : 1'b0;
  assign branch_set[8] = ((conf[179:176] == BEQ) || (conf[179:176] == BNE))? 1'b1 : 1'b0;
  assign branch_set[9] = ((conf[201:198] == BEQ) || (conf[201:198] == BNE))? 1'b1 : 1'b0;
  assign branch_set[10] = ((conf[223:220] == BEQ) || (conf[223:220] == BNE))? 1'b1 : 1'b0;
  assign branch_set[11] = ((conf[245:242] == BEQ) || (conf[245:242] == BNE))? 1'b1 : 1'b0;
  assign branch_set[12] = ((conf[267:264] == BEQ) || (conf[267:264] == BNE))? 1'b1 : 1'b0;
  assign branch_set[13] = ((conf[289:286] == BEQ) || (conf[289:286] == BNE))? 1'b1 : 1'b0;
  assign branch_set[14] = ((conf[311:308] == BEQ) || (conf[311:308] == BNE))? 1'b1 : 1'b0;
  assign branch_set[15] = ((conf[333:330] == BEQ) || (conf[333:330] == BNE))? 1'b1 : 1'b0;
  assign merge_set[0] = (conf[3:0] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[1] = (conf[25:22] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[2] = (conf[47:44] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[3] = (conf[69:66] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[4] = (conf[91:88] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[5] = (conf[113:110] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[6] = (conf[135:132] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[7] = (conf[157:154] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[8] = (conf[179:176] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[9] = (conf[201:198] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[10] = (conf[223:220] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[11] = (conf[245:242] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[12] = (conf[267:264] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[13] = (conf[289:286] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[14] = (conf[311:308] == MERGE)? 1'b1 : 1'b0;
  assign merge_set[15] = (conf[333:330] == MERGE)? 1'b1 : 1'b0;
  assign branch_net_conf[3:0] = conf[11:8];
  assign branch_net_conf[7:4] = conf[33:30];
  assign branch_net_conf[11:8] = conf[55:52];
  assign branch_net_conf[15:12] = conf[77:74];
  assign branch_net_conf[19:16] = conf[99:96];
  assign branch_net_conf[23:20] = conf[121:118];
  assign branch_net_conf[27:24] = conf[143:140];
  assign branch_net_conf[31:28] = conf[165:162];
  assign branch_net_conf[35:32] = conf[187:184];
  assign branch_net_conf[39:36] = conf[209:206];
  assign branch_net_conf[43:40] = conf[231:228];
  assign branch_net_conf[47:44] = conf[253:250];
  assign branch_net_conf[51:48] = conf[275:272];
  assign branch_net_conf[55:52] = conf[297:294];
  assign branch_net_conf[59:56] = conf[319:316];
  assign branch_net_conf[63:60] = conf[341:338];

endmodule
