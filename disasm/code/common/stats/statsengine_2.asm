
; ASM FILE code\common\stats\statsengine_2.asm :
; 0x855A..0x9484 : Character stats engine, part 2

; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to temporarily loaded name in RAM


LoadAllyName:
                
                tst.b   (a0)
                beq.s   @Return         ; skip copying name if entered string is null (and keep default name)
                
                movem.l d0/a0-a1,-(sp)
                lea     (a0),a1
                bsr.w   GetCombatantEntryAddress
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
@Loop:
                
                setSavedByteWithPostIncrement (a1)+, a0
                dbf     d0,@Loop
                
                movem.l (sp)+,d0/a0-a1
@Return:
                
                rts

    ; End of function LoadAllyName


; =============== S U B R O U T I N E =======================================


SetClass:
                
                setSavedCombatantByte COMBATANT_OFFSET_CLASS
                rts

    ; End of function SetClass


; =============== S U B R O U T I N E =======================================


SetLevel:
                
                setSavedCombatantByte COMBATANT_OFFSET_LEVEL
                rts

    ; End of function SetLevel


; =============== S U B R O U T I N E =======================================


SetMaxHp:
                
                setSavedCombatantWord COMBATANT_OFFSET_HP_MAX
                rts

    ; End of function SetMaxHp


; =============== S U B R O U T I N E =======================================


SetCurrentHp:
                
                setSavedCombatantWord COMBATANT_OFFSET_HP_CURRENT
                rts

    ; End of function SetCurrentHp


; =============== S U B R O U T I N E =======================================


SetMaxMp:
                
                setSavedCombatantByte COMBATANT_OFFSET_MP_MAX
                rts

    ; End of function SetMaxMp


; =============== S U B R O U T I N E =======================================


SetCurrentMp:
                
                setSavedCombatantByte COMBATANT_OFFSET_MP_CURRENT
                rts

    ; End of function SetCurrentMp


; =============== S U B R O U T I N E =======================================


SetBaseAtt:
                
                setSavedCombatantByte COMBATANT_OFFSET_ATT_BASE
                rts

    ; End of function SetBaseAtt


; =============== S U B R O U T I N E =======================================


SetCurrentAtt:
                
                setSavedCombatantByte COMBATANT_OFFSET_ATT_CURRENT
                rts

    ; End of function SetCurrentAtt


; =============== S U B R O U T I N E =======================================


SetBaseDef:
                
                setSavedCombatantByte COMBATANT_OFFSET_DEF_BASE
                rts

    ; End of function SetBaseDef


; =============== S U B R O U T I N E =======================================


SetCurrentDef:
                
                setSavedCombatantByte COMBATANT_OFFSET_DEF_CURRENT
                rts

    ; End of function SetCurrentDef


; =============== S U B R O U T I N E =======================================


SetBaseAgi:
                
                setSavedCombatantByte COMBATANT_OFFSET_AGI_BASE
                rts

    ; End of function SetBaseAgi


; =============== S U B R O U T I N E =======================================


SetCurrentAgi:
                
                setSavedCombatantByte COMBATANT_OFFSET_AGI_CURRENT
                rts

    ; End of function SetCurrentAgi


; =============== S U B R O U T I N E =======================================


SetBaseMov:
                setSavedCombatantByte COMBATANT_OFFSET_MOV_BASE
                rts

    ; End of function SetBaseMov


; =============== S U B R O U T I N E =======================================


SetCurrentMov:
                
                setSavedCombatantByte COMBATANT_OFFSET_MOV_CURRENT
                rts

    ; End of function SetCurrentMov


; =============== S U B R O U T I N E =======================================


SetBaseResistance:
                
                setSavedCombatantWord COMBATANT_OFFSET_RESIST_BASE
                rts

    ; End of function SetBaseResistance


; =============== S U B R O U T I N E =======================================


SetCurrentResistance:
                
                setSavedCombatantWord COMBATANT_OFFSET_RESIST_CURRENT
                rts

    ; End of function SetCurrentResistance


; =============== S U B R O U T I N E =======================================


SetBaseProwess:
                
                setSavedCombatantByte COMBATANT_OFFSET_PROWESS_BASE
                rts

    ; End of function SetBaseProwess


; =============== S U B R O U T I N E =======================================


SetCurrentProwess:
                
                setSavedCombatantByte COMBATANT_OFFSET_PROWESS_CURRENT
                rts

    ; End of function SetCurrentProwess


; =============== S U B R O U T I N E =======================================


SetStatusEffects:
                
                setSavedCombatantWord COMBATANT_OFFSET_STATUSEFFECTS
                rts

    ; End of function SetStatusEffects


; =============== S U B R O U T I N E =======================================


SetCombatantX:
                
                setSavedCombatantByte COMBATANT_OFFSET_X
                rts

    ; End of function SetCombatantX


; =============== S U B R O U T I N E =======================================


SetCombatantY:
                
                setSavedCombatantByte COMBATANT_OFFSET_Y
                rts

    ; End of function SetCombatantY


; =============== S U B R O U T I N E =======================================


SetCurrentExp:
                
                setSavedCombatantByte COMBATANT_OFFSET_EXP
                rts

    ; End of function SetCurrentExp


; =============== S U B R O U T I N E =======================================


SetMoveType:
                
                setSavedCombatantByte COMBATANT_OFFSET_MOVETYPE_AND_AI
                rts

    ; End of function SetMoveType


; =============== S U B R O U T I N E =======================================


SetAiSpecialMoveOrders:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movem.l d1-d2/a0,-(sp)
                lsl.w   #8,d1
                andi.w  #$FF,d2
                or.w    d2,d1
                bsr.w   GetCombatantEntryAddress
                movep.w d1,COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS(a0)
                movem.l (sp)+,d1-d2/a0
            else
                movem.l d1-d2/d7-a0,-(sp)
                lsl.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d2
                or.w    d2,d1
                moveq   #COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d1-d2/d7-a0
            endif
                rts

    ; End of function SetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================


SetAiRegion:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movem.l d1-d2/a0,-(sp)
                lsl.b   #4,d1
                andi.b  #$F,d2
                or.b    d2,d1
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_AI_REGION(a0)
                movem.l (sp)+,d1-d2/a0
            else
                movem.l d1-d2/d7-a0,-(sp)
                lsl.b   #NIBBLE_SHIFT_COUNT,d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                or.b    d2,d1
                moveq   #COMBATANT_OFFSET_AI_REGION,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d1-d2/d7-a0
            endif
                rts

    ; End of function SetAiRegion


