`timescale 1ns / 1ps

module top (
    input  wire        clk,
    input  wire [7:0]  sw,
    input  wire        c_in,

    output wire [6:0]  seg,
    output wire [3:0]  an
);

    // Internal signals

    wire [3:0] sum_bcd;
    wire       c_out;

    wire [6:0] ones_seg;
    wire [6:0] tens_seg;

    reg  [15:0] refresh_counter = 16'd0;
    wire        selected_digit;

    reg [6:0] seg_reg;
    reg [3:0] an_reg;


    // sw[3:0] = First BCD number
    // sw[7:4] = Second BCD number

    bcd_adder adder_inst (
        .a_bcd   (sw[3:0]),
        .b_bcd   (sw[7:4]),
        .c_in    (c_in),
        .sum_bcd (sum_bcd),
        .c_out   (c_out)
    );


    // 7-SEGMENT DECODERS

    // Ones digit
    bcd_to_7seg ones_decoder (
        .bcd (sum_bcd),
        .seg (ones_seg)
    );

    // Tens digit (0 or 1)
    bcd_to_7seg tens_decoder (
        .bcd ({3'b000, c_out}),
        .seg (tens_seg)
    );


    // DISPLAY REFRESH COUNTER

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1'b1;
    end

    assign selected_digit = refresh_counter[15];


    // DISPLAY MULTIPLEXING
    // Common-anode display: digit enable is active LOW

    always @(*) begin

        if (selected_digit == 1'b0) begin
            // Tens digit
            seg_reg = tens_seg;
            an_reg  = 4'b1110;
        end
        else begin
            // Ones digit
            seg_reg = ones_seg;
            an_reg  = 4'b1101;
        end

    end


    assign seg = seg_reg;
    assign an  = an_reg;

endmodule