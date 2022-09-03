
; ASM FILE code\common\scripting\map\headquartersfunctions.asm :
; 0x4790E..0x47A4E : Headquarters functions

; =============== S U B R O U T I N E =======================================


DisplayHeadquartersQuote:
                
                jsr     sub_100AC
                jsr     j_GetCurrentHP
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
                jsr     sub_100B0
                rts

    ; End of function DisplayHeadquartersQuote


; =============== S U B R O U T I N E =======================================


InitNazcaShipForceMembers:
                
                movem.l d0-a2,-(sp)
                moveq   #1,d0
                moveq   #$1C,d7
                lea     ((OTHER_ENTITIES_DATA-$1000000)).w,a0
                lea     tbl_HeadquartersActiveForcePositions(pc), a2
@PlaceMemberNazca_Loop:
                
                move.w  d0,d1
                jsr     j_CheckFlag
                bne.s   @NotInForce
                move.w  #$5E80,d2
                move.w  d2,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #3,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
@NotInForce:
                
                addq.w  #1,d0
                lea     NEXT_ENTITYDEF(a0),a0
                dbf     d7,@PlaceMemberNazca_Loop
                
                movem.l (sp)+,d0-a2
                rts

    ; End of function InitNazcaShipForceMembers


; =============== S U B R O U T I N E =======================================


InitHeadquartersForceMembers:
                
                movem.l d0-a2,-(sp)
                moveq   #1,d0
                moveq   #$1C,d7
                lea     ((OTHER_ENTITIES_DATA-$1000000)).w,a0
                lea     tbl_HeadquartersActiveForcePositions(pc), a2
loc_479A2:
                
                move.w  d0,d1
                jsr     j_CheckFlag     ; joined
                bne.s   loc_479D0
                move.w  #$5E80,d2
                move.w  d2,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.w  #3,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                bra.w   loc_47A28
loc_479D0:
                
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   loc_47A28
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
                move.b  #3,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movem.w d0-d4,-(sp)
                jsr     j_GetAllyMapSprite
                move.w  #3,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0-d4
loc_47A28:
                
                addq.w  #1,d0
                lea     NEXT_ENTITYDEF(a0),a0
                dbf     d7,loc_479A2
                
                movem.l (sp)+,d0-a2
                rts

    ; End of function InitHeadquartersForceMembers

tbl_HeadquartersActiveForcePositions:
                dc.b 17, 7              ; positions for active Force
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
