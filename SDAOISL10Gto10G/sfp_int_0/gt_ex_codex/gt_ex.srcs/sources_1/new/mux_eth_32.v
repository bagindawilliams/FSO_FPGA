`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : mux_eth_32
Description  : 32-bit Ethernet Preamble Injection Multiplexer with 2-Cycle
               Data Pipeline Delay.
               
               KEY OPERATIONS:
               1. Receives a contiguous, reassembled Ethernet packet stream 
                  (e.g., 500 words = 2000 Bytes) from the Reassembly engine.
               2. Delays the incoming packet data and end-of-packet (tlast) 
                  by 2 clock cycles so that the 8-Byte Preamble + SFD 
                  (2 words x 32-bit) from eth_preamble_gen is prepended 
                  cleanly without overwriting the Ethernet MAC Header.
               3. Extends the output valid window by 2 cycles (e.g., 500 
                  payload words + 2 preamble words = 502 total words = 
                  2008 Bytes).
===========================================================================
*/

module mux_eth_32 (
    input  wire        clk,
    input  wire        rst_n,
    
    // Contiguous Reassembled Ethernet Packet Input (e.g., 2000 Bytes = 500 words)
    input  wire [31:0] asm_data_in,
    input  wire        asm_valid_in,
    input  wire        asm_last_in,
    
    // 64-bit Preamble + SFD Input from eth_preamble_gen
    input  wire [63:0] preamble_sfd,
    
    // Output to eth_tx_back_end_top (e.g., 2008 Bytes = 502 words)
    output wire [31:0] eth_data_out,
    output wire        eth_valid_out,
    output wire        eth_last_out
);

    // 2-Stage Pipeline Delay Registers
    reg [31:0] delay_data_1;
    reg [31:0] delay_data_2;
    reg        delay_valid_1;
    reg        delay_valid_2;
    reg        delay_last_1;
    reg        delay_last_2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            delay_valid_1 <= 1'b0;
            delay_valid_2 <= 1'b0;
            delay_data_1  <= 32'd0;
            delay_data_2  <= 32'd0;
            delay_last_1  <= 1'b0;
            delay_last_2  <= 1'b0;
        end else begin
            delay_valid_1 <= asm_valid_in;
            delay_valid_2 <= delay_valid_1;
            
            delay_data_1  <= asm_data_in;
            delay_data_2  <= delay_data_1;

            delay_last_1  <= asm_valid_in && asm_last_in;
            delay_last_2  <= delay_last_1;
        end
    end

    // Rising-edge detection for the 2-cycle Preamble injection window
    wire is_preamble_cycle_1 = (asm_valid_in  && !delay_valid_1);
    wire is_preamble_cycle_2 = (delay_valid_1 && !delay_valid_2);

    // Output Valid is extended by 2 cycles to accommodate the 8-Byte Preamble
    assign eth_valid_out = asm_valid_in | delay_valid_1 | delay_valid_2;
    assign eth_last_out  = delay_valid_2 & delay_last_2;
    
    // Multiplexer Data Routing
    assign eth_data_out  = is_preamble_cycle_1 ? preamble_sfd[63:32] :
                           is_preamble_cycle_2 ? preamble_sfd[31:0]  :
                           (delay_valid_2      ? delay_data_2        : 32'd0);

endmodule