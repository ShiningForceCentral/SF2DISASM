
; ASM FILE code\gameflow\battle\battleloop\regiontriggerfunctions.asm :
; 0x1AC9FC..0x1ACF30 : Triggered AI regions update functions

; =============== S U B R O U T I N E =======================================

; Is AI region indicated by bit d0.b triggered?
; 
; In: d0.b = region index
; Out: d1.w = -1 if true


IsRegionTriggered:
                
                movem.l d0/d2-a6,-(sp)
                cmpi.b  #-1,d0
                bne.s   @loc_1
                
                clr.w   d6
                bra.w   @ReturnInfo
@loc_1:
                
                move.w  d0,d7
                move.b  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                cmp.b   d1,d7
                ble.s   @loc_2
                bra.w   @ReturnInfo     ; keep returning the same result once regions for a given battle have been exhausted
@loc_2:
                
                move.w  d7,d0
                mulu.w  #BATTLESPRITESET_REGION_ENTRY_SIZE,d0
                adda.w  d0,a0
                move.b  (a0),d0
                cmpi.b  #3,d0           ; check region type
                bne.s   @loc_3
                
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d4
                bsr.w   AreAnyAlliesPositionedWithinRegion
                bra.s   @ReturnInfo
@loc_3:
                
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.w   AreAnyAlliesPositionedWithinRegion
                cmpi.b  #0,d6
                beq.s   @loc_4
                bra.w   @ReturnInfo
@loc_4:
                
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.w   AreAnyAlliesPositionedWithinRegion
@ReturnInfo:
                
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function IsRegionTriggered


; =============== S U B R O U T I N E =======================================

; In: d2.w, d3.w, d4.w = region delimiter coordinates
; Out: d6.w = -1 if true


AreAnyAlliesPositionedWithinRegion:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                clr.w   d0
@Loop:
                
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @Skip           ; skip if dead
                bpl.s   @CheckX
@Skip:
                
                bra.w   @Next
@CheckX:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bpl.s   @CheckY
                bra.w   @Next           ; skip if combatant has been moved outside the battlefield
@CheckY:
                
                clr.w   d5
                move.b  d1,d5
                lsl.w   #BYTE_SHIFT_COUNT,d5
                jsr     j_GetCombatantY
                tst.b   d1
                bpl.s   @loc_5          
                bra.w   @Next
@loc_5:
                
                or.b    d1,d5           ; combine X and Y into a single word
                bsr.w   IsAllyPositionedWithinRegion
                tst.w   d6
                bne.s   @Next
                
                bra.w   @loc_7
@Next:
                
                addi.w  #1,d0
                dbf     d7,@Loop
                
                move.w  #0,d6
                bra.w   @Done
@loc_7:
                
                move.w  #-1,d6
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AreAnyAlliesPositionedWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d2.w, d3.w, d4.w = region delimiter coordinates
;     d5.w = combatant coordinates
; 
; Out: d6.w = 0 if true

positionFlags = -9
combatantY = -8
combatantX = -7
regionY3 = -6
regionX3 = -5
regionY2 = -4
regionX2 = -3
regionY1 = -2
regionX1 = -1

