`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL Frame Header Generator (Data Plane).
               Assembles the 112-bit (14 Byte) Frame Header strictly adhering 
               to SDA OISL Standard V2.1.2, Table 2-9 and Table 2-10.
               
               Features:
               - Hardware-level enforcement of "Reserved Bits = 1".
               - Cycle-accurate 8-bit serialization for CRC-16 processing.
               - Glitch-free enable signal generation.
===========================================================================
*/

module header_generator (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        trigger_gen,

    // --- ARQ & Control Plane Inputs (SDA OISL Table 2-9) ---
    input  wire [15:0] txfn,         // Transmit Frame Number
    input  wire [15:0] rxfn,         // Receive Frame Number (from remote)
    input  wire        ack,          // Acknowledgment status
    input  wire        ack_valid,    // Acknowledgment validity flag
    input  wire [1:0]  frame_type,   // 00=IDLE, 01=DATA, 10=MGMT, 11=RSVD
    
    // --- Telemetry, PNT & Timing Inputs ---
    input  wire [39:0] tx_ts,        // TX Timestamp (Picoseconds precision)
    input  wire [5:0]  tod_seconds,  // Time of Day (Seconds)
    input  wire [2:0]  ts_applies,   // Timestamp application flag
    input  wire [3:0]  fcch_opcode,  // Fast Control Channel Opcode
    input  wire [15:0] fcch_pl,      // Fast Control Channel Payload

    // --- Serialized Output to CRC-16 ---
    output reg  [7:0]  header_byte_out,
    output reg         header_en_out,
    output wire        gen_busy
);

    // Internal Registers
    reg [111:0] full_header_reg;
    reg [3:0]   byte_counter;
    reg         is_generating;

    // Output assignment for busy flag
    assign gen_busy = is_generating;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            full_header_reg <= 112'd0;
            byte_counter    <= 4'd0;
            is_generating   <= 1'b0;
            header_en_out   <= 1'b0;
            header_byte_out <= 8'd0;
        end else begin
            // -----------------------------------------------------------
            // STATE 1: Trigger & Data Latch (Setup Phase)
            // -----------------------------------------------------------
            if (trigger_gen && !is_generating) begin
                // Assemble the 112-bit header based on Table 2-10 mapping.
                // Critical: All reserved bits are forced to 1 per SDA OISL standard.
                full_header_reg[7:0]     <= txfn[7:0];                                  // d0
                full_header_reg[15:8]    <= txfn[15:8];                                 // d1
                full_header_reg[23:16]   <= rxfn[7:0];                                  // d2
                full_header_reg[31:24]   <= rxfn[15:8];                                 // d3
                full_header_reg[39:32]   <= {2'b11, 2'b11, ack, ack_valid, frame_type}; // d4 (Reserved=1)
                full_header_reg[47:40]   <= tx_ts[7:0];                                 // d5
                full_header_reg[55:48]   <= tx_ts[15:8];                                // d6
                full_header_reg[63:56]   <= tx_ts[23:16];                               // d7
                full_header_reg[71:64]   <= tx_ts[31:24];                               // d8
                full_header_reg[79:72]   <= tx_ts[39:32];                               // d9
                full_header_reg[87:80]   <= {2'b11, tod_seconds};                       // d10 (Reserved=1)
                full_header_reg[95:88]   <= {1'b1, ts_applies, fcch_opcode};            // d11 (Reserved=1)
                full_header_reg[103:96]  <= fcch_pl[7:0];                               // d12
                full_header_reg[111:104] <= fcch_pl[15:8];                              // d13
                
                is_generating <= 1'b1;
                byte_counter  <= 4'd0;
                header_en_out <= 1'b0; // Wait 1 cycle for stability
            end 
            
            // -----------------------------------------------------------
            // STATE 2: Execution & Serialization (Shift Phase)
            // -----------------------------------------------------------
            else if (is_generating) begin
                header_en_out   <= 1'b1; // Assert enable signal to wake up CRC-16
                header_byte_out <= full_header_reg[7:0]; // Output LSB byte
                full_header_reg <= {8'd0, full_header_reg[111:8]}; // Right shift 8 bits
                
                if (byte_counter == 4'd13) begin
                    // After 14 bytes (0 to 13), terminate the generation cycle
                    is_generating <= 1'b0;
                end else begin
                    byte_counter  <= byte_counter + 1'b1;
                end
            end 
            
            // -----------------------------------------------------------
            // STATE 3: Idle / Cooldown
            // -----------------------------------------------------------
            else begin
                header_en_out   <= 1'b0; // De-assert enable
                header_byte_out <= 8'd0;
                byte_counter    <= 4'd0;
            end
        end
    end
endmodule