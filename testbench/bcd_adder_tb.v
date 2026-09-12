`timescale 1ns / 1ps

module bcd_adder_tb;

    reg [3:0] a_bcd;
    reg [3:0] b_bcd;
    reg       c_in;


    wire [3:0] sum_bcd;
    wire       c_out;

    bcd_adder DUT (
        .a_bcd(a_bcd),
        .b_bcd(b_bcd),
        .c_in(c_in),
        .sum_bcd(sum_bcd),
        .c_out(c_out)
    );


    
    initial begin
        $dumpfile("bcd_adder.vcd");
        $dumpvars(0, bcd_adder_tb);

        $monitor("Time=%0t | A=%0d | B=%0d | Cin=%0d | Sum=%0d | Cout=%0d",
                 $time, a_bcd, b_bcd, c_in, sum_bcd, c_out);

        
        a_bcd = 4'b0000;
        b_bcd = 4'b0000;
        c_in = 1'b0;
        #10;


        
        a_bcd = 4'b0010;
        b_bcd = 4'b0011;
        c_in = 1'b0;
        #10;



        a_bcd = 4'b0101;
        b_bcd = 4'b0101;
        c_in = 1'b0;
        #10;


   
        a_bcd = 4'b0111;
        b_bcd = 4'b1000;
        c_in = 1'b0;
        #10;


        a_bcd = 4'b1001;
        b_bcd = 4'b1001;
        c_in = 1'b0;
        #10;


        a_bcd = 4'b0101;
        b_bcd = 4'b0011;
        c_in = 1'b1;
        #10;


        // End simulation
        $finish;

    end

endmodule