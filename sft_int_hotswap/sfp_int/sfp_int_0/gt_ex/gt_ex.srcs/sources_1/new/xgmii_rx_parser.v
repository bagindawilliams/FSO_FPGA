`timescale 1ns / 1ps

module xgmii_rx_parser(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,
    output reg  [31:0] parsed_data,
    output reg         parsed_valid
);
    reg active_frame;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            active_frame <= 1'b0;
            parsed_valid <= 1'b0;
            parsed_data  <= 32'd0;
        end else begin
            // Deteksi Start of Frame (0xFB) di jalur paling bawah
            if (xgmii_rxc[0] && xgmii_rxd[7:0] == 8'hFB) begin
                active_frame <= 1'b1;
                parsed_valid <= 1'b1;
                parsed_data  <= xgmii_rxd;
            end
            // Deteksi Terminate (0xFD) di jalur manapun
            else if (active_frame && xgmii_rxc != 4'b0000 && 
                    (xgmii_rxd[7:0] == 8'hFD || xgmii_rxd[15:8] == 8'hFD || xgmii_rxd[23:16] == 8'hFD || xgmii_rxd[31:24] == 8'hFD)) begin
                active_frame <= 1'b0;
                parsed_valid <= 1'b0;
                parsed_data  <= 32'd0;
            end
            // Teruskan payload
            else if (active_frame) begin
                parsed_valid <= 1'b1;
                parsed_data  <= xgmii_rxd;
            end
            else begin
                parsed_valid <= 1'b0;
                parsed_data  <= 32'd0;
            end
        end
    end
endmodule