
; ASM FILE code\common\stats\combatantstats_1.asm :
; 0x82D0..0x851A : Read combatant stats

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; 
; Out: a0 = address of name
;      d7.w = length of name


GetCombatantName:
                
                movem.l d0-d1,-(sp)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                bsr.w   GetCombatantEntryAddress
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
                clr.w   d7
@CountNameLength_Loop:
                
                tst.b   (a0,d7.w)
                beq.s   @Break          ; break out of loop upon reaching end of name
                
                addq.w  #1,d7
                dbf     d0,@CountNameLength_Loop
@Break:
                
                bra.s   @Done
@Enemy:
                
                clr.w   d1
                bsr.w   GetEnemy        
                movea.l (p_table_EnemyNames).l,a0
                bsr.w   FindName        
@Done:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function GetCombatantName


; =============== S U B R O U T I N E =======================================

; Get class index for combatant d0.b -> d1.w


GetClass:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_CLASS,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetClass


; =============== S U B R O U T I N E =======================================

; Get current level for combatant d0.b -> d1.w


GetLevel:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_LEVEL,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetLevel


; =============== S U B R O U T I N E =======================================


GetMaxHp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetMaxHp


; =============== S U B R O U T I N E =======================================


GetCurrentHp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentHp


; =============== S U B R O U T I N E =======================================


GetMaxMp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetMaxMp


; =============== S U B R O U T I N E =======================================


GetCurrentMp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentMp


; =============== S U B R O U T I N E =======================================


GetBaseAtt:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseAtt


; =============== S U B R O U T I N E =======================================


GetCurrentAtt:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentAtt


; =============== S U B R O U T I N E =======================================


GetBaseDef:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseDef


; =============== S U B R O U T I N E =======================================


GetCurrentDef:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentDef


; =============== S U B R O U T I N E =======================================


GetBaseAgi:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseAgi


; =============== S U B R O U T I N E =======================================


GetCurrentAgi:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentAgi


; =============== S U B R O U T I N E =======================================


GetBaseMov:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseMov


; =============== S U B R O U T I N E =======================================


GetCurrentMov:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentMov


; =============== S U B R O U T I N E =======================================


GetBaseResistance:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_RESIST_BASE,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseResistance


; =============== S U B R O U T I N E =======================================


GetCurrentResistance:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_RESIST_CURRENT,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentResistance


; =============== S U B R O U T I N E =======================================


GetBaseProwess:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_PROWESS_BASE,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetBaseProwess


; =============== S U B R O U T I N E =======================================


GetCurrentProwess:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_PROWESS_CURRENT,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentProwess


; =============== S U B R O U T I N E =======================================


GetStatusEffects:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_STATUSEFFECTS,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetStatusEffects


; =============== S U B R O U T I N E =======================================


GetCombatantX:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_X,d7
                bsr.w   GetCombatantByte
                ext.w   d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCombatantX


; =============== S U B R O U T I N E =======================================


GetCombatantY:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_Y,d7
                bsr.w   GetCombatantByte
                ext.w   d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCombatantY


; =============== S U B R O U T I N E =======================================


GetCurrentExp:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentExp


; =============== S U B R O U T I N E =======================================

; Get movetype for combatant d0.w, shifted to the lower nibble position -> d1.w


GetMoveType:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetMoveType


; =============== S U B R O U T I N E =======================================

; Get AI commandset for combatant d0.w -> d1.w


GetAiCommandset:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiCommandset


; =============== S U B R O U T I N E =======================================

; Out: d1.w = combatant index to follow, or first AI point if bit 6 is set
;      d2.w = second AI point


GetAiMoveOrders:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS,d7
                bsr.w   GetCombatantWord
                move.w  d1,d2
                lsr.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d1
                andi.w  #BYTE_MASK,d2
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiMoveOrders


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w, d2.w = AI activation regions 1 and 2 indexes


GetAiRegion:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_REGION,d7
                bsr.w   GetCombatantByte
                move.w  d1,d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiRegion


; =============== S U B R O U T I N E =======================================


GetActivationBitfield:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ACTIVATION_BITFIELD,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetActivationBitfield


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; Out: d1.w = enemy index, or -1 if not an enemy


GetEnemy:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Continue
                move.w  #-1,d1          ; return -1 if combatant is not an enemy
                rts
                bra.s   GetKills        ; unreachable code
@Continue:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ENEMY_INDEX,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetEnemy


; =============== S U B R O U T I N E =======================================


GetKills:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ALLY_KILLS,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetKills


; =============== S U B R O U T I N E =======================================


GetDefeats:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ALLY_DEFEATS,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetDefeats

