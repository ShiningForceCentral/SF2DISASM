
; ASM FILE code\gameflow\battle\battlefieldengine_3.asm :
; 0xD8F4..0xDEFC : Battlefield engine
byte_D8F4:      dc.b $FF                ; related to move types
                dc.b $C
                dc.b $B
                dc.b $A
                dc.b 9
                dc.b 8
                dc.b 6
                dc.b 5
                dc.b 4
                dc.b 3
                dc.b 2
                dc.b 1
                dc.b 7
byte_D901:      dc.b 0
                dc.b $C
                dc.b 3
                dc.b $12
                dc.b $11
                dc.b 4
                dc.b $13
                dc.b $14
                dc.b 6
                dc.b 9
                dc.b $17
                dc.b $E
                dc.b $1A
                dc.b $A
                dc.b $1B
                dc.b 5
                dc.b 8
                dc.b $15
                dc.b $19
                dc.b $16
                dc.b 7
                dc.b $18
                dc.b 1
                dc.b $D
                dc.b $1D
                dc.b 2
                dc.b $1F
                dc.b $10
                dc.b $F
                dc.b $1E
                dc.b $B
                dc.b $1C
byte_D921:      dc.b 0
                dc.b $C
                dc.b $B
                dc.b $1C
                dc.b $1E
                dc.b 2
                dc.b $F
                dc.b $10
                dc.b $1F
                dc.b $1D
                dc.b 1
                dc.b $D
                dc.b 7
                dc.b $18
                dc.b 8
                dc.b 5
                dc.b $16
                dc.b $19
                dc.b $15
                dc.b $A
                dc.b $1B
                dc.b 3
                dc.b $11
                dc.b $12
                dc.b 4
                dc.b $14
                dc.b $13
                dc.b 9
                dc.b 6
                dc.b $1A
                dc.b $E
                dc.b $17
byte_D941:      dc.b 6
                dc.b 9
                dc.b $17
                dc.b $E
                dc.b $1A
                dc.b 3
                dc.b $12
                dc.b $11
                dc.b 4
                dc.b $13
                dc.b $14
                dc.b 0
                dc.b $C
                dc.b $A
                dc.b $1B
                dc.b 5
                dc.b 8
                dc.b $15
                dc.b $19
                dc.b $16
                dc.b 7
                dc.b $18
                dc.b 1
                dc.b $D
                dc.b $1D
                dc.b 2
                dc.b $1F
                dc.b $10
                dc.b $F
                dc.b $1E
                dc.b $B
                dc.b $1C
byte_D961:      dc.b 0
                dc.b $C
                dc.b 3
                dc.b $12
                dc.b $11
                dc.b 4
                dc.b $13
                dc.b $14
                dc.b 2
                dc.b $1F
                dc.b $10
                dc.b $F
                dc.b $1E
                dc.b 7
                dc.b $18
                dc.b 1
                dc.b $D
                dc.b $1D
                dc.b $B
                dc.b $1C
                dc.b 6
                dc.b 9
                dc.b $17
                dc.b $E
                dc.b $1A
                dc.b $A
                dc.b $1B
                dc.b 5
                dc.b 8
                dc.b $15
                dc.b $19
                dc.b $16
                dc.b $FF
off_D982:       dc.l byte_D901          ; related to move type
                dc.l byte_D901
                dc.l byte_D901
                dc.l byte_D901
                dc.l byte_D901
                dc.l byte_D961
                dc.l byte_D961
                dc.l byte_D901
off_D9A2:       dc.l byte_D941
                dc.l byte_D941
                dc.l byte_D921
                dc.l byte_D921
                dc.l byte_D901
                dc.l byte_D901
                dc.l byte_D901
                dc.l byte_D901
off_D9C2:       dc.l byte_DA02          ; Gives values from Upper Move Type and Class
                dc.l byte_DA02
                dc.l byte_DA02
                dc.l byte_DA02
                dc.l byte_DA02
                dc.l byte_DA62
                dc.l byte_DA62
                dc.l byte_DA02
                dc.l byte_DA42
                dc.l byte_DA42
                dc.l byte_DA22
                dc.l byte_DA22
                dc.l byte_DA02
                dc.l byte_DA02
off_D9FA:       dc.l byte_DA02
                dc.l byte_DA02
byte_DA02:      dc.b 4
                dc.b 1
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b 4
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
byte_DA22:      dc.b 3
                dc.b 1
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 2
                dc.b 3
                dc.b 3
byte_DA42:      dc.b 3
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b 1
                dc.b 4
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
byte_DA62:      dc.b 3
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2

; =============== S U B R O U T I N E =======================================

var_64 = -64
var_63 = -63

MakeRangeLists:
                
                movem.l d0-a5,-(sp)
                link    a6,#-64
                lea     (a6),a1
                move.w  #$F,d5
                move.l  #$40004000,d1
