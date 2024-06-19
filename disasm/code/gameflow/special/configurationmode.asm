
; ASM FILE code\gameflow\special\configurationmode.asm :
; 0x7E3A..0x7EC6 : Configuration mode function

; =============== S U B R O U T I N E =======================================


CheatModeConfiguration:
                
                module
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                ; Default TEST_BUILD configuration settings
                move.b  #TEST_BUILD_INITIAL_DEBUG_MODE,((DEBUG_MODE_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_SPECIAL_TURBO,((SPECIAL_TURBO_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_CONTROL_OPPONENT,((CONTROL_OPPONENT_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_AUTO_BATTLE,((AUTO_BATTLE_TOGGLE-$1000000)).w
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  #TEST_BUILD_INITIAL_MESSAGE_SPEED,(MESSAGE_SPEED).l
                move.b  #TEST_BUILD_INITIAL_NO_BATTLE_MESSAGES_TOGGLE,(NO_BATTLE_MESSAGES_TOGGLE).l
              else
                move.b  #TEST_BUILD_INITIAL_MESSAGE_SPEED,((MESSAGE_SPEED-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_NO_BATTLE_MESSAGES_TOGGLE,((NO_BATTLE_MESSAGES_TOGGLE-$1000000)).w
              endif
              if (TEST_BUILD_INITIAL_GAME_COMPLETED=1)
                bset    #7,(SAVE_FLAGS).l
              else
                bclr    #7,(SAVE_FLAGS).l
              endif
            endif
            
            if (STANDARD_BUILD&EASY_CONFIGURATION_MODE=1)
                ; Do not check input
            else
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.w   @Return
            endif
                
                ; Start sound test if pressing Up and game completed flag is set
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
            if (STANDARD_BUILD&EASY_SOUND_TEST=1)
                ; Do not check input
            else
                beq.s   @IsConfigurationModeOn
                btst    #7,(SAVE_FLAGS).l
            endif
                bne.w   SoundTest
@IsConfigurationModeOn:
                
                tst.b   ((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                beq.w   @Return
StartConfiguration:
                
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
