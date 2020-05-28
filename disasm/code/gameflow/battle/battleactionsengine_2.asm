
; ASM FILE code\gameflow\battle\battleactionsengine_2.asm :
; 0xACEA..0xBCF0 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: D6 = damage

WriteSkirmishScript_InflictDamage:
                
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #ENEMYIDX_TAROS,d1
                bne.s   loc_AD1C
                tst.b   -BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                beq.s   loc_AD1C
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_INEFFECTIVEATTACK,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   return_AE30
loc_AD1C:
                
                cmpi.w  #2,((RAM_BattleScene_AttackNumber-$1000000)).w
                bne.s   loc_AD26
                lsr.w   #1,d6
loc_AD26:
                
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #ENEMYIDX_BURST_ROCK,d1
                bne.s   loc_AD3E
                tst.w   d6
                bne.s   loc_AD3A
                moveq   #1,d6
loc_AD3A:
                
                bra.w   loc_AD58
loc_AD3E:
                
                move.w  d6,d1
                lsr.w   #3,d1
                addq.w  #1,d1
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6
                bgt.s   loc_AD58
                moveq   #1,d6
loc_AD58:
                
                jsr     CalculateDamageEXP
                tst.b   -BCSTACK_OFFSET_CUTOFF(a2)
                beq.s   loc_AD74
                move.w  #$18,d4
                move.w  #$FFFF,d5
                bsr.w   WriteSkirmishScript_AnimateSprite
                move.w  #$8000,d6
loc_AD74:
                
                move.b  (a5),d0
                move.w  d6,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_AD92
                move.b  #$FF,-BCSTACK_OFFSET_TARGETDIES(a2)
                bsr.w   GiveEXPandGoldForKill
loc_AD92:
                
                move.b  (a5),d0
                move.w  d6,d2
                neg.w   d2
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_ADBA
                jsr     GetEnemyID
                cmpi.b  #ENEMYIDX_BURST_ROCK,d1
                bne.s   loc_ADBA
                tst.w   d7
                bne.s   loc_ADBA
                move.b  #$FF,-BCSTACK_OFFSET_EXPLODE(a2)
                move.b  d0,-BCSTACK_OFFSET_EXPLODECHAR(a2)
                moveq   #0,d2
loc_ADBA:
                
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_ADD8
                move.w  #$B,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_ADE8
loc_ADD8:
                
                move.w  #$A,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_ADE8:
                
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.s   loc_AE00
                tst.b   -BCSTACK_OFFSET_CRIT(a2)
                beq.s   loc_ADFA
                move.w  #TEXTIDX_BATTLE_CRITDAMAGE,d1
                bra.s   loc_ADFE
loc_ADFA:
                
                move.w  #TEXTIDX_BATTLE_DAMAGE_ALLY,d1
loc_ADFE:
                
                bra.s   loc_AE10
loc_AE00:
                
                tst.b   -BCSTACK_OFFSET_CRIT(a2)
                beq.s   loc_AE0C
                move.w  #TEXTIDX_BATTLE_HEAVYDAMAGE,d1
                bra.s   loc_AE10
loc_AE0C:
                
                move.w  #TEXTIDX_BATTLE_DAMAGE_ENEMY,d1
loc_AE10:
                
                tst.b   -BCSTACK_OFFSET_CUTOFF(a2)
                beq.s   loc_AE1A
                move.w  #TEXTIDX_BATTLE_CUTOFF,d1
loc_AE1A:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
return_AE30:
                
                rts

    ; End of function WriteSkirmishScript_InflictDamage


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictAilment:
                
                tst.b   -2(a2)
                beq.w   return_AE88
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #$F,d1
                move.w  d1,d2
                subi.w  #9,d2
                move.b  (a5),d0
                jsr     GetStatus
                lsl.w   #2,d2
                movea.l SkirmishAilmentFuncTable(pc,d2.w),a1
                jsr     (a1)
                btst    #7,d0
                bne.s   loc_AE76
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_AE70:
                
                move.w  #0,(a6)+
                bra.s   return_AE88
loc_AE76:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
return_AE88:
                
                rts

    ; End of function WriteSkirmishScript_InflictAilment

