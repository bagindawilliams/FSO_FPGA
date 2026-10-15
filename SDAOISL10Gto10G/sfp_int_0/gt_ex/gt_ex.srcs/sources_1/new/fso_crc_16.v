`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Irzal Zaini (Original Core Math) 
               Williamsyah Baginda Miraj (Refactoring)
Description  : FSO Frame Header CRC-16 Generator.
               Uses polynomial: g(x) = x^16 + x^12 + x^5 + 1
               Compliant with SDA OISL Table 2-15.
               Processes 14 Bytes of Header data sequentially (8-bit/clock).
===========================================================================
*/

module fso_crc_16 #(parameter max = 15) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    input  wire [7:0] data_in,
    output wire       flag,
    output wire [7:0] data_out
);

    reg [7:0] count = 8'd0;

    localparam IDLE   = 3'b001;
    localparam ACTIVE = 3'b010;
    localparam END    = 3'b100;

    reg [2:0] state, next_state;
    reg [7:0] temp, crc_out;

    wire [15:0] D;
    reg  [15:0] Q = 16'b0;
    reg  [15:0] R = 16'b0;

    // FSM State Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) state <= IDLE;
        else        state <= next_state;
    end

    // Byte Counter
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) count <= 8'd0;
        else if (state == ACTIVE) count <= count + 1'b1;
        else count <= 8'd0;
    end

    // Next State Logic
    always @(*) begin
        case(state)
            IDLE:    next_state = en ? ACTIVE : IDLE;
            ACTIVE:  next_state = (count < max) ? ACTIVE : END;
            END:     next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Input Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) temp <= 8'd0;
        else        temp <= data_in;
    end

    // Shift Register Processing
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            Q <= 16'b0;
            R <= 16'b0;
        end else if (state == ACTIVE) begin
            if (count < max) begin
                Q <= D;
                if (count == max - 2) R <= D; // Latch final CRC
            end else begin
                Q <= 16'b0;
                R <= 16'b0;
            end
        end
    end

    // Output Formatting (The Hardware MUX) -- following figure 2-9 sda oisl
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) crc_out <= 8'b0;
        else if (state == ACTIVE) begin
            if (count < max - 1)      crc_out <= temp;      // Pass-through data
            else if (count == max - 1) crc_out <= R[15:8];  // Append CRC High Byte
            else if (count == max)     crc_out <= R[7:0];   // Append CRC Low Byte
        end
    end

    // CORE MATH: CCITT-16 XOR Logic (by Irzal Zaini)
    assign D[0]  = Q[8] ^ Q[12] ^ temp[0] ^ temp[4];
    assign D[1]  = Q[9] ^ Q[13] ^ temp[1] ^ temp[5];
    assign D[2]  = Q[10] ^ Q[14] ^ temp[2] ^ temp[6];
    assign D[3]  = Q[11] ^ Q[15] ^ temp[3] ^ temp[7];
    assign D[4]  = Q[12] ^ temp[4];
    assign D[5]  = Q[8] ^ Q[12] ^ Q[13] ^ temp[0] ^ temp[4] ^ temp[5];
    assign D[6]  = Q[9] ^ Q[13] ^ Q[14] ^ temp[1] ^ temp[5] ^ temp[6];
    assign D[7]  = Q[10] ^ Q[14] ^ Q[15] ^ temp[2] ^ temp[6] ^ temp[7];
    assign D[8]  = Q[0] ^ Q[11] ^ Q[15] ^ temp[3] ^ temp[7];
    assign D[9]  = Q[1] ^ Q[12] ^ temp[4];
    assign D[10] = Q[2] ^ Q[13] ^ temp[5];
    assign D[11] = Q[3] ^ Q[14] ^ temp[6];
    assign D[12] = Q[4] ^ Q[8] ^ Q[12] ^ Q[15] ^ temp[0] ^ temp[4] ^ temp[7];
    assign D[13] = Q[5] ^ Q[9] ^ Q[13] ^ temp[1] ^ temp[5];
    assign D[14] = Q[6] ^ Q[10] ^ Q[14] ^ temp[2] ^ temp[6];
    assign D[15] = Q[7] ^ Q[11] ^ Q[15] ^ temp[3] ^ temp[7];

    assign flag     = (count != 0);
    assign data_out = (flag) ? crc_out : 8'b0;

endmodule