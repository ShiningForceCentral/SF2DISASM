
; ASM FILE code\gameflow\battle\battleactions\calculatedamage-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: a4 = pointer to attacker index in RAM
;     a5 = pointer to target index in RAM
; Out: d6.w = damage


battlesceneScript_CalculateDamage:
                
                move.l  a0,-(sp)
                move.b  (a4),d0
                bsr.w   GetCurrentATT
                move.w  d1,d6
                move.b  (a5),d0
                bsr.w   GetCurrentDEF
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
                
                ; Check archer damage bonus against airborne targets
                moveq   #0,d2           ; zero property bytes
                
                ; Check if target is either flying or hovering
                lea     table_AirborneMovetypes(pc), a0
                move.b  (a5),d0
                bsr.w   GetMoveType
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                ; Check if attacker is an archer
                lea     table_ArcherMovetypes(pc), a0
                move.b  (a4),d0
                bsr.w   GetMoveType
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                ; Inflict an additional 25% points of damage
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6           
                
@Done:          movea.l (sp)+,a0
                rts

    ; End of function battlesceneScript_CalculateDamage

