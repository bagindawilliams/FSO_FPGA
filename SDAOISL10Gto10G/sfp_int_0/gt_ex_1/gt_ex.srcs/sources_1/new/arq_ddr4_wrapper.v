`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_ddr4_wrapper
Description  : Behavioral Circular Block RAM Model for ARQ Retransmission.
               Stores up to 16 FSO frames (512 words x 32-bit per slot) to 
               support hardware retransmission upon NAK or holdoff timeout.
               
               Revision Notes:
               1. Changed 's_axis_tready' to an input port so it monitors the 
                  upstream FIFO handshake in fso_payload.v without creating a 
                  multi-driven net against fifo_data.s_axis_tready.
               2. Separated 'ram_storage' array read/write operations into a 
                  dedicated synchronous 'always @(posedge clk)' block for 
                  clean Block RAM (BRAM) inference.
               3. [Rev 2.0 - 2026-10-27 04:19 KST - Target B3.2 Audit Fix]:
                  Updated terminal word index (LAST_WORD_IDX) from 9'd476 
                  (477 words = 1908 Bytes) to 9'd477 (478 words = 1912 Bytes) 
                  in both the Write and Read state machines. Because 
                  fso_payload.v sniffs the stream AFTER fso_crc_32.v (which 
                  appends the 4-Byte CRC-32 as the 478th word per SDA OISL 
                  Figure 2-7 & Figure 2-17), storing and reading all 478 words 
                  ensures the 4-Byte CRC-32 trailer is preserved intact during 
                  ARQ retransmissions.
===========================================================================
*/

module arq_ddr4_wrapper #(
    parameter DATA_WIDTH    = 32,
    parameter MAX_FRAMES    = 16,
    parameter LAST_WORD_IDX = 9'd477 // [Rev 2.0] 0..477 = 478 words = 1912 Bytes (1908B Payload + 4B CRC-32)
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // Control Interface from ARQ TX Controller / fso_payload.v
    input  wire                  ddr4_write_req,
    input  wire                  ddr4_read_req,
    input  wire                  ddr4_delete_req,
    input  wire [15:0]           ddr4_addr,

    // AXI-Stream Slave Monitor Input (Payload to be stored into RAM)
    input  wire [DATA_WIDTH-1:0] s_axis_tdata,
    input  wire                  s_axis_tvalid,
    input  wire                  s_axis_tlast,
    input  wire                  s_axis_tready,

    // AXI-Stream Master Output (Retransmitted Payload from RAM)
    output reg  [DATA_WIDTH-1:0] m_axis_tdata,
    output reg                   m_axis_tvalid,
    output reg                   m_axis_tlast,
    input  wire                  m_axis_tready
);

    // 16 Frame Slots x 512 Words = 8192 Words of 32-bit Block RAM
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_storage [0:8191];

    // Write State Machine Registers
    reg        writing_state;
    reg [8:0]  write_word_cnt;
    reg [12:0] write_base_addr;

    // Read State Machine Registers
    reg        reading_state;
    reg [8:0]  read_word_cnt;
    reg [12:0] read_base_addr;

    // Purely Synchronous Block RAM Write & Read Port
    wire                  bram_we    = writing_state && s_axis_tvalid && s_axis_tready;
    wire [12:0]           bram_waddr = write_base_addr + {4'd0, write_word_cnt};
    wire [12:0]           bram_raddr = read_base_addr  + {4'd0, read_word_cnt};
    reg  [DATA_WIDTH-1:0] bram_dout;

    always @(posedge clk) begin
        if (bram_we) begin
            ram_storage[bram_waddr] <= s_axis_tdata;
        end
        bram_dout <= ram_storage[bram_raddr];
    end

    // Write Control Logic (Captures all 478 words = 1912 Bytes including 4B CRC-32)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            writing_state   <= 1'b0;
            write_word_cnt  <= 9'd0;
            write_base_addr <= 13'd0;
        end else begin
            if (ddr4_write_req && !writing_state) begin
                writing_state   <= 1'b1;
                write_word_cnt  <= 9'd0;
                write_base_addr <= {ddr4_addr[3:0], 9'd0};
            end else if (writing_state && s_axis_tvalid && s_axis_tready) begin
                if (s_axis_tlast || (write_word_cnt == LAST_WORD_IDX)) begin
                    writing_state <= 1'b0;
                end else begin
                    write_word_cnt <= write_word_cnt + 9'd1;
                end
            end
        end
    end

    // Read Control Logic (Aligned with 1-cycle synchronous BRAM read output, emits 478 words = 1912 Bytes)
    reg reading_d1;
    reg last_d1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reading_state  <= 1'b0;
            read_word_cnt  <= 9'd0;
            read_base_addr <= 13'd0;
            reading_d1     <= 1'b0;
            last_d1        <= 1'b0;
            m_axis_tvalid  <= 1'b0;
            m_axis_tlast   <= 1'b0;
            m_axis_tdata   <= {DATA_WIDTH{1'b0}};
        end else begin
            if (ddr4_read_req && !reading_state) begin
                reading_state  <= 1'b1;
                read_word_cnt  <= 9'd0;
                read_base_addr <= {ddr4_addr[3:0], 9'd0};
                reading_d1     <= 1'b0;
                last_d1        <= 1'b0;
                m_axis_tvalid  <= 1'b0;
                m_axis_tlast   <= 1'b0;
            end else if (reading_state) begin
                if (m_axis_tready) begin
                    reading_d1 <= 1'b1;
                    last_d1    <= (read_word_cnt == LAST_WORD_IDX);

                    if (read_word_cnt == LAST_WORD_IDX) begin
                        reading_state <= 1'b0;
                    end else begin
                        read_word_cnt <= read_word_cnt + 9'd1;
                    end
                end
            end else begin
                reading_d1 <= 1'b0;
                last_d1    <= 1'b0;
            end

            if (m_axis_tready) begin
                m_axis_tvalid <= reading_d1;
                m_axis_tlast  <= reading_d1 && last_d1;
                m_axis_tdata  <= reading_d1 ? bram_dout : {DATA_WIDTH{1'b0}};
            end
        end
    end

endmodule