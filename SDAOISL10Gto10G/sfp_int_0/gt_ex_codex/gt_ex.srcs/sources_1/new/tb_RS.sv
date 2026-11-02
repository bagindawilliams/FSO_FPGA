`timescale 1ns/1ps
// REPORT24-RS01, 2026-11-02 KST. Production FEC chain, finite byte transport.
// No GTH or CDC2/CDC3 claim. The transport preserves accepted bytes and residual.
// Four target frames plus a fifth genuine encoded continuation frame; no tail padding.
// FEC28-TB01: Original mask only; independent per-byte zone oracle and trace.
// The former reduced-mask <=8 assertion was a diagnostic-pattern precondition,
// not a decoder acceptance rule. Original decoded reference comparison remains.
module tb_RS;
 parameter CHANNEL_ERROR=1;
 reg clk=0,rst_n=0,eh=0,ep=0;always #2.5 clk=~clk;
 reg[7:0]hi=0;reg[63:0]pi=0;wire fv;wire[95:0]fd;
 core_tx tx(clk,rst_n,eh,ep,hi,pi,fv,fd);
 wire[71:0]pre;wire[127:0]gd;wire gv;wire[15:0]gk;
 preamble_gen pg(pre);
 mux_gearbox_128 mux(.clk(clk),.rst_n(rst_n),.preamble_data(pre),.lpc_data(fd),.lpc_valid(fv),.cdc_data(gd),.cdc_valid(gv),.cdc_keep(gk));
 reg iv=0;reg[31:0]id=0;wire ov;wire[31:0]od;
 error_inject #(.SIM_MODE(CHANNEL_ERROR),.safe_words(15),.max_error(47)) injector(clk,rst_n,iv,id,ov,od);
 reg rv=0;reg[127:0]rd=0;wire hv,pv,lock;wire[7:0]ho;wire[63:0]po;
 core_rx rx(clk,rst_n,rv,rd,hv,ho,pv,po,lock);
 reg[7:0]byteq[0:20000],postq[0:20000];integer bw=0,br=0,pw=0,pr=0;
 reg[31:0]cleanwords[0:5000];integer ci=0,co=0,masked=0,changedbytes=0,flippedbits=0;
 reg[7:0]href[0:79];reg[63:0]pref[0:1194];integer hc=0,pc=0,mismatch=0;
 integer cycle=0;reg[31:0]cmask;integer fh=0,fp=0;
 always @(posedge clk)if(rst_n)begin
  cycle=cycle+1;
  if(gv)begin
   if(gk!==16'hffff&&gk!==16'h1fff)$fatal(1,"RS_KEEP");
   for(integer b=0;b<16;b=b+1)if(b<((gk==16'hffff)?16:13))begin byteq[bw]=gd[127-8*b-:8];bw=bw+1;end
  end
  if(iv)begin cleanwords[ci]=id;ci=ci+1;end
  if(ov)begin
   if(co>=ci)$fatal(1,"RS_INJECTOR_EXTRA");cmask=injector.applied_mask;
   if(od!==(cleanwords[co]^cmask))$fatal(1,"RS_XOR_CONTRACT word=%0d",co);
   if(cmask!=0)masked=masked+1;
   for(integer b=0;b<4;b=b+1)begin
    if(cmask[8*b+:8]!=0)changedbytes=changedbytes+1;
    postq[pw]=od[31-8*b-:8];pw=pw+1;
   end
   for(integer b=0;b<32;b=b+1)if(cmask[b])flippedbits=flippedbits+1;
   co=co+1;
  end
  if(hv)begin if(hc>=80||ho!==href[hc])begin mismatch=mismatch+1;$display("RS_HEADER_FIRST_OR_NEXT_MISMATCH idx=%0d got=%h exp=%h t=%0.3f",hc,ho,href[hc],$realtime);end hc=hc+1;end
  if(pv)begin if(pc>=1195||po!==pref[pc])begin mismatch=mismatch+1;$display("RS_PAYLOAD_FIRST_OR_NEXT_MISMATCH idx=%0d got=%h exp=%h t=%0.3f",pc,po,pref[pc],$realtime);end pc=pc+1;end
 end
 // Width conversion is explicitly a TB transport. All complete words are emitted;
 // incomplete words wait for real continuation bytes. No zero tail is invented.
 always @(negedge clk)begin
  iv=0;rv=0;
  if(rst_n&&bw-br>=4)begin for(integer b=0;b<4;b=b+1)id[31-8*b-:8]=byteq[br+b];br=br+4;iv=1;end
  if(rst_n&&pw-pr>=16)begin for(integer b=0;b<16;b=b+1)rd[127-8*b-:8]=postq[pr+b];pr=pr+16;rv=1;end
 end
 initial begin
  // Synthetic FEC boundary vectors include all16header and1912payload bytes,
  // including positions occupied by CRC. CRC correctness is tested in tb_arq.
  for(integer f=0;f<5;f=f+1)begin
   for(integer i=0;i<16;i=i+1)href[f*16+i]=8'h30+f+i;
   for(integer i=0;i<239;i=i+1)pref[f*239+i]=64'h123456789abcdef0^(64'(f)<<40)^64'(i);
  end
  repeat(30)@(negedge clk);rst_n=1;
  for(integer f=0;f<5;f=f+1)begin
   // Match production CDC1: first header beat at count11, payload at167.
   for(integer i=0;i<16;i=i+1)begin @(negedge clk);eh=1;hi=href[f*16+i];end
   @(negedge clk);eh=0;repeat(139)@(negedge clk);
   for(integer i=0;i<239;i=i+1)begin @(negedge clk);ep=1;pi=pref[f*239+i];end
   @(negedge clk);ep=0;eh=0;repeat(700)@(negedge clk);
  end
  wait(hc>=64&&pc>=956);repeat(1000)@(negedge clk);
  $display("REPORT_RS_RESULT targets4 header_bytes=%0d payload_words=%0d mismatch=%0d masked_words=%0d changed_bytes=%0d flipped_bits=%0d clean_bytes=%0d injected_bytes=%0d transport_bytes=%0d",hc,pc,mismatch,masked,changedbytes,flippedbits,bw,pw,pr);
  if(mismatch||hc!=64||pc!=956)$fatal(1,"REPORT_RS_FAIL");
  $display("AUDIT_PASS REPORT_RS channel_error=%0d targets4; GTH_NOT_INCLUDED",CHANNEL_ERROR);$finish;
 end
 initial begin #100000;$fatal(1,"REPORT_RS_TIMEOUT header=%0d payload=%0d",hc,pc);end

 // BASELINE26-FEC01. Non-driving codeword/lane oracle, before RS vs decoder input.
 reg [7:0] cw_header[0:159];reg [63:0] cw_payload[0:1274];
 integer th=0,tp=0,rh=0,rp=0;integer lane_errors[0:31];integer header_errors[0:3];
 initial begin for(integer i=0;i<32;i++)lane_errors[i]=0;for(integer i=0;i<4;i++)header_errors[i]=0;end
 always @(posedge clk) if(rst_n) begin
  if(tx.encoder_dv)begin if(th>=160)$fatal(1,"CODEWORD_HEADER_EXTRA");cw_header[th]=tx.rs_head;th++;end
  if(tx.rs_load_dv)begin if(tp>=1275)$fatal(1,"CODEWORD_PAYLOAD_EXTRA");cw_payload[tp]=tx.rs_load;tp++;end
  if(rx.rs_head_dv)begin
   if(rh>=th)$fatal(1,"CODEWORD_HEADER_REFERENCE_MISSING");
   if(rh<128 && rx.rs_head!==cw_header[rh])header_errors[rh/32]++;
   rh++;
  end
  if(rx.rs_load_dv)begin
   if(rp>=tp)$fatal(1,"CODEWORD_PAYLOAD_REFERENCE_MISSING");
   if(rp<1020)for(integer lane=0;lane<8;lane++)
    if(rx.rs_load[8*lane+:8]!==cw_payload[rp][8*lane+:8])lane_errors[(rp/255)*8+lane]++;
   rp++;
  end
 end
 initial begin
  wait(pc>=956);repeat(10)@(posedge clk);
  for(integer f=0;f<4;f++)begin
   if(header_errors[f]!=0)$fatal(1,"DEMO_HEADER_NOT_PROTECTED");
   for(integer lane=0;lane<8;lane++)begin
    $display("REPORT26_RS_SYMBOLS frame=%0d lane_LSB0=%0d changed=%0d",f,lane,lane_errors[f*8+lane]);
    // Original mask may exceed t=8; record the distribution, then let the
    // unchanged decoded-data oracle determine functional PASS or FAIL.
   end
  end
  if(masked==0)$fatal(1,"DEMO_NO_ERROR_APPLIED");
 end

 reg [31:0] mask_reference[0:47];
 integer trace_fd, symbol_fd, checked_words=0, zone1_bytes=0, zone2_bytes=0, zone3_bytes=0;
 integer zone_coverage[0:239];
 reg expected_valid_d0=0,expected_valid_d1=0;
 reg [31:0] oracle_mask;
 integer absolute_byte, frame_pos, byte_offset, addr;
 initial begin
  $readmemh("error.mem",mask_reference);
  for(integer i=0;i<48;i++) if($isunknown(mask_reference[i]))$fatal(1,"FEC28_MASK_XZ index=%0d",i);
  for(integer i=0;i<240;i++)zone_coverage[i]=0;
  if(CHANNEL_ERROR!=1||injector.SIM_MODE!=1||injector.safe_words!=15||injector.max_error!=47)
    $fatal(1,"FEC28_INJECTION_CONFIGURATION");
  $display("FEC28_CONFIGURATION SIM_MODE=1 safe_words=15 max_error=47 mask_words=48 ORIGINAL_MASK");
  trace_fd=$fopen("injector_trace.tsv","w");symbol_fd=$fopen("rs_symbol_trace.tsv","w");
  if(!trace_fd||!symbol_fd)$fatal(1,"FEC28_TRACE_OPEN");
  $fdisplay(trace_fd,"time_ns\tword0\tinput\tmask\texpected_mask\toutput\tpositions_MSB0\taddresses_MSB0\tzones_MSB0");
  $fdisplay(symbol_fd,"time_ns\tframe0\tlane_LSB0\tsymbol0\texpected\tactual");
 end
 always @(posedge clk)begin
  if(!rst_n)begin expected_valid_d0<=0;expected_valid_d1<=0;end
  else begin
   if(ov!==expected_valid_d1)$fatal(1,"FEC28_VALID_LATENCY");
   expected_valid_d0<=iv;expected_valid_d1<=expected_valid_d0;
   if(ov)begin
    oracle_mask=0;
    for(integer lane=0;lane<4;lane++)begin
     absolute_byte=checked_words*4+lane;frame_pos=absolute_byte%3117;
     if(injector.applied_position[47-12*lane -:12] !== (12'(frame_pos+1)))$fatal(1,"FEC28_POSITION word=%0d lane=%0d",checked_words,lane);
     if(frame_pos>=60 && frame_pos<252)begin
      byte_offset=frame_pos-60;addr=byte_offset/4;
      oracle_mask[31-8*lane -:8]=mask_reference[addr][31-8*(byte_offset%4) -:8];
      if(injector.applied_address[63-16*lane -:16]!==16'(addr)||injector.applied_zone[7-2*lane -:2]!==2'd2)$fatal(1,"FEC28_ADDRESS_ZONE");
      zone2_bytes++;
      zone_coverage[(absolute_byte/3117)*48+addr]++;
     end else begin
      if(injector.applied_address[63-16*lane -:16]!==16'hffff)$fatal(1,"FEC28_MASK_OUTSIDE_ZONE");
      if(frame_pos<60)begin zone1_bytes++;if(injector.applied_zone[7-2*lane -:2]!==2'd1)$fatal(1,"FEC28_ZONE1");end
      else begin zone3_bytes++;if(injector.applied_zone[7-2*lane -:2]!==2'd3)$fatal(1,"FEC28_ZONE3");end
     end
    end
    if(injector.applied_mask!==oracle_mask)$fatal(1,"FEC28_MASK_ORDER word=%0d",checked_words);
    if(od!==(cleanwords[checked_words]^oracle_mask))$fatal(1,"FEC28_BYTE_XOR word=%0d",checked_words);
    $fdisplay(trace_fd,"%0.3f\t%0d\t%08h\t%08h\t%08h\t%08h\t%012h\t%016h\t%02h",$realtime,checked_words,cleanwords[checked_words],injector.applied_mask,oracle_mask,od,injector.applied_position,injector.applied_address,injector.applied_zone);
    checked_words++;
   end
  end
 end
 // Independent local symbol index avoids ordering dependencies on rp.
 // Codeword references are populated well before decoder input arrives.
 integer symbol_index=0;
 always @(posedge clk)if(rst_n && rx.rs_load_dv)begin
  if(symbol_index<1020)for(integer l=0;l<8;l++)
   if(rx.rs_load[8*l+:8]!==cw_payload[symbol_index][8*l+:8])
    $fdisplay(symbol_fd,"%0.3f\t%0d\t%0d\t%0d\t%02h\t%02h",$realtime,symbol_index/255,l,symbol_index%255,cw_payload[symbol_index][8*l+:8],rx.rs_load[8*l+:8]);
  symbol_index++;
 end
 initial begin
  wait(pc>=956);repeat(20)@(negedge clk);
  for(integer f=0;f<4;f++)for(integer a=0;a<48;a++)
   if(zone_coverage[f*48+a]!=4)$fatal(1,"FEC28_MASK_WORD_COVERAGE frame=%0d address=%0d bytes=%0d",f,a,zone_coverage[f*48+a]);
  $display("FEC28_ZONE_ORACLE_PASS checked_words=%0d zone1=%0d zone2=%0d zone3=%0d first4frames_all48mask_words",checked_words,zone1_bytes,zone2_bytes,zone3_bytes);
 end
endmodule
