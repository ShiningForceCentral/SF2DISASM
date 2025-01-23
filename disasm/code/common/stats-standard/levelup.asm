
; ASM FILE code\common\stats-standard\levelup.asm :
; Level Up functions

; =============== S U B R O U T I N E =======================================

; In: d2.w = ally index, d3.b = class index
; Out: a0 = pointer, d3 = -1 if no matching 

GetAllyStatsBlockAddress:
                
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.s   @Exit           ; exit function if no matching block found
                
                cmp.b   (a0)+,d3
                beq.s   @Return
@FindNextStatsBlock_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+ ; loop until we come across an "end of spell list" control code
                bcs.s   @FindNextStatsBlock_Loop
                bra.s   @FindStatsBlockForClass_Loop
                
@Exit           moveq   #-1,d3
@Return:        rts
                
    ; End of function GetAllyStatsBlockAddress


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index

LevelUp:
                
                module
                
                ; Regular level up process : Find new learnable spell and finish with updating current stats
                pea     UpdateCombatantStats(pc)
                movem.l d0-a1,-(sp)
                moveq   #-1,d7
                bra.s   @Continue
FastLevelUp:
                
                ; Faster process meant for running in loops -- make sure to update stats afterward!
                movem.l d0-a1,-(sp)
                moveq   #0,d7           ; d7.w = learn spell toggle
@Continue:
                
                bsr.w   GetClass        
                move.w  d1,d3           ; d3.w = class
                bsr.w   GetCurrentLevel
                move.w  d1,d5           ; d5.w = current level
                
                ; Determine level cap for class type
                moveq   #CHAR_LEVELCAP_PROMOTED,d2
                bsr.w   GetClassType
                bne.s   @CheckLevelCap
                
                moveq   #CHAR_LEVELCAP_BASE,d2
@CheckLevelCap:
                
                cmp.w   d2,d5
                bhs.s   @Exit
                
                ; Get pointer to stat block for class d3.b -> a0
                move.w  d0,d2
                bsr.s   GetAllyStatsBlockAddress
                tst.w   d3
                bpl.s   @CalculateStatGains
@Exit:
                ; Exit routine if character is at the level cap
                lea     (LEVELUP_ARGUMENTS).l,a1
                st      (a1)+
                clr.b   (a1)+
                clr.l   (a1)+
                st      (a1)
                bra.w   @Done
@CalculateStatGains:
                
                ; Vanilla stat gain calculations
                ;
                ; In: d5.w = current level
                lea     (LEVELUP_ARGUMENTS).l,a1
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetMaxHp
                bsr.w   CalculateStatGain
                move.b  d1,1(a1)
                bsr.w   IncreaseMaxHp
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetMaxMp
                bsr.s   CalculateStatGain
                move.b  d1,2(a1)
                bsr.w   IncreaseMaxMp
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseAtt
                bsr.s   CalculateStatGain
                move.b  d1,3(a1)
                bsr.w   IncreaseBaseAtt
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseDef
                bsr.s   CalculateStatGain
                move.b  d1,4(a1)
                bsr.w   IncreaseBaseDef
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseAgi
                bsr.s   CalculateStatGain
                move.b  d1,5(a1)
                bsr.w   IncreaseBaseAgi
                
                ; Increase level
                addq.w  #1,d5
                move.w  d5,d1
                bsr.w   SetLevel
                move.b  d5,(a1)
                
                ; Skip learning new spell if fast level up
                tst.w   d7
                beq.s   @Done
                
                ; Find next learnable spell
                st      6(a1)
                bsr.w   CalculateEffectiveLevel
                move.w  d1,d5
                bsr.w   FindNextLearnableSpell  
                tst.w   d2
                bne.s   @Done
                move.b  d1,6(a1)
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function LevelUp

                modend

; =============== S U B R O U T I N E =======================================

; In: d1.w = current stat value
;     d2.w = growth curve index
;     d3.w = starting value
;     d4.w = projected value
;     d5.w = current level
; 
; Out: d1.w = stat gain value


CalculateStatGain:
                
            if (LEARN_SPELL_AT_PROMOTION=1)
                tst.b   d5
                beq.s   @Exit           ; exit if level = 0
            endif
                tst.b   d2
                bne.s   @CheckProjectionLevel ; keep going if curve type other than None
                
@Exit:          clr.w   d1              ; otherwise, stat gain value = 0
                rts
                
