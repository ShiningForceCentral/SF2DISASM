
; SCRIPT SECTION mapsetups\map45\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map45_Section4:
										
										move.w  #$104A,d3
										lea     word_60088(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map45_Section4

word_60088:         dc.w $1521
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 0
										dc.w $FD00
