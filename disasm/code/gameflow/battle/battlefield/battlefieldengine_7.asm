
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_7.asm :
; 0xDA82..0xDEFC : Battlefield engine

; =============== S U B R O U T I N E =======================================

; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     d0.w = move value (MOV*2)
;     d3.b, d4.b = moving combatant X, Y

var_64 = -64
var_63 = -63

PopulateMovementArrays:
                
                module
                movem.l d0-a5,-(sp)
                link    a6,#-64
                lea     (a6),a1
                move.w  #15,d5
                move.l  #$40004000,d1
@InitialStackFrame_Loop:
                
                move.l  d1,-(a1)
                dbf     d5,@InitialStackFrame_Loop
                
                lea     (a3),a1
                move.w  #143,d5
                moveq   #-1,d1
@InitArray1_Loop:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,@InitArray1_Loop
                
                lea     (a2),a1
                move.w  #143,d5
                moveq   #-1,d1
@InitArray2_Loop:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,@InitArray2_Loop
                
                clr.w   d6
                moveq   #0,d5
                move.b  d4,d5
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                andi.w  #BYTE_MASK,d3
                add.w   d3,d5           ; d5.w = coordinates converted to offset
@Main_Loop:
                
                move.b  d6,(a2,d5.w)    ; populate array entry with move count
                move.w  d6,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                move.b  d1,(a3,d5.w)
                
                ; Check right 1 space ahead to the right
                tst.b   1(a3,d5.w)
                bpl.s   @CheckLeft
                addq.w  #1,d5
                bsr.s   sub_DB48        
                subq.w  #1,d5
@CheckLeft:
                
                tst.b   -1(a3,d5.w)
                bpl.s   @CheckUp
                subq.w  #1,d5
                bsr.s   sub_DB48        
                addq.w  #1,d5
@CheckUp:
                
                tst.b   -MAP_SIZE_MAX_TILEWIDTH(a3,d5.w)
                bpl.s   @CheckDown
                subi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                bsr.s   sub_DB48        
                addi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
@CheckDown:
                
                tst.b   MAP_SIZE_MAX_TILEWIDTH(a3,d5.w)
                bpl.s   @loc_1
                addi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                bsr.s   sub_DB48        
                subi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
@loc_1:
                
                move.w  d0,d1
                andi.w  #$1F,d1
                add.w   d1,d1
                move.w  var_64(a6,d1.w),d5 ; retrieve coordinates offset
                btst    #14,d5
                bne.s   @Break          
                move.b  (a3,d5.w),var_64(a6,d1.w)
                move.b  (a2,d5.w),var_63(a6,d1.w)
                bra.s   @Main_Loop      
@Break:
                
                addq.w  #1,d6           ; increment move count
                subq.w  #1,d0           ; decrement move value
                bmi.s   @Done
                bne.s   @loc_1
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function PopulateMovementArrays

                modend

; =============== S U B R O U T I N E =======================================

; In: a2, a3 = movecost arrays
;     a4 = pointer to battle terrain array
;     a5 = pointer to move costs table
;     d0.w = move value (MOV*2)
;     d5.w = coordinates offset
;     d6.w = move count

var_64 = -64
var_63 = -63

sub_DB48:
                
                cmpi.w  #2304,d5
                bcs.s   @Continue       ; continue if not reached end of array
                rts
@Continue:
                
                move.b  (a4,d5.w),d1    ; d1.w = terrain entry
                btst    #7,d1
                beq.s   @SpaceNotOccupied ; continue if space is not occupied
                rts
@SpaceNotOccupied:
                
                andi.w  #$1F,d1         ; d1.w = terrain type
                move.b  (a5,d1.w),d2
                ext.w   d2              ; d2.w = move cost
                cmp.w   d2,d0
                bcc.s   @CanAffordMove  ; continue if move can be afforded
                rts
