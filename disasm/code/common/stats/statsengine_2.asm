
; ASM FILE code\common\stats\statsengine_2.asm :
; 0x855A..0x9484 : Character stats engine

; =============== S U B R O U T I N E =======================================

; In: A0 = temporary space used when naming characters


LoadAllyName:
                
                tst.b   (a0)
                beq.s   @Return         ; skip copying name if entered string is null (and keep default name)
                movem.l d0/a0-a1,-(sp)
                lea     (a0),a1
                bsr.w   GetCombatantEntryAddress
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
@Loop:
                
                move.b  (a1)+,(a0)+
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


SetStatusEffects:
                
                movem.l d7-a0,-(sp)
                moveq   #COMBATANT_OFFSET_STATUSEFFECTS,d7
                bsr.w   SetCombatantWord
                movem.l (sp)+,d7-a0
                rts

    ; End of function SetStatusEffects


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
                blt.s   @Return
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #$270F,d6
                moveq   #$32,d7 
                bsr.w   ClampWordIncreasing
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
                move.w  #$270F,d6
                moveq   #$36,d7 
                bsr.w   ClampWordIncreasing
                movem.l (sp)+,d5-a0
@Return:
                
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

                if (FULL_CLASS_NAMES>=1)
GetClassAndFullName:
                bsr.w   GetClass
GetFullClassName:
                lea     tbl_FullClassNames,a0
                bra.s   FindName
                endif
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES>=1)
GetClassAndName:
                bsr.w   GetClass
                endif

; =============== S U B R O U T I N E =======================================


GetClassName:
                
                movea.l (p_tbl_ClassNames).l,a0

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
                bmi.s   @Done           ; done if string length = 0
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
                bcs.s   @CapGoldAmount
                cmpi.l  #FORCE_MAX_GOLD,d1
                bls.s   @Done
@CapGoldAmount:
                
                move.l  #FORCE_MAX_GOLD,d1
@Done:
                
                move.l  d1,((CURRENT_GOLD-$1000000)).w
                rts

    ; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================


DecreaseGold:
                
                movem.l d0,-(sp)
                move.l  ((CURRENT_GOLD-$1000000)).w,d0
                sub.l   d1,d0
                bcc.s   @Continue
                moveq   #0,d0
@Continue:
                
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
                bsr.w   GetStatusEffects
                move.w  d1,d3
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d3
                bsr.w   InitCurrentStats
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                lea     COMBATANT_OFFSET_PROWESS_CURRENT(a0),a2
                bsr.w   ApplyStatusEffectsOnStats
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d2
@Loop:
                
                move.w  (a1),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                testEquippedBit (a1)
                beq.s   @Next
                bsr.w   ApplyItemOnStats
                beq.s   @Next
                ori.w   #4,d3
@Next:
                
                addq.w  #2,a1
                dbf     d2,@Loop
                
                move.w  (sp)+,d0
                move.w  d3,d1
                bsr.w   SetStatusEffects
                movem.l (sp)+,d0-d3/a0-a2
                rts

    ; End of function ApplyStatusEffectsAndItemsOnStats


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D3 = status effects bitfield


ApplyStatusEffectsOnStats:
                
                clr.l   d1
                move.w  d3,d2
                andi.w  #STATUSEFFECT_ATTACK,d2
                rol.w   #2,d2
                bsr.w   GetBaseATT
                mulu.w  d2,d1
                lsr.l   #3,d1
                bsr.w   IncreaseCurrentATT
                move.w  d3,d2
                andi.w  #STATUSEFFECT_BOOST,d2
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
                andi.w  #STATUSEFFECT_SLOW,d2
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
                beq.s   @Return
                moveq   #1,d1
                bsr.w   DecreaseCurrentMOV
                moveq   #5,d1
                bsr.w   DecreaseCurrentAGI
@Return:
                
                rts

    ; End of function ApplyStatusEffectsOnStats


; =============== S U B R O U T I N E =======================================

; In: A2 = address in RAM of combatant's prowess
;     D0 = combatant index
;     D1 = item index


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
                cmpi.b  #$FF,d2
                beq.w   @Next
                cmpi.b  #EQUIPEFFECTS_MAX_INDEX,d2
                bcs.s   @ExecuteEquipEffectFunction
@InfiniteLoop:
                
                bra.s   @InfiniteLoop   ; caught in an inifinite loop if equip effect index is too high
@ExecuteEquipEffectFunction:
                
                lsl.w   #2,d2
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
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                add.b   d1,d2
                cmpi.b  #4,d2
                bcs.s   @Continue
                moveq   #3,d2           ; cap to highest double attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d2
                
                if (BUGFIX_INCREASE_DOUBLE_RESETS_COUNTER=0)
                andi.b  #PROWESS_MASK_CRITICAL,(a2) ; BUGGED chance to counter attack is being set to 1/32
                                        ; setting should be masked as well
                else
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
                endif
                
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


