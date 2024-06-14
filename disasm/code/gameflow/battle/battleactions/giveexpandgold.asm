
; ASM FILE code\gameflow\battle\battleactions\giveexpandgold.asm :
; 0xA7F8..0xA870 : Give EXP and gold function

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

battlesceneScript_GiveExpAndGold:
                
                module
                movem.l d0-d1/a0,-(sp)
                move.w  ((BATTLESCENE_EXP-$1000000)).w,d1
                tst.b   targetIsOnSameSide(a2)
                bne.w   @RandomizeExp1
                
                ; Should EXP be halved?
                getSavedByte CURRENT_BATTLE, d0
                lea     table_HalvedExpEarnedBattles(pc), a0
@FindBattle_Loop:
                
                cmpi.b  #-1,(a0)
                beq.w   @RandomizeExp1
                
                cmp.b   (a0)+,d0
                bne.s   @FindBattle_Loop
                lsr.w   #1,d1           ; divide earned EXP by 2
@RandomizeExp1:
                
                move.w  #16,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @RandomizeExp2
                addq.w  #1,d1
@RandomizeExp2:
                
                move.w  #16,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @CheckMinimum
                subq.w  #1,d1
@CheckMinimum:
                
                tst.w   d1
                bgt.s   byte_A840       ; @GiveExp
                moveq   #1,d1           ; minimum EXP = 1
byte_A840:
                
                @GiveExp:
                giveEXP d1
                move.w  ((BATTLESCENE_GOLD-$1000000)).w,d1
                tst.w   d1
                beq.s   @Done
                displayMessage #MESSAGE_BATTLE_FOUND_GOLD_COINS,#0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     IncreaseGold
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function battlesceneScript_GiveExpAndGold

                modend
