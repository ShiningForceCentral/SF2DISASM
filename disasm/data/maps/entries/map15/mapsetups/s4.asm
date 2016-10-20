
; ASM FILE data\maps\entries\map15\mapsetups\s4.asm :
; 0x5D020..0x5D044 : 

; =============== S U B R O U T I N E =======================================

ms_map15_AreaDescriptions:
		
		move.w  #$1041,d3
		lea     word_5D030(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map15_AreaDescriptions

word_5D030:
		dc.w $1F03
		dc.b 0
		dc.b 0
		dc.b 9
		dc.b 0
		dc.w $21B
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 1
		dc.w $160E
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $FD00
