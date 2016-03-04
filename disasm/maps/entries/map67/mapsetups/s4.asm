
; SCRIPT SECTION maps\entries\map67\mapsetups\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map67_Section4:
										
										move.w  #$1B2,d3
										lea     word_4FCDE(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map67_Section4

word_4FCDE:         dc.w $3917
										dc.b 0
										dc.b 1
										dc.w sub_4FCE6-word_4FCDE
										dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_4FCE6:
										
										trap    #TRAP_TEXTBOX
										dc.w $1A8
										trap    #TRAP_CHECKFLAG
										dc.w $2EF
										bne.s   loc_4FD3C
										trap    #TRAP_TEXTBOX
										dc.w $A1E
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #7,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #1
										dc.w $D
										bne.s   loc_4FD22
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $A1F
										bra.s   loc_4FD3A
loc_4FD22:
										
										move.w  #$D,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_4FD3A
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $A20
loc_4FD3A:
										
										bra.s   return_4FD40
loc_4FD3C:
										
										trap    #TRAP_TEXTBOX
										dc.w $1B2
return_4FD40:
										
										rts

	; End of function sub_4FCE6

