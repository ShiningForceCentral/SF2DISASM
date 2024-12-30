
; ASM FILE code\common\stats\applystatusandequipeffectsonstats-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to combatant entry, d0.w = ally index
; Out: d1.b = movetype index


GetAllyMoveTypeFromClass:
                
                clr.w   d1
                move.b  COMBATANT_OFFSET_CLASS(a0),d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                addq.w  #CLASSDEF_OFFSET_MOVETYPE,d1
                getPointer p_table_ClassDefinitions, a2
                adda.w  d1,a2
                move.b  (a2),d1
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d1
                rts

    ; End of function LoadAllyClassData


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to combatant entry, d0.w = enemy index
; Out: d1.b = movetype index


GetEnemyMoveTypeFromDefinition:
                
                clr.w   d1
                move.b  COMBATANT_OFFSET_ENEMY_INDEX(a0),d1
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                addi.w  #COMBATANT_OFFSET_MOVETYPE_AND_AI,d1
                getPointer p_table_EnemyDefinitions, a2
                adda.w  d1,a2
                move.b  (a2),d1
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d1
                rts

    ; End of function LoadAllyClassData


; =============== S U B R O U T I N E =======================================

; Update all current stats


ApplyStatusEffectsAndItemsOnStats:
                
                movem.l d0-d3/a0-a2,-(sp)
                
                ; Initialize current stats
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_ATT_BASE(a0),COMBATANT_OFFSET_ATT_CURRENT(a0)
                move.b  COMBATANT_OFFSET_DEF_BASE(a0),COMBATANT_OFFSET_DEF_CURRENT(a0)
                move.b  COMBATANT_OFFSET_AGI_BASE(a0),COMBATANT_OFFSET_AGI_CURRENT(a0)
                move.b  COMBATANT_OFFSET_MOV_BASE(a0),COMBATANT_OFFSET_MOV_CURRENT(a0)
                getSavedWord (a0), d1, COMBATANT_OFFSET_RESIST_BASE
                setSavedWord d1, (a0), COMBATANT_OFFSET_RESIST_CURRENT
                move.b  COMBATANT_OFFSET_PROWESS_BASE(a0),COMBATANT_OFFSET_PROWESS_CURRENT(a0)
                
                ; Get all status effects except Curse
                getSavedWord (a0), d3, COMBATANT_OFFSET_STATUSEFFECTS ; Get Status Effects -> d3.w
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d3
                
                ; Initialize movetype while preserving current AI commandset
                tst.b   d0
                bmi.s   @Enemy
                
                bsr.s   GetAllyMoveTypeFromClass
                bra.s   @Continue
@Enemy:
                
                bsr.s   GetEnemyMoveTypeFromDefinition
@Continue:
                
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a0),d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_MOVETYPE_AND_AI(a0)
                
                ; Apply equip effects on stats
                movea.l a0,a1
                movea.l a0,a2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d2
@Loop:
                
                getSavedWord (a1), d1, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                
                isItemEquipped (a1)
                beq.s   @Next
                bsr.w   ApplyItemOnStats
                beq.s   @Next
                ori.w   #STATUSEFFECT_CURSE,d3
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d2,@Loop
                
                ; Apply status effects on stats
                bsr.s   ApplyStatusEffectsOnStats
                setSavedWord d3, (a2), COMBATANT_OFFSET_STATUSEFFECTS ; d3.w -> Set Status Effects
                movem.l (sp)+,d0-d3/a0-a2
                rts

    ; End of function ApplyStatusEffectsAndItemsOnStats


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

; In: d0.w = combatant index
;     d1.w = item index


ApplyItemOnStats:
                
                bsr.w   GetItemDefAddress
                tst.b   d0
                bmi.s   @Enemy
                
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
                beq.s   @Next
                
                cmpi.b  #EQUIPEFFECTS_MAX_INDEX,d2
                blo.s   @ExecuteEquipEffectFunction
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
                dc.l equipEffect_Nothing
                dc.l IncreaseCurrentAtt
                dc.l IncreaseCurrentDef
                dc.l IncreaseCurrentAgi
                dc.l IncreaseCurrentMov
                dc.l equipEffect_IncreaseCriticalProwess
                dc.l equipEffect_IncreaseDoubleAttackProwess
                dc.l equipEffect_IncreaseCounterAttackProwess
                dc.l equipEffect_IncreaseResistanceGroup1
                dc.l equipEffect_IncreaseResistanceGroup2
                dc.l DecreaseCurrentAtt
                dc.l DecreaseCurrentDef
                dc.l DecreaseCurrentAgi
                dc.l DecreaseCurrentMov
                dc.l equipEffect_DecreaseCriticalProwess
                dc.l equipEffect_DecreaseDoubleAttackProwess
                dc.l equipEffect_DecreaseCounterAttackProwess
                dc.l equipEffect_DecreaseResistanceGroup1
                dc.l equipEffect_DecreaseResistanceGroup2
                dc.l SetCurrentAtt
                dc.l SetCurrentDef
                dc.l SetCurrentAgi
                dc.l SetCurrentMov
                dc.l equipEffect_SetCriticalProwess
                dc.l equipEffect_SetDoubleAttackProwess
                dc.l equipEffect_SetCounterAttackProwess
                dc.l equipEffect_SetResistanceGroup1
                dc.l equipEffect_SetResistanceGroup2
                dc.l equipEffect_SetStatus
                dc.l equipEffect_SetMoveType
            if (FIX_CRITICAL_HIT_DEFINITIONS=1)
                dc.l equipEffect_SetCritical150
                dc.l equipEffect_SetCritical125
            else
                dc.l equipEffect_Nothing
                dc.l equipEffect_Nothing
            endif

