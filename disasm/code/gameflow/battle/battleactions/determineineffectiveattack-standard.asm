
; ASM FILE code\gameflow\battle\battleactions\determineineffectiveattack-standard.asm :
; 0x9EC4..0x9F28 : Determine ineffective attack function

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

battlesceneScript_DetermineIneffectiveAttack:
                
                movem.l d0-d2/a0,-(sp)
                
                ; Currently in a battle with an invulnerable enemy?
                lea     table_InvulnerableEnemyBattles(pc), a0
                getSavedByte CURRENT_BATTLE,d1
                moveq   #2,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Skip
                
                ; Acting on the invulnerable enemy?
                move.b  (a5),d0
                bsr.w   GetEnemy
                cmp.b   (a0)+,d1
                bne.s   @Skip
            
            if (ORIGINAL_TAROS_INVULNERABILITY>=1)
                ; do nothing
            else
                clrFlg  112
            endif
                
                ; Attacking?
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckFlag
                
                ; While equipped with the required weapon?
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmp.b   (a0),d1
                bne.s   @CheckFlag
                
                ; If all the above is true, then the enemy is now vulnerable
                setFlg  112             ; Currently attacking Taros with Achilles Sword
@CheckFlag:     chkFlg  112             ; Currently attacking Taros with Achilles Sword
                bne.s   @Skip
                
                st      ineffectiveAttackToggle(a2)
@Skip:          movem.l (sp)+,d0-d2/a0
                rts

    ; End of function battlesceneScript_DetermineIneffectiveAttack

