`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : ARQ DDR4 Memory Wrapper (Pre-AXI4 MIG IP Core integration).
               Acts as the ARQ Retransmit RAM interface.
               - Captures 1912 Bytes (478 words) on ddr4_write_req.
               - Streams out 1912 Bytes on ddr4_read_req.
               - Frees memory sectors on ddr4_delete_req.
===========================================================================
*/

module arq_ddr4_wrapper #(
    parameter MAX_FRAMES = 16,        // Maximum concurrent frames in RAM
    parameter FRAME_WORDS = 478       // 1912 Bytes = 478 Words (32-bit)
)(
    input  wire        clk,
    input  wire        rst_n,

    // Control Interface from arq_tx_controller.v
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // AXI-Stream Write Port (Sniffing output of fso_crc_32.v)
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    input  wire        s_axis_tready, // Sniffing upstream ready state

    // AXI-Stream Read Port (Output to fso_payload_mux.v during Retx)
    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready
);

    // =======================================================
    // Internal BRAM Storage (Will be replaced by AXI4 MIG)
    // =======================================================
    reg [31:0]  ram_storage [0:(MAX_FRAMES * FRAME_WORDS)-1];
    
    // Status Trackers
    reg         write_active;
    reg [15:0]  write_word_cnt;
    reg [31:0]  write_base_addr;

    reg         read_active;
    reg [15:0]  read_word_cnt;
    reg [31:0]  read_base_addr;

    // =======================================================
    // WRITE FSM (Capturing FSO Frame to RAM)
    // =======================================================
    wire data_fire = s_axis_tvalid && s_axis_tready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            write_active   <= 1'b0;
            write_word_cnt <= 16'd0;
            write_base_addr<= 32'd0;
        end else begin
            // Trigger Write Process
            if (ddr4_write_req) begin
                write_active    <= 1'b1;
                write_word_cnt  <= 16'd0;
                // Masking address to fit MAX_FRAMES circular buffer
                write_base_addr <= (ddr4_addr % MAX_FRAMES) * FRAME_WORDS;
            end

            // Capture Data if active
            if (write_active && data_fire) begin
                ram_storage[write_base_addr + write_word_cnt] <= s_axis_tdata;
                write_word_cnt <= write_word_cnt + 1'b1;
                
                // End of Frame
                if (s_axis_tlast || write_word_cnt == FRAME_WORDS - 1) begin
                    write_active <= 1'b0;
                end
            end
        end
    end

    // =======================================================
    // READ FSM (Streaming FSO Frame from RAM)
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            read_active   <= 1'b0;
            read_word_cnt <= 16'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tdata  <= 32'd0;
        end else begin
            if (ddr4_read_req && !read_active) begin
                read_active    <= 1'b1;
                read_word_cnt  <= 16'd0;
                read_base_addr <= (ddr4_addr % MAX_FRAMES) * FRAME_WORDS;
            end

            if (read_active) begin
                m_axis_tvalid <= 1'b1;
                m_axis_tdata  <= ram_storage[read_base_addr + read_word_cnt];
                
                // Assert tlast on the final word
                m_axis_tlast  <= (read_word_cnt == FRAME_WORDS - 1);

                if (m_axis_tready) begin
                    if (read_word_cnt == FRAME_WORDS - 1) begin
                        read_active   <= 1'b0;
                        m_axis_tvalid <= 1'b0;
                        m_axis_tlast  <= 1'b0;
                    end else begin
                        read_word_cnt <= read_word_cnt + 1'b1;
                    end
                end
            end else begin
                m_axis_tvalid <= 1'b0;
                m_axis_tlast  <= 1'b0;
            end
        end
    end

endmodule