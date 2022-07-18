
; ASM FILE code\gameflow\battle\battlescenes\getallyanimation-standard.asm :
; Standard reimplementation of ally battlescene animation getter function.

; =============== S U B R O U T I N E =======================================

; Determines if a knight is attacking with a throwing spear.
;
;   In: D1 = animation type, Out: A0 = animation pointer

GetAllyAnimation:
        
@KNIGHT_BATTLESPRITES_NUMBER: equ tbl_SpearThrowAnimations-tbl_KnightBattleSprites
        
        move.w  d1,-(sp)
        move.l  d2,-(sp)
        
        ; Check if regular attack animation type
        tst.w   d1
        bne.s   @CheckSpecialAnimation
        
        ; Check if weapon sprite is a spear
        lea     tbl_SpearWeaponSprites(pc), a0
        move.w  ((ALLY_WEAPON_SPRITE-$1000000)).w,d1
        moveq   #0,d2
        jsr     (FindSpecialPropertyBytesAddressForObject).w
        bcs.s   @Default                    ; Weapon is not a spear; get regular attack animation
        
        ; Check if battle sprite is a knight
        lea     tbl_KnightBattleSprites(pc), a0
        move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d1
        move.w  #@KNIGHT_BATTLESPRITES_NUMBER-1,d2
        
@FindKnight_Loop:
        cmp.b   (a0,d2.w),d1
        beq.s   @GetSpearThrowAnimation
        dbf     d2,@FindKnight_Loop
        
        bra.s   @GetAnimationPointer
        
@GetSpearThrowAnimation:
        clr.w   d1
        move.b  @KNIGHT_BATTLESPRITES_NUMBER(a0,d2.w),d1
        bra.s   @GetAnimationPointer
        
@CheckSpecialAnimation:
        cmpi.w  #ALLYBATTLEANIMATION_SPECIALS_START,d1
        bhs.s   @GetAnimationPointer
        
        ; Check if dodge animation type
        cmpi.w  #1,d1
        bne.s   @Default
        moveq   #ALLYBATTLEANIMATION_DODGES_START,d1
        bra.s   @GetAnimationIndex
        
@Default:
        clr.w   d1      ; default to regular attack animation
        
@GetAnimationIndex:
        add.w   ((ALLY_BATTLE_SPRITE-$1000000)).w,d1
        
@GetAnimationPointer:
        conditionalLongAddr movea.l, p_pt_AllyAnimations, a0
        lsl.w   #2,d1
        movea.l (a0,d1.w),a0
        
        move.l  (sp)+,d2
        move.w  (sp)+,d1
        rts
        
    ; End of function GetAllyAnimation
