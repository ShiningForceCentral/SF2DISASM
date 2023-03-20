
; ASM FILE code\common\scripting\map\followersfunctions_1.asm :
; 0x44298..0x44338 : Follower functions, part 1

; =============== S U B R O U T I N E =======================================

; In: a1 = pointer to entity event indexes list in RAM
;     a3 = pointer to followers list in RAM
;     d0.l = 1


InitializeFollowerEntities:
                
                cmpi.b  #MAP_NEW_GRANSEAL_HQ,((CURRENT_MAP-$1000000)).w 
                                                        ; HARDCODED maps with no followers
                beq.w   @Return
                cmpi.b  #MAP_NAZCA_SHIP_INTERIOR,((CURRENT_MAP-$1000000)).w
                beq.w   @Return
                
                movem.l a6,-(sp)
                lea     tbl_Followers(pc), a4
                lea     pt_eas_Followers(pc), a6
                lea     ((byte_FFAFB0-$1000000)).w,a5
                move.b  #1,(a5)
                chkFlg  65              ; Caravan is unlocked
                beq.s   @DeclareFollowers_Loop
                bsr.s   IsOverworldMap  
                beq.s   @DeclareFollowers_Loop
                lea     tbl_OverworldFollowers(pc), a4
                lea     pt_eas_OverworldFollowers(pc), a6
@DeclareFollowers_Loop:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a4)
                beq.w   @Done
                
                ; Is follower unlocked?
                movem.w d1,-(sp)
                clr.w   d1
                move.b  (a4),d1
                jsr     j_CheckFlag
                movem.w (sp)+,d1
                beq.s   @Next
                
                move.w  d0,-(sp)
                clr.w   d0
                move.b  1(a4),d0        ; d0.w = entity index
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
                bcc.s   @NonAlly
                bsr.w   GetAllyMapSprite
                bra.s   @AdjustEntityIndex
@NonAlly:
                
                clr.w   d4
                move.b  2(a4),d4        ; optional mapsprite index for non-force members
@AdjustEntityIndex:
                
                move.w  (sp)+,d0
                clr.l   d6
                move.b  1(a4),d6
                tst.b   d6
                bpl.s   @SetPriority
                subi.w  #96,d6
@SetPriority:
                
                move.b  3(a4),(a5,d0.w)
                move.b  d0,(a1,d6.w)
                move.w  d0,d6
                move.l  (a6)+,d5
                bsr.w   DeclareNewEntity
                move.b  d0,(a3)+
                addq.w  #1,d0
@Next:
                
                addq.l  #4,a4
                bra.s   @DeclareFollowers_Loop
@Done:
                
                movem.l (sp)+,a6
@Return:
                
                rts

    ; End of function InitializeFollowerEntities

