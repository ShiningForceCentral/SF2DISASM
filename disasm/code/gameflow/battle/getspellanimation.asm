
; ASM FILE code\gameflow\battle\getspellanimation.asm :
; 0xA54E..0xA6E8 : Get spell animation function

; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A3 = battle action in RAM
;     A4 = battlescene actor index in RAM
; 
; Out: D4 = spell animation index
; 
; <HARDCODED> class, enemy and weapon indexes

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

GetSpellAnimation:
                
                movem.l d0-d3/a0,-(sp)
                moveq   #SPELLANIMATION_NONE,d4 ; no spell animation by default
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.w   @CheckSpellcast
                tst.b   rangedAttack(a2)
                beq.w   @Continue1      ; move on to next step if not a ranged attack
                moveq   #SPELLANIMATION_GUNNER_PROJECTILE,d4 ; otherwise, check if we should perform the BRGN attack animation
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy          ; if attacker is an enemy, check if Dark Gunner
                jsr     GetClass        
                cmpi.b  #CLASS_BRGN,d1
                beq.w   @Continue1      ; move on to next step if ally attacker is BRGN class
                bra.s   @CheckWeapon    ; otherwise, check ally's equipped weapon
@Enemy:
                
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_DARK_GUNNER,d1
                beq.w   @Continue1      ; move on to next step if enemy attacker is Dark Gunner
@CheckWeapon:
                
                jsr     GetEquippedWeapon
                moveq   #SPELLANIMATION_ARROWS_AND_SPEARS,d4
                cmpi.w  #ITEM_WOODEN_ARROW,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_IRON_ARROW,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_STEEL_ARROW,d1
                beq.w   @Continue1      
                moveq   #SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION2,d4
                cmpi.w  #ITEM_ROBIN_ARROW,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_ASSAULT_SHELL,d1
                beq.w   @Continue1      
                moveq   #SPELLANIMATION_CANNON_PROJECTILE,d4
                cmpi.w  #ITEM_NAZCA_CANNON,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_HYPER_CANNON,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_GRAND_CANNON,d1
                beq.w   @Continue1      
                moveq   #SPELLANIMATION_SHOT_PROJECTILE,d4
                cmpi.w  #ITEM_GREAT_SHOT,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_BUSTER_SHOT,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_EVIL_SHOT,d1
                beq.w   @Continue1      
                move.w  #SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION3,d4
                cmpi.w  #ITEM_SHORT_SPEAR,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_BRONZE_LANCE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_SPEAR,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_STEEL_LANCE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_POWER_SPEAR,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_HEAVY_LANCE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_JAVELIN,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_CHROME_LANCE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_VALKYRIE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_HOLY_LANCE,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_MIST_JAVELIN,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_HALBERD,d1
                beq.w   @Continue1      
                cmpi.w  #ITEM_EVIL_LANCE,d1
                beq.w   @Continue1      
                moveq   #SPELLANIMATION_NONE,d4
@Continue1:
                
                bra.s   @CheckMirrored  ; check if effect should originate from enemy
@CheckSpellcast:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckItemUse
                tst.b   silencedActor(a2) ; check if caster is silenced
                bne.s   @Silenced
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d4
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@Silenced:
                
                bra.s   @CheckMirrored
@CheckItemUse:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetEquipmentType
                tst.b   d2
                beq.w   @Continue2      ; move on to next step if used item is neither a weapon or a ring
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.w   @Continue2      ; move on to next step if used item has no use effect
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@Continue2:
                
                bra.s   @CheckMirrored
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckMuddled
                moveq   #SPELLANIMATION_BURST_ROCK_EXPLOSION,d4
                bra.s   @CheckMirrored
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   @CheckPrismLaser
                moveq   #SPELLANIMATION_NONE,d4
                bra.s   @CheckMirrored
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @CheckMirrored
                moveq   #SPELLANIMATION_PRISM_LASER,d4
@CheckMirrored:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                beq.s   @Done
                bset    #SPELLANIMATION_BIT_MIRRORED,d4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GetSpellAnimation

