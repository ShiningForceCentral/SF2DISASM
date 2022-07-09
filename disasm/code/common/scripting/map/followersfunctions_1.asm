
; ASM FILE code\common\scripting\map\followersfunctions_1.asm :
; 0x44298..0x44338 : Follower functions, part 1

; =============== S U B R O U T I N E =======================================


InitializeFollowerEntities:
                
                if (STANDARD_BUILD=1)
                    movem.l d1-d2/a0,-(sp)
                    lea     tbl_MapsWithNoFollowers(pc), a0
                    getSavedByte CURRENT_MAP, d1
                    moveq   #0,d2
                    jsr     (FindSpecialPropertyBytesAddressForObject).w
                    movem.l (sp)+,d1-d2/a0
                    bcc.w   return_44336
                else
                    checkSavedByte #MAP_NEW_GRANSEAL_HQ, CURRENT_MAP    ; HARDCODED maps with no followers
                    beq.w   return_44336
                    checkSavedByte #MAP_NAZCA_SHIP_INTERIOR, CURRENT_MAP
                    beq.w   return_44336
                endif
                
                movem.l a6,-(sp)
                lea     tbl_Followers(pc), a4
                lea     pt_eas_Followers(pc), a6
                lea     ((byte_FFAFB0-$1000000)).w,a5
                move.b  #1,(a5)
                chkFlg  65              ; Caravan is unlocked
                beq.s   loc_442D2
                bsr.s   IsOverworldMap  
                beq.s   loc_442D2
                lea     tbl_OverworldFollowers(pc), a4
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
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
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

