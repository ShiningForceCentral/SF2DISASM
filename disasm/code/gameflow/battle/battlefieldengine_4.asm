
; ASM FILE code\gameflow\battle\battlefieldengine_4.asm :
; 0xD3CA..0xD824 : Battlefield engine

; =============== S U B R O U T I N E =======================================


sub_D3CA:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentMP
                move.w  d1,d2
                jsr     GetMaxMP
                bra.w   loc_D3FC

    ; End of function sub_D3CA


; =============== S U B R O U T I N E =======================================


sub_D3E0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxMP
                bra.w   loc_D3FC

    ; End of function sub_D3E0


; =============== S U B R O U T I N E =======================================


sub_D3F0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMP
loc_D3FC:
                
                mulu.w  #3,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D3F0


; =============== S U B R O U T I N E =======================================

; Out: D1 = 0 if normal, 1 if hard, 2 if super, 3 if ouch


GetDifficulty:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d2
                move.w  #FLAG_INDEX_DIFFICULTY1,d1
                bsr.w   CheckFlag
                beq.s   loc_D41C
                move.w  #1,d2
loc_D41C:
                
                move.w  #FLAG_INDEX_DIFFICULTY2,d1
                bsr.w   CheckFlag
                beq.s   loc_D428
                addq.w  #2,d2
loc_D428:
                
                move.w  d2,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetDifficulty


; =============== S U B R O U T I N E =======================================

var_2 = -2
var_1 = -1

sub_D430:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-2
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetCurrentTerrainType
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_D454
                clr.w   d1
                bra.s   loc_D458
loc_D454:
                
                move.b  #$FF,d1
loc_D458:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_D430


; =============== S U B R O U T I N E =======================================

; AI: cast ATTACK spell


sub_D460:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_ATTACK,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D47C
                bra.w   loc_D4DA
loc_D47C:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
loc_D48E:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D48E
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
loc_D4AE:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
loc_D4B4:
                
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   CreateTargetGrid
                bsr.w   sub_D7AA
                tst.w   d1
                beq.s   loc_D4D0
                move.b  d1,(a0,d5.w)
                move.b  d0,(a4,d5.w)
                addi.w  #1,d5
loc_D4D0:
                
                addi.w  #1,d4
                dbf     d6,loc_D4AE
                move.w  d5,(a3)
loc_D4DA:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_D460


; =============== S U B R O U T I N E =======================================

; AI: cast BOOST 2 spell


sub_D4E0:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D4FC
                bra.w   loc_D55A
loc_D4FC:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
loc_D50E:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D50E
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
loc_D52E:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   CreateTargetGrid
                bsr.w   sub_D742
                tst.w   d1
                beq.s   loc_D550
                move.b  d1,(a0,d5.w)
                move.b  d0,(a4,d5.w)
                addi.w  #1,d5
loc_D550:
                
                addi.w  #1,d4
                dbf     d6,loc_D52E
                move.w  d5,(a3)
loc_D55A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_D4E0


; =============== S U B R O U T I N E =======================================

; AI: cast DISPEL spell


sub_D560:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_DISPEL,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D57C
                bra.w   loc_D626
loc_D57C:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                lea     ((TARGETS_LIST-$1000000)).w,a4
loc_D592:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  #SPELL_DISPEL,d1
                bsr.w   CreateTargetGrid
                bsr.w   sub_D6F2
                move.b  d1,(a2)+
                dbf     d5,loc_D592
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
loc_D5BA:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D5BA
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
loc_D5E2:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #2,d0
                blt.s   loc_D5FE
                move.b  d0,(a5,d4.w)
                move.b  (a4,d3.w),d0
                move.b  d0,(a1,d4.w)
                addi.w  #1,d4
loc_D5FE:
                
                addi.w  #1,d3
                dbf     d5,loc_D5E2
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   loc_D614
                bra.w   loc_D626
loc_D614:
                
                subi.w  #1,d4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
loc_D620:
                
                move.b  (a0)+,(a1)+
                dbf     d4,loc_D620
loc_D626:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_D560


; =============== S U B R O U T I N E =======================================

; AI: cast MUDDLE 2 spell


sub_D62C:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_MUDDLE|SPELL_LV2,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D648
                bra.w   loc_D6EC
loc_D648:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
loc_D65A:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  #SPELL_MUDDLE|SPELL_LV2,d1
                bsr.w   CreateTargetGrid
                move.w  (a3),d2
                move.b  d2,(a2)+
                dbf     d5,loc_D65A
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
loc_D680:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D680
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
loc_D6A8:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #3,d0
                blt.s   loc_D6C4
                move.b  d0,(a5,d4.w)
                move.b  (a4,d3.w),d0
                move.b  d0,(a1,d4.w)
                addi.w  #1,d4
loc_D6C4:
                
                addi.w  #1,d3
                dbf     d5,loc_D6A8
loc_D6CC:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   loc_D6DA
                bra.w   loc_D6EC
loc_D6DA:
                
                subi.w  #1,d4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
loc_D6E6:
                
                move.b  (a0)+,(a1)+
                dbf     d4,loc_D6E6
loc_D6EC:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_D62C


; =============== S U B R O U T I N E =======================================


sub_D6F2:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
                move.w  (a0),d7
                subi.w  #1,d7
                clr.w   d6
                clr.w   d5
loc_D708:
                
                clr.w   d0
                move.b  (a1,d5.w),d0
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   loc_D722
                addi.w  #1,d6
                bra.w   loc_D732
loc_D722:
                
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   loc_D732
                addi.w  #1,d6
loc_D732:
                
                addi.w  #1,d5
                dbf     d7,loc_D708
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_D6F2


; =============== S U B R O U T I N E =======================================


sub_D742:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                clr.w   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                clr.w   d5
                move.w  (a3),d6
                tst.w   d6
                bne.s   loc_D760
                bra.w   loc_D7A2
loc_D760:
                
                subi.w  #1,d6
loc_D764:
                
                clr.w   d0
                move.b  (a0,d4.w),d0
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   loc_D792
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                move.b  (a2,d0.w),d2
                cmpi.b  #$FF,d2
                beq.s   loc_D792
                move.w  d2,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                beq.s   loc_D792
                addi.w  #1,d5
loc_D792:
                
                addi.w  #1,d4
                dbf     d6,loc_D764
                cmpi.w  #2,d5
                bge.s   loc_D7A2
                clr.w   d5
loc_D7A2:
                
                move.w  d5,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_D742


; =============== S U B R O U T I N E =======================================


sub_D7AA:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                move.w  (a3),d6
                tst.w   d6
                bne.s   loc_D7C8
                bra.w   loc_D81C
loc_D7C8:
                
                subi.w  #1,d6
loc_D7CC:
                
                clr.w   d0
                move.b  (a0,d4.w),d0
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   loc_D814
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                move.b  (a2,d0.w),d2
                cmpi.b  #$FF,d2
                beq.s   loc_D814
                move.w  d2,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                beq.s   loc_D814
                move.b  (a0,d4.w),d0
                bsr.w   GetCurrentATT
                move.w  #$FF,d0
                sub.w   d1,d0
                add.w   d0,d5
                cmpi.w  #$FF,d5
                addi.w  #1,d5
                ble.s   loc_D814
                move.w  #$FF,d5
loc_D814:
                
                addi.w  #1,d4
                dbf     d6,loc_D7CC
loc_D81C:
                
                move.w  d5,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_D7AA