SkirmishAilmentFuncTable:
                dc.l WriteSkirmishScript_InflictPoison
                dc.l WriteSkirmishScript_InflictSleep
                dc.l WriteSkirmishScript_InflictStun
                dc.l WriteSkirmishScript_InflictMuddle
                dc.l WriteSkirmishScript_InflictSlow
                dc.l WriteSkirmishScript_DrainMP
                dc.l WriteSkirmishScript_InflictSilence

; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictPoison:
                
                move.w  #$11,(a6)+
                move.w  #$153,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #2,d1
                rts

    ; End of function WriteSkirmishScript_InflictPoison


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSleep:
                
                move.w  #$11,(a6)+
                move.w  #$152,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #$C0,d1 
                rts

    ; End of function WriteSkirmishScript_InflictSleep


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictStun:
                
                move.w  #$11,(a6)+
                move.w  #$15B,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #1,d1
                rts

    ; End of function WriteSkirmishScript_InflictStun


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictMuddle:
                
                move.w  #$11,(a6)+
                move.w  #$15A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
loc_AF08:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #8,d1
                ori.w   #$30,d1 
                rts

    ; End of function WriteSkirmishScript_InflictMuddle


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSlow:
                
                movem.l d0-d1,-(sp)
                bsr.w   WriteSkirmishScript_SlowMessage
                movem.l (sp)+,d0-d1
                ori.w   #$C00,d1
                rts

    ; End of function WriteSkirmishScript_InflictSlow


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_DrainMP:
                
                movem.l d0-d1,-(sp)
                jsr     GetCurrentMP
                tst.w   d1
                beq.s   loc_AF3E
                bsr.w   sub_B5D6
loc_AF3E:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function WriteSkirmishScript_DrainMP


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSilence:
                
                move.w  d1,d3
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                beq.s   loc_AF6C
                move.w  #$11,(a6)+
                move.w  #$14F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #$300,d3
loc_AF6C:
                
                move.w  d3,d1
                rts

    ; End of function WriteSkirmishScript_InflictSilence


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictCurseDamage:
                
                move.b  (a4),d0
                btst    #7,d0
                bne.w   return_B00C
                jsr     GetStatus
                btst    #2,d1
                beq.w   return_B00C
                moveq   #2,d0
loc_AF8A:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   return_B00C
                exg     a4,a5
                bsr.w   WriteSkirmishScript_SwitchTargets
                exg     a4,a5
                bsr.w   WriteSkirmishScript_IdleSprite
                move.b  (a4),d0
                move.w  d6,d3
                lsr.w   #3,d3
                addq.w  #1,d3
                move.w  d3,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_AFC0
loc_AFBA:
                
                move.b  #$FF,-4(a2)
loc_AFC0:
                
                move.w  d3,d2
                neg.w   d2
                move.b  (a4),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_AFE4
                move.w  #$B,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_AFF4
loc_AFE4:
                
                move.w  #$A,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_AFF4:
                
                move.w  #$12,(a6)+
                move.w  #$10,(a6)+
                move.w  #$168,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d3,(a6)+
return_B00C:
                
                rts

    ; End of function WriteSkirmishScript_InflictCurseDamage


; =============== S U B R O U T I N E =======================================

DetermineDoubleAndCounter:
                
                move.b  (a4),d0
loc_B010:
                
                jsr     GetCurrentProwess
                lsr.b   #4,d1
                moveq   #$20,d0 
                andi.w  #3,d1
                beq.w   loc_B038
                moveq   #$10,d0
                cmpi.b  #1,d1
                beq.w   loc_B038
                moveq   #8,d0
                cmpi.b  #2,d1
                beq.w   loc_B038
                moveq   #4,d0
loc_B038:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_B046
                move.b  #$FF,-BCSTACK_OFFSET_DOUBLE(a2)
loc_B046:
                
                move.b  (a5),d0
                jsr     GetCurrentProwess
                lsr.b   #6,d1
                moveq   #$20,d0 
                andi.w  #3,d1
                beq.w   loc_B070
                moveq   #$10,d0
                cmpi.b  #1,d1
                beq.w   loc_B070
                moveq   #8,d0
                cmpi.b  #2,d1
                beq.w   loc_B070
                moveq   #4,d0
loc_B070:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   return_B07E
                move.b  #$FF,-BCSTACK_OFFSET_COUNTER(a2)
