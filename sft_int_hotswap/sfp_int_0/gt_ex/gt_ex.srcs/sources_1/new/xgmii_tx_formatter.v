`timescale 1ns / 1ps

module xgmii_tx_formatter(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mac_data,
    input  wire        mac_valid,
    output reg  [31:0] xgmii_txd,
    output reg  [3:0]  xgmii_txc
);

    reg valid_d; // Delay 1 cycle untuk mendeteksi sisi naik/turun (edge detection)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_d <= 1'b0;
        end else begin
            valid_d <= mac_valid;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            xgmii_txd <= 32'h07070707; // Kondisi Reset: Tembakkan Idle
            xgmii_txc <= 4'b1111;
        end else begin
            // Kondisi 1: Start of Frame (Sisi Naik dari mac_valid)
            if (mac_valid && !valid_d) begin
                // Standar 10G XGMII: Ganti Byte pertama (0x55) dengan Start (0xFB)
                xgmii_txd <= {mac_data[31:8], 8'hFB};
                xgmii_txc <= 4'b0001; // Hanya Byte pertama yang berupa sinyal kontrol
            end 
            // Kondisi 2: Transmisi Payload Murni (Di tengah frame)
            else if (mac_valid && valid_d) begin
                xgmii_txd <= mac_data;
                xgmii_txc <= 4'b0000; // Semua jalur adalah data
            end 
            // Kondisi 3: End of Frame (Sisi Turun dari mac_valid)
            else if (!mac_valid && valid_d) begin
                xgmii_txd <= 32'h070707FD; // Sisipkan Terminate (0xFD), sisanya Idle
                xgmii_txc <= 4'b1111;      // Semua jalur kembali menjadi sinyal kontrol
            end 
            // Kondisi 4: Idle (Tidak ada data)
            else begin
                xgmii_txd <= 32'h07070707;
                xgmii_txc <= 4'b1111;
            end
        end
    end

endmodule