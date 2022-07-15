
; ASM FILE data\maps\entries\map31\mapsetups\scripts.asm :
; 0x5D644..0x5D756 : 
cs_5D644:       setPos 137,8,3,LEFT
                animEntityFX 137,5
                csc_end
cs_5D652:       textCursor 2024
                nextSingleText $0,136   ; "Oh, you're cute!{N}(Cough)...well...{W1}"
                nextText $0,136         ; "May I paint your portrait?"
cs_5D65E:       textCursor 2027
                yesNo
                jumpIfFlagClear 89,cs_5D712 ; YES/NO prompt answer
                hideText
                nextSingleText $0,136   ; "Excellent!{W1}"
                nextSingleText $0,136   ; "Then, would you stand over{N}there, in front of the{N}flowers?{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setDest ALLY_BOWIE,28,3
                setFacing ALLY_BOWIE,DOWN
                setDest ALLY_PETER,27,4
                setDest FOLLOWER_B,27,5
                setFacing 136,UP
                setActscriptWait 136,eas_DeactivateAutoFacing
                entityActionsWait 136
                 moveLeft 1
                endActions
                entityActionsWait 136
                 moveRight 1
                endActions
                csWait 60
                entityActionsWait 136
                 moveLeft 1
                endActions
                csWait 30
                entityActionsWait 136
                 moveRight 1
                endActions
                entityActionsWait 136
                 moveLeft 1
                endActions
                entityActionsWait 136
                 moveRight 1
                endActions
                csWait 60
                setActscriptWait 136,eas_InitSlow
                setFacing 136,UP
                nextSingleText $0,136   ; "Finished!{W1}"
                entityActionsWait 136
                 moveRight 1
                endActions
                setFacing 136,LEFT
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
cs_5D712:       textCursor 2026
                hideText
                nextText $0,136         ; "Oh, please!  It won't take{N}long.  Will you pose{N}for me?"
                jump cs_5D65E
                csc_end
cs_5D724:       textCursor 2030
                nextText $0,136         ; "It's you!{W2}"
                nextSingleText $0,136   ; "Ah, how talented I am!{N}Hmmmm?{W1}"
                csc_end
cs_5D732:       executeSubroutine sub_5D73E
                csWait 180
                hideText
                csc_end

; =============== S U B R O U T I N E =======================================


sub_5D73E:
                
                movem.l d0-d2/a0,-(sp)
                move.w  #PORTRAIT_BOWIE_PAINTING,d0 ; Bowie painting portrait index
                moveq   #$FFFFFFFF,d1
                clr.w   d2
                jsr     j_InitPortraitWindow
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function sub_5D73E

