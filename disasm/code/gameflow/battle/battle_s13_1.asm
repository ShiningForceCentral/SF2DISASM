
; ASM FILE code\gameflow\battle\battle_s13_1.asm :
; 0x1AC29C..0x1AD104 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; Generates font from basetile font.
; Stretches characters from 1 tile to 2 tiles vertically.
; Also creates a shadow effect using palette index 2.


LoadEndCreditsFont:
                
                movea.l (p_BaseTiles).l,a0
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
                lea     (byte_FF8808).l,a1
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
                jsr     j_GetEnemyAISetting3233
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
                
                jsr     GetEnemyAITargetPosition
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
                jsr     j_GetEnemyAISetting3233
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
                
                jsr     GetEnemyAITargetPosition
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
                lea     (ENEMY_TARGETTING_COMMAND_LIST).l,a0
                andi.b  #$7F,d1 
                move.b  (a0,d1.w),d1
                cmpi.b  #$FF,d1
                beq.s   loc_1AC516
                bsr.w   sub_1AC5AA      
                bra.w   loc_1AC5A4
loc_1AC516:
                
                move.w  d7,d0
                jsr     j_GetEnemyAISetting3233
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
                
                jsr     GetEnemyAITargetPosition
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
                jsr     j_GetEnemyAISetting3233
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
                
                bsr.w   GetEnemyAITargetPosition
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


sub_1AC8A0:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                clr.w   d2
                move.b  (a0),d2
                lea     byte_1AC9B8(pc), a0
                nop
                clr.w   d1
                move.b  (a0)+,d1
                subi.w  #1,d1
                clr.w   d3
loc_1AC8BE:
                
                move.b  (a0,d3.w),d0
                cmp.b   d0,d2
                bne.s   loc_1AC8CA
                bra.w   loc_1AC8D8
loc_1AC8CA:
                
                addi.w  #1,d3
                dbf     d1,loc_1AC8BE
                clr.w   d3
                bra.w   loc_1AC9AC
loc_1AC8D8:
                
                lea     off_1AC9BC(pc), a0
                nop
                lsl.w   #2,d3
                movea.l (a0,d3.w),a0
                clr.w   d0
                move.b  d7,d0
                andi.w  #$7F,d0 
                clr.w   d6
                move.b  (a0,d0.w),d6
                cmpi.b  #$FF,d6
                bne.s   loc_1AC8FE
                moveq   #0,d3
                bra.w   loc_1AC9AC
loc_1AC8FE:
                
                clr.w   d0
                move.b  d7,d0
                jsr     j_GetYPos
                move.w  d1,d2
                jsr     j_GetXPos
                jsr     j_ClearMovableGrid
                tst.w   d6
                bne.s   loc_1AC91E
                addi.w  #1,d1
loc_1AC91E:
                
                cmpi.w  #1,d6
                bne.s   loc_1AC928
                subi.w  #1,d2
loc_1AC928:
                
                cmpi.w  #2,d6
                bne.s   loc_1AC932
                subi.w  #1,d1
loc_1AC932:
                
                cmpi.w  #3,d6
                bne.s   loc_1AC93C
                addi.w  #1,d2
loc_1AC93C:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d3
loc_1AC942:
                
                jsr     j_SetMovableAtCoord
                jsr     j_GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                bne.s   loc_1AC958
                bra.w   loc_1AC960
loc_1AC958:
                
                move.b  d0,(a0,d3.w)
                addi.w  #1,d3
loc_1AC960:
                
                tst.w   d6
                bne.s   loc_1AC972
                addi.w  #1,d1
                cmpi.w  #$2F,d1 
                ble.s   loc_1AC972
                bra.w   loc_1AC9AC
loc_1AC972:
                
                cmpi.w  #1,d6
                bne.s   loc_1AC984
                subi.w  #1,d2
                tst.w   d2
                bpl.s   loc_1AC984
                bra.w   loc_1AC9AC
loc_1AC984:
                
                cmpi.w  #2,d6
                bne.s   loc_1AC996
                subi.w  #1,d1
                tst.w   d1
                bpl.s   loc_1AC996
                bra.w   loc_1AC9AC
loc_1AC996:
                
                cmpi.w  #3,d6
                bne.s   loc_1AC9AA
                addi.w  #1,d2
                cmpi.w  #$2F,d2 
                ble.s   loc_1AC9AA
                bra.w   loc_1AC9AC
loc_1AC9AA:
                
                bra.s   loc_1AC942
