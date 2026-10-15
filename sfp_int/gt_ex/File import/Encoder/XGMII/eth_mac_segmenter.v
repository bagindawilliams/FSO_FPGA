`timescale 1ns / 1ps

module eth_mac_segmenter(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mac_data,
    input  wire        mac_valid,
    output reg  [31:0] payload_data,
    output reg         payload_en
);
    // 1908 Byte = 477 siklus (32-bit)
    localparam MAX_CYCLES = 16'd477;

    localparam IDLE = 2'd0;
    localparam SEND = 2'd1;
    localparam PAD  = 2'd2;

    reg [1:0]  state;
    reg [15:0] cycle_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state        <= IDLE;
            cycle_count  <= 16'd0;
            payload_data <= 32'd0;
            payload_en   <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    cycle_count <= 16'd0;
                    if (mac_valid) begin
                        state        <= SEND;
                        payload_data <= mac_data;
                        payload_en   <= 1'b1;
                        cycle_count  <= 16'd1;
                    end else begin
                        payload_data <= 32'd0;
                        payload_en   <= 1'b0;
                    end
                end

                SEND: begin
                    if (cycle_count == MAX_CYCLES) begin
                        if (!mac_valid) begin
                            state        <= IDLE;
                            payload_en   <= 1'b0;
                            cycle_count  <= 16'd0;
                        end else begin
                            payload_data <= mac_data;
                            payload_en   <= 1'b1;
                            cycle_count  <= 16'd1;
                        end
                    end 
                    else if (!mac_valid) begin
                        state        <= PAD;
                        payload_data <= 32'd0;
                        payload_en   <= 1'b1;
                        cycle_count  <= cycle_count + 1'b1;
                    end 
                    else begin
                        payload_data <= mac_data;
                        payload_en   <= 1'b1;
                        cycle_count  <= cycle_count + 1'b1;
                    end
                end

                PAD: begin
                    // LOGIKA ANTI-STUCK: Gunakan >= dan force reset
                    if (cycle_count >= MAX_CYCLES) begin
                        state        <= IDLE;
                        payload_data <= 32'd0;
                        payload_en   <= 1'b0;
                        cycle_count  <= 16'd0;
                    end else begin
                        payload_data <= 32'd0;
                        payload_en   <= 1'b1;
                        cycle_count  <= cycle_count + 1'b1;
                    end
                end
            endcase
        end
    end
endmodule