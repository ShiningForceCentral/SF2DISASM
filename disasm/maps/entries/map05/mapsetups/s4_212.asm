
; SCRIPT SECTION maps\entries\map05\mapsetups\s4_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map5_flag212_Section4:
										
										move.w  #$D9C,d3
										lea     word_60558(pc), a0
										nop
										jmp     sub_47722

	; End of function ms_map5_flag212_Section4

word_60558:         dc.w $90F
										dc.b 0
										dc.b 0
										dc.b 6
										dc.b 0
										dc.w $A10
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 1
										dc.w $B10
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 2
										dc.w $1732
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 3
										dc.w $160B
										dc.b 0
										dc.b 1
										dc.w sub_60582-word_60558
										dc.w $1321
										dc.b 0
										dc.b 1
										dc.w sub_60590-word_60558
										dc.w $FD00
										dc.b $4E 
										dc.b $75 
										dc.b $4E 
										dc.b $75 

; =============== S U B R O U T I N E =======================================

sub_60582:
										
										trap    #1
										dc.w $3AC
										bne.s   return_6058E
										lea     cs_60F64(pc), a0
										trap    #6
return_6058E:
										
										rts

	; End of function sub_60582


; =============== S U B R O U T I N E =======================================

sub_60590:
										
										trap    #1
										dc.w $3B1
										bne.s   loc_605C4
										lea     cs_6060E(pc), a0
										trap    #6
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1C,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $D9B               ; "I can't believe it!{N}I want to die, but I can't!{W1}"
										trap    #TRAP_SETFLAG
										dc.w $3B1               ; set after recruiting Lemon in Yeel
										bra.s   return_60604
loc_605C4:
										
										trap    #1
										dc.w $1C
										bne.s   loc_605EE
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1C,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $D9B               ; "I can't believe it!{N}I want to die, but I can't!{W1}"
										bra.s   return_60604
loc_605EE:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										trap    #TRAP_TEXTBOX
										dc.w $FF2               ; "A hole.{W1}"
return_60604:
										
										rts

	; End of function sub_60590

