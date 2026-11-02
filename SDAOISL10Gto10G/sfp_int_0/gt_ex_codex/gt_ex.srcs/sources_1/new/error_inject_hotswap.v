`timescale 1ns / 1ps

module error_inject_hotswap #(
    parameter MAX_ERROR = 47
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [31:0] data_in,
    output wire [31:0] data_out,
    output wire        flag
);

    reg [31:0] error_mem [0:MAX_ERROR];
    reg [15:0] err_counter;

    initial begin
        $readmemh("error.mem", error_mem);
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            err_counter <= 16'd0;
        end else begin
            if (en) begin
                if (err_counter < MAX_ERROR)
                    err_counter <= err_counter + 1'b1;
            end else begin
                err_counter <= 16'd0;
            end
        end
    end

    wire inject_active = (en && (err_counter <= MAX_ERROR));
    assign data_out = (en) ? (inject_active ? (data_in ^ error_mem[err_counter]) : data_in) : 32'd0;
    assign flag     = inject_active;

endmodule