`timescale 1ns/1ps
// REPORT24-ARQ01: one packet, production CRC/framer/RAM/reorder; no FEC/GTH.
// Derived from verify02 finite-frame transport; original audit source is preserved.
module tb_arq;
parameter CASE=0; // 0 clean,1 payload CRC fault,2 header CRC fault

reg clk=0;always #1.551515 clk=~clk;
reg rst_n=0,trig=0,mgmt=0;wire[31:0]gd,xd,sd,pd,od,ed;wire[3:0]gkeep,xc;wire gv,gl,gr,sv,sl,sr,pv,pl,ov,ol,orr,ev,el;wire[13:0]sb;wire[7:0]hd;wire hv,hl;
reg[31:0]expected[0:4095];integer sent=0,recv=0,packets=0,rw=0,errors=0,hc=0,pc=0,frames=0,ids=0,datas=0,mgmts=0,retries=0,segw=0,segs=0,crcerrors=0,iderrors=0;
parameter PEER=0;
parameter FAST=0;
reg accept_forward=1,accept_backward=1;
wire injected;
wire forward_drained,backward_drained;
wire[31:0]fc,frc,fa,fe,fmax,bc,brc,ba,be,bmax;
integer outstanding=0,mgmt_deliveries=0,peer_events=0;
wire[15:0]back_lf,back_pf;wire back_la,back_lv,back_pa,back_pv;
wire[31:0]bpd,blpd;wire[7:0]bhd,blhd;wire bhv,bpv,bpl,bready,blhv,blpv;
reg [15:0] packet_size=2000;
integer cyc=0;always @(posedge clk)cyc<=cyc+1;
wire ready_pld;
integer packet_words[0:3];
initial begin packet_words[0]=500;packet_words[1]=500;packet_words[2]=16;packet_words[3]=379;end
wire[15:0]lf,pf;wire la,lv,pa,pav,hgood,pgood,mv;
eth_axis_packet_gen gen(.clk(clk),.rst_n(rst_n),.trigger(trig),.frame_size_bytes(packet_size),.m_axis_tdata(gd),.m_axis_tkeep(gkeep),.m_axis_tvalid(gv),.m_axis_tlast(gl),.m_axis_tready(gr));
xgmii_tx_encoder xenc(.clk(clk),.rst_n(rst_n),.s_axis_tdata(gd),.s_axis_tkeep(gkeep),.s_axis_tvalid(gv),.s_axis_tlast(gl),.s_axis_tready(gr),.xgmii_txd(xd),.xgmii_txc(xc));
eth_rx_front_end_top #(.RUN_MODE(1)) front(.clk(clk),.rst_n(rst_n),.xgmii_rxd(xd),.xgmii_rxc(xc),.fso_data_out(sd),.fso_valid(sv),.fso_last(sl),.fso_ready(sr),.seg_valid_bytes(sb),.refclk_p(1'b0),.refclk_n(1'b1),.reset(1'b0),.dclk(1'b0),.rxp(1'b0),.rxn(1'b1));
ethernet_fso_framer #(.LOOPBACK_ARQ_DIRECT(!PEER),.ARQ_SIM_SCALE_ENABLE(FAST),.ARQ_HOLDOFF_CFG(1),.ARQ_HOLDOFF_MULT(16)) fr(.clk(clk),.rst_n(rst_n),.s_axis_eth_tdata(sd),.s_axis_eth_tvalid(sv),.s_axis_eth_tlast(sl),.s_axis_eth_tready(sr),.seg_valid_bytes(sb),.mgmt_trigger_1hz(mgmt),.rx_phy_ts_sec(6'd15),.rx_phy_ts_picosec(40'd16678204759),.tx_phy_ts_sec(6'd15),.tx_phy_ts_picosec(40'd0),.range_meters(64'h415312d000000000),.range_ts_sec(32'd1476000000),.range_ts_picosec(40'd0),.ts_valid(1'b1),.tod_seconds_in(6'd15),.fcch_opcode(4'hf),.fcch_pl(16'hffff),.rx_rxfn_in(PEER?back_lf:lf),.rx_ack_in(PEER?back_la:la),.rx_ack_valid_in(PEER?back_lv:lv),.peer_rxfn_in(back_pf),.peer_ack_in(back_pa),.peer_ack_valid_in(back_pv),.m_axis_hdr_tdata(hd),.m_axis_hdr_tvalid(hv),.m_axis_hdr_tlast(hl),.m_axis_hdr_tready(1'b1),.m_axis_fso_tdata(pd),.m_axis_fso_tvalid(pv),.m_axis_fso_tlast(pl),.m_axis_fso_tready(ready_pld),.eth_data_error_flag());
wire[7:0]link_hd;wire link_hv,link_pv;wire[31:0]link_pd;
report24_frame_transport #(.ERROR_FIRST_DATA(CASE==1),.ERROR_FIRST_HEADER(CASE==2)) forward_link(.clk(clk),.rst_n(rst_n),.accept_frames(accept_forward),.stall_enable(1'b1),.start(fr.tx_trigger_gen),.hd(hd),.hv(hv),.pd(pd),.pv(pv),.pl(pl),.ready(ready_pld),.rhd(link_hd),.rhv(link_hv),.rpd(link_pd),.rpv(link_pv),.drained(forward_drained),.committed(fc),.released(frc),.accepted_beats(fa),.emitted_beats(fe),.max_occupancy(fmax),.injected(injected));
// Terminal B builds a real return header from its local CRC feedback.
ethernet_fso_framer #(.LOOPBACK_ARQ_DIRECT(0),.ARQ_SIM_SCALE_ENABLE(FAST),.ARQ_HOLDOFF_CFG(1),.ARQ_HOLDOFF_MULT(16)) back_tx(
 .clk(clk),.rst_n(rst_n),.s_axis_eth_tdata(32'd0),.s_axis_eth_tvalid(1'b0),.s_axis_eth_tlast(1'b0),.s_axis_eth_tready(),.seg_valid_bytes(14'd0),.mgmt_trigger_1hz(1'b0),
 .rx_phy_ts_sec(6'd0),.rx_phy_ts_picosec(40'd0),.tx_phy_ts_sec(6'd0),.tx_phy_ts_picosec(40'd0),.range_meters(64'd0),.range_ts_sec(32'd0),.range_ts_picosec(40'd0),.ts_valid(1'b0),.tod_seconds_in(6'd0),.fcch_opcode(4'd0),.fcch_pl(16'd0),
 .rx_rxfn_in(lf),.rx_ack_in(la),.rx_ack_valid_in(lv),.peer_rxfn_in(pf),.peer_ack_in(pa),.peer_ack_valid_in(pav),
 .m_axis_hdr_tdata(bhd),.m_axis_hdr_tvalid(bhv),.m_axis_hdr_tlast(),.m_axis_hdr_tready(1'b1),.m_axis_fso_tdata(bpd),.m_axis_fso_tvalid(bpv),.m_axis_fso_tlast(bpl),.m_axis_fso_tready(bready),.eth_data_error_flag());
report24_frame_transport backward_link(.clk(clk),.rst_n(rst_n),.accept_frames(accept_backward),.stall_enable(1'b0),.start(back_tx.tx_trigger_gen),.hd(bhd),.hv(bhv),.pd(bpd),.pv(bpv),.pl(bpl),.ready(bready),.rhd(blhd),.rhv(blhv),.rpd(blpd),.rpv(blpv),.drained(backward_drained),.committed(bc),.released(brc),.accepted_beats(ba),.emitted_beats(be),.max_occupancy(bmax),.injected());
// Terminal A parses B's returned header before feeding its peer tracker.
fso_ethernet_deframer back_rx(.clk(clk),.rst_n(rst_n),.s_axis_hdr_tvalid(blhv),.s_axis_hdr_tdata(blhd),.s_axis_fso_tvalid(blpv),.s_axis_fso_tdata(blpd),.m_axis_fso_tdata(),.m_axis_fso_tvalid(),.m_axis_fso_tlast(),.m_axis_fso_tready(1'b1),.local_fb_rxfn(back_lf),.local_fb_ack(back_la),.local_fb_ack_valid(back_lv),.peer_rxfn_out(back_pf),.peer_ack_out(back_pa),.peer_ack_valid_out(back_pv),.hdr_crc_ok(),.pld_crc_ok(),.rx_txfn(),.rx_frame_type(),.rx_tx_ts(),.rx_fcch_op(),.rx_fcch_pl(),.mgmt_range_meters(),.mgmt_telemetry_valid(),.expected_txfn());
reg[31:0] replay_oracle[0:16*478-1];reg[15:0]replay_tag[0:15];reg[15:0]replay_valid=0;
integer oslot=0,free_oracle=0;integer drops=0;
wire[3:0] actual_write_slot=fr.u_fso_payload_top.u_fso_payload.u_arq_ddr4_wrapper.alloc_wr_slot;
wire[3:0] actual_read_slot=fr.u_fso_payload_top.u_fso_payload.u_arq_ddr4_wrapper.lookup_rd_slot;
always @(posedge clk)if(rst_n)begin
 if(fr.u_arq_tx_controller.drop_del_req)begin drops++;$fatal(1,"ARQ_UNEXPECTED_RETRY_DROP");end
 if(fr.ddr4_write_req)$display("RAM_WRITE tag=%0d actual_slot=%0d",fr.tx_txfn_out,actual_write_slot);
 if(fr.ddr4_read_req)$display("RAM_REPLAY tag=%0d actual_slot=%0d",fr.tx_txfn_out,actual_read_slot);
 if(fr.ddr4_delete_req)$display("RAM_DELETE controller_addr=%0d",fr.ddr4_addr);
end
// BASELINE26-MON01: Observe the production timer decrement enable in both timer modes.
// Non-driving monitor only; original payload, CRC and replay assertions are retained.
integer cause[0:3];integer selected_cause=0;integer replay_n=0;
always @(posedge clk) if (!rst_n) begin
 for(integer k=0;k<4;k++) cause[k]=0;
 selected_cause=0;
end
always @(posedge clk)if(rst_n)begin
 outstanding=0;
 for(integer k=0;k<4;k++)begin
  if(fr.u_arq_tx_controller.track_valid[k])outstanding++;
  if(fr.u_arq_tx_controller.track_valid[k] && fr.u_arq_tx_controller.track_timer[k]==1 && fr.u_arq_tx_controller.timer_tick_en)cause[k]=1;
 end
 if(fr.tracker_valid_in && !fr.tracker_ack_in && fr.u_arq_tx_controller.ack_hit_found)
  cause[fr.u_arq_tx_controller.ack_hit_index]=2;
 if(fr.u_arq_tx_controller.state==fr.u_arq_tx_controller.S_ARBITRATE && fr.u_arq_tx_controller.retx_needed)
  selected_cause=cause[fr.u_arq_tx_controller.retx_index];
 if(fr.ddr4_read_req)begin replay_n++;
  $display("REPLAY_EVENT n=%0d cycle=%0d fn=%0d cause=%0d (1=timer_expiry,2=NAK) holdoff=%0d fast=%0d",replay_n,cyc,fr.tx_txfn_out,selected_cause,fr.u_arq_tx_controller.active_holdoff_limit,FAST);
 end
 if(mv)mgmt_deliveries++;
 if(back_pv)begin peer_events++;$display("PEER_HEADER_PARSED fn=%0d ack=%b",back_pf,back_pa);end
 if(pv&&ready_pld && fr.frame_type_out!=0)begin
  if(forward_link.pc==0)begin
   oslot=-1;for(integer k=0;k<16;k++)if(replay_valid[k]&&replay_tag[k]==fr.tx_txfn_out)oslot=k;
   if(fr.payload_mux_sel==3 && oslot<0)$fatal(1,"REPLAY_UNKNOWN_ID");
   if(oslot<0)begin oslot=free_oracle;free_oracle++;if(oslot>=16)$fatal(1,"ORACLE_CAPACITY");replay_valid[oslot]=1;replay_tag[oslot]=fr.tx_txfn_out;end
  end
  if(fr.payload_mux_sel==3)begin
   if(pd!==replay_oracle[oslot*478+forward_link.pc])$fatal(1,"REPLAY_BYTE word=%0d",forward_link.pc);
  end else replay_oracle[oslot*478+forward_link.pc]=pd;
 end
end
reg was_stalled=0;reg [32:0]held;
always @(posedge clk)if(rst_n)begin
 if(was_stalled && (!pv || {pl,pd}!==held))$fatal(1,"TX changed while stalled");
 was_stalled<=pv&&!ready_pld;held<={pl,pd};
end
fso_ethernet_deframer rx(.clk(clk),.rst_n(rst_n),.s_axis_hdr_tvalid(link_hv),.s_axis_hdr_tdata(link_hd),.s_axis_fso_tvalid(link_pv),.s_axis_fso_tdata(link_pd),.m_axis_fso_tdata(od),.m_axis_fso_tvalid(ov),.m_axis_fso_tlast(ol),.m_axis_fso_tready(orr),.local_fb_rxfn(lf),.local_fb_ack(la),.local_fb_ack_valid(lv),.peer_rxfn_out(pf),.peer_ack_out(pa),.peer_ack_valid_out(pav),.hdr_crc_ok(hgood),.pld_crc_ok(pgood),.rx_txfn(),.rx_frame_type(),.rx_tx_ts(),.rx_fcch_op(),.rx_fcch_pl(),.mgmt_range_meters(),.mgmt_telemetry_valid(mv),.expected_txfn());
ethernet_frame_reassembly reasm(.clk(clk),.rst_n(rst_n),.s_axis_fso_tdata(od),.s_axis_fso_tvalid(ov),.s_axis_fso_tlast(ol),.s_axis_fso_tready(orr),.m_axis_eth_tdata(ed),.m_axis_eth_tvalid(ev),.m_axis_eth_tlast(el),.m_axis_eth_tready(1'b1),.reassembled_pkt_bytes(),.reassembled_pkt_cnt());
// CRC decisions come from production modules, never a forced crc_ok signal.
integer bad_headers=0,bad_payloads=0,ack_events=0,nak_events=0;
integer valid_data_checks=0,reorder_hold_seen=0;reg invalid_header_pending=0;
reg[15:0]first_data_id=0;reg first_data_seen=0,first_recovered=0;
always @(posedge clk)if(rst_n)begin
 if(rx.u_deframer.hdr_check_done)begin
  invalid_header_pending=!hgood;
  if(!hgood)bad_headers++;
  if(hgood&&rx.u_deframer.active_ing_ftype==1&&!first_data_seen)begin first_data_seen=1;first_data_id=rx.u_deframer.active_ing_txfn;end
  $display("CRC16_DECISION t=%0.3f ok=%b raw_txfn_untrusted_if_invalid=%0d",$realtime,hgood,rx.rx_txfn);
 end
 if(rx.u_deframer.pld_check_done)begin
  if(!pgood)bad_payloads++;
  if(rx.u_deframer.active_ing_hdr_ok&&rx.u_deframer.active_ing_ftype==1&&pgood)begin
   valid_data_checks++;
   if(CASE==1&&rx.u_deframer.active_ing_txfn!=first_data_id&&!first_recovered)begin reorder_hold_seen++;$display("REORDER_SECOND_BEFORE_FIRST fn=%0d",rx.u_deframer.active_ing_txfn);end
   if(rx.u_deframer.active_ing_txfn==first_data_id)first_recovered=1;
  end
  $display("CRC32_DECISION t=%0.3f hdr_ok=%b payload_ok=%b fn=%0d",$realtime,rx.u_deframer.active_ing_hdr_ok,pgood,rx.u_deframer.active_ing_txfn);
 end
 if(lv)begin
  if(invalid_header_pending)$fatal(1,"INVALID_HEADER_USED_FOR_FEEDBACK");
  if(la)ack_events++;else nak_events++;
 end
 if(CASE==1&&ov&&!first_recovered)$fatal(1,"REORDER_EARLY_DELIVERY");
end
reg[7:0]header[0:15];reg[1:0]ft;reg[15:0]fn;reg[24:0]prbs;reg[31:0]crc,iw;
function[31:0] crcword(input[31:0] c,input[31:0] d);reg[31:0]q;begin q=c;for(integer b=31;b>=0;b--)q={q[30:0],1'b0}^((q[31]^d[b])?32'h04c11db7:0);crcword=q;end endfunction
always @(posedge clk)if(rst_n)begin
 if(lv)$display("FEEDBACK fn=%0d ack=%b hdr=%b crc=%b",lf,la,hgood,pgood);
 if(gv&&gr)begin if(sent<4096)expected[sent]=gd;sent++;if(gkeep!==15)errors++;end
 if(sv&&sr)begin segw++;if(sl)begin $display("SEGMENT n=%0d beats=%0d metadata=%0d",segs,segw,sb);segs++;segw=0;end end
 if(hv)begin header[hc]=hd;if(hc==15)begin hc=0;end else hc++;end
 if(pv && ready_pld)begin
  if(pc==0)begin
   ft=fr.frame_type_out;fn=fr.tx_txfn_out;prbs={9'd0,fn}+1;crc=0;
   if(ft==0)ids++;else if(ft==1)datas++;else if(ft==2)mgmts++;
   if(fr.payload_mux_sel==3)retries++;
  end
  if(pc<477)begin
   crc=crcword(crc,pd);
   if(ft==0)begin
    for(integer b=31;b>=0;b--)begin iw[b]=prbs[0];prbs={prbs[0]^prbs[3],prbs[24:1]};end
    if(pd!==iw)begin if(iderrors<3)$display("IDLE_MISMATCH TXFN=%0d word=%0d actual=%h expected=%h",fn,pc,pd,iw);iderrors++;end
   end
  end else if(pd!==crc)begin if(crcerrors<3)$display("CRC_MISMATCH fn=%0d got=%h expected=%h",fn,pd,crc);crcerrors++;end
  if(pl)begin if({header[1],header[0]}!==fn || header[4][1:0]!==ft)begin $display("HEADER_PAYLOAD_ID_MISMATCH fn=%0d header=%h",fn,{header[1],header[0]});errors++;end if(pc!=477)errors++;frames++;pc=0;end else pc++;
 end
 if(ev)begin
  if(rw==0)begin if(ed!==32'h55555555)errors++;end
  else if(rw==1)begin if(ed!==32'h555555d5)errors++;end
  else begin if(recv>=sent||ed!==expected[recv])begin if(errors<5)$display("ETH_MISMATCH word=%0d got=%h expected=%h",recv,ed,expected[recv]);errors++;end recv++;end
  if(el)begin if(rw!=packet_words[packets]+1||ed!==32'hdeadbeef)errors++;packets++;rw=0;end else rw++;
 end
end
initial begin
 repeat(30)@(negedge clk);rst_n=1;repeat(50)@(negedge clk);
 trig=1;@(negedge clk);trig=0;wait(sent==500);
 repeat(2500)@(negedge clk);mgmt=1;@(negedge clk);mgmt=0;
 wait(recv==500 && packets==1);
 repeat(2000)@(negedge clk);wait(outstanding==0);
 accept_forward=0;wait(forward_drained);repeat(1000)@(negedge clk);
 wait(back_tx.ack_q_count==0);accept_backward=0;wait(backward_drained);repeat(30)@(negedge clk);
 $display("REPORT_CRC_ARQ case=%0d bad_header=%0d bad_payload=%0d ACK=%0d NAK=%0d reorder_hold=%0d",CASE,bad_headers,bad_payloads,ack_events,nak_events,reorder_hold_seen);
 if(CASE==0&&(bad_headers||bad_payloads||nak_events))$fatal(1,"CLEAN_CRC");
 if(CASE==1&&(bad_headers||bad_payloads!=1||nak_events<1||reorder_hold_seen<1))$fatal(1,"PAYLOAD_CRC_REORDER_NOT_EXERCISED");
 if(CASE==2&&(bad_headers!=1||nak_events!=0))$fatal(1,"HEADER_CRC_CONTRACT");
 if(outstanding || fr.u_arq_tx_controller.del_q_cnt || fc!=frc || fa!=fe || bc!=brc || ba!=be || forward_link.capturing || backward_link.capturing)$fatal(1,"TAIL outstanding/incomplete");
 if(mgmt_deliveries!=1 || (PEER && peer_events==0) || fr.ack_q_overflow_cnt || back_tx.ack_q_overflow_cnt)$fatal(1,"feedback/telemetry");
 $display("TRANSPORT_DRAIN forward=%0d/%0d beats=%0d/%0d maxq=%0d backward=%0d/%0d beats=%0d/%0d maxq=%0d outstanding=%0d telemetry=%0d",fc,frc,fa,fe,fmax,bc,brc,ba,be,bmax,outstanding,mgmt_deliveries);
 $display("STATE scheduler=%0d mux=%b trigger=%b frame_busy=%b idle_start=%b idle_ready=%b",fr.u_arq_tx_controller.state,fr.payload_mux_sel,fr.tx_trigger_gen,fr.frame_busy,fr.eff_idle_start_valid,fr.idle_gen_start_ready);
 $display("BASEBAND sent=%0d recv=%0d packets=%0d segments=%0d frames=%0d DATA=%0d IDLE=%0d MGMT=%0d RETX=%0d errors=%0d crcerrors=%0d iderrors=%0d",sent,recv,packets,segs,frames,datas,ids,mgmts,retries,errors,crcerrors,iderrors);
 if(recv!=500||packets!=1||segs!=2||((CASE!=0)&&(retries<1||!injected))||((CASE==0)&&retries!=0)||mgmts<1||ids<1||errors||crcerrors||iderrors||drops)$fatal(1,"BASEBAND_FAIL");$display("AUDIT_PASS REPORT_ARQ case=%0d packet1 bytes2000 CRC16_CRC32_production local_feedback; FEC_GTH_NOT_INCLUDED",CASE);$finish;
end
initial begin #300000;$fatal(1,"BASEBAND_TIMEOUT sent=%0d recv=%0d",sent,recv);end
endmodule
