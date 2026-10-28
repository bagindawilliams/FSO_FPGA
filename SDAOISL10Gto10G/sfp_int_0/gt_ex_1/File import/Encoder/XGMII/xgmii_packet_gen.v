`timescale 1ns / 1ps

module xgmii_packet_gen(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        trigger,       // Beri sinyal '1' selama 1 clock untuk mengirim 1 frame
    output reg  [31:0] xgmii_txd,
    output reg  [3:0]  xgmii_txc
);

    // =========================================================================
    // [UBAH DISINI - KONFIGURASI UKURAN PAYLOAD]
    // Ukuran Payload dalam satuan siklus (1 siklus = 4 Byte)
    // - Paket Kecil (64 Byte)   = 16 
    // - Standar (1500 Byte)     = 375 
    // - Jumbo Frame (2000 Byte) = 500 (Segmenter akan memecah 2 frame)
    // =========================================================================
    localparam PAYLOAD_CYCLES = 16'd500; 

    // =========================================================================
    // [UBAH DISINI - KONFIGURASI MAC ADDRESS]
    // Format 48-bit (6 Byte)
    // =========================================================================
    localparam [47:0] DEST_MAC = 48'hAA_BB_CC_DD_EE_FF; // MAC PC 2 (Penerima)
    localparam [47:0] SRC_MAC  = 48'h11_22_33_44_55_66; // MAC PC 1 (Pengirim)

    // =========================================================================
    // [UBAH DISINI - KONFIGURASI IP ADDRESS (IPv4)]
    // Format 32-bit (4 Byte)
    // =========================================================================
    localparam [31:0] SRC_IP  = {8'd192, 8'd168, 8'd1, 8'd10}; // 192.168.1.10
    localparam [31:0] DEST_IP = {8'd192, 8'd168, 8'd1, 8'd20}; // 192.168.1.20

    // =========================================================================
    // [UBAH DISINI - KONFIGURASI ISI TEKS PAYLOAD]
    // Jika Anda ingin mengirim teks, ubah hex ASCII di bawah ini.
    // Teks default: "Kookmin FSO " (12 karakter = 3 siklus x 4 Byte)
    // =========================================================================
    localparam [31:0] TEXT_WORD_1 = 32'h4B_6F_6F_6B; // "Kook"
    localparam [31:0] TEXT_WORD_2 = 32'h6D_69_6E_20; // "min "
    localparam [31:0] TEXT_WORD_3 = 32'h46_53_4F_20; // "FSO "
    localparam [31:0] DUMMY_DATA  = 32'h5A_5A_5A_5A; // Data pengisi "ZZZZ"

    // FSM States
    localparam IDLE      = 3'd0;
    localparam PREAMBLE  = 3'd1;
    localparam MAC_HEAD  = 3'd2;
    localparam PAYLOAD   = 3'd3;
    localparam FCS_TERM  = 3'd4;
    localparam IPG_WAIT  = 3'd5;

    reg [2:0]  state;
    reg [15:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            count     <= 16'd0;
            xgmii_txd <= 32'h07070707; // Idle XGMII
            xgmii_txc <= 4'b1111;
        end else begin
            case (state)
                IDLE: begin
                    xgmii_txd <= 32'h07070707;
                    xgmii_txc <= 4'b1111;
                    if (trigger) begin
                        state <= PREAMBLE;
                        count <= 16'd0;
                    end
                end

                PREAMBLE: begin
                    if (count == 0) begin
                        // Start Byte (0xFB) on Lane 0 + Preamble
                        xgmii_txd <= 32'h55_55_55_FB;
                        xgmii_txc <= 4'b0001; 
                        count <= count + 1;
                    end else begin
                        // Preamble + SFD (0xD5)
                        xgmii_txd <= 32'hD5_55_55_55;
                        xgmii_txc <= 4'b0000;
                        state <= MAC_HEAD;
                        count <= 0;
                    end
                end

                MAC_HEAD: begin
                    xgmii_txc <= 4'b0000;
                    if (count == 0) begin
                        xgmii_txd <= DEST_MAC[47:16]; 
                        count <= count + 1;
                    end else if (count == 1) begin
                        xgmii_txd <= {SRC_MAC[31:0]};
                        count <= count + 1;
                    end else if (count == 2) begin
                        // IPv4 Type (0x0800) + IP Source (Partial)
                        xgmii_txd <= {SRC_IP[15:0], 16'h0008};
                        state <= PAYLOAD;
                        count <= 0;
                    end
                end

                PAYLOAD: begin
                    xgmii_txc <= 4'b0000;
                    if (count == 0)      xgmii_txd <= TEXT_WORD_1;
                    else if (count == 1) xgmii_txd <= TEXT_WORD_2;
                    else if (count == 2) xgmii_txd <= TEXT_WORD_3;
                    else                 xgmii_txd <= DUMMY_DATA;

                    if (count == PAYLOAD_CYCLES - 1) begin
                        state <= FCS_TERM;
                        count <= 0;
                    end else begin
                        count <= count + 1;
                    end
                end

                FCS_TERM: begin
                    if (count == 0) begin
                        xgmii_txd <= 32'hDEADBEEF; // Dummy FCS
                        xgmii_txc <= 4'b0000;
                        count <= count + 1;
                    end else begin
                        // Terminate Byte (0xFD)
                        xgmii_txd <= 32'h07_07_07_FD; 
                        xgmii_txc <= 4'b1111; // 1 means control char
                        state <= IPG_WAIT;
                        count <= 0;
                    end
                end

                IPG_WAIT: begin
                    xgmii_txd <= 32'h07070707; // Inter-Packet Gap (Idles)
                    xgmii_txc <= 4'b1111;
                    // Wait for 3 cycles of Idles (12 bytes: Siklus 0, 1, 2)
                    if (count == 16'd2) state <= IDLE;
                    else                count <= count + 1'b1;
                end
            endcase
        end
    end
endmodule