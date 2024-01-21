
; ASM FILE code\common\stats\statsengine_1.asm :
; 0x82D0..0x851A : Character stats engine, part 1

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: A0 = address of name
;      D7 = length of name


GetCombatantName:
                
                movem.l d0-d1,-(sp)
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                tst.b   d0
                bmi.s   @Enemy
                move.l  a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                movea.l a0,a1
                lea     ((ALLY_NAME_LOADING_SPACE-$1000000)).w,a0
            else
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                bsr.w   GetCombatantEntryAddress
            endif
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
                clr.w   d7
@CountNameLength_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  d7,d1
                add.w   d1,d1
                move.b  (a1,d1.w),(a0,d7.w)     ; load ally name into temp space
            else
                tst.b   (a0,d7.w)
            endif
                beq.s   @Break          ; break out of loop upon reaching end of name
                addq.w  #1,d7
                dbf     d0,@CountNameLength_Loop
@Break:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movea.l (sp)+,a1  
            endif
                bra.s   @Done
@Enemy:
                
                clr.w   d1
                bsr.w   GetEnemy        
                getPointer p_table_EnemyNames, a0
                bsr.w   FindName        
@Done:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function GetCombatantName


; =============== S U B R O U T I N E =======================================

; Get class index for combatant d0.b -> d1.w


GetClass:
                
                getSavedCombatantByte COMBATANT_OFFSET_CLASS
                rts

    ; End of function GetClass


; =============== S U B R O U T I N E =======================================

; Get current level for combatant d0.b -> d1.w


GetCurrentLevel:
                
                getSavedCombatantByte COMBATANT_OFFSET_LEVEL
                rts

    ; End of function GetCurrentLevel


; =============== S U B R O U T I N E =======================================


GetMaxHp:
                
                getSavedCombatantWord COMBATANT_OFFSET_HP_MAX
                rts

    ; End of function GetMaxHp


; =============== S U B R O U T I N E =======================================


GetCurrentHp:
                
                getSavedCombatantWord COMBATANT_OFFSET_HP_CURRENT
                rts

    ; End of function GetCurrentHp


; =============== S U B R O U T I N E =======================================


GetMaxMp:
                
                getSavedCombatantByte COMBATANT_OFFSET_MP_MAX
                rts

    ; End of function GetMaxMp


; =============== S U B R O U T I N E =======================================


GetCurrentMp:
                
                getSavedCombatantByte COMBATANT_OFFSET_MP_CURRENT
                rts

    ; End of function GetCurrentMp


; =============== S U B R O U T I N E =======================================


GetBaseAtt:
                
                getSavedCombatantByte COMBATANT_OFFSET_ATT_BASE
                rts

    ; End of function GetBaseAtt


; =============== S U B R O U T I N E =======================================


GetCurrentAtt:
                
                getSavedCombatantByte COMBATANT_OFFSET_ATT_CURRENT
                rts

    ; End of function GetCurrentAtt


; =============== S U B R O U T I N E =======================================


GetBaseDef:
                
                getSavedCombatantByte COMBATANT_OFFSET_DEF_BASE
                rts

    ; End of function GetBaseDef


; =============== S U B R O U T I N E =======================================


GetCurrentDef:
                
                getSavedCombatantByte COMBATANT_OFFSET_DEF_CURRENT
                rts

    ; End of function GetCurrentDef


; =============== S U B R O U T I N E =======================================


GetBaseAgi:
                
                getSavedCombatantByte COMBATANT_OFFSET_AGI_BASE
                rts

    ; End of function GetBaseAgi


; =============== S U B R O U T I N E =======================================


GetCurrentAgi:
                
                getSavedCombatantByte COMBATANT_OFFSET_AGI_CURRENT
                rts

    ; End of function GetCurrentAgi


; =============== S U B R O U T I N E =======================================


GetBaseMov:
                
                getSavedCombatantByte COMBATANT_OFFSET_MOV_BASE
                rts

    ; End of function GetBaseMov


; =============== S U B R O U T I N E =======================================


GetCurrentMov:
                
                getSavedCombatantByte COMBATANT_OFFSET_MOV_CURRENT
                rts

    ; End of function GetCurrentMov


; =============== S U B R O U T I N E =======================================


