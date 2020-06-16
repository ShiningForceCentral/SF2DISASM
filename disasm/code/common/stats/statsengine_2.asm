
; ASM FILE code\common\stats\statsengine_2.asm :
; 0x855A..0x9A9A : Character stats engine

; =============== S U B R O U T I N E =======================================

; In: A0 = temporary space used when naming characters

CopyCharacterNameToRam:
                
                tst.b   (a0)
                beq.s   @Return         ; skip copying name if entered string is null (and keep default name)
                movem.l d0/a0-a1,-(sp)
                lea     (a0),a1
                bsr.w   GetCombatantEntryAddress
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
@CopyName_Loop:
                
                move.b  (a1)+,(a0)+
                dbf     d0,@CopyName_Loop
                movem.l (sp)+,d0/a0-a1
@Return:
                
                rts

    ; End of function CopyCharacterNameToRam


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

SetMaxHP:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMaxHP


; =============== S U B R O U T I N E =======================================

SetCurrentHP:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentHP


; =============== S U B R O U T I N E =======================================

SetMaxMP:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMaxMP


; =============== S U B R O U T I N E =======================================

SetCurrentMP:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentMP


; =============== S U B R O U T I N E =======================================

SetBaseATT:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
loc_85DC:
                
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseATT


; =============== S U B R O U T I N E =======================================

SetCurrentATT:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentATT


; =============== S U B R O U T I N E =======================================

SetBaseDEF:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseDEF


; =============== S U B R O U T I N E =======================================

SetCurrentDEF:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentDEF


; =============== S U B R O U T I N E =======================================

SetBaseAGI:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseAGI


; =============== S U B R O U T I N E =======================================

SetCurrentAGI:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentAGI


; =============== S U B R O U T I N E =======================================

SetBaseMOV:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetBaseMOV


; =============== S U B R O U T I N E =======================================

SetCurrentMOV:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentMOV


; =============== S U B R O U T I N E =======================================

SetBaseResistance:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_RESIST_BASE1,d7
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

SetStatus:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_STATUSEFFECTS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetStatus


; =============== S U B R O U T I N E =======================================

SetXPos:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_X,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetXPos


; =============== S U B R O U T I N E =======================================

SetYPos:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_Y,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetYPos


; =============== S U B R O U T I N E =======================================

SetCurrentEXP:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCurrentEXP


; =============== S U B R O U T I N E =======================================

SetMoveType:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_MOVETYPE,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetMoveType


; =============== S U B R O U T I N E =======================================

; actually seems to only be used for enemy AI, not kills

SetKills:
                
                movem.l d1-d2/d7-a0,-(sp)
                lsl.w   #8,d1
                andi.w  #$FF,d2
                or.w    d2,d1
                moveq   #COMBATANT_OFFSET_KILLS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function SetKills


; =============== S U B R O U T I N E =======================================

; actually seems to only be used for enemy AI, not kills

SetDefeats:
                
                movem.l d1-d2/d7-a0,-(sp)
                lsl.b   #4,d1
                andi.b  #$F,d2
                or.b    d2,d1
                moveq   #COMBATANT_OFFSET_DEFEATS,d7
                bsr.w   SetCombatantByte
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function SetDefeats


; =============== S U B R O U T I N E =======================================

SetCharacterWord34:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_34,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetCharacterWord34


; =============== S U B R O U T I N E =======================================

SetEnemyIndex:
                
                movem.l d7-a0,-(sp)
                moveq   #ENEMYCOMBATANT_OFFSET_INDEX,d7
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

IncreaseMaxHP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_HP,d6
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.w   ClampWordIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxHP


; =============== S U B R O U T I N E =======================================

IncreaseCurrentHP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.w  COMBATANT_OFFSET_HP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   ClampWordIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentHP


; =============== S U B R O U T I N E =======================================

IncreaseMaxMP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MP,d6
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxMP


; =============== S U B R O U T I N E =======================================

IncreaseCurrentMP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMP


; =============== S U B R O U T I N E =======================================

IncreaseBaseATT:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseATT


; =============== S U B R O U T I N E =======================================

IncreaseCurrentATT:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentATT


; =============== S U B R O U T I N E =======================================

IncreaseBaseDEF:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseDEF


; =============== S U B R O U T I N E =======================================

IncreaseCurrentDEF:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

IncreaseBaseAGI:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_BASE,d6
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   Clamp7BitIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseAGI


; =============== S U B R O U T I N E =======================================

IncreaseCurrentAGI:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_CURRENT,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   Clamp7BitIncreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentAGI


; =============== S U B R O U T I N E =======================================

IncreaseBaseMOV:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseMOV


; =============== S U B R O U T I N E =======================================

IncreaseCurrentMOV:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

IncreaseEXP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_EXP,d6
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseEXP


; =============== S U B R O U T I N E =======================================

IncreaseKills:
                
                tst.b   d0
                blt.s   return_8886
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #$270F,d6
                moveq   #$32,d7 
                bsr.w   ClampWordIncreasing
                movem.l (sp)+,d5-a0
return_8886:
                
                rts

    ; End of function IncreaseKills


; =============== S U B R O U T I N E =======================================

IncreaseDefeats:
                
                tst.b   d0
                blt.s   return_88A0
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #$270F,d6
                moveq   #$36,d7 
                bsr.w   ClampWordIncreasing
                movem.l (sp)+,d5-a0
return_88A0:
                
                rts

    ; End of function IncreaseDefeats


; =============== S U B R O U T I N E =======================================

DecreaseCurrentHP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.w  COMBATANT_OFFSET_HP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.w   ClampWordDecreasing
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentHP


; =============== S U B R O U T I N E =======================================

DecreaseCurrentMP:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentMP


; =============== S U B R O U T I N E =======================================

DecreaseCurrentATT:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentATT


; =============== S U B R O U T I N E =======================================

DecreaseBaseDEF:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseDEF


; =============== S U B R O U T I N E =======================================

DecreaseCurrentDEF:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

DecreaseBaseAGI:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #$C8,d6
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseAGI


; =============== S U B R O U T I N E =======================================

DecreaseCurrentAGI:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #$C8,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentAGI


; =============== S U B R O U T I N E =======================================

DecreaseBaseMOV:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseBaseMOV


; =============== S U B R O U T I N E =======================================

DecreaseCurrentMOV:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function DecreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

GetClassName:
                
                movea.l (p_ClassNames).l,a0

    ; End of function GetClassName


; =============== S U B R O U T I N E =======================================

; In: A0 = address of names list
;     D1 = name index
; 
; Out: A0 = address of entry in names list
;      D7 = length of name

FindName:
                
                move.w  d0,-(sp)
                subq.w  #1,d1
                bmi.s   loc_8986
                clr.w   d0
loc_897E:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d1,loc_897E
loc_8986:
                
                clr.w   d7
                move.b  (a0)+,d7
                move.w  (sp)+,d0
                rts

    ; End of function FindName


; =============== S U B R O U T I N E =======================================

SetGold:
                
                move.l  d1,((CURRENT_GOLD-$1000000)).w ; puts d1's value at F600 in RAM
                rts

    ; End of function SetGold


; =============== S U B R O U T I N E =======================================

GetGold:
                
                move.l  ((CURRENT_GOLD-$1000000)).w,d1
                rts

    ; End of function GetGold


; =============== S U B R O U T I N E =======================================

IncreaseGold:
                
                add.l   ((CURRENT_GOLD-$1000000)).w,d1
                bcs.s   loc_89A8
                cmpi.l  #FORCE_MAX_GOLD,d1
                bls.s   loc_89AE
