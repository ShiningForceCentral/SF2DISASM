
; SCRIPT SECTION maps\entries\map11\mapsetups\s3 :
; 
ms_map11_ZoneEvents:dc.b $27
										dc.b $B
										dc.w sub_57A72-ms_map11_ZoneEvents
										dc.w $FD00
										dc.w nullsub_75-ms_map11_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_75:
										
										rts

	; End of function nullsub_75


; =============== S U B R O U T I N E =======================================

sub_57A72:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D2
										bne.s   return_57A86
										lea     cs_57AAA(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2D2               ; set after speaking with Volcanon
										trap    #TRAP_SETFLAG
										dc.w $2C7               ; set after you dislodge the turtle/fairy in Polca
return_57A86:
										
										rts

	; End of function sub_57A72

