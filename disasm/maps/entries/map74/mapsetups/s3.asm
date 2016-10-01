
; SCRIPT SECTION maps\entries\map74\mapsetups\s3 :
; 
ms_map74_ZoneEvents:dc.b $FF
										dc.b $3D
										dc.w sub_5098C-ms_map74_ZoneEvents
										dc.w $FD00
										dc.w return_509C4-ms_map74_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5098C:
										
										trap    #TRAP_CHECKFLAG
										dc.w $20F               ; Battle 27 completed
										bne.s   loc_509AC
										trap    #TRAP_SETFLAG
										dc.w $1AB               ; Battle 27 unlocked
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
										trap    #TRAP_SETFLAG
										dc.w $1AC               ; Battle 28 unlocked
										trap    #TRAP_SETFLAG
										dc.w $1AD               ; Battle 29 unlocked
										trap    #TRAP_SETFLAG
										dc.w $1AE               ; Battle 30 unlocked
										bra.s   return_509C4
loc_509AC:
										
										trap    #TRAP_CHECKFLAG
										dc.w $32B               ; set after Frayja asks to go to Moun with you
										beq.s   return_509C4
										trap    #TRAP_CHECKFLAG
										dc.w $214               ; Battle 32 completed
										bne.s   return_509C4
										trap    #TRAP_SETFLAG
										dc.w $1B0               ; Battle 32 unlocked
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_509C4:
										
										rts

	; End of function sub_5098C

