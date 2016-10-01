
; SCRIPT SECTION maps\entries\map10\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map10_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2CF
										bne.s   loc_57040
										lea     cs_570B0(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2CF               ; set after the initial Bedoe scene (where the guards confront you)
loc_57040:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D0
										beq.s   return_5708C
										move.w  #$96,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$97,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$98,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$99,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$9A,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$9B,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$9C,d0 
										jsr     MoveEntityOutOfMap
return_5708C:
										
										rts

	; End of function ms_map10_InitFunction