loc_1AC9AC:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d3,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC8A0

byte_1AC9B8:    dc.b 3                  ; AI-related data, 3 entries, for battles 36, 43 and 0
                dc.b BATTLE_VERSUS_PRISM_FLOWERS
                dc.b BATTLE_VERSUS_ZEON
                dc.b BATTLE_VERSUS_ALL_BOSSES
off_1AC9BC:     dc.l byte_1AC9C8        
                dc.l byte_1AC9E0        
                dc.l byte_1AC9F0        
byte_1AC9C8:    dc.b $FF                ; Prism Flowers battle
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 1
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
byte_1AC9E0:    dc.b $FF                ; Zeon Battle
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 2
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.w $FFFF
                dc.b $FF
                dc.b $FF
                dc.b $FF
byte_1AC9F0:    dc.b $FF                ; Secret Bonus Battle
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b 2

; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC9FC:
                
                movem.l d0/d2-a6,-(sp)
                cmpi.b  #$FF,d0
                bne.s   loc_1ACA0C
                clr.w   d6
                bra.w   loc_1ACA6A
loc_1ACA0C:
                
                move.w  d0,d7
                move.b  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpriteSetSubsection
                cmp.b   d1,d7
                ble.s   loc_1ACA1E
                bra.w   loc_1ACA6A
loc_1ACA1E:
                
                move.w  d7,d0
                mulu.w  #$C,d0
                adda.w  d0,a0
                move.b  (a0),d0
                cmpi.b  #3,d0
                bne.s   loc_1ACA40
                move.w  2(a0),d2
                move.w  4(a0),d3
                move.w  6(a0),d4
                bsr.w   sub_1ACA72      
                bra.s   loc_1ACA6A
loc_1ACA40:
                
                move.w  2(a0),d2
                move.w  4(a0),d3
                move.w  8(a0),d4
                bsr.w   sub_1ACA72      
                cmpi.b  #0,d6
                beq.s   loc_1ACA5A
                bra.w   loc_1ACA6A
loc_1ACA5A:
                
                move.w  6(a0),d2
                move.w  4(a0),d3
                move.w  8(a0),d4
                bsr.w   sub_1ACA72      
loc_1ACA6A:
                
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_1AC9FC


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1ACA72:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  #$1D,d7
                clr.w   d0
loc_1ACA7C:
                
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   loc_1ACA88
                bpl.s   loc_1ACA8C
loc_1ACA88:
                
                bra.w   loc_1ACABC
loc_1ACA8C:
                
                jsr     j_GetXPos
                tst.b   d1
                bpl.s   loc_1ACA9A
                bra.w   loc_1ACABC
loc_1ACA9A:
                
                clr.w   d5
                move.b  d1,d5
                lsl.w   #8,d5
                jsr     j_GetYPos
                tst.b   d1
                bpl.s   loc_1ACAAE
                bra.w   loc_1ACABC
loc_1ACAAE:
                
                or.b    d1,d5
                bsr.w   sub_1ACAD6      
                tst.w   d6
                bne.s   loc_1ACABC
                bra.w   loc_1ACACC
loc_1ACABC:
                
                addi.w  #1,d0
                dbf     d7,loc_1ACA7C
                move.w  #0,d6
                bra.w   loc_1ACAD0
loc_1ACACC:
                
                move.w  #$FFFF,d6
loc_1ACAD0:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_1ACA72


; =============== S U B R O U T I N E =======================================

; AI-related

