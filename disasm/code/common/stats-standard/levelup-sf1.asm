
; ASM FILE code\common\stats-standard\levelup-sf1.asm :
; Level Up functions reproducing the stat gain calculations from SF1 using SF2 data

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
                
                ; SF1 stat gain calculations, adapted to SF2 data formats with modified parameters.
                ; In comparison to SF1, this implementation slows the rate at which the randomization range increases
                ;  down by half, and doubles the cap to better suit SF2's higher growth values.
                ;
                ; In: d5.w = current level
                lea     (LEVELUP_ARGUMENTS).l,a1
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                clr.w   d6              ; d6.w = ally stat growth entry index
                bsr.w   GetMaxHp
                bsr.w   CalculateStatGain ; -> d1.w = stat gain value, d2.w = current stat value
                bsr.w   IncreaseMaxHp   ; -> d1.w = stat value after increase
                sub.w   d2,d1
                move.b  d1,1(a1)        ; accurately display gain value in case stat cap was reached
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                addq.w  #1,d6
                bsr.w   GetMaxMp
                bsr.s   CalculateStatGain
                bsr.w   IncreaseMaxMp
                sub.w   d2,d1
                move.b  d1,2(a1)
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                addq.w  #1,d6
                bsr.w   GetBaseAtt
                bsr.s   CalculateStatGain
                bsr.w   IncreaseBaseAtt
                sub.w   d2,d1
                move.b  d1,3(a1)
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                addq.w  #1,d6
                bsr.w   GetBaseDef
                bsr.s   CalculateStatGain
                bsr.w   IncreaseBaseDef
                sub.w   d2,d1
                move.b  d1,4(a1)
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                addq.w  #1,d6
                bsr.w   GetBaseAgi
                bsr.s   CalculateStatGain
                bsr.w   IncreaseBaseAgi
                sub.w   d2,d1
                move.b  d1,5(a1)
                
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
;     d6.w = stat index (hp, mp, att, def, agi)
; 
; Out: d1.w = stat gain value, d2.w = current stat value


CalculateStatGain:
                
            if (LEARN_SPELL_AT_PROMOTION=1)
                tst.b   d5
                beq.s   @Exit           ; exit if level = 0
            endif
                tst.b   d2
                bne.s   @CheckProjectionLevel ; keep going if curve type other than None
                
@Exit:          move.w  d1,d2
                clr.w   d1              ; otherwise, stat gain value = 0
                rts
@CheckProjectionLevel:
                
                movem.l d0/d3-a0,-(sp)
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d5
                blt.s   @Continue       ; keep going if current level is within projection
                
                move.w  d1,d2           ; set target stat to current value
                moveq   #4,d6           ; get random number in the range 0-3
                jsr     (GenerateRandomNumber).w
                bne.s   @CalculateGain
                
                addq.w  #1,d2           ; if zero add one to target (i.e., 1/4 chance of increasing target by 1)
                bra.s   @CalculateGain
                
@Continue:      ; Calculate stat d6.w increase amount given current value d1.w and level d5.w -> d2.w
                bsr.s   CalculateStatTargetValue
                
                ; Randomization range = stat target value ± (stat target value / 8), capped to SF1_LEVELUP_RNG_CAP
                moveq   #0,d6
                move.w  d2,d6
                cmpi.w  #(SF1_LEVELUP_RNG_CAP-1)*8,d6 ; (SF1_LEVELUP_RNG_CAP - 1) * 8 = stat value threshold where randomization range stops scaling
                bls.s   @Randomize
                
                moveq   #(SF1_LEVELUP_RNG_CAP-1)*8,d6 ; minus 1 because the last point is considered when making final adjustments
                
@Randomize:     add.w   d2,d2           ; multiply stat target value by 8
                add.w   d2,d2
                add.w   d2,d2
                
                addq.w  #1,d6
                jsr     (GenerateRandomNumber).w ; add a random number to target value
                add.w   d7,d2
                jsr     (GenerateRandomNumber).w ; subtract a new random number in the same range to approximate a bell curve
                sub.w   d7,d2
                swap    d2              ; clear upper word
                clr.w   d2
                swap    d2
                divu.w  #8,d2           ; divide randomized stat value by 8
                
                ; Finish with making small adjustments that mostly impact the first few levels
                ;  when stat values under 8 are still common.
                ;
                ; Generally, this also makes it even less likely to land on either ends of the bell curve.
                ;
                move.l  d2,d3
                swap    d3              ; get remainder of previous division in the lower word position
                beq.s   @CheckCurrentValue
                
                ; Add 1 point with chance = remainder / 8
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                cmp.w   d3,d7
                bhs.s   @CheckCurrentValue
                
                addq.w  #1,d2
                
