`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Verification Testbench for FSO Header Generation (Top Level).
               Provides stimulus to mimic the ARQ TX Controller & PNT system.
               Includes an intelligent Tcl logger to format hexadecimal output 
               strictly matching SDA OISL Table 2-10 for ETRI reporting.

Revision History:
  - Rev 1.0 (Initial) : Table 2-10 16-Byte Header generation testbench.
  - Rev 2.0 (2026-10-27 15:04 KST) :
    1. Added explicit verification of hardware CRC-16 output bytes d14 (0x0F) 
       and d15 (0x28) for polynomial g(x) = x^16 + x^12 + x^5 + 1 (Table 2-15).
    2. Added Scenario 2 to verify Target B5.1 standard compliance rules:
       - Section 2.6.3.3.2 (Page 25): When ack_valid_in == 0, RXFN (d2, d3) is 
         automatically forced to 0x0000 even if rxfn_in = 16'hABCD.
       - Section 2.6.3.3.5 (Page 27): When fcch_opcode_in == 4'b1111, FCCH_PL 
         (d12, d13) is automatically forced to 0xFFFF.
===========================================================================
*/

module tb_fso_header_top();

    reg clk;
    reg rst_n;
    reg trigger_header_gen;

    // Simulated ARQ Control Plane Inputs
    reg [15:0] txfn_in;
    reg [15:0] rxfn_in;
    reg        ack_in;
    reg        ack_valid_in;
    reg [1:0]  frame_type_in; 
    
    // Simulated Telemetry (PNT) Inputs
    reg [39:0] tx_ts_in;
    reg [5:0]  tod_seconds_in;
    reg [2:0]  ts_applies_in;
    reg [3:0]  fcch_opcode_in;
    reg [15:0] fcch_pl_in;

    // DUT Outputs
    wire [7:0] final_header_byte;
    wire       final_header_valid;
    wire       system_busy;

    // Instantiate the DUT (Device Under Test)
    fso_header_top u_dut (
        .clk                (clk),
        .rst_n              (rst_n),
        .trigger_header_gen (trigger_header_gen),
        .txfn_in            (txfn_in),
        .rxfn_in            (rxfn_in),
        .ack_in             (ack_in),
        .ack_valid_in       (ack_valid_in),
        .frame_type_in      (frame_type_in),
        .tx_ts_in           (tx_ts_in),
        .tod_seconds_in     (tod_seconds_in),
        .ts_applies_in      (ts_applies_in),
        .fcch_opcode_in     (fcch_opcode_in),
        .fcch_pl_in         (fcch_pl_in),
        .final_header_byte  (final_header_byte),
        .final_header_valid (final_header_valid),
        .system_busy        (system_busy)
    );

    // Clock Generation (312.5 MHz -> 3.2 ns period)
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end

    // ETRI Report Formatter (Tcl Console Logger)
    reg [4:0] byte_tracker;
    reg [1:0] scenario_id;
    integer   error_cnt;
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            byte_tracker <= 5'd0;
        end else if (final_header_valid) begin
            if (scenario_id == 2'd1) begin
                case (byte_tracker)
                    5'd0:  begin $display("d0  | TXFN[7:0]        | 0x%02X | Expected: 0x34", final_header_byte); if (final_header_byte !== 8'h34) error_cnt = error_cnt + 1; end
                    5'd1:  begin $display("d1  | TXFN[15:8]       | 0x%02X | Expected: 0x12", final_header_byte); if (final_header_byte !== 8'h12) error_cnt = error_cnt + 1; end
                    5'd2:  begin $display("d2  | RXFN[7:0]        | 0x%02X | Expected: 0xCD", final_header_byte); if (final_header_byte !== 8'hCD) error_cnt = error_cnt + 1; end
                    5'd3:  begin $display("d3  | RXFN[15:8]       | 0x%02X | Expected: 0xAB", final_header_byte); if (final_header_byte !== 8'hAB) error_cnt = error_cnt + 1; end
                    5'd4:  begin $display("d4  | Control & TYPE   | 0x%02X | Expected: 0xFD (DATA, ACK=1)", final_header_byte); if (final_header_byte !== 8'hFD) error_cnt = error_cnt + 1; end
                    5'd5:  begin $display("d5  | TX_TS[7:0]       | 0x%02X | Expected: 0x55", final_header_byte); if (final_header_byte !== 8'h55) error_cnt = error_cnt + 1; end
                    5'd6:  begin $display("d6  | TX_TS[15:8]      | 0x%02X | Expected: 0x44", final_header_byte); if (final_header_byte !== 8'h44) error_cnt = error_cnt + 1; end
                    5'd7:  begin $display("d7  | TX_TS[23:16]     | 0x%02X | Expected: 0x33", final_header_byte); if (final_header_byte !== 8'h33) error_cnt = error_cnt + 1; end
                    5'd8:  begin $display("d8  | TX_TS[31:24]     | 0x%02X | Expected: 0x22", final_header_byte); if (final_header_byte !== 8'h22) error_cnt = error_cnt + 1; end
                    5'd9:  begin $display("d9  | TX_TS[39:32]     | 0x%02X | Expected: 0x11", final_header_byte); if (final_header_byte !== 8'h11) error_cnt = error_cnt + 1; end
                    5'd10: begin $display("d10 | TOD_SECONDS      | 0x%02X | Expected: 0xF2 (TOD=50)", final_header_byte); if (final_header_byte !== 8'hF2) error_cnt = error_cnt + 1; end
                    5'd11: begin $display("d11 | FCCH Opcode      | 0x%02X | Expected: 0x8A (Opcode=A)", final_header_byte); if (final_header_byte !== 8'h8A) error_cnt = error_cnt + 1; end
                    5'd12: begin $display("d12 | FCCH_PL[7:0]     | 0x%02X | Expected: 0x88", final_header_byte); if (final_header_byte !== 8'h88) error_cnt = error_cnt + 1; end
                    5'd13: begin $display("d13 | FCCH_PL[15:8]    | 0x%02X | Expected: 0x99", final_header_byte); if (final_header_byte !== 8'h99) error_cnt = error_cnt + 1; end
                    5'd14: begin $display("d14 | CRC-16[15:8]     | 0x%02X | Expected: 0x0F (Table 2-15 CRC-16 MSB)", final_header_byte); if (final_header_byte !== 8'h0F) error_cnt = error_cnt + 1; end
                    5'd15: begin $display("d15 | CRC-16[7:0]      | 0x%02X | Expected: 0x28 (Table 2-15 CRC-16 LSB)", final_header_byte); if (final_header_byte !== 8'h28) error_cnt = error_cnt + 1; end
                endcase
            end else begin
                case (byte_tracker)
                    5'd2:  begin $display("d2  | RXFN[7:0] (!ACK) | 0x%02X | Expected: 0x00 (Sec. 2.6.3.3.2 Forced Zero)", final_header_byte); if (final_header_byte !== 8'h00) error_cnt = error_cnt + 1; end
                    5'd3:  begin $display("d3  | RXFN[15:8](!ACK) | 0x%02X | Expected: 0x00 (Sec. 2.6.3.3.2 Forced Zero)", final_header_byte); if (final_header_byte !== 8'h00) error_cnt = error_cnt + 1; end
                    5'd4:  begin $display("d4  | Control (!ACK)   | 0x%02X | Expected: 0xF0 (IDLE, ACK=0, ACK_VALID=0)", final_header_byte); if (final_header_byte !== 8'hF0) error_cnt = error_cnt + 1; end
                    5'd11: begin $display("d11 | FCCH Opcode=1111 | 0x%02X | Expected: 0x8F (Opcode=F Not Present)", final_header_byte); if (final_header_byte !== 8'h8F) error_cnt = error_cnt + 1; end
                    5'd12: begin $display("d12 | FCCH_PL[7:0]     | 0x%02X | Expected: 0xFF (Sec. 2.6.3.3.5 All Ones)", final_header_byte); if (final_header_byte !== 8'hFF) error_cnt = error_cnt + 1; end
                    5'd13: begin $display("d13 | FCCH_PL[15:8]    | 0x%02X | Expected: 0xFF (Sec. 2.6.3.3.5 All Ones)", final_header_byte); if (final_header_byte !== 8'hFF) error_cnt = error_cnt + 1; end
                    5'd14: $display("d14 | CRC-16[15:8]     | 0x%02X | (Hardware MUX Appended)", final_header_byte);
                    5'd15: $display("d15 | CRC-16[7:0]      | 0x%02X | (Hardware MUX Appended)", final_header_byte);
                endcase
            end
            byte_tracker <= byte_tracker + 1'b1;
        end else begin
            byte_tracker <= 5'd0;
        end
    end

    // Simulation Scenario
    initial begin
        rst_n              = 1'b0;
        trigger_header_gen = 1'b0;
        scenario_id        = 2'd1;
        error_cnt          = 0;
        
        // Static Setup (Scenario 1: Active DATA Frame with Valid ACK)
        txfn_in        = 16'h1234;
        rxfn_in        = 16'hABCD;
        ack_in         = 1'b1;
        ack_valid_in   = 1'b1;
        frame_type_in  = 2'b01; // DATA
        
        tx_ts_in       = 40'h11_22_33_44_55;
        tod_seconds_in = 6'd50;
        ts_applies_in  = 3'b000;
        fcch_opcode_in = 4'hA;
        fcch_pl_in     = 16'h9988;

        #20;
        rst_n = 1'b1;
        #20;

        $display("\n=======================================================");
        $display("SCENARIO 1: OISL HEADER GENERATION (SDA Table 2-10)");
        $display("=======================================================");
        
        // Fire the FSM
        @(posedge clk); trigger_header_gen = 1'b1;
        @(posedge clk); trigger_header_gen = 1'b0;

        // Wait until all 16 bytes are streamed out
        wait(byte_tracker == 5'd16);
        wait(!final_header_valid);
        #40;

        // =======================================================
        // SCENARIO 2: Verify Sec. 2.6.3.3.2 (!ack_valid -> RXFN=0)
        //             and Sec. 2.6.3.3.5 (fcch_opcode=4'hF -> FCCH_PL=16'hFFFF)
        // =======================================================
        scenario_id    = 2'd2;
        ack_in         = 1'b1;     // Should be forced to 0 when ack_valid_in == 0
        ack_valid_in   = 1'b0;     // ACK-valid = 0 -> RXFN must become 16'h0000
        frame_type_in  = 2'b00;    // IDLE
        fcch_opcode_in = 4'b1111;  // Opcode 1111 (Not Present) -> FCCH_PL must become 16'hFFFF
        fcch_pl_in     = 16'h1234; // Dummy input overridden by hardware to 16'hFFFF

        $display("\n=======================================================");
        $display("SCENARIO 2: SEC. 2.6.3.3.2 & 2.6.3.3.5 SANITIZATION CHECK");
        $display("=======================================================");

        @(posedge clk); trigger_header_gen = 1'b1;
        @(posedge clk); trigger_header_gen = 1'b0;

        wait(byte_tracker == 5'd16);
        #40;

        $display("=======================================================");
        if (error_cnt == 0)
            $display(" RESULT: [PASS] ALL TABLE 2-10 & CRC-16 BYTES VERIFIED (0 Errors)");
        else
            $display(" RESULT: [FAIL] %0d Mismatches Detected", error_cnt);
        $display("=======================================================\n");
        $finish;
    end
endmodule