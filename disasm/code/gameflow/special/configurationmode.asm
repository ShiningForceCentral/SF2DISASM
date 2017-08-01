
; ASM FILE code\gameflow\special\configurationmode.asm :
; 0x7E3A..0x7EC6 : Configuration mode function

; =============== S U B R O U T I N E =======================================

CheatModeConfiguration:
		
		btst    #INPUT_A_START_BIT,((P1_INPUT-$1000000)).w
		beq.w   return_7EC4
		btst    #INPUT_A_UP_BIT,((P1_INPUT-$1000000)).w
		beq.s   loc_7E58
                enableSram
		btst    #7,(SAVE_FLAGS).l
		bne.w   nullsub_17
loc_7E58:
		
		tst.b   ((CONFIGURATION_MODE_ACTIVATED-$1000000)).w
		beq.w   return_7EC4
		trap    #TEXTBOX
		dc.w $1C0               
						; "Configuration....{D3}"
		trap    #TEXTBOX
		dc.w $1C2               
						; "{CLEAR}Special Turbo"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.s   loc_7E78
		move.b  #$FF,((SPECIAL_TURBO_CHEAT-$1000000)).w
loc_7E78:
		
		trap    #TEXTBOX
		dc.w $1C3               
						; "{CLEAR}Control Opponent"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.s   loc_7E8C
		move.b  #$FF,((CONTROL_OPPONENT_CHEAT-$1000000)).w
loc_7E8C:
		
		trap    #TEXTBOX
		dc.w $1C4               
						; "{CLEAR}Auto Battle"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.s   loc_7EA0
		move.b  #$FF,((AUTO_BATTLE_CHEAT-$1000000)).w
loc_7EA0:
		
		trap    #TEXTBOX
		dc.w $1C7               
						; "{CLEAR}Game Completed"
		jsr     j_YesNoChoiceBox
		tst.w   d0
		bne.s   loc_7EB8
		bset    #7,(SAVE_FLAGS).l
		bra.s   loc_7EC0
loc_7EB8:
		
		bclr    #7,(SAVE_FLAGS).l
loc_7EC0:
		
		trap    #TEXTBOX
		dc.w $1CD               
						; "Configuration is done.{N}Go ahead!{W1}"
return_7EC4:
		
		rts

	; End of function CheatModeConfiguration

