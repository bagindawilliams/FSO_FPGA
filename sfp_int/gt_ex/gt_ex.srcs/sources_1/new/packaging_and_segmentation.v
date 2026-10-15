`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL 1900-Byte Ethernet Segmentation Engine.
               Incorporates a 4KB (1024x33) Synchronous Elastic FIFO to 
               absorb asynchronous Ethernet bursts. 
               FSM strictly formats 1900B blocks (475 cycles) to reserve 
               exactly 8 bytes (2 cycles) for the FSO Payload Headers.
               FIXED: Resolved AXI4-Stream Deadlock using FWFT Combinational output.
===========================================================================
*/

module packaging_and_segmentation (
    input  wire        clk,
    input  wire        rst_n,

    // Input from Preamble Remover
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,

    // Output to fso_payload.v
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready,
    output wire [13:0] seg_valid_bytes // Exact valid bytes in current 1900B block
);

    // =======================================================
    // MATH UPDATE: 1900 Bytes = 475 Words
    // Leaving exactly 8 Bytes (2 words) for FSO Headers later.
    // =======================================================
    localparam MAX_WORDS = 16'd475; // 1900 Bytes = 475 Words

    // =======================================================
    // 1. ELASTIC BUFFER (FIFO) - 1024 Depth x 33-bit Width
    // Kept intact. This is the ultimate shock absorber.
    // =======================================================
    reg [32:0] fifo_ram [0:1023]; 
    reg [9:0]  wr_ptr;
    reg [9:0]  rd_ptr;
    
    wire [9:0] fifo_count = wr_ptr - rd_ptr;
    wire       fifo_full  = (fifo_count == 10'd1023);
    wire       fifo_empty = (wr_ptr == rd_ptr);
    
    assign s_axis_tready = ~fifo_full;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 10'd0;
        end else if (s_axis_tvalid && s_axis_tready) begin
            fifo_ram[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // =======================================================
    // 2. SEGMENTATION & ZERO PADDING FSM
    // =======================================================
localparam S_PASS = 1'b0, S_PAD  = 1'b1;

    reg        state;
    reg [15:0] word_cnt;
    reg [13:0] valid_byte_cnt;
    wire [32:0] rd_data = fifo_ram[rd_ptr];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state          <= S_PASS;
            word_cnt       <= 16'd0;
            valid_byte_cnt <= 14'd1900;
            rd_ptr         <= 10'd0;
        end else begin
            case (state)
                S_PASS: begin
                    // Only forward if there is data AND downstream is ready to receive
                    if (!fifo_empty && m_axis_tready && m_axis_tvalid) begin
                        rd_ptr <= rd_ptr + 1'b1; 
                        
                        if (word_cnt == MAX_WORDS - 1) begin
                            word_cnt       <= 16'd0;
                            valid_byte_cnt <= 14'd1900;
                            state          <= S_PASS; 
                        end else if (rd_data[32]) begin 
                            // Ethernet packet ended early -> record exact valid bytes ((word_cnt + 1) * 4)
                            word_cnt       <= word_cnt + 1'b1;
                            valid_byte_cnt <= (word_cnt[11:0] + 12'd1) << 2;
                            state          <= S_PAD; 
                        end else begin
                            word_cnt       <= word_cnt + 1'b1;
                            valid_byte_cnt <= 14'd1900;
                        end
                    end
                end

                S_PAD: begin
                    if (m_axis_tready && m_axis_tvalid) begin
                        if (word_cnt == MAX_WORDS - 1) begin
                            word_cnt       <= 16'd0;
                            valid_byte_cnt <= 14'd1900;
                            state          <= S_PASS; 
                        end else begin
                            word_cnt <= word_cnt + 1'b1;
                        end
                    end
                end
            endcase
        end
    end

    // COMBINATIONAL OUTPUT: Proactively assert tvalid to break deadlock
    always @(*) begin
        m_axis_tvalid = 1'b0;
        m_axis_tdata  = 32'd0;
        m_axis_tlast  = 1'b0;

        if (state == S_PASS) begin
            m_axis_tvalid = !fifo_empty;
            m_axis_tdata  = rd_data[31:0];
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end else if (state == S_PAD) begin
            m_axis_tvalid = 1'b1;
            m_axis_tdata  = 32'd0; // Zero Padding
            m_axis_tlast  = (word_cnt == MAX_WORDS - 1);
        end
    end
endmodule