@CanAffordMove:
                
                beq.s   @Skip           ; skip if move value is fully expanded
                move.w  d0,d1
                sub.w   d2,d1           ; subtract movecost from value
                andi.w  #$1F,d1
                add.w   d1,d1
                move.b  var_64(a6,d1.w),(a3,d5.w)
                move.b  var_63(a6,d1.w),(a2,d5.w)
                move.w  d5,var_64(a6,d1.w) ; store coordinates offset
                rts                     ; (and clear bit 14 from stack frame entry in the process, indicating that the space has been checked)
@Skip:
                
                add.w   d6,d2
                move.b  d2,(a2,d5.w)
                move.w  d2,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                move.b  d1,(a3,d5.w)
                rts

    ; End of function sub_DB48


; =============== S U B R O U T I N E =======================================

; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     d0.b, d1.b = X, Y


BuildCancelMoveString:
                
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   alt_BuildCancelMoveString
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function BuildCancelMoveString


; =============== S U B R O U T I N E =======================================

; Alternate entry point


alt_BuildCancelMoveString:
                
                clr.w   d2
                move.b  d1,d2
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d2
                andi.w  #BYTE_MASK,d0
                add.w   d0,d2           ; d2.w = coordinates converted to offset
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                clr.b   d3
loc_DBBC:
                
                move.b  (a3,d2.w),d4
                lsl.w   #BYTE_SHIFT_COUNT,d4
                move.b  (a2,d2.w),d4
                tst.w   d4              ; d4.w = (upper byte), (lower byte)
                bne.s   loc_DBCE
                bra.w   loc_DD0A
loc_DBCE:
                
                subq.w  #1,d4
                clr.b   d5
                clr.b   d0
                addq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DBE8
                bra.w   loc_DBFA
loc_DBE8:
                
                cmp.w   d4,d0
                bmi.s   loc_DBEE
                bne.s   loc_DBFA
loc_DBEE:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DBFA
                bset    #0,d5
                move.w  d0,d4
loc_DBFA:
                
                subq.w  #1,d2
                clr.b   d0
                subq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC12
                bra.w   loc_DC2E
loc_DC12:
                
                cmp.w   d4,d0
                bmi.s   loc_DC18
                bne.s   loc_DC2E
loc_DC18:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DC2E
                tst.b   d5
                bne.s   loc_DC28
                moveq   #4,d5
                bra.w   loc_DC2C
loc_DC28:
                
                bset    #2,d5
loc_DC2C:
                
                move.w  d0,d4
loc_DC2E:
                
                addq.w  #1,d2
                clr.b   d0
                subi.w  #48,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC48
                bra.w   loc_DC64
loc_DC48:
                
                cmp.w   d4,d0
                bmi.s   loc_DC4E
                bne.s   loc_DC64
loc_DC4E:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DC64
                tst.b   d5
                bne.s   loc_DC5E
                moveq   #2,d5
                bra.w   loc_DC62
loc_DC5E:
                
                bset    #1,d5
loc_DC62:
                
                move.w  d0,d4
loc_DC64:
                
                addi.w  #48,d2
                clr.b   d0
                addi.w  #48,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC80
                bra.w   loc_DC9C
loc_DC80:
                
                cmp.w   d4,d0
                bmi.s   loc_DC86
                bne.s   loc_DC9C
loc_DC86:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DC9C
                tst.b   d5
                bne.s   loc_DC96
                moveq   #8,d5
                bra.w   loc_DC9A
loc_DC96:
                
                bset    #3,d5
loc_DC9A:
                
                move.w  d0,d4
loc_DC9C:
                
                subi.w  #48,d2
                move.b  d3,d1
                and.b   d5,d1
                bne.s   loc_DCAA
                bra.w   loc_DCB4
loc_DCAA:
                
                move.b  d5,d1
                eor.b   d3,d1
                beq.s   loc_DCB4
                bra.w   loc_DCB6
loc_DCB4:
                
                move.b  d5,d1