loc_89A8:
                
                move.l  #FORCE_MAX_GOLD,d1
loc_89AE:
                
                move.l  d1,((CURRENT_GOLD-$1000000)).w
                rts

    ; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================

DecreaseGold:
                
                movem.l d0,-(sp)
                move.l  ((CURRENT_GOLD-$1000000)).w,d0
                sub.l   d1,d0
                bcc.s   loc_89C2
                moveq   #0,d0
loc_89C2:
                
                move.l  d0,((CURRENT_GOLD-$1000000)).w
                move.l  d0,d1
                movem.l (sp)+,d0
                rts

    ; End of function DecreaseGold


; =============== S U B R O U T I N E =======================================

; Update all current stats

ApplyStatusEffectsAndItemsOnStats:
                
                movem.l d0-d3/a0-a2,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetStatus
                move.w  d1,d3
                andi.w  #STATUSEFFECTS_MASK_STUN|STATUSEFFECTS_MASK_POISON|STATUSEFFECTS_MASK_MUDDLE2|STATUSEFFECTS_MASK_MUDDLE1|STATUSEFFECTS_MASK_SLEEP|STATUSEFFECTS_MASK_SILENCE|STATUSEFFECTS_MASK_SLOW|STATUSEFFECTS_MASK_BOOST|STATUSEFFECTS_MASK_ATTACK,d3
                bsr.w   InitCurrentStats
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                lea     COMBATANT_OFFSET_PROWESS_CURRENT(a0),a2
                bsr.w   ApplyMagicOnStats
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d2
loc_89F4:
                
                move.w  (a1),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8A12
                btst    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a1)
                beq.s   loc_8A12
                bsr.w   ApplyItemOnStats
                beq.s   loc_8A12
                ori.w   #4,d3
loc_8A12:
                
                addq.w  #2,a1
                dbf     d2,loc_89F4
                move.w  (sp)+,d0
                move.w  d3,d1
                bsr.w   SetStatus
                movem.l (sp)+,d0-d3/a0-a2
                rts

    ; End of function ApplyStatusEffectsAndItemsOnStats


; =============== S U B R O U T I N E =======================================

; In: D0 = char index
;     D3 = status bitfield

ApplyMagicOnStats:
                
                clr.l   d1
                move.w  d3,d2
                andi.w  #$C000,d2
                rol.w   #2,d2
                bsr.w   GetBaseATT
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentATT
                move.w  d3,d2
                andi.w  #$3000,d2
                rol.w   #4,d2
                bsr.w   GetBaseDEF
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentDEF
                bsr.w   GetBaseAGI
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentAGI
                move.w  d3,d2
                andi.w  #$C00,d2
                rol.w   #6,d2
                bsr.w   GetBaseDEF
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   DecreaseCurrentDEF
                bsr.w   GetBaseAGI
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   DecreaseCurrentAGI
                btst    #0,d3
                beq.s   return_8A8E
                moveq   #1,d1
                bsr.w   DecreaseCurrentMOV
                moveq   #5,d1
                bsr.w   DecreaseCurrentAGI
return_8A8E:
                
                rts

    ; End of function ApplyMagicOnStats


; =============== S U B R O U T I N E =======================================

; In: A2 = address in RAM of character's prowess
;     D0 = character index
;     D1 = item index

ApplyItemOnStats:
                
                bsr.w   GetItemDefAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_8AA2
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                bra.s   loc_8AA4
loc_8AA2:
                
                clr.w   d2
loc_8AA4:
                
                move    sr,-(sp)
                movem.l d1-d2/d7-a1,-(sp)
                lea     ITEMDEF_OFFSET_EQUIP_EFFECTS(a0),a0
                clr.w   d2
                moveq   #1,d7
loc_8AB2:
                
                move.b  1(a0),d1        ; value
                move.b  (a0),d2         ; effect code
                cmpi.b  #$FF,d2
                beq.w   loc_8AD2
                cmpi.b  #$11,d2
                bcs.s   loc_8AC8
loc_8AC6:
                
                bra.s   loc_8AC6
loc_8AC8:
                
                lsl.w   #2,d2
                lea     pt_EquipEffectFunctions(pc,d2.w),a1
                movea.l (a1),a1
                jsr     (a1)
loc_8AD2:
                
                addq.w  #2,a0
                dbf     d7,loc_8AB2     
                movem.l (sp)+,d1-d2/d7-a1
                rtr

    ; End of function ApplyItemOnStats

pt_EquipEffectFunctions:
                dc.l nullsub_8B22
                dc.l nullsub_8B22
                dc.l EquipEffect_IncreaseCriticalProwess
                dc.l EquipEffect_IncreaseDoubleAttackProwess
                dc.l EquipEffect_IncreaseCounterAttackProwess
                dc.l nullsub_8B22
                dc.l IncreaseCurrentATT
                dc.l IncreaseCurrentDEF
                dc.l IncreaseCurrentAGI
                dc.l IncreaseCurrentMOV
                dc.l DecreaseCurrentATT
                dc.l DecreaseCurrentDEF
                dc.l DecreaseCurrentAGI
                dc.l DecreaseCurrentMOV
                dc.l EquipEffect_SetCriticalProwess
                dc.l EquipEffect_SetDoubleAttackProwess
                dc.l EquipEffect_SetCounterAttackProwess

; =============== S U B R O U T I N E =======================================

nullsub_8B22:
                
                rts

    ; End of function nullsub_8B22


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseCriticalProwess:
                
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

    ; End of function EquipEffect_IncreaseCriticalProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseDoubleAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d2
                andi.b  #PROWESS_MASK_LOWER_COUNTER,d2
                add.b   d1,d2
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest double attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL,(a2) ; <BUG> chance to counter attack is being set to 1/32
                                        ; setting should be masked as well
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseCounterAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFTCOUNT,d2
                andi.b  #3,d2
                add.b   d1,d2
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest counter attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFTCOUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,(a2)
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetCriticalProwess:
                
                andi.b  #PROWESS_MASK_CRITICAL,d1
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,(a2)
                or.b    d1,(a2)
                rts

    ; End of function EquipEffect_SetCriticalProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetDoubleAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_COUNTER,d1
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
                or.b    d1,(a2)
                rts

    ; End of function EquipEffect_SetDoubleAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetCounterAttackProwess:
                
                andi.b  #3,d1
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFTCOUNT,d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,(a2)
                or.b    d1,(a2)
                rts

    ; End of function EquipEffect_SetCounterAttackProwess


; =============== S U B R O U T I N E =======================================

InitCurrentStats:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_ATT_BASE(a0),COMBATANT_OFFSET_ATT_CURRENT(a0)
                move.b  COMBATANT_OFFSET_DEF_BASE(a0),COMBATANT_OFFSET_DEF_CURRENT(a0)
                move.b  COMBATANT_OFFSET_AGI_BASE(a0),COMBATANT_OFFSET_AGI_CURRENT(a0)
                move.b  COMBATANT_OFFSET_MOV_BASE(a0),COMBATANT_OFFSET_MOV_CURRENT(a0)
                move.w  COMBATANT_OFFSET_RESIST_BASE1(a0),COMBATANT_OFFSET_RESIST_CURRENT(a0)
                move.b  COMBATANT_OFFSET_PROWESS_BASE(a0),COMBATANT_OFFSET_PROWESS_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function InitCurrentStats


; =============== S U B R O U T I N E =======================================

; In: D1 = item entry
; Out: A0 = address of name
;      D7 = length of name

