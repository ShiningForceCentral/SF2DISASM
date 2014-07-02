
; SCRIPT SECTION mapsetups\map33\s3 :
; 
ms_map33_Section3:  dc.b $F
										dc.b $15
										dc.w sub_5AA98-ms_map33_Section3
										dc.b $C
										dc.b $E
										dc.w sub_5AACA-ms_map33_Section3
										dc.w $FD00
										dc.w nullsub_94-ms_map33_Section3

; =============== S U B R O U T I N E =======================================

nullsub_94:
										
										rts

	; End of function nullsub_94


; =============== S U B R O U T I N E =======================================

sub_5AA98:
										
										trap    #1
										dc.w $306
										bne.s   loc_5AAAA
										lea     cs_5AC58(pc), a0
										trap    #6
										trap    #2
										dc.w $306
										bra.s   return_5AAC8
loc_5AAAA:
										
										trap    #1
										dc.w $311
										beq.s   return_5AAC8
										trap    #1
										dc.w $312
										bne.s   return_5AAC8
										lea     cs_5B466(pc), a0
										trap    #6
										trap    #2
										dc.w $312
										trap    #2
										dc.w $45
										trap    #3
										dc.w $44
return_5AAC8:
										
										rts

	; End of function sub_5AA98


; =============== S U B R O U T I N E =======================================

sub_5AACA:
										
										trap    #1
										dc.w $30F
										bne.s   return_5AAD6
										lea     cs_5AF36(pc), a0
										trap    #6
return_5AAD6:
										
										rts

	; End of function sub_5AACA

