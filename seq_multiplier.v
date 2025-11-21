`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 01:25:45 PM
// Design Name: 
// Module Name: seq_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seq_multiplier #(
    parameter W = 4
)(
    input  wire             clk,
    input  wire             rst,     
    input  wire [W-1:0]     A,
    input  wire [W-1:0]     B,
    output reg  [2*W-1:0]   P
);
    // internal regs
    reg [W-1:0]     b_reg;
    reg [2*W-1:0]   accum, a_ext;
    reg [$clog2(W+1)-1:0] count;
    reg             run;

    always @(posedge clk) begin
        if (rst) begin
            P     <= {2*W{1'b0}};
            run   <= 1'b0;
            accum <= {2*W{1'b0}};
            a_ext <= {2*W{1'b0}};
            b_reg <= {W{1'b0}};
            count <= {($clog2(W+1)){1'b0}};
        end else begin
            if (!run) begin
                // load operands and initialize
                a_ext <= {{W{1'b0}}, A};  // multiplicand aligned to LSB
                b_reg <= B;
                accum <= {2*W{1'b0}};
                count <= W[$clog2(W+1)-1:0];
                run   <= 1'b1;
            end else begin
                if (b_reg[0]) accum <= accum + a_ext;
                a_ext <= a_ext << 1;
                b_reg <= b_reg >> 1;
                if (count == 1) begin
                    P    <= b_reg[0] ? (accum + a_ext) : accum; 
                    run  <= 1'b0;
                end
                count <= count - 1'b1;
            end
        end
    end
endmodule
