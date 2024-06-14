
; ASM FILE code\common\stats\levelup.asm :
; 0x9484..0x9736 : Level Up functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index

ally = -2

LevelUp:
                
                movem.l d0-a1,-(sp)
                link    a6,#-16
                move.w  d0,ally(a6)
                bsr.w   GetClass        
                move.w  d1,d3
                
                ; Determine level cap for class
            if (STANDARD_BUILD=1)
                moveq   #CHAR_LEVELCAP_PROMOTED,d2
                bsr.w   GetClassType
                bne.s   @Promoted
                moveq   #CHAR_LEVELCAP_BASE,d2
@Promoted:      bsr.w   GetCurrentLevel 
            else
                bsr.w   GetCurrentLevel 
                moveq   #CHAR_LEVELCAP_PROMOTED,d2
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d3
                bge.s   @FindStatsBlockForClass
                moveq   #CHAR_LEVELCAP_BASE,d2
            endif
@FindStatsBlockForClass:
                
                lsl.w   #2,d0
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d0.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.w   @Exit           ; exit function if no matching block found
                cmp.b   (a0)+,d3
                beq.s   @CheckLevelCap
@FindEndOfSpellList_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+ ; loop until we come across an "end of spell list" control code
                bcs.s   @FindEndOfSpellList_Loop
                bra.s   @FindStatsBlockForClass_Loop
@CheckLevelCap:
                
                cmp.w   d2,d1
                blt.s   @CalculateStatGains
@Exit:
                
                lea     (LEVELUP_ARGUMENTS).l,a1
                move.b  #-1,(a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                move.b  #-1,(a1)
                bra.w   @Done
@CalculateStatGains:
                
                lea     (LEVELUP_ARGUMENTS).l,a1
                move.w  ally(a6),d0
                bsr.w   GetCurrentLevel 
                move.w  d1,d5
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
                bsr.w   CalculateStatGain
                move.b  d1,2(a1)
                bsr.w   IncreaseMaxMp
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseAtt
                bsr.w   CalculateStatGain
                move.b  d1,3(a1)
                bsr.w   IncreaseBaseAtt
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseDef
                bsr.w   CalculateStatGain
                move.b  d1,4(a1)
                bsr.w   IncreaseBaseDef
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                bsr.w   GetBaseAgi
                bsr.w   CalculateStatGain
                move.b  d1,5(a1)
                bsr.w   IncreaseBaseAgi
                
                ; Increase level
                addq.w  #1,d5
                move.w  d5,d1
                bsr.w   SetLevel
                move.b  d5,(a1)
                
                ; Add extra levels if promoted
            if (STANDARD_BUILD=1)
                bsr.w   GetClassType
                beq.s   @FindLearnableSpell
            else
                bsr.w   GetClass        
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; BUG -- TORT class is being wrongfully treated as promoted here
                                        ;  Should either compare to first promoted class, or change branch condition to "lower than or equal".
                blt.s   @FindLearnableSpell
            endif
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5
@FindLearnableSpell:
                
                move.b  #-1,6(a1)
@FindLearnableSpell_Loop:
                
                move.b  (a0)+,d2
                move.b  (a0)+,d1
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2
                bne.s   @CheckSpellListEnd
                
                ; Get pointer to previous stats block
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
                lea     ALLYSTATS_OFFSET_SPELL_LIST(a0),a0
                bra.s   @FindLearnableSpell_Loop
@CheckSpellListEnd:
                
                cmpi.b  #-1,d2
                beq.w   @UpdateStats
                
                cmp.b   d2,d5
                bne.s   @FindLearnableSpell_Loop
                
                bsr.w   LearnSpell      
                tst.w   d2
                bne.s   @UpdateStats
                move.b  d1,6(a1)
@UpdateStats:
                
                bsr.w   ApplyStatusEffectsAndItemsOnStats
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function LevelUp


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index
;     d1.w = starting level


