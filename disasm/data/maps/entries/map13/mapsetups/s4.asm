
; ASM FILE data\maps\entries\map13\mapsetups\s4.asm :
; 0x582AC..0x582D8 : 

; =============== S U B R O U T I N E =======================================

ms_map13_AreaDescriptions:
		
		move.w  #$1003,d3
		lea     word_582BC(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map13_AreaDescriptions

word_582BC:
		dc.w $1102
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $1202
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $509
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 2
		dc.w $709
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 3
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
