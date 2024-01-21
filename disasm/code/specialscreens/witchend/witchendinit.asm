
; ASM FILE code\specialscreens\witchend\witchendinit.asm :
; 0x7094..0x70D2 : Witch end function

; =============== S U B R O U T I N E =======================================


WitchEnd:
                
                moveq   #60,d0
                bsr.w   Sleep           
                bsr.w   InitializeWitchSuspendVIntFunctions
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
                txt     238             ; "Finally, you've fulfilled my{N}wish!{N}{D2}{D2}Thanks to you, I can{N}escape from this forest!{D2}{N}Are you really that{N}surprised?{D2}{D2}{D2}"
                clsTxt
                clr.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                bsr.w   Reinitializelayout_Witch
                bsr.w   FadeOutToWhite
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_WitchBlink
            if (STANDARD_BUILD=1)
                jmp     EndGame
            else
                jmp     j_EndGame
            endif

    ; End of function WitchEnd

