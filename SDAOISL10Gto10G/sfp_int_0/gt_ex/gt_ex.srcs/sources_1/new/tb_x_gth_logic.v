`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : High-Precision SDA OISL Testbench for CDC 1 (x_gth_logic.v).

               CRITICAL REVISION:
               - Redesigned the stimulus generator using a pure FSM approach.
               - Eliminated all off-by-one index shifting bugs.
               - Achieved absolute True Zero-Gap streaming (en_head and en_load 
                 never drop to 0 between frames unless backpressured).
               - SDA OISL Geometry Compliance (16-Byte Header & 478-Word Payload).

               Scenario (4 Sequential Frames):
               - Frame 1: DATA (1912B) - First 1900B of Jumbo Eth
               - Frame 2: DATA (1912B) - Remaining 100B Eth + Padding
               - Frame 3: IDLE (1912B) - PRBS Filler
               - Frame 4: MGMT (1912B) - Telemetry
===========================================================================
*/

module tb_x_gth_logic();

    // =======================================================
    // 1. SYSTEM CLOCKS AND RESET
    // =======================================================
    reg clk_gth;   // Fast Write Domain Clock : 312.5 MHz (Period: 3.2 ns)
    reg clk_logic; // Slow Read Domain Clock  : 200.0 MHz (Period: 5.0 ns)
    reg rst_n;

    // =======================================================
    // 2. DEVICE UNDER TEST (DUT) SIGNALS
    // =======================================================
    reg         en_head;
    reg  [7:0]  header_in;
    reg         en_load;
    reg  [31:0] payload_in;

    wire        cdc_ready;
    wire        header_dv;
    wire [7:0]  header_out;
    wire        payload_dv;
    wire [63:0] payload_out;

    // =======================================================
    // 3. VISUALIZATION AND TRACKING VARIABLES (For Vivado)
    // =======================================================
    // ASCII String to dynamically display Frame Type (Set Radix to ASCII)
    reg [31:0] mux_frame_type_str; 

    // Current Frame Tracker (1 to 4)
    reg [3:0]  current_frame_id;

    // --- INPUT INDICES ---
    // Sequential indices to drive data injection
    reg [4:0]  header_byte_index;   // 0 (Idle), 1 to 16 (Active)
    reg [15:0] payload_word_index;  // 0 (Idle), 1 to 478 (Active)

    // --- OUTPUT INDICES (WAVEFORM VISUALIZERS) ---
    // Internal hidden registers
    reg [4:0]  out_header_cnt_reg;
    reg [7:0]  out_payload_cnt_reg;

    // Combinational wires for perfect waveform alignment (Starts at 1)
    wire [4:0] out_header_byte_idx  = header_dv  ? (out_header_cnt_reg + 1'b1)  : 5'd0;
    wire [7:0] out_payload_word_idx = payload_dv ? (out_payload_cnt_reg + 1'b1) : 8'd0;

    // Output Verification Counters (Cumulative for final check)
    integer verified_header_bytes  = 0;
    integer verified_payload_words = 0; 

    // =======================================================
    // 4. DUT INSTANTIATION
    // =======================================================
    x_gth_logic u_cdc_tx_1 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (en_head),
        .en_load    (en_load),
        .header_in  (header_in),
        .payload_in (payload_in),
        .cdc_ready  (cdc_ready),
        .header_dv  (header_dv),
        .header     (header_out),
        .payload_dv (payload_dv),
        .payload    (payload_out)
    );

    // =======================================================
    // 5. CLOCK GENERATION & OUTPUT TRACKING
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth; // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    // Sequential Tracker Logic for Outputs
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            out_header_cnt_reg     <= 5'd0;
            out_payload_cnt_reg    <= 8'd0;
            verified_header_bytes  <= 0;
            verified_payload_words <= 0;
        end else begin
            // Track Header
            if (header_dv) begin
                out_header_cnt_reg    <= out_header_cnt_reg + 1'b1;
                verified_header_bytes <= verified_header_bytes + 1;
            end else begin
                out_header_cnt_reg    <= 5'd0;
            end

            // Track Payload
            if (payload_dv) begin
                out_payload_cnt_reg    <= out_payload_cnt_reg + 1'b1;
                verified_payload_words <= verified_payload_words + 1;
            end else begin
                out_payload_cnt_reg    <= 8'd0;
            end
        end
    end

    // =======================================================
    // 6. MAIN SCENARIO: TWO-PROCESS FSM ARCHITECTURE
    // =======================================================
    localparam ST_INIT   = 2'd0;
    localparam ST_STREAM = 2'd1;
    localparam ST_DONE   = 2'd2;
    reg [1:0] tb_state;

    // --- PROCESS 1: SEQUENTIAL LOGIC (Index & State Management) ---
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            tb_state           <= ST_INIT;
            current_frame_id   <= 4'd1;
            header_byte_index  <= 5'd0;
            payload_word_index <= 16'd0;
        end else begin
            case (tb_state)
                ST_INIT: begin
                    // Wait for CDC FIFOs to assert ready before transmitting
                    if (cdc_ready) begin
                        tb_state           <= ST_STREAM;
                        header_byte_index  <= 5'd1;
                        payload_word_index <= 16'd1;
                    end
                end

                ST_STREAM: begin
                    // Backpressure Check: Freeze counters if CDC is not ready
                    if (cdc_ready) begin
                        
                        // 1. Advance Payload Index (Max 478 Words)
                        if (payload_word_index < 478) begin
                            payload_word_index <= payload_word_index + 1'b1;
                        end else begin
                            // End of Frame Reached
                            if (current_frame_id < 4) begin
                                // Zero-Gap Transition to next frame
                                current_frame_id   <= current_frame_id + 1'b1;
                                payload_word_index <= 16'd1;
                                header_byte_index  <= 5'd1;
                            end else begin
                                // All 4 frames transmitted
                                tb_state           <= ST_DONE;
                                payload_word_index <= 16'd0;
                                header_byte_index  <= 5'd0;
                            end
                        end

                        // 2. Advance Header Index (Max 16 Bytes)
                        if (header_byte_index >= 1 && header_byte_index < 16) begin
                            header_byte_index <= header_byte_index + 1'b1;
                        end else if (header_byte_index == 16) begin
                            // Park index to 0 after 16 bytes are sent
                            header_byte_index <= 5'd0; 
                        end
                    end
                end

                ST_DONE: begin
                    // Keep indices parked
                    header_byte_index  <= 5'd0;
                    payload_word_index <= 16'd0;
                end
            endcase
        end
    end

    // --- PROCESS 2: COMBINATIONAL LOGIC (Data Injection) ---
    always @(*) begin
        // Default Assignments (Prevents Latches)
        en_head            = 1'b0;
        header_in          = 8'd0;
        en_load            = 1'b0;
        payload_in         = 32'd0;
        mux_frame_type_str = "WAIT";

        if (tb_state == ST_STREAM) begin
            
            // Apply combinational Backpressure to signals
            if (cdc_ready) begin
                
                // --- MUX IDENTIFIER FOR WAVEFORM ---
                if      (current_frame_id == 1) mux_frame_type_str = "DAT1"; 
                else if (current_frame_id == 2) mux_frame_type_str = "DAT2"; 
                else if (current_frame_id == 3) mux_frame_type_str = "IDLE"; 
                else                            mux_frame_type_str = "MGMT"; 

                // --- HEADER DATA MAPPING (Cycles 1 to 16) ---
                if (header_byte_index >= 1 && header_byte_index <= 16) begin
                    en_head = 1'b1;
                    case (header_byte_index)
                        5'd1:  header_in = 8'h00;                       // TXFN MSB
                        5'd2:  header_in = {4'd0, current_frame_id};    // TXFN LSB
                        5'd15: header_in = 8'hC1;                       // Dummy CRC-16 MSB
                        5'd16: header_in = 8'hC2;                       // Dummy CRC-16 LSB
                        default: header_in = 8'hAA;                     // Dummy PNT/Config
                    endcase
                end

                // --- PAYLOAD DATA MAPPING (Cycles 1 to 478) ---
                if (payload_word_index >= 1 && payload_word_index <= 478) begin
                    en_load = 1'b1;
                    case (payload_word_index)
                        16'd1:   payload_in = 32'hAB00_E700; // FSO Payload + Eth Pkt Header
                        16'd2:   payload_in = 32'hCDEF_0000; // FSO Packet Header
                        16'd478: payload_in = 32'hC3C3_C3C3; // FSO CRC-32 Tail
                        default: begin
                            // Main Data Body Patterns
                            if (current_frame_id == 1 || current_frame_id == 2) 
                                payload_in = 32'hDA7A_DA7A; // DATA Pattern
                            else if (current_frame_id == 3)             
                                payload_in = 32'h1D1E_1D1E; // IDLE Pattern
                            else                                
                                payload_in = 32'hA1A1_A1A1; // MGMT Pattern
                        end
                    endcase
                end
            end // End if (cdc_ready)
            else begin
                // If CDC asserts Backpressure, freeze data (TREADY=0 behavior)
                mux_frame_type_str = "HOLD";
            end
        end 
        else if (tb_state == ST_DONE) begin
            mux_frame_type_str = "DONE";
        end
    end

    // =======================================================
    // 7. EVALUATION & VERIFICATION REPORT
    // =======================================================
    initial begin
        rst_n = 1'b0;
        #100; rst_n = 1'b1;

        // Wait for FSM to complete injection
        wait(tb_state == ST_DONE);
        
        // Provide sufficient time for the slower 200 MHz domain to drain FIFOs
        #15000;

        $display("\n=======================================================");
        $display(" CDC 1 (x_gth_logic) PRECISION REPORT");
        $display("=======================================================");
        
        $display(" 1. HEADER DOMAIN CROSSING (8-bit -> 8-bit)");
        $display("    Expected : 64 Bytes   (4 Frames x 16 Bytes)");
        $display("    Captured : %0d Bytes", verified_header_bytes);
        if (verified_header_bytes == 64) $display("    Result   : [PASS]");
        else $display("    Result   : [FAIL]");

        $display("\n 2. PAYLOAD ASYMMETRIC CROSSING (32-bit -> 64-bit)");
        $display("    Expected : 956 Words  (4 Frames x 239 Words @ 64-bit)");
        $display("    Captured : %0d Words", verified_payload_words);
        if (verified_payload_words == 956) $display("    Result   : [PASS]");
        else $display("    Result   : [FAIL]");
        $display("=======================================================\n");

        $finish;
    end

endmodule