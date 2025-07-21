
; ASM FILE code\common\stats\combatantstats_2.asm :
; 0x855A..0x8970 : Modify combatant stats

; =============== S U B R O U T I N E =======================================

; Load ally name into combatant data block.
; 
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
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_CLASS,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetClass


; =============== S U B R O U T I N E =======================================


SetLevel:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_LEVEL,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetLevel


; =============== S U B R O U T I N E =======================================


SetMaxHp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMaxHp


; =============== S U B R O U T I N E =======================================


SetCurrentHp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentHp


; =============== S U B R O U T I N E =======================================


SetMaxMp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMaxMp


; =============== S U B R O U T I N E =======================================


SetCurrentMp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentMp


; =============== S U B R O U T I N E =======================================


SetBaseAtt:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseAtt


; =============== S U B R O U T I N E =======================================


SetCurrentAtt:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentAtt


; =============== S U B R O U T I N E =======================================


SetBaseDef:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseDef


; =============== S U B R O U T I N E =======================================


SetCurrentDef:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentDef


; =============== S U B R O U T I N E =======================================


SetBaseAgi:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseAgi


; =============== S U B R O U T I N E =======================================


SetCurrentAgi:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentAgi


; =============== S U B R O U T I N E =======================================


SetBaseMov:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseMov


; =============== S U B R O U T I N E =======================================


SetCurrentMov:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentMov


; =============== S U B R O U T I N E =======================================


SetBaseResistance:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_RESIST_BASE,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseResistance


; =============== S U B R O U T I N E =======================================


SetCurrentResistance:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_RESIST_CURRENT,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentResistance


; =============== S U B R O U T I N E =======================================


SetBaseProwess:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_PROWESS_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseProwess


; =============== S U B R O U T I N E =======================================


SetCurrentProwess:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_PROWESS_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentProwess


; =============== S U B R O U T I N E =======================================


SetStatusEffects:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_STATUSEFFECTS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetStatusEffects


; =============== S U B R O U T I N E =======================================


SetCombatantX:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_X,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCombatantX


; =============== S U B R O U T I N E =======================================


SetCombatantY:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_Y,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCombatantY


; =============== S U B R O U T I N E =======================================


SetCurrentExp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentExp


; =============== S U B R O U T I N E =======================================

; Set combined movetype and ai commandset when initializing an enemy.


SetMoveTypeAndAiCommandset:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMoveTypeAndAiCommandset


; =============== S U B R O U T I N E =======================================


SetAiSpecialMoveOrders:
                
                movem.l d1-d2/d7-a0,-(sp)
                lsl.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d2
                or.w    d2,d1
                moveq   #COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function SetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================


SetAiRegion:
                
                movem.l d1-d2/d7-a0,-(sp)
                lsl.b   #NIBBLE_SHIFT_COUNT,d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                or.b    d2,d1
                moveq   #COMBATANT_OFFSET_AI_REGION,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function SetAiRegion


; =============== S U B R O U T I N E =======================================


SetActivationBitfield:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ACTIVATION_BITFIELD,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetActivationBitfield


; =============== S U B R O U T I N E =======================================


SetEnemyIndex:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ENEMY_INDEX,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
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
                getSavedWord a0, d6, COMBATANT_OFFSET_HP_MAX
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
                bsr.w   IncreaseAndClamp7Bits
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseAgi


; =============== S U B R O U T I N E =======================================


IncreaseCurrentAgi:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_CURRENT,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   IncreaseAndClamp7Bits
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
                getSavedWord a0, d6, COMBATANT_OFFSET_HP_MAX
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