return_B07E:
                
                rts

    ; End of function DetermineDoubleAndCounter


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_DeathMessage:
                
                move.b  (a5),d0
                btst    #7,d0
                bne.s   loc_B08E
                move.w  #$123,d1
                bra.s   loc_B092
loc_B08E:
                
                move.w  #$122,d1
loc_B092:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

    ; End of function WriteSkirmishScript_DeathMessage


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

WriteSkirmishScript_UseSpell:
                
                move.b  (a5),d0
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                bsr.w   GetResistanceToSpell
                add.w   d1,d1
                move.w  rjt_ItemUsedEffects(pc,d1.w),d1
                jmp     rjt_ItemUsedEffects(pc,d1.w)

    ; End of function WriteSkirmishScript_UseSpell

rjt_ItemUsedEffects:
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_B194-rjt_ItemUsedEffects
                dc.w sub_B27C-rjt_ItemUsedEffects
                dc.w sub_B30E-rjt_ItemUsedEffects
                dc.w sub_B3A8-rjt_ItemUsedEffects
                dc.w sub_B41A-rjt_ItemUsedEffects
                dc.w spell07_Muddle-rjt_ItemUsedEffects
                dc.w sub_B516-rjt_ItemUsedEffects
                dc.w sub_B57E-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAFA-rjt_ItemUsedEffects
                dc.w sub_B5D6-rjt_ItemUsedEffects
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_BAD6-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BB00-rjt_ItemUsedEffects
                dc.w sub_B680-rjt_ItemUsedEffects
                dc.w sub_B6E6-rjt_ItemUsedEffects
                dc.w sub_B74C-rjt_ItemUsedEffects
                dc.w sub_B7B2-rjt_ItemUsedEffects
                dc.w sub_B826-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAFA-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE8-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_B194-rjt_ItemUsedEffects
                dc.w sub_BA1C-rjt_ItemUsedEffects
                dc.w sub_B886-rjt_ItemUsedEffects
                dc.w sub_B8F8-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAEE-rjt_ItemUsedEffects
                dc.w sub_BAD6-rjt_ItemUsedEffects
                dc.w sub_BA1C-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects

; =============== S U B R O U T I N E =======================================

sub_B114:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                move.w  d1,d2
                jsr     GetCurrentHP
                sub.w   d1,d2
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                cmpi.b  #$FF,d6
                bne.s   loc_B140
                move.w  d2,d6
                bra.s   loc_B144
loc_B140:
                
                bsr.w   GetSpellPowerAdjustedForClass
loc_B144:
                
                cmp.w   d6,d2
                bcc.s   loc_B14A
                move.w  d2,d6
loc_B14A:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B16A
                move.w  #$B,(a6)+
                move.w  d6,(a6)+
                dc.b $3C 
                dc.b $FC 
                dc.l loc_3CBE+3
                dc.b $3C 
                dc.b $FC 
                dc.b   0
                dc.b   2
                dc.b $60 
                dc.b $10
loc_B16A:
                
                move.w  #$A,(a6)+
                move.w  d6,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                move.w  #$10,(a6)+
                move.w  #$12A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                bsr.w   sub_A872
                rts

    ; End of function sub_B114


; =============== S U B R O U T I N E =======================================

sub_B194:
                
                move.b  (a5),d0
                jsr     GetStatus
                clr.b   d2
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                cmpi.w  #0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B1CA
                cmpi.w  #1,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B1C0
                bclr    #2,d1
                beq.s   loc_B1C0
                ori.b   #4,d2
loc_B1C0:
                
                bclr    #0,d1
                beq.s   loc_B1CA
                ori.b   #2,d2
loc_B1CA:
                
                bclr    #1,d1
                beq.s   loc_B1D4
                ori.b   #1,d2
loc_B1D4:
                
                tst.b   d2
loc_B1D6:
                
                beq.w   loc_B266
                btst    #7,d0
                bne.s   loc_B1F4
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B206
loc_B1F4:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B206:
                
                bsr.w   GiveMagicDrainEXP
                btst    #0,d2
                beq.s   loc_B226
                move.w  #$10,(a6)+
                move.w  #$12D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
loc_B226:
                
                btst    #1,d2
                beq.s   loc_B242
                move.w  #$10,(a6)+
                move.w  #$12E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
loc_B242:
                
                btst    #2,d2
                beq.s   loc_B264
                move.w  #$10,(a6)+
                move.w  #$12F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                jsr     UnequipAllItemsIfNotCursed
