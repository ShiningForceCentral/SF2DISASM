
; ASM FILE code\gameflow\battle\battle_s13_1.asm :
; 0x1AC29C..0x1AC9B8 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; Generates font from basetile font.
; Stretches characters from 1 tile to 2 tiles vertically.
; Also creates a shadow effect using palette index 2.


LoadEndCreditsFont:
                
                conditionalLongAddr movea.l, p_BaseTiles, a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (byte_FF6C02).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                moveq   #$3F,d7 
loc_1AC2BA:
                
                moveq   #7,d6
loc_1AC2BC:
                
                move.l  (a0)+,d0
                andi.l  #$22222222,d0
                eori.l  #$22222222,d0
                lsr.l   #1,d0
                move.l  d0,(a1)
                addq.l  #8,a1
                dbf     d6,loc_1AC2BC
                dbf     d7,loc_1AC2BA
                lea     (TARGETS_REACHABLE_BY_ITEM_NUMBER).l,a1
                moveq   #$3F,d7 
loc_1AC2E0:
                
                moveq   #6,d6
loc_1AC2E2:
                
                moveq   #3,d5
loc_1AC2E4:
                
                clr.b   d0
                move.b  -4(a1),d1
                andi.b  #$10,d1
                beq.w   loc_1AC302
                move.b  4(a1),d1
                andi.b  #$10,d1
                beq.w   loc_1AC302
                ori.b   #$10,d0
loc_1AC302:
                
                move.b  -4(a1),d1
                andi.b  #1,d1
                beq.w   loc_1AC31E
                move.b  4(a1),d1
                andi.b  #1,d1
                beq.w   loc_1AC31E
                ori.b   #1,d0
loc_1AC31E:
                
                move.b  d0,(a1)+
                dbf     d5,loc_1AC2E4
                addq.l  #4,a1
                dbf     d6,loc_1AC2E2
                clr.l   (a1)+
                addq.l  #4,a1
                dbf     d7,loc_1AC2E0
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
                clr.l   (a1)+
                move.w  #$3FE,d7
loc_1AC344:
                
                move.l  (a0)+,d0
                lsr.l   #4,d0
                mulu.w  #2,d0
                move.l  d0,(a1)+
                dbf     d7,loc_1AC344
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
                move.w  #$3FE,d7
loc_1AC362:
                
                move.l  (a0),d0
                andi.l  #$11111111,d0
                mulu.w  #$F,d0
                not.l   d0
                and.l   (a1)+,d0
                or.l    d0,(a0)+
                dbf     d7,loc_1AC362
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($2000).w,a1    ; ?
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                rts

    ; End of function LoadEndCreditsFont


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC38E:
                
                movem.l d0/d5-a6,-(sp)
                jsr     j_GetXPos
                move.w  d1,d3
                jsr     j_GetYPos
                move.w  d1,d4
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC3C2
                cmpi.b  #$FF,d2
                bne.s   loc_1AC3BE
                move.b  #$FF,d1
                bra.w   loc_1AC434
                bra.s   loc_1AC3C0
loc_1AC3BE:
                
                move.b  d2,d0
loc_1AC3C0:
                
                bra.s   loc_1AC3C4
loc_1AC3C2:
                
                move.b  d1,d0
loc_1AC3C4:
                
                btst    #6,d0
                bne.s   loc_1AC3DC
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_1AC3DC
                move.w  #$FFFF,d5
                bra.w   loc_1AC434
loc_1AC3DC:
                
                jsr     GetEnemyAiTargetPosition
                clr.w   d5
                cmp.w   d3,d1
                bge.s   loc_1AC3EC
                bset    #0,d5
loc_1AC3EC:
                
                cmp.w   d4,d2
                blt.s   loc_1AC3F4
                bset    #1,d5
loc_1AC3F4:
                
                btst    #0,d5
                bne.s   loc_1AC406
                subi.w  #4,d3
                tst.w   d3
                bpl.s   loc_1AC404
                clr.w   d3
loc_1AC404:
                
                bra.s   loc_1AC414
loc_1AC406:
                
                addi.w  #4,d3
                cmpi.w  #$2F,d3 
                ble.s   loc_1AC414
                move.w  #$2F,d3 