@CheckProjectionLevel:
                
                movem.l d0/d2-a0,-(sp)
                movem.w d1-d5,-(sp)     ; -> push function arguments
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d5 ; If current level within projection
                blt.s   @CalculateGrowthPortion ;  ...keep going.
                
                move.w  #256,d0         ; assume 100% of projected stats reached
                move.w  #384,d4         ; out of growth data, so assume 1.5
                bra.s   @RandomizeStatGain
@CalculateGrowthPortion:
                
                andi.w  #GROWTHCURVE_MASK_INDEX,d2
                subq.w  #1,d2
                mulu.w  #GROWTHCURVE_DEF_SIZE,d2
                getPointer p_table_StatGrowthCurves, a0
                adda.w  d2,a0
                move.w  d5,d2
                subq.w  #1,d2           ; e.g., if leveling up to 2 (still currently level 1), get first entry
                add.w   d2,d2
                add.w   d2,d2
                adda.w  d2,a0
                move.w  (a0)+,d0        ; D0 = curve_param_1 for current level
                move.w  (a0)+,d7        ; D7 = curve_param_2 for current level
                sub.w   d3,d4           ; D4 = projected growth (diff between initial and final)
                mulu.w  d7,d4           ; get portion of growth for current level
@RandomizeStatGain:
                
                move.w  #128,d6         ; do 2 randoms instead of 1 to approx. bell curve
                jsr     (GenerateRandomNumber).w
                add.w   d7,d4           ; add 0 to 0.5 to random value
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d4           ; subtract 0 to 0.5 from random value
                addi.w  #128,d4         ; add 0.5 so the random gain rounds properly when LSRing
                lsr.w   #BYTE_SHIFT_COUNT,d4
                move.w  d4,d6           ; D6 = randomized stat gain
                movem.w (sp)+,d1-d5     ; D1-D5 <- pull function arguments
                sub.w   d3,d4           ; D4 = projected growth (diff between initial and final)
                mulu.w  d4,d0           ; get expected current stat based on growth/level (last byte is decimals)
                addi.w  #128,d0         ; add 0.5 so the expected stat rounds properly when LSRing
                lsr.w   #BYTE_SHIFT_COUNT,d0
                add.w   d3,d0           ; D0 = expected minimum stat for current level
                add.w   d6,d1           ; add randomized stat gain to ACTUAL current stat
                cmp.w   d0,d1           ; If new value greater than or equal to expected minimum
                bge.s   @Done           ;  ...we're done.
                
                addq.w  #1,d6           ;  Otherwise, lovingly apply "loser pity bonus."
@Done:
                
                move.w  d6,d1           ; return stat gain value -> D1
                movem.l (sp)+,d0/d2-a0
                rts

    ; End of function CalculateStatGain


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index
;     d1.w = starting level


InitializeAllyStats:
                
                ; Finish with updating current stats
                pea     UpdateCombatantStats(pc)
                
                movem.l d0-d2/a0,-(sp)
                move.w  d1,d4           ; d4.w = copy of starting level
                
                ; Get ally stats entry address -> A0
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
                
                ; Set starting values
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_STARTING_HP,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxHp
                bsr.w   SetCurrentHp
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxMp
                bsr.w   SetCurrentMp
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseAtt
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseDef
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseAgi
                moveq   #1,d1
                bsr.w   SetLevel
                bsr.s   IncreaseAllyBaseDouble
                subq.w  #2,d4           ; level up loop counter = current level - 2
                blt.s   @Done
@LevelUp_Loop:
                
                bsr.w   FastLevelUp
                dbf     d4,@LevelUp_Loop
@Done:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function InitializeAllyStats


; =============== S U B R O U T I N E =======================================

; Permanently increase base double attack prowess of an ally by 1.
;
; In: d0.w = ally index

IncreaseAllyBaseDouble:
                
                move.l  a0,-(sp)
                lea     table_AlliesWithBetterDouble(pc), a0
                move.w  d0,d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                bsr.w   GetBaseProwess
                move.w  d1,d2
                lsr.w   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2 ; shift double and counter attack settings into lower nibble position
                andi.w  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                addq.w  #1,d2
                bmi.s   @Zero           ; clamp to zero on negative
                
                cmpi.w  #4,d2
                bne.s   @Continue
                
                moveq   #3,d2
                bra.s   @Continue
@Zero:          
                
                moveq   #0,d2
@Continue:
                
                lsl.w   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.w  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,d1
                or.w    d2,d1
                bsr.w   SetBaseProwess
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IncreaseAllyBaseDouble