loc_B264:
                
                bra.s   loc_B26C
loc_B266:
                
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B26C:
                
                move.b  (a5),d0
                jsr     SetStatus
                jsr     ApplyStatusAndItemsOnStats
                rts

    ; End of function sub_B194


; =============== S U B R O U T I N E =======================================

sub_B27C:
                
                move.b  (a5),d0
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$3000,d1
                jsr     SetStatus
                andi.w  #$3000,d3
                beq.s   loc_B29C
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B29C:
                
                btst    #7,d0
                bne.s   loc_B2B6
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B2C8
loc_B2B6:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B2C8:
                
                bsr.w   GiveMagicDrainEXP
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$14C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$155,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

    ; End of function sub_B27C


; =============== S U B R O U T I N E =======================================

sub_B30E:
                
                tst.w   d2
                beq.s   loc_B314
                addq.w  #5,d2
loc_B314:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$C00,d1
                jsr     SetStatus
                andi.w  #$C00,d3
                beq.s   loc_B336
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B336:
                
                btst    #7,d0
                bne.s   loc_B350
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B362
loc_B350:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B362:
                
                bsr.w   GiveMagicDrainEXP

    ; End of function sub_B30E


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_SlowMessage:
                
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$14D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$156,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

    ; End of function WriteSkirmishScript_SlowMessage


; =============== S U B R O U T I N E =======================================

sub_B3A8:
                
                move.b  (a5),d0
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$C000,d1
                jsr     SetStatus
                andi.w  #$C000,d3
                beq.s   loc_B3C8
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B3C8:
                
                btst    #7,d0
                bne.s   loc_B3E2
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B3F4
loc_B3E2:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B3F4:
                
                bsr.w   GiveMagicDrainEXP
                jsr     GetBaseATK
                mulu.w  #3,d1
                lsr.l   #3,d1
loc_B404:
                
                move.w  #$10,(a6)+
                move.w  #$14E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

    ; End of function sub_B3A8


; =============== S U B R O U T I N E =======================================

sub_B41A:
                
                move.w  d2,d3
                move.b  (a5),d0
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                bne.s   loc_B42E
                moveq   #8,d3
                bra.s   loc_B430
loc_B42E:
                
                addq.w  #5,d3
loc_B430:
                
                move.w  d3,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #$300,d1
                btst    #7,d0
                bne.s   loc_B45A
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B46C
loc_B45A:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B46C:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  #$14F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

    ; End of function sub_B41A


; =============== S U B R O U T I N E =======================================

; muddle

spell07_Muddle:
                
                move.b  (a5),d0
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B4AE        
                addq.w  #5,d2           ; muddle 2, 25% chance
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #COM_STATUS_MASK_MUDDLE2,d1
                ori.w   #COM_STATUS_MASK_MUDDLE,d1
                move.w  #$151,d2
                bra.w   loc_B4D0
loc_B4AE:
                
                moveq   #8,d2           ; muddle 1
                jsr     GetStatus
                andi.w  #COM_STATUS_MASK_MUDDLE2,d1
                bne.s   loc_B4BE        ; if target already affected by Muddle 2, then no chance for Muddle 1 to work.
                moveq   #5,d2           ; 25% chance
loc_B4BE:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #COM_STATUS_MASK_MUDDLE,d1
                move.w  #$151,d2
loc_B4D0:
                
                btst    #7,d0
                bne.s   loc_B4EA
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B4FC
loc_B4EA:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B4FC:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  d2,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

    ; End of function spell07_Muddle


; =============== S U B R O U T I N E =======================================

sub_B516:
                
                addq.w  #5,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B53C
                move.w  #$B,(a6)+
                move.w  #$8000,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B54E
loc_B53C:
                
                move.w  #$A,(a6)+
                move.w  #$8000,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B54E:
                
                bsr.w   GiveEXPandGoldForKill
                btst    #7,d0
                bne.s   loc_B55E
                move.w  #$130,d2
                bra.s   loc_B562
loc_B55E:
                
                move.w  #$131,d2
loc_B562:
                
                move.w  #$10,(a6)+
                move.w  d2,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  #$FF,-4(a2)
                rts

    ; End of function sub_B516


; =============== S U B R O U T I N E =======================================

