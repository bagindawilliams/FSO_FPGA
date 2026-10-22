`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_rx_reorder_ddr4_wrapper
Description  : Selective Repeat ARQ Receiver Reorder Buffer (Data Plane).
               
               SDA OISL TABLE 2-11 & SDA OCT COMPLIANCE:
               - Implements the Selective Repeat ARQ receiver sliding window
                 and in-order delivery buffer (inspired by SDA OCT) while 
                 strictly adhering to SDA OISL Table 2-11 parameters:
                 * ARQ_HOLDOFF_CFG        = 8'd255 (8-bit register: 1..255)
                 * ARQ_HOLDOFF_MULT       = 16     (Table 2-11 'times 16' step,
                                                    configurable to 32 or 64)
                 * ARQ_HOLDOFF_MAX_FRAMES = 4080   (255 x 16 frames = 10.174 ms)
                 * ARQ_MAX_RETX           = 3'd5   (Max retransmission retries)
               
               KEY HARDWARE OPERATIONS:
               1. Stores incoming verified 1908-Byte (477-word) DATA frames 
                  into a circular Block RAM indexed by rx_txfn_in[3:0].
               2. Maintains the receiver sequence counter 'expected_txfn'.
               3. If an out-of-order frame arrives (e.g., TXFN=3 arrives while 
                  TXFN=2 failed CRC-32 and is awaiting retransmission), buffers 
                  TXFN=3 in slot 3 and holds egress until TXFN=2 arrives.
               4. Once TXFN=2 is received, drains TXFN=2 (1908 Bytes) followed 
                  immediately by TXFN=3 (1908 Bytes) in strict sequence order 
                  to ethernet_frame_reassembly.v.
===========================================================================
*/

module arq_rx_reorder_ddr4_wrapper #(
    parameter [7:0] ARQ_HOLDOFF_CFG  = 8'd255, // SDA OISL Table 2-11 (1..255)
    parameter       ARQ_HOLDOFF_MULT = 16,     // Table 2-11: 16 (or 32 / 64 for extended range)
    parameter [2:0] ARQ_MAX_RETX     = 3'd5,   // Table 2-11: Default 5 retries (range 0..7)
    parameter       NUM_SLOTS        = 16      // Active circular window slots in BRAM
)(
    input  wire        clk,                    // 312.5 MHz Clock
    input  wire        rst_n,                  // Active-low reset

    // Verified 1908-Byte (477-word) DATA Frame Input from frame_demultiplexer
    input  wire [31:0] s_axis_data_tdata,
    input  wire        s_axis_data_tvalid,
    input  wire        s_axis_data_tlast,
    input  wire [15:0] rx_txfn_in,

    // Non-Data (IDLE / MGMT) sequence advancement from arq_rx_controller
    input  wire        non_data_seq_adv,
    input  wire [15:0] non_data_txfn,

    // In-Order 1908-Byte (477-word) DATA Stream Output to ethernet_frame_reassembly
    output reg  [31:0] m_axis_ord_tdata,
    output reg         m_axis_ord_tvalid,
    output reg         m_axis_ord_tlast,
    input  wire        m_axis_ord_tready,

    // Diagnostic & Table 2-11 Status Outputs
    output reg  [15:0] expected_txfn,
    output wire [15:0] arq_holdoff_frames_out, // Displays 4080 (for 255 x 16)
    output reg  [15:0] in_order_drained_cnt,
    output reg  [15:0] out_of_order_buffered_cnt
);

    // =======================================================
    // 1. SDA OISL TABLE 2-11 PARAMETER CALCULATION
    // =======================================================
    localparam [15:0] HOLDOFF_FRAMES_CALC = ARQ_HOLDOFF_CFG * ARQ_HOLDOFF_MULT;
    assign arq_holdoff_frames_out = HOLDOFF_FRAMES_CALC;

    // =======================================================
    // 2. DUAL-PORT BLOCK RAM STORAGE (16 Slots x 512 Words = 8192 Words)
    // =======================================================
    (* ram_style = "block" *) reg [31:0] reorder_ram [0:8191];

    reg [15:0] slot_valid;
    reg [15:0] slot_txfn [0:15];
    reg        sync_initialized;

    // Write Address Generation
    reg  [8:0]  wr_word_cnt;
    wire [3:0]  wr_slot    = rx_txfn_in[3:0];
    wire [12:0] bram_waddr = {wr_slot, wr_word_cnt};

    // Read Address Generation
    reg         draining_slot;
    reg  [8:0]  rd_word_cnt;
    wire [3:0]  rd_slot    = expected_txfn[3:0];
    wire [12:0] bram_raddr = {rd_slot, rd_word_cnt};
    reg  [31:0] bram_dout;

    // Purely Synchronous Block RAM Read & Write (Required for Vivado BRAM inference)
    always @(posedge clk) begin
        if (s_axis_data_tvalid) begin
            reorder_ram[bram_waddr] <= s_axis_data_tdata;
        end
        bram_dout <= reorder_ram[bram_raddr];
    end

    // =======================================================
    // 3. SELECTIVE REPEAT SLIDING-WINDOW CONTROL FSM
    // =======================================================
    reg drain_d1;
    reg last_d1;
    integer i;

    wire current_expected_ready = sync_initialized &&
                                  slot_valid[rd_slot] &&
                                  (slot_txfn[rd_slot] == expected_txfn);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            slot_valid                <= 16'd0;
            for (i = 0; i < 16; i = i + 1) begin
                slot_txfn[i]          <= 16'd0;
            end
            sync_initialized          <= 1'b0;
            expected_txfn             <= 16'd1;
            wr_word_cnt               <= 9'd0;
            draining_slot             <= 1'b0;
            rd_word_cnt               <= 9'd0;
            drain_d1                  <= 1'b0;
            last_d1                   <= 1'b0;
            m_axis_ord_tvalid         <= 1'b0;
            m_axis_ord_tlast          <= 1'b0;
            m_axis_ord_tdata          <= 32'd0;
            in_order_drained_cnt      <= 16'd0;
            out_of_order_buffered_cnt <= 16'd0;
        end else begin
            // A. Initial Sequence Lock & Non-Data (IDLE/MGMT) Pointer Advancement
            if (!sync_initialized) begin
                if (s_axis_data_tvalid && (wr_word_cnt == 9'd0)) begin
                    sync_initialized <= 1'b1;
                    if (rx_txfn_in == 16'd0)
                        expected_txfn <= 16'd0;
                    else
                        expected_txfn <= 16'd1;
                end else if (non_data_seq_adv) begin
                    sync_initialized <= 1'b1;
                    expected_txfn    <= non_data_txfn + 16'd1;
                end
            end else if (non_data_seq_adv && (non_data_txfn == expected_txfn) && !draining_slot) begin
                expected_txfn <= expected_txfn + 16'd1;
            end

            // B. Write Incoming 477-Word (1908-Byte) Verified DATA Frame into Slot
            if (s_axis_data_tvalid) begin
                if (s_axis_data_tlast || (wr_word_cnt == 9'd476)) begin
                    wr_word_cnt         <= 9'd0;
                    slot_valid[wr_slot] <= 1'b1;
                    slot_txfn[wr_slot]  <= rx_txfn_in;

                    if (rx_txfn_in != expected_txfn) begin
                        out_of_order_buffered_cnt <= out_of_order_buffered_cnt + 16'd1;
                    end
                end else begin
                    wr_word_cnt <= wr_word_cnt + 9'd1;
                end
            end else begin
                wr_word_cnt <= 9'd0;
            end

            // C. In-Order Read FSM: Drains Slot [expected_txfn] Only When Ready
            if (!draining_slot) begin
                drain_d1 <= 1'b0;
                last_d1  <= 1'b0;
                if (current_expected_ready && m_axis_ord_tready) begin
                    draining_slot <= 1'b1;
                    rd_word_cnt   <= 9'd0;
                end
            end else begin
                if (m_axis_ord_tready) begin
                    drain_d1 <= 1'b1;
                    last_d1  <= (rd_word_cnt == 9'd476);

                    if (rd_word_cnt == 9'd476) begin
                        draining_slot        <= 1'b0;
                        rd_word_cnt          <= 9'd0;
                        slot_valid[rd_slot]  <= 1'b0;
                        expected_txfn        <= expected_txfn + 16'd1;
                        in_order_drained_cnt <= in_order_drained_cnt + 16'd1;
                    end else begin
                        rd_word_cnt <= rd_word_cnt + 9'd1;
                    end
                end
            end

            // D. 1-Cycle BRAM Read Output Registration
            if (m_axis_ord_tready) begin
                m_axis_ord_tvalid <= drain_d1;
                m_axis_ord_tlast  <= drain_d1 && last_d1;
                m_axis_ord_tdata  <= drain_d1 ? bram_dout : 32'd0;
            end
        end
    end

endmodule