; =============== S U B R O U T I N E =======================================


SetActivationBitfield:
                
                setSavedCombatantWord COMBATANT_OFFSET_ACTIVATION_BITFIELD
                rts

    ; End of function SetActivationBitfield


; =============== S U B R O U T I N E =======================================


SetEnemyIndex:
                
                setSavedCombatantByte COMBATANT_OFFSET_ENEMY_INDEX
                rts

    ; End of function SetEnemyIndex


; =============== S U B R O U T I N E =======================================


IncreaseLevel:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_LEVEL,d6
                moveq   #COMBATANT_OFFSET_LEVEL,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseLevel


; =============== S U B R O U T I N E =======================================


IncreaseMaxHp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_HP,d6
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxHp


; =============== S U B R O U T I N E =======================================


IncreaseCurrentHp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                getSavedWord (a0), d6, COMBATANT_OFFSET_HP_MAX
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentHp


; =============== S U B R O U T I N E =======================================


IncreaseMaxMp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MP,d6
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxMp


; =============== S U B R O U T I N E =======================================


IncreaseCurrentMp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMp


; =============== S U B R O U T I N E =======================================


IncreaseBaseAtt:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseAtt


; =============== S U B R O U T I N E =======================================


IncreaseCurrentAtt:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentAtt


; =============== S U B R O U T I N E =======================================


IncreaseBaseDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseDef


; =============== S U B R O U T I N E =======================================


IncreaseCurrentDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentDef


; =============== S U B R O U T I N E =======================================


IncreaseBaseAgi:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_BASE,d6
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   Clamp7BitIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseAgi


; =============== S U B R O U T I N E =======================================


IncreaseCurrentAgi:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_CURRENT,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   Clamp7BitIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentAgi


; =============== S U B R O U T I N E =======================================


IncreaseBaseMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseMov


; =============== S U B R O U T I N E =======================================


IncreaseCurrentMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMov


; =============== S U B R O U T I N E =======================================


IncreaseExp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_EXP,d6
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseExp


; =============== S U B R O U T I N E =======================================


IncreaseKills:
                
                tst.b   d0
                blt.s   @Return
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #9999,d6
                moveq   #COMBATANT_OFFSET_ALLY_KILLS,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
@Return:
                
                rts

    ; End of function IncreaseKills


; =============== S U B R O U T I N E =======================================


IncreaseDefeats:
                
                tst.b   d0
                blt.s   @Return
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #9999,d6
                moveq   #COMBATANT_OFFSET_ALLY_DEFEATS,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
@Return:
                
                rts

    ; End of function IncreaseDefeats


; =============== S U B R O U T I N E =======================================


DecreaseCurrentHp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                getSavedWord (a0), d6, COMBATANT_OFFSET_HP_MAX
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   DecreaseAndClampWord
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentHp


; =============== S U B R O U T I N E =======================================


DecreaseCurrentMp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentMp


; =============== S U B R O U T I N E =======================================


DecreaseCurrentAtt:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentAtt


; =============== S U B R O U T I N E =======================================

; unused


DecreaseBaseDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseDef


; =============== S U B R O U T I N E =======================================


DecreaseCurrentDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentDef


; =============== S U B R O U T I N E =======================================

; unused


DecreaseBaseAgi:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_AGI_DECREASING,d6
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseAgi


; =============== S U B R O U T I N E =======================================


DecreaseCurrentAgi:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_AGI_DECREASING,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentAgi


; =============== S U B R O U T I N E =======================================

; unused


DecreaseBaseMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseMov


; =============== S U B R O U T I N E =======================================


DecreaseCurrentMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentMov


; =============== S U B R O U T I N E =======================================


GetClassAndFullName:
            if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                bsr.w   GetClass
GetFullClassName:
                
                lea     table_FullClassNames,a0
                bra.s   FindName
            endif
GetClassAndName:
            if (STANDARD_BUILD=1)
                bsr.w   GetClass
            endif
GetClassName:
                
                getPointer p_table_ClassNames, a0

    ; End of function GetClassName


; =============== S U B R O U T I N E =======================================

; In: a0 = names list pointer, d1.w = name index
; Out: a0 = pointer to name entry, d7.w = name length


FindName:
                
                move.w  d0,-(sp)
                subq.w  #1,d1
                bmi.s   @Done           ; done if name index = 0
                clr.w   d0
@Loop:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d1,@Loop
@Done:
                
                clr.w   d7
                move.b  (a0)+,d7
                move.w  (sp)+,d0
                rts

    ; End of function FindName


; =============== S U B R O U T I N E =======================================


SetGold:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (CURRENT_GOLD).l,a0
                movep.l d1,0(a0)
                movea.l (sp)+,a0
            else
                move.l  d1,((CURRENT_GOLD-$1000000)).w
            endif
                rts

    ; End of function SetGold


; =============== S U B R O U T I N E =======================================


GetGold:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (CURRENT_GOLD).l,a0
                movep.l 0(a0),d1
                movea.l (sp)+,a0
            else
                move.l  ((CURRENT_GOLD-$1000000)).w,d1
            endif
                rts

    ; End of function GetGold


; =============== S U B R O U T I N E =======================================


IncreaseGold:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  d0,-(sp)
                move.l  d1,d0
                bsr.s   GetGold
                add.l   d0,d1
            else
                add.l   ((CURRENT_GOLD-$1000000)).w,d1
            endif
                bcs.s   @CapGoldAmount
                cmpi.l  #FORCE_MAX_GOLD,d1
                bls.s   @Continue
@CapGoldAmount:
                
                move.l  #FORCE_MAX_GOLD,d1
@Continue:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   SetGold
                move.l  (sp)+,d0
            else
                move.l  d1,((CURRENT_GOLD-$1000000)).w
            endif
                rts

    ; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================


DecreaseGold:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  d0,-(sp)
                move.l  d1,d0
                bsr.s   GetGold
                sub.l   d0,d1
                bcc.s   @Continue
                moveq   #0,d1
            else
                movem.l d0,-(sp)
                move.l  ((CURRENT_GOLD-$1000000)).w,d0
                sub.l   d1,d0
                bcc.s   @Continue
                moveq   #0,d0
            endif