loc_DCB6:
                
                ror.b   #1,d1
                bcc.s   loc_DCBE
                bra.w   loc_DCDA
loc_DCBE:
                
                ror.b   #1,d1
                bcc.s   loc_DCC6
                bra.w   loc_DCE6
loc_DCC6:
                
                ror.b   #1,d1
                bcc.s   loc_DCCE
                bra.w   loc_DCF2
loc_DCCE:
                
                ror.b   #1,d1
                bcc.s   loc_DCD6
                bra.w   loc_DCFC
loc_DCD6:
                
                bra.w   loc_DD0A
loc_DCDA:
                
                moveq   #0,d5
                moveq   #1,d3
                addi.w  #1,d2
                bra.w   loc_DD04
loc_DCE6:
                
                moveq   #1,d5
                moveq   #2,d3
                subi.w  #48,d2
                bra.w   loc_DD04
loc_DCF2:
                
                moveq   #2,d5
                moveq   #4,d3
                subq.w  #1,d2
                bra.w   loc_DD04
loc_DCFC:
                
                moveq   #3,d5
                moveq   #8,d3
                addi.w  #48,d2
loc_DD04:
                
                move.b  d5,(a0)+
                bra.w   loc_DBBC
loc_DD0A:
                
                move.b  #-1,(a0)
                rts

    ; End of function alt_BuildCancelMoveString


; =============== S U B R O U T I N E =======================================

; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     d0.b, d1.b = destination X,Y


BuildAiMoveString:
                
                module
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   alt_BuildCancelMoveString
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1
                move.w  a0,d0
                move.w  a1,d1
                sub.w   d1,d0           ; d0.w = move string length
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                move.w  d0,d2
                lsr.w   #1,d2
                bcc.s   loc_DD30
                addq.w  #1,d2
loc_DD30:
                
                subq.w  #1,d2
                suba.w  #1,a0
loc_DD36:
                
                move.b  (a0),d0
                move.b  (a1),d1
                eori.b  #2,d1
                move.b  d1,(a0)
                cmpa.w  a0,a1
                bne.s   loc_DD48
                bra.w   @Done
loc_DD48:
                
                eori.b  #2,d0
                move.b  d0,(a1)
                suba.w  #1,a0
                adda.w  #1,a1
                dbf     d2,loc_DD36
@Done:
                
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function BuildAiMoveString

                modend

; =============== S U B R O U T I N E =======================================

; unused


AddAllToStack:
                
                movem.l d0-a5,-(sp)
                movem.l (sp)+,d0-a5
                rts

    ; End of function AddAllToStack


; =============== S U B R O U T I N E =======================================

; should be combined with following subroutine
; 
; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     d0.w, d1.w = starting X, Y
;     d3.w = move value (MOV*2)



BuildMoveString:
                
                module
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   alt_BuildMoveString
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function BuildMoveString


; =============== S U B R O U T I N E =======================================

; Alternate entry point


alt_BuildMoveString:
                
                clr.w   d2
                move.b  d1,d2
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d2
                andi.w  #BYTE_MASK,d0
                add.w   d0,d2           ; d2.w = coordinates converted to offset
                move.b  (a3,d2.w),d6
                lsl.w   #BYTE_SHIFT_COUNT,d6
                move.b  (a2,d2.w),d6
                ext.w   d3
                sub.w   d3,d6           ; d6.w = move cost - move value
                tst.w   d6
                bpl.s   @Continue
                clr.w   d6
@Continue:
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                clr.b   d3
@Start:
                
                move.b  (a3,d2.w),d4
                lsl.w   #BYTE_SHIFT_COUNT,d4
                move.b  (a2,d2.w),d4    ; d4.w =
                cmp.w   d4,d6
                bcs.s   loc_DDB2
                bra.w   @Done
loc_DDB2:
                
                tst.w   d4
                bne.s   loc_DDBA
                bra.w   @Done