FindItemName:
                
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_ItemNames).l,a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindItemName


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; Out: A0 = item definition address in ROM

GetItemDefAddress:
                
                move.l  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                mulu.w  #SIZE_ITEMDEF,d1
                movea.l (p_ItemDefs).l,a0
                adda.w  d1,a0
                move.l  (sp)+,d1
                rts

    ; End of function GetItemDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item slot
; 
; Out: D1 = item index
;      D2 = number of items held

GetItemAndNumberOfItems:
                
                movem.l d0/d3/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a0
                add.w   d1,d1
                move.w  (a0,d1.w),d1    ; move item d1 word in d1
                moveq   #0,d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
@Loop:
                
                move.w  (a0)+,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_NOTHING,d0
                beq.s   @Nothing
                addq.w  #1,d2
@Nothing:
                
                dbf     d3,@Loop
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetItemAndNumberOfItems


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: D2 = item type (0 = item, 1 = weapon, $FFFF = ring)

GetItemType:
                
                move.l  a0,-(sp)
                bsr.s   GetItemDefAddress
                addq.w  #ITEMDEF_OFFSET_TYPE,a0
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

    ; End of function GetItemType


; =============== S U B R O U T I N E =======================================

GetEquippedWeapon:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d4
                bra.s   GetEquippedItemByType

    ; End of function GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

GetEquippedRing:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d4

    ; End of function GetEquippedRing


; START OF FUNCTION CHUNK FOR GetEquippedWeapon

GetEquippedItemByType:
                
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                clr.w   d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
loc_8C6A:
                
                move.w  (a1)+,d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   loc_8C88        
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8C88        
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d4,d1
                bne.s   loc_8C96
loc_8C88:
                
                addq.w  #1,d2           ; d2 seems unused here?
                dbf     d3,loc_8C6A
                move.w  #CODE_NOTHING_WORD,d1
                move.w  d1,d2
                bra.s   loc_8C9C
loc_8C96:
                
                move.w  -(a1),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
loc_8C9C:
                
                movem.l (sp)+,d3-d4/a0-a1
                rts

; END OF FUNCTION CHUNK FOR GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item index
; 
; Out: D2 = 0 if item successfully added, 1 if no empty slot available

AddItem:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a0
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
loc_8CB0:
                
                move.w  (a0)+,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   loc_8CC6
                dbf     d0,loc_8CB0     ; loop over all items to make sure there's a slot open
                move.w  #1,d2           ; no empty slot available
                bra.s   loc_8CCE
loc_8CC6:
                
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
                move.w  d1,-(a0)        ; move item in empty slot
                clr.w   d2
loc_8CCE:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function AddItem


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot

BreakItem:
                
                movem.l d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8CF6
                bset    #ITEMENTRY_UPPERBIT_BROKEN,(a0)
                clr.w   d2
                bra.s   loc_8CFA
loc_8CF6:
                
                move.w  #3,d2
loc_8CFA:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function BreakItem


; =============== S U B R O U T I N E =======================================

RepairItemBySlot:
                
                movem.l d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8D2A        
                bclr    #7,(a0)
                beq.s   loc_8D24
                clr.w   d2
                bra.s   loc_8D28
loc_8D24:
                
                move.w  #1,d1
loc_8D28:
                
                bra.s   loc_8D2E
loc_8D2A:
                
                move.w  #3,d2           ; code 3: nothing
loc_8D2E:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function RepairItemBySlot


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot index
; 
; Out: D2 = 0 if equipped, 1 if not, 2 if equipped and cursed, 3 if item is nothing

EquipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1           ; item slot -> additional offset
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1         ; get item entry
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1 ; test if item is "nothing"
                beq.s   loc_8D5E        
                bsr.s   IsItemEquippableAndCursed
                cmpi.w  #1,d2
                beq.s   loc_8D5C
loc_8D56:
                
                bset    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a0)
loc_8D5C:
                
                bra.s   loc_8D62
loc_8D5E:
                
                move.w  #3,d2           ; code 3: item is "nothing"
loc_8D62:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function EquipItemBySlot


; =============== S U B R O U T I N E =======================================

; Check if item is equippable by char D0's class, and whether or not it's a cursed item
; 
;       In: D0 = character index
; 
;       Out: D2 = 0 if equippable, 1 if not, 2 if equippable and cursed

IsItemEquippableAndCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                addq.b  #1,d0
                bsr.w   GetItemDefAddress
                move.l  (a0),d1         ; get class-equippable bitfield
                lsr.l   d0,d1           ; push relevant class-equippable bit into carry
                bcc.s   loc_8D94        
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0) 
                                                        ; test cursed bit of itemdef's misc byte
                bne.s   loc_8D8E        
                clr.w   d2              ; code 0: equippable
                bra.s   loc_8D92
loc_8D8E:
                
                move.w  #2,d2           ; code 2: equippable, but cursed
loc_8D92:
                
                bra.s   loc_8D98
loc_8D94:
                
                move.w  #1,d2           ; code 1: not equippable
loc_8D98:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsItemEquippableAndCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot index

UnequipItemBySlotIfNotCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedAndCursed
                tst.w   d2
                bne.s   loc_8DAE
                bclr    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a0)
loc_8DAE:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot index
; 
; Out: A0 = address of character entry item slot index in RAM
;      D2 = 0 if equipped and cursed, 1 if not equipped, 2 if equipped, 3 if nothing

IsItemInSlotEquippedAndCursed:
                
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
loc_8DBC:
                
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8DF8        
                btst    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a0)
                beq.s   loc_8DF2        
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movem.l (sp)+,a0
                bne.s   loc_8DEC        
                clr.w   d2              ; cursed
                bra.s   loc_8DF0
loc_8DEC:
                
                move.w  #2,d2           ; not cursed
loc_8DF0:
                
                bra.s   loc_8DF6
loc_8DF2:
                
                move.w  #1,d2           ; not equipped
loc_8DF6:
                
                bra.s   return_8DFC
loc_8DF8:
                
                move.w  #3,d2           ; empty slot
return_8DFC:
                
                rts

    ; End of function IsItemInSlotEquippedAndCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot index

UnequipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedAndCursed
                bclr    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a0)
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipItemBySlot


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot
; 
; Out: D2 = 2 if not dropped, 3 if dropped or nothing

DropItemBySlot:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                move.w  #3,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_8E54
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movem.l (sp)+,a0
                beq.s   loc_8E52
                move.w  #2,d2           ; item cursed
                btst    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a0)
                bne.s   loc_8E54        ; item equipped and cursed, so can't drop it
loc_8E52:
                
                bsr.s   RemoveAndArrangeItems
loc_8E54:
                
                movem.l (sp)+,d0/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function DropItemBySlot


; =============== S U B R O U T I N E =======================================

; In: A0 = char entry address + offset to items
;     D0 = item slot

RemoveAndArrangeItems:
                
                move.w  #2,d2
                sub.w   d0,d2           ; subtract item slot from 2 to make loop counter
                bmi.s   loc_8E6E        ; no items to rearrange, so skip to removal
loc_8E64:
                
                move.w  SIZE_ITEM(a0),(a0) ; shift item -1 slots
                addq.w  #SIZE_ITEM,a0
                dbf     d2,loc_8E64     
loc_8E6E:
                
                move.w  #ITEM_NOTHING,(a0) ; replace item with nothing
                clr.w   d2
                rts

    ; End of function RemoveAndArrangeItems


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D1 = item slot

