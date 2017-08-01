
; ASM FILE data\maps\entries\map11\mapsetups\s4.asm :
; 0x57A88..0x57AA0 : 

; =============== S U B R O U T I N E =======================================

ms_map11_AreaDescriptions:
		
		move.w  #$1010,d3
		lea     word_57A98(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map11_AreaDescriptions

word_57A98:     dc.w $60C
		dc.b 0
		dc.b 0
		dc.b 9
		dc.b 0
		dc.w $FD00
