
; ASM FILE data\maps\entries\map19\mapsetups\s4_21F.asm :
; 0x62C72..0x62C96 : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag21F_AreaDescriptions:
		
		move.w  #$FD4,d3
		lea     word_62C82(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map19_flag21F_AreaDescriptions

word_62C82:     dc.w $1303
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $1403
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $D14
		dc.b 0
		dc.b 0
		dc.b 5
		dc.b 2
		dc.w $FD00