@Continue:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   SetGold
                move.l  (sp)+,d0
            else
                move.l  d0,((CURRENT_GOLD-$1000000)).w
                move.l  d0,d1
                movem.l (sp)+,d0
            endif
                rts

    ; End of function DecreaseGold


; =============== S U B R O U T I N E =======================================

; Update all current stats


ApplyStatusEffectsAndItemsOnStats:
                
                movem.l d0-d3/a0-a2,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetStatusEffects
                move.w  d1,d3
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d3
                bsr.w   InitializeCurrentStats
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movea.l a0,a1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
            endif
                lea     COMBATANT_OFFSET_PROWESS_CURRENT(a0),a2
                bsr.w   ApplyStatusEffectsOnStats
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d2
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a1),d1
            else
                move.w  (a1),d1
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                
                isItemEquipped (a1)
                beq.s   @Next
                bsr.w   ApplyItemOnStats
                beq.s   @Next
                ori.w   #4,d3
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d2,@Loop
                
                move.w  (sp)+,d0
                move.w  d3,d1
                bsr.w   SetStatusEffects
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

; In: a2 = prowess entry pointer
;     d0.w = combatant index
;     d1.w = item index


ApplyItemOnStats:
                
                bsr.w   GetItemDefAddress
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
                
                bra.s   @InfiniteLoop   ; caught in an inifinite loop if equip effect index is too high
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
            if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
                dc.l nullsub_8B22
                dc.l IncreaseCurrentATT
                dc.l IncreaseCurrentDEF
                dc.l IncreaseCurrentAGI
                dc.l IncreaseCurrentMOV
                dc.l EquipEffect_IncreaseCriticalProwess
                dc.l EquipEffect_IncreaseDoubleAttackProwess
                dc.l EquipEffect_IncreaseCounterAttackProwess
                dc.l EquipEffect_IncreaseResistanceGroup1
                dc.l EquipEffect_IncreaseResistanceGroup2
                dc.l DecreaseCurrentATT
                dc.l DecreaseCurrentDEF
                dc.l DecreaseCurrentAGI
                dc.l DecreaseCurrentMOV
                dc.l EquipEffect_DecreaseCriticalProwess
                dc.l EquipEffect_DecreaseDoubleAttackProwess
                dc.l EquipEffect_DecreaseCounterAttackProwess
                dc.l EquipEffect_DecreaseResistanceGroup1
                dc.l EquipEffect_DecreaseResistanceGroup2
                dc.l SetCurrentATT
                dc.l SetCurrentDEF
                dc.l SetCurrentAGI
                dc.l SetCurrentMOV
                dc.l EquipEffect_SetCriticalProwess
                dc.l EquipEffect_SetDoubleAttackProwess
                dc.l EquipEffect_SetCounterAttackProwess
                dc.l EquipEffect_SetResistanceGroup1
                dc.l EquipEffect_SetResistanceGroup2
                dc.l EquipEffect_SetStatus
            else
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
                dc.l EquipEffect_SetCriticalProwess
                dc.l EquipEffect_SetDoubleAttackProwess
                dc.l EquipEffect_SetCounterAttackProwess
            endif

; =============== S U B R O U T I N E =======================================


nullsub_8B22:
                
                rts

    ; End of function nullsub_8B22


; =============== S U B R O U T I N E =======================================


