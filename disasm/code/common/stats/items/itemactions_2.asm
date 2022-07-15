
; ASM FILE code\common\stats\items\itemactions_2.asm :
; 0x229EC..0x22BC2 : Item functions

; =============== S U B R O U T I N E =======================================

; Find specific item index + code offset to run when used in field
; 
;       In: D1 = item entry


UseFieldItem:
                
                
                module
                movem.l d0-d1/d6-d7,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movem.l d1/a0,-(sp)
                lea     rjt_FieldItemEffects(pc), a0
@FindItem_Loop:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.w   @Break
                cmp.w   (a0)+,d1
                bne.w   @Next
                move.w  (a0)+,d1
                jsr     rjt_FieldItemEffects(pc,d1.w)
                bra.w   @Break
@Next:
                
                adda.w  #2,a0
                bra.s   @FindItem_Loop
@Break:
                
                movem.l (sp)+,d1/a0
                bra.w   @Done
rjt_FieldItemEffects:
                
                dc.w 3
                dc.w FieldItem_CurePoison-rjt_FieldItemEffects
                dc.w 5
                dc.w FieldItem_CurePoisonAndParalysis-rjt_FieldItemEffects
                dc.w 9
                dc.w FieldItem_IncreaseATT-rjt_FieldItemEffects
                dc.w $A
                dc.w FieldItem_IncreaseDEF-rjt_FieldItemEffects
                dc.w $B
                dc.w FieldItem_IncreaseAGI-rjt_FieldItemEffects
                dc.w $C
                dc.w FieldItem_IncreaseMOV-rjt_FieldItemEffects
                dc.w $D
                dc.w FieldItem_IncreaseHP-rjt_FieldItemEffects
                dc.w $E
                dc.w FieldItem_IncreaseMP-rjt_FieldItemEffects
                dc.w $F
                dc.w LevelUpCutscene-rjt_FieldItemEffects
                dc.w $FFFF
@Done:
                
                movem.l (sp)+,d0-d1/d6-d7
                rts

    ; End of function UseFieldItem

                
                modend

; =============== S U B R O U T I N E =======================================


FieldItem_CurePoison:
                
                jsr     j_GetStatusEffects
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   byte_22A64      
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     149             ; "{NAME} is no longer{N}poisoned.{W2}"
                bra.s   loc_22A68
byte_22A64:
                
                txt     148             ; "It has no use.{W2}"
loc_22A68:
                
                jsr     j_SetStatusEffects
                rts

    ; End of function FieldItem_CurePoison


; =============== S U B R O U T I N E =======================================


FieldItem_CurePoisonAndParalysis:
                
                jsr     j_GetStatusEffects
                moveq   #0,d2
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   loc_22A88
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     149             ; "{NAME} is no longer{N}poisoned.{W2}"
                moveq   #$FFFFFFFF,d2
loc_22A88:
                
                bclr    #STATUSEFFECT_BIT_STUN,d1
                beq.s   loc_22A98
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     156             ; "{NAME} is no longer{N}paralyzed.{W2}"
                moveq   #$FFFFFFFF,d2
loc_22A98:
                
                tst.w   d2
                bne.s   loc_22AA0
                txt     148             ; "It has no use.{W2}"
loc_22AA0:
                
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function FieldItem_CurePoisonAndParalysis


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseATT:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     150             ; "{NAME}'s attack{N}power is boosted by {#}.{W2}"
                jsr     j_IncreaseBaseATT
                move.w  d7,d1
                jsr     j_IncreaseCurrentATT
                rts

    ; End of function FieldItem_IncreaseATT


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseDEF:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     151             ; "{NAME}'s defensive{N}power is boosted by {#}.{W2}"
                jsr     j_IncreaseBaseDEF
                move.w  d7,d1
                jsr     j_IncreaseCurrentDEF
                rts

    ; End of function FieldItem_IncreaseDEF


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseAGI:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     152             ; "{NAME}'s agility{N}is boosted by {#}.{W2}"
                jsr     j_IncreaseAGI
                move.w  d7,d1
                jsr     j_IncreaseCurrentAGI
                rts

    ; End of function FieldItem_IncreaseAGI


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseMOV:
                
                jsr     j_GetBaseMOV
                clr.w   d7
                cmpi.b  #9,d1
                beq.w   loc_22B42
                moveq   #1,d7
                cmpi.b  #8,d1
                beq.w   loc_22B42
                moveq   #2,d7
loc_22B42:
                
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     153             ; "{NAME}'s movement{N}range enlarged by {#}.{W2}"
                jsr     j_IncreaseBaseMOV
                move.w  d7,d1
                jsr     j_IncreaseCurrentMOV
                rts

    ; End of function FieldItem_IncreaseMOV


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseHP:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     154             ; "{NAME}'s max. HP{N}are raised by {#}.{W2}"
                jsr     j_IncreaseMaxHP
                move.w  d7,d1
                jsr     j_IncreaseCurrentHP
                rts

    ; End of function FieldItem_IncreaseHP


; =============== S U B R O U T I N E =======================================


FieldItem_IncreaseMP:
                
                jsr     j_GetMaxMP
                tst.w   d1
                beq.s   byte_22BBC      
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     155             ; "{NAME}'s max. MP{N}are raised by {#}.{W2}"
                jsr     j_IncreaseMP
                move.w  d7,d1
                jsr     j_IncreaseCurrentMP
                bra.s   return_22BC0
byte_22BBC:
                
                txt     148             ; "It has no use.{W2}"
return_22BC0:
                
                rts

    ; End of function FieldItem_IncreaseMP

