`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20/08/2026 01:18:56 PM
// Design Name: 
// Module Name: fso_framer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 1 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module framer_top(
    input                 clk,             
    input                 rst_n,           
    input                 en,              
    input        [31:0]   data_in,         
    output                header_dv,       
    output                payload_dv,      
    output       [7:0]    header,          
    output       [31:0]   payload,         
    (* mark_debug = "true", keep = "true" *) output wire  [15:0]   count,
    (* mark_debug = "true", keep = "true" *) output reg            stage_indicator 
);

wire        c16_dv; 
wire  [7:0] crc_16; 
wire        c32_dv; 
wire  [31:0] crc_32; 

// Logika stage_indicator untuk memantau tahapan proses
always @(posedge clk or negedge rst_n) begin 
    if (~rst_n) begin 
        stage_indicator <= 1'b0;          
    end else begin 
        if (c32_dv) begin 
            stage_indicator <= 1'b1; 
        end else if (c16_dv) begin 
            stage_indicator <= 1'b0;       
        end
    end
end

framer framer_inst ( 
    .clk            (clk)         
    ,.rst_n         (rst_n)       
    ,.en            (en)          
    ,.data_in       (data_in)     
    ,.header_dv     (c16_dv)      
    ,.header        (crc_16)      
    ,.payload_dv    (c32_dv)      
    ,.payload       (crc_32)      
    ,.count_out     (count)       // [DIUBAH] Mengambil count asli dari dalam framer
);

crc_16 #(.max(15)) crc_16_inst( 
    .clk            (clk)         
    ,.rst_n         (rst_n)       
    ,.en            (c16_dv)      
    ,.data_in       (crc_16)      
    ,.flag          (header_dv)   
    ,.data_out      (header)      
);

crc_32 #(.max(477)) crc_32_inst( 
    .clk            (clk)         
    ,.rst_n         (rst_n)       
    ,.en            (c32_dv)      
    ,.data_in       (crc_32)      
    ,.flag          (payload_dv)  
    ,.data_out      (payload)     
);

endmodule











