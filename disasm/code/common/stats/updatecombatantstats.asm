
; ASM FILE code\common\stats\updatecombatantstats.asm :
; 0x89CE..0x8BD0 : Functions to apply equip and status effects on stats

; =============== S U B R O U T I N E =======================================

; Update all current stats


UpdateCombatantStats:
                
                movem.l d0-d3/a0-a2,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetStatusEffects
                move.w  d1,d3
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d3
                bsr.w   InitializeCurrentStats
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
                lea     COMBATANT_OFFSET_PROWESS_CURRENT(a0),a2
                bsr.w   ApplyStatusEffectsOnStats
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d2
@Loop:
                
                move.w  (a1),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                btst    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a1)
                beq.s   @Next
                bsr.w   ApplyItemOnStats
                beq.s   @Next
                ori.w   #STATUSEFFECT_CURSE,d3
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d2,@Loop
                
                move.w  (sp)+,d0
                move.w  d3,d1
                bsr.w   SetStatusEffects
                movem.l (sp)+,d0-d3/a0-a2
                rts

    ; End of function UpdateCombatantStats


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
;     d3.w = status effects bitfield


ApplyStatusEffectsOnStats:
                
                clr.l   d1
                move.w  d3,d2
                andi.w  #STATUSEFFECT_ATTACK,d2
                rol.w   #2,d2
                bsr.w   GetBaseAtt
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentAtt
                move.w  d3,d2
                andi.w  #STATUSEFFECT_BOOST,d2
                rol.w   #4,d2
                bsr.w   GetBaseDef
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentDef
                bsr.w   GetBaseAgi
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentAgi
                move.w  d3,d2
                andi.w  #STATUSEFFECT_SLOW,d2
                rol.w   #6,d2
                bsr.w   GetBaseDef
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   DecreaseCurrentDef
                bsr.w   GetBaseAgi
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   DecreaseCurrentAgi
                btst    #STATUSEFFECT_BIT_STUN,d3
                beq.s   @Return
                moveq   #1,d1
                bsr.w   DecreaseCurrentMov
                moveq   #5,d1
                bsr.w   DecreaseCurrentAgi
@Return:
                
                rts

    ; End of function ApplyStatusEffectsOnStats


; =============== S U B R O U T I N E =======================================

; In: a2 = prowess entry pointer
;     d0.w = combatant index
;     d1.w = item entry


ApplyItemOnStats:
                
                bsr.w   GetItemDefinitionAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                bra.s   @Continue       
@Enemy:
                
                clr.w   d2
@Continue:
                
                move    sr,-(sp)        ; store test result
                movem.l d1-d2/d7-a1,-(sp)
                lea     ITEMDEF_OFFSET_EQUIPEFFECTS(a0),a0
                clr.w   d2
                moveq   #EQUIPEFFECTS_COUNTER,d7
@Loop:
                
                move.b  1(a0),d1        ; value
                move.b  (a0),d2         ; effect code
                cmpi.b  #-1,d2
                beq.w   @Next
                
                cmpi.b  #EQUIPEFFECTS_MAX_INDEX,d2
                bcs.s   @ExecuteEquipEffectFunction
@InfiniteLoop:
                
                bra.s   @InfiniteLoop   ; caught in an infinite loop if equip effect index is too high
@ExecuteEquipEffectFunction:
                
                lsl.w   #INDEX_SHIFT_COUNT,d2
                lea     pt_EquipEffectFunctions(pc,d2.w),a1
                movea.l (a1),a1
                jsr     (a1)
@Next:
                
                addq.w  #EQUIPEFFECTS_ENTRY_SIZE,a0
                dbf     d7,@Loop        
                
                movem.l (sp)+,d1-d2/d7-a1
                rtr

    ; End of function ApplyItemOnStats

pt_EquipEffectFunctions:
                dc.l nullsub_8B22
                dc.l nullsub_8B22
                dc.l equipEffect_IncreaseCriticalProwess
                dc.l equipEffect_IncreaseDoubleAttackProwess
                dc.l equipEffect_IncreaseCounterAttackProwess
                dc.l nullsub_8B22
                dc.l IncreaseCurrentAtt
                dc.l IncreaseCurrentDef
                dc.l IncreaseCurrentAgi
                dc.l IncreaseCurrentMov
                dc.l DecreaseCurrentAtt
                dc.l DecreaseCurrentDef
                dc.l DecreaseCurrentAgi
                dc.l DecreaseCurrentMov
                dc.l equipEffect_SetCriticalProwess
                dc.l equipEffect_SetDoubleAttackProwess
                dc.l equipEffect_SetCounterAttackProwess

; =============== S U B R O U T I N E =======================================


nullsub_8B22:
                
                rts

    ; End of function nullsub_8B22


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseCriticalProwess:
                
                move.b  (a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #8,d2
                bcc.s   @Continue       ; skip if not a critical hit setting, i.e., no critical or ailment infliction
                
                add.b   d1,d2
                cmpi.b  #8,d2
                bcs.s   @Continue
                
                moveq   #7,d2           ; cap to highest regular critical hit setting
@Continue:
                
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,(a2)
                or.b    d2,(a2)
                rts

    ; End of function equipEffect_IncreaseCriticalProwess


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseDoubleAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                add.b   d1,d2
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest double attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL,(a2) ; BUG -- chance to counter attack is being set to 1/32
                                        ; counter attack setting should be masked as well
                or.b    d2,(a2)
                rts

    ; End of function equipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseCounterAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                add.b   d1,d2
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest counter attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,(a2)
                or.b    d2,(a2)
                rts

    ; End of function equipEffect_IncreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetCriticalProwess:
                
                andi.b  #PROWESS_MASK_CRITICAL,d1
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,(a2)
                or.b    d1,(a2)
                rts

    ; End of function equipEffect_SetCriticalProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetDoubleAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
                or.b    d1,(a2)
                rts

    ; End of function equipEffect_SetDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetCounterAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,(a2)
                or.b    d1,(a2)
                rts

    ; End of function equipEffect_SetCounterAttackProwess


; =============== S U B R O U T I N E =======================================


InitializeCurrentStats:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_ATT_BASE(a0),COMBATANT_OFFSET_ATT_CURRENT(a0)
                move.b  COMBATANT_OFFSET_DEF_BASE(a0),COMBATANT_OFFSET_DEF_CURRENT(a0)
                move.b  COMBATANT_OFFSET_AGI_BASE(a0),COMBATANT_OFFSET_AGI_CURRENT(a0)
                move.b  COMBATANT_OFFSET_MOV_BASE(a0),COMBATANT_OFFSET_MOV_CURRENT(a0)
                move.w  COMBATANT_OFFSET_RESIST_BASE(a0),COMBATANT_OFFSET_RESIST_CURRENT(a0)
                move.b  COMBATANT_OFFSET_PROWESS_BASE(a0),COMBATANT_OFFSET_PROWESS_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function InitializeCurrentStats

