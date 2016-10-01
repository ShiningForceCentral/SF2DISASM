
; SCRIPT SECTION maps\entries\map15\mapsetups\s3_212 :
; 
ms_map15_flag212_ZoneEvents:
										dc.b $18
										dc.b $12
										dc.w sub_5D008-ms_map15_flag212_ZoneEvents
										dc.w $FD00
										dc.w nullsub_77-ms_map15_flag212_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_77:
										
										rts

	; End of function nullsub_77


; =============== S U B R O U T I N E =======================================

sub_5D008:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D4
										beq.s   return_5D01E
										trap    #TRAP_CHECKFLAG
										dc.w $334
										bne.s   return_5D01E
										lea     cs_5D04E(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $334               ; set after Skreech's join scene has played in Tristan
return_5D01E:
										
										rts

	; End of function sub_5D008