GetBaseResistance:
                
                getSavedCombatantWord COMBATANT_OFFSET_RESIST_BASE
                rts

    ; End of function GetBaseResistance


; =============== S U B R O U T I N E =======================================


GetCurrentResistance:
                
                getSavedCombatantWord COMBATANT_OFFSET_RESIST_CURRENT
                rts

    ; End of function GetCurrentResistance


; =============== S U B R O U T I N E =======================================


GetBaseProwess:
                
                getSavedCombatantByte COMBATANT_OFFSET_PROWESS_BASE
                rts

    ; End of function GetBaseProwess


; =============== S U B R O U T I N E =======================================


GetCurrentProwess:
                
                getSavedCombatantByte COMBATANT_OFFSET_PROWESS_CURRENT
                rts

    ; End of function GetCurrentProwess


; =============== S U B R O U T I N E =======================================


GetStatusEffects:
                
                getSavedCombatantWord COMBATANT_OFFSET_STATUSEFFECTS
                rts

    ; End of function GetStatusEffects


; =============== S U B R O U T I N E =======================================


GetCombatantX:
                
                getSavedCombatantPosition COMBATANT_OFFSET_X
                rts

    ; End of function GetCombatantX


; =============== S U B R O U T I N E =======================================


GetCombatantY:
                
                getSavedCombatantPosition COMBATANT_OFFSET_Y
                rts

    ; End of function GetCombatantY


; =============== S U B R O U T I N E =======================================


GetCurrentExp:
                
                getSavedCombatantByte COMBATANT_OFFSET_EXP
                rts

    ; End of function GetCurrentExp


; =============== S U B R O U T I N E =======================================

; Get movetype for combatant d0.w, shifted to the lower nibble position -> d1.w


GetMoveType:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movem.l (sp)+,d7-a0
            endif
                rts

    ; End of function GetMoveType


; =============== S U B R O U T I N E =======================================

; Get AI commandset for combatant d0.w -> d1.w


GetAiCommandset:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a0),d1
                andi.w  #$F,d1
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movem.l (sp)+,d7-a0
            endif
                rts

    ; End of function GetAiCommandset


; =============== S U B R O U T I N E =======================================

; Out: d1.w = combatant index to follow, or first AI point if bit 6 is set
;      d2.w = second AI point


GetAiSpecialMoveOrders:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                movep.w COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS(a0),d1
                move.w  d1,d2
                lsr.w   #8,d1
                andi.w  #$FF,d1
                andi.w  #$FF,d2
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS,d7
                bsr.w   GetCombatantWord
                move.w  d1,d2
                lsr.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d1
                andi.w  #BYTE_MASK,d2
                movem.l (sp)+,d7-a0
            endif
                rts

    ; End of function GetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w, d2.w = AI activation regions 1 and 2 indexes


GetAiRegion:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_AI_REGION(a0),d1
                move.b  d1,d2
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                movea.l (sp)+,a0
            else
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_REGION,d7
                bsr.w   GetCombatantByte
                move.w  d1,d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                movem.l (sp)+,d7-a0
            endif
                rts

    ; End of function GetAiRegion


; =============== S U B R O U T I N E =======================================


GetActivationBitfield:
                
                getSavedCombatantWord COMBATANT_OFFSET_ACTIVATION_BITFIELD
                rts

    ; End of function GetActivationBitfield


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; Out: d1.w = enemy index, or -1 if not an enemy


GetEnemy:
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                tst.b   d0
                bmi.s   @Continue
                move.w  #-1,d1
                rts
            else
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Continue
                move.w  #-1,d1          ; return -1 if combatant is not an enemy
                rts
                bra.s   GetKills        ; unreachable code
            endif
@Continue:
                
                getSavedCombatantByte COMBATANT_OFFSET_ENEMY_INDEX
                rts

    ; End of function GetEnemy


; =============== S U B R O U T I N E =======================================


GetKills:
                
                getSavedCombatantWord COMBATANT_OFFSET_ALLY_KILLS
                rts

    ; End of function GetKills


; =============== S U B R O U T I N E =======================================


GetDefeats:
                
                getSavedCombatantWord COMBATANT_OFFSET_ALLY_DEFEATS
                rts

    ; End of function GetDefeats