@Subtract:      ; Subtract 1 point with chance = (8 - remainder) / 8
                subq.w  #8,d3
                neg.w   d3
                jsr     (GenerateRandomNumber).w
                cmp.w   d3,d7
                bhs.s   @CheckCurrentValue
                
                subq.w  #1,d2
@CheckCurrentValue:
                
                cmp.w   d1,d2           ; keep highest of current and target
                bge.s   @CalculateGain
                
                move.w  d1,d2
@CalculateGain: sub.w   d1,d2
                exg     d1,d2           ; return stat gain value -> d1.w, and current stat value -> d2.w
                movem.l (sp)+,d0/d3-a0
                rts

    ; End of function CalculateStatGain


; =============== S U B R O U T I N E =======================================

; Calculate target value for stat at level d5.w -> d2.w
;
; In: d3.w = starting value, d4.w = projected value, d5.w = current level


CalculateStatTargetValue:
                
                movem.l d1/d3-d4/a0,-(sp)
                sub.w   d3,d4           ; d4.w = growth value
                bsr.w   GetPromotedAtLevel ; -> d1.w
                beq.s   @Skip           ; skip if not promoted
                
                ; Cap promoted at level to stat gain projection level
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d1
                ble.s   @Continue
                
                moveq   #CHAR_STATGAIN_PROJECTIONLEVEL,d1
@Continue:      bsr.s   CalculateStatInitialValue ; -> d3.w = new starting value
@Skip:          move.w  d5,d1           ; d1.w = current level
                bsr.s   CalculateGrowthPortion
                add.w   d3,d2           ; add starting value to growth portion
                movem.l (sp)+,d1/d3-d4/a0
                rts

    ; End of function CalculateStatTargetValue


; =============== S U B R O U T I N E =======================================

; Calculate stat d6.w initial value for ally d0.w, factoring in promoted at level d1.w -> d3.w

CalculateStatInitialValue:
                
                movem.l d2/d4-d5/a0,-(sp)
                
                ; Get pointer to ally d0.b's first stat block -> a0
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
                
                move.w  d6,d5
                add.w   d5,d5
                add.w   d6,d5           ; stat growth entry size = 3 bytes
                addq.w  #1,d5           ; plus offset to start of growth data
                adda.l  d5,a0
                
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                move.b  (a0)+,d2        ; d2.w = stat d6.w unpromoted growth curve
                move.b  (a0)+,d3        ; d3.w = stat d6.w unpromoted starting value
                move.b  (a0),d4
                sub.w   d3,d4           ; d4.w = stat d6.w unpromoted growth value
                bsr.s   CalculateGrowthPortion
                add.w   d2,d3           ; add growth portion to unpromoted starting value
                movem.l (sp)+,d2/d4-d5/a0
                rts

    ; End of function CalculateStatInitialValue


; =============== S U B R O U T I N E =======================================

; Calculate growth portion value based on current level d1.w, growthcurve d2.w, and growth value d4.w -> d2.w


CalculateGrowthPortion:
                
                andi.w  #GROWTHCURVE_MASK_INDEX,d2
                subq.w  #1,d2
                mulu.w  #GROWTHCURVE_DEF_SIZE,d2
                getPointer p_table_StatGrowthCurves, a0
                adda.w  d2,a0
                move.w  d1,d2
                subq.w  #1,d2           ; e.g., if leveling up to 2 (still currently level 1), get first entry
                add.w   d2,d2
                add.w   d2,d2
                adda.w  d2,a0
                move.w  (a0),d2         ; d0.w = curve_param_1 for current level (portion of growth expected to have been gained by this level)
                
                ; Multiply growth value by (curve_param_1 / 256) to get portion value
                mulu.w  d4,d2
                lsr.w   #BYTE_SHIFT_COUNT,d2
                rts

    ; End of function CalculateGrowthPortion


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

