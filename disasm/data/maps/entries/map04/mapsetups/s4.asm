
; ASM FILE data\maps\entries\map04\mapsetups\s4.asm :
; 0x51702..0x51720 : 

; =============== S U B R O U T I N E =======================================

ms_map4_AreaDescriptions:
		
		move.w  #$1058,d3
		lea     word_51712(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map4_AreaDescriptions

word_51712:     dc.w $2806
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $2906
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $FD00
