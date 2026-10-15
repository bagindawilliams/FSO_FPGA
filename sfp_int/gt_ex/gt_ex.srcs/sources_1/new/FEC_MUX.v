`timescale 1ns / 1ps
/*
===========================================================================
Description  : FEC Multiplexer (Replaces combiner.v).
               Zero-Gap Continuous Streaming (259 Cycles)
               without using BRAM or large counter delays.
               
               Mechanism:
               1. Absorbs 32-Bytes of RS Header silently into a Shift Register.
               2. When Payload arrives, it is delayed by exactly 4 clock cycles.
               3. During those 4 cycles, the 32-Byte Header is blasted out 
                  at 64-bits per cycle.
               4. On cycle 5, the Payload emerges and perfectly splices 
                  behind the Header. Total Output = 4 + 255 = 259 Cycles.
 FIX: 
               Implemented edge-detection routing (rs_load_dv && !pipe).
               This guarantees that the 32-Byte Header is blasted out in 
               EXACTLY 4 cycles, seamlessly followed by the 255-Word Payload.
               Total Output = 259 Continuous Cycles (Zero-Gap).
===========================================================================
*/

module FEC_MUX (
    input               clk,
    input               rst_n,
    
    // Interface from RS Header
    input               rs_head_dv,
    input   [7:0]       rs_head,
    
    // Interface from RS Payload
    input               rs_load_dv,
    input   [63:0]      rs_load,
    
    // Continuous Output to Scrambler
    output              flag,
    output  [63:0]      data_out
);

    // =======================================================
    // 1. HEADER ABSORPTION (32-Bytes = 256 bits)
    // =======================================================
    reg [255:0] hdr_buf;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            hdr_buf <= 256'd0;
        else if (rs_head_dv) 
            hdr_buf <= {hdr_buf[247:0], rs_head};
    end

    // =======================================================
    // 2. PAYLOAD 4-CYCLE DELAY PIPELINE
    // =======================================================
    reg [63:0] load_pipe [0:3];
    reg [3:0]  load_dv_pipe;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            load_pipe[0] <= 64'd0; load_pipe[1] <= 64'd0;
            load_pipe[2] <= 64'd0; load_pipe[3] <= 64'd0;
            load_dv_pipe <= 4'd0;
        end else begin
            // Shift Payload Data
            load_pipe[0] <= rs_load;
            load_pipe[1] <= load_pipe[0];
            load_pipe[2] <= load_pipe[1];
            load_pipe[3] <= load_pipe[2];
            
            // Shift Data Valid Flag
            load_dv_pipe <= {load_dv_pipe[2:0], rs_load_dv};
        end
    end

    // =======================================================
    // 3. STRICT COMBINATIONAL ROUTING
    // =======================================================
    assign data_out = (rs_load_dv      && !load_dv_pipe[0]) ? hdr_buf[255:192] :
                      (load_dv_pipe[0] && !load_dv_pipe[1]) ? hdr_buf[191:128] :
                      (load_dv_pipe[1] && !load_dv_pipe[2]) ? hdr_buf[127:64]  :
                      (load_dv_pipe[2] && !load_dv_pipe[3]) ? hdr_buf[63:0]    :
                      (load_dv_pipe[3])                     ? load_pipe[3]     : 64'd0;

    assign flag = rs_load_dv | load_dv_pipe[0] | load_dv_pipe[1] | load_dv_pipe[2] | load_dv_pipe[3];

endmodule