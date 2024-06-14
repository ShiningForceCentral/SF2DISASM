
; ASM FILE code\common\stats\items\fielditemeffects.asm :
; 0x229EC..0x22C60 : Functions to perform effects from using items on an exploration field.

; =============== S U B R O U T I N E =======================================

; Find specific item index + code offset to run when used in field.
; 
;       In: d1.w = item entry


UseItemOnField:
                
                
                module
                movem.l d0-d1/d6-d7,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movem.l d1/a0,-(sp)
                lea     rjt_FieldItemEffects(pc), a0
@FindItem_Loop:
                
                cmpi.w  #-1,(a0)
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
                dc.w fieldItem_CurePoison-rjt_FieldItemEffects
                dc.w 5
                dc.w fieldItem_CurePoisonAndParalysis-rjt_FieldItemEffects
                dc.w 9
                dc.w fieldItem_IncreaseAtt-rjt_FieldItemEffects
                dc.w $A
                dc.w fieldItem_IncreaseDef-rjt_FieldItemEffects
                dc.w $B
                dc.w fieldItem_IncreaseAgi-rjt_FieldItemEffects
                dc.w $C
                dc.w fieldItem_IncreaseMov-rjt_FieldItemEffects
                dc.w $D
                dc.w fieldItem_IncreaseHp-rjt_FieldItemEffects
                dc.w $E
                dc.w fieldItem_IncreaseMp-rjt_FieldItemEffects
                dc.w $F
                dc.w fieldItem_LevelUp-rjt_FieldItemEffects
                dc.w $FFFF
@Done:
                
                movem.l (sp)+,d0-d1/d6-d7
                rts

    ; End of function UseItemOnField

                
                modend

; =============== S U B R O U T I N E =======================================


fieldItem_CurePoison:
                
                jsr     j_GetStatusEffects
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   byte_22A64      
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     149             ; "{NAME} is no longer{N}poisoned.{W2}"
                bra.s   loc_22A68
byte_22A64:
                
                txt     148             ; "It has no use.{W2}"
loc_22A68:
                
                jsr     j_SetStatusEffects
                rts

    ; End of function fieldItem_CurePoison


; =============== S U B R O U T I N E =======================================


fieldItem_CurePoisonAndParalysis:
                
                jsr     j_GetStatusEffects
                moveq   #0,d2
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   loc_22A88
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     149             ; "{NAME} is no longer{N}poisoned.{W2}"
                moveq   #-1,d2
loc_22A88:
                
                bclr    #STATUSEFFECT_BIT_STUN,d1
                beq.s   loc_22A98
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     156             ; "{NAME} is no longer{N}paralyzed.{W2}"
                moveq   #-1,d2
loc_22A98:
                
                tst.w   d2
                bne.s   loc_22AA0
                txt     148             ; "It has no use.{W2}"
loc_22AA0:
                
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function fieldItem_CurePoisonAndParalysis


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseAtt:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     150             ; "{NAME}'s attack{N}power is boosted by {#}.{W2}"
                jsr     j_IncreaseBaseAtt
                move.w  d7,d1
                jsr     j_IncreaseCurrentAtt
                rts

    ; End of function fieldItem_IncreaseAtt


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseDef:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     151             ; "{NAME}'s defensive{N}power is boosted by {#}.{W2}"
                jsr     j_IncreaseBaseDef
                move.w  d7,d1
                jsr     j_IncreaseCurrentDef
                rts

    ; End of function fieldItem_IncreaseDef


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseAgi:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     152             ; "{NAME}'s agility{N}is boosted by {#}.{W2}"
                jsr     j_IncreaseBaseAgi
                move.w  d7,d1
                jsr     j_IncreaseCurrentAgi
                rts

    ; End of function fieldItem_IncreaseAgi


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseMov:
                
                jsr     j_GetBaseMov
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
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     153             ; "{NAME}'s movement{N}range enlarged by {#}.{W2}"
                jsr     j_IncreaseBaseMov
                move.w  d7,d1
                jsr     j_IncreaseCurrentMov
                rts

    ; End of function fieldItem_IncreaseMov


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseHp:
                
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     154             ; "{NAME}'s max. HP{N}are raised by {#}.{W2}"
                jsr     j_IncreaseMaxHp
                move.w  d7,d1
                jsr     j_IncreaseCurrentHp
                rts

    ; End of function fieldItem_IncreaseHp


; =============== S U B R O U T I N E =======================================


fieldItem_IncreaseMp:
                
                module
                jsr     j_GetMaxMp
                tst.w   d1
                beq.s   byte_22BBC      
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.l   d1
                move.w  d7,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     155             ; "{NAME}'s max. MP{N}are raised by {#}.{W2}"
                jsr     j_IncreaseMaxMp
                move.w  d7,d1
                jsr     j_IncreaseCurrentMp
                bra.s   @Return
byte_22BBC:
                
                txt     148             ; "It has no use.{W2}"
@Return:
                
                rts

    ; End of function fieldItem_IncreaseMp

                modend

; =============== S U B R O U T I N E =======================================


fieldItem_LevelUp:
                
                moveq   #0,d1
                jsr     j_SetCurrentExp
                jsr     j_LevelUp
                lea     ((LEVELUP_ARGUMENTS-$1000000)).w,a5
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                clr.l   d1
                move.b  (a5)+,d1
                cmpi.b  #-1,d1
                bne.s   loc_22BEA
                txt     148             ; "It has no use.{W2}"
                bra.w   byte_22C5A      
loc_22BEA:
                
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     244             ; "{NAME} became{N}level {#}!"
                move.b  (a5)+,d1
                beq.s   loc_22BFE
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     266             ; "{D1}HP increased by {#}!"
loc_22BFE:
                
                move.b  (a5)+,d1
                beq.s   loc_22C0A
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     267             ; "{D1}MP increased by {#}!"
loc_22C0A:
                
                move.b  (a5)+,d1
                beq.s   loc_22C16
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     268             ; "{D1}Attack increased by {#}!"
loc_22C16:
                
                move.b  (a5)+,d1
                beq.s   loc_22C22
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     269             ; "{D1}Defense increased by {#}!"
loc_22C22:
                
                move.b  (a5)+,d1
                beq.s   loc_22C2E
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     270             ; "{D1}Agility increased by {#}!"
loc_22C2E:
                
                move.b  (a5)+,d1
                cmpi.b  #-1,d1
                beq.w   byte_22C5A      
                
                move.l  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2
                lsr.w   #SPELLENTRY_OFFSET_LV,d1
                bne.s   loc_22C4C
                move.w  d2,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     271             ; "{D1}{NAME} learned the new{N}magic spell {SPELL}!"
                bra.s   byte_22C5A      
loc_22C4C:
                
                addq.w  #1,d1
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                move.w  d2,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     272             ; "{D1}{SPELL} increased to{N}level {#}!"
byte_22C5A:
                
                txt     3523            ; "{W1}"
                rts

    ; End of function fieldItem_LevelUp

