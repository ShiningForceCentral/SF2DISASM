
; ASM FILE data\maps\entries\map05\mapsetups\s4.asm :
; 0x51C28..0x51C54 : 

; =============== S U B R O U T I N E =======================================

ms_map5_AreaDescriptions:
		
		move.w  #$FDD,d3
		lea     word_51C38(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map5_AreaDescriptions

word_51C38:
		dc.w $90F
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 0
		dc.w $A10
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $B10
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $160B
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 3
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
