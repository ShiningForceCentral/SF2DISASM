
; ASM FILE code\gameflow\battle\battleactions\calculatedamage-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: a4, a5 = pointers to attacker and target indexes in RAM, respectively
;
; Out: d6.w = damage


battlesceneScript_CalculateDamage:
                
                move.b  (a4),d0
                bsr.w   GetCurrentAtt
                move.w  d1,d6
                move.b  (a5),d0
                bsr.w   GetCurrentDef
                sub.w   d1,d6           ; d6.w = base damage
                bhi.s   @Continue
                
                moveq   #1,d6           ; minimum base damage = 1
                
                ; Apply n/256 land effect damage reduction
@Continue:      move.b  (a5),d0
                bsr.w   GetLandEffectSetting
                add.w   d1,d1
                move.w  table_LandEffectDamageMultipliers(pc,d1.w),d1
                mulu.w  d1,d6
                lsr.w   #8,d6
                
                ; Check if target is either flying or hovering
                move.b  (a5),d0
                bsr.w   IsAirborneMoveType
                bcs.s   @Return
                
                ; Check if attacker is an archer
                move.b  (a4),d0
                bsr.w   IsArcherMoveType
                bcs.s   @Return
                
                ; Inflict an additional 25% points of damage if archer damage bonus against airborne target is applicable
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6           
                
@Return:        rts

    ; End of function battlesceneScript_CalculateDamage

