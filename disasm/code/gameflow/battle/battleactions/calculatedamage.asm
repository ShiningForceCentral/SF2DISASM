
; ASM FILE code\gameflow\battle\battleactions\calculatedamage.asm :
; 0xABBE..0xAC4E : Calculate attack damage function

; =============== S U B R O U T I N E =======================================

; In: a4 = attacker index pointer
;     a5 = target index pointer
; 
; Out: d6.w = damage


battlesceneScript_CalculateDamage:
                
                move.b  (a4),d0
                jsr     GetCurrentAtt
                move.w  d1,d2
                move.b  (a5),d0
                jsr     GetCurrentDef
                sub.w   d1,d2
                bhi.s   @Continue       
                moveq   #1,d2           ; minimum base damage = 1
@Continue:
                
                move.w  d2,d6           ; D6 = base damage
                
                ; Apply land effect damage reduction
                move.b  (a5),d0
                jsr     GetLandEffectSetting
                move.w  #256,d3         ; if land effect displays "0%", do not reduce damage
                tst.b   d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #230,d3         ; else if land effect displays "15%", reduce damage to 230/256
                cmpi.b  #1,d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #205,d3         ; otherwise, reduce damage to 205/256
@ApplyLandEffectToDamage:
                
                mulu.w  d3,d6
                lsr.w   #BYTE_SHIFT_COUNT,d6
                
                ; Check if defender is flying or hovering
                move.b  (a5),d0
                jsr     GetMoveType     
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @Return
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetMoveType     
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                bra.w   @Return
@ApplyArcherDamageBonus:
                
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6           ; inflict an additional 25% of damage if an archer is attacking a flying or hovering combatant
@Return:
                
                rts

    ; End of function battlesceneScript_CalculateDamage

