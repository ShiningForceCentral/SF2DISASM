
; ASM FILE data\maps\entries\map23\mapsetups\s4.asm :
; 0x59BD8..0x59BFC : 

; =============== S U B R O U T I N E =======================================

ms_map23_AreaDescriptions:
		
		move.w  #$1015,d3
		lea     word_59BE8(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map23_AreaDescriptions

word_59BE8:     dc.w $514
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $3302
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $3402
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $FD00
