
; ASM FILE code\gameflow\battle\battlescenes\getallyanimation.asm :
; 0x197C8..0x19838 : Get ally battlescene animation function

; =============== S U B R O U T I N E =======================================

; In: d1.w = animation type, Out: a0 = animation pointer


GetAllyAnimation:
                
                movem.l d1-d2,-(sp)
                
                ; Check if regular attack animation type
                tst.w   d1
                bne.w   @CheckSpecialAnimation
                
                ; Check if centaur battlesprite
                moveq   #ALLYBATTLEANIMATION_SPECIALS_START,d2
                cmpi.w  #ALLYBATTLESPRITE_KNTE,((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponsprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PLDN,((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponsprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PGNT,((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w
                bne.w   @CheckSpecialAnimation
@CheckSpearWeaponsprites:
                
                cmpi.w  #WEAPONSPRITE_SPEAR,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                bcs.w   @CheckSpecialAnimation
                cmpi.w  #WEAPONSPRITE_JAVELIN,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
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
                
                add.w   ((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w,d1
@GetAnimationPointer:
                
                getPointer p_pt_AllyAnimations, a0
                lsl.w   #INDEX_SHIFT_COUNT,d1
                movea.l (a0,d1.w),a0
                movem.l (sp)+,d1-d2
                rts

    ; End of function GetAllyAnimation

