
; ASM FILE code\common\stats\additionalequipeffects-standard.asm :

; =============== S U B R O U T I N E =======================================

EquipEffect_DecreaseCriticalProwess:
                
                move.b  (a2),d2
                andi.b  #PROWESS_MASK_CRITICAL,d2
                cmpi.b  #PROWESS_CRITICAL_NONE,d2
                bcc.s   @Skip                       ; skip if not a regular critical hit setting
                sub.b   d1,d2
                bcs.s   @Skip
                moveq   #PROWESS_CRITICAL_NONE,d2   ; cap to null critical hit setting
@Skip:
                
                andi.b  #PROWESS_MASK_DOUBLE|PROWESS_MASK_COUNTER,(a2)
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseCriticalProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_DecreaseDoubleAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                sub.b   d1,d2
                bcs.s   @Continue
                moveq   #PROWESS_DOUBLE_1IN32,d2    ; cap to lowest double attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_COUNTER,(a2)
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_DecreaseCounterAttackProwess:
                
                move.b  (a2),d2
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d2
                sub.b   d1,d2
                bcs.s   @Continue
                moveq   #PROWESS_COUNTER_1IN32,d2   ; cap to highest counter attack setting
@Continue:
                
                lsl.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d2
                andi.b  #PROWESS_MASK_CRITICAL|PROWESS_MASK_DOUBLE,(a2)
                or.b    d2,(a2)
                rts

    ; End of function EquipEffect_IncreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseResistanceGroup2:

                movem.l d0-a5,-(sp)
                lsl.w   #8,d1
                bra.s   EquipEffect_IncreaseResistance

    ; End of function EquipEffect_IncreaseResistanceGroup2


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseResistanceGroup1:
                
                movem.l d0-a5,-(sp)
EquipEffect_IncreaseResistance:
                moveq   #0,d4
                moveq   #0,d2
                moveq   #0,d3
                move.w  d1,d2
                moveq   #7,d5
                
@Loop_Elements:
                lsl.w   #2,d4
                jsr     GetCurrentResistance
                move.w  d2,d3
                lsl.w   #1,d5
                ror.w   d5,d3
                andi.w  #3,d3
                ror.w   d5,d1
                andi.w  #3,d1
                add.b   d3,d1
                cmpi.b  #RESISTANCESETTING_MAJOR,d1
                ble.s   @ValidResist
                moveq   #RESISTANCESETTING_MAJOR,d1
@ValidResist:
                btst    #0,d1
                beq.s   @TestBit1
                bset    #0,d4
@TestBit1:
                
                btst    #1,d1
                beq.s   @NextElement
                bset    #1,d4
@NextElement:
                lsr.w   #1,d5
                dbf     d5,@Loop_Elements
                
                move.w  d4,d1
                jsr     SetCurrentResistance
                movem.l (sp)+,d0-a5
                rts

    ; End of function EquipEffect_IncreaseResistanceGroup1


; =============== S U B R O U T I N E =======================================

EquipEffect_DecreaseResistanceGroup2:
                
                movem.l d0-a5,-(sp)
                lsl.w   #8,d1
                bra.s   EquipEffect_DecreaseResistance

    ; End of function EquipEffect_DecreaseResistanceGroup2


; =============== S U B R O U T I N E =======================================

EquipEffect_DecreaseResistanceGroup1:
                
                movem.l d0-a5,-(sp)
EquipEffect_DecreaseResistance:
                moveq   #0,d4
                moveq   #0,d2
                moveq   #0,d3
                move.w  d1,d2
                moveq   #7,d5
                
@Loop_Elements:
                lsl.w   #2,d4
                jsr     GetCurrentResistance
                move.w  d2,d3
                lsl.w   #1,d5
                ror.w   d5,d3
                andi.w  #3,d3
                ror.w   d5,d1
                andi.w  #3,d1
                sub.b   d3,d1
                bpl.s   @ValidResist
                moveq   #RESISTANCESETTING_WEAKNESS,d1
@ValidResist:
                btst    #0,d1
                beq.s   @TestBit1
                bset    #0,d4
@TestBit1:
                
                btst    #1,d1
                beq.s   @NextElement
                bset    #1,d4
@NextElement:
                lsr.w   #1,d5
                dbf     d5,@Loop_Elements
                
                move.w  d4,d1
                jsr     SetCurrentResistance
                
                movem.l (sp)+,d0-a5
                rts

    ; End of function EquipEffect_DecreaseResistanceGroup1


; =============== S U B R O U T I N E =======================================

EquipEffect_SetResistanceGroup2:
                
                movem.l  d0-a5,-(sp)
                lsl.w    #8,d1
                ori.w    #RESIST_GROUP2_MASK,d1
                move.w   d1,d3
                jsr      GetCurrentResistance
                ori.w    #RESIST_GROUP1_MASK,d1
                bra.s    EquipEffect_SetResistance

    ; End of function EquipEffect_SetResistanceGroup2


; =============== S U B R O U T I N E =======================================

EquipEffect_SetResistanceGroup1:
                
                movem.l  d0-a5,-(sp)
                ori.w    #RESIST_GROUP1_MASK,d1
                move.w   d1,d3
                jsr      GetCurrentResistance
                ori.w    #RESIST_GROUP2_MASK,d1
EquipEffect_SetResistance:
                
                and.w    d3,d1
                jsr      SetCurrentResistance
                movem.l  (sp)+,d0-a5
                rts

    ; End of function EquipEffect_SetResistanceGroup1


; =============== S U B R O U T I N E =======================================

EquipEffect_SetStatus:
                
                bset.l   d1,d3
                rts

    ; End of function EquipEffect_SetResistanceGroup1

