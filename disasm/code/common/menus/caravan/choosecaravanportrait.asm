
; ASM FILE code\common\menus\caravan\choosecaravanportrait.asm :
; 0x228A8..0x228D8 : Choose Caravan Portrait function

; =============== S U B R O U T I N E =======================================

; In: d1.w = message index


DisplayCaravanMessageWithPortrait:
                
                movem.l d0-d1,-(sp)
                move.l  d1,-(sp)
                chkFlg  70              ; Astral is a follower
                bne.s   loc_228B8
                moveq   #PORTRAIT_ROHDE,d0 ; HARDCODED portraits
                bra.s   loc_228BA
loc_228B8:
                
                moveq   #PORTRAIT_ASTRAL,d0
loc_228BA:
                
                moveq   #0,d1
                jsr     j_CreatePortraitWindow
                move.l  (sp)+,d0
                jsr     (DisplayText).w 
                clsTxt
                jsr     j_RemovePortraitWindow
                movem.l (sp)+,d0-d1
                rts

    ; End of function DisplayCaravanMessageWithPortrait

