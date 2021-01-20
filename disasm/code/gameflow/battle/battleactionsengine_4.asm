
; ASM FILE code\gameflow\battle\battleactionsengine_4.asm :
; 0xA6E8..0xA870 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; Load proper battlescene sprite and spell animations properties
; 
;     In: D4 = spell/item/projectile animation index, set $80 to come from enemy
;         D5 = animation type index (0 = attack, 1 = dodge, 2 = spell/item -- others (i.e. MMNK crit, RBT laser, BRGN flashing)


WriteBattlesceneScript_AnimateAction:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   @Enemy          
                animateAllyAction d5,d4 ; Animation Type, Spell/Item/Projectile
                bra.s   @Return
@Enemy:
                
                animateEnemyAction d5,d4 ; Animation Type, Spell/Item/Projectile
@Return:
                
                rts

    ; End of function WriteBattlesceneScript_AnimateAction


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
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

WriteBattlesceneScript_SwitchTargets:
                
                movem.l d0-d1,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A7CA        ; skip if target is dead
                bscHideTextBox
                move.w  d6,d1
                tst.b   targetIsOnSameSide(a2)
                bne.w   loc_A72C
                tst.b   muddledActor(a2)
                bne.w   loc_A72C
                moveq   #0,d1
loc_A72C:
                
                move.b  (a5),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_A780
                cmp.b   ((BATTLESCENE_LAST_ALLY-$1000000)).w,d0
                beq.s   loc_A77E
                move.b  d0,((BATTLESCENE_LAST_ALLY-$1000000)).w
                tst.b   rangedAttack(a2)
                bne.w   byte_A772       
                cmpi.b  #$FF,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                beq.s   byte_A75E       
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A772       
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A772       
byte_A75E:
                
                bscWait #$1E            ; Duration (in frames)
                switchAllies d0,d1      ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   loc_A7CA
byte_A772:
                
                switchToAllyAlone d0    ; Combatant
                move.b  #$FF,((BATTLESCENE_LAST_ENEMY-$1000000)).w
loc_A77E:
                
                bra.s   loc_A7CA
loc_A780:
                
                cmp.b   ((BATTLESCENE_LAST_ENEMY-$1000000)).w,d0
                beq.s   loc_A7CA
                move.b  d0,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                tst.b   rangedAttack(a2)
                bne.w   byte_A7BE       
                cmpi.b  #$FF,((BATTLESCENE_LAST_ALLY-$1000000)).w
                beq.s   byte_A7AA       
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A7BE       
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A7BE       
byte_A7AA:
                
                bscWait #$1E            ; Duration (in frames)
                switchEnemies d0,d1     ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   loc_A7CA
byte_A7BE:
                
                switchToEnemyAlone d0   ; Combatant
                move.b  #$FF,((BATTLESCENE_LAST_ALLY-$1000000)).w
loc_A7CA:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function WriteBattlesceneScript_SwitchTargets


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_IdleSprite:
                
                movem.l d1,-(sp)
                move.b  (a4),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   @Done           ; skip if actor is dead
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   @Enemy
                makeAllyIdle
                bra.s   @Done
@Enemy:
                
                makeEnemyIdle
@Done:
                
                movem.l (sp)+,d1
                rts

    ; End of function WriteBattlesceneScript_IdleSprite


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
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

WriteBattlesceneScript_EXPandGold:
                
                movem.l d0-d1/a0,-(sp)
                move.w  ((BATTLESCENE_EXP-$1000000)).w,d1
                tst.b   targetIsOnSameSide(a2)
                bne.w   loc_A81E
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                lea     tbl_HalvedEXPearnedBattles(pc), a0
loc_A810:
                
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                beq.w   loc_A81E
                cmp.b   (a0)+,d0
                bne.s   loc_A810
                lsr.w   #1,d1           ; divide earned EXP by 2
loc_A81E:
                
                move.w  #$10,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_A82C
                addq.w  #1,d1
loc_A82C:
                
                move.w  #$10,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_A83A
                subq.w  #1,d1
loc_A83A:
                
                tst.w   d1
                bgt.s   byte_A840
                moveq   #1,d1
byte_A840:
                
                giveEXP d1
loc_A846:
                
                move.w  ((BATTLESCENE_GOLD-$1000000)).w,d1
                tst.w   d1
                beq.s   loc_A86A
                displayMessage #MESSAGE_BATTLE_FOUND_GOLD_COINS,#0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     IncreaseGold
loc_A86A:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function WriteBattlesceneScript_EXPandGold

