`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab
// Description: Testbench Isolasi Demultiplexer 128-bit & Preamble Checker
//
// Revision History:
//   - DEMUX-COUNTER02 (2026-11-02 KST): Added independent input/output
//     scenario labels and valid-qualified live counters. Preserved stimulus,
//     DUT, and the complete byte oracle. See audit/20261102_demux_counter02.
//   - Rev 1.0 (Initial) : 128-bit Demultiplexer & Preamble Checker isolation TB.
//   - Rev 2.0 (2026-10-27 15:20 KST) : [ETRI Audit Item 1 & Target B1.1 Fix]
//     1. Fixed checker module instantiation name from 'preamble_sda_dec' to 
//        'preamble_sda_decoder' to match preamble_sda_decoder.v.
//     2. Aligned 128-bit input word format to MSB-first per SDA OISL Table 2-8 
//        (Page 23) and mux_gearbox_128.v: {72'h77_AD_5B_58_43_64_1E_2E_26, 56'hAAAA_BBBB_CCCC_DD}.
//     3. Streamed a complete 195-word (3,117-Byte) frame with 25/64 CDC 3 pacing 
//        so demux_preamble_128 crosses its 1600-Byte pre-buffer threshold, 
//        extracts preamble_extracted = 72'h77AD5B5843641E2E26, asserts 
//        link_locked = 1'b1, and outputs all 259 contiguous 96-bit LPC words (3,108 Bytes).
//   - Rev 2.3 (2026-10-29 01:49 KST) : [Unified 4-Frame Scenario & Counter Alignment]
//     1. Preserved all original comments and Rev 1.0/2.0 history logs 100% intact.
//     2. Upgraded stimulus to stream all 4 sequential FSO frames (DAT1, DAT2, IDLE, 
//        MGMT = 4 x 3117 Bytes = 12,468 Bytes) with standardized counters: 
//        demux_frame_id (1..4), frame_type_str, in_clk_cnt, in_byte_cnt (1..3117), 
//        out_clk_cnt (1..259), and out_byte_cnt (12..3108).
//////////////////////////////////////////////////////////////////////////////////

module tb_demux_decoder();

    reg clk;
    reg rst_n;
    
    // Stimulus dari CDC
    reg [127:0] cdc_data_in;
    reg         cdc_valid_in;
    
    // Observasi Output
    wire [71:0] preamble_extracted;
    wire        preamble_valid;
    wire [95:0] lpc_data_out;
    wire        lpc_valid_out;
    wire        link_locked;

    integer frame_words=0;
    // Standardized Waveform Counters & Frame Labels
    wire [8:0]  out_clk_cnt = lpc_valid_out ? (frame_words + 1) : 0; // Current valid word, 1..259
    wire [11:0] out_byte_cnt = lpc_valid_out ? ((frame_words + 1) * 12) : 0; // Current valid word end, 12..3108
    wire [11:0] legacy_dut_out_byte_cnt = u_demux.out_lpc_byte_cnt;
    // WAVE-REVIEW-20261102-DEMUX01: identity follows accepted preamble events.
    // This is a TB scenario index, not a decoded protocol frame-type field.
    reg [31:0] demux_frame_id = 0;
    wire [31:0] legacy_display_frame_id = u_demux.demux_frame_id;
    wire [15:0] locked_frame_cnt = u_checker.locked_frame_cnt;
    reg  [31:0] frame_type_str;
    reg  [15:0] in_clk_cnt;
    reg  [11:0] in_byte_cnt;

    always @(*) begin
        case (demux_frame_id)
            32'd1:   frame_type_str = "DAT1";
            32'd2:   frame_type_str = "DAT2";
            32'd3:   frame_type_str = "IDLE";
            32'd4:   frame_type_str = "MGMT";
            default: frame_type_str = "WAIT";
        endcase
    end

    // 1. Initiation Demux
    demux_preamble_128 u_demux (
        .clk(clk),
        .rst_n(rst_n),
        .cdc_data_in(cdc_data_in),
        .cdc_valid_in(cdc_valid_in),
        .preamble_extracted(preamble_extracted),
        .preamble_valid(preamble_valid),
        .lpc_data_out(lpc_data_out),
        .lpc_valid_out(lpc_valid_out)
    );

    // 2. Initiation Preamble Checker ([Rev 2.0] Fixed module name to preamble_sda_decoder)
    preamble_sda_decoder u_checker (
        .clk(clk),
        .rst_n(rst_n),
        .preamble_in(preamble_extracted),
        .preamble_valid_in(preamble_valid),
        .link_locked_out(link_locked)
    );

    // Clock 200 MHz
    always #2.5 clk = ~clk;

    function [7:0] get_frame_byte(input [31:0] f_idx, input [11:0] b_idx);
        begin
            case (b_idx)
                12'd1:   get_frame_byte = 8'h77;
                12'd2:   get_frame_byte = 8'hAD;
                12'd3:   get_frame_byte = 8'h5B;
                12'd4:   get_frame_byte = 8'h58;
                12'd5:   get_frame_byte = 8'h43;
                12'd6:   get_frame_byte = 8'h64;
                12'd7:   get_frame_byte = 8'h1E;
                12'd8:   get_frame_byte = 8'h2E;
                12'd9:   get_frame_byte = 8'h26;
                12'd10:  get_frame_byte = 8'hAB;
                12'd13:  get_frame_byte = f_idx[7:0];
                12'd3117:get_frame_byte = 8'h33;
                default: begin
                    if      (f_idx <= 32'd2) get_frame_byte = 8'hDA;
                    else if (f_idx == 32'd3) get_frame_byte = 8'h1D;
                    else                     get_frame_byte = 8'hA1;
                end
            endcase
        end
    endfunction

    integer i, k, abs_b;
    reg [127:0] word128_tmp;
    integer lpc_out_cnt = 0;
    reg [7:0] accepted_input [0:12479];
    integer input_accepted_bytes=0, input_accepted_beats=0;
    integer output_accepted_bytes=0, output_accepted_beats=0;
    integer elapsed_cycles=0, input_valid_low_cycles=0, output_valid_low_cycles=0;
    integer completed_frames=0, mismatch_count=0;
    integer oracle_index;
    realtime first_input_ns=0,last_input_ns=0,first_output_ns=0,last_output_ns=0;
    realtime preamble_event_ns=0,previous_preamble_ns=0,measured_preamble_interval_ns=0;
    reg [7:0] expected_octet;



    // DEMUX-COUNTER02, 2026-11-02 KST: non-driving presentation metadata.
    // Live fields describe the word currently offered for the NEXT rising-edge
    // transfer. Accepted totals above describe transfers already sampled.
    // A 128-bit input slot can contain two frames; expose both endpoint IDs.
    // Scenario labels are TB metadata, not decoded SDA header fields.
    function [31:0] scenario_label(input integer id);
        case(id)
            1: scenario_label="DAT1";
            2: scenario_label="DAT2";
            3: scenario_label="IDLE";
            4: scenario_label="MGMT";
            5: scenario_label="TAIL";
            default: scenario_label="WAIT";
        endcase
    endfunction
    wire [31:0] input_frame_id = cdc_valid_in ? input_accepted_bytes/3117+1 : 0;
    wire [31:0] input_last_frame_id = cdc_valid_in ? (input_accepted_bytes+15)/3117+1 : 0;
    wire [31:0] input_frame_type = scenario_label(input_frame_id);
    wire [31:0] input_last_frame_type = scenario_label(input_last_frame_id);
    wire input_crosses_boundary = cdc_valid_in && input_frame_id!=input_last_frame_id;
    wire [11:0] input_byte_first = cdc_valid_in ? input_accepted_bytes%3117+1 : 0;
    wire [11:0] input_byte_last = cdc_valid_in ? (input_accepted_bytes+15)%3117+1 : 0;
    wire [31:0] input_slot_index = cdc_valid_in ? input_accepted_beats+1 : 0;
    wire [31:0] output_frame_id = lpc_valid_out ? demux_frame_id : 0;
    wire [31:0] output_frame_type = scenario_label(output_frame_id);
    wire [11:0] output_byte_first = lpc_valid_out ? frame_words*12+1 : 0;
    wire output_frame_start = lpc_valid_out && frame_words==0;
    wire output_frame_end = lpc_valid_out && frame_words==258;
    // Check stable-phase presentation against the same valid-only contract.
    // These assertions do not drive either interface or modify the byte oracle.
    always @(negedge clk) if(rst_n) begin
        if(lpc_valid_out) begin
            if(out_clk_cnt<1 || out_clk_cnt>259 || out_byte_cnt!=out_clk_cnt*12 ||
               output_frame_id<1 || output_frame_id>4)
                $fatal(1,"DEMUX_DISPLAY_COUNTER_CONTRACT");
        end else if(out_byte_cnt!=0 || out_clk_cnt!=0 || output_frame_id!=0)
            $fatal(1,"DEMUX_DISPLAY_INVALID_NOT_ZERO");
    end

    always @(posedge clk) begin
        if (preamble_valid) begin
            $display(" [%0t] Preamble Extracted = 0x%018X (Expected: 0x77AD5B5843641E2E26)",
                     $time, preamble_extracted);
        end
        if (lpc_valid_out) begin
            lpc_out_cnt <= lpc_out_cnt + 1;
        end
    end

    // WAVE-REVIEW-20261102-DEMUX01: stimulus is preserved unchanged.
    // It supplies 780 full slots: 12468 frame bytes plus 12 explicit tail zeros.
    initial begin
        // Initiation
        clk          = 0;
        rst_n        = 0;
        cdc_data_in  = 0;
        cdc_valid_in = 0;
        in_clk_cnt   = 0;
        in_byte_cnt  = 0;

        #20;
        rst_n = 1;
        #20;

        // ------ SCENARIO 1 & 2: FLOW FLOW 4 FRAMES (DAT1, DAT2, IDLE, MGMT = 780 Word 128-bit / 12,468 Byte) ---
        // The first word contains {72'h77_AD_5B_58_84_64_1_1_2E_2E_26, 56-bit LPC Initial data} in MSB [127:56]
        for (i = 0; i < 780; i = i + 1) begin
            for (k = 0; k < 16; k = k + 1) begin
                abs_b = i * 16 + k;
                if (abs_b < 12468)
                    word128_tmp[127 - (k * 8) -: 8] = get_frame_byte((abs_b / 3117) + 1, (abs_b % 3117) + 1);
                else
                    word128_tmp[127 - (k * 8) -: 8] = 8'd0;
            end
            @(posedge clk);
            cdc_valid_in <= 1'b1;
            cdc_data_in  <= word128_tmp;
            in_clk_cnt   <= (i % 195) + 1;
            in_byte_cnt  <= ((i * 16) % 3117) + 16;
        end

        // Finish transmission
        @(posedge clk);
        cdc_valid_in <= 1'b0;
        cdc_data_in  <= 128'd0;
        in_clk_cnt   <= 16'd0;
        in_byte_cnt  <= 12'd0;

       // Wait for all 1036 words LPC (4 x 259 words = 12,432 Bytes) finished issued continuously
        wait(lpc_out_cnt == 1036);
        #200;
        $display("\n=======================================================");
        $display(" DEMUX 128 & PREAMBLE DECODER 4-FRAME VERIFICATION REPORT");
        $display(" -> Extracted Preamble : 0x%018X", preamble_extracted);
        $display(" -> Link Locked Status : %0b (Locked Frames: %0d / 4)", link_locked, locked_frame_cnt);
        $display(" -> Contiguous LPC Out : %0d Words (%0d Bytes, Expected: 1036 Words / 12432B)",
                 lpc_out_cnt, lpc_out_cnt * 12);
        // Historical banner claimed general compliance from count/last-preamble only.
        // Current acceptance compares all bytes and each of the four frame boundaries.
        if (input_accepted_bytes != 12480 || output_accepted_bytes != 12432 ||
            demux_frame_id != 4 || completed_frames != 4 || locked_frame_cnt != 4 ||
            !link_locked || mismatch_count != 0 || frame_words != 259)
            $fatal(1,"DEMUX_FINAL_CONTRACT in=%0d out=%0d frames=%0d complete=%0d mismatch=%0d",
                   input_accepted_bytes,output_accepted_bytes,demux_frame_id,completed_frames,mismatch_count);
        $display("AUDIT_PASS DEMUX_ORIGINAL_STIMULUS frames4 preamble4 words1036 bytes12432 mismatch0 inputslots12480 tail12");
        $display("=======================================================\n");
        $finish;
    end

    // Revision WAVE-REVIEW-20261102-DEMUX01, 2026-11-02 KST.
    // Non-driving monitor: preserve original stimulus, DUT and protocol parameters.
    // Sample valid-only ports at the receiver's rising clock edge, before NBA updates.
    // Counter units: bytes/accepted beats; elapsed cycles include valid-low intervals.
    // There is no ready port, therefore valid-low cycles are NOT AXI stall cycles.
    initial begin #20000; $fatal(1,"DEMUX_WATCHDOG_20US"); end
    always @(posedge clk) begin
        if (!rst_n) begin
            demux_frame_id=0;input_accepted_bytes=0;input_accepted_beats=0;
            output_accepted_bytes=0;output_accepted_beats=0;frame_words=0;
            completed_frames=0;mismatch_count=0;elapsed_cycles=0;
            input_valid_low_cycles=0;output_valid_low_cycles=0;
        end else begin
            elapsed_cycles=elapsed_cycles+1;
            if(cdc_valid_in) begin
                if(input_accepted_bytes+16>12480)$fatal(1,"DEMUX_EXTRA_INPUT");
                if(input_accepted_bytes==0)first_input_ns=$realtime;
                last_input_ns=$realtime;input_accepted_beats=input_accepted_beats+1;
                for(integer b=0;b<16;b=b+1)begin
                    accepted_input[input_accepted_bytes]=cdc_data_in[127-8*b -:8];
                    input_accepted_bytes=input_accepted_bytes+1;
                end
            end else input_valid_low_cycles=input_valid_low_cycles+1;
            if(preamble_valid)begin
                if(demux_frame_id>=4 || (demux_frame_id>0 && frame_words!=259))
                    $fatal(1,"DEMUX_FRAME_BOUNDARY frame=%0d words=%0d",demux_frame_id,frame_words);
                if(preamble_extracted!==72'h77AD5B5843641E2E26)$fatal(1,"DEMUX_PREAMBLE_MISMATCH");
                for(integer b=0;b<9;b=b+1)
                    if(preamble_extracted[71-8*b -:8]!==accepted_input[demux_frame_id*3117+b])
                        $fatal(1,"DEMUX_PREAMBLE_INPUT_PAIRING");
                demux_frame_id=demux_frame_id+1;frame_words=0;
                preamble_event_ns=$realtime;
                if(previous_preamble_ns!=0)measured_preamble_interval_ns=$realtime-previous_preamble_ns;
                previous_preamble_ns=$realtime;
                $display("DEMUX_FRAME_START index=%0d t_ns=%0.3f",demux_frame_id,$realtime);
            end
            if(lpc_valid_out)begin
                if(demux_frame_id<1 || frame_words>=259)$fatal(1,"DEMUX_UNEXPECTED_OUTPUT");
                if(output_accepted_bytes==0)first_output_ns=$realtime;
                last_output_ns=$realtime;
                for(integer b=0;b<12;b=b+1)begin
                    oracle_index=(demux_frame_id-1)*3117+9+frame_words*12+b;
                    expected_octet=accepted_input[oracle_index];
                    if(oracle_index>=input_accepted_bytes || lpc_data_out[95-8*b -:8]!==expected_octet)begin
                        mismatch_count=mismatch_count+1;
                        $fatal(1,"DEMUX_FIRST_DIVERGENCE frame=%0d word=%0d lane=%0d input_byte=%0d expected=%h actual=%h t_ns=%0.3f",demux_frame_id,frame_words,b,oracle_index,expected_octet,lpc_data_out[95-8*b -:8],$realtime);
                    end
                end
                output_accepted_bytes=output_accepted_bytes+12;
                output_accepted_beats=output_accepted_beats+1;frame_words=frame_words+1;
                if(frame_words==259)begin completed_frames=completed_frames+1;$display("DEMUX_FRAME_COMPLETE index=%0d bytes=3108 t_ns=%0.3f",demux_frame_id,$realtime);end
            end else begin
                output_valid_low_cycles=output_valid_low_cycles+1;
                if(frame_words>0 && frame_words<259)$fatal(1,"DEMUX_INTRA_BURST_GAP");
            end
        end
    end

endmodule