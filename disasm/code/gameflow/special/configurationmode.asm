
; ASM FILE code\gameflow\special\configurationmode.asm :
; 0x7E3A..0x7EC6 : Configuration mode function

; =============== S U B R O U T I N E =======================================


CheatModeConfiguration:
                
                module
            if (STANDARD_BUILD&EASY_CONFIGURATION_MODE=1)
            else
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.w   @Default
            endif
                
                btst    #INPUT_BIT_UP,((P1_INPUT-$1000000)).w
                beq.s   loc_7E58
                btst    #7,(SAVE_FLAGS).l
            if (STANDARD_BUILD&SOUND_TEST_RESTORATION=1)
                beq.s   loc_7E58
                jmp     SoundTest
            else
                bne.w   SoundTest
            endif
loc_7E58:
                
                tst.b   ((CONFIGURATION_MODE_ACTIVATED-$1000000)).w
                beq.w   @Default
StartConfiguration:
                
                txt     448             ; "Configuration....{D3}"
                txt     450             ; "{CLEAR}Special Turbo"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_7E78       
                move.b  #$FF,((SPECIAL_TURBO_CHEAT-$1000000)).w
byte_7E78:
                
                txt     451             ; "{CLEAR}Control Opponent"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_7E8C       
                move.b  #$FF,((CONTROL_OPPONENT_CHEAT-$1000000)).w
byte_7E8C:
                
                txt     452             ; "{CLEAR}Auto Battle"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_7EA0       
                move.b  #$FF,((AUTO_BATTLE_CHEAT-$1000000)).w
byte_7EA0:
                
                txt     455             ; "{CLEAR}Game Completed"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   loc_7EB8
                bset    #7,(SAVE_FLAGS).l
                bra.s   byte_7EC0       
loc_7EB8:
                
                bclr    #7,(SAVE_FLAGS).l
byte_7EC0:
                
                txt     461             ; "Configuration is done.{N}Go ahead!{W1}"
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                bra.s   @Return
            endif
@Default:
            if (STANDARD_BUILD&TEST_BUILD=1)
                ; Default configuration settings
                move.b  #TEST_BUILD_INITIAL_DEBUG_MODE,((DEBUG_MODE_ACTIVATED-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_SPECIAL_TURBO,((SPECIAL_TURBO_CHEAT-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_CONTROL_OPPONENT,((CONTROL_OPPONENT_CHEAT-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_AUTO_BATTLE,((AUTO_BATTLE_CHEAT-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_MESSAGE_SPEED,((MESSAGE_SPEED-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_DISPLAY_BATTLE_MESSAGES,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
              if (TEST_BUILD_INITIAL_GAME_COMPLETED=1)
                bset    #7,(SAVE_FLAGS).l
              else
                bclr    #7,(SAVE_FLAGS).l
              endif
            endif
                
@Return:        rts

    ; End of function CheatModeConfiguration

                modend
