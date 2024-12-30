
; ASM FILE code\common\stats\statsengine_2.asm :
; 0x855A..0x89CE : Character stats engine, part 2

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

