`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : FSO AXI-Stream Synchronous FIFO.
               Configurable depth. Designed to be instantiated as:
               - fifo_data  (Buffers normal Payload traffic)
               - fifo_idle  (Buffers PRBS Idle traffic)
               - fifo_mgmt  (Buffers Telemetry/PNT traffic)
Revision Notes:
               - Separated the 'mem' array write operation into a dedicated 
                 'always @(posedge clk)' block without asynchronous reset so 
                 Vivado infers Distributed LUTRAM cleanly.
===========================================================================
*/

module fso_axis_fifo #(
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DEPTH      = FIFO_DEPTH,
    parameter PTR_WIDTH  = ADDR_WIDTH
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // AXI-Stream Slave (Write Side)
    input  wire [DATA_WIDTH-1:0] s_axis_tdata,
    input  wire                  s_axis_tvalid,
    input  wire                  s_axis_tlast,
    output wire                  s_axis_tready,

    // AXI-Stream Master (Read Side)
    output wire [DATA_WIDTH-1:0] m_axis_tdata,
    output wire                  m_axis_tvalid,
    output wire                  m_axis_tlast,
    input  wire                  m_axis_tready
);

    (* ram_style = "distributed" *) reg [DATA_WIDTH:0] mem [0:FIFO_DEPTH-1];

    reg [ADDR_WIDTH-1:0] wr_ptr;
    reg [ADDR_WIDTH-1:0] rd_ptr;
    reg [ADDR_WIDTH:0]   count;

    wire full  = (count == FIFO_DEPTH);
    wire empty = (count == 0);

    assign s_axis_tready = !full;
    assign m_axis_tvalid = !empty;

    wire [DATA_WIDTH:0] head_word = mem[rd_ptr];
    assign m_axis_tdata = m_axis_tvalid ? head_word[DATA_WIDTH-1:0] : {DATA_WIDTH{1'b0}};
    assign m_axis_tlast = m_axis_tvalid ? head_word[DATA_WIDTH]     : 1'b0;

    wire wr_en = s_axis_tvalid && s_axis_tready;
    wire rd_en = m_axis_tvalid && m_axis_tready;

    // Purely Synchronous RAM Write
    always @(posedge clk) begin
        if (wr_en) begin
            mem[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
        end
    end

    // Pointer and Occupancy Control Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= {ADDR_WIDTH{1'b0}};
            rd_ptr <= {ADDR_WIDTH{1'b0}};
            count  <= {(ADDR_WIDTH+1){1'b0}};
        end else begin
            if (wr_en) begin
                wr_ptr <= wr_ptr + 1'b1;
            end
            if (rd_en) begin
                rd_ptr <= rd_ptr + 1'b1;
            end
            case ({wr_en, rd_en})
                2'b10:   count <= count + 1'b1;
                2'b01:   count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

endmodule