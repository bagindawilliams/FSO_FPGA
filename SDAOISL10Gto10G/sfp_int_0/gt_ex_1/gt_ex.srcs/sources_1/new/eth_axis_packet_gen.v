`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Dynamic AXI4-Stream Ethernet Packet Generator.
               Features:
               - Dynamically adjustable frame size via input port.
               - Generates standard Ethernet Headers (MAC, IPv4, UDP).
               - Appends custom payload and simulated FCS (0xDEADBEEF).
===========================================================================
*/

module eth_axis_packet_gen #(
    // --- Header Configuration ---
    parameter [47:0] DEST_MAC = 48'hAA_BB_CC_DD_EE_FF, 
    parameter [47:0] SRC_MAC  = 48'h11_22_33_44_55_66, 
    parameter [31:0] SRC_IP   = {8'd192, 8'd168, 8'd10, 8'd1}, 
    parameter [31:0] DEST_IP  = {8'd192, 8'd168, 8'd10, 8'd2}, 
    
    // --- Custom Marker Payload ---
    parameter [31:0] PAYLOAD_WORD_1 = 32'h4B_6F_6F_6B, // ASCII "Kook"
    parameter [31:0] PAYLOAD_WORD_2 = 32'h6D_69_6E_20, // ASCII "min "
    parameter [31:0] PAYLOAD_WORD_3 = 32'h46_53_4F_20  // ASCII "FSO "
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        trigger,           // Trigger 1 cycle HIGH to fire
    input  wire [15:0] frame_size_bytes,  // Target size (e.g., 2000 for Jumbo)
    
    // --- AXI4-Stream Output ---
    output reg [31:0]  m_axis_tdata,
    output reg [3:0]   m_axis_tkeep,
    output reg         m_axis_tvalid,
    output reg         m_axis_tlast,
    input  wire        m_axis_tready
);

    localparam S_IDLE = 2'd0, S_DATA = 2'd1, S_DONE = 2'd2;

    reg [1:0]  state;
    reg [15:0] word_count; 
    reg [15:0] total_words;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state         <= S_IDLE;
            m_axis_tdata  <= 32'd0;
            m_axis_tkeep  <= 4'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            word_count    <= 16'd0;
            total_words   <= 16'd0;
        end else begin
            case (state)
                S_IDLE: begin
                    m_axis_tvalid <= 1'b0;
                    m_axis_tlast  <= 1'b0;
                    word_count    <= 16'd0;
                    if (trigger) begin
                        // Convert bytes to 32-bit words (divide by 4)
                        total_words <= frame_size_bytes >> 2; 
                        state       <= S_DATA;
                    end
                end

                S_DATA: begin
                    // Backpressure control: only advance if receiver is ready
                    if (m_axis_tready || !m_axis_tvalid) begin
                        m_axis_tvalid <= 1'b1;
                        m_axis_tkeep  <= 4'hF; // All 4 bytes valid

                        // Packet Assembly Multiplexer
                        case (word_count)
                            // Ethernet MAC Header
                            16'd0: m_axis_tdata <= DEST_MAC[47:16]; 
                            16'd1: m_axis_tdata <= {DEST_MAC[15:0], SRC_MAC[47:32]};
                            16'd2: m_axis_tdata <= SRC_MAC[31:0];
                            16'd3: m_axis_tdata <= 32'h0800_4500; // EtherType (IPv4) + IP Header
                            
                            // IP & UDP Headers
                            16'd4: m_axis_tdata <= 32'h002E_0000; 
                            16'd5: m_axis_tdata <= 32'h4000_4011; // Protocol UDP
                            16'd6: m_axis_tdata <= {16'h0000, SRC_IP[31:16]}; 
                            16'd7: m_axis_tdata <= {SRC_IP[15:0], DEST_IP[31:16]}; 
                            16'd8: m_axis_tdata <= {DEST_IP[15:0], 16'h1234}; 
                            
                            // Payload Data
                            16'd9:  m_axis_tdata <= PAYLOAD_WORD_1; 
                            16'd10: m_axis_tdata <= PAYLOAD_WORD_2; 
                            16'd11: m_axis_tdata <= PAYLOAD_WORD_3; 
                            
                            // End of Frame & Padding
                            (total_words - 1): m_axis_tdata <= 32'hDEADBEEF; // Simulated FCS
                            default: m_axis_tdata <= {16'hAAAA, word_count}; // Dummy Jumbo Data
                        endcase

                        // Frame termination logic
                        if (word_count == (total_words - 1)) begin
                            m_axis_tlast <= 1'b1;
                            state        <= S_DONE;
                        end else begin
                            m_axis_tlast <= 1'b0;
                            word_count   <= word_count + 1'b1;
                        end
                    end
                end

                S_DONE: begin
                    // Wait for last word to be accepted
                    if (m_axis_tready && m_axis_tvalid) begin
                        m_axis_tvalid <= 1'b0;
                        m_axis_tlast  <= 1'b0;
                        state         <= S_IDLE;
                    end
                end
            endcase
        end
    end
endmodule