loc_DDBA:
                
                subq.w  #1,d4
                clr.b   d5
                clr.b   d0
                addq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DDD4
                bra.w   loc_DDE6
loc_DDD4:
                
                cmp.w   d4,d0
                bmi.s   loc_DDDA
                bne.s   loc_DDE6
loc_DDDA:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DDE6
                bset    #0,d5
                move.w  d0,d4
loc_DDE6:
                
                subq.w  #1,d2
                clr.b   d0
                subq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DDFE
                bra.w   loc_DE1A
loc_DDFE:
                
                cmp.w   d4,d0
                bmi.s   loc_DE04
                bne.s   loc_DE1A
loc_DE04:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DE1A
                tst.b   d5
                bne.s   loc_DE14
                moveq   #4,d5
                bra.w   loc_DE18
loc_DE14:
                
                bset    #2,d5
loc_DE18:
                
                move.w  d0,d4
loc_DE1A:
                
                addq.w  #1,d2
                clr.b   d0
                subi.w  #$30,d2 
loc_DE22:
                
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DE34
                bra.w   loc_DE50
loc_DE34:
                
                cmp.w   d4,d0
                bmi.s   loc_DE3A
                bne.s   loc_DE50
loc_DE3A:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DE50
                tst.b   d5
                bne.s   loc_DE4A
                moveq   #2,d5
                bra.w   loc_DE4E
loc_DE4A:
                
                bset    #1,d5
loc_DE4E:
                
                move.w  d0,d4
loc_DE50:
                
                addi.w  #$30,d2 
                clr.b   d0
                addi.w  #$30,d2 
                move.b  (a3,d2.w),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DE6C
                bra.w   loc_DE88
loc_DE6C:
                
                cmp.w   d4,d0
                bmi.s   loc_DE72
                bne.s   loc_DE88
loc_DE72:
                
                cmpi.w  #MAP_ARRAY_SIZE,d2
                bcc.s   loc_DE88
                tst.b   d5
                bne.s   loc_DE82
                moveq   #8,d5
                bra.w   loc_DE86
loc_DE82:
                
                bset    #3,d5
loc_DE86:
                
                move.w  d0,d4
loc_DE88:
                
                subi.w  #$30,d2 
                move.b  d3,d1
                and.b   d5,d1
                bne.s   loc_DE96
                bra.w   loc_DEA0
loc_DE96:
                
                move.b  d5,d1
                eor.b   d3,d1
                beq.s   loc_DEA0
                bra.w   loc_DEA2
loc_DEA0:
                
                move.b  d5,d1
loc_DEA2:
                
                ror.b   #1,d1
                bcc.s   loc_DEAA
                bra.w   loc_DEC6
loc_DEAA:
                
                ror.b   #1,d1
                bcc.s   loc_DEB2
                bra.w   loc_DED2
loc_DEB2:
                
                ror.b   #1,d1
                bcc.s   loc_DEBA
                bra.w   loc_DEDE
loc_DEBA:
                
                ror.b   #1,d1
                bcc.s   loc_DEC2
                bra.w   loc_DEE8
loc_DEC2:
                
                bra.w   @Done
loc_DEC6:
                
                moveq   #0,d5
                moveq   #1,d3
                addi.w  #1,d2
                bra.w   loc_DEF0
loc_DED2:
                
                moveq   #1,d5
                moveq   #2,d3
                subi.w  #$30,d2 
                bra.w   loc_DEF0
loc_DEDE:
                
                moveq   #2,d5
                moveq   #4,d3
                subq.w  #1,d2
                bra.w   loc_DEF0
loc_DEE8:
                
                moveq   #3,d5
                moveq   #8,d3
                addi.w  #$30,d2 
loc_DEF0:
                
                move.b  d5,(a0)+
                bra.w   @Start
@Done:
                
                move.b  #-1,(a0)
                rts

    ; End of function alt_BuildMoveString

                modend
