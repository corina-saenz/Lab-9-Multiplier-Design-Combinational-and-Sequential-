`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 01:25:45 PM
// Design Name: 
// Module Name: top_seq_multiplier
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

module top_seq_multiplier (
    input  wire        clk,      // 100 MHz
    input  wire [7:0]  sw,       // A=sw[3:0], B=sw[7:4]
    output wire [7:0]  led,      // product low 8 bits
    output wire [3:0]  an,
    output wire        dp
);
    wire [7:0] P;

    seq_multiplier #(.W(4)) u_mul (
        .clk(clk),
        .rst(1'b0),
        .A(sw[3:0]),
        .B(sw[7:4]),
        .P(P)
    );

    assign led = P; 
    
    assign an = 4'b1111;
    assign dp = 1'b1;
endmodule