equipEffect_IncreaseCriticalProwess:
                
                move.b  (a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #8,d2
                bcc.s   @Skip           ; skip if not a regular critical hit setting
                add.b   d1,d2
                cmpi.b  #8,d2
                bcs.s   @Skip
                moveq   #7,d2           ; cap to highest regular critical hit setting
@Skip:
                
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
            if (STANDARD_BUILD&FIX_INCREASE_DOUBLE_RESETS_COUNTER=1)
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
            else
                andi.b  #PROWESS_MASK_CRITICAL,(a2) ; BUG -- chance to counter attack is being set to 1/32
            endif                       ; counter attack setting should be masked as well
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

            if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
                include "code\common\stats\additionalequipeffects-standard.asm"
            endif

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
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_RESIST_BASE(a0),d1
                movep.w d1,COMBATANT_OFFSET_RESIST_CURRENT(a0)
            else
                move.w  COMBATANT_OFFSET_RESIST_BASE(a0),COMBATANT_OFFSET_RESIST_CURRENT(a0)
            endif
                move.b  COMBATANT_OFFSET_PROWESS_BASE(a0),COMBATANT_OFFSET_PROWESS_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function InitializeCurrentStats


; =============== S U B R O U T I N E =======================================

; In: D1 = item entry
; Out: A0 = address of name
;      D7 = length of name


FindItemName:
                
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                getPointer p_table_ItemNames, a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindItemName


; =============== S U B R O U T I N E =======================================

; Out: A0 = pointer to definition for item D1


GetItemDefAddress:
                
                move.l  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                mulu.w  #ITEMDEF_SIZE,d1
                getPointer p_table_ItemDefinitions, a0
                adda.w  d1,a0
                move.l  (sp)+,d1
                rts

    ; End of function GetItemDefAddress


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d1.w = item entry, d2.l = number of items held


GetItemBySlotAndHeldItemsNumber:
                
                movem.l d0/d3/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,d3
                add.w   d1,d1
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
                movea.l d3,a0
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a0
                add.w   d1,d1
                move.w  (a0,d1.w),d1    ; move item d1 word in d1
            endif
                moveq   #0,d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
@Loop:
                
                getSavedWordWithPostIncrement a0, d0, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_NOTHING,d0
                beq.s   @Nothing
                addq.w  #1,d2
@Nothing:
                
                dbf     d3,@Loop
                
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetItemBySlotAndHeldItemsNumber


; =============== S U B R O U T I N E =======================================

; Get equipment type for item d1.w -> d2.w (0 = none, 1 = weapon, -1 = ring)


GetEquipmentType:
                
                move.l  a0,-(sp)
                bsr.s   GetItemDefAddress
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                add.w   #ITEMDEF_OFFSET_TYPE,a0
            else
                addq.w  #ITEMDEF_OFFSET_TYPE,a0
            endif
                btst    #ITEMTYPE_BIT_WEAPON,(a0)
                bne.s   @Weapon         
                btst    #ITEMTYPE_BIT_RING,(a0)
                bne.s   @Ring           
                clr.w   d2              ; other
                bra.s   @Other
@Ring:
                
                move.w  #EQUIPMENTTYPE_RING,d2 ; ring
@Other:
                
                bra.s   @Done
@Weapon:
                
                move.w  #EQUIPMENTTYPE_WEAPON,d2 ; weapon
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetEquipmentType


; =============== S U B R O U T I N E =======================================

; Get equipped weapon and slot indexes for combatant d0.b -> d1.w, d2.w (-1 if nothing equipped)


GetEquippedWeapon:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d4
                bra.s   GetEquippedItemByType

    ; End of function GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; Get equipped ring and slot indexes for combatant d0.b -> d1.w, d2.w (-1 if nothing equipped)


GetEquippedRing:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d4

    ; End of function GetEquippedRing


; START OF FUNCTION CHUNK FOR GetEquippedWeapon

GetEquippedItemByType:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movea.l a0,a1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
            endif
                clr.w   d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
@Loop:
                
                getSavedWordWithPostIncrement a1, d1, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next           ; item not equipped, check next item
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next           ; no item in slot, check next item
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d4,d1
                bne.s   @Break          ; found equipped item matching the given type, break out of loop
@Next:
                
                addq.w  #1,d2           ; return item slot in D2
                dbf     d3,@Loop
                
                move.w  #-1,d1
                move.w  d1,d2
                bra.s   @Done
@Break:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS-ITEMENTRY_SIZE(a1),d1
            else
                move.w  -(a1),d1        ; get item from previous slot
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
@Done:
                
                movem.l (sp)+,d3-d4/a0-a1
                rts

; END OF FUNCTION CHUNK FOR GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item entry
; Out: d2.w = 0 if item successfully added, 1 if no empty slot available


AddItem:
                
                movem.l d0/a0,-(sp)
            if (STANDARD_BUILD&FIX_ENEMY_BATTLE_EQUIP=1)
                tst.b   d0
                bmi.s   @SkipMasking
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
@SkipMasking:
            endif
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a0
            endif
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                getSavedWordWithPostIncrement a0, d2, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   @Break
                dbf     d0,@Loop        ; loop over all items to make sure there's a slot open
                
                move.w  #1,d2           ; no empty slot available
                bra.s   @Done
@Break:
            if (STANDARD_BUILD&FIX_ENEMY_BATTLE_EQUIP=1)
            else
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
            endif
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,COMBATANT_OFFSET_ITEMS-ITEMENTRY_SIZE(a0)
            else
                move.w  d1,-(a0)        ; move item in empty slot
            endif
                clr.w   d2
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function AddItem


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item slot
; 
; Out: D2 = 3 if item slot is empty


BreakItemBySlot:
                
                movem.l d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Nothing
                breakItem (a0)
                clr.w   d2
                bra.s   @Done
@Nothing:
                
                move.w  #3,d2           ; code 3: nothing
@Done:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function BreakItemBySlot


; =============== S U B R O U T I N E =======================================


RepairItemBySlot:
                
                movem.l d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Nothing       
                repairItem (a0)
                beq.s   @NotBroken
                clr.w   d2
                bra.s   @Goto_Done
@NotBroken:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                moveq   #1,d1
            else
                move.w  #1,d1           ; clear zero-bit if item was not broken
            endif
@Goto_Done:
                
                bra.s   @Done
@Nothing:
                
                move.w  #3,d2           ; code 3: nothing
@Done:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function RepairItemBySlot


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2.w = 0 if equipped, 1 if not, 2 if equipped and cursed, 3 if item is nothing


EquipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1           ; item slot -> additional offset
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1         ; get item entry
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1 ; test if item is "nothing"
                beq.s   @Nothing        
                bsr.s   IsItemEquippableAndCursed
                cmpi.w  #1,d2
                beq.s   @Goto_Done      ; skip if item is not equippable
                
                equipItem (a0)
@Goto_Done:
                
                bra.s   @Done
@Nothing:
                
                move.w  #3,d2           ; code 3: item is "nothing"
@Done:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function EquipItemBySlot


; =============== S U B R O U T I N E =======================================

; Is item d1.w equippable by ally d0.b and if so, is it cursed?
; 
;   Out: d2.w = 0 if equippable, 1 if not, 2 if equippable and cursed


IsItemEquippableAndCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                addq.b  #1,d0
                bsr.w   GetItemDefAddress
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.l  a0,-(sp)
@EquipFlag_Loop:
                move.l  (a0)+,d1         ; get class-equippable bitfield
                cmpi.b  #32,d0
                bls.s   @EquipCompare
                subi.b  #32,d0
                bra.s   @EquipFlag_Loop
@EquipCompare:
                lsr.l   d0,d1           ; push relevant class-equippable bit into carry
                movea.l (sp)+,a0
                bcc.s   @NotEquippable
            else
                move.l  (a0),d1         ; get class-equippable bitfield
                lsr.l   d0,d1           ; push relevant class-equippable bit into carry
                bcc.s   @NotEquippable
            endif
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0) 
                                                        ; test cursed bit of itemdef's misc byte
                bne.s   @EquippableAndCursed
                clr.w   d2              ; code 0: equippable
                bra.s   @Goto_Done
@EquippableAndCursed:
                
                move.w  #2,d2           ; code 2: equippable, but cursed
@Goto_Done:
                
                bra.s   @Done
@NotEquippable:
                
                move.w  #1,d2           ; code 1: not equippable
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsItemEquippableAndCursed


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2.w = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, 3 if nothing


UnequipItemBySlotIfNotCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedOrCursed
                tst.w   d2
                bne.s   @Skip           ; skip if anything but equipped and not cursed
                unequipItem (a0)
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================

; Is item in slot d1.w equipped by combatant d0.b, and if so, is it cursed?
; 
;   In: d0.b = combatant index, d1.w = item slot
; 
;   Out: a0 = pointer to item entry
;        d2.w = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, 3 if neither


IsItemInSlotEquippedOrCursed:
                
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @EmptySlot      
                isItemEquipped (a0)
                beq.s   @NotEquipped    
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movea.l (sp)+,a0
            else
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movem.l (sp)+,a0
            endif
                bne.s   @Cursed         
                clr.w   d2              ; not cursed
                bra.s   @Goto_Done
@Cursed:
                
                move.w  #2,d2           ; cursed
@Goto_Done:
                
                bra.s   @Done
@NotEquipped:
                
                move.w  #1,d2           ; not equipped
@Done:
                
                bra.s   @Return
@EmptySlot:
                
                move.w  #3,d2           ; empty slot
