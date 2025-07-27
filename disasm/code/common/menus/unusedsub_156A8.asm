
; ASM FILE code\common\menus\unusedsub_156A8.asm :
; 0x156A8..0x15736 : Unused window functions

; =============== S U B R O U T I N E =======================================

; Unused window function


sub_156A8:
                
                movem.w d0,-(sp)
                bsr.s   sub_156CE       
                move.l  #$F80B010B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156A8


; =============== S U B R O U T I N E =======================================

; Unused window function


sub_156BC:
                
                move.w  d0,-(sp)
                bsr.s   sub_156CE       
                move.l  #$10BF80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156BC


; =============== S U B R O U T I N E =======================================

; Unused window function


sub_156CE:
                
                movem.l d7-a1,-(sp)
                lea     layout_15706(pc), a0
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a1
                move.w  #48,d7
                jsr     (CopyBytes).w   
                movem.l (sp)+,d7-a1
                jsr     j_GetCombatantName
                move.w  d1,d7
                lea     ((byte_FFB812-$1000000)).w,a1
                moveq   #-16,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a0
                move.w  #$803,d0
                move.w  #4,d2
                rts

    ; End of function sub_156CE

layout_15706:   dc.w $C080              ; unused layout
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C880
                dc.w $C090
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C890
                dc.w $D080
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D880
