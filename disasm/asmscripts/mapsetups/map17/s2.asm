
; SCRIPT SECTION mapsetups\map17\s2 :
; 
ms_map17_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5237C-ms_map17_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_52382-ms_map17_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_52390-ms_map17_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_523BA-ms_map17_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_523A2-ms_map17_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_523B4-ms_map17_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_523D2-ms_map17_EntityEvents
										dc.b 2
										dc.b 3
										dc.w sub_52352-ms_map17_EntityEvents
										dc.b 3
										dc.b 3
										dc.w sub_5235E-ms_map17_EntityEvents
										dc.b 1
										dc.b 3
										dc.w nullsub_121-ms_map17_EntityEvents
										dc.b 4
										dc.b 3
										dc.w sub_5236A-ms_map17_EntityEvents
										dc.b 5
										dc.b 0
										dc.w sub_52376-ms_map17_EntityEvents
										dc.w $FD00
										dc.w nullsub_120-ms_map17_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_121:
										
										rts

	; End of function nullsub_121


; =============== S U B R O U T I N E =======================================

sub_52352:
										
										trap    #1
										dc.w $295
										bne.s   return_5235C
										trap    #5
										dc.w $37D
return_5235C:
										
										rts

	; End of function sub_52352


; =============== S U B R O U T I N E =======================================

sub_5235E:
										
										trap    #1
										dc.w $295
										bne.s   return_52368
										trap    #5
										dc.w $380
return_52368:
										
										rts

	; End of function sub_5235E


; =============== S U B R O U T I N E =======================================

sub_5236A:
										
										trap    #1
										dc.w $295
										bne.s   return_52374
										trap    #5
										dc.w $37F
return_52374:
										
										rts

	; End of function sub_5236A


; =============== S U B R O U T I N E =======================================

sub_52376:
										
										trap    #5
										dc.w $3B1
										rts

	; End of function sub_52376


; =============== S U B R O U T I N E =======================================

sub_5237C:
										
										trap    #5
										dc.w $343
										rts

	; End of function sub_5237C


; =============== S U B R O U T I N E =======================================

sub_52382:
										
										trap    #5
										dc.w $344
										trap    #5
										dc.w $345
										trap    #5
										dc.w $346
										rts

	; End of function sub_52382


; =============== S U B R O U T I N E =======================================

sub_52390:
										
										trap    #5
										dc.w $347
										trap    #5
										dc.w $348
										trap    #5
										dc.w $349
										trap    #5
										dc.w $34A
										rts

	; End of function sub_52390


; =============== S U B R O U T I N E =======================================

sub_523A2:
										
										trap    #1
										dc.w $295
										bne.s   loc_523AE
										trap    #5
										dc.w $37E
										bra.s   return_523B2
loc_523AE:
										
										trap    #5
										dc.w $381
return_523B2:
										
										rts

	; End of function sub_523A2


; =============== S U B R O U T I N E =======================================

sub_523B4:
										
										trap    #5
										dc.w $382
										rts

	; End of function sub_523B4


; =============== S U B R O U T I N E =======================================

sub_523BA:
										
										trap    #1
										dc.w $100
										bne.s   loc_523CC
										lea     cs_52A3C(pc), a0
										trap    #6
										trap    #2
										dc.w $100
										bra.s   return_523D0
loc_523CC:
										
										trap    #5
										dc.w $383
return_523D0:
										
										rts

	; End of function sub_523BA


; =============== S U B R O U T I N E =======================================

sub_523D2:
										
										trap    #5
										dc.w $384
										rts

	; End of function sub_523D2


; =============== S U B R O U T I N E =======================================

nullsub_120:
										
										rts

	; End of function nullsub_120


; =============== S U B R O U T I N E =======================================

sub_523DA:
										
										trap    #5
										dc.w $384
										trap    #5
										dc.w $384
										rts

	; End of function sub_523DA