loc_1AC414:
                
                btst    #1,d5
                beq.s   loc_1AC426
                subi.w  #4,d4
                tst.w   d4
                bpl.s   loc_1AC424
                clr.w   d4
loc_1AC424:
                
                bra.s   loc_1AC434
loc_1AC426:
                
                addi.w  #4,d4
                cmpi.w  #$2F,d4 
                ble.s   loc_1AC434
                move.w  #$2F,d4 
loc_1AC434:
                
                move.b  d5,d1
                movem.l (sp)+,d0/d5-a6
                rts

    ; End of function sub_1AC38E


; =============== S U B R O U T I N E =======================================


GetMoveListForEnemyTarget:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC454
                bra.w   loc_1AC4EA
                bra.s   loc_1AC456
loc_1AC454:
                
                move.b  d1,d0
loc_1AC456:
                
                btst    #6,d0
                bne.s   loc_1AC46A
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_1AC46A
                bra.w   loc_1AC4EA
loc_1AC46A:
                
                jsr     GetEnemyAiTargetPosition
                clr.l   d5
                clr.l   d6
                move.w  d1,d5
                move.w  d2,d6
                move.w  d7,d0
                jsr     j_GetMoveInfo   
                move.w  d5,d3
                move.w  d6,d4
                jsr     j_MakeRangeLists
                move.w  #$2F,d4 
                move.w  #0,d2
                lea     (BATTLE_TERRAIN).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
loc_1AC49E:
                
                move.w  #$2F,d3 
                move.w  #0,d1
loc_1AC4A6:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #$FF,d0
                bne.s   loc_1AC4B4
                bra.w   loc_1AC4D2
loc_1AC4B4:
                
                move.l  d3,-(sp)
                move.w  d0,d3
                move.b  (a1,d1.w),d0
                btst    #7,d0
                beq.s   loc_1AC4D0
                move.w  d3,d0
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC4D0:
                
                move.l  (sp)+,d3
loc_1AC4D2:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC4A6
                adda.w  #$30,a0 
                adda.w  #$30,a1 
                addi.w  #1,d2
                dbf     d4,loc_1AC49E
loc_1AC4EA:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetMoveListForEnemyTarget


; =============== S U B R O U T I N E =======================================

; something with targetting grid or ???


sub_1AC4F0:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                clr.w   d1
                move.b  d0,d1
                lea     (AI_LAST_TARGET_TABLE).l,a0
                andi.b  #$7F,d1 
                move.b  (a0,d1.w),d1
                cmpi.b  #$FF,d1
                beq.s   loc_1AC516
                bsr.w   sub_1AC5AA      
                bra.w   loc_1AC5A4
loc_1AC516:
                
                move.w  d7,d0
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC52A
                bra.w   loc_1AC5A4
                bra.s   loc_1AC52C
loc_1AC52A:
                
                move.b  d1,d0
loc_1AC52C:
                
                btst    #6,d0
                bne.s   loc_1AC540
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_1AC540
                bra.w   loc_1AC5A4
loc_1AC540:
                
                jsr     GetEnemyAiTargetPosition
                move.w  d1,d5
                move.w  d2,d6
                lea     (BATTLE_TERRAIN).l,a0
                move.w  #$2F,d4 
loc_1AC554:
                
                move.w  #$2F,d3 
                move.w  #0,d1
loc_1AC55C:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #$FF,d0
                bne.s   loc_1AC56A
                bra.w   loc_1AC576
loc_1AC56A:
                
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC576:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC55C
                adda.w  #$30,a0 
                dbf     d4,loc_1AC554
                lea     byte_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
loc_1AC5A4:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC4F0


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC5AA:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC5C2
                bra.w   loc_1AC64E
                bra.s   loc_1AC5C4
loc_1AC5C2:
                
                move.b  d1,d0
loc_1AC5C4:
                
                btst    #6,d0
                bne.s   loc_1AC5D8
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_1AC5D8
                bra.w   loc_1AC64E
loc_1AC5D8:
                
                bsr.w   GetEnemyAiTargetPosition
                move.w  d1,d5
                move.w  d2,d6
                move.w  #$2F,d4 
                lea     (BATTLE_TERRAIN).l,a0
loc_1AC5EA:
                
                move.w  #$2F,d3 
                move.w  #0,d1
loc_1AC5F2:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #$FF,d0
                bne.s   loc_1AC600
                bra.w   loc_1AC60C
