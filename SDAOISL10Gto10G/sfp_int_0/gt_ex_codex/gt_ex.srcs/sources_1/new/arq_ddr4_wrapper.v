`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_ddr4_wrapper
Description  : Circular Frame-Indexed ARQ Retransmission Memory Wrapper.
               Sniffs and stores outgoing 1912-Byte FSO DATA frames (478 words 
               x 32-bit, including the 4-Byte FSO CRC-32) indexed by TXFN, and 
               re-emits them upon retransmission requests from arq_tx_controller.

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
               4. [Rev 2.5 - 2026-10-29 15:19 KST - Audit Fix R10 & R04]:
                  - [Fix R10]: Added BRAM read clock-enable gating ('rd_ce') coupled 
                    strictly to AXI-Stream output acceptance (m_axis_tvalid && m_axis_tready)
                    so that arbitrary downstream backpressure stalls (arq_ram_stalls.sv) 
                    preserve all 478 words, 0 mismatches, and exact m_axis_tlast alignment.
                  - [Fix R04]: Provided both 'writing_state' and 'is_writing' alias 
                    for full testbench backward compatibility.
               5. [Rev 2.8 - 2026-10-30 11:45 KST - Audit Fix A07 - 16-Slot Associative CAM Mapping]:
                  Added a 16-entry associative tag table ('slot_txfn_tag[0:15]' and 
                  'slot_tag_valid[0:15]') that maps the full 16-bit 'ddr4_addr' (TXFN) 
                  to a free physical BRAM slot on 'ddr4_write_req', looks up the matching 
                  physical slot on 'ddr4_read_req', and frees the slot on 'ddr4_delete_req'.
               6. [Rev 2.9 - 2026-10-30 18:25 KST - Audit Fix B11 - Non-Colliding Read/Write/Delete Tag Guard]:
                  Guarded 'ddr4_delete_req' tag clearing with '(!ddr4_write_req && !ddr4_read_req)'
                  so that a simultaneous read or write operation never corrupts the active 
                  slot tag, working in tandem with arq_tx_controller's 1-cycle deferred 
                  delete queue (arq_ack_retx_shared_address.sv).
===========================================================================
*/

module arq_ddr4_wrapper #(
    parameter DATA_WIDTH    = 32,
    parameter MAX_FRAMES    = 16,
    parameter LAST_WORD_IDX = 9'd477 // 0..477 = 478 words = 1912 Bytes (includes 4B CRC-32)
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // Control Signals from arq_tx_controller
    input  wire                  ddr4_write_req,
    input  wire                  ddr4_read_req,
    input  wire                  ddr4_delete_req,
    input  wire [15:0]           ddr4_addr,

    // Passive Sniffer Input (Connected to CRC-32 Output Stream)
    input  wire [DATA_WIDTH-1:0] s_axis_tdata,
    input  wire                  s_axis_tvalid,
    input  wire                  s_axis_tlast,
    input  wire                  s_axis_tready,

    // Retransmit AXI-Stream Output to fso_payload_mux (Path 11)
    output reg  [DATA_WIDTH-1:0] m_axis_tdata,
    output reg                   m_axis_tvalid,
    output reg                   m_axis_tlast,
    input  wire                  m_axis_tready
);

    // 16 Slots x 512 Words x 32-bit = 8192 Words (32 KB Internal Block RAM)
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_storage [0:8191];

    /*
    ===========================================================================
    [NOTE FOR HARDWARE DDR4 MIG EXPANSION ON ALINX AXKU062 (BANK 44/45/46)]
    When scaling window capacity to 13,377..16,320 frames (~25.6 MB TX Buffer):
      - TX Buffer Physical Base Address : 32'h0000_0000
      - Direct 2KB Slot Byte Address    : {5'd0, ddr4_addr[15:0], 11'd0}
    ===========================================================================
    */

    // [Rev 2.8 / Rev 2.9 - Fix A07 & B11] 16-Slot Associative CAM Table
    reg [15:0] slot_tag_valid;
    reg [15:0] slot_txfn_tag [0:15];

    reg        wr_hit_found;
    reg [3:0]  wr_hit_slot;
    reg        wr_free_found;
    reg [3:0]  wr_free_slot;
    reg        rd_hit_found;
    reg [3:0]  rd_hit_slot;
    integer    k;

    always @(*) begin
        wr_hit_found  = 1'b0;
        wr_hit_slot   = ddr4_addr[3:0];
        wr_free_found = 1'b0;
        wr_free_slot  = ddr4_addr[3:0];
        rd_hit_found  = 1'b0;
        rd_hit_slot   = ddr4_addr[3:0];

        for (k = 0; k < 16; k = k + 1) begin
            if (slot_tag_valid[k] && (slot_txfn_tag[k] == ddr4_addr)) begin
                if (!wr_hit_found) begin
                    wr_hit_found = 1'b1;
                    wr_hit_slot  = k[3:0];
                end
                if (!rd_hit_found) begin
                    rd_hit_found = 1'b1;
                    rd_hit_slot  = k[3:0];
                end
            end
            if (!slot_tag_valid[k] && !wr_free_found) begin
                wr_free_found = 1'b1;
                wr_free_slot  = k[3:0];
            end
        end
    end

    // Prefer direct 4-bit slot if free; otherwise use matching or first free CAM slot
    wire [3:0] alloc_wr_slot = wr_hit_found ? wr_hit_slot :
                               (!slot_tag_valid[ddr4_addr[3:0]]) ? ddr4_addr[3:0] :
                               wr_free_found ? wr_free_slot : ddr4_addr[3:0];

    wire [3:0] lookup_rd_slot = rd_hit_found ? rd_hit_slot : ddr4_addr[3:0];

    reg [3:0] write_slot_ptr;
    reg [8:0] write_word_ptr;
    reg       writing_state;
    wire      is_writing = writing_state;

    reg [3:0] read_slot_ptr;
    reg [8:0] read_word_ptr;
    reg       reading_state;

    wire        stream_handshake = s_axis_tvalid && s_axis_tready;
    wire        ram_wr_en        = writing_state && stream_handshake;
    wire [12:0] wr_ram_addr      = {write_slot_ptr, write_word_ptr};

    // [Rev 2.5 - Fix R10] Advance BRAM read only on initial read request or accepted output beat
    wire        start_read_now   = ddr4_read_req && !reading_state;
    wire        advance_read_now = reading_state && m_axis_tvalid && m_axis_tready && !m_axis_tlast;
    wire        rd_ce            = start_read_now || advance_read_now;
    wire [12:0] rd_ram_addr      = start_read_now ? {lookup_rd_slot, 9'd0} :
                                                    {read_slot_ptr, read_word_ptr + 9'd1};

    // Purely Synchronous Block RAM Write & Stall-Protected Read Port
    always @(posedge clk) begin
        if (ram_wr_en) begin
            ram_storage[wr_ram_addr] <= s_axis_tdata;
        end
        if (rd_ce) begin
            m_axis_tdata <= ram_storage[rd_ram_addr];
        end
    end

    // Write Sniffer & Associative CAM Tag Manager FSM
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            writing_state  <= 1'b0;
            write_slot_ptr <= 4'd0;
            write_word_ptr <= 9'd0;
            slot_tag_valid <= 16'd0;
            for (k = 0; k < 16; k = k + 1) begin
                slot_txfn_tag[k] <= 16'd0;
            end
        end else begin
            // [Rev 2.9 - Fix B11] Only execute delete when not sharing ddr4_addr with write/read
            if (ddr4_delete_req && !ddr4_write_req && !ddr4_read_req) begin
                for (k = 0; k < 16; k = k + 1) begin
                    if (slot_tag_valid[k] && (slot_txfn_tag[k] == ddr4_addr)) begin
                        slot_tag_valid[k] <= 1'b0;
                    end
                end
            end

            if (ddr4_write_req) begin
                writing_state                 <= 1'b1;
                write_slot_ptr                <= alloc_wr_slot;
                write_word_ptr                <= 9'd0;
                slot_tag_valid[alloc_wr_slot] <= 1'b1;
                slot_txfn_tag[alloc_wr_slot]  <= ddr4_addr;
            end else if (ram_wr_en) begin
                if (s_axis_tlast || (write_word_ptr == LAST_WORD_IDX)) begin
                    writing_state  <= 1'b0;
                    write_word_ptr <= 9'd0;
                end else begin
                    write_word_ptr <= write_word_ptr + 9'd1;
                end
            end
        end
    end

    // Stall-Protected Retransmission Readout FSM (Emits all 478 words = 1912 Bytes)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reading_state <= 1'b0;
            read_slot_ptr <= 4'd0;
            read_word_ptr <= 9'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
        end else begin
            if (start_read_now) begin
                // Word 0 is fetched into m_axis_tdata by rd_ce on this posedge
                reading_state <= 1'b1;
                read_slot_ptr <= lookup_rd_slot;
                read_word_ptr <= 9'd0;
                m_axis_tvalid <= 1'b1;
                m_axis_tlast  <= 1'b0;
            end else if (reading_state) begin
                if (m_axis_tvalid && m_axis_tready) begin
                    if (m_axis_tlast) begin
                        reading_state <= 1'b0;
                        m_axis_tvalid <= 1'b0;
                        m_axis_tlast  <= 1'b0;
                        read_word_ptr <= 9'd0;
                    end else begin
                        read_word_ptr <= read_word_ptr + 9'd1;
                        m_axis_tlast  <= ((read_word_ptr + 9'd1) == LAST_WORD_IDX);
                    end
                end
            end
        end
    end

endmodule