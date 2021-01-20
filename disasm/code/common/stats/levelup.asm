
; ASM FILE code\common\stats\levelup.asm :
; 0x9484..0x95C6 : Level up function

; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

ally = -2

LevelUp:
                
                movem.l d0-a1,-(sp)
                link    a6,#-16
                move.w  d0,ally(a6)
                bsr.w   GetClass        
                move.w  d1,d3
                bsr.w   GetCurrentLevel 
                
                ; Determine level cap for class
                moveq   #CHAR_LEVELCAP_PROMOTED,d2
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d3
                bge.s   @GetAllyStatsPointer
                moveq   #CHAR_LEVELCAP_BASE,d2
@GetAllyStatsPointer:
                
                lsl.w   #2,d0
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d0.w),a0
@FindStatsBlock_Loop:
                
                tst.b   (a0)
                bmi.w   @Exit           ; exit function if no matching block found
                cmp.b   (a0)+,d3
                beq.s   @CheckLevelCap
@FindEndOfSpellList_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+ ; loop until we come across an "end of spell list" control code
                bcs.s   @FindEndOfSpellList_Loop
                bra.s   @FindStatsBlock_Loop
@CheckLevelCap:
                
                cmp.w   d2,d1
                blt.s   @CalculateStatGains
@Exit:
                
                lea     (LEVELUP_ARGUMENTS).l,a1
                move.b  #$FF,(a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                clr.b   (a1)+
                move.b  #$FF,(a1)
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
                cmpi.w  #CHAR_CLASS_LASTNONPROMOTED,d1 ; BUGGED -- TORT class is being wrongfully treated as promoted here
                                        ;  Should either compare to first promoted class, or change branch condition to "lower than or equal".
                blt.s   @NotPromoted
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
                lea     ALLYSTATS_OFFSET_SPELL_LIST(a0),a0
                bra.s   @CheckUseFirstSpellList
@EvaluateSpellList:
                
                cmpi.b  #CODE_TERMINATOR_BYTE,d2
                beq.w   @UpdateStats
                cmp.b   d2,d5
                bne.s   @CheckUseFirstSpellList
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