; =============== S U B R O U T I N E =======================================


equipEffect_Nothing:
                
                rts

    ; End of function equipEffect_Nothing


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseCriticalProwess:
                
            if (FIX_CRITICAL_HIT_DEFINITIONS=1)
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                bhs.s   @Continue       ; skip if not a critical hit setting, i.e., no critical or ailment infliction
                
                ; Does the combatant currently inflict a regular or a stronger critical?
                cmpi.b  #4,d2
                bhs.s   @StrongerCritical
                
                ; Increase chance to perform a regular critical
                add.b   d1,d2
                bmi.s   @Min125                         ; clamp to zero on negative
                cmpi.b  #PROWESS_CRITICAL150_1IN32,d2
                moveq   #PROWESS_CRITICAL125_1IN4,d2    ; cap to highest regular (+25%) critical hit setting
                bra.s   @Continue
@Min125:        
                
                moveq   #0,d2
                bra.s   @Continue
@StrongerCritical:
                
                ; Increase chance to perform a stronger critical
                add.b   d1,d2
                cmpi.b  #PROWESS_CRITICAL150_1IN32,d2
                blt.s   @Min150                         ; clamp to 4 on less than and also on negative
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                blo.s   @Continue
                moveq   #PROWESS_CRITICAL150_1IN4,d2    ; cap to highest stronger (+50%) critical hit setting
                bra.s   @Continue
@Min150:        
                
                moveq   #4,d2
            else
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                bcc.s   @Continue                       ; skip if not a regular critical hit setting
                add.b   d1,d2
                bmi.s   @Zero                           ; clamp to zero on negative
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                blo.s   @Continue
                moveq   #PROWESS_CRITICAL125_1IN4,d2    ; cap to highest regular critical hit setting
                bra.s   @Continue
@Zero:          
                
                moveq   #0,d2
            endif
@Continue:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d1
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,d1
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_IncreaseCriticalProwess


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseDoubleAttackProwess:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                add.b   d1,d2
                bmi.s   @Zero           ; clamp to zero on negative
                cmpi.b  #4,d2
                blo.s   @Continue
                moveq   #3,d2           ; cap to highest double attack setting
                bra.s   @Continue
@Zero:          
                
                moveq   #0,d2
@Continue:
                
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,d1 ; FIX_INCREASE_DOUBLE_RESETS_COUNTER
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseCounterAttackProwess:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                add.b   d1,d2
                bmi.s   @Zero           ; clamp to zero on negative
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest counter attack setting
                bra.s   @Continue
@Zero:          
                
                moveq   #0,d2
@Continue:
                
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,d1
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts
                
    ; End of function equipEffect_IncreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetCriticalProwess:
                
                andi.b  #PROWESS_MASK_CRITICAL,d1
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,d2
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_SetCriticalProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetDoubleAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d1
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,d2
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_SetDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_SetCounterAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d1
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,d2
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_SetCounterAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_DecreaseCriticalProwess:
                
                neg.b   d1
                bra.w   equipEffect_IncreaseCriticalProwess

    ; End of function equipEffect_DecreaseCriticalProwess


; =============== S U B R O U T I N E =======================================


equipEffect_DecreaseDoubleAttackProwess:
                
                neg.b   d1
                bra.w   equipEffect_IncreaseDoubleAttackProwess

    ; End of function equipEffect_DecreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


equipEffect_DecreaseCounterAttackProwess:
                
                neg.b   d1
                bra.w   equipEffect_IncreaseCounterAttackProwess

    ; End of function equipEffect_DecreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================

equipEffect_IncreaseResistanceGroup2:

                movem.l d0-a5,-(sp)
                lsl.w   #8,d1
                bra.s   equipEffect_IncreaseResistance

    ; End of function equipEffect_IncreaseResistanceGroup2


; =============== S U B R O U T I N E =======================================

equipEffect_IncreaseResistanceGroup1:
                
                movem.l d0-a5,-(sp)
equipEffect_IncreaseResistance:
                moveq   #0,d4
                moveq   #0,d2
                moveq   #0,d3
                move.w  d1,d2
                moveq   #7,d5
                