EquipEffect_IncreaseCounterAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFTCOUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
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
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d1
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
                or.b    d1,(a2)
                rts

    ; End of function EquipEffect_SetDoubleAttackProwess


; =============== S U B R O U T I N E =======================================


EquipEffect_SetCounterAttackProwess:
                
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
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
                movea.l (p_tbl_ItemNames).l,a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindItemName


; =============== S U B R O U T I N E =======================================

; Get pointer to item D1's definition in ROM -> A0


GetItemDefAddress:
                
                move.l  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                mulu.w  #ITEMDEF_SIZE,d1
                movea.l (p_tbl_ItemDefs).l,a0
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


GetItemAndNumberHeld:
                
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

    ; End of function GetItemAndNumberHeld


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: D2 = equipment type (0 = item, 1 = weapon, $FFFF = ring)


GetEquipmentType:
                
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

    ; End of function GetEquipmentType


; =============== S U B R O U T I N E =======================================

; Get combatant D0's equipped weapon and slot indexes -> D1 and D2 ($FFFF if nothing equipped)


GetEquippedWeapon:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d4
                bra.s   GetEquippedItemByType

    ; End of function GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; Get combatant D0's equipped ring and slot indexes -> D1 and D2 ($FFFF if nothing equipped)


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
@Loop:
                
                move.w  (a1)+,d1
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
                
                move.w  #CODE_NOTHING_WORD,d1
                move.w  d1,d2
                bra.s   @Done
@Break:
                
                move.w  -(a1),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
@Done:
                
                movem.l (sp)+,d3-d4/a0-a1
                rts

; END OF FUNCTION CHUNK FOR GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
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

; In: D0 = combatant index
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

; In: D0 = combatant index
;     D1 = item slot
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
                beq.s   @Nothing        
                bsr.s   IsItemEquippableAndCursed
                cmpi.w  #1,d2
                beq.s   @Skip           ; skip if item is not equippable
                setEquippedBit (a0)
@Skip:
                
                bra.s   @Done
@Nothing:
                
                move.w  #3,d2           ; code 3: item is "nothing"
@Done:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function EquipItemBySlot


; =============== S U B R O U T I N E =======================================

; Is item equippable, and is it cursed ?
; 
;       In: D0 = ally index
;           D1 = item index
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
                bcc.s   @NotEquippable  
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0) 
                                                        ; test cursed bit of itemdef's misc byte
                bne.s   @EquippableAndCursed
                clr.w   d2              ; code 0: equippable
                bra.s   @Equippable
@EquippableAndCursed:
                
                move.w  #2,d2           ; code 2: equippable, but cursed
@Equippable:
                
                bra.s   @Done
@NotEquippable:
                
                move.w  #1,d2           ; code 1: not equippable
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsItemEquippableAndCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item slot
; 
; Out: D2 = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, 3 if nothing


UnequipItemBySlotIfNotCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedOrCursed
                tst.w   d2
                bne.s   @Skip           ; skip if anything but equipped and not cursed
                clearEquippedBit (a0)
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================

; Is item in slot equipped, and if so, is it cursed ?
; 
;       In: D0 = ally index
;           D1 = item slot
; 
;       Out: A0 = pointer to item entry
;            D2 = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, 3 if neither


IsItemInSlotEquippedOrCursed:
                
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                lea     COMBATANT_OFFSET_ITEM_0(a0,d1.w),a0
                move.w  (a0),d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @EmptySlot      
                testEquippedBit (a0)
                beq.s   @NotEquipped    
                movem.l a0,-(sp)
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movem.l (sp)+,a0
                bne.s   @Cursed         
                clr.w   d2              ; not cursed
                bra.s   @NotCursed
@Cursed:
                
                move.w  #2,d2           ; cursed
@NotCursed:
                
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
                clearEquippedBit (a0)
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
                testEquippedBit (a0)
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
                
                move.w  ITEMENTRY_SIZE(a0),(a0) ; shift item -1 slots
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d2,loc_8E64     
loc_8E6E:
                
                move.w  #ITEM_NOTHING,(a0) ; replace item with nothing
                clr.w   d2
                rts

    ; End of function RemoveAndArrangeItems


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
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

    ; End of function UnequipRing


; START OF FUNCTION CHUNK FOR UnequipWeapon

