`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Reed-Solomon (RS) Encoder Engine.
               Generates 16 Parity bytes/words for an incoming data stream.
               
               CRITICAL REVISION:
               - Changed default MAX_CYCLE parameter from 254 to 255.
               - Mathematical alignment: 
                 Active Data Phase = MAX_CYCLE - 16.
                 Flush Parity Phase = 16 Cycles.
                 
                 Usage:
                 > For Payload (239 Data + 16 Parity): MAX_CYCLE = 255
                 > For Header  (16 Data + 16 Parity) : MAX_CYCLE = 32
===========================================================================
*/

module rs_encoder # (parameter MAX_CYCLE = 255) (
    input           clk,
    input           rst_n,
    input           en,
    input   [7:0]   data_in,
    output          flag,
    output  [7:0]   data_out
);
    
    reg     [7:0]   count   = 8'd0;

    localparam  IDLE        = 4'b0001;
    localparam  ACTIVE      = 4'b0010;
    localparam  FLUSH       = 4'b0100;
    localparam  END         = 4'b1000;

    reg     [3:0]   state;
    reg     [3:0]   next_state;

    reg     [7:0]   data_d0;

    reg     [7:0]   Q   [0:15];
    wire    [7:0]   D   [0:15];
    wire    [7:0]   R   [0:15];

    wire    [7:0]   C0;
    wire    [7:0]   C1;

    // =======================================================
    // FSM LOGIC
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state   <= IDLE;
        else
            state   <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            count   <= 8'd0;
        else if (state == ACTIVE || state == FLUSH)
            count   <= count + 1'b1;
        else
            count   <= 8'd0;
    end

    always @(*) begin
        case(state)
            IDLE:   begin
                        if (en) next_state <= ACTIVE;
                        else    next_state <= IDLE;
                    end
            ACTIVE: begin
                        // Read Data Phase
                        if (count < MAX_CYCLE - 16) next_state <= ACTIVE;
                        else                        next_state <= FLUSH;
                    end
            FLUSH:  begin
                        // Dump 16 Parity Bytes Phase
                        if (count < MAX_CYCLE) next_state <= FLUSH;
                        else                   next_state <= END;
                    end
            END:    next_state <= IDLE;
            default: next_state <= IDLE;
        endcase
    end

    // =======================================================
    // DATA PIPELINE & SHIFT REGISTERS
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            data_d0 <= 8'b0;
        else
            data_d0 <= data_in;
    end

    reg [7:0] i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= 8'b0;
        end 
        else if (state == ACTIVE || state == FLUSH) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= D[i];
        end 
        else begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= 8'b0;
        end
    end

    // =======================================================
    // GALOIS FIELD MULTIPLIERS
    // =======================================================
    multiplier gf_0 (8'h3b, C1, R[0]);
    multiplier gf_1 (8'h24, C1, R[1]);
    multiplier gf_2 (8'h32, C1, R[2]);
    multiplier gf_3 (8'h62, C1, R[3]);
    multiplier gf_4 (8'he5, C1, R[4]);
    multiplier gf_5 (8'h29, C1, R[5]);
    multiplier gf_6 (8'h41, C1, R[6]);
    multiplier gf_7 (8'ha3, C1, R[7]);
    multiplier gf_8 (8'h08, C1, R[8]);
    multiplier gf_9 (8'h1e, C1, R[9]);
    multiplier gf_a (8'hd1, C1, R[10]);
    multiplier gf_b (8'h44, C1, R[11]);
    multiplier gf_c (8'hbd, C1, R[12]);
    multiplier gf_d (8'h68, C1, R[13]);
    multiplier gf_e (8'h0d, C1, R[14]);
    multiplier gf_f (8'h3b, C1, R[15]);

    assign  D[0]  = R[0];
    assign  D[1]  = R[1]  ^ Q[0];
    assign  D[2]  = R[2]  ^ Q[1];
    assign  D[3]  = R[3]  ^ Q[2];
    assign  D[4]  = R[4]  ^ Q[3];
    assign  D[5]  = R[5]  ^ Q[4];
    assign  D[6]  = R[6]  ^ Q[5];
    assign  D[7]  = R[7]  ^ Q[6];
    assign  D[8]  = R[8]  ^ Q[7];
    assign  D[9]  = R[9]  ^ Q[8];
    assign  D[10] = R[10] ^ Q[9];
    assign  D[11] = R[11] ^ Q[10];
    assign  D[12] = R[12] ^ Q[11];
    assign  D[13] = R[13] ^ Q[12];
    assign  D[14] = R[14] ^ Q[13];
    assign  D[15] = R[15] ^ Q[14];

    assign  C0       = Q[15] ^ data_d0;
    assign  C1       = (state == FLUSH) ? 8'b0 : C0;

    // Output Mapping
    assign  flag     = (state == ACTIVE || state == FLUSH);
    assign  data_out = (state == FLUSH) ? C0 : data_d0;

endmodule