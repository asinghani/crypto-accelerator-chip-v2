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
`default_nettype none

`define AES_CORE AcceleratorTop
//`define AES_CORE AesWishbone
`define DINO_CONFIG
`define BOTH_DINO

`ifdef SIM
`include "accelerator/crypto_accelerator.v"
`include "accelerator/dino/dinogame.v"
`include "accelerator/CoreTop.v"
`else
`include "./crypto_accelerator.v"
`include "./dino/dinogame.v"
`include "./CoreTop.v"
`endif

`define DINO1_JUMP_PIN 12
`define DINO1_HALT_PIN 13
`define DINO1_DBG_PIN  14
`define DINO1_VS_PIN   15
`define DINO1_HS_PIN   16

`define DINO1_R3_PIN   17
`define DINO1_R2_PIN   18
`define DINO1_R1_PIN   19

`define DINO1_G3_PIN   20
`define DINO1_G2_PIN   21
`define DINO1_G1_PIN   22

`define DINO1_B3_PIN   23
`define DINO1_B2_PIN   24
`define DINO1_B1_PIN   25

`define DINO1_PIX_PIN  26

`define DINO2_JUMP_PIN 27
`define DINO2_HALT_PIN 28
`define DINO2_DBG_PIN  29
`define DINO2_VS_PIN   30
`define DINO2_HS_PIN   31

`define DINO2_PIX_PIN  32

module accelerator_top (
`ifdef USE_POWER_PINS
    inout vdda1,    // User area 1 3.3V supply
    inout vdda2,    // User area 2 3.3V supply
    inout vssa1,    // User area 1 analog ground
    inout vssa2,    // User area 2 analog ground
    inout vccd1,    // User area 1 1.8V supply
    inout vccd2,    // User area 2 1.8v supply
    inout vssd1,    // User area 1 digital ground
    inout vssd2,    // User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oen,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb
);

wire clk = wb_clk_i;
wire rst = wb_rst_i;

wire [`MPRJ_IO_PADS-1:0] io_in;
wire [`MPRJ_IO_PADS-1:0] io_out;
reg  [`MPRJ_IO_PADS-1:0] io_oeb;

reg [`MPRJ_IO_PADS-1:0] io_in_synctmp;
reg [`MPRJ_IO_PADS-1:0] io_in_sync;

// 2FF-synchronize inputs, not sure if necessary
always @(posedge clk) begin
    io_in_synctmp <= io_in;
    io_in_sync <= io_in_synctmp;
end

wire [127:0] la_data_in;
wire [127:0] la_data_out;
wire [127:0] la_oen;

CoreTop rf0_core (
    .clock(clk),
    .reset(rst),
    .io_la_data_in(la_data_in),
    .io_la_data_out(la_data_out),
    .io_la_oenb(la_oen)
);

`AES_CORE aes (
	.clock(clk),
	.reset(rst),
	.io_bus_cyc(wbs_cyc_i),
	.io_bus_stb(wbs_stb_i),
	.io_bus_we(wbs_we_i),
	.io_bus_sel(wbs_sel_i),
	.io_bus_addr(wbs_adr_i[27:0]),
	.io_bus_data_wr(wbs_dat_i),
	.io_bus_ack(wbs_ack_o),
	.io_bus_data_rd(wbs_dat_o)
);

// Logic analyzer out [127:64] = {10'b0, dbg_scrolladdr[10:0], dbg_speed[23:0], dbg_score[15:0], dbg_pixel, dbg_halt, dbg_reset}
// Logic analyzer in [63:0] = {55'bX, speed[3:0], accel[3:0], reset}

always @* begin
	// Default to high-Z (in)
	io_oeb = {(`MPRJ_IO_PADS){1'b1}}; // 0 = out, 1 = in

`ifdef BOTH_DINO
	io_oeb[`DINO1_JUMP_PIN] = 1;
	io_oeb[`DINO1_HALT_PIN] = 1;
	io_oeb[`DINO1_DBG_PIN]  = 1;

	io_oeb[`DINO1_VS_PIN]   = 0;
	io_oeb[`DINO1_HS_PIN]   = 0;

	io_oeb[`DINO1_R3_PIN]   = 0;
	io_oeb[`DINO1_R2_PIN]   = 0;
	io_oeb[`DINO1_R1_PIN]   = 0;

	io_oeb[`DINO1_G3_PIN]   = 0;
	io_oeb[`DINO1_G2_PIN]   = 0;
	io_oeb[`DINO1_G1_PIN]   = 0;

	io_oeb[`DINO1_B3_PIN]   = 0;
	io_oeb[`DINO1_B2_PIN]   = 0;
	io_oeb[`DINO1_B1_PIN]   = 0;

	io_oeb[`DINO1_PIX_PIN]  = 0;
