
; ASM FILE code\common\tech\graphics\findspecialsprite-standard.asm :


                module

; In: d1.w = entity mapsprite index, Out: CCR carry-bit clear if true

IsSpecialSprite:
                
                movem.l d2/a0,-(sp)
                bsr.s   FindSpecialSprite
                bra.s   @done
                
                
; In: d1.w = entity mapsprite index, Out: CCR carry-bit clear if true

IsEnemySpecialSprite:
                
                movem.l d2/a0,-(sp)
                bsr.s   FindSpecialSprite
                bcs.s   @done ; if not a special sprite, return carry set
                tst.w   2(a0)
                bne.s   @done ; if enemy, return carry clear
                ori     #1,ccr
                bra.s   @done ; otherwise, return carry set


; In: d1.w = entity mapsprite index, Out: d1.w = special mapsprite index, or -1 if not applicable

GetSpecialSpriteIndex:
                
                movem.l d2/a0,-(sp)
                bsr.s   FindSpecialSprite
                bcc.s   @continue
                moveq   #-1,d1 ; return invalid index if no matching entity mapsprite found
                bra.s   @done
                
@continue       move.w  (a0),d1
@done           movem.l (sp)+,d2/a0
                rts


FindSpecialSprite:
                
                lea     table_SpecialSprites(pc), a0
                moveq   #4,d2 ; offset to next entry
                jmp     (FindSpecialPropertyWordsAddressForObject).w
                
                modend
