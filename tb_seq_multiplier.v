`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 01:28:19 PM
// Design Name: 
// Module Name: tb_seq_multiplier
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

module tb_seq_multiplier;
    localparam W = 4;

    reg                   clk = 0;
    reg                   rst = 1;
    reg  [W-1:0]          A, B;
    wire [2*W-1:0]        P;

    seq_multiplier #(.W(W)) dut (.clk(clk), .rst(rst), .A(A), .B(B), .P(P));

    always #5 clk = ~clk;

    task run_case(input [W-1:0] a, input [W-1:0] b);
    begin
        A = a; B = b;
        repeat (W + 2) @(posedge clk);
    end
    endtask

    initial begin
        A = 0; B = 0; 
        repeat(3) @(posedge clk);
        rst = 0;

        // test vectors
        run_case(4'd3, 4'd5);   // 15
        run_case(4'd7, 4'd7);   // 49
        run_case(4'd0, 4'd9);   // 0
        run_case(4'd15,4'd15);  // 225

        #50 $finish;
    end
endmodule