loc_1AC600:
                
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC60C:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC5F2
                adda.w  #$30,a0 
                dbf     d4,loc_1AC5EA
                lea     byte_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC865(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC87E(pc), a0
                nop
                bsr.w   sub_1AC7FE      
loc_1AC64E:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC5AA


; =============== S U B R O U T I N E =======================================

; clear upper two bits from all tiles in terrain list


ClearTerrainListObstructions:
                
                movem.l d0-a6,-(sp)
                move.w  #$2F,d4 
                lea     (BATTLE_TERRAIN).l,a0
loc_1AC662:
                
                move.w  #$2F,d3 
                move.w  #0,d1
loc_1AC66A:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #$FF,d0
                bne.s   loc_1AC678
                bra.w   loc_1AC684
loc_1AC678:
                
                bclr    #7,d0
                bclr    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC684:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC66A
                adda.w  #$30,a0 
                dbf     d4,loc_1AC662
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearTerrainListObstructions


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC69A:
                
                movem.l d0-a6,-(sp)
                clr.l   d7
                move.b  d0,d7
                bsr.w   sub_1AC38E      
                clr.l   d6
                clr.l   d5
                move.b  d1,d5
                tst.b   d5
                bne.s   loc_1AC6C8
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6C8:
                
                cmpi.b  #1,d5
                bne.s   loc_1AC6E6
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6E6:
                
                cmpi.b  #3,d5
                bne.s   loc_1AC704
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC704:
                
                cmpi.b  #2,d5
                bne.s   loc_1AC722
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
loc_1AC722:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC69A


; =============== S U B R O U T I N E =======================================

; AI-related

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1AC728:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.w  d3,d6
                move.w  d4,d7
                cmpi.b  #0,d1
                bne.s   loc_1AC74E
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC74E:
                
                cmpi.b  #1,d1
                bne.s   loc_1AC768
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC768:
                
                cmpi.b  #2,d1
                bne.s   loc_1AC782
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC782:
                
                cmpi.b  #3,d1
                bne.s   loc_1AC79C
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC79C:
                
                clr.w   d4
                move.b  var_2(a6),d4
                sub.b   var_1(a6),d4
                ext.w   d4
                lea     (BATTLE_TERRAIN).l,a0
                move.b  var_1(a6),d2
                ext.w   d2
loc_1AC7B4:
                
                move.b  var_3(a6),d1
                ext.w   d1
                move.b  var_4(a6),d3
                sub.b   var_3(a6),d3
                ext.w   d3
loc_1AC7C4:
                
                movea.l a0,a1
                move.l  d2,-(sp)
                mulu.w  #$30,d2 
                adda.w  d2,a1
                move.l  (sp)+,d2
                move.b  (a1,d1.w),d0
                cmpi.b  #$FF,d0
                beq.s   loc_1AC7E6
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a1,d1.w)
loc_1AC7E6:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC7C4
                addi.w  #1,d2
                dbf     d4,loc_1AC7B4
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC728


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC7FE:
                
                movem.l d0-a1,-(sp)
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
loc_1AC808:
                
                move.w  d6,d2
                add.b   1(a0),d2
                cmpi.w  #$30,d2 
                bcc.w   loc_1AC83C
                move.w  d5,d1
                add.b   (a0),d1
                cmpi.w  #$30,d1 
                bcc.w   loc_1AC83C
                jsr     j_GetTerrain
                cmpi.b  #$FF,d0
                beq.s   loc_1AC83C
                bclr    #7,d0
                bclr    #6,d0
                jsr     j_SetTerrain
loc_1AC83C:
                
                addq.l  #2,a0
                dbf     d7,loc_1AC808
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_1AC7FE

byte_1AC848:    dc.b 1                  ; AI-related data
                dc.b 0
                dc.b 0
byte_1AC84B:    dc.b 4                  ; AI-related data
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 0
byte_1AC854:    dc.b 8                  ; AI-related data
                dc.b 0
                dc.b $FE
                dc.b $FF
                dc.b $FF
                dc.b $FE
                dc.b 0
                dc.b $FF
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 1
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b $FF
byte_1AC865:    dc.b $C                 ; AI-related data
                dc.b 0
                dc.b $FD
                dc.b $FF
                dc.b $FE
                dc.b $FE
                dc.b $FF
                dc.b $FD
                dc.b 0
                dc.b $FE
                dc.b 1
                dc.b $FF
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b $FF
                dc.b 1
                dc.b $FE