`endif

	io_oeb[`DINO2_JUMP_PIN] = 1;
	io_oeb[`DINO2_HALT_PIN] = 1;
	io_oeb[`DINO2_DBG_PIN]  = 1;
	io_oeb[`DINO2_VS_PIN]   = 0;
	io_oeb[`DINO2_HS_PIN]   = 0;
	io_oeb[`DINO2_PIX_PIN]  = 0;
end

wire dino_rst = rst;


`ifdef BOTH_DINO
wire [3:0] dino1_r;
wire [3:0] dino1_g;
wire [3:0] dino1_b;

assign io_out[`DINO1_R3_PIN] = dino1_r[3];
assign io_out[`DINO1_R2_PIN] = dino1_r[2];
assign io_out[`DINO1_R1_PIN] = dino1_r[1];
assign io_out[`DINO1_G3_PIN] = dino1_g[3];
assign io_out[`DINO1_G2_PIN] = dino1_g[2];
assign io_out[`DINO1_G1_PIN] = dino1_g[1];
assign io_out[`DINO1_B3_PIN] = dino1_b[3];
assign io_out[`DINO1_B2_PIN] = dino1_b[2];
assign io_out[`DINO1_B1_PIN] = dino1_b[1];

dinogame game1 (
    .jump_in(io_in_sync[`DINO1_JUMP_PIN]),
    .halt_in(io_in_sync[`DINO1_HALT_PIN]),
    .debug_in(io_in_sync[`DINO1_DBG_PIN]),

    .vga_hsync(io_out[`DINO1_HS_PIN]),
    .vga_vsync(io_out[`DINO1_VS_PIN]),
    .vga_red(dino1_r),
    .vga_green(dino1_g),
    .vga_blue(dino1_b),
    .vga_pixel(io_out[`DINO1_PIX_PIN]),

`ifdef DINO_CONFIG
    .dbg_reset(),
    .dbg_halt(),
    .dbg_pixel(),
    .dbg_score(),
    .dbg_speed(),
    .dbg_scrolladdr(),

    .cfg_accel(4),
`endif

    .cfg_speed(),

    .clk(clk),
    .sys_rst(dino_rst)
);
`endif


dinogame game2 (
    .jump_in(io_in_sync[`DINO2_JUMP_PIN]),
    .halt_in(io_in_sync[`DINO2_HALT_PIN]),
    .debug_in(io_in_sync[`DINO2_DBG_PIN]),

    .vga_hsync(io_out[`DINO2_HS_PIN]),
    .vga_vsync(io_out[`DINO2_VS_PIN]),
    .vga_red(),
    .vga_green(),
    .vga_blue(),
    .vga_pixel(io_out[`DINO2_PIX_PIN]),

`ifdef DINO_CONFIG
    .dbg_reset(),
    .dbg_halt(),
    .dbg_pixel(),
    .dbg_scrolladdr(),
    .dbg_speed(),
    .dbg_score(),

    .cfg_accel(4),
`endif

    .cfg_speed(2),

    .clk(clk),
    .sys_rst(dino_rst)
);


endmodule
`default_nettype wire

