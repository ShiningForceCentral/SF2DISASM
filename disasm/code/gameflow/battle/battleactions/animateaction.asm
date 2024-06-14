
; ASM FILE code\gameflow\battle\battleactions\animateaction.asm :
; 0xA6E8..0xA7F8 : Battlescene animation functions

; =============== S U B R O U T I N E =======================================

; Load battlescene sprite and spellanimation properties.
; 
; In: d4.w = spell/item/projectile animation index, set $80 to come from enemy
;     d5.w = animation type index (0 = attack, 1 = dodge, 2 = spell/item -- others (i.e. MMNK crit, RBT laser, BRGN flashing)


battlesceneScript_AnimateAction:
                
                module
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   byte_A6F8       ; @Enemy
                animateAllyAction d5,d4 ; Animation Type, Spell/Item/Projectile
                bra.s   @Return
byte_A6F8:
                
                @Enemy:
                animateEnemyAction d5,d4 ; Animation Type, Spell/Item/Projectile
@Return:
                
                rts

    ; End of function battlesceneScript_AnimateAction

                modend

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d6.w = direction (0 = right, 1 = left)

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

battlesceneScript_SwitchTargets:
                
                module
                movem.l d0-d1,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Done           ; skip if target is dead
                bscCloseDialogueWindow
                move.w  d6,d1
                tst.b   targetIsOnSameSide(a2)
                bne.w   @Continue
                tst.b   muddledActor(a2)
                bne.w   @Continue
                
                moveq   #0,d1
@Continue:
                
                move.b  (a5),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                ; Ally
                cmp.b   ((BATTLESCENE_LAST_ALLY-$1000000)).w,d0
                beq.s   @Goto_Done
                move.b  d0,((BATTLESCENE_LAST_ALLY-$1000000)).w
                tst.b   rangedAttack(a2)
                bne.w   byte_A772       ; @Ally_Switch
                cmpi.b  #-1,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                beq.s   byte_A75E       ; @Ally_Wait
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A772       ; @Ally_Switch
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A772       ; @Ally_Switch
byte_A75E:
                
                @Ally_Wait:
                bscWait #$1E            ; Duration (in frames)
                switchAllies d0,d1      ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   @Done
byte_A772:
                
                @Ally_Switch:
                switchToAllyAlone d0    ; Combatant
                move.b  #-1,((BATTLESCENE_LAST_ENEMY-$1000000)).w
@Goto_Done:
                
                bra.s   @Done
@Enemy:
                
                cmp.b   ((BATTLESCENE_LAST_ENEMY-$1000000)).w,d0
                beq.s   @Done
                move.b  d0,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                tst.b   rangedAttack(a2)
                bne.w   byte_A7BE       ; @Enemy_Switch
                cmpi.b  #-1,((BATTLESCENE_LAST_ALLY-$1000000)).w
                beq.s   byte_A7AA       ; @Enemy_Wait
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A7BE       ; @Enemy_Switch
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A7BE       ; @Enemy_Switch
byte_A7AA:
                
                @Enemy_Wait:
                bscWait #$1E            ; Duration (in frames)
                switchEnemies d0,d1     ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   @Done
byte_A7BE:
                
                @Enemy_Switch:
                switchToEnemyAlone d0   ; Combatant
                move.b  #-1,((BATTLESCENE_LAST_ALLY-$1000000)).w
@Done:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function battlesceneScript_SwitchTargets

                modend

; =============== S U B R O U T I N E =======================================


battlesceneScript_MakeActorIdle:
                
                module
                movem.l d1,-(sp)
                move.b  (a4),d0
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Done           ; skip if actor is dead
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   byte_A7EE       ; @Enemy
                makeAllyIdle
                bra.s   @Done
byte_A7EE:
                
                @Enemy:
                makeEnemyIdle
@Done:
                
                movem.l (sp)+,d1
                rts

    ; End of function battlesceneScript_MakeActorIdle

                modend
