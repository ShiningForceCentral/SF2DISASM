
; ASM FILE data\maps\entries\map03\mapsetups\s6.asm :
; 0x51382..0x513C0 : 

; =============== S U B R O U T I N E =======================================

ms_map3_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w 1                  ; Sarah joined
		beq.s   loc_51390
		lea     cs_513BA(pc), a0
		trap    #6
		bra.s   loc_513A8
loc_51390:
		trap    #CHECK_FLAG
		dc.w $25A               ; set after Astral's second basement line
		beq.s   loc_513A8
		lea     cs_513A0(pc), a0
		trap    #6
		bra.w   loc_513A8
cs_513A0:
		entityPosDir $1,$29,$A,$1; 0019 SET ENTITY POS AND FACING 1 29 A 1
		csc_end                 ; END OF CUTSCENE SCRIPT
loc_513A8:
		trap    #1
		dc.w $25B               ; set after the messenger scene
		beq.s   return_513B8
		move.w  #$8E,d0
		jsr     MoveEntityOutOfMap
return_513B8:
		rts

	; End of function ms_map3_InitFunction

cs_513BA:       hideEntity $8E          ; 002E HIDE ENTITY 8E
		csc_end                 ; END OF CUTSCENE SCRIPT
