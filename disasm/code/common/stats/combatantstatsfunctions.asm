
; ASM FILE code\common\stats\combatantstatsfunctions.asm :
; 0x928E..0x9482 : Character stats engine, part 2

; =============== S U B R O U T I N E =======================================

; Get pointer to combatant D0's entry in RAM -> A0


GetCombatantEntryAddress:
                
                movem.w d0-d1,-(sp)
                cmpi.b  #COMBATANT_ENEMIES_START,d0
                bcc.s   @Enemy
                cmpi.b  #COMBATANT_ALLIES_SPACE_END_MINUS_ONE,d0
                bhi.s   @ErrorHandling
                bra.s   @GetAddress
@Enemy:
                
                cmpi.b  #COMBATANT_ENEMIES_SPACE_END,d0
                bhi.s   @ErrorHandling
                subi.b  #COMBATANT_ENEMIES_START_MINUS_ALLIES_SPACE_END,d0
@GetAddress:
                
                andi.w  #BYTE_MASK,d0
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                lea     (COMBATANT_ENTRIES).l,a0
            else
                lsl.w   #3,d0           ; multiply by combatant entry size
                move.w  d0,d1
                lsl.w   #3,d0
                sub.w   d1,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a0
            endif
                adda.w  d0,a0
                movem.w (sp)+,d0-d1
                rts
@ErrorHandling:
                
                movem.w (sp)+,d0-d1
                move.l  #'CNUM',(ERRCODE_BYTE0).l
                move.l  (sp),(ERRCODE_BYTE4).l
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
@InfiniteLoop:
                
                bra.s   @InfiniteLoop

    ; End of function GetCombatantEntryAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = byte
;     D7 = offset


SetCombatantByte:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.b  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = word
;     D7 = offset


SetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantWord


; =============== S U B R O U T I N E =======================================


SetCombatantLong:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.l  d1,(a0,d7.w)
                rts
            endif

    ; End of function SetCombatantLong


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant byte offset
; 
; Out: D1 = byte


GetCombatantByte:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                clr.w   d1
                move.b  (a0,d7.w),d1
                rts
            endif

    ; End of function GetCombatantByte


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D7 = combatant word offset
; 
; Out: D1 = word


GetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts
            endif

    ; End of function GetCombatantWord


; =============== S U B R O U T I N E =======================================


dup_GetCombatantWord:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                bsr.s   GetCombatantEntryAddress
                move.w  (a0,d7.w),d1
                rts
            endif

    ; End of function dup_GetCombatantWord


; =============== S U B R O U T I N E =======================================

; clamp byte D7 of entity D0's information + D1 between D5 and D6


IncreaseAndClampByte:
                
                bsr.w   GetCombatantEntryAddress
                add.b   (a0,d7.w),d1
                bcs.s   @MakeMaxValue   ; check if overflow to negative
                cmp.b   d6,d1
                bcs.s   @Continue       ; check if less than max
@MakeMaxValue:
                
                move.b  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.b   d5,d1
                bcc.s   @Done
                move.b  d5,d1           ; if below min, set to min
@Done:
                
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function IncreaseAndClampByte


; =============== S U B R O U T I N E =======================================


Clamp7BitIncreasing:
                
                bsr.w   GetCombatantEntryAddress
                movem.w d2-d3,-(sp)
                move.b  (a0,d7.w),d2
                move.b  d2,d3
                andi.b  #$80,d3
                andi.b  #$7F,d2 
                add.b   d2,d1
                bcs.s   loc_9352
                cmp.b   d6,d1
                bcs.s   loc_9356
loc_9352:
                
                move.b  d6,d1
                bra.s   loc_935C
loc_9356:
                
                cmp.b   d5,d1
                bcc.s   loc_935C
                move.b  d5,d1
loc_935C:
                
                or.b    d3,d1
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                movem.w (sp)+,d2-d3
                rts

    ; End of function Clamp7BitIncreasing


; =============== S U B R O U T I N E =======================================

; clamp byte D7 of entity D0's information - D1 between D5 and D6


DecreaseAndClampByte:
                
                move.w  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,d4
                move.b  (a0,d7.w),d1
                sub.b   d4,d1
                bcs.s   @MakeMinValue
                cmp.b   d5,d1
                bcc.s   @CheckForMaxValue
