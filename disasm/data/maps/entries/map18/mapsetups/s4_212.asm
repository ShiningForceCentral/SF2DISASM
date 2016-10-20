
; ASM FILE data\maps\entries\map18\mapsetups\s4_212.asm :
; 0x61278..0x61290 : 

; =============== S U B R O U T I N E =======================================

ms_map18_flag212_AreaDescriptions:
		
		move.w  #$FF3,d3
		lea     word_61288(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map18_flag212_AreaDescriptions

word_61288:
		dc.w $C09
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 0
		dc.w $FD00