UnequipItemByType:
                
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                move.w  (a1),d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d2,d1
                beq.s   @Next
                clearEquippedBit (a1)
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
                moveq   #1,d3
                lsl.l   d0,d3           ; place class bit in long value
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    move.l  #$FF0004,(a2)
                    move.l  #$FF0004,4(a2)
                    move.l  #$FF0004,8(a2)
                    move.l  #$1000004,$C(a2)
                else
                    move.l  #$7F0004,(a2)   ; init list with default values
                    move.l  #$7F0004,4(a2)
                    move.l  #$7F0004,8(a2)
                    move.l  #$800004,$C(a2)
                endif
                clr.w   d0
                moveq   #0,d4
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d5
@Loop:
                
                move.w  (a1)+,d1
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


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
;     D2 = item type bitmask (for ANDing the item type bitfield)
;     D3 = class equip bitmask (for ANDing the item equip bitfield)


IsItemEquippable:
                
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


GetEquipNewATTandDEF:
                
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
                bsr.w   GetNewATTandDEFwithItemEquipped
@Skip:
                
                movem.l (sp)+,d0/d4-d6/a0
                rts

    ; End of function GetEquipNewATTandDEF


; =============== S U B R O U T I N E =======================================

; In: A0 = combatant entry address
;     D1 = item index
;     D2 = item type (weapon or ring)
; 
; Out: D2 = current ATT with item equipped
;      D3 = current DEF with item equipped


GetNewATTandDEFwithItemEquipped:
                
                movem.l d0-d1/d4-a0,-(sp)
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
@FindEquippedItem_Loop:
                
                move.w  COMBATANT_OFFSET_ITEM_0(a0,d4.w),d5
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   @Next
                movem.l d0-d1/a0,-(sp)  ; it's equipped
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d0
                and.b   d2,d0
                movem.l (sp)+,d0-d1/a0
                bne.w   @GetNewATTandDEF ; is the item type we're looking for
@Next:
                
                addq.w  #ITEMENTRY_SIZE,d4
                dbf     d7,@FindEquippedItem_Loop
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                clr.w   d4
@FindFirstUnequippedItem_Loop:
                
                move.w  COMBATANT_OFFSET_ITEM_0(a0,d4.w),d5
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.w   @GetNewATTandDEF
                addq.w  #ITEMENTRY_SIZE,d4
                dbf     d7,@FindFirstUnequippedItem_Loop
                
                clr.w   d4              ; default to item 0
@GetNewATTandDEF:
                
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

    ; End of function GetNewATTandDEFwithItemEquipped


; =============== S U B R O U T I N E =======================================


OrderItems:
                
                movem.l d0-d3/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a0
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

    ; End of function OrderItems


; =============== S U B R O U T I N E =======================================

; Is item D1 cursed ? CCR carry-bit set if true


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
                bsr.w   GetEquipmentType
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

; In: D0 = combatant index


UnequipAllItemsIfNotCursed:
                
                movem.l d0-d1/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_ITEM_0(a0),a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                move.w  (a1),d1
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Next
                clearEquippedBit (a1)
@Next:
                
                addq.w  #2,a1
                dbf     d0,@Loop
                
                movem.l (sp)+,d0-d1/a0-a1
                bra.w   ApplyStatusEffectsAndItemsOnStats

    ; End of function UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================


GetItemInventoryLocation:
                
                movem.l d2-d3/d6-a0,-(sp)
                move.w  d1,d3
                bsr.w   UpdateForce     
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                subq.w  #1,d6
loc_915A:
                
                move.b  (a0)+,d0
                clr.w   d1
                bsr.w   GetItemAndNumberHeld
                tst.w   d2
                beq.s   loc_9182
                move.w  d2,d7           ; number of items
                subq.w  #1,d7
loc_916A:
                
                move.w  d7,d1
                bsr.w   GetItemAndNumberHeld
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
                jsr     GetItemAndNumberHeld(pc)
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
                movea.l (p_tbl_SpellNames).l,a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindSpellName


; =============== S U B R O U T I N E =======================================

; Find pointer to definition entry for spell D1 -> A0


FindSpellDefAddress:
                
                move.l  d0,-(sp)
                movea.l (p_tbl_SpellDefs).l,a0
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    move.w  #SPELLDEFS_COUNTER,d0
                else
                    moveq   #SPELLDEFS_COUNTER,d0
                endif
@Loop:
                
                cmp.b   (a0),d1
                beq.s   @Found
                lea     SPELLDEF_ENTRY_SIZE(a0),a0
                dbf     d0,@Loop
                
                ; Default to first entry if not found
                movea.l (p_tbl_SpellDefs).l,a0
@Found:
                
                move.l  (sp)+,d0
                rts

    ; End of function FindSpellDefAddress


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

; In: D0 = ally index
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

; Get distance between two combatants (simple X and Y calculation, no obstructions)
; 
;       In: D0 = from combatant
;           D1 = to combatant
; 
;       Out: D2 = distance


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
