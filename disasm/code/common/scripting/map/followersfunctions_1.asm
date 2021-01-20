
; ASM FILE code\common\scripting\map\followersfunctions_1.asm :
; 0x44298..0x44338 : Follower functions, part 1

; =============== S U B R O U T I N E =======================================


InitializeFollowerEntities:
                
                cmpi.b  #MAP_NEW_GRANSEAL_HQ,((CURRENT_MAP-$1000000)).w 
                                                        ; new granseal headquarters
                beq.w   return_44336    ; HARDCODED maps with no followers
                cmpi.b  #MAP_NAZCA_SHIP_INTERIOR,((CURRENT_MAP-$1000000)).w 
                                                        ; nazca ship headquarters
                beq.w   return_44336
                movem.l a6,-(sp)
                lea     FollowersTable(pc), a4
                lea     pt_eas_Followers(pc), a6
                lea     ((byte_FFAFB0-$1000000)).w,a5
                move.b  #1,(a5)
                chkFlg  65              ; Caravan is unlocked
                beq.s   loc_442D2
                bsr.s   IsOverworldMap
                beq.s   loc_442D2
                lea     OverworldFollowers(pc), a4
                lea     pt_eas_WorldmapFollowers(pc), a6
loc_442D2:
                
                cmpi.w  #$FFFF,(a4)
                beq.w   loc_44332
                movem.w d1,-(sp)
                clr.w   d1
                move.b  (a4),d1
                jsr     j_CheckFlag
                movem.w (sp)+,d1
                beq.s   loc_4432E
                move.w  d0,-(sp)
                clr.w   d0
                move.b  1(a4),d0
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0 ; HARDCODED max force member index
                bcc.s   loc_44302
                bsr.w   GetAllyMapSprite
                bra.s   loc_44308
loc_44302:
                
                clr.w   d4
                move.b  2(a4),d4        ; optional mapsprite index for non-force members
loc_44308:
                
                move.w  (sp)+,d0
                clr.l   d6
                move.b  1(a4),d6
                tst.b   d6
                bpl.s   loc_44318
                subi.w  #$60,d6 
loc_44318:
                
                move.b  3(a4),(a5,d0.w)
                move.b  d0,(a1,d6.w)
                move.w  d0,d6
                move.l  (a6)+,d5
                bsr.w   DeclareNewEntity
                move.b  d0,(a3)+
                addq.w  #1,d0
loc_4432E:
                
                addq.l  #4,a4
                bra.s   loc_442D2
loc_44332:
                
                movem.l (sp)+,a6
return_44336:
                
                rts

    ; End of function InitializeFollowerEntities

