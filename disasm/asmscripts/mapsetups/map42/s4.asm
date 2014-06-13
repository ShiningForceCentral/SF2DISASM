
; SCRIPT SECTION mapsetups\map42\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map42_Section4:
										
										move.w  #$1B2,d3
										lea     word_5FE34(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map42_Section4

word_5FE34:         dc.w $2702
										dc.b $FF
										dc.b 1
										dc.w sub_5FE68-word_5FE34
										dc.w $2702
										dc.b 0
										dc.b 1
										dc.w sub_5FE42-word_5FE34
										dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_5FE42:
										
										trap    #1
										dc.w $386
										bne.s   loc_5FE52
										move.w  #$D06,d0
										jsr     (DisplayText).w 
										bra.s   return_5FE66
loc_5FE52:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A8,d0
										jsr     (DisplayText).w 
										move.w  #$1B2,d0
										jsr     (DisplayText).w 
return_5FE66:
										
										rts

	; End of function sub_5FE42


; =============== S U B R O U T I N E =======================================

sub_5FE68:
										
										trap    #1
										dc.w $386
										bne.s   loc_5FE7A
										lea     cs_5FF06(pc), a0
										trap    #6
										trap    #2
										dc.w $386
										bra.s   return_5FE8E
loc_5FE7A:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A8,d0
										jsr     (DisplayText).w 
										move.w  #$1B2,d0
										jsr     (DisplayText).w 
return_5FE8E:
										
										rts

	; End of function sub_5FE68

