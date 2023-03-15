
; ASM FILE code\common\scripting\map\headquartersfunctions.asm :
; 0x4790E..0x47A4E : Headquarters functions

; =============== S U B R O U T I N E =======================================


DisplayTacticalBaseQuote:
                
                jsr     j_CreateTacticalBaseAllyNameWindow
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_47924
                move.w  #1,d0
                bra.s   loc_4793C       
loc_47924:
                
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   loc_47938       
                addi.w  #$DC3,d0        ; 0DC3={W1}
                bra.s   loc_4793C       ; start of headquarters 'in party' quotes
loc_47938:
                
                addi.w  #$DE1,d0        ; 0DE1={W1}
loc_4793C:
                
                jsr     (DisplayText).w ; start of headquarters 'outside of party' quotes
                jsr     j_RemoveTacticalBaseAllyNameWindow
                rts

    ; End of function DisplayTacticalBaseQuote


; =============== S U B R O U T I N E =======================================


InitializeNazcaShipForceMembers:
                
                movem.l d0-a2,-(sp)
                moveq   #1,d0
                moveq   #COMBATANT_ALLIES_MINUS_PLAYER_COUNTER,d7
                lea     ((OTHER_ENTITIES_DATA-$1000000)).w,a0
                lea     tbl_TacticalBaseBattlePartyPositions(pc), a2
@PositionMember_Loop:
                
                move.w  d0,d1
                jsr     j_CheckFlag
                bne.s   @Next
                move.w  #$5E80,d2
                move.w  d2,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #DOWN,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
@Next:
                
                addq.w  #1,d0
                lea     NEXT_ENTITYDEF(a0),a0
                dbf     d7,@PositionMember_Loop
                
                movem.l (sp)+,d0-a2
                rts

    ; End of function InitializeNazcaShipForceMembers


; =============== S U B R O U T I N E =======================================


InitializeTacticalBaseForceMembers:
                
                movem.l d0-a2,-(sp)
                moveq   #1,d0
                moveq   #COMBATANT_ALLIES_MINUS_PLAYER_COUNTER,d7
                lea     ((OTHER_ENTITIES_DATA-$1000000)).w,a0
                lea     tbl_TacticalBaseBattlePartyPositions(pc), a2
@PositionMember_Loop:
                
                move.w  d0,d1
                jsr     j_CheckFlag     ; joined
                bne.s   @IsMemberInBattleParty
                
                ; Position member who has not joined offscreen
                move.w  #$5E80,d2
                move.w  d2,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.w  #DOWN,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                bra.w   @Next
@IsMemberInBattleParty:
                
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   @Next
                
                ; Position member in battle party area
                clr.w   d2
                move.b  (a2)+,d2
                mulu.w  #$180,d2
                clr.w   d3
                move.b  (a2)+,d3
                mulu.w  #$180,d3
                move.w  d2,(a0)
                move.w  d3,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d3,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #DOWN,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movem.w d0-d4,-(sp)
                jsr     j_GetAllyMapSprite
                move.w  #DOWN,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0-d4
@Next:
                
                addq.w  #1,d0
                lea     NEXT_ENTITYDEF(a0),a0
                dbf     d7,@PositionMember_Loop
                
                movem.l (sp)+,d0-a2
                rts

    ; End of function InitializeTacticalBaseForceMembers

tbl_TacticalBaseBattlePartyPositions:
                dc.b 17, 7              ; positions for battle party Force members
                dc.b 18, 7
                dc.b 20, 7
                dc.b 21, 7
                dc.b 17, 10
                dc.b 18, 10
                dc.b 20, 10
                dc.b 21, 10
                dc.b 18, 13
                dc.b 19, 13
                dc.b 20, 13