InitializeAllyStats:
                
                movem.l d0-d2/a0,-(sp)
                move.w  d1,-(sp)        ; -> push starting level
                
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
                
                ; Determine effective level
                move.w  (sp)+,d4        ; D4 <- pull starting level
                move.w  d4,d5           ; D5 = effective level (takes additional levels into account if promoted for the purpose of spell learning)
            if (STANDARD_BUILD=1)
                bsr.w   GetClassType
                beq.s   @FindStatsBlockForClass
            else
                bsr.w   GetClass        
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; BUG -- TORT class is being wrongfully treated as promoted here
                                        ;  Should either compare to first promoted class, or change branch condition to "lower than or equal".
                blt.s   @FindStatsBlockForClass
            endif
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5 ; add 20 to effective level if promoted
@FindStatsBlockForClass:
            if (STANDARD_BUILD=1)
                bsr.w   GetClass
            endif
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.w   @Done           ; exit function if "for class" entry is negative (this shouldn't happen)
                cmp.b   (a0)+,d1
                beq.s   @FindLearnableSpell ; break out of loop once we found a matching stats block for starting class
@FindNextStatsBlock_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+
                bcs.s   @FindNextStatsBlock_Loop ; parse stats block bytes until we come across a spell list control code
                bra.s   @FindStatsBlockForClass_Loop
@FindLearnableSpell:
                
                lea     ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE(a0),a0
@FindLearnableSpell_Loop:
                
                move.b  (a0)+,d2        ; d2.b = level which spell is learned at
                move.b  (a0)+,d1        ; d1.b = spell entry
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2
                bne.s   @CheckSpellListEnd ; go to next step once we've got the applicable spell list address
                
                ; Get pointer to previous stats block
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
                lea     ALLYSTATS_OFFSET_SPELL_LIST(a0),a0
                bra.s   @FindLearnableSpell_Loop
@CheckSpellListEnd:
                
                cmpi.b  #-1,d2
                beq.w   @LevelUp        ; break out of loop upon reaching end of spell list
                
                cmp.b   d2,d5
                blt.s   @FindLearnableSpell_Loop
                
                ; Increase base double attack setting when learning Heal 3
                ; to give Karna extra double attack as PRST
                cmpi.b  #SPELL_HEAL|SPELL_LV3,d1
                bne.s   @LearnSpell
                bsr.w   GetBaseProwess
                move.w  d1,d2
                andi.w  #PROWESS_MASK_CRITICAL,d1
                lsr.w   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2 ; shift double and counter attack settings into lower nibble position
                addq.w  #1,d2
                cmpi.w  #8,d2
                bne.s   @Continue
                moveq   #7,d2
@Continue:
                
                lsl.w   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                or.w    d2,d1
                bsr.w   SetBaseProwess
                bra.s   @Next
@LearnSpell:
                
                bsr.w   LearnSpell      
@Next:
                
                bra.s   @FindLearnableSpell_Loop
@LevelUp:
                
                subq.w  #2,d4           ; level up loop counter = current level - 2
                blt.w   @Done
@LevelUp_Loop:
                
                bsr.w   LevelUp
                dbf     d4,@LevelUp_Loop
@Done:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function InitializeAllyStats


; =============== S U B R O U T I N E =======================================

; In: d1.w = current stat value
;     d2.w = growth curve index
;     d3.w = starting value
;     d4.w = projected value
;     d5.w = current level
; 
; Out: d1.w = stat gain value


CalculateStatGain:
                
            if (STANDARD_BUILD&LEARN_SPELL_AT_PROMOTION=1)
                tst.b   d2
                bne.s   @CheckZero      ; keep going if curve type other than None
                move.w  #0,d1           ; otherwise, stat gain value = 0
                rts
                
@CheckZero:     tst.b   d5
                bne.s   @EvaluateLevel  ; keep going if level other than zero
                move.w  #0,d1           ; otherwise, stat gain value = 0
                rts
            else
                tst.b   d2
                bne.s   @EvaluateLevel  ; keep going if curve type other than None
                move.w  #0,d1           ; otherwise, stat gain value = 0
                rts
            endif
@EvaluateLevel:
                
                movem.l d0/d2-a0,-(sp)
                movem.w d1-d5,-(sp)     ; -> push function arguments
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d5 ; If current level within projection
                blt.s   @Continue       ;  ...keep going.
                
                move.w  #256,d0         ; assume 100% of projected stats reached
                move.w  #384,d4         ; out of growth data, so assume 1.5
                bra.s   @RandomizeStatGain
@Continue:
                
                andi.w  #GROWTHCURVE_MASK_INDEX,d2
                subq.w  #1,d2
                muls.w  #GROWTHCURVE_DEF_SIZE,d2
                getPointer p_table_StatGrowthCurves, a0
                adda.w  d2,a0
                move.w  d5,d2
                subq.w  #1,d2
                lsl.w   #2,d2
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

