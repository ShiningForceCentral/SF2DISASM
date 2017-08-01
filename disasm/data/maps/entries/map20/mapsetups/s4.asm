
; ASM FILE data\maps\entries\map20\mapsetups\s4.asm :
; 0x5392C..0x5395E : 

; =============== S U B R O U T I N E =======================================

ms_map20_AreaDescriptions:
		
		move.w  #$FD7,d3
		lea     word_5393C(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map20_AreaDescriptions

word_5393C:     dc.w $1706
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $1834
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $1934
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $1332
		dc.b 0
		dc.b 0
		dc.b 7
		dc.b 3
		dc.w $1124
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 4
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
