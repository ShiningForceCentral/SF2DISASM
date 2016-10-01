
; SCRIPT SECTION maps\entries\map07\mapsetups\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map7_AreaDescriptions:
										
										move.w  #$1001,d3
										lea     word_557FE(pc), a0
										nop
										jmp     DisplayAreaDescription

	; End of function ms_map7_AreaDescriptions

word_557FE:         dc.w $403
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 0
										dc.w $30C
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 1
										dc.w $FD00
										dc.b $4E 
										dc.b $75 
