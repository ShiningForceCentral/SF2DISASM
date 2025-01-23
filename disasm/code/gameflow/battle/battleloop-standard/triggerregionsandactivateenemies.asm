
; ASM FILE code\gameflow\battle\battleloop-standard\triggerregionsandactivateenemies.asm :
;

; =============== S U B R O U T I N E =======================================

; Out: d2.w = -1 if any region was newly activated

TriggerRegionsAndActivateEnemies:
                
                pea     UpdateAllRegionActivatedEnemiesAi(pc)
            if (EXTENDED_BATTLE_TURN_UPDATE=1)
                pea     PrintNewlyActivatedDefCons(pc) ; In: d2.w = newly activated regions bitfield
            endif
TriggerRegions:
                
                clr.w   d0
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                jsr     GetBattleSpritesetSubsection
                move.w  d1,d7
                move.w  #BATTLE_REGION_FLAGS_START,d1
                clr.w   d2
                bra.s   @Continue
@Loop:
                ; Has region already been activated?
                jsr     CheckFlag
                bne.s   @Next
                
                ; Are any allies positioned within region?
                bsr.s   IsRegionTriggered ; Out: d6.w = -1 if true
                beq.s   @Next
                
                jsr     SetFlag
                bset    d0,d2
@Next:
                
                addq.w  #1,d0
                addq.w  #1,d1
@Continue:
                
                dbf     d7,@Loop
                
                rts

    ; End of function TriggerRegions


; =============== S U B R O U T I N E =======================================

; Is AI region indicated by bit d0.w triggered?
; 
; In: a0 = pointer to battle regions, d0.w = region index
; Out: d6.w = -1 if true

IsRegionTriggered:
                
                movem.l d0-d2/d7,-(sp)
                mulu.w  #BATTLESPRITESET_REGION_ENTRY_SIZE,d0
                adda.w  d0,a0
                move.b  (a0),d0
                cmpi.b  #3,d0           ; check region type
                bne.s   @Continue
                
                ; Check region type 3
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d4
                bsr.s   AreAnyAlliesPositionedWithinRegion ; Out: d6.w = -1 if true
                bra.s   @Done
@Continue:
                ; Check other regions
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.s   AreAnyAlliesPositionedWithinRegion ; Out: d6.w = -1 if true
                bne.s   @Done           ; return true
                
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.s   AreAnyAlliesPositionedWithinRegion ; Out: d6.w = -1 if true
@Done:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function IsRegionTriggered


; =============== S U B R O U T I N E =======================================

; In: d2.w, d3.w, d4.w = region delimiter coordinates
; Out: d6.w = -1 if true

AreAnyAlliesPositionedWithinRegion:
                
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                ; Is ally active?
                jsr     GetCombatantX
                move.w  d1,d5
                bmi.s   @Next
                
                jsr     GetCurrentHp
                beq.s   @Next
                
                ; Combine X and Y into a single word
                jsr     GetCombatantY     
                bmi.s   @Next
                
                lsl.w   #BYTE_SHIFT_COUNT,d5
                or.w    d1,d5
                bsr.s   IsAllyPositionedWithinRegion ; Out: d6.w = -1 if true
                bne.s   @Return         ; return true
@Next:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                
                clr.w   d6
@Return:        rts

    ; End of function AreAnyAlliesPositionedWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d2.w, d3.w, d4.w = region delimiter coordinates, d5.w = combatant coordinates
; Out: d6.w = -1 if true

positionFlags = -18
combatantY = -16
combatantX = -14
regionY3 = -12
regionX3 = -10
regionY2 = -8
regionX2 = -6
regionY1 = -4
regionX1 = -2