@Return:
                
                rts

    ; End of function IsItemInSlotEquippedOrCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item slot
; 
; Out: D2 = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, 3 if nothing


UnequipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedOrCursed
                unequipItem (a0)
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipItemBySlot


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item slot
; 
; Out: D2 = 2 if not dropped, 3 if dropped or nothing


DropItemBySlot:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1
            endif
                move.w  #3,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Done
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movea.l (sp)+,a0
            else
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movem.l (sp)+,a0
            endif
                beq.s   @NotCursed
                move.w  #2,d2           ; item cursed
                isItemEquipped (a0)
                bne.s   @Done           ; item equipped and cursed, so can't drop it
@NotCursed:
                
                bsr.s   RemoveAndArrangeItems
@Done:
                
                movem.l (sp)+,d0/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function DropItemBySlot


; =============== S U B R O U T I N E =======================================

; In: a0 = combatant items address (or combatant entry address if RELOCATED_SAVED_DATA_TO_SRAM is enabled)
;     d0.w = item slot
;
; Out: d2.w = 0


RemoveAndArrangeItems:
                
                move.w  #2,d2
                sub.w   d0,d2           ; subtract item slot from 2 to make loop counter
                bmi.s   @Skip           ; no items to rearrange, so skip to removal
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS+ITEMENTRY_SIZE(a0),d0
                movep.w d0,COMBATANT_OFFSET_ITEMS(a0)
            else
                move.w  ITEMENTRY_SIZE(a0),(a0) ; shift item -1 slots
            endif
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d2,@Loop        
@Skip:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  #ITEM_NOTHING,d0
                movep.w d0,COMBATANT_OFFSET_ITEMS(a0)
            else
                move.w  #ITEM_NOTHING,(a0) ; replace item with nothing
            endif
                clr.w   d2
                rts

    ; End of function RemoveAndArrangeItems


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2.w = 3 if nothing to remove, 0 otherwise


RemoveItemBySlot:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d1
            endif
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   @Nothing
                bsr.s   RemoveAndArrangeItems
                bra.w   @Done
@Nothing:
                
                move.w  #3,d2
@Done:
                
                movem.l (sp)+,d0/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function RemoveItemBySlot


; =============== S U B R O U T I N E =======================================


UnequipWeapon:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2
                bra.s   UnequipItemByType

    ; End of function UnequipWeapon


; =============== S U B R O U T I N E =======================================


UnequipRing:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d2

    ; End of function UnequipRing


; START OF FUNCTION CHUNK FOR UnequipWeapon

UnequipItemByType:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movea.l a0,a1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
            endif
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a1),d1
            else
                move.w  (a1),d1
            endif
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d2,d1
                beq.s   @Next
                
                unequipItem (a1)
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d0,@Loop
                
                movem.l (sp)+,d0-d2/a0-a1
                bra.w   ApplyStatusEffectsAndItemsOnStats

; END OF FUNCTION CHUNK FOR UnequipWeapon


; =============== S U B R O U T I N E =======================================

; Out: A0 = pointer to equippable items list
;      D1 = equippable weapons count


GetEquippableWeapons:
                
                module ; Start of equippable items getter module
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2
                bra.s   GetEquippableItemsByType

    ; End of function GetEquippableWeapons


; =============== S U B R O U T I N E =======================================

; Out: A0 = pointer to equippable items list
;      D1 = equippable rings count


GetEquippableRings:
                
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #ITEMTYPE_RING,d2

    ; End of function GetEquippableRings


; START OF FUNCTION CHUNK FOR GetEquippableWeapons

GetEquippableItemsByType:
                
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3           ; place class bit in long value
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
            endif
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                
                ; Initialize list with default values
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,(a2)
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,4(a2)
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,8(a2)
                move.l  #(ICON_UNARMED<<WORD_SHIFT_COUNT)|4,12(a2)
                clr.w   d0
                moveq   #0,d4
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d5
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a0),d1
                addq.w  #ITEMENTRY_SIZE,a0
            else
                move.w  (a1)+,d1
            endif
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next           ; next if empty slot
                bsr.s   IsItemEquippable
                bcc.s   @Next           ; branch if not equippable
                move.w  d1,(a2)+        ; item index -> equippable items list
                move.w  d4,(a2)+        ; item slot -> equippable items list
                addq.w  #1,d0
@Next:
                
                addq.w  #1,d4
                dbf     d5,@Loop
                
                move.w  d0,d1
                movem.l (sp)+,d0/d2-d6/a1-a2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                rts

; END OF FUNCTION CHUNK FOR GetEquippableWeapons

                modend ; End of equippable items getter module

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index
;     d2.w = item type bitmask (for ANDing the item type bitfield)
;     d3.l = class equip bitmask (for ANDing the item equip bitfield)
; 
; Out: CCR carry-bit set if true


IsItemEquippable:
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                movem.l d7/a0,-(sp)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d6
                and.b   d2,d6
                beq.s   @Done           ; skip if not a weapon/ring
                lsl.w   #2,d7
                adda.l  d7,a0
                move.l  (a0),d6
                and.l   d3,d6
                beq.s   @Done
                ori     #1,ccr          ; set carry flag : Item is Equippable !
@Done:
                
                movem.l (sp)+,d7/a0
                rts
            else
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d6
                and.b   d2,d6
                beq.s   @Done           ; skip if not a weapon/ring
                move.l  (a0),d6
                and.l   d3,d6
                beq.s   @Done
                ori     #1,ccr          ; set carry flag : Item is Equippable !
@Done:
                
                movem.l (sp)+,a0
                rts
            endif

    ; End of function IsItemEquippable


; =============== S U B R O U T I N E =======================================

; Is weapon or ring d1.w equippable by combatant d0.w?
; Return CCR carry-bit set if true.


IsWeaponOrRingEquippable:
                
                movem.l d0/d2-d6/a0,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3
                bsr.s   IsItemEquippable
                movem.l (sp)+,d0/d2-d6/a0
                rts

    ; End of function IsWeaponOrRingEquippable


; =============== S U B R O U T I N E =======================================

; In: d1.w = index of new item being equipped
; Out: d2.w, d3.w = new ATT and DEF


