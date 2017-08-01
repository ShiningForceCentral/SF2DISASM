
; ASM FILE data\maps\entries\map29\mapsetups\s4.asm :
; 0x5A154..0x5A16C : 

; =============== S U B R O U T I N E =======================================

ms_map29_AreaDescriptions:
		
		move.w  #$104F,d3
		lea     word_5A164(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map29_AreaDescriptions

word_5A164:     dc.w $3609
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $FD00
