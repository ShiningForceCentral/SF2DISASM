
; ASM FILE code\specialscreens\suspend\witchsuspend.asm :
; 0x7034..0x7094 : Witch suspend function

; =============== S U B R O U T I N E =======================================


WitchSuspend:
                
                 
                sndCom  MUSIC_SUSPEND
                bsr.w   InitializeWitchSuspendVIntFunctions
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
                txt     240             ; "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
                clsTxt
                clr.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                bsr.w   Reinitializelayout_Witch
            if (STANDARD_BUILD=1)
                jsr     SuspendGame
            else
                jsr     j_SuspendGame
            endif
                move.w  #600,d0         ; wait for 10 seconds, or until player presses Start before restarting the game
@WaitForStartInput:
                
                bsr.w   WaitForVInt
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                dbne    d0,@WaitForStartInput


FadeOutAndResetGame:
                
                sndCom  SOUND_COMMAND_FADE_OUT
                bsr.w   FadeOutToBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                bsr.w   DisableDisplayAndInterrupts

    ; End of function WitchSuspend


; =============== S U B R O U T I N E =======================================


ResetGame:
                
                move    #$2700,sr
                movea.l (InitialStack).w,sp
                movea.l (p_Start).w,a0  
                jmp     (a0)

    ; End of function ResetGame