RemoveItemBySlot:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   loc_8E9A
                bsr.s   RemoveAndArrangeItems
                bra.w   loc_8E9E
loc_8E9A:
                
                move.w  #3,d2
loc_8E9E:
                
                movem.l (sp)+,d0/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function RemoveItemBySlot


; =============== S U B R O U T I N E =======================================

UnequipWeapon:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2 ; weapon
                bra.s   UnequipItemByType

    ; End of function UnequipWeapon


; =============== S U B R O U T I N E =======================================

UnequipRing:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d2 ; ring
UnequipItemByType:
                
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
loc_8EC2:
                
                move.w  (a1),d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   loc_8EE0
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d2,d1
                beq.s   loc_8EE0
                bclr    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a1)
loc_8EE0:
                
                addq.w  #SIZE_ITEM,a1
                dbf     d0,loc_8EC2
                movem.l (sp)+,d0-d2/a0-a1
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipRing


; =============== S U B R O U T I N E =======================================

GetEquippableWeapons:
                
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #2,d2
                bra.s   loc_8F00
GetEquippableRings:
                
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #4,d2
loc_8F00:
                
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                moveq   #1,d3
                lsl.l   d0,d3           ; place class bit in long value
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                move.l  #$7F0004,(a2)
                move.l  #$7F0004,4(a2)
                move.l  #$7F0004,8(a2)
                move.l  #$800004,$C(a2)
                clr.w   d0
                moveq   #0,d4
                moveq   #3,d5
loc_8F38:
                
                move.w  (a1)+,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1 ; skip if empty slot
                beq.s   loc_8F4E
                bsr.s   IsItemEquippable
                bcc.s   loc_8F4E
                move.w  d1,(a2)+
                move.w  d4,(a2)+
                addq.w  #1,d0
loc_8F4E:
                
                addq.w  #1,d4
                dbf     d5,loc_8F38
                move.w  d0,d1
                movem.l (sp)+,d0/d2-d6/a1-a2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                rts

    ; End of function GetEquippableWeapons


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
;     D2 = item type bitmask (for ANDing the item type bitfield)
;     D3 = class equip bitmask (for ANDing the item equip bitfield)

IsItemEquippable:
                
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d6
                and.b   d2,d6
                beq.s   loc_8F7A        ; skip if not a weapon/ring
                move.l  (a0),d6
                and.l   d3,d6
                beq.s   loc_8F7A
                ori     #1,ccr          ; set carry flag : Item is Equippable !
loc_8F7A:
                
                movem.l (sp)+,a0
                rts

    ; End of function IsItemEquippable


; =============== S U B R O U T I N E =======================================

IsWeaponOrRingEquippable:
                
                movem.l d0/d2-d6/a0,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                moveq   #1,d3
                lsl.l   d0,d3
                bsr.s   IsItemEquippable
                movem.l (sp)+,d0/d2-d6/a0
                rts

    ; End of function IsWeaponOrRingEquippable


; =============== S U B R O U T I N E =======================================

GetEquipmentNewATTandDEF:
                
                movem.l d0/d4-d6/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2 ; current ATT
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3 ; current DEF
                movem.w d0/d2-d3,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
                clr.w   d0
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                moveq   #1,d3
                lsl.l   d0,d3
                bsr.s   IsItemEquippable
                movem.w (sp)+,d0/d2-d3
                bcc.w   @Skip           ; skip if item is not equippable
                movem.l d1/a0,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d2
                movem.l (sp)+,d1/a0
                andi.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2 ; get weapon/ring type
                bsr.w   GetCurrentATTandDEFwithSpecificItem
@Skip:
                
                movem.l (sp)+,d0/d4-d6/a0
                rts

    ; End of function GetEquipmentNewATTandDEF


; =============== S U B R O U T I N E =======================================

; In: A0 = character entry address
;     D1 = item index
;     D2 = item type (weapon or ring)
; 
; Out: D2 = current ATT with item equipped
;      D3 = current DEF with item equipped

GetCurrentATTandDEFwithSpecificItem:
                
                movem.l d0-d1/d4-a0,-(sp)
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
loc_8FF6:
                
                move.w  COMBATANT_OFFSET_ITEM_0(a0,d4.w),d5
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   loc_901C
                movem.l d0-d1/a0,-(sp)  ; it's equipped
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d0
                and.b   d2,d0           ; it's a weapon or a ring
                movem.l (sp)+,d0-d1/a0
                bne.w   loc_903A
loc_901C:
                
                addq.w  #SIZE_ITEM,d4
                dbf     d7,loc_8FF6
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
loc_9026:
                
                move.w  COMBATANT_OFFSET_ITEM_0(a0,d4.w),d5
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.w   loc_903A
                addq.w  #2,d4
                dbf     d7,loc_9026
                clr.w   d4
loc_903A:
                
                move.w  COMBATANT_OFFSET_ITEM_0(a0,d4.w),d5
                movem.l d4-d5/a0,-(sp)
                bset    #ITEMENTRY_BIT_EQUIPPED,d1
                move.w  d1,COMBATANT_OFFSET_ITEM_0(a0,d4.w) ; equip item
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3
                movem.l (sp)+,d4-d5/a0
                movem.w d2-d3,-(sp)
                move.w  d5,COMBATANT_OFFSET_ITEM_0(a0,d4.w) ; and unequip
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.w (sp)+,d2-d3
                movem.l (sp)+,d0-d1/d4-a0
                rts

    ; End of function GetCurrentATTandDEFwithSpecificItem


; =============== S U B R O U T I N E =======================================

OrderItems:
                
                movem.l d0-d3/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a0
                moveq   #2,d1
loc_9082:
                
                lea     SIZE_ITEM(a0),a1
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
                move.w  d0,(a3)         ; wtf a3 ?! unused bugged subroutine ?
                move.w  d3,(a0)
loc_90A0:
                
                addq.w  #SIZE_ITEM,a1
loc_90A2:
                
                dbf     d2,loc_9088
                addq.w  #SIZE_ITEM,a0
                dbf     d1,loc_9082
                movem.l (sp)+,d0-d3/a0-a1
                rts

    ; End of function OrderItems


; =============== S U B R O U T I N E =======================================

IsItemCursed:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_90C6        
                ori     #1,ccr          ; item is cursed
                bra.s   loc_90C8
loc_90C6:
                
                tst.b   d0              ; clear carry flag
loc_90C8:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemCursed


; =============== S U B R O U T I N E =======================================

; carry set : YES

IsItemUsableInBattle:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefAddress
loc_90D2:
                
                cmpi.b  #$FF,ITEMDEF_OFFSET_USE_SPELL(a0)
                beq.s   loc_90E0
loc_90DA:
                
                ori     #1,ccr
                bra.s   loc_90E2
loc_90E0:
                
                tst.b   d0
loc_90E2:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableInBattle


; =============== S U B R O U T I N E =======================================

; carry set : NO

IsItemUsableWeaponInBattle:
                
                move.l  a0,-(sp)
                bsr.w   GetItemType     
                tst.w   d2
                beq.s   loc_90FA
                bsr.w   IsWeaponOrRingEquippable
                bcc.s   loc_9100
                bsr.s   IsItemUsableInBattle
                bcc.s   loc_9100
loc_90FA:
                
                ori     #1,ccr
                bra.s   loc_9102
loc_9100:
                
                tst.b   d0
loc_9102:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableWeaponInBattle


; =============== S U B R O U T I N E =======================================

; In: D0 = character index

UnequipAllItemsIfNotCursed:
                
                movem.l d0-d1/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
