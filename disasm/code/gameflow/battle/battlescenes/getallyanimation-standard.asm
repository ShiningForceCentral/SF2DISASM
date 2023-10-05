
; ASM FILE code\gameflow\battle\battlescenes\getallyanimation-standard.asm :
; Standard reimplementation of ally battlescene animation getter function.

; =============== S U B R O U T I N E =======================================

; Determine if a knight is attacking with a throwing spear.
;
;   In: d1.w = animation type, Out: a0 = animation pointer

GetAllyAnimation:
                
@KNIGHTS_TO_SPEARS_OFFSET: equ table_SpearThrowAnimations-table_KnightBattleSprites
                
                move.l  d2,-(sp)
                move.w  d1,-(sp)
                
                ; Branch if not performing a regular attack
                bne.s   @IsSpecialAnimation
                
                ; Is weapon sprite a spear?
                lea     table_SpearWeaponSprites(pc), a0
                move.w  ((BATTLESCENE_WEAPONSPRITE-$1000000)).w,d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Default                ; Weapon is not a spear; get regular attack animation
                
                ; Is battle sprite a knight?
                lea     table_KnightBattleSprites(pc), a0
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d1
                move.w  #@KNIGHTS_TO_SPEARS_OFFSET-1,d2
                
@FindKnight_Loop:
                subq.w  #1,d2
                cmp.w   (a0,d2.w),d1
                dbeq    d2,@FindKnight_Loop
                bne.s   @GetAnimationPointer
                
                ; Get spear throw animation index
                move.w  @KNIGHTS_TO_SPEARS_OFFSET(a0,d2.w),d1
                bra.s   @GetAnimationPointer
                
@IsSpecialAnimation:
                cmpi.w  #ALLYBATTLEANIMATION_SPECIALS_START,d1
                bhs.s   @GetAnimationPointer
                
                ; Is dodge?
                cmpi.w  #BATTLEANIMATION_DODGE,d1
                bne.s   @Default
            if (ALLYBATTLEANIMATION_DODGES_START>127)
                move.w  #ALLYBATTLEANIMATION_DODGES_START,d1
            else
                moveq   #ALLYBATTLEANIMATION_DODGES_START,d1
            endif
                bra.s   @GetAnimationIndex
                
@Default:       clr.w   d1                      ; default to regular attack animation
                
@GetAnimationIndex:
                add.w   ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d1
                
@GetAnimationPointer:
                getPointer p_pt_AllyAnimations, a0
                lsl.w   #2,d1
                movea.l (a0,d1.w),a0
                
                move.w  (sp)+,d1
                move.l  (sp)+,d2
                rts
                
    ; End of function GetAllyAnimation
