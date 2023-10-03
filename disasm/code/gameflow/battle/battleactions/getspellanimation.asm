
; ASM FILE code\gameflow\battle\battleactions\getspellanimation.asm :
; 0xA54E..0xA6E8 : Get spell animation function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction data pointer
;     a4 = actor index pointer
; 
; Out: d4.b = spellanimation index
; 
; HARDCODED class, enemy and weapon indexes

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

battlesceneScript_GetSpellanimation:
                
                movem.l d0-d3/a0,-(sp)
                moveq   #SPELLANIMATION_NONE,d4 ; no spellanimation by default
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.w   @IsCastSpell
                tst.b   rangedAttack(a2)
                beq.w   @loc_1          ; move on to next step if not a ranged attack
                moveq   #SPELLANIMATION_GUNNER_PROJECTILE,d4 ; otherwise, check if we should perform the BRGN attack animation
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy          ; if attacker is an enemy, check if Dark Gunner
                jsr     GetClass        
                cmpi.b  #CLASS_BRGN,d1
                beq.w   @loc_1          ; move on to next step if ally attacker is BRGN class
                bra.s   @IsWeapon       ; otherwise, check ally's equipped weapon
@Enemy:
                
                jsr     GetEnemy        
                cmpi.w  #ENEMY_DARK_GUNNER,d1
                beq.w   @loc_1          ; move on to next step if enemy attacker is Dark Gunner
@IsWeapon:
                
                jsr     GetEquippedWeapon
                moveq   #SPELLANIMATION_ARROWS_AND_SPEARS,d4
                cmpi.w  #ITEM_WOODEN_ARROW,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_IRON_ARROW,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_STEEL_ARROW,d1
                beq.w   @loc_1          
                moveq   #SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION2,d4
                cmpi.w  #ITEM_ROBIN_ARROW,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_ASSAULT_SHELL,d1
                beq.w   @loc_1          
                moveq   #SPELLANIMATION_CANNON_PROJECTILE,d4
                cmpi.w  #ITEM_NAZCA_CANNON,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_HYPER_CANNON,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_GRAND_CANNON,d1
                beq.w   @loc_1          
                moveq   #SPELLANIMATION_SHOT_PROJECTILE,d4
                cmpi.w  #ITEM_GREAT_SHOT,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_BUSTER_SHOT,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_EVIL_SHOT,d1
                beq.w   @loc_1          
                move.w  #SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION3,d4
                cmpi.w  #ITEM_SHORT_SPEAR,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_BRONZE_LANCE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_SPEAR,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_STEEL_LANCE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_POWER_SPEAR,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_HEAVY_LANCE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_JAVELIN,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_CHROME_LANCE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_VALKYRIE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_HOLY_LANCE,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_MIST_JAVELIN,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_HALBERD,d1
                beq.w   @loc_1          
                cmpi.w  #ITEM_EVIL_LANCE,d1
                beq.w   @loc_1          
                moveq   #SPELLANIMATION_NONE,d4
@loc_1:
                
                bra.s   @IsMirrored     ; check if effect should originate from enemy
@IsCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @IsItemUse
                
                tst.b   silencedActor(a2) ; Is caster silenced?
                bne.s   @Silenced
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d4
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@Silenced:
                
                bra.s   @IsMirrored
@IsItemUse:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @IsBurstRock
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetEquipmentType
                tst.b   d2
                beq.w   @loc_2
                
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #-1,d1          ; should be $3F = nothing
                beq.w   @loc_2
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@loc_2:
                
                bra.s   @IsMirrored
@IsBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @IsMuddled
                
                moveq   #SPELLANIMATION_BURST_ROCK_EXPLOSION,d4
                bra.s   @IsMirrored
@IsMuddled:
                
                cmpi.w  #BATTLEACTION_MUDDLED,(a3)
                bne.w   @IsPrismLaser
                
                moveq   #SPELLANIMATION_NONE,d4
                bra.s   @IsMirrored
@IsPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @IsMirrored
                
                moveq   #SPELLANIMATION_PRISM_LASER,d4
@IsMirrored:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                beq.s   @Done
                
                bset    #SPELLANIMATION_BIT_MIRRORED,d4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_GetSpellanimation