GetEquipNewAttAndDef:
                
                movem.l d0/d4-d6/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3 ; default to current ATT and DEF with currently equipped item
                
                ; Is new item equippable?
                movem.w d0/d2-d3,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
                clr.w   d0
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                bsr.w   IsItemEquippable
            else
                bsr.s   IsItemEquippable
            endif
                movem.w (sp)+,d0/d2-d3
                bcc.w   @Skip           ; skip if item is not equippable
                
                ; Get new item type
                movem.l d1/a0,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d2
                movem.l (sp)+,d1/a0
                
                andi.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2 ; get weapon/ring type
                bsr.w   GetNewAttAndDefWithItemEquipped
@Skip:
                
                movem.l (sp)+,d0/d4-d6/a0
                rts

    ; End of function GetEquipNewAttAndDef


; =============== S U B R O U T I N E =======================================

; In: a0 = combatant entry address
;     d1.w = new item index
;     d2.w = new item type (weapon or ring)
; 
; Out: d2.w = current ATT with new item equipped
;      d3.w = current DEF with new item equipped


GetNewAttAndDefWithItemEquipped:
                
            if (STANDARD_BUILD=1)
                include "code\common\stats\getnewattanddefwithitemequipped-standard.asm"
            else
                movem.l d0-d1/d4-a0,-(sp)
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
@FindEquippedItem_Loop:
                
                move.w  COMBATANT_OFFSET_ITEMS(a0,d4.w),d5 ; find currently equipped item of the same type as the new one
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   @Next
                
                movem.l d0-d1/a0,-(sp)  ; it's equipped
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d0
                and.b   d2,d0
                movem.l (sp)+,d0-d1/a0
                bne.w   @GetNewAttAndDef ; is the item type we're looking for, so start with this one
@Next:
                
                addq.w  #ITEMENTRY_SIZE,d4
                dbf     d7,@FindEquippedItem_Loop
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
@FindFirstUnequippedItem_Loop:
                
                move.w  COMBATANT_OFFSET_ITEMS(a0,d4.w),d5
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.w   @GetNewAttAndDef
                addq.w  #ITEMENTRY_SIZE,d4
                dbf     d7,@FindFirstUnequippedItem_Loop
                
                clr.w   d4              ; default to the first item slot
@GetNewAttAndDef:
                
                move.w  COMBATANT_OFFSET_ITEMS(a0,d4.w),d5 ; d5.w = old equipped item index
                
                ; Temporarily equip the new item in place of the old one
                movem.l d4-d5/a0,-(sp)
                bset    #ITEMENTRY_BIT_EQUIPPED,d1
                move.w  d1,COMBATANT_OFFSET_ITEMS(a0,d4.w)
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3
                movem.l (sp)+,d4-d5/a0
                
                movem.w d2-d3,-(sp)
                move.w  d5,COMBATANT_OFFSET_ITEMS(a0,d4.w) ; then re-equip the old one
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.w (sp)+,d2-d3
                
                movem.l (sp)+,d0-d1/d4-a0
                rts
            endif

    ; End of function GetNewAttAndDefWithItemEquipped


; =============== S U B R O U T I N E =======================================


OrderItems:
                
                ; Nullsub to free up space for relocated saved data code
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                movem.l d0-d3/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEMS(a0),a0
                moveq   #2,d1
loc_9082:
            
                lea     ITEMENTRY_SIZE(a0),a1
                move.w  d1,d2
loc_9088:
            
                move.w  (a0),d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                move.w  (a1),d3
                andi.w  #ITEMENTRY_MASK_INDEX,d3
                cmp.w   d0,d3
                bcc.s   loc_90A0
                move.w  (a0),d0         ; if d0 > d3 ?
                move.w  (a1),d3
                move.w  d0,(a3)         ; why use a3 there ? unused bugged subroutine ?
                move.w  d3,(a0)
loc_90A0:
            
                addq.w  #ITEMENTRY_SIZE,a1
loc_90A2:
            
                dbf     d2,loc_9088
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d1,loc_9082
                movem.l (sp)+,d0-d3/a0-a1
                rts
            endif

    ; End of function OrderItems


; =============== S U B R O U T I N E =======================================

; Is item d1.w cursed? Return CCR carry-bit set if true.


IsItemCursed:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @NotCursed
                ori     #1,ccr          ; item is cursed
                bra.s   @Done
@NotCursed:
                
                tst.b   d0              ; clear carry flag
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemCursed


; =============== S U B R O U T I N E =======================================

; Is item d1.w usable in battle? Return CCR carry-bit set if true.


IsItemUsableInBattle:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
            if (STANDARD_BUILD=1)
                cmpi.b  #SPELL_NOTHING,ITEMDEF_OFFSET_USE_SPELL(a0)
            else
                cmpi.b  #-1,ITEMDEF_OFFSET_USE_SPELL(a0) ; BUG -- should compare to $3F for 'no spell'
            endif
                beq.s   @HasNoUse
                
                ori     #1,ccr
                bra.s   @Done
@HasNoUse:
                
                tst.b   d0
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableInBattle


; =============== S U B R O U T I N E =======================================

; Is item d1.w allowed to be used in battle by combatant d0.w?
; Return CCR carry-bit set if true.


IsItemUsableByCombatant:
                
                move.l  a0,-(sp)
                bsr.w   GetEquipmentType
                tst.w   d2
                beq.s   @Usable         ; allow usage if item is not a type of equipment
                bsr.w   IsWeaponOrRingEquippable
                bcc.s   @NotUsable      ; if weapon or ring is not equippable, disallow usage
                bsr.s   IsItemUsableInBattle
                bcc.s   @NotUsable      ; if item has no use spell, disallow usage
@Usable:
                
                ori     #1,ccr
                bra.s   @Done
@NotUsable:
                
                tst.b   d0
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableByCombatant


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


UnequipAllItemsIfNotCursed:
                
                movem.l d0-d1/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movea.l a0,a1
            else
                lea     COMBATANT_OFFSET_ITEMS(a0),a1
            endif
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a1),d1
            else
                move.w  (a1),d1
            endif
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Next
                
                unequipItem (a1)
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d0,@Loop
                
                movem.l (sp)+,d0-d1/a0-a1
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================

; In: d1.w = item
; Out: d0.b = character, d1.w = item slot


GetItemInventoryLocation:
                
                movem.l d2-d3/d6-a0,-(sp)
                move.w  d1,d3
                bsr.w   UpdateForce     
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                subq.w  #1,d6
@Characters_Loop:
                
                move.b  (a0)+,d0
                clr.w   d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                beq.s   @NextCharacter
                move.w  d2,d7           ; number of items
                subq.w  #1,d7