IsAllyPositionedWithinRegion:
                
                movem.l d0-d5/d7-a6,-(sp)
                link    a6,#-10
                move.w  d2,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY1(a6)
                move.w  d2,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX1(a6)
                move.w  d3,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY2(a6)
                move.w  d3,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX2(a6)
                move.w  d4,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY3(a6)
                move.w  d4,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX3(a6)
                move.w  d5,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,combatantY(a6)
                move.w  d5,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,combatantX(a6)
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                clr.w   d6
                move.b  regionX1(a6),d1
                move.b  regionY1(a6),d2
                move.b  regionX2(a6),d3
                move.b  regionY2(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   IsPositionWithinRegion
                cmpi.b  #1,d0
                bne.s   @loc_1
                bra.w   @True
@loc_1:
                
                btst    #0,d0
                beq.s   @loc_2
                bra.w   @loc_3          ; branch if position flags = %11
@loc_2:
                
                move.b  d0,positionFlags(a6) ; if position flags = %00 or %10
                move.b  regionX3(a6),d5
                move.b  regionY3(a6),d6
                bsr.w   IsPositionWithinRegion
                cmp.b   positionFlags(a6),d0
                beq.s   @loc_3
                bra.w   @False
@loc_3:
                
                move.b  regionX3(a6),d1 ; if position flags = %11
                move.b  regionY3(a6),d2
                move.b  regionX1(a6),d3
                move.b  regionY1(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   IsPositionWithinRegion
                cmpi.b  #1,d0
                bne.s   @loc_4
                bra.w   @True
@loc_4:
                
                btst    #0,d0
                beq.s   @loc_5
                bra.w   @loc_6          ; branch if position flags = %11
@loc_5:
                
                move.b  d0,positionFlags(a6) ; if position flags = %00 or %10
                move.b  regionX2(a6),d5
                move.b  regionY2(a6),d6
                bsr.w   IsPositionWithinRegion
                cmp.b   positionFlags(a6),d0
                beq.s   @loc_6
                bra.w   @False
@loc_6:
                
                move.b  regionX3(a6),d1 ; if position flags = %11
                move.b  regionY3(a6),d2
                move.b  regionX2(a6),d3
                move.b  regionY2(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   IsPositionWithinRegion
                cmpi.b  #1,d0
                bne.s   @loc_7
                bra.w   @True
@loc_7:
                
                btst    #0,d0
                beq.s   @loc_8
                bra.w   @False
@loc_8:
                
                move.b  d0,positionFlags(a6) ; if position flags = %00 or %10
                move.b  regionX1(a6),d5
                move.b  regionY1(a6),d6
                bsr.w   IsPositionWithinRegion
                cmp.b   positionFlags(a6),d0
                beq.s   @True
                bra.w   @False          ; false if position flags = %11
@True:
                
                clr.w   d6              ; if returned position flags = %10
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts
@False:
                
                move.b  #-1,d6          ; if returned position flags = %00
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function IsAllyPositionedWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d1.b-d6.b = coordinates 1, 2, and 3
; Out: d0.w = %00 = true, %10 = false

Y3 = -6
X3 = -5
Y2 = -4
X2 = -3
Y1 = -2
X1 = -1

IsPositionWithinRegion:
                
                movem.l d1-a6,-(sp)
                link    a6,#-6
                move.b  d1,X1(a6)
                move.b  d2,Y1(a6)
                move.b  d3,X2(a6)
                move.b  d4,Y2(a6)
                move.b  d5,X3(a6)
                move.b  d6,Y3(a6)
                
                ; Calculate vertical distance between positions 1 and 2 -> d0.w
                move.b  Y1(a6),d1
                move.b  Y2(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bpl.s   @loc_1
                neg.w   d0
@loc_1:
                
                move.b  X1(a6),d2       ; calculate horizontal distance 1 and 2 -> d1.w
                move.b  X2(a6),d1
                ext.w   d1
                ext.w   d2
                sub.w   d2,d1
                bpl.s   @loc_2
                neg.w   d1
@loc_2:
                
                cmp.w   d0,d1           ; is vertical distance between between positions 1 and 2 less than horizontal distance (unsigned)?
                bcc.s   @loc_3
                bra.w   @loc_19         ; branch if so
@loc_3:
                
                move.b  Y2(a6),d0       ; calculate vertical distance between positions 2 and 1 -> d0.w
                move.b  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate horizontal distance between positions 2 and 3 -> d1.w
                move.b  X2(a6),d1
                move.b  X3(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6           ; d6.w = ydist[2,1] * hdist[2,3]
                
                ; Calculate horizontal distance between positions 2 and 1 -> d0.w
                move.b  X2(a6),d0
                move.b  X1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   @loc_4
                bra.w   @loc_19
@loc_4:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6           ; d6.w = (ydist[2,1] * hdist[2,3]) / hdist[1,2]
                move.b  Y2(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   @loc_5
                bra.w   @Return2_0      ; return d0 = %10
@loc_5:
                
                move.b  Y3(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   @loc_6
                bra.w   @loc_13         ; return d0 = %00 or %10
@loc_6:
                
                move.b  X1(a6),d0       ; is position 1 to the left of position 2?
                move.b  X2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_7
                bra.w   @loc_10         ; branch if so
@loc_7:
                
                move.b  X3(a6),d1       ; is position 1 to the left of position 3?
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_8
                bra.w   @Return2        ; return d0 = %10 if so
@loc_8:
                
                move.b  X3(a6),d0       ; is position 3 to the left of position 2?
                move.b  X2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @Return1
                bra.w   @Return2        ; return d0 = %10 if so
@Return1:
                
                eor.w   d0,d0
                bra.w   @loc_13         ; return d0 = %01 otherwise
@loc_10:
                
                move.b  X2(a6),d0       ; is position 2 to the left of position 3?
                move.b  X3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_11
                bra.w   @Return2        ; return d0 = %10 if so
@loc_11:
                
                move.b  X3(a6),d0       ; is position 3 to the left of position 1?
                move.b  X1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @Return1_0
                bra.w   @Return2        ; return d0 = %10 if so
@Return1_0:
                
                eor.w   d0,d0           ; return d0 = %01 otherwise
@loc_13:
                
                bne.s   @ClearBit0
                bset    #0,d0
                bra.w   @loc_15
@ClearBit0:
                
                bclr    #0,d0
@loc_15:
                
                bcc.s   @ClearBit1
                bset    #1,d0
                bra.w   @Done
@ClearBit1:
                
                bclr    #1,d0
@Done:
                
                andi.w  #3,d0
                unlk    a6
                movem.l (sp)+,d1-a6
                rts
@Return2:
                
                move    #1,ccr
                bra.s   @loc_13         ; return d0 = %10
@loc_19:
                
                move.b  X2(a6),d0       ; calculate horizontal distance between positions 2 and 1 -> d0.w
                move.b  X1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate vertical distance between positions 3 and 2 -> d1.w
                move.b  Y3(a6),d0
                move.b  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6           ; d6.w = hdist[2,1] * ydist[3,2]
                
                ; Calculate vertical distance between positions 2 and 1 -> d0.w
                move.b  Y2(a6),d0
                move.b  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   @loc_20
                bra.w   @Return3        ; return d0 = %11 if vertically aligned
@loc_20:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6           ; d6.w = (hdist[2,1] * ydist[3,2]) / ydist[2,1]
                move.b  X2(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   @loc_21
                bra.w   @Return2_0      ; return d0 = %10
@loc_21:
                
                move.b  X3(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   @loc_22
                bra.w   @loc_13         ; return d0 = %00 if X3 is higher or %10 if less
@loc_22:
                
                move.b  Y1(a6),d0       ; is position 1 north of position 2?
                move.b  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_23
                bra.w   @loc_26         ; branch if so
@loc_23:
                
                move.b  Y3(a6),d1       ; is position 1 north of position 3?
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_24
                bra.s   @Return2        ; return d0 = %10 if so
@loc_24:
                
                move.b  Y3(a6),d0       ; is position 3 north of position 2?
                move.b  Y2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @Return1_1
                bra.w   @Return2        ; return d0 = %10 if so
@Return1_1:
                
                eor.w   d0,d0
                bra.w   @loc_13         ; return d0 = %01 otherwise
@loc_26:
                
                move.b  Y2(a6),d0       ; is position 2 north of position 3?
                move.b  Y3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @loc_27
                bra.w   @Return2        ; return d0 = %10 if so
@loc_27:
                
                move.b  Y3(a6),d0       ; is position 3 north of position 1?
                move.b  Y1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @Return1_2      ; return d0 = %01 otherwise
                bra.w   @Return2        ; return d0 = %10 if so
@Return1_2:
                
                eor.w   d0,d0           ; return d0 = %01
                bra.w   @loc_13
@Return2_0:
                
                move    #1,ccr          ; return d0 = %10
                bra.w   @loc_13
@Return3:
                
                ori     #1,ccr          ; return d0 = %11
                bra.w   @loc_13

    ; End of function IsPositionWithinRegion


; =============== S U B R O U T I N E =======================================

; In: d0.b = region index


CheckTriggerRegionFlag:
                
                movem.l d0-a6,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


TriggerRegionsAndActivateEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7           ; save combatant index
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                tst.w   d1
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                move.w  d1,d2
                subi.w  #1,d2
                clr.w   d0
@TriggerRegionFlags_Loop:
                
                lea     (PREVIOUSLY_TRIGGERED_BATTLE_REGIONS).l,a0
                move.w  (a0),d1
                btst    d0,d1
                bne.s   @Next
                bsr.w   IsRegionTriggered
                tst.b   d1
                beq.s   @Next
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_SetFlag
@Next:
                
                move.w  (a0),d1
                bset    d0,d1
                move.w  d1,(a0)
                addi.w  #1,d0
                dbf     d2,@TriggerRegionFlags_Loop
                
                ; Are associated regions triggered for this AI?
                move.w  d7,d0           ; restore combatant index
                jsr     j_GetAiRegion
                cmpi.w  #15,d1
                bne.s   @CheckActivationRegion1
                cmpi.w  #15,d2
                bne.s   @CheckActivationRegion1
                bra.w   @Done
@CheckActivationRegion1:
                
                move.b  d0,d7           ; save combatant index
                move.b  d2,d6           ; save AI activation region 2
                move.b  d1,d5           ; save AI activation region 1
                cmpi.b  #15,d5
                bne.s   @IsActivationRegion1Triggered
                bra.w   @CheckActivationRegion2
@IsActivationRegion1Triggered:
                
                clr.w   d1
                move.b  d5,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivateAi1
                bra.w   @CheckActivationRegion2
@ActivateAi1:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetActivationBitfield
                andi.w  #$FFFE,d1
                bset    #0,d1
                jsr     j_SetActivationBitfield
                bra.w   @Done
@CheckActivationRegion2:
                
                cmpi.b  #15,d6
                bne.s   @IsActivationRegion2Triggered
                bra.w   @Done
@IsActivationRegion2Triggered:
                
                clr.w   d1
                move.b  d6,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivateAi2
                bra.w   @Done
@ActivateAi2:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetActivationBitfield
                andi.w  #$FFFC,d1
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetActivationBitfield
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function TriggerRegionsAndActivateEnemies