loc_9114:
                
                move.w  (a1),d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   loc_9138
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_9138
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_9138
                bclr    #ITEMENTRY_BIT_EQUIPPED,ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT(a1)
loc_9138:
                
                addq.w  #2,a1
                dbf     d0,loc_9114
                movem.l (sp)+,d0-d1/a0-a1
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================

GetItemInventoryLocation:
                
                movem.l d2-d3/d6-a0,-(sp)
                move.w  d1,d3
                bsr.w   UpdateForce     
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d6
                subq.w  #1,d6
loc_915A:
                
                move.b  (a0)+,d0
                clr.w   d1
                bsr.w   GetItemAndNumberOfItems
                tst.w   d2
                beq.s   loc_9182
                move.w  d2,d7           ; number of items
                subq.w  #1,d7
loc_916A:
                
                move.w  d7,d1
                bsr.w   GetItemAndNumberOfItems
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.w   d3,d1
                bne.s   loc_917E
                move.w  d7,d1
                bra.w   loc_918E
loc_917E:
                
                dbf     d7,loc_916A
loc_9182:
                
                dbf     d6,loc_915A
                move.w  #$FFFF,d0
                move.w  #$FFFF,d1
loc_918E:
                
                movem.l (sp)+,d2-d3/d6-a0
                rts

    ; End of function GetItemInventoryLocation


; =============== S U B R O U T I N E =======================================

; In: D0 = entity index
;     D1 = item index
; 
; Out: D2 = item slot ($FFFF if not held)

GetItemSlotContainingIndex:
                
                movem.l d1/d3/d7,-(sp)
                move.w  d1,d3
                andi.w  #ITEMENTRY_MASK_INDEX,d3
                moveq   #0,d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
loc_91A2:
                
                move.w  d2,d1
                move.l  d2,-(sp)
                jsr     GetItemAndNumberOfItems(pc)
                move.l  (sp)+,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.b   d3,d1
                beq.w   loc_91C0
                addq.w  #1,d2
                dbf     d7,loc_91A2
                move.w  #$FFFF,d2
loc_91C0:
                
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
                movea.l (p_SpellNames).l,a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindSpellName


; =============== S U B R O U T I N E =======================================

; Get address of entry in spell definition table
; 
;       In: D1 = spell index
; 
;       Out: A0 = address of spell definition

GetSpellDefAddress:
                
                move.l  d0,-(sp)
loc_91DC:
                
                movea.l (p_SpellDefs).l,a0
                moveq   #SPELLENTRY_DEFS_COUNTER,d0
loc_91E4:
                
                cmp.b   (a0),d1
                beq.s   loc_91F6
                lea     SPELLDEF_ENTRY_SIZE(a0),a0
                dbf     d0,loc_91E4
                movea.l (p_SpellDefs).l,a0
loc_91F6:
                
                move.l  (sp)+,d0
                rts

    ; End of function GetSpellDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = spell slot
; 
; Out: D1 = spell index
;      D2 = number of spells learned

GetSpellAndNumberOfSpells:
                
                movem.l d0/d3/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_SPELLS_START(a0),a0
                move.b  (a0,d1.w),d1
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                clr.w   d2
@Loop:
                
                move.b  (a0)+,d0
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

; In: D0 = character index
;     D1 = spell index
; 
; Out: D2 = result (0 = learned new spell, 1 = upgraded spell, 2 = no room)

LearnSpell:
                
                movem.l d0/d3-d5/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_STATUSEFFECTS(a0),a0
                move.w  d1,d4
                move.w  d1,d5
                move.w  #1,d2
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                andi.w  #SPELLENTRY_MASK_INDEX,d4 ; get spell index ?
                lsr.w   #SPELLENTRY_OFFSET_LV,d5
loc_9242:
                
                move.b  -(a0),d0        ; loop through spells to see if we already know a lower level
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmp.b   d4,d0
                bne.s   loc_9258
                move.b  (a0),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                cmp.b   d0,d5
                bls.s   loc_9278
                move.b  d1,(a0)         ; replace existing spell with new one (higher level)
                bra.s   loc_9276
loc_9258:
                
                dbf     d3,loc_9242     
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
loc_925E:
                
                move.b  (a0)+,d0        ; loop through spells to find the next empty slot
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   loc_9274
                dbf     d3,loc_925E     
                move.w  #2,d2
                bra.s   loc_9278
loc_9274:
                
                move.b  d1,-(a0)
loc_9276:
                
                clr.w   d2
loc_9278:
                
                movem.l (sp)+,d0/d3-d5/a0
                rts

    ; End of function LearnSpell


; =============== S U B R O U T I N E =======================================

; Get MP cost of spell
; 
;       In: D1 = spell index
; 
;       Out: D1 = spell MP cost

GetSpellCost:
                
                move.l  a0,-(sp)
                bsr.w   GetSpellDefAddress
                clr.w   d1
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetSpellCost


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: A0 = address of combatant entry in RAM

GetCombatantEntryAddress:
                
                movem.w d0-d1,-(sp)
                cmpi.b  #COMBATANT_ENEMIES_START,d0
                bcc.s   @Enemy
                cmpi.b  #COMBATANT_ALLIES_SPACEEND_MINUS_ONE,d0
                bhi.s   @ErrorHandling
                bra.s   @GetAddress
@Enemy:
                
                cmpi.b  #COMBATANT_ENEMIES_SPACEEND,d0
                bhi.s   @ErrorHandling
                subi.b  #COMBATANT_ALLIES_SPACEEND_AND_ENEMIES_START_DIFFERENCE,d0
@GetAddress:
                
                andi.w  #$FF,d0
                lsl.w   #3,d0
                move.w  d0,d1
                lsl.w   #3,d0
                sub.w   d1,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a0
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
                
                bsr.s   GetCombatantEntryAddress
                move.b  d1,(a0,d7.w)
                rts

    ; End of function SetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = word
;     D7 = offset

SetCombatantWord:
                
                bsr.s   GetCombatantEntryAddress
                move.w  d1,(a0,d7.w)
                rts

    ; End of function SetCombatantWord


; =============== S U B R O U T I N E =======================================

SetCombatantLong:
                
                bsr.s   GetCombatantEntryAddress
                move.l  d1,(a0,d7.w)
                rts

    ; End of function SetCombatantLong


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant byte offset
; 
; Out: D1 = byte

GetCombatantByte:
                
                bsr.s   GetCombatantEntryAddress
                clr.w   d1
                move.b  (a0,d7.w),d1
                rts

    ; End of function GetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant word offset
; 
; Out: D1 = word

GetCombatantWord:
                
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts

    ; End of function GetCombatantWord


; =============== S U B R O U T I N E =======================================

dup_GetCombatantWord:
                
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts

    ; End of function dup_GetCombatantWord


; =============== S U B R O U T I N E =======================================

; clamp byte D7 of entity D0's information + D1 between D5 and D6

IncreaseAndClampByte:
                
                bsr.w   GetCombatantEntryAddress
                add.b   (a0,d7.w),d1
                bcs.s   loc_9320
                cmp.b   d6,d1
                bcs.s   loc_9324
loc_9320:
                
                move.b  d6,d1
                bra.s   loc_932A
loc_9324:
                
                cmp.b   d5,d1
                bcc.s   loc_932A
                move.b  d5,d1
loc_932A:
                
                move.b  d1,(a0,d7.w)
                andi.w  #$FF,d1
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
                andi.w  #$FF,d1
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
                bcs.s   loc_9380
                cmp.b   d5,d1
                bcc.s   loc_9384
