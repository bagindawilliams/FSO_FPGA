# Konteks proyek — QUAL06

[FAKTA SUMBER] Inventaris seluruh Project_Doc:24berkas (15PDF,8HTML,1DOCX; hitungan aktual pada indeks). Tidak ditemukan XLSX/PPTX asli; presentasi tersedia sebagaiPDF. audit/20261101_qual06/docs/DOCUMENT_INDEX.csv danINDEX.json memuat nama,hash,metadata,peran dancakupanbaca setiapdokumen. MetadataPDF bukan tanggal persetujuan atau tanggal pengujian. DOCXdibaca dari document.xml termasuk tabel/komentar yang tersimpan. Referensi halamanPDF memakai nomor1-based yang cocok nomorhalaman tercetak padaSDA.

**Batas pembacaan:** seluruh berkas diinventarisasi dan diekstrak; dokumen konteks, komentar, standar dan bagian vendor relevan ditelaah. Bukan klaim telah memeriksa visual seluruh≈1000halaman manualvendor/seluruh88slide. Gambar yang benar-benar dilihat dicatat diindeks. arq.pdf p3 danoxco.pdf p2 terpotong pada cetakan; informasi yang hilang tidakdirekonstruksi. Diagramarsitektur kecil beberapa label memerlukan pembesaran lanjutan. Tidak ada spreadsheet tersembunyi yangdiasumsikan dibaca. Kekurangan pembacaanvisual menyeluruh tetapdinyatakan, bukanPASS.

## Hirarki keputusan dan konflik

SDA OISL v2.1.2 DOC16 menjadi normatif. InstruksiWilliams terbaru menetapkan subsetdemo duaEthernet2000byte (termasukFCSDEADBEEFtiruan),1900+100perpaket,DATA/IDLE/MGMT,ARQ,FEC,CDC,GTH,reassembly/backend dan kontinuitas. DemuxACCEPTED_BASELINE;GTHC01/C02/C03VERIFIED_SCOPEDkandidat,belumdisetujui. Tidak menambahMTU9000/16000,GNSS/OCXO/1PPS atauDDR4penuh.

- DOC14 p19/21 menyebut OCT4.0.0; DOC01/DOC14p22 diagram mencantumkan ACK_START_FN/ACK_SPAN. SDAv2.1.2p24–26 memakaiRXFN/ACK-valid/ACK. Proposal tidakmenggantikanstandar atauportRTL.
- DOC15 komentar13–14 menjelaskan tunnel64B66Blaboratorium: line10.3125Gb/s,userclock322.265625MHz,64active/66cycle,bukanEthernetMACoptik. Klaimlama 312.5MHz physical userclock/pause31cycle tidak berlaku padaXCIsekarang. tx_stall_out diagram/drafttidaksama denganRTLT Xyangkonstan0;cadence diaturFIFOread/sequence.
- DOC15 komentar16 mengoreksi hitungan2.5416µs menjadi2493.6ns. Komentar17:ETRImengusulkan holdoff×64 untukRTTjauh, responsmasihmeminta review. **Belum ada persetujuan untukmengganti×16 normatif**.
- DOC19p3 mengestimasi puluhanMB untukRTT5000km; bukan buktiMIGterintegrasi. RTLarq_ddr4_wrapper memakaiBRAM8192×32bit,16slot dantracker4. ScopeRTTlab terpisah dariorbit.
- DOC20 membahasPPS/OCXO/timekeeper danmengklaim kesiapanpin/akurasips; DOC12p10/16–18 membatasi klaimitu. Tidak ada bukti hardwarePPS/GNSS/OCXO sudahterintegrasi. Timestamp top statis,MGMTtrigger0;TBmenginjeksitrigger. Pin/VCCO/jitter/epoch/kalibrasilatency perlu keputusan danpemeriksaanmanual/skema sendiri.
- DOC17p10/81: presentasi mengklaimdurasi/kontinuitas;waveformp81 memakaipreamble5555legacy,monitorlama menghitung durasidari konstanta atau framecounterberbasisvalid. Bukanoracle runC03. DOC03developerresponse dan8HTMLaudit berisi hasilbaselineberbeda, tidak diwariskanPASSnya.
- DOC13bernamaRev30 tetapiisiRevA.1;DOC12RevA.2 memperluasmandat tanpaauditbaru. Labelrevisi bukanchecksumsource.

## Requirement dan acceptance

DOC16p19Tabel2-4:10Gbaud efektifinformation6121.270Mb/s bestcase,tidakretransmisi/MGMT. P23Tabel2-8:72+384+24480=24936bit=3117byte;frame synchronous tanpapauseantarbit/frame. P31§2.6.3.5.1 mewajibkanIDLEketikadataabsen,seedsTXFN+1,CRC/FECsama. P25–26DATA/MGMTsubjectARQ,IDLEtidak;holdoffunit16frame,max5retry,ACKberlakuRXFNjikaACKvalid. P35–40CRC/headerRS/payloadRS/scrambler/LPC;RS8lane≤8simbolerrorpercodeword, bukan64errorsembarang. P43–47§2.6.3.7/Tabel2-18 Ethernetpacking/continuation;1908information bukan1900Ethernet persegmenpertama.

[HASIL HITUNGAN] Tframe2493.6ns,f≈401026.628/s,FCCH16bit/frame≈6.416426Mb/s;informasi1908/3117×10Gb/s≈6.121270452Gb/s. FECpayload1912byte→2040RS→3060LPC;header16→32RS→48LPC. Frame3117byte menyisakan1byte pada32bit/5bytepada64bit,tidakbolehflushdengannol. Clocklogic200MHz,clockGTH322.265625MHz,gearbox64/66memulihkan10Gb/s efektif;nativeSDAserial berbedadaritunnel.

KriteriaQUAL06:≥256frame lengkap setelahacquisition;dua2000byte identik diXGMII,preamble/T/IPGsah;4metadata1900/100/1900/100;MGMT477wordtepatsekali;trackerdrain,replayexact;0mismatch/starvation/lockloss/overflow;DATA→IDLEpanjang→DATA;≥100µssetelahpaket terakhir. Pengukuranisi danwaktu bersama. Runtimebaru diperlukan,compile/elab bukanPASSfungsi.

## Rantai dan pekerjaan hardware

Ingressgenerator→XGMIIparser→segmenter→framerCRC/schedulerARQ→CDC1→FECTX→CDC2→adapterTX/GTH→adapterRX→CDC3→FECRX→CDC4→CRC/reorder→reassembly→backendXGMII. FIFO menyerapburst tetapi tidak menyelesaikanlajuinput rata-rata>throughput. Reserve780kata adalahkebijakanstartup setaraceil3117/4,kapasitas4096tetap; kecukupanharusdihitungdaridefisitkumulatif, bukan hanya1PASS. ARQholdoffsim500cycle pada322.265625MHz≈1551.515ns lebihpendekdariframe2493.6ns danlatencyloop; ini hipotesisprioritas21ACKberulang,perlu tracebaru.

Euclid9.287ns/25level pada5ns,WNS−4.433ns historis,sharedrefclkPLIOBUF-4,reset/CDCsignoff,implementasi,timingclosure danhardware tetap pekerjaan terpisah. Tidak adaexceptiontiming/clock/IPchange dalamQUAL06.
