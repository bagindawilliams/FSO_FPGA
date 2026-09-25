`timescale 1ns / 1ps

module eth_preamble_remover(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] parsed_data,
    input  wire        parsed_valid,
    output wire [31:0] mac_data,
    output wire        mac_valid
);
    reg [1:0] skip_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            skip_count <= 2'd0;
        end else begin
            if (parsed_valid) begin
                if (skip_count < 2'd2)
                    skip_count <= skip_count + 1'b1;
            end else begin
                skip_count <= 2'd0; // Reset saat frame selesai
            end
        end
    end

    // Valid hanya menyala setelah 2 siklus dilewati
    assign mac_valid = parsed_valid & (skip_count == 2'd2);
    assign mac_data  = mac_valid ? parsed_data : 32'd0;

endmodule