
; ASM FILE code\gameflow\battle\battleactions\calculatespelldamage-standard.asm :
; Calculate Spell Damage function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d2.w = resistance setting (0=none, 1=minor, 2=major, 3=weakness)
;     d3.l = chance to critical hit

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

battlesceneScript_CalculateSpellDamage:
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                bsr.s   AdjustSpellPower
                move.w  d6,d1
                lsr.w   #2,d1           ; d1.w = spell power divided by 4
                cmpi.b  #RESISTANCESETTING_MINOR,d2
                bne.s   @CheckMajorResistance
                sub.w   d1,d6           ; -25% damage if target has minor resistance
@CheckMajorResistance:
                
                cmpi.b  #RESISTANCESETTING_MAJOR,d2
                bne.s   @CheckWeakness
                lsr.w   #1,d6           ; -50% damage if target has major resistance
@CheckWeakness:
                
                cmpi.b  #RESISTANCESETTING_WEAKNESS,d2
                bne.s   @DetermineCriticalHit
                add.w   d1,d6           ; +25% damage if target is weak
@DetermineCriticalHit:
                
                move.w  d3,d0
                beq.s   @Skip           ; skip if no chance to critical hit
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @Skip
                add.w   d1,d6           ; +25% damage if successful critical hit
                st      criticalHit(a2)
                
@Skip:          bsr.w   battlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   @Return
                bsr.w   battlesceneScript_DisplayDeathMessage
@Return:        rts

    ; End of function battlesceneScript_CalculateSpellDamage


; =============== S U B R O U T I N E =======================================

; Miscellaneous hacks to alter spell power (125% if promoted, damage divided if SORC spells.)
; 
;  In: a3 = pointer to action type index in RAM
;      a4 = pointer to caster's index in RAM
;      d6.w = original spell power
; 
;  Out: d6.w = altered spell power


AdjustSpellPower:
                
                movem.l d0-d2/a0,-(sp)
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckInvocation    ; go to next step if action is not a spell
                move.b  (a4),d0
                
        if (MUSCLE_MAGIC>=1)
            case MUSCLE_MAGIC_STAT
=0
                jsr     GetCurrentMaxHp
=1
                jsr     GetCurrentHp
=2
                jsr     GetCurrentMaxMp
=3
                jsr     GetCurrentMp
=4
                jsr     GetBaseAtt
=5
                jsr     GetCurrentAtt
=6
                jsr     GetBaseDef
=7
                jsr     GetCurrentDef
=8
                jsr     GetBaseAgi
=?
                jsr     GetCurrentAgi
            endcase
                mulu.w  #MUSCLE_MAGIC,d1
                lsr.l   #8,d1
                add.w   d1,d6
        else
                bsr.w   GetClassType
                beq.s   @CheckInvocation    ; go to next step if caster is not promoted
                mulu.w  #5,d6
                lsr.w   #2,d6               ; +25% spell power
        endif
@CheckInvocation:
                
                lea     table_Invocations(pc),a0
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                ; Divide spell power by number of targets
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d0
                beq.s   @Done
                andi.w  #$FFFF,d6
                divu.w  d0,d6
                andi.w  #$FFFF,d6
                
@Done:          movem.l (sp)+,d0-d2/a0
                rts

    ; End of function AdjustSpellPower