loc_DA96:
                
                move.l  d1,-(a1)
                dbf     d5,loc_DA96
                lea     (a3),a1
                move.w  #$8F,d5 
                moveq   #$FFFFFFFF,d1
loc_DAA4:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,loc_DAA4
                lea     (a2),a1
                move.w  #$8F,d5 
                moveq   #$FFFFFFFF,d1
loc_DAB8:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,loc_DAB8
                clr.w   d6
                moveq   #0,d5
                move.b  d4,d5
                mulu.w  #$30,d5 
                andi.w  #$FF,d3
                add.w   d3,d5
loc_DAD4:
                
                move.b  d6,(a2,d5.w)
                move.w  d6,d1
                lsr.w   #8,d1
                move.b  d1,(a3,d5.w)
                tst.b   1(a3,d5.w)
                bpl.s   loc_DAEC
                addq.w  #1,d5
                bsr.s   sub_DB48
                subq.w  #1,d5
loc_DAEC:
                
                tst.b   -1(a3,d5.w)
                bpl.s   loc_DAF8
                subq.w  #1,d5
                bsr.s   sub_DB48
                addq.w  #1,d5
loc_DAF8:
                
                tst.b   -$30(a3,d5.w)
                bpl.s   loc_DB08
                subi.w  #$30,d5 
                bsr.s   sub_DB48
                addi.w  #$30,d5 
loc_DB08:
                
                tst.b   $30(a3,d5.w)
                bpl.s   loc_DB18
                addi.w  #$30,d5 
                bsr.s   sub_DB48
                subi.w  #$30,d5 
loc_DB18:
                
                move.w  d0,d1
                andi.w  #$1F,d1
                add.w   d1,d1
                move.w  var_64(a6,d1.w),d5
                btst    #$E,d5
                bne.s   loc_DB38
                move.b  (a3,d5.w),var_64(a6,d1.w)
                move.b  (a2,d5.w),var_63(a6,d1.w)
                bra.s   loc_DAD4
loc_DB38:
                
                addq.w  #1,d6
                subq.w  #1,d0
                bmi.s   loc_DB40
                bne.s   loc_DB18
loc_DB40:
                
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function MakeRangeLists


; =============== S U B R O U T I N E =======================================

var_64 = -64
var_63 = -63

sub_DB48:
                
                cmpi.w  #$900,d5
                bcs.s   loc_DB50
                rts
loc_DB50:
                
                move.b  (a4,d5.w),d1
                btst    #7,d1
                beq.s   loc_DB5C
                rts
loc_DB5C:
                
                andi.w  #$1F,d1
                move.b  (a5,d1.w),d2
                ext.w   d2
                cmp.w   d2,d0
                bcc.s   loc_DB6C
                rts
loc_DB6C:
                
                beq.s   loc_DB8A
                move.w  d0,d1
                sub.w   d2,d1
                andi.w  #$1F,d1
                add.w   d1,d1
                move.b  var_64(a6,d1.w),(a3,d5.w)
                move.b  var_63(a6,d1.w),(a2,d5.w)
                move.w  d5,var_64(a6,d1.w)
                rts
loc_DB8A:
                
                add.w   d6,d2
                move.b  d2,(a2,d5.w)
                move.w  d2,d1
                lsr.w   #8,d1
                move.b  d1,(a3,d5.w)
                rts

    ; End of function sub_DB48


; =============== S U B R O U T I N E =======================================


MakeBattleEntityCancelMoveString_0:
                
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   sub_DBA8
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function MakeBattleEntityCancelMoveString_0


; =============== S U B R O U T I N E =======================================


sub_DBA8:
                
                clr.w   d2
                move.b  d1,d2
                mulu.w  #$30,d2 
                andi.w  #$FF,d0
                add.w   d0,d2
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                clr.b   d3
loc_DBBC:
                
                move.b  (a3,d2.w),d4
                lsl.w   #8,d4
                move.b  (a2,d2.w),d4
                tst.w   d4
                bne.s   loc_DBCE
                bra.w   loc_DD0A
loc_DBCE:
                
                subq.w  #1,d4
                clr.b   d5
                clr.b   d0
                addq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DBE8
                bra.w   loc_DBFA
loc_DBE8:
                
                cmp.w   d4,d0
                bmi.s   loc_DBEE
                bne.s   loc_DBFA
loc_DBEE:
                
                cmpi.w  #$900,d2
                bcc.s   loc_DBFA
                bset    #0,d5
                move.w  d0,d4
loc_DBFA:
                
                subq.w  #1,d2
                clr.b   d0
                subq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC12
                bra.w   loc_DC2E
loc_DC12:
                
                cmp.w   d4,d0
                bmi.s   loc_DC18
                bne.s   loc_DC2E
loc_DC18:
                
                cmpi.w  #$900,d2
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
                subi.w  #$30,d2 
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC48
                bra.w   loc_DC64
