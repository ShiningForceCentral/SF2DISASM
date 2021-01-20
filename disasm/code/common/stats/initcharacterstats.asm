
; ASM FILE code\common\stats\initcharacterstats.asm :
; 0x95C6..0x96BA : Init character stats function

; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = starting level


InitAllyStats:
                
                movem.l d0-d2/a0,-(sp)
                move.w  d1,-(sp)        ; -> push starting level
                
                ; Get ally stats entry address -> A0
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
                
                ; Set starting values
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_STARTING_HP,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxHP
                bsr.w   SetCurrentHP
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetMaxMP
                bsr.w   SetCurrentMP
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseATT
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseDEF
                clr.w   d1
                addq.l  #ALLYSTATS_OFFSET_NEXT_STAT,a0
                move.b  (a0)+,d1
                bsr.w   SetBaseAGI
                moveq   #1,d1
                bsr.w   SetLevel
                
                ; Determine effective level
                move.w  (sp)+,d4        ; D4 <- pull starting level
                move.w  d4,d5           ; D5 = effective level (takes additional levels into account if promoted for the purpose of spell learning)
                bsr.w   GetClass        
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; BUGGED -- TORT class is being wrongfully treated as promoted here
                                        ;  Should either compare to first promoted class, or change branch condition to "lower than or equal".
                blt.s   @GetAllyStatsEntryAddress
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5 ; add 20 to effective level if promoted
@GetAllyStatsEntryAddress:
                
                move.w  d0,d2
                lsl.w   #2,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.w   @Done           ; exit function if "for class" entry is negative (this shouldn't happen)
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
                
                lsl.w   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d2
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

    ; End of function InitAllyStats

