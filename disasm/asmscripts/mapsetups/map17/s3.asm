
; SCRIPT SECTION mapsetups\map17\s3 :
; 
ms_map17_Section3:  dc.b $35
										dc.b 5
										dc.w sub_523F4-ms_map17_Section3
										dc.b $2B
										dc.b 9
										dc.w sub_52406-ms_map17_Section3
										dc.b $39
										dc.b 5
										dc.w sub_5242E-ms_map17_Section3
										dc.w $FD00
										dc.w nullsub_79-ms_map17_Section3

; =============== S U B R O U T I N E =======================================

sub_523F4:
										
										trap    #1
										dc.w $295
										bne.s   return_52404
										lea     cs_52530(pc), a0
										trap    #6
										trap    #2
										dc.w $295
return_52404:
										
										rts

	; End of function sub_523F4


; =============== S U B R O U T I N E =======================================

sub_52406:
										
										trap    #1
										dc.w $296
										bne.s   loc_5241E
										lea     cs_528D4(pc), a0
										trap    #6
										lea     cs_528CA(pc), a0
										trap    #6
										trap    #2
										dc.w $296
										bra.s   return_5242C
loc_5241E:
										
										trap    #5
										dc.w $3B4
										trap    #5
										dc.w $3B7
										lea     cs_528CA(pc), a0
										trap    #6
return_5242C:
										
										rts

	; End of function sub_52406


; =============== S U B R O U T I N E =======================================

sub_5242E:
										
										trap    #1
										dc.w $296
										beq.s   return_5243E
										lea     cs_52938(pc), a0
										trap    #6
										trap    #2
										dc.w $49
return_5243E:
										
										rts

	; End of function sub_5242E


; =============== S U B R O U T I N E =======================================

nullsub_79:
										
										rts

	; End of function nullsub_79

