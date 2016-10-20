
; ASM FILE data\maps\entries\map38\mapsetups\s4.asm :
; 0x5DD26..0x5DD50 : 

; =============== S U B R O U T I N E =======================================

ms_map38_AreaDescriptions:
		
		move.w  #$104B,d3
		lea     word_5DD36(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map38_AreaDescriptions

word_5DD36:
		dc.w $30E
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $B02
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $131A
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 2
		dc.w $1305
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 3
		dc.w $FD00
