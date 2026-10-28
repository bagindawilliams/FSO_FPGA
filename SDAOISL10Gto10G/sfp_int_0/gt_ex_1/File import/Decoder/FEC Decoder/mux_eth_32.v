`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: 32-bit Multiplexer (2-Cycle Pipeline Delay for Preamble Injection)
//////////////////////////////////////////////////////////////////////////////////

module mux_eth_32(
    input  wire        clk,
    input  wire        rst_n,
    
    // Input dari Ethernet Frame Reassembly
    input  wire [31:0] asm_data_in,
    input  wire        asm_valid_in,
    
    // Input dari Preamble Gen
    input  wire [63:0] preamble_sfd,
    
    // Output ke Packing & Segmentation (XGMII Tx)
    output wire [31:0] eth_data_out,
    output wire        eth_valid_out
);

    // Register Pipeline untuk menunda data masuk selama 2 siklus clock
    reg [31:0] delay_data_1;
    reg [31:0] delay_data_2;
    reg        delay_valid_1;
    reg        delay_valid_2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            delay_valid_1 <= 1'b0;
            delay_valid_2 <= 1'b0;
            delay_data_1  <= 32'd0;
            delay_data_2  <= 32'd0;
        end else begin
            // Shift Register Sinyal Valid
            delay_valid_1 <= asm_valid_in;
            delay_valid_2 <= delay_valid_1;
            
            // Shift Register Data
            delay_data_1  <= asm_data_in;
            delay_data_2  <= delay_data_1;
        end
    end

    // Deteksi Fase Injeksi (Menggunakan edge-detection dari sinyal valid)
    wire is_preamble_cycle_1 = (asm_valid_in  && !delay_valid_1); // Clock 1 (Baru menyala)
    wire is_preamble_cycle_2 = (delay_valid_1 && !delay_valid_2); // Clock 2

    // Penggabungan Sinyal Valid (Akan menyala 2 siklus lebih lama dari aslinya)
    assign eth_valid_out = asm_valid_in | delay_valid_1 | delay_valid_2;
    
    // Multiplexer Routing
    assign eth_data_out  = is_preamble_cycle_1 ? preamble_sfd[63:32] : // Tembakkan 4 Byte Preamble 1
                           is_preamble_cycle_2 ? preamble_sfd[31:0]  : // Tembakkan 4 Byte Preamble 2 + SFD
                           delay_data_2;                               // Tembakkan Data Assembler yang sudah di-delay

endmodule