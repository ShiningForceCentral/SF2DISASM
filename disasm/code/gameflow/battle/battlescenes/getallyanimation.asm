
; ASM FILE code\gameflow\battle\battlescenes\getallyanimation.asm :
; 0x197C8..0x19838 : Get ally battlescene animation function

; =============== S U B R O U T I N E =======================================

; In: D1 = animation type, Out: A0 = animation pointer


GetAllyAnimation:
                
                movem.l d1-d2,-(sp)
                
                ; Check if regular attack animation type
                tst.w   d1
                bne.w   @CheckSpecialAnimation
                
                ; Check if centaur battle sprite
                moveq   #ALLYBATTLEANIMATION_SPECIALS_START,d2
                cmpi.w  #ALLYBATTLESPRITE_KNTE,((ALLY_BATTLE_ANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponSprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PLDN,((ALLY_BATTLE_ANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponSprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PGNT,((ALLY_BATTLE_ANIMATION-$1000000)).w
                bne.w   @CheckSpecialAnimation
@CheckSpearWeaponSprites:
                
                cmpi.w  #WEAPONSPRITE_SPEAR,((ALLY_WEAPON_SPRITE-$1000000)).w
                bcs.w   @CheckSpecialAnimation
                cmpi.w  #WEAPONSPRITE_JAVELIN,((ALLY_WEAPON_SPRITE-$1000000)).w
                bhi.w   @CheckSpecialAnimation
                move.w  d2,d1
                bra.w   @GetAnimationPointer
@CheckSpecialAnimation:
                
                cmpi.w  #ALLYBATTLEANIMATION_SPECIALS_START,d1
                bcc.s   @GetAnimationPointer
                
                ; Check if dodge animation type
                cmpi.w  #BATTLEANIMATION_DODGE,d1
                bne.s   @Default        
                moveq   #ALLYBATTLEANIMATION_DODGES_START,d1
                bra.s   @GetAnimationIndex
@Default:
                
                clr.w   d1              ; default to regular attack animation
@GetAnimationIndex:
                
                add.w   ((ALLY_BATTLE_ANIMATION-$1000000)).w,d1
@GetAnimationPointer:
                
                conditionalLongAddr movea.l, p_pt_AllyAnimations, a0
                lsl.w   #2,d1
                movea.l (a0,d1.w),a0
                movem.l (sp)+,d1-d2
                rts

    ; End of function GetAllyAnimation

