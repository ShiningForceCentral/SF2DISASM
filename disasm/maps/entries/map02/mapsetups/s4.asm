
; SCRIPT SECTION maps\entries\map02\mapsetups\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map2_AreaDescriptions:
										
										move.w  #$1030,d3
										lea     word_5EA36(pc), a0
										nop
										jmp     DisplayAreaDescription

	; End of function ms_map2_AreaDescriptions

word_5EA36:         dc.w $80D
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 0
										dc.w $F0A
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $110E
										dc.b 0
										dc.b 0
										dc.b 9
										dc.b 2
										dc.w $1112
										dc.b 0
										dc.b 0
										dc.b 9
										dc.b 3
										dc.w $1912
										dc.b 0
										dc.b 0
										dc.b 9
										dc.b 4
										dc.w $605
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 5
										dc.w $190E
										dc.b 0
										dc.b 0
										dc.b 9
										dc.b 7
										dc.w $FD00