loc_9380:
                
                move.b  d5,d1
                bra.s   loc_938A
loc_9384:
                
                cmp.b   d6,d1
                bcs.s   loc_938A
                move.b  d6,d1
loc_938A:
                
                move.b  d1,(a0,d7.w)
                move.w  (sp)+,d4
                andi.w  #$FF,d1
                rts

    ; End of function DecreaseAndClampByte


; =============== S U B R O U T I N E =======================================

ClampWordIncreasing:
                
                bsr.w   GetCombatantEntryAddress
                add.w   (a0,d7.w),d1
                bmi.s   loc_93A4
                cmp.w   d6,d1
                bcs.s   loc_93A8
loc_93A4:
                
                move.w  d6,d1
                bra.s   loc_93AE
loc_93A8:
                
                cmp.w   d5,d1
                bcc.s   loc_93AE
                move.w  d5,d1
loc_93AE:
                
                move.w  d1,(a0,d7.w)
                rts

    ; End of function ClampWordIncreasing


; =============== S U B R O U T I N E =======================================

ClampWordDecreasing:
                
                move.w  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d4
                move.w  (a0,d7.w),d1
                sub.w   d4,d1
                bmi.s   loc_93C8
                cmp.w   d5,d1
                bhi.s   loc_93CC
loc_93C8:
                
                move.w  d5,d1
                bra.s   loc_93D2
loc_93CC:
                
                cmp.w   d6,d1
                bls.s   loc_93D2
                move.w  d6,d1
loc_93D2:
                
                move.w  d1,(a0,d7.w)
                move.w  (sp)+,d4
                rts

    ; End of function ClampWordDecreasing


; =============== S U B R O U T I N E =======================================

sub_93DA:
                
                bsr.w   GetCombatantEntryAddress
                add.l   (a0,d7.w),d1
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
                
                move.l  d1,(a0,d7.w)
                rts

    ; End of function sub_93DA


; =============== S U B R O U T I N E =======================================

sub_93F8:
                
                move.l  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.l  d1,d4
                move.l  (a0,d7.w),d1
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
                
                move.l  d1,(a0,d7.w)
                move.l  (sp)+,d4
                rts

    ; End of function sub_93F8


; =============== S U B R O U T I N E =======================================

; Gets distance between two entities (simple X and Y calculation, no obstructions)
; In: D0 = from entity
;     D1 = to entity
; Out: D2 = distance

GetDistanceBetweenEntities:
                
                movem.l d0-d1/d3-d5,-(sp)
                move.w  d1,d5           ; d0 and d1 are character indexes
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_9478
                move.w  d1,d2           ; keep 1st character XPos
                bsr.w   GetYPos
                cmpi.b  #$FF,d1
                beq.w   loc_9478
                move.w  d1,d3           ; keep 1st character YPos
                move.w  d5,d0
                bsr.w   GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_9478
                move.w  d1,d4
                bsr.w   GetYPos
                cmpi.b  #$FF,d1
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
                
                move.w  #$FFFF,d2
loc_947C:
                
                movem.l (sp)+,d0-d1/d3-d5
                rts

    ; End of function GetDistanceBetweenEntities


; =============== S U B R O U T I N E =======================================

nullsub_9482:
                
                rts

    ; End of function nullsub_9482


; =============== S U B R O U T I N E =======================================

LevelUp:
                
                movem.l d0-a1,-(sp)
                link    a6,#-$10
                move.w  d0,-2(a6)
                bsr.w   GetClass        
                move.w  d1,d3
                bsr.w   GetCurrentLevel
                moveq   #CHAR_LEVELCAP_PROMOTED,d2
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d3
                bge.s   @IsPromoted
                moveq   #CHAR_LEVELCAP_BASE,d2
@IsPromoted:
                
                lsl.w   #2,d0
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d0.w),a0
@EvaluateClass:
                
                tst.b   (a0)            ; If this byte is negative, we haven't found a matching stat block for our class...
                bmi.w   @Abort          ;  so the level up routine is aborted.
                cmp.b   (a0)+,d3        ;  Else, if this stat block is matching our class...
                beq.s   @EvaluateLevel  ;  move on to level evaluation.
@Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+ ; loop until we come across an "end of spell list" control code
                bcs.s   @Loop           
                bra.s   @EvaluateClass  
@EvaluateLevel:
                
                cmp.w   d2,d1           ; if current level is below level cap...
                blt.s   @EvaluateStatGains ;  move on to stat gains evaluation
@Abort:
                
                lea     (byte_FFAF82).l,a1
                move.b  #$FF,(a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                move.b  #$FF,(a1)
                bra.w   @Done
@EvaluateStatGains:
                
                lea     (byte_FFAF82).l,a1
                move.w  -2(a6),d0
                bsr.w   GetCurrentLevel
                move.w  d1,d5
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetMaxHP
                bsr.w   CalculateStatGain
                move.b  d1,1(a1)
                bsr.w   IncreaseMaxHP
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetMaxMP
                bsr.w   CalculateStatGain
                move.b  d1,2(a1)
                bsr.w   IncreaseMaxMP
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseATT
                bsr.w   CalculateStatGain
                move.b  d1,3(a1)
                bsr.w   IncreaseBaseATT
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseDEF
                bsr.w   CalculateStatGain
                move.b  d1,4(a1)
                bsr.w   IncreaseBaseDEF
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseAGI
                bsr.w   CalculateStatGain
                move.b  d1,5(a1)
                bsr.w   IncreaseBaseAGI
                addq.w  #1,d5
                move.w  d5,d1
                bsr.w   SetLevel
                move.b  d5,(a1)
                bsr.w   GetClass        
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; BUGGED - CHAR_CLASS_FIRSTPROMOTED should be compared here OR...
                blt.s   @NotPromoted    ;  alternatively, this branch condition should be "lower than or equal"
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5
@NotPromoted:
                
                move.b  #$FF,6(a1)
@CheckUseFirstSpellList:
                
                move.b  (a0)+,d2
                move.b  (a0)+,d1
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2
                bne.s   @EvaluateSpellList
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
                lea     $10(a0),a0
                bra.s   @CheckUseFirstSpellList
@EvaluateSpellList:
                
                cmpi.b  #CODE_TERMINATOR_BYTE,d2
                beq.w   @SpellList_Done
                cmp.b   d2,d5
                bne.s   @CheckUseFirstSpellList
                bsr.w   LearnSpell      
                tst.w   d2
                bne.s   @SpellList_Done
                move.b  d1,6(a1)
@SpellList_Done:
                
                bsr.w   ApplyStatusEffectsAndItemsOnStats
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function LevelUp


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = starting level