@Items_Loop:
                
                move.w  d7,d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.w   d3,d1
                bne.s   @NextItem
                move.w  d7,d1
                bra.w   @Done
@NextItem:
                
                dbf     d7,@Items_Loop
@NextCharacter:
                
                dbf     d6,@Characters_Loop
                move.w  #-1,d0
                move.w  #-1,d1
@Done:
                
                movem.l (sp)+,d2-d3/d6-a0
                rts

    ; End of function GetItemInventoryLocation


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item index
; Out: d2.w = item slot (-1 if not found)


GetItemSlotContainingIndex:
                
                movem.l d1/d3/d7,-(sp)
                move.w  d1,d3
                andi.w  #ITEMENTRY_MASK_INDEX,d3
                moveq   #0,d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
@Loop:
                
                move.w  d2,d1
                move.l  d2,-(sp)
                jsr     GetItemBySlotAndHeldItemsNumber(pc)
                move.l  (sp)+,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.b   d3,d1
                beq.w   @Done
                addq.w  #1,d2
                dbf     d7,@Loop
                
                move.w  #-1,d2
@Done:
                
                movem.l (sp)+,d1/d3/d7
                rts

    ; End of function GetItemSlotContainingIndex


; =============== S U B R O U T I N E =======================================

; In: D1 = spell index
; 
; Out: A0 = address of name
;      D7 = length of name


FindSpellName:
                
                move.w  d1,-(sp)
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                getPointer p_table_SpellNames, a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindSpellName


; =============== S U B R O U T I N E =======================================

; Find pointer to definition entry for spell D1 -> A0


FindSpellDefAddress:
                
                move.l  d0,-(sp)
                getPointer p_table_SpellDefinitions, a0
                getSpellDefsCounter d0
@Loop:
                
                cmp.b   (a0),d1
                beq.s   @Found
                lea     SPELLDEF_ENTRY_SIZE(a0),a0
                dbf     d0,@Loop
                
                ; Default to first entry if not found
                getPointer p_table_SpellDefinitions, a0
@Found:
                
                move.l  (sp)+,d0
                rts

    ; End of function FindSpellDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = spell slot
; 
; Out: D1 = first spell entry
;      D2 = number of spells learned


GetSpellAndNumberOfSpells:
                
                movem.l d0/d3/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                lea     COMBATANT_OFFSET_SPELLS-1(a0),a0
                move.w  (a0,d1.w),d1
            else
                lea     COMBATANT_OFFSET_SPELLS(a0),a0
                move.b  (a0,d1.w),d1
            endif
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                clr.w   d2
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0)+,d0
            else
                move.b  (a0)+,d0
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @Nothing
                addq.w  #1,d2
@Nothing:
                
                dbf     d3,@Loop
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetSpellAndNumberOfSpells


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = spell entry
; 
; Out: D2 = result (0 = success, 1 = failure : same or higher level known, 2 = failure : no room)


LearnSpell:
                
                movem.l d0/d3-d5/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     COMBATANT_OFFSET_SPELLS_END-1(a0),a0
            else
                lea     COMBATANT_OFFSET_SPELLS_END(a0),a0
            endif
                move.w  d1,d4
                move.w  d1,d5
                move.w  #1,d2           ; 1 = failure : same or higher level known
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d5
@FindKnownSpell_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  -(a0),d0
            else
                move.b  -(a0),d0        ; loop through spells to see if we already know a lower level
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmp.b   d4,d0
                bne.s   @Next
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0),d0
            else
                move.b  (a0),d0
            endif
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                cmp.b   d0,d5
                bls.s   @Done
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  d1,(a0)
            else
                move.b  d1,(a0)         ; replace existing spell with new one (higher level)
            endif
                bra.s   @Success
@Next:
                
                dbf     d3,@FindKnownSpell_Loop
                
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
@FindEmptySlot_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0)+,d0
            else
                move.b  (a0)+,d0        ; loop through spells to find the next empty slot
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @LearnNewSpell
                dbf     d3,@FindEmptySlot_Loop
                
                move.w  #2,d2           ; 2 = failure : no room
                bra.s   @Done
@LearnNewSpell:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  d1,-(a0)
            else
                move.b  d1,-(a0)
            endif
@Success:
                
                clr.w   d2              ; 0 = success
@Done:
                
                movem.l (sp)+,d0/d3-d5/a0
                rts

    ; End of function LearnSpell


; =============== S U B R O U T I N E =======================================

; Get spell D1's MP cost -> D1


GetSpellCost:
                
                move.l  a0,-(sp)
                bsr.w   FindSpellDefAddress
                clr.w   d1
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetSpellCost


; =============== S U B R O U T I N E =======================================

; Get pointer to combatant D0's entry in RAM -> A0


GetCombatantEntryAddress:
                
                movem.w d0-d1,-(sp)
                cmpi.b  #COMBATANT_ENEMIES_START,d0
                bcc.s   @Enemy
                cmpi.b  #COMBATANT_ALLIES_SPACE_END_MINUS_ONE,d0
                bhi.s   @ErrorHandling
                bra.s   @GetAddress
@Enemy:
                
                cmpi.b  #COMBATANT_ENEMIES_SPACE_END,d0
                bhi.s   @ErrorHandling
                subi.b  #COMBATANT_ENEMIES_START_MINUS_ALLIES_SPACE_END,d0
@GetAddress:
                
                andi.w  #BYTE_MASK,d0
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                lea     (COMBATANT_ENTRIES).l,a0
            else
                lsl.w   #3,d0           ; multiply by combatant entry size
                move.w  d0,d1
                lsl.w   #3,d0
                sub.w   d1,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a0
            endif
                adda.w  d0,a0
                movem.w (sp)+,d0-d1
                rts
@ErrorHandling:
                
                movem.w (sp)+,d0-d1
                move.l  #'CNUM',(ERRCODE_BYTE0).l
                move.l  (sp),(ERRCODE_BYTE4).l
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
@InfiniteLoop:
                
                bra.s   @InfiniteLoop

    ; End of function GetCombatantEntryAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = byte
;     D7 = offset


SetCombatantByte:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.b  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = word
;     D7 = offset


SetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantWord


; =============== S U B R O U T I N E =======================================


SetCombatantLong:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.l  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantLong


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant byte offset
; 
; Out: D1 = byte


GetCombatantByte:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                clr.w   d1
                move.b  (a0,d7.w),d1
                rts
            endif

    ; End of function GetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant word offset