@MakeMinValue:
                
                move.b  d5,d1
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.b   d6,d1
                bcs.s   @Continue
                move.b  d6,d1           ; if above max, set to max
@Continue:
                
                move.b  d1,(a0,d7.w)
                move.w  (sp)+,d4
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function DecreaseAndClampByte


; =============== S U B R O U T I N E =======================================


IncreaseAndClampWord:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.w 0(a0),d7
                add.w   d7,d1
            else
                add.w   (a0,d7.w),d1
            endif
                bmi.s   @MakeMaxValue   ; check if overflow to negative
                cmp.w   d6,d1
                bcs.s   @Continue       ; check if less than max
@MakeMaxValue:
                
                move.w  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.w   d5,d1
                bcc.s   @Done
                move.w  d5,d1           ; if below min, set to min
@Done:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,0(a0)
            else
                move.w  d1,(a0,d7.w)
            endif
                rts

    ; End of function IncreaseAndClampWord


; =============== S U B R O U T I N E =======================================


DecreaseAndClampWord:
                
                move.w  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d4
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.w 0(a0),d1
            else
                move.w  (a0,d7.w),d1
            endif
                sub.w   d4,d1
                bmi.s   @MakeMinValue   ; check if less than value
                cmp.w   d5,d1
                bhi.s   @CheckForMaxValue ; compare to min
@MakeMinValue:
                
                move.w  d5,d1           ; set to min
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.w   d6,d1
                bls.s   @Continue
                move.w  d6,d1           ; if above max, set to max
@Continue:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,0(a0)
            else
                move.w  d1,(a0,d7.w)
            endif
                move.w  (sp)+,d4
                rts

    ; End of function DecreaseAndClampWord


; =============== S U B R O U T I N E =======================================

; unused


IncreaseAndClampLong:
                
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.l 0(a0),d7
                add.l   d7,d1
            else
                add.l   (a0,d7.w),d1
            endif
                bmi.s   loc_93E8
                cmp.l   d6,d1
                bcs.s   loc_93EC
loc_93E8:
                
                move.l  d6,d1
                bra.s   loc_93F2
loc_93EC:
                
                cmp.l   d5,d1
                bcc.s   loc_93F2
                move.l  d5,d1
loc_93F2:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.l d1,0(a0)
            else
                move.l  d1,(a0,d7.w)
            endif
                rts

    ; End of function IncreaseAndClampLong


; =============== S U B R O U T I N E =======================================

; unused


DecreaseAndClampLong:
                
                move.l  d4,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.l  d1,d4
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                adda.w  d7,a0
                movep.l 0(a0),d1
            else
                move.l  (a0,d7.w),d1
            endif
                sub.l   d4,d1
                bmi.s   loc_940C
                cmp.l   d5,d1
                bhi.s   loc_9410
loc_940C:
                
                move.l  d5,d1
                bra.s   loc_9416
loc_9410:
                
                cmp.l   d6,d1
                bls.s   loc_9416
                move.l  d6,d1
loc_9416:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.l d1,0(a0)
            else
                move.l  d1,(a0,d7.w)
            endif
                move.l  (sp)+,d4
                rts

    ; End of function DecreaseAndClampLong


; =============== S U B R O U T I N E =======================================

; Get distance between two combatants on the battlefield (simple X and Y calculation, no obstructions.)
; 
;       In: d0.w = actor entity
;           d1.w = target entity
; 
;       Out: d2.w = distance in map blocks


GetDistanceBetweenBattleEntities:
                
                movem.l d0-d1/d3-d5,-(sp)
                move.w  d1,d5
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetCombatantX
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d2           ; keep 1st entity X position
                bsr.w   GetCombatantY
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d3           ; keep 1st entity Y position
                move.w  d5,d0
                bsr.w   GetCombatantX
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d4
                bsr.w   GetCombatantY
                cmpi.b  #-1,d1
                beq.w   loc_9478
                
                move.w  d1,d5
                sub.w   d4,d2
                bcc.s   loc_946C
                neg.w   d2
loc_946C:
                
                sub.w   d5,d3
                bcc.s   loc_9472
                neg.w   d3
loc_9472:
                
                add.w   d3,d2
                bra.w   loc_947C
loc_9478:
                
                move.w  #-1,d2
loc_947C:
                
                movem.l (sp)+,d0-d1/d3-d5
                rts

    ; End of function GetDistanceBetweenBattleEntities

