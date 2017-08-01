
; ASM FILE data\maps\entries\map43\mapsetups\s4.asm :
; 0x5405C..0x540A6 : 

; =============== S U B R O U T I N E =======================================

ms_map43_AreaDescriptions:
		
		move.w  #$FE1,d3
		lea     word_5406C(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map43_AreaDescriptions

word_5406C:     dc.w $302
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $402
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $502
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $802
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 3
		dc.w $305
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 4
		dc.w $405
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 5
		dc.w $906
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 6
		dc.w $C06
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 7
		dc.w $F0A
		dc.b 0
		dc.b 0
		dc.b 5
		dc.b 8
		dc.w $FD00
		dc.b $4E 
		dc.b $75 
