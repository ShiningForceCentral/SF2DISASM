
; SCRIPT SECTION mapsetups\map01\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map1_Section4:
										
										move.w  #$1044,d3
										lea     word_5E736(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map1_Section4

word_5E736:         dc.w $B03
										dc.b 0
										dc.b 0
										dc.b 9
										dc.b 0
										dc.w $2C1A
										dc.b 0
										dc.b 1
										dc.w sub_5E746-word_5E736
										dc.w $FD00
										dc.b $4E 
										dc.b $75 

; =============== S U B R O U T I N E =======================================

sub_5E746:
										
										trap    #1
										dc.w $349
										bne.s   return_5E756
										lea     cs_5E772(pc), a0
										trap    #6
										trap    #2
										dc.w $349
return_5E756:
										
										rts

	; End of function sub_5E746

