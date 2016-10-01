
; SCRIPT SECTION maps\entries\map45\mapsetups\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map45_AreaDescriptions:
										
										move.w  #$104A,d3
										lea     word_60088(pc), a0
										nop
										jmp     DisplayAreaDescription

	; End of function ms_map45_AreaDescriptions

word_60088:         dc.w $1521
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 0
										dc.w $FD00
