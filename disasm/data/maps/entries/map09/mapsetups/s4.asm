
; ASM FILE data\maps\entries\map09\mapsetups\s4.asm :
; 0x5687A..0x568A4 : 

; =============== S U B R O U T I N E =======================================

ms_map9_AreaDescriptions:
		
		move.w  #$1011,d3
		lea     word_5688A(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map9_AreaDescriptions

word_5688A:
		dc.w $E0D
		dc.b 0
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w $1115
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 1
		dc.w $120C
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 2
		dc.w $1B0B
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 3
		dc.w $FD00
