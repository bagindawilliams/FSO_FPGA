`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Deskripsi: Wrapper MURNI Jembatan SFP+ (Custom 64b/66b GTH Transceiver)
//            Tanpa Error Injector (Dipisah sesuai arsitektur)
//////////////////////////////////////////////////////////////////////////////////

module fso_gth_bridge_hotswap(
    // Clock dan Reset Sistem
    input  wire        clk_312_5,
    input  wire        clk_100_drp,
    input  wire        sys_rst_n,
    
    // Pin Reference Clock Fisik 156.25 MHz
    input  wire        gt_refclk_p,
    input  wire        gt_refclk_n,
    
    // Pin Serial SFP+
    output wire [0:0]  txp_out,
    output wire [0:0]  txn_out,
    input  wire [0:0]  rxp_in,
    input  wire [0:0]  rxn_in,
    
    // Antarmuka TX (Input dari Error Injector / Encoder)
    input  wire [31:0] fso_tx_data,
    input  wire        fso_tx_en,
    
    // Antarmuka RX (Output ke SDA Decoder)
    output wire [31:0] fso_rx_data,
    output wire        fso_rx_valid, // Menandakan data valid dari Gearbox
    output wire        gth_link_up
);

    // Sinyal Clocking Transceiver
    wire        gtrefclk00_in;
    wire        txoutclk;
    wire        rxoutclk;
    wire        txusrclk;
    wire        rxusrclk;
    
    // Sinyal Reset & Status Transceiver
    wire        gtwiz_reset_tx_done;
    wire        gtwiz_reset_rx_done;
    
    // Sinyal Khusus 64b/66b Gearbox
    reg  [6:0]  tx_seq_counter;
    wire [5:0]  rx_header;
    wire [1:0]  rx_datavalid;

    // --- 1. Logika Idle TX ---
    // Jika tidak ada data yang dikirim (fso_tx_en = 0), tembakkan nol (Idle optik)
    wire [31:0] gth_tx_data_in = (fso_tx_en) ? fso_tx_data : 32'd0;

    // --- 2. Buffer Clock Fisik (156.25 MHz) ---
    IBUFDS_GTE3 u_ibufds_refclk (
        .O(gtrefclk00_in),
        .ODIV2(),
        .CEB(1'b0),
        .I(gt_refclk_p),
        .IB(gt_refclk_n)
    );

    // --- 3. Jaringan Clock Internal GTH (BUFG_GT) ---
    BUFG_GT u_bufg_tx (
        .O(txusrclk),
        .CE(1'b1),
        .CEMASK(1'b0),
        .CLR(1'b0),
        .CLRMASK(1'b0),
        .DIV(3'b000), 
        .I(txoutclk)
    );

    BUFG_GT u_bufg_rx (
        .O(rxusrclk),
        .CE(1'b1),
        .CEMASK(1'b0),
        .CLR(1'b0),
        .CLRMASK(1'b0),
        .DIV(3'b000), 
        .I(rxoutclk)
    );

    // --- 4. Generator TX Sequence untuk Gearbox 64b/66b ---
    always @(posedge txusrclk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            tx_seq_counter <= 7'd0;
        end else begin
            if (tx_seq_counter == 7'd32)
                tx_seq_counter <= 7'd0;
            else
                tx_seq_counter <= tx_seq_counter + 1'b1;
        end
    end

    // --- 5. Instansiasi GTH FSO 64b/66b ---
    gth_fso_64b66b u_gth_fso (
        .gtwiz_userclk_tx_active_in(1'b1),
        .gtwiz_userclk_rx_active_in(1'b1),
        .gtwiz_reset_clk_freerun_in(clk_100_drp),
        .gtwiz_reset_all_in(~sys_rst_n),
        
        .gtwiz_reset_tx_pll_and_datapath_in(1'b0),
        .gtwiz_reset_tx_datapath_in(1'b0),
        .gtwiz_reset_rx_pll_and_datapath_in(1'b0),
        .gtwiz_reset_rx_datapath_in(1'b0),
        
        .gtwiz_reset_rx_cdr_stable_out(),
        .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done),
        .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done),
        
        // Data input sekarang menggunakan kabel logika Idle
        .gtwiz_userdata_tx_in(gth_tx_data_in),
        .gtwiz_userdata_rx_out(fso_rx_data),
        
        .gtrefclk00_in(gtrefclk00_in),
        .qpll0outclk_out(),
        .qpll0outrefclk_out(),
        
        .txoutclk_out(txoutclk),
        .txusrclk_in(txusrclk),
        .txusrclk2_in(txusrclk), 
        
        .rxoutclk_out(rxoutclk),
        .rxusrclk_in(rxusrclk),
        .rxusrclk2_in(rxusrclk), 
        
        .txheader_in(6'b000001),        
        .txsequence_in(tx_seq_counter), 
        
        .rxgearboxslip_in(1'b0),
        .rxdatavalid_out(rx_datavalid),
        .rxheader_out(rx_header),
        .rxheadervalid_out(),
        .rxstartofseq_out(),
        
        .gtpowergood_out(),
        .txpmaresetdone_out(),
        .rxpmaresetdone_out(),
        
        .gthrxn_in(rxn_in),
        .gthrxp_in(rxp_in),
        .gthtxn_out(txn_out),
        .gthtxp_out(txp_out)
    );

    // --- 6. Pemrosesan Output untuk CDC Decoder ---
    assign fso_rx_valid = rx_datavalid[0];
    assign gth_link_up = gtwiz_reset_tx_done & gtwiz_reset_rx_done;

endmodule