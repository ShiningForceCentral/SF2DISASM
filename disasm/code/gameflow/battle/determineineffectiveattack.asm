
; ASM FILE code\gameflow\battle\determineineffectiveattack.asm :
; 0x9EC4..0x9F28 : Determine ineffective attack function

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

DetermineIneffectiveAttack:
                
                movem.l d0-d1,-(sp)
                cmpi.b  #BATTLE_VERSUS_TAROS,((CURRENT_BATTLE-$1000000)).w
                bne.w   @Skip
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
                tst.b   (a4)
                bne.w   @CheckFlag
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.w   @CheckFlag
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1
                bne.w   @CheckFlag
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_ACHILLES_SWORD,d1
                bne.w   @CheckFlag
                setFlg  112             ; Currently attacking Taros with Achilles Sword
@CheckFlag:
                
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1
                bne.s   @Skip
                chkFlg  112             ; Currently attacking Taros with Achilles Sword
                bne.s   @Skip
                move.b  #$FF,ineffectiveAttack(a2)
@Skip:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function DetermineIneffectiveAttack

