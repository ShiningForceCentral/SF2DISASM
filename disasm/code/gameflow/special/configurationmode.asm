
; ASM FILE code\gameflow\special\configurationmode.asm :
; 0x7E3A..0x7EC6 : Configuration mode function

; =============== S U B R O U T I N E =======================================


CheatModeConfiguration:
                
                if (EASY_CONFIGURATION_MODE=1)
                    nop
                    nop
                    nop
                    nop
                    nop
                else
                    btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                    beq.w   return_7EC4
                endif
                
                btst    #INPUT_BIT_UP,((P1_INPUT-$1000000)).w
                beq.s   loc_7E58
                enableSram
                btst    #7,(SAVE_FLAGS).l
                bne.w   nullsub_7FA4
loc_7E58:
                
                tst.b   ((CONFIGURATION_MODE_ACTIVATED-$1000000)).w
                beq.w   return_7EC4
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
return_7EC4:
                
                rts

    ; End of function CheatModeConfiguration