; 
; Out: D1 = word


GetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts
            endif

    ; End of function GetCombatantWord


; =============== S U B R O U T I N E =======================================


dup_GetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts
            endif

    ; End of function dup_GetCombatantWord


; =============== S U B R O U T I N E =======================================

; clamp byte D7 of entity D0's information + D1 between D5 and D6


IncreaseAndClampByte:
                
                bsr.w   GetCombatantEntryAddress
                add.b   (a0,d7.w),d1
                bcs.s   @MakeMaxValue   ; check if overflow to negative
                cmp.b   d6,d1
                bcs.s   @Continue       ; check if less than max
@MakeMaxValue:
                
                move.b  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.b   d5,d1
                bcc.s   @Done
                move.b  d5,d1           ; if below min, set to min
@Done:
                
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function IncreaseAndClampByte


; =============== S U B R O U T I N E =======================================


Clamp7BitIncreasing:
                
                bsr.w   GetCombatantEntryAddress
                movem.w d2-d3,-(sp)
                move.b  (a0,d7.w),d2
                move.b  d2,d3
                andi.b  #$80,d3
                andi.b  #$7F,d2 
                add.b   d2,d1
                bcs.s   loc_9352
                cmp.b   d6,d1
                bcs.s   loc_9356
loc_9352:
                
                move.b  d6,d1
                bra.s   loc_935C
loc_9356:
                
                cmp.b   d5,d1
                bcc.s   loc_935C
                move.b  d5,d1
loc_935C:
                
                or.b    d3,d1
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                movem.w (sp)+,d2-d3
                rts

    ; End of function Clamp7BitIncreasing


; =============== S U B R O U T I N E =======================================

; clamp byte D7 of entity D0's information - D1 between D5 and D6


DecreaseAndClampByte:
                
                move.w  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,d4
                move.b  (a0,d7.w),d1
                sub.b   d4,d1
                bcs.s   @MakeMinValue
                cmp.b   d5,d1
                bcc.s   @CheckForMaxValue
@MakeMinValue:
                
                move.b  d5,d1
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.b   d6,d1
                bcs.s   @Continue
                move.b  d6,d1           ; if above max, set to max
@Continue:
                
                move.b  d1,(a0,d7.w)
                move.w  (sp)+,d4
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function DecreaseAndClampByte


; =============== S U B R O U T I N E =======================================


IncreaseAndClampWord:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.w 0(a0),d7
                add.w   d7,d1
            else
                add.w   (a0,d7.w),d1
            endif
                bmi.s   @MakeMaxValue   ; check if overflow to negative
                cmp.w   d6,d1
                bcs.s   @Continue       ; check if less than max
@MakeMaxValue:
                
                move.w  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.w   d5,d1
                bcc.s   @Done
                move.w  d5,d1           ; if below min, set to min
@Done:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,0(a0)
            else
                move.w  d1,(a0,d7.w)
            endif
                rts

    ; End of function IncreaseAndClampWord


; =============== S U B R O U T I N E =======================================


DecreaseAndClampWord:
                
                move.w  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d4
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.w 0(a0),d1
            else
                move.w  (a0,d7.w),d1
            endif
                sub.w   d4,d1
                bmi.s   @MakeMinValue   ; check if less than value
                cmp.w   d5,d1
                bhi.s   @CheckForMaxValue ; compare to min
@MakeMinValue:
                
                move.w  d5,d1           ; set to min
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.w   d6,d1
                bls.s   @Continue
                move.w  d6,d1           ; if above max, set to max
@Continue:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,0(a0)
            else
                move.w  d1,(a0,d7.w)
            endif
                move.w  (sp)+,d4
                rts

    ; End of function DecreaseAndClampWord


; =============== S U B R O U T I N E =======================================

; unused


IncreaseAndClampLong:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.l 0(a0),d7
                add.l   d7,d1
            else
                add.l   (a0,d7.w),d1
            endif
                bmi.s   loc_93E8
                cmp.l   d6,d1
                bcs.s   loc_93EC
loc_93E8:
                
                move.l  d6,d1
                bra.s   loc_93F2
loc_93EC:
                
                cmp.l   d5,d1
                bcc.s   loc_93F2
                move.l  d5,d1
loc_93F2:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.l d1,0(a0)
            else
                move.l  d1,(a0,d7.w)
            endif
                rts

    ; End of function IncreaseAndClampLong


; =============== S U B R O U T I N E =======================================

; unused


DecreaseAndClampLong:
                
                move.l  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.l  d1,d4
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.l 0(a0),d1
            else
                move.l  (a0,d7.w),d1
            endif
                sub.l   d4,d1
                bmi.s   loc_940C
                cmp.l   d5,d1
                bhi.s   loc_9410
loc_940C:
                
                move.l  d5,d1
                bra.s   loc_9416
loc_9410:
                
                cmp.l   d6,d1
                bls.s   loc_9416
                move.l  d6,d1
loc_9416:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.l d1,0(a0)
            else
                move.l  d1,(a0,d7.w)
            endif
                move.l  (sp)+,d4
                rts

    ; End of function DecreaseAndClampLong


; =============== S U B R O U T I N E =======================================

; Get distance between two combatants on the battlefield (simple X and Y calculation, no obstructions.)
; 
;       In: d0.w = actor entity
;           d1.w = target entity
; 
;       Out: d2.w = distance in map blocks


GetDistanceBetweenBattleEntities:
                
                movem.l d0-d1/d3-d5,-(sp)
                move.w  d1,d5
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetCombatantX
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d2           ; keep 1st entity X position
                bsr.w   GetCombatantY
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d3           ; keep 1st entity Y position
                move.w  d5,d0
                bsr.w   GetCombatantX
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d4
                bsr.w   GetCombatantY
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d5
                sub.w   d4,d2
                bcc.s   loc_946C
                neg.w   d2
loc_946C:
                
                sub.w   d5,d3
                bcc.s   loc_9472
                neg.w   d3
loc_9472:
                
                add.w   d3,d2
                bra.w   loc_947C
loc_9478:
                
                move.w  #-1,d2
loc_947C:
                
                movem.l (sp)+,d0-d1/d3-d5
                rts

    ; End of function GetDistanceBetweenBattleEntities


; =============== S U B R O U T I N E =======================================


nullsub_9482:
                
                rts

    ; End of function nullsub_9482

