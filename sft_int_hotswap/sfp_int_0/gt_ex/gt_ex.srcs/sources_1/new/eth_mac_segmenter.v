`timescale 1ns / 1ps

module eth_mac_segmenter(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mac_data,
    input  wire        mac_valid,
    output wire [31:0] payload_data,
    output wire        payload_en
);
    // 1906 Byte membutuhkan 477 siklus transmisi 32-bit (476 penuh + 1 parsial 2-byte)
    localparam MAX_CYCLES = 16'd477;
    reg [15:0] cycle_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycle_count <= 16'd0;
        end else begin
            if (mac_valid) begin
                if (cycle_count < MAX_CYCLES)
                    cycle_count <= cycle_count + 1'b1;
            end else begin
                cycle_count <= 16'd0;
            end
        end
    end

    // Izinkan data lewat hanya jika belum mencapai batas
    assign payload_en   = mac_valid & (cycle_count < MAX_CYCLES);
    assign payload_data = payload_en ? mac_data : 32'd0;

endmodule