IsAllyPositionedWithinRegion:
                
                movem.l d0/d2-d4,-(sp)
                link    a6,#-18
                move.w  d2,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY1(a6)
                move.w  d2,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX1(a6)
                move.w  d3,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY2(a6)
                move.w  d3,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX2(a6)
                move.w  d4,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY3(a6)
                move.w  d4,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX3(a6)
                move.w  d5,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,combatantY(a6)
                move.w  d5,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,combatantX(a6)
                
                move.w  regionX1(a6),d1
                move.w  regionY1(a6),d2
                move.w  regionX2(a6),d3
                move.w  regionY2(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.w   IsPositionWithinRegion
                cmpi.w  #%01,d0
                beq.w   @True
                
                cmpi.w  #%11,d0
                beq.s   @loc_3
                
                ; If position flags = %00 or %10
                move.w  d0,positionFlags(a6)
                move.w  regionX3(a6),d5
                move.w  regionY3(a6),d6
                bsr.w   IsPositionWithinRegion
                cmp.w   positionFlags(a6),d0
                bne.s   @False
@loc_3:
                ; If position flags = %11
                move.w  regionX3(a6),d1
                move.w  regionY3(a6),d2
                move.w  regionX1(a6),d3
                move.w  regionY1(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.s   IsPositionWithinRegion
                cmpi.w  #%01,d0
                beq.s   @True
                
                cmpi.w  #%11,d0
                beq.s   @loc_6
                
                ; If position flags = %00 or %10
                move.w  d0,positionFlags(a6)
                move.w  regionX2(a6),d5
                move.w  regionY2(a6),d6
                bsr.s   IsPositionWithinRegion
                cmp.w   positionFlags(a6),d0
                bne.s   @False
@loc_6:
                ; If position flags = %11
                move.w  regionX3(a6),d1
                move.w  regionY3(a6),d2
                move.w  regionX2(a6),d3
                move.w  regionY2(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.s   IsPositionWithinRegion
                cmpi.w  #%01,d0
                beq.s   @True
                
                cmpi.w  #%11,d0
                beq.s   @False
                
                ; If position flags = %00 or %10
                move.w  d0,positionFlags(a6)
                move.w  regionX1(a6),d5
                move.w  regionY1(a6),d6
                bsr.s   IsPositionWithinRegion
                cmp.w   positionFlags(a6),d0
                bne.s   @False
@True:
                
                moveq   #-1,d6
                bra.s   @Done
@False:
                
                clr.w   d6
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d2-d4
                rts

    ; End of function IsAllyPositionedWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d1.w-d6.w = coordinates 1, 2, and 3
; Out: d0.b = bits 0, 1

Y3 = -12
X3 = -10
Y2 = -8
X2 = -6
Y1 = -4
X1 = -2

IsPositionWithinRegion:
                
                movem.l d1-d6,-(sp)
                link    a6,#-12
                move.w  d1,X1(a6)
                move.w  d2,Y1(a6)
                move.w  d3,X2(a6)
                move.w  d4,Y2(a6)
                move.w  d5,X3(a6)
                move.w  d6,Y3(a6)
                
                ; Calculate vertical distance between positions 1 and 2 -> d0.w
                move.w  Y1(a6),d1
                move.w  Y2(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bpl.s   @loc_1
                
                neg.w   d0
@loc_1:
                ; Calculate horizontal distance 1 and 2 -> d1.w
                move.w  X1(a6),d2
                move.w  X2(a6),d1
                ext.w   d1
                ext.w   d2
                sub.w   d2,d1
                bpl.s   @loc_2
                
                neg.w   d1
@loc_2:
                ; Is vertical distance between between positions 1 and 2 less than horizontal distance (unsigned)?
                cmp.w   d0,d1
                blo.w   @loc_19         ; branch if so
                
                ; Calculate vertical distance between positions 2 and 1 -> d0.w
                move.w  Y2(a6),d0
                move.w  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate horizontal distance between positions 2 and 3 -> d1.w
                move.w  X2(a6),d1
                move.w  X3(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6           ; d6.w = ydist[2,1] * hdist[2,3]
                
                ; Calculate horizontal distance between positions 2 and 1 -> d0.w
                move.w  X2(a6),d0
                move.w  X1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                beq.s   @loc_19         ; avoid division by 0
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6           ; d6.w = (ydist[2,1] * hdist[2,3]) / hdist[1,2]
                
                move.w  Y2(a6),d0
                ext.w   d0
                add.w   d6,d0
                bmi.w   @Return2        ; return d0 = %10
                
                move.w  Y3(a6),d1
                ext.w   d1
                sub.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if Y3 is lower
                bhi.w   @Return0        ; return d0 = %00 if Y3 is higher (continue if equal)
                
                ; Is position 1 to the left of position 2?
                move.w  X1(a6),d0
                move.w  X2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @loc_10         ; branch if so
                
                ; Is position 1 to the left of position 3?
                move.w  X3(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if so
                
                ; Is position 3 to the left of position 2?
                move.w  X3(a6),d0
                move.w  X2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if so
                bra.w   @Return1        ; return d0 = %01 otherwise
@loc_10:
                ; Is position 2 to the left of position 3?
                move.w  X2(a6),d0
                move.w  X3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if so
                
                ; Is position 3 to the left of position 1?
                move.w  X3(a6),d0       ; (position 3 X is higher than or same than position 2 X (unsigned), i.e., aligned or to the right)
                move.w  X1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if so
                bra.w   @Return1        ; return d0 = %01 otherwise
@loc_19:
                ; Calculate horizontal distance between positions 2 and 1 -> d0.w
                move.w  X2(a6),d0
                move.w  X1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate vertical distance between positions 3 and 2 -> d1.w
                move.w  Y3(a6),d0
                move.w  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6           ; d6.w = hdist[2,1] * ydist[3,2]
                
                ; Calculate vertical distance between positions 2 and 1 -> d0.w
                move.w  Y2(a6),d0
                move.w  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                beq.s   @Return3        ; return d0 = %11 if vertically aligned
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6           ; d6.w = (hdist[2,1] * ydist[3,2]) / ydist[2,1]
                
                move.w  X2(a6),d0
                ext.w   d0
                add.w   d6,d0
                bmi.s   @Return2        ; return d0 = %10
                
                move.w  X3(a6),d1
                ext.w   d1
                sub.w   d1,d0
                blo.w   @Return2        ; return d0 = %10 if X3 is lower
                bhi.w   @Return0        ; return d0 = %00 if X3 is higher (continue if equal)
                
                ; Is position 1 north of position 2?
                move.w  Y1(a6),d0
                move.w  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @loc_26         ; branch if so
                
                ; Is position 1 north of position 3?
                move.w  Y3(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @Return2        ; return d0 = %10 if so
                
                ; Is position 3 north of position 2?
                move.w  Y3(a6),d0
                move.w  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @Return2        ; return d0 = %10 if so
                bra.s   @Return1        ; return d0 = %01 otherwise
@loc_26:
                ; Is position 2 north of position 3?
                move.w  Y2(a6),d0
                move.w  Y3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @Return2        ; return d0 = %10 if so
                
                ; Is position 3 north of position 1?
                move.w  Y3(a6),d0
                move.w  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                blo.s   @Return2        ; return d0 = %10 if so
@Return1:
                
                moveq   #%01,d0         ; return d0 = %01 otherwise
                bra.s   @Done
@Return2:
                
                moveq   #%10,d0         ; return d0 = %10
                bra.s   @Done
@Return3:
                
                moveq   #%11,d0         ; return d0 = %11
                bra.s   @Done
@Return0:
                
                moveq   #%00,d0         ; return d0 = %00
@Done:
                
                unlk    a6
                movem.l (sp)+,d1-d6
                rts

    ; End of function IsPositionWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d2.w = -1 if any region was newly activated

UpdateAllRegionActivatedEnemiesAi:

                tst.w   d2
                beq.s   @Return         ; skip if activated regions did not change
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                
                ; Update enemies currently on the field
@Loop:          jsr     GetCombatantX
                bmi.s   @Next
                
                jsr     GetCurrentHp
                beq.s   @Next
                
                bsr.s   UpdateRegionActivatedEnemyAi
                
@Next:          addq.w  #1,d0
                dbf     d7,@Loop
                
@Return:        rts

    ; End of function UpdateAllRegionActivatedEnemiesAi


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index

UpdateRegionActivatedEnemyAi:
                
                ; Are associated regions triggered for this AI?
                jsr     GetAiRegion     ; -> d1.w, d2.w
                cmpi.w  #15,d1
                beq.s   @CheckRegion2
                
                ; Is region #1 triggered for this AI?
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     CheckFlag
                beq.s   @CheckRegion2
                
                ; Activate AI for region #1
                jsr     GetActivationBitfield
                andi.w  #($FFFF-1),d1
                ori.w   #1,d1
                jmp     SetActivationBitfield
                
@CheckRegion2:  cmpi.w  #15,d2
                beq.s   @Return
                
                ; Is region #2 triggered for this AI?
                move.w  d2,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     CheckFlag
                beq.s   @Return
                
                ; Activate AI for region #2
                jsr     GetActivationBitfield
                andi.w  #($FFFF-%11),d1
                ori.w   #%11,d1
                jmp     SetActivationBitfield
                
@Return:        rts

    ; End of function UpdateRegionActivatedEnemyAi