byte_1AC87E:    dc.b $10                ; AI-related data
                dc.b 0
                dc.b $FC
                dc.b $FF
                dc.b $FD
                dc.b $FE
                dc.b $FE
                dc.b $FD
                dc.b $FF
                dc.b $FC
                dc.b 0
                dc.b $FD
                dc.b 1
                dc.b $FE
                dc.b 2
                dc.b $FF
                dc.b 3
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b 3
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 1
                dc.b 4
                dc.b 0
                dc.b 3
                dc.b $FF
                dc.b 2
                dc.b $FE
                dc.b 1
                dc.b $FD
                dc.b $FF

; =============== S U B R O U T I N E =======================================

; AI-related


GetLaserFacing:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                loadSavedDataAddress CURRENT_BATTLE, a0
                clr.w   d2
                move.b  (a0),d2
                lea     tbl_BattlesWithLasers(pc), a0
                nop
                clr.w   d1
                move.b  (a0)+,d1
                subi.w  #1,d1
                clr.w   d3
@CheckBattle_Loop:
                
                move.b  (a0,d3.w),d0
                cmp.b   d0,d2
                bne.s   @NextBattle
                bra.w   @BattleHasLaser
@NextBattle:
                
                addi.w  #1,d3
                dbf     d1,@CheckBattle_Loop
                
                clr.w   d3
                bra.w   @Done
@BattleHasLaser:
                
                lea     pt_LaserEnemyFacingForBattle(pc), a0
                nop
                lsl.w   #2,d3           ; make into longword offset
                movea.l (a0,d3.w),a0
                clr.w   d0
                move.b  d7,d0
                andi.w  #$7F,d0 
                clr.w   d6
                move.b  (a0,d0.w),d6    ; get entity facing
                cmpi.b  #$FF,d6
                bne.s   @ContinueToFacing
                moveq   #0,d3           ; does not laser attack, no targets
                bra.w   @Done
@ContinueToFacing:
                
                clr.w   d0
                move.b  d7,d0
                jsr     j_GetYPos
                move.w  d1,d2
                jsr     j_GetXPos
                jsr     j_ClearMovableGrid
                tst.w   d6
                bne.s   @CheckFace_Up
                addi.w  #1,d1
@CheckFace_Up:
                
                cmpi.w  #1,d6
                bne.s   @CheckFace_Left
                subi.w  #1,d2
@CheckFace_Left:
                
                cmpi.w  #2,d6
                bne.s   @CheckFace_Down
                subi.w  #1,d1
@CheckFace_Down:
                
                cmpi.w  #3,d6
                bne.s   @ContinueToTargets
                addi.w  #1,d2
@ContinueToTargets:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d3
@CheckTile_Loop:
                
                jsr     j_SetMovableAtCoord
                jsr     j_GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                bne.s   @TargetOnTile
                bra.w   @CheckIncrementTile_Right
@TargetOnTile:
                
                move.b  d0,(a0,d3.w)
                addi.w  #1,d3
@CheckIncrementTile_Right:
                
                tst.w   d6
                bne.s   @CheckIncrementTile_Up
                addi.w  #1,d1
                cmpi.w  #$2F,d1 
                ble.s   @CheckIncrementTile_Up
                bra.w   @Done
@CheckIncrementTile_Up:
                
                cmpi.w  #1,d6
                bne.s   @CheckIncrementTile_Left
                subi.w  #1,d2
                tst.w   d2
                bpl.s   @CheckIncrementTile_Left
                bra.w   @Done
@CheckIncrementTile_Left:
                
                cmpi.w  #2,d6
                bne.s   @CheckIncrementTile_Down
                subi.w  #1,d1
                tst.w   d1
                bpl.s   @CheckIncrementTile_Down
                bra.w   @Done
@CheckIncrementTile_Down:
                
                cmpi.w  #3,d6
                bne.s   @NextTile
                addi.w  #1,d2
                cmpi.w  #$2F,d2 
                ble.s   @NextTile
                bra.w   @Done
@NextTile:
                
                bra.s   @CheckTile_Loop
@Done:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d3,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetLaserFacing

