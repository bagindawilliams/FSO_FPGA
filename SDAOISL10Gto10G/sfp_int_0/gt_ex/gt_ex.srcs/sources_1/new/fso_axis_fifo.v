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
===========================================================================
*/

module fso_axis_fifo #(
    parameter FIFO_DEPTH = 1024,
    parameter ADDR_WIDTH = 10     // log2(FIFO_DEPTH)
)(
    input  wire        clk,
    input  wire        rst_n,

    // AXI-Stream Write Interface
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,

    // AXI-Stream Read Interface
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    // Memory Array (33 bits: 1 bit tlast, 32 bits tdata)
    reg [32:0] mem [0:FIFO_DEPTH-1];

    reg [ADDR_WIDTH-1:0] wr_ptr;
    reg [ADDR_WIDTH-1:0] rd_ptr;
    reg [ADDR_WIDTH:0]   count;

    wire full  = (count == FIFO_DEPTH);
    wire empty = (count == 0);

    // Assignments
    assign s_axis_tready = ~full;
    assign m_axis_tvalid = ~empty;
    assign m_axis_tdata  = mem[rd_ptr][31:0];
    assign m_axis_tlast  = mem[rd_ptr][32];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
        end else begin
            // Write Operation
            if (s_axis_tvalid && s_axis_tready) begin
                mem[wr_ptr] <= {s_axis_tlast, s_axis_tdata};
                wr_ptr <= wr_ptr + 1'b1;
            end

            // Read Operation
            if (m_axis_tvalid && m_axis_tready) begin
                rd_ptr <= rd_ptr + 1'b1;
            end

            // Count Management
            case ({ (s_axis_tvalid && s_axis_tready), (m_axis_tvalid && m_axis_tready) })
                2'b10: count <= count + 1'b1; // Write only
                2'b01: count <= count - 1'b1; // Read only
                default: count <= count;      // Write & Read or None
            endcase
        end
    end
endmodule