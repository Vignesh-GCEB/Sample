`timescale 1ns / 1ps
/*********************************************
    SURE ProEd Integrated VLSI Internship
    Batch name : G4

    File Name  : Memory_Controller.v

    Module Name: Memory_Controller 

    Description: Designing RAM

    Engineer   : Vignesh

    History    : 08DEC2025 (created)

****************************************/
module Memory_Controller #(
    parameter RAM_SIZE = 64 * 1024 * 8
)(
    input                                   i_rst,
    input                                   i_clk,
    input                                   i_en,
    input   [$clog2(RAM_SIZE/8)-1:0]        o_wr_addr,
    input   [$clog2(RAM_SIZE/8)-1:0]        i_rd_addr,
    input        [7:0]                      i_wr_data,
    output reg   [7:0]                      o_rd_data
);

    localparam RAM_WIDTH = 32;

    reg [RAM_WIDTH-1:0] mem [0:(RAM_SIZE/RAM_WIDTH)-1];

    always @(posedge i_clk) begin
        if (i_en) begin
            case (o_wr_addr[1:0])
                2'b00: mem[o_wr_addr[$clog2(RAM_SIZE/8)-1:2]][7:0]   <= i_wr_data;
                2'b01: mem[o_wr_addr[$clog2(RAM_SIZE/8)-1:2]][15:8]  <= i_wr_data;
                2'b10: mem[o_wr_addr[$clog2(RAM_SIZE/8)-1:2]][23:16] <= i_wr_data;
                2'b11: mem[o_wr_addr[$clog2(RAM_SIZE/8)-1:2]][31:24] <= i_wr_data;
            endcase
        end
        else begin
            case (i_rd_addr[1:0])
                2'b00: o_rd_data <= mem[i_rd_addr[$clog2(RAM_SIZE/8)-1:2]][7:0];
                2'b01: o_rd_data <= mem[i_rd_addr[$clog2(RAM_SIZE/8)-1:2]][15:8];
                2'b10: o_rd_data <= mem[i_rd_addr[$clog2(RAM_SIZE/8)-1:2]][23:16];
                2'b11: o_rd_data <= mem[i_rd_addr[$clog2(RAM_SIZE/8)-1:2]][31:24];
            endcase
        end
    end

endmodule
