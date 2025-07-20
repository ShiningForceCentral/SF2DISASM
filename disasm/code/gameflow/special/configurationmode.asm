
; ASM FILE code\gameflow\special\configurationmode.asm :
; 0x7E3A..0x7EC6 : Configuration mode function

; =============== S U B R O U T I N E =======================================


CheatModeConfiguration:
                
                module
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.w   @Return
                
                ; Start sound test if pressing Up and game completed flag is set
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @IsConfigurationModeOn
                
                btst    #7,(SAVE_FLAGS).l
                bne.w   j_SoundTest     
@IsConfigurationModeOn:
                
                tst.b   ((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                beq.w   @Return
                txt     448             ; "Configuration....{D3}"
                txt     450             ; "{CLEAR}Special Turbo"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.s   byte_7E78       
                move.b  #-1,((SPECIAL_TURBO_TOGGLE-$1000000)).w
byte_7E78:
                
                txt     451             ; "{CLEAR}Control Opponent"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.s   byte_7E8C       
                move.b  #-1,((CONTROL_OPPONENT_TOGGLE-$1000000)).w
byte_7E8C:
                
                txt     452             ; "{CLEAR}Auto Battle"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.s   byte_7EA0       
                move.b  #-1,((AUTO_BATTLE_TOGGLE-$1000000)).w
byte_7EA0:
                
                txt     455             ; "{CLEAR}Game Completed"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.s   @ClearGameCompleted
                bset    #7,(SAVE_FLAGS).l
                bra.s   byte_7EC0       
@ClearGameCompleted:
                
                bclr    #7,(SAVE_FLAGS).l
byte_7EC0:
                
                txt     461             ; "Configuration is done.{N}Go ahead!{W1}"
@Return:
                
                rts

    ; End of function CheatModeConfiguration

                modend