var_9 = -9
var_8 = -8
var_7 = -7
var_6 = -6
var_5 = -5
var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1ACAD6:
                
                movem.l d0-d5/d7-a6,-(sp)
                link    a6,#-10
                move.w  d2,d0
                andi.w  #$FF,d0
                move.b  d0,var_2(a6)
                move.w  d2,d0
                lsr.w   #8,d0
                move.b  d0,var_1(a6)
                move.w  d3,d0
                andi.w  #$FF,d0
                move.b  d0,var_4(a6)
                move.w  d3,d0
                lsr.w   #8,d0
                move.b  d0,var_3(a6)
                move.w  d4,d0
                andi.w  #$FF,d0
                move.b  d0,var_6(a6)
                move.w  d4,d0
                lsr.w   #8,d0
                move.b  d0,var_5(a6)
                move.w  d5,d0
                andi.w  #$FF,d0
                move.b  d0,var_8(a6)
                move.w  d5,d0
                lsr.w   #8,d0
                move.b  d0,var_7(a6)
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                clr.w   d6
                move.b  var_1(a6),d1
                move.b  var_2(a6),d2
                move.b  var_3(a6),d3
                move.b  var_4(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACB58
                bra.w   loc_1ACC10
loc_1ACB58:
                
                btst    #0,d0
                beq.s   loc_1ACB62
                bra.w   loc_1ACB7C
loc_1ACB62:
                
                move.b  d0,var_9(a6)
                move.b  var_5(a6),d5
                move.b  var_6(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACB7C
                bra.w   loc_1ACC1A
loc_1ACB7C:
                
                move.b  var_5(a6),d1
                move.b  var_6(a6),d2
                move.b  var_1(a6),d3
                move.b  var_2(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACBA2
                bra.w   loc_1ACC10
loc_1ACBA2:
                
                btst    #0,d0
                beq.s   loc_1ACBAC
                bra.w   loc_1ACBC6
loc_1ACBAC:
                
                move.b  d0,var_9(a6)
                move.b  var_3(a6),d5
                move.b  var_4(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACBC6
                bra.w   loc_1ACC1A
loc_1ACBC6:
                
                move.b  var_5(a6),d1
                move.b  var_6(a6),d2
                move.b  var_3(a6),d3
                move.b  var_4(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACBEC
                bra.w   loc_1ACC10
loc_1ACBEC:
                
                btst    #0,d0
                beq.s   loc_1ACBF6
                bra.w   loc_1ACC1A
loc_1ACBF6:
                
                move.b  d0,var_9(a6)
                move.b  var_1(a6),d5
                move.b  var_2(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACC10
                bra.w   loc_1ACC1A
loc_1ACC10:
                
                clr.w   d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts
loc_1ACC1A:
                
                move.b  #$FF,d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_1ACAD6


; =============== S U B R O U T I N E =======================================

var_6 = -6
var_5 = -5
var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1ACC26:
                
                movem.l d1-a6,-(sp)
                link    a6,#-6
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                move.b  d3,var_3(a6)
                move.b  d4,var_4(a6)
                move.b  d5,var_5(a6)
                move.b  d6,var_6(a6)
                move.b  var_2(a6),d1
                move.b  var_4(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bpl.s   loc_1ACC58
                neg.w   d0
loc_1ACC58:
                
                move.b  var_1(a6),d2
                move.b  var_3(a6),d1
                ext.w   d1
                ext.w   d2
                sub.w   d2,d1
                bpl.s   loc_1ACC6A
                neg.w   d1
loc_1ACC6A:
                
                cmp.w   d0,d1
                bcc.s   loc_1ACC72
                bra.w   loc_1ACD60
loc_1ACC72:
                
                move.b  var_4(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                move.b  var_3(a6),d1
                move.b  var_5(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6
                move.b  var_3(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   loc_1ACCAA
                bra.w   loc_1ACD60
loc_1ACCAA:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6
                move.b  var_4(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   loc_1ACCBE
                bra.w   loc_1ACE22
loc_1ACCBE:
                
                move.b  var_6(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   loc_1ACCCC
                bra.w   loc_1ACD32
loc_1ACCCC:
                
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACCE0
                bra.w   loc_1ACD08
loc_1ACCE0:
                
                move.b  var_5(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACCEE
                bra.w   loc_1ACD5A
loc_1ACCEE:
                
                move.b  var_5(a6),d0
                move.b  var_3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD02
                bra.w   loc_1ACD5A
loc_1ACD02:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACD08:
                
                move.b  var_3(a6),d0
                move.b  var_5(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD1C
                bra.w   loc_1ACD5A
loc_1ACD1C:
                
                move.b  var_5(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD30
                bra.w   loc_1ACD5A
loc_1ACD30:
                
                eor.w   d0,d0
loc_1ACD32:
                
                bne.s   loc_1ACD3C
                bset    #0,d0
                bra.w   loc_1ACD40
loc_1ACD3C:
                
                bclr    #0,d0
loc_1ACD40:
                
                bcc.s   loc_1ACD4A
                bset    #1,d0
                bra.w   loc_1ACD4E
loc_1ACD4A:
                
                bclr    #1,d0
loc_1ACD4E:
                
                andi.w  #3,d0
                unlk    a6
                movem.l (sp)+,d1-a6
                rts
loc_1ACD5A:
                
                move    #1,ccr
                bra.s   loc_1ACD32
loc_1ACD60:
                
                move.b  var_3(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                move.b  var_6(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6
                move.b  var_4(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   loc_1ACD98
                bra.w   loc_1ACE2A
loc_1ACD98:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6
                move.b  var_3(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   loc_1ACDAC
                bra.w   loc_1ACE22
loc_1ACDAC:
                
                move.b  var_5(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   loc_1ACDBA
                bra.w   loc_1ACD32
loc_1ACDBA:
                
                move.b  var_2(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDCE
                bra.w   loc_1ACDF4
loc_1ACDCE:
                
                move.b  var_6(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDDA
                bra.s   loc_1ACD5A
loc_1ACDDA:
                
                move.b  var_6(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDEE
                bra.w   loc_1ACD5A
loc_1ACDEE:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACDF4:
                
                move.b  var_4(a6),d0
                move.b  var_6(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACE08
                bra.w   loc_1ACD5A
loc_1ACE08:
                
                move.b  var_6(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACE1C
                bra.w   loc_1ACD5A
loc_1ACE1C:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACE22:
                
                move    #1,ccr
                bra.w   loc_1ACD32
loc_1ACE2A:
                
                ori     #1,ccr
                bra.w   loc_1ACD32

    ; End of function sub_1ACC26


; =============== S U B R O U T I N E =======================================

; In: D1 = region #


CheckTriggerRegionFlag:
                
                movem.l d0-a6,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #$5A,d1 
                jsr     j_CheckFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================


UpdateTriggeredRegionsAndAI:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpriteSetSubsection
                tst.w   d1
                bne.s   loc_1ACE60
                bra.w   loc_1ACF2A
loc_1ACE60:
                
                move.w  d1,d2
                subi.w  #1,d2
                clr.w   d0
loc_1ACE68:
                
                lea     (byte_FFB20C).l,a0
                move.w  (a0),d1
                btst    d0,d1
                bne.s   loc_1ACE8A
                bsr.w   sub_1AC9FC      
                tst.b   d1
                beq.s   loc_1ACE8A
                clr.w   d1
                move.b  d0,d1
                addi.w  #$5A,d1 
                jsr     j_SetFlag
loc_1ACE8A:
                
                move.w  (a0),d1
                bset    d0,d1
                move.w  d1,(a0)
                addi.w  #1,d0
                dbf     d2,loc_1ACE68
                move.w  d7,d0
                jsr     j_GetEnemyAISetting36
                cmpi.w  #$F,d1
                bne.s   loc_1ACEB0
                cmpi.w  #$F,d2
                bne.s   loc_1ACEB0
                bra.w   loc_1ACF2A
loc_1ACEB0:
                
                move.b  d0,d7
                move.b  d2,d6
                move.b  d1,d5
                cmpi.b  #$F,d5
                bne.s   loc_1ACEC0
                bra.w   loc_1ACEF0
loc_1ACEC0:
                
                clr.w   d1
                move.b  d5,d1
                addi.w  #$5A,d1 
                jsr     j_CheckFlag
                bne.s   loc_1ACED4
                bra.w   loc_1ACEF0
loc_1ACED4:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetCharacterWord34
                andi.w  #$FFFE,d1
                bset    #0,d1
                jsr     j_SetCharacterWord34
                bra.w   loc_1ACF2A
loc_1ACEF0:
                
                cmpi.b  #$F,d6
                bne.s   loc_1ACEFA
                bra.w   loc_1ACF2A
loc_1ACEFA:
                
                clr.w   d1
                move.b  d6,d1
                addi.w  #$5A,d1 
                jsr     j_CheckFlag
                bne.s   loc_1ACF0E
                bra.w   loc_1ACF2A
loc_1ACF0E:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetCharacterWord34
                andi.w  #$FFFC,d1
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetCharacterWord34
loc_1ACF2A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function UpdateTriggeredRegionsAndAI


; =============== S U B R O U T I N E =======================================

; adds respawning enemy #s to target list in RAM


GetListOfSpawningEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  #$20,d7 
                move.w  #$80,d4 
                move.w  d4,d0
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d5
loc_1ACF44:
                
                jsr     j_GetCharacterWord34
                andi.w  #$F00,d1
                tst.w   d1
                bne.s   loc_1ACF56      
                bra.w   loc_1ACFEA
loc_1ACF56:
                
                cmpi.w  #$200,d1        ; 0x200 - region-triggered spawn - check if triggered and if not spawned yet
                bne.w   loc_1ACF92      
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   loc_1ACF6A
                bra.w   loc_1ACFEA
loc_1ACF6A:
                
                move.w  d4,d0
                jsr     j_GetMaxHP
                tst.w   d1
                beq.s   loc_1ACF7A
                bra.w   loc_1ACFEA
loc_1ACF7A:
                
                move.w  d4,d0
                jsr     j_GetCharacterWord34
                bsr.w   UpdateEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACF92:
                
                cmpi.w  #$100,d1        ; 0x100 - respawn - check if dead
                bne.w   loc_1ACFC0      
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   loc_1ACFA8
                bra.w   loc_1ACFEA
loc_1ACFA8:
                
                move.w  d4,d0
                jsr     j_GetCharacterWord34
                bsr.w   UpdateEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACFC0:
                
                cmpi.w  #$300,d1        ; 0x300 - region-triggered respawn - check if dead and triggered
                bne.s   loc_1ACFEA
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   loc_1ACFD2
                bra.w   loc_1ACFEA
loc_1ACFD2:
                
                move.w  d4,d0
                jsr     j_GetCharacterWord34
                bsr.w   UpdateEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACFEA:
                
                addi.w  #1,d4
                move.w  d4,d0
                subq.w  #1,d7
                bne.w   loc_1ACF44
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d5,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetListOfSpawningEnemies


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D4 = character index (same as D0)
; 
; Out: D0 = 0000 if activated and dead, $FFFF if not


UpdateEnemyActivationIfDead:
                
                movem.l d1-a6,-(sp)
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   loc_1AD014
                bra.w   loc_1AD07E
loc_1AD014:
                
                jsr     j_GetEnemyAISetting36
                cmpi.b  #$F,d1
                beq.s   loc_1AD044
                move.w  d1,d6
                addi.w  #$5A,d1 
                jsr     j_CheckFlag
                beq.s   loc_1AD044
                move.w  d4,d0
                jsr     j_GetCharacterWord34
                bset    #0,d1
                jsr     j_SetCharacterWord34
                bra.w   loc_1AD088
loc_1AD044:
                
                move.w  d4,d0
                jsr     j_GetEnemyAISetting36
                cmpi.b  #$F,d2
                beq.w   loc_1AD07E
                move.w  d2,d6
                move.w  d2,d1
                addi.w  #$5A,d1 
                jsr     j_CheckFlag
                beq.s   loc_1AD07E
                move.w  d4,d0
                jsr     j_GetCharacterWord34
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetCharacterWord34
                bra.w   loc_1AD088
loc_1AD07E:
                
                move.w  #$FFFF,d0
                movem.l (sp)+,d1-a6
                rts
loc_1AD088:
                
                clr.w   d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function UpdateEnemyActivationIfDead


; =============== S U B R O U T I N E =======================================


GetRandomValueSigned:
                
                movem.l d0-d5/a0-a6,-(sp)
                lea     (RANDOM_WAITING_FOR_INPUT).l,a0
                clr.w   d7
                move.b  (a0),d7
                ext.w   d7
                mulu.w  #$21D,d7
                addi.w  #$3039,d7
                andi.w  #$FF,d7
                move.b  d7,(a0)
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GetRandomValueSigned


; =============== S U B R O U T I N E =======================================


RandomUnderD6:
                
                movem.l d0-d5/a0-a6,-(sp)
                move.b  d6,d1
loc_1AD0BA:
                
                bsr.s   GetRandomValueSigned
                cmpi.b  #1,d1
                beq.s   loc_1AD0C4
                bpl.s   loc_1AD0C8
loc_1AD0C4:
                
                bra.w   loc_1AD0D4
loc_1AD0C8:
                
                cmp.b   d1,d7
                bcs.s   loc_1AD0CE
                bra.s   loc_1AD0BA
loc_1AD0CE:
                
                movem.l (sp)+,d0-d5/a0-a6
                rts
loc_1AD0D4:
                
                clr.b   d7
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function RandomUnderD6


; =============== S U B R O U T I N E =======================================


LoadBattleTerrainData:
                
                movem.l d0-d6/a0-a5,-(sp)
                conditionalPc lea,pt_BattleTerrainData,a0
                nop
                lea     ((CURRENT_BATTLE-$1000000)).w,a1
                clr.l   d1
                move.b  (a1),d1
                lsl.l   #2,d1
                movea.l (a0,d1.w),a0
                lea     (BATTLE_TERRAIN).l,a1
                jsr     (LoadCompressedData).w
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function LoadBattleTerrainData

