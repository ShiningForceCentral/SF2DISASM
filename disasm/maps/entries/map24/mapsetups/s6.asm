
; SCRIPT SECTION maps\entries\map24\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map24_InitFunction:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_HEADQUARTERS
										jsr     (FadeInFromBlack).w
										move.w  #$46,((CURRENT_SPEAK_SOUND-$1000000)).w 
										trap    #1
										dc.w $220               ; battle 44 completed, fairy woods secret battle ?
										bne.w   loc_59CB2
										trap    #TRAP_TEXTBOX
										dc.w $1D3               ; "Welcome to the fairy woods{N}special stage!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1D4               ; "How quickly can you defeat{N}all the hidden monsters?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1D5               ; "Now, set a new record.{W2}"
										move.l  ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
										divs.w  #$3C,d0 
										move.w  d0,d1
										ext.l   d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1D6               ; "Best record so far is{N}{#} min."
										swap    d0
										ext.l   d0
										move.l  d0,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1D7               ; "{DICT} {#} sec.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1D8               ; "Are you ready?"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_59C92
										trap    #TRAP_TEXTBOX
										dc.w $1D9               ; "...set...GO!{W2}"
										lea     cs_StartSpecialBattle(pc), a0
										trap    #6
										bra.s   return_59C9C
loc_59C92:
										
										trap    #TRAP_TEXTBOX
										dc.w $1DA               ; "Oh, what a pity!{N}Please visit me anytime!!{W1}"
										lea     cs_LeaveSpecialBattle(pc), a0
																						; some script
										trap    #6
return_59C9C:
										
										rts
cs_StartSpecialBattle:
										
										dc.w $13                ; 0013 SET STORY FLAG 2C
										dc.w $2C
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 18011802
										dc.l $18011802
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_LeaveSpecialBattle:
										
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 171E1802
										dc.l $171E1802
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_59CB2:
										
										move.l  ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
										divs.w  #$3C,d0 
										move.w  d0,d1
										ext.l   d1
										move.l  d1,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1DB               ; "You recorded{N}{#} min."
										swap    d0
										ext.l   d0
										move.l  d0,((RAM_Dialog_NumberToPrint-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1DC               ; "{DICT} {#} sec.{W2}"
										move.l  ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
										cmp.l   ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
										bcc.s   loc_59CF0
										trap    #TRAP_TEXTBOX
										dc.w $1DD               ; "Congratulations!{N}You made it!"
										move.l  d0,((SPECIAL_BATTLE_RECORD-$1000000)).w
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_ITEM
										jsr     j_FadeOut_WaitForP2Input
																						; fade out music and wait for P2 input ?!
										bra.s   loc_59CF4
loc_59CF0:
										
										trap    #TRAP_TEXTBOX
										dc.w $1DE               ; "It was close!{W2}"
loc_59CF4:
										
										trap    #TRAP_TEXTBOX
										dc.w $1DF               ; "Come back again!{N}See ya!{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										lea     cs_LeaveSpecialBattle(pc), a0
										trap    #6
										trap    #3
										dc.w $220
										rts

	; End of function ms_map24_InitFunction

