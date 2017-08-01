
; ASM FILE data\maps\entries\map16\mapsetups\s4.asm :
; 0x51F2A..0x51F6E : 

; =============== S U B R O U T I N E =======================================

ms_map16_AreaDescriptions:
		
		move.w  #$FEA,d3
		lea     word_51F3A(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map16_AreaDescriptions

word_51F3A:     dc.w $1405
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $1505
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $2710
		dc.b 0
		dc.b 0
		dc.b 5
		dc.b 2
		dc.w $2419
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 3
		dc.w $2619
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 4
		dc.w $210A
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 5
		dc.w $1A11
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 6
		dc.w $2415
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 7
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
