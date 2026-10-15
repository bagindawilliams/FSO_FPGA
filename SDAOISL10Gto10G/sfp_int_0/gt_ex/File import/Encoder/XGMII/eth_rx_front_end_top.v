`timescale 1ns / 1ps

module eth_rx_front_end_top(
    input  wire        clk,       
    input  wire        rst_n,
    
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,
    
    output wire [31:0] data_out,
    output wire        en,

    // =========================================================================
    // [PRESENTATION PORTS] Ekstraksi pasif untuk dilihat di ILA (Tidak mengubah jalur FSO)
    // =========================================================================
    output reg  [47:0] debug_dest_mac,
    output reg  [47:0] debug_src_mac
);

    wire [31:0] parsed_data;
    wire        parsed_valid;
    wire [31:0] mac_data;
    wire        mac_valid;

    // 1. Parser (Deteksi FB dan FD)
    xgmii_rx_parser u_parser (
        .clk(clk),
        .rst_n(rst_n),
        .xgmii_rxd(xgmii_rxd),
        .xgmii_rxc(xgmii_rxc),
        .parsed_data(parsed_data),
        .parsed_valid(parsed_valid)
    );

    // 2. Preamble Remover (Membuang 8 Byte Preamble + SFD)
    eth_preamble_remover u_remover (
        .clk(clk),
        .rst_n(rst_n),
        .parsed_data(parsed_data),
        .parsed_valid(parsed_valid),
        .mac_data(mac_data),
        .mac_valid(mac_valid)
    );

    // 3. Segmenter & Zero-Padder Cerdas 
    eth_mac_segmenter u_segmenter (
        .clk(clk),
        .rst_n(rst_n),
        .mac_data(mac_data),
        .mac_valid(mac_valid),
        .payload_data(data_out),
        .payload_en(en)
    );

    // =========================================================================
    // LOGIKA PENGINTIP (PASSIVE EXTRACTOR) UNTUK DEMO ETRI
    // Saat mac_valid menyala pertama kali, tangkap MAC dari 32-bit mac_data
    // =========================================================================
    reg [2:0] extract_count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            debug_dest_mac <= 48'd0;
            debug_src_mac  <= 48'd0;
            extract_count  <= 3'd0;
        end else if (mac_valid) begin
            if (extract_count == 3'd0) begin
                debug_dest_mac[47:16] <= mac_data; // 4 Byte awal Dest MAC
                extract_count <= extract_count + 1;
            end else if (extract_count == 3'd1) begin
                debug_dest_mac[15:0]  <= mac_data[31:16]; // 2 Byte akhir Dest MAC
                debug_src_mac[47:32]  <= mac_data[15:0];  // 2 Byte awal Src MAC
                extract_count <= extract_count + 1;
            end else if (extract_count == 3'd2) begin
                debug_src_mac[31:0]   <= mac_data;        // 4 Byte akhir Src MAC
                extract_count <= extract_count + 1;
            end
        end else begin
            extract_count <= 3'd0; // Reset saat frame selesai
        end
    end

endmodule