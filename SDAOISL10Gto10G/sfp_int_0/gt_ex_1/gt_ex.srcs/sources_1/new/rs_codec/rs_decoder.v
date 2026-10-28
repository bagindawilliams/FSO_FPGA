`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : rs_decoder
Description  : Reed-Solomon Decoder Top Module with Dual-Port BRAM Buffer.
               Supports both RS(255,239) for Payload (max_rd = 256 -> 239 
               output bytes) and shortened RS(32,16) for Header (max_rd = 33 
               -> 16 output bytes).

               Revision History:
               - Rev 1.0 (Initial) : Dual-port BRAM RS(255,239) / RS(32,16) decoder.
               - Rev 1.1 (2026-10-22 06:20 KST) : Updated timescale to 1ns/1ps 
                 and added simulation trackers (out_byte_cnt and 
                 repaired_symbol_cnt) required by rs_decoder_64.v lines 106-110.
===========================================================================
*/

module rs_decoder #(
    parameter max_rd = 256
)(
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    input  wire [7:0] data_in,
    output wire       flag,
    output wire [7:0] data_out
);

    localparam max_wr   = 254;
    localparam max_hold = 43;

    // Write Path (Port A) State Machine
    localparam WR_IDLE  = 3'b001;
    localparam WR_WRITE = 3'b010;
    localparam WR_HOLD  = 3'b100;

    reg [2:0]  wr_state;
    reg [2:0]  wr_next_state;
    reg [7:0]  con_wr   = 8'd0;
    reg [7:0]  con_hold = 8'd0;

    // Read Path (Port B) State Machine
    localparam RD_IDLE  = 3'b001;
    localparam RD_READ  = 3'b010;
    localparam RD_END   = 3'b100;

    reg [2:0]  rd_state;
    reg [2:0]  rd_next_state;
    reg [15:0] con_rd   = 16'd0;

    reg [7:0]  data_d0;

    wire         syndrome_dv;
    wire [127:0] syndrome;

    wire         euclid_dv;
    wire [71:0]  delta;
    wire [63:0]  omega;

    wire         error_pos;
    wire [7:0]   chien;
    wire [7:0]   forney;

    wire         wr_en;
    wire         rd_en;
    wire [7:0]   rd_addr_b;
    wire [7:0]   data_delay;
    reg  [7:0]   decode_out;

    // 1. Port A Write FSM
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            wr_state <= WR_IDLE;
        else
            wr_state <= wr_next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            con_wr <= 8'd0;
        else if (wr_state == WR_WRITE)
            con_wr <= con_wr + 1'b1;
        else
            con_wr <= 8'd0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            con_hold <= 8'd0;
        else if (wr_state == WR_HOLD)
            con_hold <= con_hold + 1'b1;
        else
            con_hold <= 8'd0;
    end

    always @(*) begin
        case (wr_state)
            WR_IDLE: begin
                if (en)
                    wr_next_state = WR_WRITE;
                else
                    wr_next_state = WR_IDLE;
            end
            WR_WRITE: begin
                if (con_wr < max_wr)
                    wr_next_state = WR_WRITE;
                else
                    wr_next_state = WR_HOLD;
            end
            WR_HOLD: begin
                if (con_hold < max_hold)
                    wr_next_state = WR_HOLD;
                else
                    wr_next_state = WR_IDLE;
            end
            default: wr_next_state = WR_IDLE;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            data_d0 <= 8'b0;
        else
            data_d0 <= data_in;
    end

    // 2. Port B Read FSM
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            rd_state <= RD_IDLE;
        else
            rd_state <= rd_next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            con_rd <= 16'd0;
        else if (rd_state == RD_READ)
            con_rd <= con_rd + 1'b1;
        else
            con_rd <= 16'd0;
    end

    always @(*) begin
        case (rd_state)
            RD_IDLE: begin
                if (euclid_dv)
                    rd_next_state = RD_READ;
                else
                    rd_next_state = RD_IDLE;
            end
            RD_READ: begin
                if (con_rd < max_rd)
                    rd_next_state = RD_READ;
                else
                    rd_next_state = RD_END;
            end
            RD_END:  rd_next_state = RD_IDLE;
            default: rd_next_state = RD_IDLE;
        endcase
    end

    // Error Correction XOR Logic
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            decode_out <= 8'b0;
        else if (rd_state == RD_READ && con_rd < max_rd - 16) begin
            if (error_pos)
                decode_out <= data_delay ^ forney;
            else
                decode_out <= data_delay;
        end else
            decode_out <= 8'b0;
    end

    // 1-cycle address pre-fetch on Port B compensates for bram_rs 2-cycle read latency
    assign wr_en     = (wr_state == WR_WRITE && con_wr < max_rd - 1);
    assign rd_en     = euclid_dv || (rd_state == RD_READ);
    assign rd_addr_b = (rd_state == RD_READ) ? (con_rd[7:0] + 8'd1) : 8'd0;

    assign flag      = (rd_state == RD_READ) && (con_rd > 1 && con_rd < max_rd - 15);
    assign data_out  = (flag) ? decode_out : 8'b0;

    // 3. Dual-Port BRAM Data Delay Buffer
    bram_rs bram_rs_inst (
        .clka  (clk),
        .ena   (wr_en),
        .wea   (1'b1),
        .addra (con_wr[7:0]),
        .dina  (data_d0),

        .clkb  (clk),
        .enb   (rd_en),
        .addrb (rd_addr_b),
        .doutb (data_delay)
    );

    // 4. Reed-Solomon Sub-Modules
    syndrome_unit syndrome_unit_inst (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in),
        .flag     (syndrome_dv),
        .syndrome (syndrome)
    );

    euclid_proc euclid_proc_inst (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (syndrome_dv),
        .syndrome (syndrome),
        .flag     (euclid_dv),
        .delta    (delta),
        .omega    (omega)
    );

    chien_search chien_search_inst (
        .clk   (clk),
        .rst_n (rst_n),
        .en    (euclid_dv),
        .delta (delta),
        .flag  (),
        .error (error_pos),
        .chien (chien)
    );

    forney_math forney_math_inst (
        .clk    (clk),
        .rst_n  (rst_n),
        .en     (euclid_dv),
        .omega  (omega),
        .chien  (chien),
        .flag   (),
        .forney (forney)
    );

    // =======================================================
    // 5. SIMULATION TRACKERS (Required by rs_decoder_64.v)
    // =======================================================
    // synthesis translate_off
    wire [8:0]  out_byte_cnt = flag ? (con_rd[8:0] - 9'd1) : 9'd0;
    reg  [11:0] repaired_symbol_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            repaired_symbol_cnt <= 12'd0;
        else if (rd_state == RD_READ && con_rd < max_rd - 16 && error_pos && (forney != 8'd0))
            repaired_symbol_cnt <= repaired_symbol_cnt + 12'd1;
    end
    // synthesis translate_on

endmodule