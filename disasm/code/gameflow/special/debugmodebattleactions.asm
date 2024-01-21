
; ASM FILE code\gameflow\special\debugmodebattleactions.asm :
; 0x9A9A..0x9B92 : Debug mode battle actions

; =============== S U B R O U T I N E =======================================


DebugModeActionSelect:
                
                module
                movem.l d0-d3/a0,-(sp)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                moveq   #0,d0
                moveq   #0,d1
                moveq   #6,d2
                jsr     j_NumberPrompt
                cmpi.b  #-1,d0
                beq.w   @Done
                
                move.w  d0,(a0)+
                add.w   d0,d0
                move.w  rjt_DebugModeBattleactions(pc,d0.w),d0
                jmp     rjt_DebugModeBattleactions(pc,d0.w)
rjt_DebugModeBattleactions:
                
                dc.w @Attack-rjt_DebugModeBattleactions
                dc.w @Magic-rjt_DebugModeBattleactions
                dc.w @Item-rjt_DebugModeBattleactions
                dc.w @EndTurn-rjt_DebugModeBattleactions
                dc.w @BurstRock-rjt_DebugModeBattleactions
                dc.w @Muddle-rjt_DebugModeBattleactions
                dc.w @PrismLaser-rjt_DebugModeBattleactions
@Attack:
                
                bsr.w   DebugModeSelectTargetEnemy
                move.w  d0,(a0)+
                bra.w   @Done
@Magic:
                
                moveq   #1,d0
                moveq   #1,d1
                moveq   #SPELLENTRY_LEVELS_NUMBER,d2
                jsr     j_NumberPrompt
                move.w  d0,d3
                subq.w  #1,d3
                lsl.w   #6,d3
                moveq   #0,d0
                moveq   #0,d1
                moveq   #SPELLENTRY_SPELLS_NUMBER,d2
                jsr     j_NumberPrompt
                add.w   d3,d0
                move.w  d0,(a0)+
                bsr.w   DebugModeSelectTargetEnemy
                move.w  d0,(a0)+
                bra.w   @Done
@Item:
                
                moveq   #0,d0
                moveq   #0,d1
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #ITEMINDEX_MAX,d2
            else
                moveq   #ITEMINDEX_MAX,d2
            endif
                jsr     j_NumberPrompt
                move.w  d0,(a0)+
                bsr.w   DebugModeSelectTargetEnemy
                move.w  d0,(a0)+
                moveq   #0,d0
                moveq   #0,d1
                moveq   #3,d2
                jsr     j_NumberPrompt
                move.w  d0,(a0)+
                bra.w   @Done
@EndTurn:
                
                bra.w   @Done
@BurstRock:
                
                bra.w   @Done
@Muddle:
                
                bra.w   @Done
@PrismLaser:
                
                setSavedByte #BATTLE_VERSUS_PRISM_FLOWERS, CURRENT_BATTLE
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function DebugModeActionSelect

                modend

; =============== S U B R O U T I N E =======================================


DebugModeSelectTargetEnemy:
                
                move.l  #COMBATANT_ENEMIES_START,d0
                moveq   #0,d1
                move.w  #COMBATANT_ENEMIES_END,d2
                jsr     j_NumberPrompt
                rts

    ; End of function DebugModeSelectTargetEnemy


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

DebugModeSelectHits:
                
                movem.l d0/a0-a6,-(sp)
                jsr     j_YesNoPrompt
                tst.w   d0
                seq     debugDodge(a2)
                jsr     j_YesNoPrompt
                tst.w   d0
                seq     debugCritical(a2)
                jsr     j_YesNoPrompt
                tst.w   d0
                seq     debugDouble(a2)
                jsr     j_YesNoPrompt
                tst.w   d0
                seq     debugCounter(a2)
                movem.l (sp)+,d0/a0-a6
                rts

    ; End of function DebugModeSelectHits

