
; SCRIPT SECTION maps\entries\map66\mapsetups\s3 :
; 
ms_map66_Section3:  dc.b $FF
										dc.b 9
										dc.w sub_4FAA0-ms_map66_Section3
										dc.b $FF
										dc.b $A
										dc.w sub_4FAA0-ms_map66_Section3
										dc.b $FF
										dc.b $1C
										dc.w sub_4FABA-ms_map66_Section3
										dc.w $FD00
										dc.w sub_4FAD4-ms_map66_Section3

; =============== S U B R O U T I N E =======================================

sub_4FAA0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $219               ; Battle 37 completed
										beq.s   return_4FAB8
										trap    #TRAP_CHECKFLAG
										dc.w $21A               ; Battle 38 completed
										bne.s   return_4FAB8
										trap    #TRAP_SETFLAG
										dc.w $1B6               ; Battle 38 unlocked
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_4FAB8:
										
										rts

	; End of function sub_4FAA0


; =============== S U B R O U T I N E =======================================

sub_4FABA:
										
										trap    #TRAP_CHECKFLAG
										dc.w $21A               ; Battle 38 completed
										beq.s   return_4FAD2
										trap    #TRAP_CHECKFLAG
										dc.w $21B               ; Battle 39 completed
										bne.s   return_4FAD2
										trap    #TRAP_SETFLAG
										dc.w $1B7               ; Battle 39 unlocked
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_4FAD2:
										
										rts

	; End of function sub_4FABA


; =============== S U B R O U T I N E =======================================

sub_4FAD4:
										
										move.w  #3,d0
										jsr     sub_47856
										rts

	; End of function sub_4FAD4

