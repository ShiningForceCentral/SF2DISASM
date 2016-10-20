
; ASM FILE data\maps\entries\map10\mapsetups\s6.asm :
; 0x57030..0x5708E : 

; =============== S U B R O U T I N E =======================================

ms_map10_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2CF               
						; set after the initial Bedoe scene (where the guards confront you)
		bne.s   loc_57040
		lea     cs_570B0(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2CF               
						; set after the initial Bedoe scene (where the guards confront you)
loc_57040:
		
		trap    #CHECK_FLAG
		dc.w $2D0               
						; set after the King of Bedoe speaks to his soldiers and they disperse
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

