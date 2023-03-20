
; ASM FILE code\common\stats\statsengine_1.asm :
; 0x82D0..0x853A : Character stats engine

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: A0 = address of name
;      D7 = length of name


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
                movea.l (p_tbl_EnemyNames).l,a0
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


GetCurrentLevel:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_LEVEL,d7
                bsr.w   GetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetCurrentLevel


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

; Get combatant D0's move type, shifted into lower nibble position -> D1


GetMoveType:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                lsr.w   #4,d1
                andi.w  #$F,d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetMoveType


; =============== S U B R O U T I N E =======================================

; Get combatant D0's AI commandset -> D1


GetAiCommandset:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE_AND_AI,d7
                bsr.w   GetCombatantByte
                andi.w  #$F,d1
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiCommandset


; =============== S U B R O U T I N E =======================================

; Out: d1.w = combatant index to follow, or first AI point if bit 6 is set
;      d2.w = second AI point


GetAiSpecialMoveOrders:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS,d7
                bsr.w   GetCombatantWord
                move.w  d1,d2
                lsr.w   #8,d1
                andi.w  #$FF,d1
                andi.w  #$FF,d2
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: D1 = AI activation region index 1
;      D2 = AI activation region index 2


GetAiRegion:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_REGION,d7
                bsr.w   GetCombatantByte
                move.w  d1,d2
                lsr.w   #ENEMYCOMBATANT_AI_SETTINGS_SHIFTCOUNT,d1
                andi.w  #ENEMYCOMBATANT_AI_SETTINGS_MASK,d1
                andi.w  #ENEMYCOMBATANT_AI_SETTINGS_MASK,d2
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiRegion


; =============== S U B R O U T I N E =======================================


GetAiActivationFlag:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AI_ACTIVATION_FLAG,d7
                bsr.w   GetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetAiActivationFlag


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


; =============== S U B R O U T I N E =======================================

; Get combatant d0.w type -> d1.w
; 
; If combatant is an ally, type is equal to combatant index plus allies number
;  times class type (0, 1, or 2 for base, promoted, and special, respectively),
;  and the most significant bit is set. However, this feature is unused.
; 
; Otherwise, if an enemy, return the enemy index.


GetCombatantType:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                moveq   #0,d1
                bsr.w   GetClass        
                move.b  tbl_ClassTypes(pc,d1.w),d1 ; 0,1,2 = base class, promoted class, special promoted class
                mulu.w  #COMBATANT_ALLIES_NUMBER,d1
                add.w   d0,d1
                bset    #15,d1
                bra.s   @Return
@Enemy:
                
                bsr.s   GetEnemy        
@Return:
                
                rts

    ; End of function GetCombatantType

