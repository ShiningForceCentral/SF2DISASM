
; ASM FILE data\stats\items\attackspellanimations-standard.asm :

                module

@arrow1: equ SPELLANIMATION_ARROWS_AND_SPEARS
@arrow2: equ SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION2
@spear:  equ SPELLANIMATION_ARROWS_AND_SPEARS|SPELLANIMATION_VARIATION3
@cannon: equ SPELLANIMATION_CANNON_PROJECTILE
@shot:   equ SPELLANIMATION_SHOT_PROJECTILE
@gunner: equ SPELLANIMATION_GUNNER_PROJECTILE


; Spell animations that play when a given class attacks. Takes precedence over equipped weapon.
table_AttackSpellAnimationsForClass:
                dc.b CLASS_BRGN, @gunner
                
                tableEnd.b


; Spell animations that play when a given enemy attacks. Takes precedence over equipped weapon.
table_AttackSpellAnimationsForEnemy:
                dc.b ENEMY_DARK_GUNNER, @gunner
                
                tableEnd.b


; Spell animations that play when attacking with a given weapon equipped.
table_AttackSpellAnimationsForWeapon:
                dc.b ITEM_WOODEN_ARROW,  @arrow1
                dc.b ITEM_IRON_ARROW,    @arrow1
                dc.b ITEM_STEEL_ARROW,   @arrow1
                dc.b ITEM_ROBIN_ARROW,   @arrow2
                dc.b ITEM_ASSAULT_SHELL, @arrow2
                dc.b ITEM_NAZCA_CANNON,  @cannon
                dc.b ITEM_HYPER_CANNON,  @cannon
                dc.b ITEM_GRAND_CANNON,  @cannon
                dc.b ITEM_GREAT_SHOT,    @shot
                dc.b ITEM_BUSTER_SHOT,   @shot
                dc.b ITEM_EVIL_SHOT,     @shot
                dc.b ITEM_SHORT_SPEAR,   @spear
                dc.b ITEM_SPEAR,         @spear
                dc.b ITEM_POWER_SPEAR,   @spear
                dc.b ITEM_JAVELIN,       @spear
                dc.b ITEM_VALKYRIE,      @spear
                dc.b ITEM_MIST_JAVELIN,  @spear
                
                tableEnd.b
                modend