sub_B57E:
                
                addq.w  #5,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #$C0,d1 
                btst    #7,d0
                bne.s   loc_B5A8
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B5BA
loc_B5A8:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B5BA:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  #$152,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

    ; End of function sub_B57E


; =============== S U B R O U T I N E =======================================

sub_B5D6:
                
                move.b  (a5),d0
                jsr     GetCurrentMP
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #3,d0
                cmp.b   d0,d1
                bcc.s   loc_B5EC
                move.w  d1,d0
loc_B5EC:
                
                move.w  d0,d2
                move.w  d0,d3
                neg.w   d3
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B612
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B622
loc_B612:
                
                move.w  #$A,(a6)+
loc_B616:
                
                move.w  #0,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B622:
                
                move.b  (a4),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B642
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B652
loc_B642:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B652:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$12,(a6)+
                btst    #7,d0
                bne.s   loc_B666
                move.w  #$13D,d1
                bra.s   loc_B66C
loc_B666:
                
                move.b  (a5),d0
                move.w  #$13A,d1
loc_B66C:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                rts

    ; End of function sub_B5D6


; =============== S U B R O U T I N E =======================================

sub_B680:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B6A2
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B6B4
loc_B6A2:
                
                move.w  #$A,(a6)+
loc_B6A6:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B6B4:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$96,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseATK
                jsr     ApplyStatusAndItemsOnStats
                rts

    ; End of function sub_B680


; =============== S U B R O U T I N E =======================================

sub_B6E6:
                
                move.b  (a5),d0
loc_B6E8:
                
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B708
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B71A
loc_B708:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B71A:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$97,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseDEF
                jsr     ApplyStatusAndItemsOnStats
                rts

    ; End of function sub_B6E6


; =============== S U B R O U T I N E =======================================

sub_B74C:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B76E
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B780
loc_B76E:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B780:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$98,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseAGI
                jsr     ApplyStatusAndItemsOnStats
                rts

    ; End of function sub_B74C


; =============== S U B R O U T I N E =======================================

sub_B7B2:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B7D4
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B7E6
loc_B7D4:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B7E6:
                
                jsr     GetBaseMOV
                clr.w   d2
                cmpi.b  #9,d1
                beq.w   loc_B802
                moveq   #1,d2
                cmpi.b  #8,d1
                beq.w   loc_B802
                moveq   #2,d2
loc_B802:
                
                move.w  #$10,(a6)+
                move.w  #$99,(a6)+ 
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d2,d1
                jsr     IncreaseBaseMOV
                jsr     ApplyStatusAndItemsOnStats
                rts

    ; End of function sub_B7B2


; =============== S U B R O U T I N E =======================================

sub_B826:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B848
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B85A
loc_B848:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B85A:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$9A,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxHP
                rts

    ; End of function sub_B826


; =============== S U B R O U T I N E =======================================

sub_B886:
                
                move.b  (a5),d0
loc_B888:
                
                jsr     GetMaxMP
                tst.w   d1
                bne.s   loc_B898
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B898:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B8BA
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B8CC
loc_B8BA:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B8CC:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$9B,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxMP
                rts

    ; End of function sub_B886


; =============== S U B R O U T I N E =======================================

sub_B8F8:
                
                move.b  (a5),d0
                moveq   #0,d1
                jsr     SetCurrentEXP
                jsr     LevelUp
                lea     ((byte_FFAF82-$1000000)).w,a1
                cmpi.b  #$FF,(a1)
                bne.s   loc_B918
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B918:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B93A
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B94C
loc_B93A:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B94C:
                
                clr.l   d1
                move.b  (a1)+,d1
                move.w  #$10,(a6)+
                move.w  #$F4,(a6)+ 
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.b  (a1)+,d1
                beq.s   loc_B97C
                move.w  #$10,(a6)+
                move.w  #$10A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B97C:
                
                move.b  (a1)+,d1
                beq.s   loc_B994
                move.w  #$10,(a6)+
                move.w  #$10B,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B994:
                
                move.b  (a1)+,d1
                beq.s   loc_B9AC
                move.w  #$10,(a6)+
                move.w  #$10C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9AC:
                
                move.b  (a1)+,d1
                beq.s   loc_B9C4
                move.w  #$10,(a6)+
                move.w  #$10D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9C4:
                
                move.b  (a1)+,d1
                beq.s   loc_B9DC
                move.w  #$10,(a6)+
                move.w  #$10E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9DC:
                
                move.b  (a1)+,d1
                cmpi.b  #$FF,d1
                beq.s   return_BA1A
                move.w  d1,d2
                andi.w  #$3F,d2 
                lsr.w   #6,d1
                bne.s   loc_BA04
                move.w  #$10,(a6)+
                move.w  #$10F,(a6)+
                move.w  d0,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.s   return_BA1A
