`timescale 1ns / 100ps

module LoadSensing(
    input clk,
    input reset,
    input start,
    output reg load_ready
);

    reg [3:0] load_weight;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            load_weight <= 0;
            load_ready <= 0;
        end else if (start) begin
            if (load_weight < 8)  // Assuming 8 represents balanced load
                load_weight <= load_weight + 1;
            else
                load_ready <= 1;
        end else begin
            load_ready <= 0;
        end
    end
endmodule

