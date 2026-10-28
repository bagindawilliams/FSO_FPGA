`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Virtual Wireshark (Passive AXI4-Stream Sniffer) for Testbench.
               0 LUT logic. Prints MAC and IP directly to Tcl Console.
===========================================================================
*/

module mac_ip_sniffer (
    input wire        clk,
    input wire        rst_n,
    
    input wire [31:0] s_axis_tdata,
    input wire        s_axis_tvalid,
    input wire        s_axis_tlast,
    input wire        s_axis_tready
);

    reg [47:0] dest_mac;
    reg [47:0] src_mac;
    reg [31:0] src_ip;
    reg [31:0] dest_ip;
    reg [8:0]  word_cnt;

    // synthesis translate_off
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) word_cnt <= 9'd0;
        else begin
            if (s_axis_tvalid && s_axis_tready) begin
                case (word_cnt)
                    9'd0: dest_mac[47:16] <= s_axis_tdata;
                    9'd1: begin dest_mac[15:0] <= s_axis_tdata[31:16]; src_mac[47:32] <= s_axis_tdata[15:0]; end
                    9'd2: src_mac[31:0]   <= s_axis_tdata;
                    9'd6: src_ip[31:16]   <= s_axis_tdata[15:0];
                    9'd7: begin src_ip[15:0] <= s_axis_tdata[31:16]; dest_ip[31:16] <= s_axis_tdata[15:0]; end
                    9'd8: dest_ip[15:0]   <= s_axis_tdata[31:16];
                endcase

                if (word_cnt == 9'd8) begin
                    $display("\n=================================================");
                    $display("[WIRESHARK VIRTUAL] Ethernet Frame Detected!");
                    $display("  -> DEST MAC : %02X:%02X:%02X:%02X:%02X:%02X", 
                             dest_mac[47:40], dest_mac[39:32], dest_mac[31:24], dest_mac[23:16], dest_mac[15:8], s_axis_tdata[31:24]); 
                    $display("  -> SRC IP   : %0d.%0d.%0d.%0d", 
                             src_ip[31:24], src_ip[23:16], s_axis_tdata[31:24], s_axis_tdata[23:16]); 
                    $display("=================================================\n");
                end

                if (s_axis_tlast) word_cnt <= 9'd0;
                else word_cnt <= word_cnt + 1'b1;
            end
        end
    end
    // synthesis translate_on
endmodule