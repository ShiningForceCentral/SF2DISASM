
; ASM FILE data\maps\entries\map18\mapsetups\s4.asm :
; 0x52B26..0x52B40 : 

; =============== S U B R O U T I N E =======================================

ms_map18_AreaDescriptions:
		
		move.w  #$FF3,d3
		lea     word_52B36(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map18_AreaDescriptions

word_52B36:
		dc.w $C09
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 0
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
