// REPORT24-ARQ-TRANSPORT01: declared single CRC-field faults; no forced CRC result.
`timescale 1ns/1ps
// Finite frame store; not a FEC, serializer, timing, or capacity model of production.
module report24_frame_transport #(parameter DEPTH=16,ERROR_FIRST_DATA=0,ERROR_FIRST_HEADER=0)(
 input clk,rst_n,accept_frames,stall_enable,start,
 input[7:0]hd,input hv,input[31:0]pd,input pv,pl,output ready,
 output reg[7:0]rhd,output reg rhv,output reg[31:0]rpd,output reg rpv,
 output wire drained,output reg[31:0]committed,released,accepted_beats,emitted_beats,
 output reg[31:0]max_occupancy,output reg injected);
 reg[31:0]mem[0:DEPTH*478-1];reg[7:0]headers[0:DEPTH*16-1];
 // Independent capture oracle is read only by the output checker.
 reg[31:0]oracle[0:DEPTH*478-1];reg[7:0]oracle_h[0:DEPTH*16-1];
 integer hc,pc,dc,cycle;reg capturing,draining;integer out_frame,out_word;
 reg[31:0]offered;reg flip;
 assign ready=capturing && (!stall_enable || cycle%19>2);
 assign drained=!capturing&&!draining&&committed==released&&!rpv;
 always @(posedge clk)begin
  if(!rst_n)begin
   hc<=0;pc<=0;dc<=0;cycle<=0;capturing<=0;draining<=0;
   committed<=0;released<=0;accepted_beats<=0;emitted_beats<=0;max_occupancy<=0;injected<=0;
   rhv<=0;rpv<=0;rhd<=0;rpd<=0;out_frame<=0;out_word<=0;
  end else begin
   cycle<=cycle+1;
   if(start && accept_frames)begin
    if(capturing || committed-released>=DEPTH)$fatal(1,"TRANSPORT overflow/overlap");
    capturing<=1;hc<=0;pc<=0;
   end
   if(hv && capturing)begin
    if(hc>=16)$fatal(1,"TRANSPORT excess header");
    if(ERROR_FIRST_HEADER&&!injected&&hc==14&&headers[(committed%DEPTH)*16+4][1:0]==1)begin
      headers[(committed%DEPTH)*16+hc]<=hd^8'h01;oracle_h[(committed%DEPTH)*16+hc]<=hd^8'h01;
      injected<=1;$display("HEADER_CRC_LOCAL_INJECTION frame=%0d byte14 mask01",committed);
    end else begin headers[(committed%DEPTH)*16+hc]<=hd;oracle_h[(committed%DEPTH)*16+hc]<=hd;end hc<=hc+1;
   end
   if(pv&&ready)begin
    if(pc>=478 || pl!==(pc==477))$fatal(1,"TRANSPORT length/last frame=%0d word=%0d",committed,pc);
    flip=ERROR_FIRST_DATA&&!injected&&pc==477&&headers[(committed%DEPTH)*16+4][1:0]==1;
    offered=pd^(flip?32'h1:32'h0);
    mem[(committed%DEPTH)*478+pc]<=offered;
    // Oracle derives only from accepted TX data and declared injection location.
    oracle[(committed%DEPTH)*478+pc]<=pd^(flip?32'h1:32'h0);
    accepted_beats<=accepted_beats+1;pc<=pc+1;
    if(flip)begin injected<=1;$display("LINK_INJECT frame=%0d word=477 xor=00000001",committed);end
    if(pl)begin
     if(hc!=16)$fatal(1,"TRANSPORT header incomplete");
     committed<=committed+1;capturing<=0;
     if(committed+1-released>max_occupancy)max_occupancy<=committed+1-released;
    end
   end
   rhv<=0;rpv<=0;
   if(!draining)begin if(released<committed)begin draining<=1;dc<=0;end end
   else begin
    rpv<=1;rpd<=mem[(released%DEPTH)*478+dc];out_frame<=released;out_word<=dc;
    if(dc<16)begin rhv<=1;rhd<=headers[(released%DEPTH)*16+dc];end
    if(dc==477)begin draining<=0;released<=released+1;end else dc<=dc+1;
   end
   // Compare emitted values one cycle after RAM read assignment, as RX samples them.
   if(rpv)begin
    if(rpd!==oracle[(out_frame%DEPTH)*478+out_word])$fatal(1,"TRANSPORT altered/reordered payload");
    if(out_word<16 && (!rhv || rhd!==oracle_h[(out_frame%DEPTH)*16+out_word]))$fatal(1,"TRANSPORT header association");
    emitted_beats<=emitted_beats+1;
   end
  end
 end
endmodule