@Loop_Elements:
                lsl.w   #2,d4
                getSavedWord (a2), d1, COMBATANT_OFFSET_RESIST_CURRENT ; Get Current Resistance -> d1.w
                move.w  d2,d3
                lsl.w   #1,d5
                ror.w   d5,d3
                andi.w  #3,d3
                ror.w   d5,d1
                andi.w  #3,d1
                add.b   d3,d1
                cmpi.b  #RESISTANCESETTING_MAJOR,d1
                ble.s   @ValidResist
                moveq   #RESISTANCESETTING_MAJOR,d1
@ValidResist:
                btst    #0,d1
                beq.s   @TestBit1
                bset    #0,d4
@TestBit1:
                
                btst    #1,d1
                beq.s   @NextElement
                bset    #1,d4
@NextElement:
                lsr.w   #1,d5
                dbf     d5,@Loop_Elements
                
                setSavedWord d4, (a2), COMBATANT_OFFSET_RESIST_CURRENT ; d4.w -> Set Current Resistance
                movem.l (sp)+,d0-a5
                rts

    ; End of function equipEffect_IncreaseResistanceGroup1


; =============== S U B R O U T I N E =======================================

equipEffect_DecreaseResistanceGroup2:
                
                movem.l d0-a5,-(sp)
                lsl.w   #8,d1
                bra.s   equipEffect_DecreaseResistance

    ; End of function equipEffect_DecreaseResistanceGroup2


; =============== S U B R O U T I N E =======================================

equipEffect_DecreaseResistanceGroup1:
                
                movem.l d0-a5,-(sp)
equipEffect_DecreaseResistance:
                moveq   #0,d4
                moveq   #0,d2
                moveq   #0,d3
                move.w  d1,d2
                moveq   #7,d5
                
@Loop_Elements:
                lsl.w   #2,d4
                getSavedWord (a2), d1, COMBATANT_OFFSET_RESIST_CURRENT ; Get Current Resistance -> d1.w
                move.w  d2,d3
                lsl.w   #1,d5
                ror.w   d5,d3
                andi.w  #3,d3
                ror.w   d5,d1
                andi.w  #3,d1
                sub.b   d3,d1
                bpl.s   @ValidResist
                moveq   #RESISTANCESETTING_WEAKNESS,d1
@ValidResist:
                btst    #0,d1
                beq.s   @TestBit1
                bset    #0,d4
@TestBit1:
                
                btst    #1,d1
                beq.s   @NextElement
                bset    #1,d4
@NextElement:
                lsr.w   #1,d5
                dbf     d5,@Loop_Elements
                
                setSavedWord d4, (a2), COMBATANT_OFFSET_RESIST_CURRENT ; d4.w -> Set Current Resistance
                movem.l (sp)+,d0-a5
                rts

    ; End of function equipEffect_DecreaseResistanceGroup1


; =============== S U B R O U T I N E =======================================

equipEffect_SetResistanceGroup2:
                
                movem.l d0-a5,-(sp)
                lsl.w   #8,d1
                ori.w   #RESIST_GROUP2_MASK,d1
                move.w  d1,d3
                jsr     GetCurrentResistance
                ori.w   #RESIST_GROUP1_MASK,d1
                bra.s   equipEffect_SetResistance

    ; End of function equipEffect_SetResistanceGroup2


; =============== S U B R O U T I N E =======================================

equipEffect_SetResistanceGroup1:
                
                movem.l d0-a5,-(sp)
                ori.w   #RESIST_GROUP1_MASK,d1
                move.w  d1,d3
                getSavedWord (a2), d1, COMBATANT_OFFSET_RESIST_CURRENT ; Get Current Resistance -> d1.w
                ori.w   #RESIST_GROUP2_MASK,d1
equipEffect_SetResistance:
                
                and.w   d3,d1
                setSavedWord d1, (a2), COMBATANT_OFFSET_RESIST_CURRENT ; d1.w -> Set Current Resistance
                movem.l (sp)+,d0-a5
                rts

    ; End of function equipEffect_SetResistanceGroup1


; =============== S U B R O U T I N E =======================================

equipEffect_SetStatus:
                
                bset    d1,d3
                rts

    ; End of function equipEffect_SetStatus


; =============== S U B R O U T I N E =======================================

equipEffect_SetMoveType:
                
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                lsl.b   #NIBBLE_SHIFT_COUNT,d1
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a2),d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_MOVETYPE_AND_AI(a2)
                rts

    ; End of function equipEffect_SetMoveType


; =============== S U B R O U T I N E =======================================


equipEffect_SetCritical150:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                bhs.s   @Continue       ; skip if not a critical hit setting, i.e., no critical or ailment infliction
                
                bset    #2,d2           ; put current critical in the 4-7 range
@Continue:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d1
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,d1
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_SetCritical150


; =============== S U B R O U T I N E =======================================


equipEffect_SetCritical125:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                bhs.s   @Continue       ; skip if not a critical hit setting, i.e., no critical or ailment infliction
                
                bclr    #2,d2           ; put current critical in the 0-3 range
@Continue:
                
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a2),d1
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,d1
                or.b    d2,d1
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a2)
                rts

    ; End of function equipEffect_SetCritical125

