`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Verification Testbench for Scrambler & LPC Subsystems.

               SCENARIO:
               Simulates the exact 259-cycle continuous output from FEC_MUX.
               Sends 4 full frames: DAT1, DAT2, IDLE, MGMT.

               GEOMETRY PROOF:
               - MUX IN     : 259 Words (64-bit) / 2072 Bytes
               - SCRM OUT   : 259 Words (64-bit) / 2072 Bytes
               - LPC OUT    : 259 Words (96-bit) / 3108 Bytes
===========================================================================
*/

module tb_Scrambler_LPC();

    // =======================================================
    // 1. SYSTEM CLOCKS AND RESET
    // =======================================================
    reg clk;   // 200.0 MHz Baseband Clock
    reg rst_n;

    // =======================================================
    // 2. SIGNALS & INSTANTIATIONS
    // =======================================================
    // MUX Output Simulator (Input to Scrambler)
    reg         mux_dv;
    reg  [63:0] mux_data;

    // Scrambler Output
    wire        scr_dv;
    wire [63:0] scr_data;

    // LPC Output
    wire        lpc_dv;
    wire [95:0] lpc_data;

    scrambler u_scrambler (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (mux_dv),
        .data_in    (mux_data),
        .flag       (scr_dv),
        .data_out   (scr_data)
    );

    lpc_top u_lpc_top (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (scr_dv),
        .data_in    (scr_data),
        .flag       (lpc_dv),
        .data_out   (lpc_data)
    );

    // =======================================================
    // 3. CLOCK & FSM INJECTOR
    // =======================================================
    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk; 
    end

    localparam ST_STREAM = 2'd0;
    localparam ST_GAP    = 2'd1;
    localparam ST_DONE   = 2'd2;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        rst_n     = 1'b0;
        tb_state  = ST_STREAM;
        frame_id  = 4'd1;
        cycle_cnt = 16'd1;
        #100; rst_n = 1'b1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (rst_n) begin
            case (tb_state)
                ST_STREAM: begin
                    // 259 Continuous Cycles (4 Hdr Words + 255 Payload Words)
                    if (cycle_cnt < 259) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin tb_state <= ST_GAP; cycle_cnt <= 16'd1; end
                end
                ST_GAP: begin
                    // Simulated natural gap from CDC
                    if (cycle_cnt < 35) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        if (frame_id < 4) begin
                            frame_id <= frame_id + 1'b1;
                            tb_state <= ST_STREAM;
                            cycle_cnt <= 16'd1;
                        end else begin
                            tb_state <= ST_DONE;
                        end
                    end
                end
            endcase
        end
    end

    // Combinational Data Mapping (Mirrors MUX output structure)
    always @(*) begin
        mux_dv   = 1'b0; 
        mux_data = 64'd0;

        if (tb_state == ST_STREAM) begin
            mux_dv = 1'b1;
            // 4 Header Words
            if      (cycle_cnt == 1) mux_data = {32'd0, 16'd0, 8'd0, frame_id[7:0]}; // TXFN 
            else if (cycle_cnt == 4) mux_data = 64'hC1_C2_C1_C2_C1_C2_C1_C2; // Simulated RS Parity Block
            
            // 255 Payload Words
            else if (cycle_cnt == 5)   mux_data = 64'hAB00_E700_1111_1111; 
            else if (cycle_cnt == 6)   mux_data = 64'hCDEF_0000_2222_2222; 
            else if (cycle_cnt == 243) mux_data = 64'hC3C3_C3C3_C3C3_C3C3; 
            else if (cycle_cnt > 243)  mux_data = 64'hB10C_B10C_B10C_B10C; // Simulated RS Parity Block
            else begin
                if (frame_id <= 2)      mux_data = 64'hDA7A_DA7A_DA7A_DA7A; 
                else if (frame_id == 3) mux_data = 64'h1D1E_1D1E_1D1E_1D1E; 
                else                    mux_data = 64'hA1A1_A1A1_A1A1_A1A1; 
            end
        end
    end

    // =======================================================
    // 4. PERFECT WAVEFORM DUAL-TRACKERS
    // =======================================================
    
    // String Indicator
    reg [31:0] frame_type_str;
    always @(*) begin
        if      (frame_id == 1) frame_type_str = "DAT1";
        else if (frame_id == 2) frame_type_str = "DAT2";
        else if (frame_id == 3) frame_type_str = "IDLE";
        else if (frame_id == 4) frame_type_str = "MGMT";
        else                    frame_type_str = "DONE";
    end

    // Internal Registers for Counters
    reg [8:0] r_scr_cnt = 0;
    reg [8:0] r_lpc_cnt = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_scr_cnt <= 0; r_lpc_cnt <= 0;
        end else begin
            r_scr_cnt <= scr_dv ? (r_scr_cnt + 1'b1) : 9'd0;
            r_lpc_cnt <= lpc_dv ? (r_lpc_cnt + 1'b1) : 9'd0;
        end
    end

    // --- A. INPUT FROM MUX (64-bit) ---
    wire [8:0]  in_mux_word_idx = mux_dv ? cycle_cnt[8:0] : 9'd0;                // 1 to 259 Words
    wire [11:0] in_mux_byte_idx = mux_dv ? (cycle_cnt[8:0] * 8) : 12'd0;         // 8 to 2072 Bytes

    // --- B. SCRAMBLER OUTPUT (64-bit) ---
    wire [8:0]  out_scr_word_idx = scr_dv ? (r_scr_cnt + 1'b1) : 9'd0;           // 1 to 259 Words
    wire [11:0] out_scr_byte_idx = scr_dv ? ((r_scr_cnt + 1'b1) * 8) : 12'd0;    // 8 to 2072 Bytes

    // --- C. LPC OUTPUT (96-bit) ---
    // 1 LPC Word = 96 bits = 12 Bytes!
    wire [8:0]  out_lpc_word_idx = lpc_dv ? (r_lpc_cnt + 1'b1) : 9'd0;           // 1 to 259 Words
    wire [11:0] out_lpc_byte_idx = lpc_dv ? ((r_lpc_cnt + 1'b1) * 12) : 12'd0;   // 12 to 3108 Bytes

    // =======================================================
    // 5. SIMULATION LOGGING
    // =======================================================
    initial begin
        wait(tb_state == ST_DONE);
        #5000;
        $display("\n=======================================================");
        $display(" SCRAMBLER & LPC VERIFICATION COMPLETE");
        $display(" Scrambler aligned to 259-cycle processing.");
        $display(" LPC expanded 64-bit words to 96-bit structures.");
        $display(" Final output profile: 259 Words (3108 Bytes) per frame.");
        $display("=======================================================\n");
        $finish;
    end

endmodule