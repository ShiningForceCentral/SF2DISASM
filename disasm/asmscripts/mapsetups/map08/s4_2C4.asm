
; SCRIPT SECTION mapsetups\map08\s4_2C4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map8_flag2C4_Section4:
										
										move.w  #$546,d3
										lea     word_561FC(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map8_flag2C4_Section4

word_561FC:         dc.w $50F
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $B
										dc.w $1B0F
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b $C
										dc.w $60F
										dc.b 0
										dc.b 1
										dc.w sub_56246-word_561FC
										dc.w $70F
										dc.b 0
										dc.b 1
										dc.w sub_56246-word_561FC
										dc.w $719
										dc.b 0
										dc.b 1
										dc.w sub_5626C-word_561FC
										dc.w $190C
										dc.b 0
										dc.b 1
										dc.w sub_5626C-word_561FC
										dc.w $1618
										dc.b 0
										dc.b 1
										dc.w sub_5626C-word_561FC
										dc.w $619
										dc.b 0
										dc.b 0
										dc.b 6
										dc.b 3
										dc.w $1A0C
										dc.b 0
										dc.b 0
										dc.b 6
										dc.b 6
										dc.w $1808
										dc.b 0
										dc.b 1
										dc.w sub_5629A-word_561FC
										dc.w $F12
										dc.b 0
										dc.b 1
										dc.w loc_562BA-word_561FC
										dc.w $1012
										dc.b 0
										dc.b 1
										dc.w loc_562BA-word_561FC
										dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_56246:
										
										trap    #1
										dc.w $2C4
										bne.s   loc_56256
										move.w  #$546,d0
										jsr     (DisplayText).w 
										bra.s   return_5626A
loc_56256:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A8,d0
										jsr     (DisplayText).w 
										move.w  #$1B2,d0
										jsr     (DisplayText).w 
return_5626A:
										
										rts

	; End of function sub_56246


; =============== S U B R O U T I N E =======================================

sub_5626C:
										
										trap    #1
										dc.w $2C4
										bne.s   loc_56284
										move.w  #$547,d0
										jsr     (DisplayText).w 
										move.w  #$548,d0
										jsr     (DisplayText).w 
										bra.s   return_56298
loc_56284:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A8,d0
										jsr     (DisplayText).w 
										move.w  #$1B2,d0
										jsr     (DisplayText).w 
return_56298:
										
										rts

	; End of function sub_5626C


; =============== S U B R O U T I N E =======================================

sub_5629A:
										
										move.w  #$54D,d0
										jsr     (DisplayText).w 
										move.w  #$54E,d0
										jsr     (DisplayText).w 
										move.w  #$54F,d0
										jsr     (DisplayText).w 
										move.w  #$550,d0
										jmp     (DisplayText).w 
loc_562BA:
										
										trap    #1
										dc.w $2DB
										bne.s   loc_562CA
										move.w  #$54A,d0
										jmp     (DisplayText).w 
										dc.w $6014
loc_562CA:
										
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  #$1A8,d0
										jsr     (DisplayText).w 
										move.w  #$1B2,d0
										jsr     (DisplayText).w 
										rts

	; End of function sub_5629A