InitCharacterStats:
                
                movem.l d0-d2/a0,-(sp)
                move.w  d1,-(sp)        ; -> backup starting level
                
                ; Get ally stats entry address -> A0
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
                
                ; Set starting values
                clr.w   d1
                addq.l  #2,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxHP
                bsr.w   SetCurrentHP
                clr.w   d1
                addq.l  #2,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxMP
                bsr.w   SetCurrentMP
                clr.w   d1
                addq.l  #2,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseATT
                clr.w   d1
                addq.l  #2,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseDEF
                clr.w   d1
                addq.l  #2,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseAGI
                moveq   #1,d1
                bsr.w   SetLevel
                
                ; Determine effective level
                move.w  (sp)+,d4        ; <- restore starting level
                move.w  d4,d5           ; D5 = effective level (takes additional levels into account if promoted for the purpose of spell learning)
                bsr.w   GetClass        
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; <BUG> TORT is wrongfully being treated as a promoted class here
                                        ; should either compare to first promoted class, or change conditional branch to "branch on lower than or equal"
                blt.s   @GetAllyStatsEntryAddress
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5 ; add 20 to effective level if promoted
@GetAllyStatsEntryAddress:
                
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.w   @Done           ; abort function if "for class" entry is negative (this shouldn't happen)
                cmp.b   (a0)+,d1
                beq.s   @GetSpellListAddress ; break out of loop once we found a matching stats block for starting class
@FindNextStatsBlock_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+
                bcs.s   @FindNextStatsBlock_Loop ; parse stats block bytes until we come across a spell list control code
                bra.s   @FindStatsBlockForClass_Loop
@GetSpellListAddress:
                
                lea     ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE(a0),a0
@LearnSpell_Loop:
                
                move.b  (a0)+,d2        ; D2 = level which spell is learned at
                move.b  (a0)+,d1        ; D1 = spell index
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2
                bne.s   @CheckForEndOfSpellList ; go to next step once we've got the applicable spell list address
                
                ; Get spell list address from first stats block -> A0
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
                lea     ALLYSTATS_OFFSET_SPELL_LIST(a0),a0
                bra.s   @LearnSpell_Loop
@CheckForEndOfSpellList:
                
                cmpi.b  #ALLYSTATS_CODE_END_OF_SPELL_LIST,d2
                beq.w   @LevelUp        ; break out of loop upon reaching end of spell list
                cmp.b   d2,d5
                blt.s   @LearnSpell_Loop
                cmpi.b  #SPELL_HEAL|SPELL_LV3,d1
                bne.s   @LearnSpell
                bsr.w   GetBaseProwess
                move.w  d1,d2
                andi.w  #PROWESS_MASK_CRITICAL,d1
                lsr.w   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d2 ; shift double and counter attack settings into lower nibble position
                addq.w  #1,d2
                cmpi.w  #8,d2
                bne.s   @Continue
                moveq   #7,d2
@Continue:
                
                lsl.w   #4,d2
                or.w    d2,d1
                bsr.w   SetBaseProwess
                bra.s   @Next
@LearnSpell:
                
                bsr.w   LearnSpell      
@Next:
                
                bra.s   @LearnSpell_Loop
@LevelUp:
                
                subq.w  #2,d4           ; level up loop counter = current level - 2
                blt.w   @Done
@LevelUp_Loop:
                
                bsr.w   LevelUp
                dbf     d4,@LevelUp_Loop
@Done:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function InitCharacterStats


; =============== S U B R O U T I N E =======================================

; In: D1 = current stat value
;     D2 = growth curve index
;     D3 = starting value
;     D4 = projected value
;     D5 = current level
; 
; Out: D1 = stat gain value

CalculateStatGain:
                
                tst.b   d2
                bne.s   @EvaluateLevel  ; keep going if curve type other than None
                move.w  #0,d1           ; otherwise, stat gain value = 0
                rts
@EvaluateLevel:
                
                movem.l d0/d2-a0,-(sp)
                movem.w d1-d5,-(sp)     ; -> backup function arguments
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d5 ; If current level within projection
                blt.s   @GetCurveParams ;  ...keep going.
                move.w  #$100,d0
                move.w  #$180,d4
                bra.s   @RandomizeStatGain
@GetCurveParams:
                
                andi.w  #GROWTHCURVE_MASK_INDEX,d2
                subq.w  #1,d2
                muls.w  #GROWTHCURVE_DEF_SIZE,d2
                movea.l (p_StatGrowthCurves).l,a0
                adda.w  d2,a0
                move.w  d5,d2
                subq.w  #1,d2
                lsl.w   #2,d2
                adda.w  d2,a0
                move.w  (a0)+,d0        ; D0 = curve_param_1 for current level
                move.w  (a0)+,d7        ; D7 = curve_param_2 for current level
                sub.w   d3,d4           ; D4 = projected growth
                mulu.w  d7,d4
@RandomizeStatGain:
                
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d4
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d4
                addi.w  #$80,d4 
                lsr.w   #8,d4
                move.w  d4,d6           ; D6 = randomized stat gain
                movem.w (sp)+,d1-d5     ; <- restore function arguments
                sub.w   d3,d4           ; D4 = projected growth
                mulu.w  d4,d0
                addi.w  #$80,d0 
                lsr.w   #8,d0
                add.w   d3,d0           ; D0 = expected minimum stat for current level
                add.w   d6,d1
                cmp.w   d0,d1           ; If new value greater than expected minimum
                bge.s   @Done           ;  ...we're done.
                addq.w  #1,d6           ;  Otherwise, lovingly apply "loser pity bonus."
@Done:
                
                move.w  d6,d1           ; return stat gain value -> D1
                movem.l (sp)+,d0/d2-a0
                rts

    ; End of function CalculateStatGain


; =============== S U B R O U T I N E =======================================

NewGame:
                
                movem.w d0-d1/d7,-(sp)
                bsr.w   InitGameSettings
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.w   InitCharacterCombatantEntry
                dbf     d7,@Loop
                moveq   #GOLD_STARTING_AMOUNT,d1 ; starting gold value
                bsr.w   SetGold
                moveq   #ALLY_BOWIE,d0  ; starting character
                bsr.w   JoinForce       
                movem.w (sp)+,d0-d1/d7
                rts

    ; End of function NewGame


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

InitCharacterCombatantEntry:
                
                movem.l d0-d3/a0-a1,-(sp)
                move.w  d0,d1
                mulu.w  #COMBATANT_ENTRY_SIZE,d1
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                adda.w  d1,a1
                movea.l (p_AllyNames).l,a0
                move.w  d0,d1
                subq.w  #1,d1
                blt.s   @CalculateNameLengthCounter
@FindName_Loop:
                
                clr.w   d2
                move.b  (a0)+,d2
                lea     (a0,d2.w),a0
                dbf     d1,@FindName_Loop
@CalculateNameLengthCounter:
                
                move.b  (a0)+,d2
                moveq   #ALLYNAME_MAX_LENGTH,d3
                sub.w   d2,d3
                subq.w  #1,d2
                blt.s   @CalculateRemainingNameBytesCounter
@CopyName_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d2,@CopyName_Loop
@CalculateRemainingNameBytesCounter:
                
                subq.w  #1,d3
                blt.s   @CopyAllyStartDefinition
@ClearRemainingNameBytes_Loop:
                
                clr.b   (a1)+
                dbf     d3,@ClearRemainingNameBytes_Loop
@CopyAllyStartDefinition:
                
                move.w  d0,d1
                mulu.w  #ALLYSTARTDEF_ENTRY_SIZE,d1
                movea.l (p_AllyStartDefs).l,a0
                adda.w  d1,a0
                suba.w  #COMBATANT_OFFSET_CLASS,a1
                move.b  (a0)+,d1
                move.b  d1,COMBATANT_OFFSET_CLASS(a1)
                move.b  (a0)+,d2
                move.b  d2,COMBATANT_OFFSET_LEVEL(a1)
                ext.w   d2
                move.w  d2,-(sp)
                clr.w   d3
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_0(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_1(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_2(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_3(a1)
                move.l  #$3F3F3F3F,COMBATANT_OFFSET_SPELLS_START(a1)
                bsr.w   SetCharacterClassData
                move.w  (sp)+,d1
                bsr.w   InitCharacterStats
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.l (sp)+,d0-d3/a0-a1
                rts

    ; End of function InitCharacterCombatantEntry


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = class index

SetCharacterClassData:
                
                movem.l d0-d1/a0-a1,-(sp)
                mulu.w  #COMBATANT_ENTRY_SIZE,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                adda.w  d0,a1
                movea.l (p_ClassDefs).l,a0
loc_980C:
                
                andi.w  #CLASS_MASK_INDEX,d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE1(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE2(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_PROWESS_BASE(a1)
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function SetCharacterClassData


; =============== S U B R O U T I N E =======================================

Promote:
                
                movem.w d1,-(sp)
                bsr.w   GetClass        
                bsr.s   SetCharacterClassData
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.w (sp)+,d1
                rts

    ; End of function Promote


; =============== S U B R O U T I N E =======================================

; Clear all flags and important game variables.

InitGameSettings:
                
                movem.l d0/d7-a0,-(sp)
                moveq   #0,d0
                lea     ((GAME_FLAGS-$1000000)).w,a0
                moveq   #$1F,d7
loc_9850:
                
                move.l  d0,(a0)+
                dbf     d7,loc_9850
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                moveq   #$F,d7
loc_985C:
                
                move.l  d0,(a0)+
                dbf     d7,loc_985C
                move.l  #$7F7F7F7F,d0
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                moveq   #$F,d7
loc_986E:
                
                move.l  d0,(a0)+
                dbf     d7,loc_986E
                moveq   #0,d0
                move.w  d0,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                move.w  d0,((CURRENT_GOLD-$1000000)).w
                move.b  d0,((PLAYER_TYPE-$1000000)).w
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d0,((CURRENT_BATTLE-$1000000)).w
                move.b  d0,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
                move.b  d0,((EGRESS_MAP_INDEX-$1000000)).w
                move.l  #359999,((SPECIAL_BATTLE_RECORD-$1000000)).w
                move.b  #2,((MESSAGE_SPEED-$1000000)).w
                move.l  #$FFFFFFFF,((FOLLOWERS_LIST-$1000000)).w
                move.w  #$FFFF,((byte_FFAF26-$1000000)).w
                movem.l (sp)+,d0/d7-a0
                rts

    ; End of function InitGameSettings


; =============== S U B R O U T I N E =======================================

CheckFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                and.b   (a0),d0
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function CheckFlag


; =============== S U B R O U T I N E =======================================

SetFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                or.b    d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SetFlag


; =============== S U B R O U T I N E =======================================

ClearFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                eori.b  #$FF,d0
                and.b   d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearFlag


; =============== S U B R O U T I N E =======================================

; flag bit check pattern based on bit number D1 -> D0

GetFlag:
                
                andi.l  #FLAG_MASK,d1
                divu.w  #8,d1           ; get the byte in which the flag is stored
                lea     ((GAME_FLAGS-$1000000)).w,a0 ; go to the flag location in RAM
                adda.w  d1,a0           ; go to the concerned byte
                swap    d1
                moveq   #$FFFFFF80,d0
                lsr.b   d1,d0
                rts

    ; End of function GetFlag


; =============== S U B R O U T I N E =======================================

; determine who is in the force or not based on flags and update RAM lists

UpdateForce:
                
                movem.l d0-d4/d7/a2-a4,-(sp)
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a2
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a3
                lea     ((RESERVE_MEMBERS-$1000000)).w,a4
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                moveq   #0,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7 ; HARDCODED number of allies
loc_991A:
                
                move.w  d0,d1
                addi.w  #0,d1
                bsr.s   CheckFlag
                beq.w   loc_993E
                move.b  d0,(a2)+
                addq.w  #1,d2
                move.w  d0,d1
                addi.w  #$20,d1 
                bsr.s   CheckFlag
                beq.s   loc_993A
                move.b  d0,(a3)+
                addq.w  #1,d3
                bra.s   loc_993E
loc_993A:
                
                move.b  d0,(a4)+
                addq.w  #1,d4
loc_993E:
                
                addq.b  #1,d0
                dbf     d7,loc_991A
                move.w  d2,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                move.w  d3,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                move.w  d4,((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w
                movem.l (sp)+,d0-d4/d7/a2-a4
                rts

    ; End of function UpdateForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

JoinForce:
                
                move.l  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #0,d1
                bsr.w   SetFlag
                bsr.s   UpdateForce     
                cmpi.w  #FORCE_MAX_SIZE,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                bcc.s   loc_9972
                bsr.w   JoinBattleParty 
loc_9972:
                
                move.l  (sp)+,d1
                rts

    ; End of function JoinForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

LeaveForce:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #0,d1
                bsr.w   ClearFlag
                move.w  #MAP_NULLPOSITION,d1
                jsr     SetXPos
                move.l  (sp)+,d1
                rts

    ; End of function LeaveForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

IsInBattleParty:
                
                movem.l d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
                bsr.w   CheckFlag
                movem.l (sp)+,d1
                rts

    ; End of function IsInBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

JoinBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
                bsr.w   SetFlag
                move.l  (sp)+,d1
                rts

    ; End of function JoinBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

LeaveBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
                bsr.w   ClearFlag
                move.w  #$FFFF,d1
                jsr     SetXPos
                move.l  (sp)+,d1
                rts

    ; End of function LeaveBattleParty


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: D2 = number of item index in deals

GetDealsItemAmount:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetDealsItemInfo
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function GetDealsItemAmount


; =============== S U B R O U T I N E =======================================

; In: D1 = item index

AddItemToDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                cmpi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                beq.s   loc_99FC
                add.b   d0,(a0)
loc_99FC:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function AddItemToDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item index

RemoveItemFromDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                tst.b   d2
                beq.s   loc_9A10
                sub.b   d0,(a0)
loc_9A10:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function RemoveItemFromDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: A0 = RAM address of deals slot
;      D0 = amount to add to deals slot (0x10 or 0x01)
;      D2 = number of item index in deals

GetDealsItemInfo:
                
                andi.l  #ITEMENTRY_MASK_INDEX,d1
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                divu.w  #2,d1
                adda.w  d1,a0
                move.b  (a0),d2
                btst    #DEALS_BIT_REMAINDER,d1
                bne.s   loc_9A34
                lsr.b   #BITS_HALFBYTE,d2
                moveq   #DEALS_ADD_AMOUNT_ODD,d0
                bra.s   return_9A3A
loc_9A34:
                
                andi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                moveq   #DEALS_ADD_AMOUNT_EVEN,d0
return_9A3A:
                
                rts

    ; End of function GetDealsItemInfo


; =============== S U B R O U T I N E =======================================

; In: D1 = item index (only the actual index is used, the status bits are cut out)

AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                cmp.w   ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                bcs.s   @Skip           ; skip adding item if no room
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.b  d1,(a0,d0.w)
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

RemoveItemFromCaravan:
                
                movem.l d0/d7-a1,-(sp)
                moveq   #0,d0
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                movea.l a0,a1
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_9A94
loc_9A78:
                
                cmp.w   d0,d1
                bne.s   loc_9A84
                addq.l  #1,a1
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                bra.s   loc_9A86
loc_9A84:
                
                move.b  (a1)+,(a0)+
loc_9A86:
                
                addq.w  #1,d0
                dbf     d7,loc_9A78
                cmpa.l  a1,a0
                beq.s   loc_9A94
                move.b  #ITEM_NOTHING,(a0)
loc_9A94:
                
                movem.l (sp)+,d0/d7-a1
                rts

    ; End of function RemoveItemFromCaravan

