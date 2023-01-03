
; ASM FILE code\gameflow\battle\ai\aiengine_2.asm :
; 0xF522..0xF9B4 : AI engine

; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F522:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,var_3(a6)
                move.w  #8,d6
                jsr     j_RandomUnderD6
                cmpi.b  #2,d7
                bne.s   loc_F554
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F554:
                
                cmpi.b  #4,d7
                bne.s   loc_F570
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F570:
                
                cmpi.b  #6,d7
                bne.s   loc_F58C
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F58C:
                
                bsr.w   sub_F8EA
                tst.b   d1
                beq.s   loc_F5AA
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F5AA:
                
                tst.b   d2
                bne.s   loc_F5C4
                clr.w   d0
                move.b  var_3(a6),d0
                jsr     j_GetCombatantStartingPositions
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                bra.s   loc_F5DE
loc_F5C4:
                
                clr.w   d0
                move.b  var_3(a6),d0
                bsr.w   GetAiSpecialMoveOrders
                move.w  d1,d0
                jsr     j_GetEnemyAiTargetPosition
                move.b  d1,var_1(a6)
                move.b  d1,var_2(a6)
loc_F5DE:
                
                move.b  var_3(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                clr.w   d1
                move.b  (a0),d1
                andi.b  #$F,d1
                tst.b   d1
                bne.s   loc_F62A
                clr.w   d6
                move.w  #2,d6
                jsr     j_RandomUnderD6
                tst.b   d7
                bne.s   loc_F624
                move.b  #4,d1
                move.b  d1,(a0)
                bra.s   loc_F62A
loc_F624:
                
                move.b  #3,d1
                move.b  d1,(a0)
loc_F62A:
                
                move.b  d1,var_4(a6)
                clr.l   d5
                move.b  d1,d5
                subi.l  #1,d5
                clr.w   d1
                move.b  (a0),d1
                lsr.w   #4,d1
                move.w  d1,d6
                clr.w   d7
                lea     off_F78A(pc), a1
                nop
                move.b  var_4(a6),d7
                subi.b  #3,d7
                lsl.l   #2,d7
                movea.l (a1,d7.w),a1
                clr.w   d7
                clr.w   d0
                clr.w   d3
loc_F65C:
                
                clr.w   d1
                clr.w   d2
                move.b  (a1,d0.w),d1
                move.b  1(a1,d0.w),d2
                add.b   var_1(a6),d1
                add.b   var_2(a6),d2
                tst.b   d1
                bpl.s   loc_F678
                bra.w   loc_F6AC
loc_F678:
                
                cmpi.b  #$30,d1 
                ble.s   loc_F682
                bra.w   loc_F6AC
loc_F682:
                
                tst.b   d2
                bpl.s   loc_F68A
                bra.w   loc_F6AC
loc_F68A:
                
                cmpi.b  #$30,d2 
                ble.s   loc_F694
                bra.w   loc_F6AC
loc_F694:
                
                move.l  d3,-(sp)
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                move.l  (sp)+,d3
                cmpi.b  #$FF,d1
                bne.s   loc_F6AA
                bra.w   loc_F6AC
loc_F6AA:
                
                bset    d3,d7
loc_F6AC:
                
                addi.w  #2,d0
                addi.w  #1,d3
                dbf     d5,loc_F65C
                bclr    d6,d7
                tst.b   d7
                bne.s   loc_F6EA
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  #0,(a0)
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F6EA:
                
                move.w  d7,d5
                move.w  #3,d4
                clr.w   d0
loc_F6F2:
                
                lsr.w   #1,d5
                bcc.s   loc_F6FA
                addi.b  #1,d0
loc_F6FA:
                
                dbf     d4,loc_F6F2
                move.w  d7,d5
                move.w  d0,d6
                jsr     j_RandomUnderD6
                clr.l   d4
                move.b  var_4(a6),d4
                subi.w  #1,d4
                clr.w   d0
                clr.w   d1
loc_F716:
                
                lsr.w   #1,d5
                bcc.s   loc_F726
                cmp.b   d7,d0
                bne.s   loc_F722
                bra.w   loc_F72E
loc_F722:
                
                addi.b  #1,d0
loc_F726:
                
                addi.b  #1,d1
                dbf     d4,loc_F716
loc_F72E:
                
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  (a0),d0
                move.b  d1,d2
                lsl.w   #4,d2
                andi.b  #$F0,d2
                andi.b  #$F,d0
                or.b    d2,d0
                move.b  d0,(a0)
                clr.l   d7
                move.b  d1,d7
                lsl.w   #1,d7
                move.b  (a1,d7.w),d0
                move.b  1(a1,d7.w),d1
                add.b   var_1(a6),d0
                add.b   var_2(a6),d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
loc_F782:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_F522

off_F78A:       dc.l byte_F792
                dc.l byte_F798
byte_F792:      dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 1
                dc.b 1
                dc.b 1
byte_F798:      dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0

; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F7A0:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   MemorizePath    
                move.b  var_2(a6),d0
                jsr     j_GetEnemyAiTargetPosition
                move.w  d1,d3
                move.w  d2,d4
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COSTS_LIST-$1000000)).w,a5
                bsr.w   MakeRangeLists
                move.w  #$FFFF,d3
                bsr.w   sub_C900
                bsr.w   MakeTargetsList_Everybody
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetXPos
                move.w  d1,d2
                bsr.w   GetCurrentMOV
                move.w  d1,d3
                add.w   d3,d3
                bsr.w   GetYPos
                move.w  d2,d0
                bsr.w   j_makeEnemyMoveOrder
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F820
                bra.w   loc_F8E2
loc_F820:
                
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetEnemyDestination
                move.b  d1,var_4(a6)
                move.b  d2,var_3(a6)
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList_Allies
                move.b  var_1(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                move.w  #0,d3
                bsr.w   UpdateTargetsList_Allies
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F868
                bra.w   loc_F8CE
loc_F868:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F886
                bra.w   loc_F8CE
loc_F886:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #2,d3
                move.w  #2,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F8A4
                bra.w   loc_F8CE
loc_F8A4:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #3,d3
                move.w  #3,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F8C2
                bra.w   loc_F8CE
loc_F8C2:
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_F8E2
loc_F8CE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
loc_F8E2:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_F7A0


; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F8EA:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-4
                move.w  d0,d7
                bsr.w   GetAiSpecialMoveOrders
                move.b  d1,var_3(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetAiRegion     
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F924
                cmpi.b  #$F,d1
                beq.s   loc_F924
                move.b  #1,d1
                bra.w   loc_F9AC
loc_F924:
                
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F93C
                cmpi.b  #$F,d2
                beq.s   loc_F93C
                move.b  #1,d1
                bra.w   loc_F9AC
loc_F93C:
                
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F96E
                move.b  var_1(a6),d0
                cmpi.b  #$F,d0
                bne.s   loc_F96E
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F96E
                move.b  var_2(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F96E
                clr.w   d1
                move.b  #1,d2
                bra.w   loc_F9AC
loc_F96E:
                
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F98A
                move.b  var_1(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F98A
                clr.w   d1
                clr.w   d2
                bra.w   loc_F9AC
loc_F98A:
                
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F9A6
                move.b  var_2(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F9A6
                clr.w   d1
                clr.w   d2
                bra.w   loc_F9AC
loc_F9A6:
                
                move.w  #1,d1
                clr.w   d2
loc_F9AC:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_F8EA

