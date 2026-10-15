`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Verification Testbench for FSO Header Generation (Top Level).
               Provides stimulus to mimic the ARQ TX Controller & PNT system.
               Includes an intelligent Tcl logger to format hexadecimal output 
               strictly matching SDA OISL Table 2-10 for ETRI reporting.
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
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            byte_tracker <= 5'd0;
        end else if (final_header_valid) begin
            case (byte_tracker)
                5'd0:  $display("d0  | TXFN[7:0]        | 0x%02X | Expected: 0x34", final_header_byte);
                5'd1:  $display("d1  | TXFN[15:8]       | 0x%02X | Expected: 0x12", final_header_byte);
                5'd2:  $display("d2  | RXFN[7:0]        | 0x%02X | Expected: 0xCD", final_header_byte);
                5'd3:  $display("d3  | RXFN[15:8]       | 0x%02X | Expected: 0xAB", final_header_byte);
                5'd4:  $display("d4  | Control & TYPE   | 0x%02X | Expected: 0xFD (DATA, ACK=1)", final_header_byte);
                5'd5:  $display("d5  | TX_TS[7:0]       | 0x%02X | Expected: 0x55", final_header_byte);
                5'd6:  $display("d6  | TX_TS[15:8]      | 0x%02X | Expected: 0x44", final_header_byte);
                5'd7:  $display("d7  | TX_TS[23:16]     | 0x%02X | Expected: 0x33", final_header_byte);
                5'd8:  $display("d8  | TX_TS[31:24]     | 0x%02X | Expected: 0x22", final_header_byte);
                5'd9:  $display("d9  | TX_TS[39:32]     | 0x%02X | Expected: 0x11", final_header_byte);
                5'd10: $display("d10 | TOD_SECONDS      | 0x%02X | Expected: 0xF2 (TOD=50)", final_header_byte);
                5'd11: $display("d11 | FCCH Opcode      | 0x%02X | Expected: 0x8A (Opcode=A)", final_header_byte);
                5'd12: $display("d12 | FCCH_PL[7:0]     | 0x%02X | Expected: 0x88", final_header_byte);
                5'd13: $display("d13 | FCCH_PL[15:8]    | 0x%02X | Expected: 0x99", final_header_byte);
                5'd14: $display("d14 | CRC-16[15:8]     | 0x%02X | (Hardware MUX Appended)", final_header_byte);
                5'd15: $display("d15 | CRC-16[7:0]      | 0x%02X | (Hardware MUX Appended)", final_header_byte);
            endcase
            byte_tracker <= byte_tracker + 1'b1;
        end else begin
            byte_tracker <= 5'd0;
        end
    end

    // Simulation Scenario
    initial begin
        rst_n = 1'b0;
        trigger_header_gen = 1'b0;
        
        // Static Setup
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
        $display("STARTING OISL HEADER GENERATION (SDA Table 2-10)");
        $display("=======================================================");
        
        // Fire the FSM
        @(posedge clk); trigger_header_gen = 1'b1;
        @(posedge clk); trigger_header_gen = 1'b0;

        // Wait until all 16 bytes are streamed out
        wait(byte_tracker == 5'd16);
        #40;
        
        $display("=======================================================\n");
        $finish;
    end
endmodule