loc_BA04:
                
                addq.w  #1,d1
                move.w  #$10,(a6)+
                move.w  #$110,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
return_BA1A:
                
                rts

    ; End of function sub_B8F8


; =============== S U B R O U T I N E =======================================

sub_BA1C:
                
                move.b  (a5),d0
                jsr     GetMaxMP
                move.w  d1,d2
                jsr     GetCurrentMP
                sub.w   d1,d2
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  7(a0),d6
                cmpi.b  #$FF,d6
                bne.s   loc_BA46
                move.w  d2,d6
loc_BA46:
                
                cmp.w   d6,d2
                bcc.s   loc_BA4C
                move.w  d2,d6
loc_BA4C:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_BA6C
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_BA7C
loc_BA6C:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_BA7C:
                
                move.w  #$10,(a6)+
                move.w  #$12C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                bsr.w   sub_A872
                rts

    ; End of function sub_BA1C


; =============== S U B R O U T I N E =======================================

NoItemEffect:
                
                rts

    ; End of function NoItemEffect


; =============== S U B R O U T I N E =======================================

ApplyRandomEffectiveness:
                
                move.l  d0,-(sp)
                tst.b   -$17(a2)
                beq.s   loc_BAA2
                moveq   #8,d2
loc_BAA2:
                
                moveq   #8,d0
                jsr     (GetRandomOrDebugValue).w
                cmp.w   d2,d0
                bcc.s   loc_BAD2
                move.w  #$10,(a6)+
                move.w  #$127,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  #$FF,-5(a2)
                move.l  (sp)+,d0
                move.l  (sp)+,d0
                rts
loc_BAD2:
                
                move.l  (sp)+,d0
                rts

    ; End of function ApplyRandomEffectiveness


; =============== S U B R O U T I N E =======================================

sub_BAD6:
                
                moveq   #$10,d3
                bra.w   loc_BB02

    ; End of function sub_BAD6


; =============== S U B R O U T I N E =======================================

sub_BADC:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

    ; End of function sub_BADC


; =============== S U B R O U T I N E =======================================

sub_BAE2:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

    ; End of function sub_BAE2


; =============== S U B R O U T I N E =======================================

sub_BAE8:
                
                moveq   #$10,d3
                bra.w   loc_BB02

    ; End of function sub_BAE8


; =============== S U B R O U T I N E =======================================

sub_BAEE:
                
                moveq   #8,d3
                bra.w   loc_BB02

    ; End of function sub_BAEE


; =============== S U B R O U T I N E =======================================

sub_BAF4:
                
                moveq   #8,d3
                bra.w   loc_BB02

    ; End of function sub_BAF4


; =============== S U B R O U T I N E =======================================

sub_BAFA:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

    ; End of function sub_BAFA


; =============== S U B R O U T I N E =======================================

sub_BB00:
                
                moveq   #0,d3

    ; End of function sub_BB00


; START OF FUNCTION CHUNK FOR sub_BAD6

loc_BB02:
                
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  7(a0),d6
                bsr.w   GetSpellPowerAdjustedForClass
                move.w  d6,d1
                lsr.w   #2,d1
                cmpi.b  #1,d2
                bne.s   loc_BB22
                sub.w   d1,d6
loc_BB22:
                
                cmpi.b  #2,d2
                bne.s   loc_BB2A
                lsr.w   #1,d6
loc_BB2A:
                
                cmpi.b  #3,d2
                bne.s   loc_BB32
                add.w   d1,d6
loc_BB32:
                
                move.w  d3,d0
                beq.s   loc_BB46
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_BB46
                add.w   d1,d6
                move.b  #$FF,-3(a2)
loc_BB46:
                
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -4(a2)
                beq.s   return_BB54
                bsr.w   WriteSkirmishScript_DeathMessage
return_BB54:
                
                rts

; END OF FUNCTION CHUNK FOR sub_BAD6


