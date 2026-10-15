`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab Kookmin University
// Engineer: Williamsyah Baginda Miraj
// Description: XGMII TX Formatter with exact 1930-byte alignment & IPG
//////////////////////////////////////////////////////////////////////////////////

module xgmii_tx_formatter(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] mac_data,
    input  wire        mac_valid,
    output reg  [31:0] xgmii_txd,
    output reg  [3:0]  xgmii_txc
);

    reg [15:0] count;
    reg [2:0]  state;

    localparam IDLE      = 3'd0;
    localparam ACTIVE    = 3'd1;
    localparam IPG_WAIT  = 3'd2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            count     <= 16'd0;
            xgmii_txd <= 32'h07070707;
            xgmii_txc <= 4'b1111;
        end else begin
            case (state)
                IDLE: begin
                    if (mac_valid) begin
                        state <= ACTIVE;
                        count <= 16'd1;
                        // Inject Start (0xFB) di Lane 0
                        xgmii_txd <= {mac_data[31:8], 8'hFB};
                        xgmii_txc <= 4'b0001; // Hanya Lane 0 yang control
                    end else begin
                        xgmii_txd <= 32'h07070707;
                        xgmii_txc <= 4'b1111;
                    end
                end

                ACTIVE: begin
                    if (mac_valid) begin
                        count <= count + 1'b1;
                        
                        // 1930 Bytes = 482 siklus penuh + 1 siklus parsial (2 Byte)
                        // Saat count == 482, ini adalah penanganan siklus ke-483
                        if (count == 16'd482) begin 
                            // Data valid hanya di Lane 0 dan Lane 1. 
                            // Lane 2 diisi Terminate (0xFD). Lane 3 diisi Idle (0x07).
                            xgmii_txd <= {8'h07, 8'hFD, mac_data[15:0]};
                            xgmii_txc <= 4'b1100; // Lane 2 dan 3 adalah Control
                            
                            state <= IPG_WAIT;
                            count <= 16'd0;
                        end else begin
                            // Transmisi payload murni di tengah frame
                            xgmii_txd <= mac_data;
                            xgmii_txc <= 4'b0000;
                        end
                    end else begin
                        // Fallback jika mac_valid tiba-tiba turun (Error State)
                        xgmii_txd <= 32'h070707FD; 
                        xgmii_txc <= 4'b1111;
                        state <= IPG_WAIT;
                        count <= 16'd0;
                    end
                end

                IPG_WAIT: begin
                    // Tahan 3 clock cycle (12 Byte) untuk Inter-Packet Gap (IPG)
                    xgmii_txd <= 32'h07070707;
                    xgmii_txc <= 4'b1111;
                    if (count == 16'd2) begin
                        state <= IDLE;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end

endmodule