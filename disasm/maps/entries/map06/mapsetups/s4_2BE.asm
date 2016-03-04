
; SCRIPT SECTION maps\entries\map06\mapsetups\s4_2BE :
; 

; =============== S U B R O U T I N E =======================================

ms_map6_flag2BE_Section4:
										
										move.w  #$FF4,d3
										lea     word_54D4C(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map6_flag2BE_Section4

word_54D4C:         dc.w $507
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 0
										dc.w $607
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 1
										dc.w $40E
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 2
										dc.w $50E
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 3
										dc.w $60E
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $1306
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 5
										dc.w $110D
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 6
										dc.w $1D07
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 8
										dc.w $1411
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 9
										dc.w $1518
										dc.b 0
										dc.b 1
										dc.w sub_54E04-word_54D4C
										dc.w $FD00