; =============== S U B R O U T I N E =======================================

;     Miscellaneous hacks to alter spell damage. (125% if promoted, damage divided if SORC spells)
;     In: D6 = original damage
;     Out: D6 = altered damage

GetSpellPowerAdjustedForClass:
                
                movem.l d0-d1/a0,-(sp)
                cmpi.w  #1,(a3)
                bne.w   loc_BB78
                move.b  (a4),d0
                jsr     GetClass
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d1
                bcs.w   loc_BB78
                mulu.w  #5,d6
                lsr.w   #2,d6
loc_BB78:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                cmpi.w  #SPELL_DAO,d1   ; HARDCODED spell indexes
                beq.w   loc_BBA0
                cmpi.w  #SPELL_APOLLO,d1
                beq.w   loc_BBA0
                cmpi.w  #SPELL_NEPTUN,d1
                beq.w   loc_BBA0
                cmpi.w  #SPELL_ATLAS,d1
                beq.w   loc_BBA0
                bra.w   loc_BBB2
loc_BBA0:
                
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d0
                beq.w   loc_BBB2
                andi.w  #$FFFF,d6
                divu.w  d0,d6
                andi.w  #$FFFF,d6
loc_BBB2:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function GetSpellPowerAdjustedForClass


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_UseItem:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_SPELL(a0),d0
                move.w  d0,2(a3)
                andi.w  #SPELL_MASK_IDX,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.b  ITEMDEF_OFFSET_SPELL(a0),d0
                lsr.b   #SPELL_OFFSET_LV,d0
                andi.w  #SPELL_UPPERMASK_LV,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                bra.w   WriteSkirmishScript_UseSpell

    ; End of function WriteSkirmishScript_UseItem


; =============== S U B R O U T I N E =======================================

nullsub_BBE4:
                
                rts

    ; End of function nullsub_BBE4


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_BreakUsedItem:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #ACTION_ITEM,(a3)
                bne.w   loc_BC94
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetItemType     
                tst.w   d2
                beq.w   loc_BC88
                jsr     GetItemDefAddress
                btst    #ITEMTYPE_BIT_MAGICAL,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_BC94
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_BC94
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                btst    #ITEM_BIT_BROKEN,d0
                bne.w   loc_BC5C
                moveq   #4,d0
                jsr     (GetRandomOrDebugValue).w
                tst.b   d0
                bne.s   loc_BC58
                moveq   #0,d0
                jsr     GetItemBreakMessage(pc)
                nop
                move.w  #$10,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     BreakItem       
loc_BC58:
                
                bra.w   loc_BC94
loc_BC5C:
                
                moveq   #1,d0
                jsr     GetItemBreakMessage(pc)
                nop
                move.w  #$10,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
                bra.w   loc_BC94
loc_BC88:
                
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
loc_BC94:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteSkirmishScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: A2 = skirmish properties stack
;     D0 = whether item is already damaged (0=no, 1=yes)
; Out: D3 = message idx

GetItemBreakMessage:
                
                movem.l d0/a0,-(sp)
                tst.b   d0
                bne.s   loc_BCB4
                tst.b   -5(a2)
                bne.s   loc_BCAE        
loc_BCA8:
                
                move.w  #$174,d3        ; But smoke rose from{N}the {ITEM}.{D1}
                bra.s   loc_BCB2
loc_BCAE:
                
                move.w  #$17E,d3        ; And smoke emerged from{N}the {ITEM}.{D1}
loc_BCB2:
                
                bra.s   loc_BCC4
loc_BCB4:
                
                tst.b   -5(a2)
                bne.s   loc_BCC0        
                move.w  #$179,d3        ; But, the {ITEM}{N}burst into flames.
                bra.s   loc_BCC4
loc_BCC0:
                
                move.w  #$183,d3        ; And the {ITEM}{N}burst into flames.
loc_BCC4:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                andi.w  #ITEM_MASK_IDX,d0
                lea     ItemBreakMessages(pc), a0
loc_BCD0:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.w   loc_BCEA
                cmp.b   (a0),d0
                beq.w   loc_BCE2
                addq.l  #2,a0
                bra.s   loc_BCD0
loc_BCE2:
                
                moveq   #0,d0
                move.b  1(a0),d0
                add.w   d0,d3
loc_BCEA:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetItemBreakMessage

