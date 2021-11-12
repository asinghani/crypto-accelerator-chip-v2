//SPDX-FileCopyrightText: 2021 Anish Singhani
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
module InstrDecoder(
  input  [15:0] io_instr,
  input  [15:0] io_imm,
  output [2:0]  io_decoded_rs1,
  output [2:0]  io_decoded_rs2,
  output [2:0]  io_decoded_rd,
  output [15:0] io_decoded_imm,
  output [1:0]  io_decoded_cc_mode,
  output [3:0]  io_decoded_alu_op,
  output        io_decoded_bra_mask_z,
  output        io_decoded_bra_mask_c,
  output        io_decoded_bra_mask_n,
  output        io_decoded_bra_mask_v,
  output        io_decoded_has_jump,
  output        io_decoded_has_stop,
  output        io_decoded_has_branch,
  output        io_decoded_has_mem,
  output        io_decoded_has_wb,
  output        io_decoded_has_imm
);
  wire [6:0] opcode = io_instr[15:9]; // @[InstrDecoder.scala 101:26]
  wire [1:0] _GEN_0 = 7'h0 == opcode ? 2'h0 : 2'h2; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32 InstrDecoder.scala 110:24]
  wire [1:0] _GEN_3 = 7'h58 == opcode ? 2'h0 : _GEN_0; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_4 = 7'h58 == opcode ? 4'h9 : 4'h0; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire [1:0] _GEN_7 = 7'h78 == opcode ? 2'h0 : _GEN_3; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_8 = 7'h78 == opcode ? 4'h6 : _GEN_4; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire [1:0] _GEN_11 = 7'h18 == opcode ? 2'h0 : _GEN_7; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_12 = 7'h18 == opcode ? 4'h0 : _GEN_8; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire [1:0] _GEN_16 = 7'h14 == opcode ? 2'h1 : _GEN_11; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_17 = 7'h14 == opcode ? 4'h0 : _GEN_12; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire [1:0] _GEN_22 = 7'h79 == opcode ? 2'h0 : _GEN_16; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_23 = 7'h79 == opcode ? 4'h6 : _GEN_17; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_25 = 7'h79 == opcode ? 1'h0 : 7'h14 == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire [1:0] _GEN_28 = 7'h54 == opcode ? 2'h2 : _GEN_22; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_29 = 7'h54 == opcode ? 4'h0 : _GEN_23; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_32 = 7'h54 == opcode ? 1'h0 : _GEN_25; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_33 = 7'h54 == opcode ? 1'h0 : 7'h79 == opcode | (7'h14 == opcode | (7'h18 == opcode | (7'h78 == opcode | (7'h58
     == opcode | 7'h0 == opcode)))); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_36 = 7'h1c == opcode ? 2'h2 : _GEN_28; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_37 = 7'h1c == opcode ? 4'h0 : _GEN_29; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_39 = 7'h1c == opcode ? 1'h0 : 7'h54 == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_41 = 7'h1c == opcode ? 1'h0 : _GEN_33; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_44 = 7'h5c == opcode ? 2'h2 : _GEN_36; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_45 = 7'h5c == opcode ? 4'h0 : _GEN_37; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_47 = 7'h5c == opcode ? 1'h0 : _GEN_39; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_50 = 7'h5c == opcode ? 1'h0 : 7'h1c == opcode | _GEN_32; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_51 = 7'h5c == opcode ? 1'h0 : _GEN_41; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_54 = 7'h61 == opcode ? 2'h0 : _GEN_44; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_55 = 7'h61 == opcode ? 4'h4 : _GEN_45; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_57 = 7'h61 == opcode ? 1'h0 : _GEN_47; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_58 = 7'h61 == opcode ? 1'h0 : 7'h5c == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_59 = 7'h61 == opcode ? 1'h0 : 7'h5c == opcode | _GEN_39; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_60 = 7'h61 == opcode ? 1'h0 : _GEN_50; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire [1:0] _GEN_64 = 7'h7c == opcode ? 2'h2 : _GEN_54; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_65 = 7'h7c == opcode ? 4'h0 : _GEN_55; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_67 = 7'h7c == opcode ? 1'h0 : _GEN_57; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_68 = 7'h7c == opcode ? 1'h0 : _GEN_58; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_70 = 7'h7c == opcode ? 1'h0 : _GEN_59; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_71 = 7'h7c == opcode ? 1'h0 : _GEN_60; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_72 = 7'h7c == opcode ? 1'h0 : 7'h61 == opcode | _GEN_51; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_75 = 7'h60 == opcode ? 2'h0 : _GEN_64; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_76 = 7'h60 == opcode ? 4'h4 : _GEN_65; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_78 = 7'h60 == opcode ? 1'h0 : _GEN_67; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_79 = 7'h60 == opcode ? 1'h0 : _GEN_68; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_80 = 7'h60 == opcode ? 1'h0 : 7'h7c == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_81 = 7'h60 == opcode ? 1'h0 : _GEN_70; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_82 = 7'h60 == opcode ? 1'h0 : _GEN_71; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_84 = 7'h60 == opcode ? 1'h0 : 7'h7c == opcode | (7'h61 == opcode | (7'h5c == opcode | (7'h1c == opcode | (7'h54
     == opcode | (7'h79 == opcode | (7'h14 == opcode | 7'h18 == opcode)))))); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_86 = 7'h29 == opcode ? 2'h0 : _GEN_75; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_87 = 7'h29 == opcode ? 4'h5 : _GEN_76; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_89 = 7'h29 == opcode ? 1'h0 : _GEN_78; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_90 = 7'h29 == opcode ? 1'h0 : _GEN_79; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_91 = 7'h29 == opcode ? 1'h0 : _GEN_80; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_92 = 7'h29 == opcode ? 1'h0 : _GEN_81; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_93 = 7'h29 == opcode ? 1'h0 : _GEN_82; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire [1:0] _GEN_97 = 7'h40 == opcode ? 2'h0 : _GEN_86; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_98 = 7'h40 == opcode ? 4'h2 : _GEN_87; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_100 = 7'h40 == opcode ? 1'h0 : _GEN_89; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_101 = 7'h40 == opcode ? 1'h0 : _GEN_90; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_102 = 7'h40 == opcode ? 1'h0 : _GEN_91; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_103 = 7'h40 == opcode ? 1'h0 : _GEN_92; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_104 = 7'h40 == opcode ? 1'h0 : _GEN_93; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_106 = 7'h40 == opcode ? 1'h0 : 7'h29 == opcode | _GEN_84; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_108 = 7'h71 == opcode ? 2'h0 : _GEN_97; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_109 = 7'h71 == opcode ? 4'h7 : _GEN_98; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_111 = 7'h71 == opcode ? 1'h0 : _GEN_100; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_112 = 7'h71 == opcode ? 1'h0 : _GEN_101; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_113 = 7'h71 == opcode ? 1'h0 : _GEN_102; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_114 = 7'h71 == opcode ? 1'h0 : _GEN_103; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_115 = 7'h71 == opcode ? 1'h0 : _GEN_104; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire [1:0] _GEN_119 = 7'h4c == opcode ? 2'h2 : _GEN_108; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_120 = 7'h4c == opcode ? 4'h0 : _GEN_109; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_122 = 7'h4c == opcode ? 1'h0 : _GEN_111; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_124 = 7'h4c == opcode ? 1'h0 : _GEN_112; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_125 = 7'h4c == opcode ? 1'h0 : _GEN_113; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_127 = 7'h4c == opcode ? 1'h0 : _GEN_115; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_128 = 7'h4c == opcode ? 1'h0 : 7'h71 == opcode | (7'h40 == opcode | (7'h29 == opcode | (7'h60 == opcode |
    _GEN_72))); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_131 = 7'h6c == opcode ? 2'h2 : _GEN_119; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_132 = 7'h6c == opcode ? 4'h0 : _GEN_120; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_134 = 7'h6c == opcode ? 1'h0 : _GEN_122; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_136 = 7'h6c == opcode ? 1'h0 : _GEN_124; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_137 = 7'h6c == opcode ? 1'h0 : _GEN_125; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_140 = 7'h6c == opcode ? 1'h0 : _GEN_127; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_141 = 7'h6c == opcode ? 1'h0 : _GEN_128; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire [1:0] _GEN_144 = 7'h50 == opcode ? 2'h0 : _GEN_131; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_145 = 7'h50 == opcode ? 4'h3 : _GEN_132; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_146 = 7'h50 == opcode ? 1'h0 : 7'h6c == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_147 = 7'h50 == opcode ? 1'h0 : _GEN_134; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_148 = 7'h50 == opcode ? 1'h0 : 7'h6c == opcode | 7'h4c == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_149 = 7'h50 == opcode ? 1'h0 : _GEN_136; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_150 = 7'h50 == opcode ? 1'h0 : _GEN_137; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_152 = 7'h50 == opcode ? 1'h0 : 7'h6c == opcode | (7'h4c == opcode | _GEN_114); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_153 = 7'h50 == opcode ? 1'h0 : _GEN_140; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_155 = 7'h50 == opcode ? 1'h0 : 7'h6c == opcode | (7'h4c == opcode | (7'h71 == opcode | _GEN_106)); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_157 = 7'h70 == opcode ? 2'h0 : _GEN_144; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_158 = 7'h70 == opcode ? 4'h7 : _GEN_145; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_159 = 7'h70 == opcode ? 1'h0 : _GEN_146; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_160 = 7'h70 == opcode ? 1'h0 : _GEN_147; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_161 = 7'h70 == opcode ? 1'h0 : _GEN_148; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_162 = 7'h70 == opcode ? 1'h0 : _GEN_149; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_163 = 7'h70 == opcode ? 1'h0 : _GEN_150; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_165 = 7'h70 == opcode ? 1'h0 : _GEN_152; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_166 = 7'h70 == opcode ? 1'h0 : _GEN_153; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_168 = 7'h70 == opcode ? 1'h0 : _GEN_155; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_170 = 7'h10 == opcode ? 2'h2 : _GEN_157; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_171 = 7'h10 == opcode ? 4'h0 : _GEN_158; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_172 = 7'h10 == opcode ? 1'h0 : _GEN_159; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_173 = 7'h10 == opcode ? 1'h0 : _GEN_160; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_174 = 7'h10 == opcode ? 1'h0 : _GEN_161; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_175 = 7'h10 == opcode ? 1'h0 : _GEN_162; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_176 = 7'h10 == opcode ? 1'h0 : _GEN_163; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_178 = 7'h10 == opcode ? 1'h0 : _GEN_165; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_179 = 7'h10 == opcode ? 1'h0 : _GEN_166; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_181 = 7'h10 == opcode ? 1'h0 : _GEN_168; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_183 = 7'h7f == opcode ? 2'h2 : _GEN_170; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_184 = 7'h7f == opcode ? 4'h0 : _GEN_171; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_185 = 7'h7f == opcode ? 1'h0 : _GEN_172; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_186 = 7'h7f == opcode ? 1'h0 : _GEN_173; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_187 = 7'h7f == opcode ? 1'h0 : _GEN_174; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_188 = 7'h7f == opcode ? 1'h0 : _GEN_175; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_189 = 7'h7f == opcode ? 1'h0 : _GEN_176; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_191 = 7'h7f == opcode ? 1'h0 : _GEN_178; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_192 = 7'h7f == opcode ? 1'h0 : _GEN_179; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_193 = 7'h7f == opcode ? 1'h0 : 7'h10 == opcode | (7'h70 == opcode | (7'h50 == opcode | _GEN_141)); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  wire  _GEN_194 = 7'h7f == opcode ? 1'h0 : _GEN_181; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_196 = 7'h48 == opcode ? 2'h0 : _GEN_183; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_197 = 7'h48 == opcode ? 4'h1 : _GEN_184; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_198 = 7'h48 == opcode ? 1'h0 : _GEN_185; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_199 = 7'h48 == opcode ? 1'h0 : _GEN_186; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_200 = 7'h48 == opcode ? 1'h0 : _GEN_187; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_201 = 7'h48 == opcode ? 1'h0 : _GEN_188; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_202 = 7'h48 == opcode ? 1'h0 : _GEN_189; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_203 = 7'h48 == opcode ? 1'h0 : 7'h7f == opcode; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 135:33]
  wire  _GEN_204 = 7'h48 == opcode ? 1'h0 : _GEN_191; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_205 = 7'h48 == opcode ? 1'h0 : _GEN_192; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_207 = 7'h48 == opcode ? 1'h0 : _GEN_194; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_209 = 7'h28 == opcode ? 2'h0 : _GEN_196; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_210 = 7'h28 == opcode ? 4'h5 : _GEN_197; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_211 = 7'h28 == opcode ? 1'h0 : _GEN_198; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_212 = 7'h28 == opcode ? 1'h0 : _GEN_199; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_213 = 7'h28 == opcode ? 1'h0 : _GEN_200; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_214 = 7'h28 == opcode ? 1'h0 : _GEN_201; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_215 = 7'h28 == opcode ? 1'h0 : _GEN_202; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_216 = 7'h28 == opcode ? 1'h0 : _GEN_203; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 135:33]
  wire  _GEN_217 = 7'h28 == opcode ? 1'h0 : _GEN_204; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_218 = 7'h28 == opcode ? 1'h0 : _GEN_205; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_220 = 7'h28 == opcode ? 1'h0 : _GEN_207; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  wire [1:0] _GEN_222 = 7'h8 == opcode ? 2'h0 : _GEN_209; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  wire [3:0] _GEN_223 = 7'h8 == opcode ? 4'h8 : _GEN_210; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  wire  _GEN_224 = 7'h8 == opcode ? 1'h0 : _GEN_211; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  wire  _GEN_225 = 7'h8 == opcode ? 1'h0 : _GEN_212; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  wire  _GEN_226 = 7'h8 == opcode ? 1'h0 : _GEN_213; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  wire  _GEN_227 = 7'h8 == opcode ? 1'h0 : _GEN_214; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  wire  _GEN_228 = 7'h8 == opcode ? 1'h0 : _GEN_215; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  wire  _GEN_229 = 7'h8 == opcode ? 1'h0 : _GEN_216; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 135:33]
  wire  _GEN_230 = 7'h8 == opcode ? 1'h0 : _GEN_217; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  wire  _GEN_231 = 7'h8 == opcode ? 1'h0 : _GEN_218; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  wire  _GEN_233 = 7'h8 == opcode ? 1'h0 : _GEN_220; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
  assign io_decoded_rs1 = io_instr[5:3]; // @[InstrDecoder.scala 106:31]
  assign io_decoded_rs2 = io_instr[2:0]; // @[InstrDecoder.scala 107:31]
  assign io_decoded_rd = io_instr[8:6]; // @[InstrDecoder.scala 105:30]
  assign io_decoded_imm = io_imm; // @[InstrDecoder.scala 104:20]
  assign io_decoded_cc_mode = 7'h64 == opcode ? 2'h2 : _GEN_222; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 126:32]
  assign io_decoded_alu_op = 7'h64 == opcode ? 4'h0 : _GEN_223; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 127:31]
  assign io_decoded_bra_mask_z = 7'h64 == opcode | _GEN_224; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 129:35]
  assign io_decoded_bra_mask_c = 7'h64 == opcode ? 1'h0 : _GEN_225; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 130:35]
  assign io_decoded_bra_mask_n = 7'h64 == opcode ? 1'h0 : _GEN_226; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 131:35]
  assign io_decoded_bra_mask_v = 7'h64 == opcode ? 1'h0 : _GEN_227; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 132:35]
  assign io_decoded_has_jump = 7'h64 == opcode ? 1'h0 : _GEN_228; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 134:33]
  assign io_decoded_has_stop = 7'h64 == opcode ? 1'h0 : _GEN_229; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 135:33]
  assign io_decoded_has_branch = 7'h64 == opcode | _GEN_230; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 136:35]
  assign io_decoded_has_mem = 7'h64 == opcode ? 1'h0 : _GEN_231; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 137:32]
  assign io_decoded_has_wb = 7'h64 == opcode ? 1'h0 : 7'h8 == opcode | (7'h28 == opcode | (7'h48 == opcode | _GEN_193)); // @[InstrDecoder.scala 125:41 InstrDecoder.scala 138:31]
  assign io_decoded_has_imm = 7'h64 == opcode | _GEN_233; // @[InstrDecoder.scala 125:41 InstrDecoder.scala 139:32]
endmodule
module ALU(
  input  [15:0] io_in1,
  input  [15:0] io_in2,
  input  [3:0]  io_op,
  output [15:0] io_out,
  output        io_cc_z,
  output        io_cc_c,
  output        io_cc_n,
  output        io_cc_v
);
  wire  _T_2 = 4'h0 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] in1 = {{1'd0}, io_in1}; // @[ALU.scala 28:19 ALU.scala 30:9]
  wire [16:0] in2 = {{1'd0}, io_in2}; // @[ALU.scala 29:19 ALU.scala 31:9]
  wire [16:0] _result_T_1 = in1 + in2; // @[ALU.scala 43:40]
  wire  _T_5 = 4'h1 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] _result_T_2 = in1 & in2; // @[ALU.scala 44:40]
  wire  _T_8 = 4'h2 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] _result_T_3 = ~in1; // @[ALU.scala 45:36]
  wire  _T_11 = 4'h3 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] _result_T_4 = in1 | in2; // @[ALU.scala 46:40]
  wire  _T_14 = 4'h4 == io_op; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_22 = {{15'd0}, in1}; // @[ALU.scala 47:40]
  wire [31:0] _result_T_6 = _GEN_22 << in2[3:0]; // @[ALU.scala 47:40]
  wire  _T_17 = 4'h5 == io_op; // @[Conditional.scala 37:30]
  wire [15:0] _result_T_8 = in1[15:0]; // @[ALU.scala 48:69]
  wire [15:0] _result_T_10 = in2[15:0]; // @[ALU.scala 48:91]
  wire  result_lo = $signed(_result_T_8) < $signed(_result_T_10); // @[ALU.scala 48:72]
  wire [15:0] _result_T_12 = {15'h0,result_lo}; // @[Cat.scala 30:58]
  wire  _T_20 = 4'h6 == io_op; // @[Conditional.scala 37:30]
  wire [15:0] _result_T_17 = $signed(_result_T_8) >>> in2[3:0]; // @[ALU.scala 49:77]
  wire  _T_23 = 4'h7 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] _result_T_20 = in1 >> in2[3:0]; // @[ALU.scala 50:40]
  wire  _T_26 = 4'h8 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] in1_minus_in2 = in1 - in2; // @[ALU.scala 37:26]
  wire  _T_29 = 4'h9 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] _result_T_21 = in1 ^ in2; // @[ALU.scala 52:40]
  wire [16:0] _GEN_0 = _T_29 ? _result_T_21 : 17'h0; // @[Conditional.scala 39:67 ALU.scala 52:33 ALU.scala 39:12]
  wire [16:0] _GEN_1 = _T_26 ? in1_minus_in2 : _GEN_0; // @[Conditional.scala 39:67 ALU.scala 51:33]
  wire [16:0] _GEN_2 = _T_23 ? _result_T_20 : _GEN_1; // @[Conditional.scala 39:67 ALU.scala 50:33]
  wire [16:0] _GEN_3 = _T_20 ? {{1'd0}, _result_T_17} : _GEN_2; // @[Conditional.scala 39:67 ALU.scala 49:33]
  wire [16:0] _GEN_4 = _T_17 ? {{1'd0}, _result_T_12} : _GEN_3; // @[Conditional.scala 39:67 ALU.scala 48:33]
  wire [31:0] _GEN_5 = _T_14 ? _result_T_6 : {{15'd0}, _GEN_4}; // @[Conditional.scala 39:67 ALU.scala 47:33]
  wire [31:0] _GEN_6 = _T_11 ? {{15'd0}, _result_T_4} : _GEN_5; // @[Conditional.scala 39:67 ALU.scala 46:33]
  wire [31:0] _GEN_7 = _T_8 ? {{15'd0}, _result_T_3} : _GEN_6; // @[Conditional.scala 39:67 ALU.scala 45:33]
  wire [31:0] _GEN_8 = _T_5 ? {{15'd0}, _result_T_2} : _GEN_7; // @[Conditional.scala 39:67 ALU.scala 44:33]
  wire [31:0] _GEN_9 = _T_2 ? {{15'd0}, _result_T_1} : _GEN_8; // @[Conditional.scala 40:58 ALU.scala 43:33]
  wire [16:0] result = _GEN_9[16:0]; // @[ALU.scala 33:22]
  wire  _io_cc_z_T = io_out == 16'h0; // @[ALU.scala 57:28]
  wire  _io_cc_v_T_4 = ~io_out[15]; // @[ALU.scala 60:43]
  wire  _io_cc_v_T_7 = ~in1[15]; // @[ALU.scala 61:12]
  wire  _io_cc_v_T_9 = ~in2[15]; // @[ALU.scala 61:24]
  wire  _io_cc_v_T_12 = ~in1[15] & ~in2[15] & io_out[15]; // @[ALU.scala 61:33]
  wire  _io_cc_c_T_1 = in2 >= in1; // @[ALU.scala 65:25]
  wire  _io_cc_v_T_17 = in1[15] & _io_cc_v_T_9; // @[ALU.scala 67:29]
  wire  _io_cc_v_T_24 = _io_cc_v_T_7 & in2[15]; // @[ALU.scala 68:21]
  wire  _io_cc_v_T_26 = _io_cc_v_T_7 & in2[15] & io_out[15]; // @[ALU.scala 68:32]
  wire  _io_cc_v_T_40 = _io_cc_v_T_24 & in1_minus_in2[15]; // @[ALU.scala 75:32]
  wire  _GEN_10 = io_op == 4'h5 ? in1_minus_in2 == 17'h0 : _io_cc_z_T; // @[ALU.scala 70:37 ALU.scala 71:17 ALU.scala 78:17]
  wire  _GEN_11 = io_op == 4'h5 & _io_cc_c_T_1; // @[ALU.scala 70:37 ALU.scala 72:17 ALU.scala 79:17]
  wire  _GEN_12 = io_op == 4'h5 ? in1_minus_in2[15] : result[15]; // @[ALU.scala 70:37 ALU.scala 73:17 ALU.scala 80:17]
  wire  _GEN_13 = io_op == 4'h5 & (_io_cc_v_T_17 & ~in1_minus_in2[15] | _io_cc_v_T_40); // @[ALU.scala 70:37 ALU.scala 74:17 ALU.scala 81:17]
  wire  _GEN_14 = io_op == 4'h8 ? _io_cc_z_T : _GEN_10; // @[ALU.scala 63:37 ALU.scala 64:17]
  wire  _GEN_15 = io_op == 4'h8 ? in2 >= in1 : _GEN_11; // @[ALU.scala 63:37 ALU.scala 65:17]
  wire  _GEN_16 = io_op == 4'h8 ? result[15] : _GEN_12; // @[ALU.scala 63:37 ALU.scala 66:17]
  wire  _GEN_17 = io_op == 4'h8 ? in1[15] & _io_cc_v_T_9 & _io_cc_v_T_4 | _io_cc_v_T_26 : _GEN_13; // @[ALU.scala 63:37 ALU.scala 67:17]
  assign io_out = result[15:0]; // @[ALU.scala 34:21]
  assign io_cc_z = io_op == 4'h0 ? io_out == 16'h0 : _GEN_14; // @[ALU.scala 56:32 ALU.scala 57:17]
  assign io_cc_c = io_op == 4'h0 ? result[16] : _GEN_15; // @[ALU.scala 56:32 ALU.scala 58:17]
  assign io_cc_n = io_op == 4'h0 ? result[15] : _GEN_16; // @[ALU.scala 56:32 ALU.scala 59:17]
  assign io_cc_v = io_op == 4'h0 ? in1[15] & in2[15] & ~io_out[15] | _io_cc_v_T_12 : _GEN_17; // @[ALU.scala 56:32 ALU.scala 60:17]
endmodule
module RegFile(
  input         clock,
  input  [2:0]  io_rs1,
  input  [2:0]  io_rs2,
  output [15:0] io_rs1_dat,
  output [15:0] io_rs2_dat,
  input  [2:0]  io_rd,
  input  [15:0] io_rd_dat,
  input         io_rd_en,
  input         io_cc_in_z,
  input         io_cc_in_c,
  input         io_cc_in_n,
  input         io_cc_in_v,
  input         io_cc_en,
  output        io_cc_out_z,
  output        io_cc_out_c,
  output        io_cc_out_n,
  output        io_cc_out_v
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] rf_0; // @[RegFile.scala 26:17]
  reg [15:0] rf_1; // @[RegFile.scala 26:17]
  reg [15:0] rf_2; // @[RegFile.scala 26:17]
  reg [15:0] rf_3; // @[RegFile.scala 26:17]
  reg [15:0] rf_4; // @[RegFile.scala 26:17]
  reg [15:0] rf_5; // @[RegFile.scala 26:17]
  reg [15:0] rf_6; // @[RegFile.scala 26:17]
  reg [15:0] rf_7; // @[RegFile.scala 26:17]
  wire [15:0] _GEN_1 = 3'h1 == io_rs1 ? rf_1 : rf_0; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_2 = 3'h2 == io_rs1 ? rf_2 : _GEN_1; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_3 = 3'h3 == io_rs1 ? rf_3 : _GEN_2; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_4 = 3'h4 == io_rs1 ? rf_4 : _GEN_3; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_5 = 3'h5 == io_rs1 ? rf_5 : _GEN_4; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_6 = 3'h6 == io_rs1 ? rf_6 : _GEN_5; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_7 = 3'h7 == io_rs1 ? rf_7 : _GEN_6; // @[RegFile.scala 29:22 RegFile.scala 29:22]
  wire [15:0] _GEN_9 = 3'h1 == io_rs2 ? rf_1 : rf_0; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_10 = 3'h2 == io_rs2 ? rf_2 : _GEN_9; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_11 = 3'h3 == io_rs2 ? rf_3 : _GEN_10; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_12 = 3'h4 == io_rs2 ? rf_4 : _GEN_11; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_13 = 3'h5 == io_rs2 ? rf_5 : _GEN_12; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_14 = 3'h6 == io_rs2 ? rf_6 : _GEN_13; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  wire [15:0] _GEN_15 = 3'h7 == io_rs2 ? rf_7 : _GEN_14; // @[RegFile.scala 30:22 RegFile.scala 30:22]
  reg  cc_reg_z; // @[RegFile.scala 36:21]
  reg  cc_reg_c; // @[RegFile.scala 36:21]
  reg  cc_reg_n; // @[RegFile.scala 36:21]
  reg  cc_reg_v; // @[RegFile.scala 36:21]
  assign io_rs1_dat = io_rs1 == 3'h0 ? 16'h0 : _GEN_7; // @[RegFile.scala 29:22]
  assign io_rs2_dat = io_rs2 == 3'h0 ? 16'h0 : _GEN_15; // @[RegFile.scala 30:22]
  assign io_cc_out_z = cc_reg_z; // @[RegFile.scala 37:15]
  assign io_cc_out_c = cc_reg_c; // @[RegFile.scala 37:15]
  assign io_cc_out_n = cc_reg_n; // @[RegFile.scala 37:15]
  assign io_cc_out_v = cc_reg_v; // @[RegFile.scala 37:15]
  always @(posedge clock) begin
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h0 == io_rd) begin // @[RegFile.scala 33:33]
        rf_0 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h1 == io_rd) begin // @[RegFile.scala 33:33]
        rf_1 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h2 == io_rd) begin // @[RegFile.scala 33:33]
        rf_2 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h3 == io_rd) begin // @[RegFile.scala 33:33]
        rf_3 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h4 == io_rd) begin // @[RegFile.scala 33:33]
        rf_4 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h5 == io_rd) begin // @[RegFile.scala 33:33]
        rf_5 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h6 == io_rd) begin // @[RegFile.scala 33:33]
        rf_6 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_rd_en) begin // @[RegFile.scala 33:21]
      if (3'h7 == io_rd) begin // @[RegFile.scala 33:33]
        rf_7 <= io_rd_dat; // @[RegFile.scala 33:33]
      end
    end
    if (io_cc_en) begin // @[RegFile.scala 39:21]
      cc_reg_z <= io_cc_in_z;
    end
    if (io_cc_en) begin // @[RegFile.scala 39:21]
      cc_reg_c <= io_cc_in_c;
    end
    if (io_cc_en) begin // @[RegFile.scala 39:21]
      cc_reg_n <= io_cc_in_n;
    end
    if (io_cc_en) begin // @[RegFile.scala 39:21]
      cc_reg_v <= io_cc_in_v;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rf_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  rf_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  rf_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  rf_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  rf_4 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  rf_5 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  rf_6 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  rf_7 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  cc_reg_z = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  cc_reg_c = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  cc_reg_n = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cc_reg_v = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input         clock,
  input         reset,
  output [15:0] io_instr_imm,
  output        io_instr_bra_mask_z,
  output        io_instr_bra_mask_c,
  output        io_instr_bra_mask_n,
  output        io_instr_bra_mask_v,
  output        io_instr_has_jump,
  output        io_instr_has_stop,
  output        io_instr_has_branch,
  output        io_instr_has_mem,
  output        io_instr_has_wb,
  output        io_instr_has_imm,
  input         io_issue_if,
  output        io_if_done,
  input         io_issue_mem,
  input         io_mem_we,
  output        io_mem_done,
  input  [2:0]  io_state,
  output [15:0] io_ibus_addr,
  input  [31:0] io_ibus_data_rd,
  output        io_ibus_stb,
  input         io_ibus_ack,
  output [15:0] io_dbus_addr,
  output        io_dbus_we,
  input  [15:0] io_dbus_data_rd,
  output [15:0] io_dbus_data_wr,
  output        io_dbus_stb,
  input         io_dbus_ack,
  input  [15:0] io_restart_pc,
  input         io_restart
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] decoder_io_instr; // @[Datapath.scala 70:25]
  wire [15:0] decoder_io_imm; // @[Datapath.scala 70:25]
  wire [2:0] decoder_io_decoded_rs1; // @[Datapath.scala 70:25]
  wire [2:0] decoder_io_decoded_rs2; // @[Datapath.scala 70:25]
  wire [2:0] decoder_io_decoded_rd; // @[Datapath.scala 70:25]
  wire [15:0] decoder_io_decoded_imm; // @[Datapath.scala 70:25]
  wire [1:0] decoder_io_decoded_cc_mode; // @[Datapath.scala 70:25]
  wire [3:0] decoder_io_decoded_alu_op; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_bra_mask_z; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_bra_mask_c; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_bra_mask_n; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_bra_mask_v; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_jump; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_stop; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_branch; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_mem; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_wb; // @[Datapath.scala 70:25]
  wire  decoder_io_decoded_has_imm; // @[Datapath.scala 70:25]
  wire [15:0] alu_io_in1; // @[Datapath.scala 79:21]
  wire [15:0] alu_io_in2; // @[Datapath.scala 79:21]
  wire [3:0] alu_io_op; // @[Datapath.scala 79:21]
  wire [15:0] alu_io_out; // @[Datapath.scala 79:21]
  wire  alu_io_cc_z; // @[Datapath.scala 79:21]
  wire  alu_io_cc_c; // @[Datapath.scala 79:21]
  wire  alu_io_cc_n; // @[Datapath.scala 79:21]
  wire  alu_io_cc_v; // @[Datapath.scala 79:21]
  wire  regfile_clock; // @[Datapath.scala 100:25]
  wire [2:0] regfile_io_rs1; // @[Datapath.scala 100:25]
  wire [2:0] regfile_io_rs2; // @[Datapath.scala 100:25]
  wire [15:0] regfile_io_rs1_dat; // @[Datapath.scala 100:25]
  wire [15:0] regfile_io_rs2_dat; // @[Datapath.scala 100:25]
  wire [2:0] regfile_io_rd; // @[Datapath.scala 100:25]
  wire [15:0] regfile_io_rd_dat; // @[Datapath.scala 100:25]
  wire  regfile_io_rd_en; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_in_z; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_in_c; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_in_n; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_in_v; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_en; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_out_z; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_out_c; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_out_n; // @[Datapath.scala 100:25]
  wire  regfile_io_cc_out_v; // @[Datapath.scala 100:25]
  reg [15:0] pc_reg; // @[Datapath.scala 35:25]
  reg [31:0] ifetch_reg; // @[Datapath.scala 36:29]
  reg [2:0] instr_reg_rd; // @[Datapath.scala 37:28]
  reg [15:0] instr_reg_imm; // @[Datapath.scala 37:28]
  reg [1:0] instr_reg_cc_mode; // @[Datapath.scala 37:28]
  reg [3:0] instr_reg_alu_op; // @[Datapath.scala 37:28]
  reg  instr_reg_bra_mask_z; // @[Datapath.scala 37:28]
  reg  instr_reg_bra_mask_c; // @[Datapath.scala 37:28]
  reg  instr_reg_bra_mask_n; // @[Datapath.scala 37:28]
  reg  instr_reg_bra_mask_v; // @[Datapath.scala 37:28]
  reg  instr_reg_has_jump; // @[Datapath.scala 37:28]
  reg  instr_reg_has_stop; // @[Datapath.scala 37:28]
  reg  instr_reg_has_branch; // @[Datapath.scala 37:28]
  reg  instr_reg_has_mem; // @[Datapath.scala 37:28]
  reg  instr_reg_has_wb; // @[Datapath.scala 37:28]
  reg  instr_reg_has_imm; // @[Datapath.scala 37:28]
  reg [15:0] rs1_reg; // @[Datapath.scala 38:26]
  reg [15:0] rs2_reg; // @[Datapath.scala 39:26]
  reg  cc_reg_z; // @[Datapath.scala 40:25]
  reg  cc_reg_c; // @[Datapath.scala 40:25]
  reg  cc_reg_n; // @[Datapath.scala 40:25]
  reg  cc_reg_v; // @[Datapath.scala 40:25]
  reg [15:0] result_reg; // @[Datapath.scala 42:29]
  reg  result_cc_reg_z; // @[Datapath.scala 43:32]
  reg  result_cc_reg_c; // @[Datapath.scala 43:32]
  reg  result_cc_reg_n; // @[Datapath.scala 43:32]
  reg  result_cc_reg_v; // @[Datapath.scala 43:32]
  reg  REG; // @[Datapath.scala 51:23]
  wire  _T_1 = io_state == 3'h3; // @[Datapath.scala 54:27]
  wire [2:0] _pc_reg_T = io_instr_has_imm ? 3'h4 : 3'h2; // @[Datapath.scala 55:31]
  wire [15:0] _GEN_40 = {{13'd0}, _pc_reg_T}; // @[Datapath.scala 55:26]
  wire [15:0] _pc_reg_T_2 = pc_reg + _GEN_40; // @[Datapath.scala 55:26]
  wire [3:0] _take_branch_T = {io_instr_bra_mask_z,io_instr_bra_mask_c,io_instr_bra_mask_n,io_instr_bra_mask_v}; // @[Datapath.scala 57:52]
  wire [3:0] _take_branch_T_1 = {cc_reg_z,cc_reg_c,cc_reg_n,cc_reg_v}; // @[Datapath.scala 57:70]
  wire [3:0] _take_branch_T_2 = _take_branch_T & _take_branch_T_1; // @[Datapath.scala 57:55]
  wire  take_branch = |_take_branch_T_2; // @[Datapath.scala 57:77]
  wire  _T_4 = io_state == 3'h2; // @[Datapath.scala 74:20]
  InstrDecoder decoder ( // @[Datapath.scala 70:25]
    .io_instr(decoder_io_instr),
    .io_imm(decoder_io_imm),
    .io_decoded_rs1(decoder_io_decoded_rs1),
    .io_decoded_rs2(decoder_io_decoded_rs2),
    .io_decoded_rd(decoder_io_decoded_rd),
    .io_decoded_imm(decoder_io_decoded_imm),
    .io_decoded_cc_mode(decoder_io_decoded_cc_mode),
    .io_decoded_alu_op(decoder_io_decoded_alu_op),
    .io_decoded_bra_mask_z(decoder_io_decoded_bra_mask_z),
    .io_decoded_bra_mask_c(decoder_io_decoded_bra_mask_c),
    .io_decoded_bra_mask_n(decoder_io_decoded_bra_mask_n),
    .io_decoded_bra_mask_v(decoder_io_decoded_bra_mask_v),
    .io_decoded_has_jump(decoder_io_decoded_has_jump),
    .io_decoded_has_stop(decoder_io_decoded_has_stop),
    .io_decoded_has_branch(decoder_io_decoded_has_branch),
    .io_decoded_has_mem(decoder_io_decoded_has_mem),
    .io_decoded_has_wb(decoder_io_decoded_has_wb),
    .io_decoded_has_imm(decoder_io_decoded_has_imm)
  );
  ALU alu ( // @[Datapath.scala 79:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_op(alu_io_op),
    .io_out(alu_io_out),
    .io_cc_z(alu_io_cc_z),
    .io_cc_c(alu_io_cc_c),
    .io_cc_n(alu_io_cc_n),
    .io_cc_v(alu_io_cc_v)
  );
  RegFile regfile ( // @[Datapath.scala 100:25]
    .clock(regfile_clock),
    .io_rs1(regfile_io_rs1),
    .io_rs2(regfile_io_rs2),
    .io_rs1_dat(regfile_io_rs1_dat),
    .io_rs2_dat(regfile_io_rs2_dat),
    .io_rd(regfile_io_rd),
    .io_rd_dat(regfile_io_rd_dat),
    .io_rd_en(regfile_io_rd_en),
    .io_cc_in_z(regfile_io_cc_in_z),
    .io_cc_in_c(regfile_io_cc_in_c),
    .io_cc_in_n(regfile_io_cc_in_n),
    .io_cc_in_v(regfile_io_cc_in_v),
    .io_cc_en(regfile_io_cc_en),
    .io_cc_out_z(regfile_io_cc_out_z),
    .io_cc_out_c(regfile_io_cc_out_c),
    .io_cc_out_n(regfile_io_cc_out_n),
    .io_cc_out_v(regfile_io_cc_out_v)
  );
  assign io_instr_imm = instr_reg_imm; // @[Datapath.scala 45:14]
  assign io_instr_bra_mask_z = instr_reg_bra_mask_z; // @[Datapath.scala 45:14]
  assign io_instr_bra_mask_c = instr_reg_bra_mask_c; // @[Datapath.scala 45:14]
  assign io_instr_bra_mask_n = instr_reg_bra_mask_n; // @[Datapath.scala 45:14]
  assign io_instr_bra_mask_v = instr_reg_bra_mask_v; // @[Datapath.scala 45:14]
  assign io_instr_has_jump = instr_reg_has_jump; // @[Datapath.scala 45:14]
  assign io_instr_has_stop = instr_reg_has_stop; // @[Datapath.scala 45:14]
  assign io_instr_has_branch = instr_reg_has_branch; // @[Datapath.scala 45:14]
  assign io_instr_has_mem = instr_reg_has_mem; // @[Datapath.scala 45:14]
  assign io_instr_has_wb = instr_reg_has_wb; // @[Datapath.scala 45:14]
  assign io_instr_has_imm = instr_reg_has_imm; // @[Datapath.scala 45:14]
  assign io_if_done = io_ibus_ack; // @[Datapath.scala 66:16]
  assign io_mem_done = io_dbus_ack; // @[Datapath.scala 93:17]
  assign io_ibus_addr = pc_reg; // @[Datapath.scala 64:18]
  assign io_ibus_stb = io_issue_if; // @[Datapath.scala 65:17]
  assign io_dbus_addr = result_reg; // @[Datapath.scala 89:18]
  assign io_dbus_we = io_mem_we; // @[Datapath.scala 90:16]
  assign io_dbus_data_wr = rs2_reg; // @[Datapath.scala 91:21]
  assign io_dbus_stb = io_issue_mem; // @[Datapath.scala 92:17]
  assign decoder_io_instr = ifetch_reg[31:16]; // @[Datapath.scala 71:35]
  assign decoder_io_imm = ifetch_reg[15:0]; // @[Datapath.scala 72:33]
  assign alu_io_in1 = rs1_reg; // @[Datapath.scala 80:16]
  assign alu_io_in2 = instr_reg_has_imm ? instr_reg_imm : rs2_reg; // @[Datapath.scala 81:22]
  assign alu_io_op = instr_reg_alu_op; // @[Datapath.scala 82:15]
  assign regfile_clock = clock;
  assign regfile_io_rs1 = decoder_io_decoded_rs1; // @[Datapath.scala 101:20]
  assign regfile_io_rs2 = decoder_io_decoded_rs2; // @[Datapath.scala 102:20]
  assign regfile_io_rd = instr_reg_rd; // @[Datapath.scala 103:19]
  assign regfile_io_rd_dat = result_reg; // @[Datapath.scala 113:23]
  assign regfile_io_rd_en = io_state == 3'h6; // @[Datapath.scala 121:20]
  assign regfile_io_cc_in_z = instr_reg_cc_mode == 2'h0 ? result_cc_reg_z : result_reg == 16'h0; // @[Datapath.scala 126:45 Datapath.scala 127:28 Datapath.scala 132:28]
  assign regfile_io_cc_in_c = instr_reg_cc_mode == 2'h0 & result_cc_reg_c; // @[Datapath.scala 126:45 Datapath.scala 128:28 Datapath.scala 133:28]
  assign regfile_io_cc_in_n = instr_reg_cc_mode == 2'h0 ? result_cc_reg_n : result_reg[15]; // @[Datapath.scala 126:45 Datapath.scala 129:28 Datapath.scala 134:28]
  assign regfile_io_cc_in_v = instr_reg_cc_mode == 2'h0 & result_cc_reg_v; // @[Datapath.scala 126:45 Datapath.scala 130:28 Datapath.scala 135:28]
  assign regfile_io_cc_en = io_state == 3'h6 & instr_reg_cc_mode != 2'h2; // @[Datapath.scala 121:30 Datapath.scala 123:26 Datapath.scala 106:22]
  always @(posedge clock) begin
    if (reset) begin // @[Datapath.scala 35:25]
      pc_reg <= 16'h0; // @[Datapath.scala 35:25]
    end else if (io_restart) begin // @[Datapath.scala 48:23]
      if (~REG) begin // @[Datapath.scala 51:37]
        pc_reg <= io_restart_pc; // @[Datapath.scala 52:20]
      end
    end else if (io_state == 3'h3) begin // @[Datapath.scala 54:39]
      if (io_instr_has_jump | io_instr_has_branch & take_branch) begin // @[Datapath.scala 58:74]
        pc_reg <= io_instr_imm; // @[Datapath.scala 59:20]
      end else begin
        pc_reg <= _pc_reg_T_2; // @[Datapath.scala 55:16]
      end
    end
    if (reset) begin // @[Datapath.scala 36:29]
      ifetch_reg <= 32'h0; // @[Datapath.scala 36:29]
    end else if (io_ibus_ack) begin // @[Datapath.scala 67:24]
      ifetch_reg <= io_ibus_data_rd; // @[Datapath.scala 67:37]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_rd <= 3'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_rd <= decoder_io_decoded_rd; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_imm <= 16'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_imm <= decoder_io_decoded_imm; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_cc_mode <= 2'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_cc_mode <= decoder_io_decoded_cc_mode; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_alu_op <= 4'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_alu_op <= decoder_io_decoded_alu_op; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_bra_mask_z <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_bra_mask_z <= decoder_io_decoded_bra_mask_z; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_bra_mask_c <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_bra_mask_c <= decoder_io_decoded_bra_mask_c; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_bra_mask_n <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_bra_mask_n <= decoder_io_decoded_bra_mask_n; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_bra_mask_v <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_bra_mask_v <= decoder_io_decoded_bra_mask_v; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_jump <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_jump <= decoder_io_decoded_has_jump; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_stop <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_stop <= decoder_io_decoded_has_stop; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_branch <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_branch <= decoder_io_decoded_has_branch; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_mem <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_mem <= decoder_io_decoded_has_mem; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_wb <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_wb <= decoder_io_decoded_has_wb; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 37:28]
      instr_reg_has_imm <= 1'h0; // @[Datapath.scala 37:28]
    end else if (io_state == 3'h2) begin // @[Datapath.scala 74:34]
      instr_reg_has_imm <= decoder_io_decoded_has_imm; // @[Datapath.scala 75:19]
    end
    if (reset) begin // @[Datapath.scala 38:26]
      rs1_reg <= 16'h0; // @[Datapath.scala 38:26]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      rs1_reg <= regfile_io_rs1_dat; // @[Datapath.scala 116:17]
    end
    if (reset) begin // @[Datapath.scala 39:26]
      rs2_reg <= 16'h0; // @[Datapath.scala 39:26]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      rs2_reg <= regfile_io_rs2_dat; // @[Datapath.scala 117:17]
    end
    if (reset) begin // @[Datapath.scala 40:25]
      cc_reg_z <= 1'h0; // @[Datapath.scala 40:25]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      cc_reg_z <= regfile_io_cc_out_z; // @[Datapath.scala 118:16]
    end
    if (reset) begin // @[Datapath.scala 40:25]
      cc_reg_c <= 1'h0; // @[Datapath.scala 40:25]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      cc_reg_c <= regfile_io_cc_out_c; // @[Datapath.scala 118:16]
    end
    if (reset) begin // @[Datapath.scala 40:25]
      cc_reg_n <= 1'h0; // @[Datapath.scala 40:25]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      cc_reg_n <= regfile_io_cc_out_n; // @[Datapath.scala 118:16]
    end
    if (reset) begin // @[Datapath.scala 40:25]
      cc_reg_v <= 1'h0; // @[Datapath.scala 40:25]
    end else if (_T_4) begin // @[Datapath.scala 115:34]
      cc_reg_v <= regfile_io_cc_out_v; // @[Datapath.scala 118:16]
    end
    if (reset) begin // @[Datapath.scala 42:29]
      result_reg <= 16'h0; // @[Datapath.scala 42:29]
    end else if (io_state == 3'h5 & ~io_mem_we & io_dbus_ack) begin // @[Datapath.scala 94:65]
      result_reg <= io_dbus_data_rd; // @[Datapath.scala 95:20]
    end else if (_T_1) begin // @[Datapath.scala 83:32]
      result_reg <= alu_io_out; // @[Datapath.scala 84:20]
    end
    if (reset) begin // @[Datapath.scala 43:32]
      result_cc_reg_z <= 1'h0; // @[Datapath.scala 43:32]
    end else if (_T_1) begin // @[Datapath.scala 83:32]
      result_cc_reg_z <= alu_io_cc_z; // @[Datapath.scala 85:23]
    end
    if (reset) begin // @[Datapath.scala 43:32]
      result_cc_reg_c <= 1'h0; // @[Datapath.scala 43:32]
    end else if (_T_1) begin // @[Datapath.scala 83:32]
      result_cc_reg_c <= alu_io_cc_c; // @[Datapath.scala 85:23]
    end
    if (reset) begin // @[Datapath.scala 43:32]
      result_cc_reg_n <= 1'h0; // @[Datapath.scala 43:32]
    end else if (_T_1) begin // @[Datapath.scala 83:32]
      result_cc_reg_n <= alu_io_cc_n; // @[Datapath.scala 85:23]
    end
    if (reset) begin // @[Datapath.scala 43:32]
      result_cc_reg_v <= 1'h0; // @[Datapath.scala 43:32]
    end else if (_T_1) begin // @[Datapath.scala 83:32]
      result_cc_reg_v <= alu_io_cc_v; // @[Datapath.scala 85:23]
    end
    REG <= io_restart; // @[Datapath.scala 51:23]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_reg = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  ifetch_reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  instr_reg_rd = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  instr_reg_imm = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  instr_reg_cc_mode = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  instr_reg_alu_op = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  instr_reg_bra_mask_z = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  instr_reg_bra_mask_c = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  instr_reg_bra_mask_n = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  instr_reg_bra_mask_v = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  instr_reg_has_jump = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  instr_reg_has_stop = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  instr_reg_has_branch = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  instr_reg_has_mem = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  instr_reg_has_wb = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  instr_reg_has_imm = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  rs1_reg = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  rs2_reg = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  cc_reg_z = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  cc_reg_c = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  cc_reg_n = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  cc_reg_v = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  result_reg = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  result_cc_reg_z = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  result_cc_reg_c = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  result_cc_reg_n = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  result_cc_reg_v = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  REG = _RAND_27[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ControlPath(
  input        clock,
  input        reset,
  input        io_instr_has_jump,
  input        io_instr_has_stop,
  input        io_instr_has_branch,
  input        io_instr_has_mem,
  input        io_instr_has_wb,
  output       io_issue_if,
  input        io_if_done,
  output       io_issue_mem,
  output       io_mem_we,
  input        io_mem_done,
  output       io_waiting,
  output       io_halted,
  output [2:0] io_state,
  input        io_restart_core,
  output       io_restart
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  restart_reg; // @[ControlPath.scala 37:30]
  wire  _io_restart_T = io_restart_core | restart_reg; // @[ControlPath.scala 38:35]
  reg [2:0] state; // @[ControlPath.scala 40:24]
  wire  is_store_instr = io_instr_has_mem & ~io_instr_has_wb; // @[ControlPath.scala 43:44]
  wire  _T_2 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire [1:0] _state_T = io_if_done ? 2'h2 : 2'h1; // @[ControlPath.scala 58:25]
  wire  _T_8 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = io_instr_has_mem ? 3'h4 : 3'h6; // @[ControlPath.scala 68:43 ControlPath.scala 69:23 ControlPath.scala 71:23]
  wire [2:0] _GEN_1 = io_instr_has_jump | io_instr_has_branch ? 3'h0 : _GEN_0; // @[ControlPath.scala 66:67 ControlPath.scala 67:23]
  wire [2:0] _GEN_2 = io_instr_has_stop ? 3'h7 : _GEN_1; // @[ControlPath.scala 64:38 ControlPath.scala 65:23]
  wire  _T_15 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_18 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire [2:0] _state_T_1 = is_store_instr ? 3'h0 : 3'h6; // @[ControlPath.scala 79:20]
  wire [2:0] _state_T_2 = io_mem_done ? _state_T_1 : 3'h5; // @[ControlPath.scala 78:25]
  wire  _T_21 = 3'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_24 = 3'h7 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_3 = _T_24 ? 3'h7 : state; // @[Conditional.scala 39:67 ControlPath.scala 86:19 ControlPath.scala 40:24]
  wire [2:0] _GEN_4 = _T_21 ? 3'h0 : _GEN_3; // @[Conditional.scala 39:67 ControlPath.scala 83:19]
  wire [2:0] _GEN_5 = _T_18 ? _state_T_2 : _GEN_4; // @[Conditional.scala 39:67 ControlPath.scala 78:19]
  wire [2:0] _GEN_6 = _T_15 ? 3'h5 : _GEN_5; // @[Conditional.scala 39:67 ControlPath.scala 75:19]
  wire [2:0] _GEN_7 = _T_11 ? _GEN_2 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_8 = _T_8 ? 3'h3 : _GEN_7; // @[Conditional.scala 39:67 ControlPath.scala 61:19]
  assign io_issue_if = state == 3'h0; // @[ControlPath.scala 45:27]
  assign io_issue_mem = state == 3'h4; // @[ControlPath.scala 46:28]
  assign io_mem_we = io_instr_has_mem & ~io_instr_has_wb; // @[ControlPath.scala 43:44]
  assign io_waiting = state == 3'h1 | state == 3'h5; // @[ControlPath.scala 49:40]
  assign io_halted = state == 3'h7; // @[ControlPath.scala 50:25]
  assign io_state = state; // @[ControlPath.scala 41:14]
  assign io_restart = io_restart_core | restart_reg; // @[ControlPath.scala 38:35]
  always @(posedge clock) begin
    if (reset) begin // @[ControlPath.scala 37:30]
      restart_reg <= 1'h0; // @[ControlPath.scala 37:30]
    end else if (restart_reg & state != 3'h0 & state != 3'h1 & state != 3'h4 & state != 3'h5) begin // @[ControlPath.scala 94:116]
      restart_reg <= 1'h0; // @[ControlPath.scala 95:21]
    end else begin
      restart_reg <= _io_restart_T;
    end
    if (reset) begin // @[ControlPath.scala 40:24]
      state <= 3'h0; // @[ControlPath.scala 40:24]
    end else if (restart_reg & state != 3'h0 & state != 3'h1 & state != 3'h4 & state != 3'h5) begin // @[ControlPath.scala 94:116]
      state <= 3'h0; // @[ControlPath.scala 96:15]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      state <= 3'h1; // @[ControlPath.scala 55:19]
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      state <= {{1'd0}, _state_T}; // @[ControlPath.scala 58:19]
    end else begin
      state <= _GEN_8;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  restart_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Core(
  input         clock,
  input         reset,
  output [15:0] io_ibus_addr,
  input  [31:0] io_ibus_data_rd,
  output        io_ibus_stb,
  input         io_ibus_ack,
  output [15:0] io_dbus_addr,
  output        io_dbus_we,
  input  [15:0] io_dbus_data_rd,
  output [15:0] io_dbus_data_wr,
  output        io_dbus_stb,
  input         io_dbus_ack,
  input  [15:0] io_restart_pc,
  input         io_restart_core,
  output        io_waiting,
  output        io_halted
);
  wire  dpath_clock; // @[Core.scala 28:23]
  wire  dpath_reset; // @[Core.scala 28:23]
  wire [15:0] dpath_io_instr_imm; // @[Core.scala 28:23]
  wire  dpath_io_instr_bra_mask_z; // @[Core.scala 28:23]
  wire  dpath_io_instr_bra_mask_c; // @[Core.scala 28:23]
  wire  dpath_io_instr_bra_mask_n; // @[Core.scala 28:23]
  wire  dpath_io_instr_bra_mask_v; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_jump; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_stop; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_branch; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_mem; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_wb; // @[Core.scala 28:23]
  wire  dpath_io_instr_has_imm; // @[Core.scala 28:23]
  wire  dpath_io_issue_if; // @[Core.scala 28:23]
  wire  dpath_io_if_done; // @[Core.scala 28:23]
  wire  dpath_io_issue_mem; // @[Core.scala 28:23]
  wire  dpath_io_mem_we; // @[Core.scala 28:23]
  wire  dpath_io_mem_done; // @[Core.scala 28:23]
  wire [2:0] dpath_io_state; // @[Core.scala 28:23]
  wire [15:0] dpath_io_ibus_addr; // @[Core.scala 28:23]
  wire [31:0] dpath_io_ibus_data_rd; // @[Core.scala 28:23]
  wire  dpath_io_ibus_stb; // @[Core.scala 28:23]
  wire  dpath_io_ibus_ack; // @[Core.scala 28:23]
  wire [15:0] dpath_io_dbus_addr; // @[Core.scala 28:23]
  wire  dpath_io_dbus_we; // @[Core.scala 28:23]
  wire [15:0] dpath_io_dbus_data_rd; // @[Core.scala 28:23]
  wire [15:0] dpath_io_dbus_data_wr; // @[Core.scala 28:23]
  wire  dpath_io_dbus_stb; // @[Core.scala 28:23]
  wire  dpath_io_dbus_ack; // @[Core.scala 28:23]
  wire [15:0] dpath_io_restart_pc; // @[Core.scala 28:23]
  wire  dpath_io_restart; // @[Core.scala 28:23]
  wire  cpath_clock; // @[Core.scala 43:23]
  wire  cpath_reset; // @[Core.scala 43:23]
  wire  cpath_io_instr_has_jump; // @[Core.scala 43:23]
  wire  cpath_io_instr_has_stop; // @[Core.scala 43:23]
  wire  cpath_io_instr_has_branch; // @[Core.scala 43:23]
  wire  cpath_io_instr_has_mem; // @[Core.scala 43:23]
  wire  cpath_io_instr_has_wb; // @[Core.scala 43:23]
  wire  cpath_io_issue_if; // @[Core.scala 43:23]
  wire  cpath_io_if_done; // @[Core.scala 43:23]
  wire  cpath_io_issue_mem; // @[Core.scala 43:23]
  wire  cpath_io_mem_we; // @[Core.scala 43:23]
  wire  cpath_io_mem_done; // @[Core.scala 43:23]
  wire  cpath_io_waiting; // @[Core.scala 43:23]
  wire  cpath_io_halted; // @[Core.scala 43:23]
  wire [2:0] cpath_io_state; // @[Core.scala 43:23]
  wire  cpath_io_restart_core; // @[Core.scala 43:23]
  wire  cpath_io_restart; // @[Core.scala 43:23]
  Datapath dpath ( // @[Core.scala 28:23]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_instr_imm(dpath_io_instr_imm),
    .io_instr_bra_mask_z(dpath_io_instr_bra_mask_z),
    .io_instr_bra_mask_c(dpath_io_instr_bra_mask_c),
    .io_instr_bra_mask_n(dpath_io_instr_bra_mask_n),
    .io_instr_bra_mask_v(dpath_io_instr_bra_mask_v),
    .io_instr_has_jump(dpath_io_instr_has_jump),
    .io_instr_has_stop(dpath_io_instr_has_stop),
    .io_instr_has_branch(dpath_io_instr_has_branch),
    .io_instr_has_mem(dpath_io_instr_has_mem),
    .io_instr_has_wb(dpath_io_instr_has_wb),
    .io_instr_has_imm(dpath_io_instr_has_imm),
    .io_issue_if(dpath_io_issue_if),
    .io_if_done(dpath_io_if_done),
    .io_issue_mem(dpath_io_issue_mem),
    .io_mem_we(dpath_io_mem_we),
    .io_mem_done(dpath_io_mem_done),
    .io_state(dpath_io_state),
    .io_ibus_addr(dpath_io_ibus_addr),
    .io_ibus_data_rd(dpath_io_ibus_data_rd),
    .io_ibus_stb(dpath_io_ibus_stb),
    .io_ibus_ack(dpath_io_ibus_ack),
    .io_dbus_addr(dpath_io_dbus_addr),
    .io_dbus_we(dpath_io_dbus_we),
    .io_dbus_data_rd(dpath_io_dbus_data_rd),
    .io_dbus_data_wr(dpath_io_dbus_data_wr),
    .io_dbus_stb(dpath_io_dbus_stb),
    .io_dbus_ack(dpath_io_dbus_ack),
    .io_restart_pc(dpath_io_restart_pc),
    .io_restart(dpath_io_restart)
  );
  ControlPath cpath ( // @[Core.scala 43:23]
    .clock(cpath_clock),
    .reset(cpath_reset),
    .io_instr_has_jump(cpath_io_instr_has_jump),
    .io_instr_has_stop(cpath_io_instr_has_stop),
    .io_instr_has_branch(cpath_io_instr_has_branch),
    .io_instr_has_mem(cpath_io_instr_has_mem),
    .io_instr_has_wb(cpath_io_instr_has_wb),
    .io_issue_if(cpath_io_issue_if),
    .io_if_done(cpath_io_if_done),
    .io_issue_mem(cpath_io_issue_mem),
    .io_mem_we(cpath_io_mem_we),
    .io_mem_done(cpath_io_mem_done),
    .io_waiting(cpath_io_waiting),
    .io_halted(cpath_io_halted),
    .io_state(cpath_io_state),
    .io_restart_core(cpath_io_restart_core),
    .io_restart(cpath_io_restart)
  );
  assign io_ibus_addr = dpath_io_ibus_addr; // @[Core.scala 29:24]
  assign io_ibus_stb = dpath_io_ibus_stb; // @[Core.scala 31:23]
  assign io_dbus_addr = dpath_io_dbus_addr; // @[Core.scala 34:24]
  assign io_dbus_we = dpath_io_dbus_we; // @[Core.scala 35:22]
  assign io_dbus_data_wr = dpath_io_dbus_data_wr; // @[Core.scala 37:27]
  assign io_dbus_stb = dpath_io_dbus_stb; // @[Core.scala 38:23]
  assign io_waiting = cpath_io_waiting; // @[Core.scala 52:22]
  assign io_halted = cpath_io_halted; // @[Core.scala 53:21]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_issue_if = cpath_io_issue_if; // @[Core.scala 46:23]
  assign dpath_io_issue_mem = cpath_io_issue_mem; // @[Core.scala 48:24]
  assign dpath_io_mem_we = cpath_io_mem_we; // @[Core.scala 49:21]
  assign dpath_io_state = cpath_io_state; // @[Core.scala 54:20]
  assign dpath_io_ibus_data_rd = io_ibus_data_rd; // @[Core.scala 30:27]
  assign dpath_io_ibus_ack = io_ibus_ack; // @[Core.scala 32:23]
  assign dpath_io_dbus_data_rd = io_dbus_data_rd; // @[Core.scala 36:27]
  assign dpath_io_dbus_ack = io_dbus_ack; // @[Core.scala 39:23]
  assign dpath_io_restart_pc = io_restart_pc; // @[Core.scala 41:25]
  assign dpath_io_restart = cpath_io_restart; // @[Core.scala 57:22]
  assign cpath_clock = clock;
  assign cpath_reset = reset;
  assign cpath_io_instr_has_jump = dpath_io_instr_has_jump; // @[Core.scala 44:20]
  assign cpath_io_instr_has_stop = dpath_io_instr_has_stop; // @[Core.scala 44:20]
  assign cpath_io_instr_has_branch = dpath_io_instr_has_branch; // @[Core.scala 44:20]
  assign cpath_io_instr_has_mem = dpath_io_instr_has_mem; // @[Core.scala 44:20]
  assign cpath_io_instr_has_wb = dpath_io_instr_has_wb; // @[Core.scala 44:20]
  assign cpath_io_if_done = dpath_io_if_done; // @[Core.scala 47:22]
  assign cpath_io_mem_done = dpath_io_mem_done; // @[Core.scala 50:23]
  assign cpath_io_restart_core = io_restart_core; // @[Core.scala 56:27]
endmodule
module CoreTop(
  input          clock,
  input          reset,
  input  [127:0] io_la_data_in,
  output [127:0] io_la_data_out,
  input  [127:0] io_la_oenb
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  core_clock; // @[CoreTop.scala 27:22]
  wire  core_reset; // @[CoreTop.scala 27:22]
  wire [15:0] core_io_ibus_addr; // @[CoreTop.scala 27:22]
  wire [31:0] core_io_ibus_data_rd; // @[CoreTop.scala 27:22]
  wire  core_io_ibus_stb; // @[CoreTop.scala 27:22]
  wire  core_io_ibus_ack; // @[CoreTop.scala 27:22]
  wire [15:0] core_io_dbus_addr; // @[CoreTop.scala 27:22]
  wire  core_io_dbus_we; // @[CoreTop.scala 27:22]
  wire [15:0] core_io_dbus_data_rd; // @[CoreTop.scala 27:22]
  wire [15:0] core_io_dbus_data_wr; // @[CoreTop.scala 27:22]
  wire  core_io_dbus_stb; // @[CoreTop.scala 27:22]
  wire  core_io_dbus_ack; // @[CoreTop.scala 27:22]
  wire [15:0] core_io_restart_pc; // @[CoreTop.scala 27:22]
  wire  core_io_restart_core; // @[CoreTop.scala 27:22]
  wire  core_io_waiting; // @[CoreTop.scala 27:22]
  wire  core_io_halted; // @[CoreTop.scala 27:22]
  wire [63:0] la_data_in_hi = io_la_data_in[127:64]; // @[CoreTop.scala 17:88]
  wire [127:0] _la_data_in_T_2 = {la_data_in_hi,64'h0}; // @[Cat.scala 30:58]
  reg [127:0] la_data_in; // @[CoreTop.scala 17:29]
  reg  ibus_stb_latch; // @[CoreTop.scala 19:33]
  reg  dbus_stb_latch; // @[CoreTop.scala 23:33]
  wire  _GEN_0 = core_io_ibus_stb | ibus_stb_latch; // @[CoreTop.scala 29:29 CoreTop.scala 29:46 CoreTop.scala 19:33]
  reg  REG; // @[CoreTop.scala 30:37]
  wire  ibus_stb_clear = la_data_in[97]; // @[CoreTop.scala 66:33]
  reg  core_io_ibus_ack_REG; // @[CoreTop.scala 31:48]
  wire  ibus_ack_in = la_data_in[96]; // @[CoreTop.scala 63:30]
  wire  _GEN_2 = core_io_dbus_stb | dbus_stb_latch; // @[CoreTop.scala 33:29 CoreTop.scala 33:46 CoreTop.scala 23:33]
  reg  REG_1; // @[CoreTop.scala 34:37]
  wire  dbus_stb_clear = la_data_in[99]; // @[CoreTop.scala 72:33]
  reg  core_io_dbus_ack_REG; // @[CoreTop.scala 35:48]
  wire  dbus_ack_in = la_data_in[98]; // @[CoreTop.scala 69:30]
  wire [48:0] io_la_data_out_lo = {ibus_stb_latch,core_io_dbus_data_wr,core_io_dbus_addr,core_io_ibus_addr}; // @[Cat.scala 30:58]
  wire [3:0] io_la_data_out_hi = {core_io_halted,core_io_waiting,core_io_dbus_we,dbus_stb_latch}; // @[Cat.scala 30:58]
  reg [52:0] io_la_data_out_REG; // @[CoreTop.scala 46:30]
  reg  core_io_restart_core_REG; // @[CoreTop.scala 75:56]
  Core core ( // @[CoreTop.scala 27:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_ibus_addr(core_io_ibus_addr),
    .io_ibus_data_rd(core_io_ibus_data_rd),
    .io_ibus_stb(core_io_ibus_stb),
    .io_ibus_ack(core_io_ibus_ack),
    .io_dbus_addr(core_io_dbus_addr),
    .io_dbus_we(core_io_dbus_we),
    .io_dbus_data_rd(core_io_dbus_data_rd),
    .io_dbus_data_wr(core_io_dbus_data_wr),
    .io_dbus_stb(core_io_dbus_stb),
    .io_dbus_ack(core_io_dbus_ack),
    .io_restart_pc(core_io_restart_pc),
    .io_restart_core(core_io_restart_core),
    .io_waiting(core_io_waiting),
    .io_halted(core_io_halted)
  );
  assign io_la_data_out = {{75'd0}, io_la_data_out_REG}; // @[CoreTop.scala 46:20]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_ibus_data_rd = la_data_in[95:64]; // @[CoreTop.scala 58:39]
  assign core_io_ibus_ack = ibus_ack_in & ~core_io_ibus_ack_REG; // @[CoreTop.scala 31:37]
  assign core_io_dbus_data_rd = la_data_in[79:64]; // @[CoreTop.scala 59:39]
  assign core_io_dbus_ack = dbus_ack_in & ~core_io_dbus_ack_REG; // @[CoreTop.scala 35:37]
  assign core_io_restart_pc = la_data_in[95:80]; // @[CoreTop.scala 60:37]
  assign core_io_restart_core = la_data_in[100] & ~core_io_restart_core_REG; // @[CoreTop.scala 75:45]
  always @(posedge clock) begin
    if (|io_la_oenb[127:64]) begin // @[CoreTop.scala 17:33]
      la_data_in <= 128'h0;
    end else begin
      la_data_in <= _la_data_in_T_2;
    end
    if (reset) begin // @[CoreTop.scala 19:33]
      ibus_stb_latch <= 1'h0; // @[CoreTop.scala 19:33]
    end else if (ibus_stb_clear & ~REG) begin // @[CoreTop.scala 30:55]
      ibus_stb_latch <= 1'h0; // @[CoreTop.scala 30:72]
    end else begin
      ibus_stb_latch <= _GEN_0;
    end
    if (reset) begin // @[CoreTop.scala 23:33]
      dbus_stb_latch <= 1'h0; // @[CoreTop.scala 23:33]
    end else if (dbus_stb_clear & ~REG_1) begin // @[CoreTop.scala 34:55]
      dbus_stb_latch <= 1'h0; // @[CoreTop.scala 34:72]
    end else begin
      dbus_stb_latch <= _GEN_2;
    end
    REG <= la_data_in[97]; // @[CoreTop.scala 66:33]
    core_io_ibus_ack_REG <= la_data_in[96]; // @[CoreTop.scala 63:30]
    REG_1 <= la_data_in[99]; // @[CoreTop.scala 72:33]
    core_io_dbus_ack_REG <= la_data_in[98]; // @[CoreTop.scala 69:30]
    io_la_data_out_REG <= {io_la_data_out_hi,io_la_data_out_lo}; // @[Cat.scala 30:58]
    core_io_restart_core_REG <= la_data_in[100]; // @[CoreTop.scala 75:67]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  la_data_in = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  ibus_stb_latch = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  dbus_stb_latch = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  core_io_ibus_ack_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  core_io_dbus_ack_REG = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  io_la_data_out_REG = _RAND_7[52:0];
  _RAND_8 = {1{`RANDOM}};
  core_io_restart_core_REG = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

