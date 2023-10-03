
; ASM FILE code\gameflow\battle\getspellanimation-standard.asm :
; Standard reimplementation of spell animation getter function.

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = pointer to battleaction in RAM
;     a4 = pointer to battlescene actor index in RAM
;
; Out: d4 = spell animation index

silencedActor = -11
rangedAttack = -6

GetSpellAnimation:
                
                movem.l d0-d3/a0,-(sp)
                moveq   #SPELLANIMATION_NONE,d4 ; no spell animation by default
                
                ; Jump to module for battleaction
                move.w  (a3),d0
                add.w   d0,d0
                jsr     @bt_Battleactions(pc,d0.w)
                
                ; Mirror animation if actor is an enemy
@Skip:          tst.b   (a4)
                bpl.s   @Done
                bset    #SPELLANIMATION_BIT_MIRRORED,d4
                
@Done:          movem.l (sp)+,d0-d3/a0
@Return:        rts

    ; End of function GetSpellAnimation

@bt_Battleactions:
                bra.s   @Attack
                bra.s   @CastSpell
                bra.s   @UseItem
                bra.s   @Return     ; Stay
                bra.s   @BurstRock
                bra.s   @Return     ; Muddled
                bra.s   @PrismLaser
; ---------------------------------------------------------------------------

@Attack:        module
                tst.b   rangedAttack(a2)
                beq.s   @Return             ; if not a ranged attack, use default
                
                ; Find attack spell animation pointer for either class, enemy, or equipped weapon
                moveq   #1,d2               ; d2 = number of properties in attack spell animations tables
                move.b  (a4),d0             ; d0.b = actor index
                bmi.s   @Enemy
                
                lea     table_AttackSpellAnimationsForClass(pc),a0
                bsr.w   GetClass            ; d1.w = class index
                bra.s   @Continue
                
@Enemy:         lea     table_AttackSpellAnimationsForEnemy(pc),a0
                bsr.w   GetEnemy      ; d1.w = enemy index
                
@Continue:      jsr     (FindSpecialPropertyBytesAddressForObject).w   ; -> a0
                bcc.s   @GetAnimation       ; if class or enemy found, get matching spell animation
                                            ; otherwise, check equipped weapon
                
                lea     table_AttackSpellAnimationsForWeapon(pc),a0
                bsr.w   GetEquippedWeapon   ; d1.w = equipped weapon index
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w   ; -> a0
                bcs.s   @Return             ; if weapon not found, use default
                
@GetAnimation:  move.b  (a0),d4
@Return:        rts
                modend
; ---------------------------------------------------------------------------
                
@CastSpell:     module
                tst.b   silencedActor(a2)
                bne.s   @Return
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@Return:        rts
                modend
; ---------------------------------------------------------------------------
                
@UseItem:       module
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                bsr.w   GetEquipmentType    ; ccr zero-bit set if neither a weapon or a ring
                beq.s   @Return
                
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #ITEM_NOTHING,d1
                beq.s   @Return
                
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_ANIMATION(a0),d4
@Return:        rts
                modend
; ---------------------------------------------------------------------------
                
@BurstRock:     module
                moveq   #SPELLANIMATION_BURST_ROCK_EXPLOSION,d4
                rts
                modend
; ---------------------------------------------------------------------------
                
@PrismLaser:    module
                moveq   #SPELLANIMATION_PRISM_LASER,d4
                rts
                modend