loc_DC48:
                
                cmp.w   d4,d0
                bmi.s   loc_DC4E
                bne.s   loc_DC64
loc_DC4E:
                
                cmpi.w  #$900,d2
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
                
                addi.w  #$30,d2 
                clr.b   d0
                addi.w  #$30,d2 
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DC80
                bra.w   loc_DC9C
loc_DC80:
                
                cmp.w   d4,d0
                bmi.s   loc_DC86
                bne.s   loc_DC9C
loc_DC86:
                
                cmpi.w  #$900,d2
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
                
                subi.w  #$30,d2 
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
                subi.w  #$30,d2 
                bra.w   loc_DD04
loc_DCF2:
                
                moveq   #2,d5
                moveq   #4,d3
                subq.w  #1,d2
                bra.w   loc_DD04
loc_DCFC:
                
                moveq   #3,d5
                moveq   #8,d3
                addi.w  #$30,d2 
loc_DD04:
                
                move.b  d5,(a0)+
                bra.w   loc_DBBC
loc_DD0A:
                
                move.b  #$FF,(a0)
                rts

    ; End of function sub_DBA8


; =============== S U B R O U T I N E =======================================


sub_DD10:
                
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   sub_DBA8
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1
                move.w  a0,d0
                move.w  a1,d1
                sub.w   d1,d0
                bne.s   loc_DD28
                bra.w   loc_DD5A
loc_DD28:
                
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
                bra.w   loc_DD5A
loc_DD48:
                
                eori.b  #2,d0
                move.b  d0,(a1)
                suba.w  #1,a0
                adda.w  #1,a1
                dbf     d2,loc_DD36
loc_DD5A:
                
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function sub_DD10


; =============== S U B R O U T I N E =======================================

; unused


AddAllToStack:
                
                movem.l d0-a5,-(sp)
                movem.l (sp)+,d0-a5
                rts

    ; End of function AddAllToStack


; =============== S U B R O U T I N E =======================================


j_makeEnemyMoveOrder:
                
                movem.l d0-d6/a0-a5,-(sp)
                bsr.w   MakeEnemyMoveOrder
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function j_makeEnemyMoveOrder


; =============== S U B R O U T I N E =======================================

; create enemy move order from movecost lists


MakeEnemyMoveOrder:
                
                clr.w   d2
                move.b  d1,d2
                mulu.w  #$30,d2 
                andi.w  #$FF,d0
                add.w   d0,d2
                move.b  (a3,d2.w),d6
                lsl.w   #8,d6
                move.b  (a2,d2.w),d6
                ext.w   d3
                sub.w   d3,d6
                tst.w   d6
                bpl.s   loc_DD9A
                clr.w   d6
loc_DD9A:
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                clr.b   d3
loc_DDA0:
                
                move.b  (a3,d2.w),d4
                lsl.w   #8,d4
                move.b  (a2,d2.w),d4
                cmp.w   d4,d6
                bcs.s   loc_DDB2
                bra.w   loc_DEF6
loc_DDB2:
                
                tst.w   d4
                bne.s   loc_DDBA
                bra.w   loc_DEF6
loc_DDBA:
                
                subq.w  #1,d4
                clr.b   d5
                clr.b   d0
                addq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DDD4
                bra.w   loc_DDE6
loc_DDD4:
                
                cmp.w   d4,d0
                bmi.s   loc_DDDA
                bne.s   loc_DDE6
loc_DDDA:
                
                cmpi.w  #$900,d2
                bcc.s   loc_DDE6
                bset    #0,d5
                move.w  d0,d4
loc_DDE6:
                
                subq.w  #1,d2
                clr.b   d0
                subq.w  #1,d2
                move.b  (a3,d2.w),d0
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DDFE
                bra.w   loc_DE1A
loc_DDFE:
                
                cmp.w   d4,d0
                bmi.s   loc_DE04
                bne.s   loc_DE1A
loc_DE04:
                
                cmpi.w  #$900,d2
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
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DE34
                bra.w   loc_DE50
loc_DE34:
                
                cmp.w   d4,d0
                bmi.s   loc_DE3A
                bne.s   loc_DE50
loc_DE3A:
                
                cmpi.w  #$900,d2
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
                lsl.w   #8,d0
                move.b  (a2,d2.w),d0
                tst.w   d0
                bpl.s   loc_DE6C
                bra.w   loc_DE88
loc_DE6C:
                
                cmp.w   d4,d0
                bmi.s   loc_DE72
                bne.s   loc_DE88
loc_DE72:
                
                cmpi.w  #$900,d2
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
                
                bra.w   loc_DEF6
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
                bra.w   loc_DDA0
loc_DEF6:
                
                move.b  #$FF,(a0)
                rts

    ; End of function MakeEnemyMoveOrder

