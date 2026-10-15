`timescale 1ns / 1ps

module eth_mac_packing_tx(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mux_data,
    input  wire        mux_valid,
    output wire [31:0] pack_data,
    output wire        pack_valid
);
    // 1930 Byte = 483 siklus transmisi 32-bit
    localparam MAX_TX_CYCLES = 16'd483;
    reg [15:0] cycle_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycle_count <= 16'd0;
        end else begin
            if (mux_valid) begin
                if (cycle_count < MAX_TX_CYCLES)
                    cycle_count <= cycle_count + 1'b1;
            end else begin
                cycle_count <= 16'd0; // Reset saat frame selesai
            end
        end
    end

    // Hanya teruskan data jika masih dalam batas 1930 Byte
    assign pack_valid = mux_valid & (cycle_count < MAX_TX_CYCLES);
    assign pack_data  = pack_valid ? mux_data : 32'd0;

endmodule