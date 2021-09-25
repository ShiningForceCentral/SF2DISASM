
; ASM FILE code\gameflow\battle\aiengine.asm :
; 0xDEFC..0xF9B4 : AI engine

; =============== S U B R O U T I N E =======================================

; related to AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
; 
;     In: D0 = combatant index


sub_DEFC:
                
                movem.l d0-a5,-(sp)
                move.w  d0,d7
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_DF10
                move.w  #6,d5
                bra.w   loc_E076
loc_DF10:
                
                bsr.w   GetLowerMoveType
                cmpi.b  #$F,d1
                beq.s   loc_DF1E
                bra.w   loc_DFA2
loc_DF1E:
                
                bsr.w   GetMaxHP
                move.w  d1,d2
                bsr.w   GetCurrentHP
                cmp.w   d2,d1
                beq.s   loc_DF30
                bra.w   loc_DFA2
loc_DF30:
                
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                clr.w   d6
                move.b  (a0),d6
                lea     byte_E25B(pc), a0
                nop
                clr.w   d2
                move.b  (a0),d2
                subi.w  #1,d2
                clr.w   d0
                adda.w  #1,a0
loc_DF4C:
                
                move.b  (a0,d0.w),d1
                cmp.b   d1,d6
                bne.s   loc_DF58
                bra.w   loc_DF64
loc_DF58:
                
                addi.w  #1,d0
                dbf     d2,loc_DF4C
                bra.w   loc_DFA2
loc_DF64:
                
                lea     off_E260(pc), a0
                nop
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                clr.w   d5
                move.b  d7,d5
                andi.b  #$7F,d5 
                move.b  (a0,d5.w),d0
                tst.b   d0
                bne.s   loc_DF84
                bra.w   loc_DFA2
loc_DF84:
                
                bsr.w   sub_E0B6
                cmp.b   d1,d0
                ble.s   loc_DFA2
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_E0AA
loc_DFA2:
                
                lea     (byte_FFB20C).l,a0
                move.w  #0,(a0)
                move.w  d7,d0
                bsr.w   GetEnemyAISetting36
                cmpi.w  #$F,d1
                bne.s   loc_DFC2
                cmpi.w  #$F,d2
                bne.s   loc_DFC2
                bra.w   loc_DFE6
loc_DFC2:
                
                move.w  d7,d0
                bsr.w   GetCharacterWord34
                move.w  d1,d4
                andi.w  #3,d1
                btst    #0,d1
                bne.s   loc_DFE6
                bsr.w   sub_F522
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #3,(a0)
                bra.w   loc_E0AA
loc_DFE6:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   loc_E01C
                bsr.w   GetEnemyIndex   
                cmpi.w  #ENEMY_PRISM_FLOWER,d1 ; check if Prism Flower
                bne.s   loc_E000        
                bsr.w   HandleLineAttackerAI
                bra.w   loc_E0AA
loc_E000:
                
                cmpi.w  #ENEMY_ZEON_GUARD,d1 ; check if Zeon Guard
                bne.s   loc_E00E        
                bsr.w   HandleLineAttackerAI
                bra.w   loc_E0AA
loc_E00E:
                
                cmpi.w  #ENEMY_BURST_ROCK,d1 ; check if Burst Rock
                bne.s   loc_E01C
                bsr.w   HandleExploderAI
                bra.w   loc_E0AA
loc_E01C:
                
                move.w  d7,d0
                bsr.w   GetEnemyAISetting3233
                cmpi.w  #$FF,d1
                beq.s   loc_E048
                btst    #6,d1
                bne.s   loc_E048
                move.w  d1,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_E048
                move.w  d7,d0
                bsr.w   GetEnemyAISetting3233
                move.w  d2,d1
                move.w  #$FF,d2
                bsr.w   SetKills        
loc_E048:
                
                move.w  d7,d0
                bsr.w   GetLowerMoveType
                move.w  d1,d5
                lea     word_E249(pc), a0
                nop
                move.b  (a0,d1.w),d6
                tst.b   d6
                beq.s   loc_E076
                cmpi.b  #1,d6
                bne.s   loc_E06A
                jsr     j_GetMoveListForEnemyTarget
loc_E06A:
                
                cmpi.b  #2,d6
                bne.s   loc_E076
                jsr     sub_1AC030      
loc_E076:
                
                move.w  d5,d1
                lea     off_E1AC(pc), a0
                nop
                lsl.l   #2,d1
                movea.l (a0,d1.w),a1
                clr.w   d2
                move.b  (a1),d2
                adda.w  #1,a1
                subi.b  #1,d2
loc_E090:
                
                clr.w   d1
                move.b  (a1),d1
                move.b  d7,d0
                bsr.w   HandleEnemyAICommand
                tst.b   d1
                bne.s   loc_E0A2
                bra.w   loc_E0AA
loc_E0A2:
                
                adda.w  #1,a1
                dbf     d2,loc_E090
loc_E0AA:
                
                jsr     j_ClearTerrainListObstructions
                movem.l (sp)+,d0-a5
                rts

    ; End of function sub_DEFC


; =============== S U B R O U T I N E =======================================


sub_E0B6:
                
                movem.l d0/d2-a6,-(sp)
                move.w  #BATTLESPRITESET_SUBSECTION_ALLIES,d1
                jsr     j_GetBattleSpriteSetSubsection
                move.w  d1,d2
                subi.w  #2,d2
                clr.w   d0
                move.w  #$80,d0 
                clr.w   d3
loc_E0D2:
                
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_E0DE
                addi.w  #1,d3
loc_E0DE:
                
                addi.w  #1,d0
                dbf     d2,loc_E0D2
                move.w  d3,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_E0B6


; =============== S U B R O U T I N E =======================================


HandleLineAttackerAI:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                bsr.w   MakeTargetListAllies
                move.w  d7,d0
                jsr     sub_1AC05C      
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   loc_E12C
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #6,(a0)
                lea     ((TARGETS_LIST-$1000000)).w,a1
                clr.w   d1
                move.b  ((TARGETS_LIST-$1000000)).w,d1
                move.w  d1,2(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.s   loc_E13E
loc_E12C:
                
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
loc_E132:
                
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
loc_E13E:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function HandleLineAttackerAI


; =============== S U B R O U T I N E =======================================


HandleExploderAI:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d5
                bsr.w   MakeTargetListAllies
                move.w  #SPELL_B_ROCK,d1 ; Burst Rock spell
                bsr.w   CreateTargetGridFromSpell
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   loc_E190
                move.w  #6,d6
                jsr     j_RandomUnderD6
                cmpi.b  #4,d7
                bne.s   loc_E190
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #4,(a0)
                move.w  #$19,2(a0)
                move.w  d5,4(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_E1A6
loc_E190:
                
                move.w  d5,d0
                move.w  #$B,d1
                clr.w   d7
                bsr.w   HandleEnemyAICommand
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #3,(a0)
loc_E1A6:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function HandleExploderAI

off_E1AC:       dc.l byte_E1EC
                dc.l byte_E1F2
                dc.l byte_E1F9
                dc.l byte_E200
                dc.l byte_E207
                dc.l byte_E20E
                dc.l byte_E215
                dc.l byte_E21B
                dc.l byte_E222
                dc.l byte_E229
                dc.l byte_E227
                dc.l byte_E227
                dc.l byte_E231
                dc.l byte_E239
                dc.l byte_E239
                dc.l byte_E241
byte_E1EC:      dc.b 5
                dc.b 0
                dc.b 7
                dc.b 3
                dc.b $B
                dc.b $E
byte_E1F2:      dc.b 6
                dc.b $A
                dc.b 0
                dc.b 7
                dc.b 3
                dc.b $C
                dc.b $E
byte_E1F9:      dc.b 6
                dc.b 1
                dc.b $12
                dc.b 7
                dc.b 5
                dc.b $C
                dc.b $E
byte_E200:      dc.b 6
                dc.b 1
                dc.b $12
                dc.b 7
                dc.b 5
                dc.b $B
                dc.b $E
byte_E207:      dc.b 6
                dc.b 2
                dc.b $13
                dc.b 7
                dc.b 4
                dc.b $D
                dc.b $E
byte_E20E:      dc.b 6
                dc.b 2
                dc.b $13
                dc.b 7
                dc.b 4
                dc.b $D
                dc.b $E
byte_E215:      dc.b 5
                dc.b 3
                dc.b 0
                dc.b 7
                dc.b $B
                dc.b $E
byte_E21B:      dc.b 6
                dc.b $A
                dc.b 3
                dc.b 0
                dc.b 7
                dc.b $B
                dc.b $E
byte_E222:      dc.b 4
                dc.b 3
                dc.b 0
                dc.b 7
                dc.b $E
byte_E227:      dc.b 1
                dc.b $E
byte_E229:      dc.b 7
                dc.b $11
                dc.b 5
                dc.b 1
                dc.b 7
                dc.b $12
                dc.b $C
                dc.b $E
byte_E231:      dc.b 7
                dc.b $12
                dc.b 7
                dc.b 5
                dc.b 1
                dc.b $B
                dc.b $C
                dc.b $E
byte_E239:      dc.b 7
                dc.b $13
                dc.b 4
                dc.b 2
                dc.b 7
                dc.b $10
                dc.b $D
                dc.b $E
byte_E241:      dc.b 7
                dc.b $A
                dc.b 5
                dc.b 1
                dc.b 7
                dc.b $10
                dc.b $C
                dc.b $E
word_E249:      dc.w 0
                dc.b 1
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
byte_E25B:      dc.b 3
                dc.b BATTLE_VERSUS_KRAKEN
                dc.b BATTLE_HARPIES_POND
                dc.b BATTLE_CHESSBOARD
                dc.b $FF
off_E260:       dc.l byte_E26C
                dc.l byte_E277
                dc.l byte_E283
byte_E26C:      dc.b 5
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b 3
                dc.b 0
byte_E277:      dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
byte_E283:      dc.b 0
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 1
                dc.b 3
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 6
                dc.b 6
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b $FF

; =============== S U B R O U T I N E =======================================


HandleEnemyAICommand:
                
                movem.l d0/d2-a5,-(sp)
                cmpi.b  #0,d1
                bne.s   loc_E2AA
                move.w  #0,d1
                bsr.w   sub_E3EE
                bra.w   loc_E3E8
loc_E2AA:
                
                cmpi.b  #1,d1
                bne.s   loc_E2BC
                move.w  #1,d1
                bsr.w   sub_E3EE
                bra.w   loc_E3E8
loc_E2BC:
                
                cmpi.b  #2,d1
                bne.s   loc_E2CE
                move.w  #2,d1
                bsr.w   sub_E3EE
                bra.w   loc_E3E8
loc_E2CE:
                
                cmpi.b  #3,d1
                bne.s   loc_E2E0
                move.w  #0,d1
                bsr.w   sub_E78C
                bra.w   loc_E3E8
loc_E2E0:
                
                cmpi.b  #4,d1
                bne.s   loc_E2F2
                move.w  #2,d1
                bsr.w   sub_E78C
                bra.w   loc_E3E8
loc_E2F2:
                
                cmpi.b  #5,d1
                bne.s   loc_E304
                move.w  #1,d1
                bsr.w   sub_E78C
                bra.w   loc_E3E8
loc_E304:
                
                cmpi.b  #6,d1
                bne.s   loc_E316
                move.w  #3,d1
                bsr.w   sub_E78C
                bra.w   loc_E3E8
loc_E316:
                
                cmpi.b  #7,d1
                bne.s   loc_E32C
                move.w  #1,d1
                move.w  #0,d2
                bsr.w   sub_EBA4        
                bra.w   loc_E3E8
loc_E32C:
                
                cmpi.b  #$A,d1
                bne.s   loc_E342
                move.w  #0,d1
                move.w  #0,d2
                bsr.w   sub_E98C
                bra.w   loc_E3E8
loc_E342:
                
                cmpi.b  #$B,d1
                bne.s   loc_E354
                move.w  #0,d1
                bsr.w   sub_F1D4
                bra.w   loc_E3E8
loc_E354:
                
                cmpi.b  #$C,d1
                bne.s   loc_E366
                move.w  #1,d1
                bsr.w   sub_F1D4
                bra.w   loc_E3E8
loc_E366:
                
                cmpi.b  #$D,d1
                bne.s   loc_E378
                move.w  #2,d1
                bsr.w   sub_F1D4
                bra.w   loc_E3E8
loc_E378:
                
                cmpi.b  #$E,d1
                bne.s   loc_E394
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                clr.w   d0
                bra.w   loc_E3E8
loc_E394:
                
                cmpi.b  #$10,d1
                bne.s   loc_E3AA
                move.w  #2,d1
                move.w  #2,d2
                bsr.w   sub_E98C
                bra.w   loc_E3E8
loc_E3AA:
                
                cmpi.b  #$11,d1
                bne.s   loc_E3C0
                move.w  #1,d1
                move.w  #1,d2
                bsr.w   sub_E98C
                bra.w   loc_E3E8
loc_E3C0:
                
                cmpi.b  #$12,d1
                bne.s   loc_E3D4
                clr.w   d1
                move.w  #1,d2
                bsr.w   sub_E98C
loc_E3D0:
                
                bra.w   loc_E3E8
loc_E3D4:
                
                cmpi.b  #$13,d1
                bne.s   loc_E3E8
                clr.w   d1
                move.w  #2,d2
                bsr.w   sub_E98C
                bra.w   *+4
loc_E3E8:
                
                movem.l (sp)+,d0/d2-a5
                rts

    ; End of function HandleEnemyAICommand


; =============== S U B R O U T I N E =======================================

var_5 = -5
var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_E3EE:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                move.b  d0,var_4(a6)
                move.b  d1,var_5(a6)
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_E40A
                bra.w   loc_E776        ; skip this function if combatant is inflicted with muddle 2
loc_E40A:
                
                clr.w   d1
                move.b  var_5(a6),d1
                move.b  #$7F,var_2(a6) 
                move.b  #$3F,var_1(a6) 
                move.b  var_4(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   loc_E490
                cmpi.b  #ITEM_HEALING_RAIN,d1
                bne.s   loc_E490
                move.b  d1,var_2(a6)    ; item is Healing Rain
                move.b  d2,var_3(a6)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),var_1(a6)
                move.w  #$80,d0 
                bsr.w   IsCombatantAtLessThanHalfHP
                bcc.s   loc_E45E        
                move.b  #$7F,var_2(a6) 
                move.b  #$3F,var_1(a6) 
                bra.w   loc_E490
loc_E45E:
                
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a1 ; enemy 0 has less than half HP, and we have a healing rain, so use it
                move.w  #BATTLEACTION_USE_ITEM,(a1)
                clr.w   d0
                move.b  var_3(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_SLOT(a1)
                clr.w   d0
                move.b  var_4(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_4(a1)
                clr.w   d1
                move.b  var_2(a6),d1
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1
                move.w  #$FF,(a1)
                bra.w   loc_E782
loc_E490:
                
                move.b  var_4(a6),d0
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #$3F,d1 
                beq.s   loc_E4DA
                move.b  d1,var_1(a6)
                move.w  d1,d2
                andi.w  #$3F,d2 
                bsr.w   GetCurrentMP
                cmpi.w  #0,d2
                bne.s   loc_E4C4
                cmpi.w  #3,d1
                bge.s   loc_E4C0
                bra.w   loc_E4DA
                bra.s   loc_E4C4
loc_E4C0:
                
                bra.w   loc_E500
loc_E4C4:
                
                cmpi.w  #1,d2
                bne.s   loc_E4DA
                cmpi.w  #7,d1
                bge.s   loc_E4D6
                bra.w   loc_E4DA
                bra.s   loc_E4DA
loc_E4D6:
                
                bra.w   loc_E500
loc_E4DA:
                
                move.b  var_4(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #$7F,d1 
                bne.s   loc_E4EE
                bra.w   loc_E776
loc_E4EE:
                
                move.b  d1,var_2(a6)
                move.b  d2,var_3(a6)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),var_1(a6)
loc_E500:
                
                move.b  var_4(a6),d0
                btst    #7,d0
                beq.s   loc_E510
                bsr.w   MakeTargetListEnemies
                bra.s   loc_E514
loc_E510:
                
                bsr.w   MakeTargetListAllies
loc_E514:
                
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetListAllies
                move.b  var_4(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                clr.w   d3
                bsr.w   UpdateTargetListAllies
                lea     ((byte_FF883E-$1000000)).w,a0
                clr.w   d3
                move.b  var_4(a6),d0
                btst    #7,d0
                bne.s   loc_E546
                clr.w   d0
                move.w  #$1D,d4
                bra.s   loc_E54E
loc_E546:
                
                move.w  #$80,d0 
                move.w  #$1F,d4
loc_E54E:
                
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_E55A
                bra.w   loc_E56C
loc_E55A:
                
                bsr.w   sub_D38A
                bcc.s   loc_E564
                bra.w   loc_E56C
loc_E564:
                
                move.b  d0,(a0,d3.w)
                addi.w  #1,d3
loc_E56C:
                
                addi.w  #1,d0
                dbf     d4,loc_E54E
                lea     ((word_FF8806-$1000000)).w,a1
                move.w  d3,(a1)
                tst.b   d3
                bne.s   loc_E582
                bra.w   loc_E776
loc_E582:
                
                lea     ((byte_FF880E-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a3
                clr.w   d4
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a4
                move.w  #0,(a4)
loc_E598:
                
                clr.w   d0
                move.b  (a0,d4.w),d0
                clr.w   d1
                move.b  var_1(a6),d1
                bsr.w   CreateTargetGrid
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d5
                tst.w   d5
                bne.s   loc_E5B4
                bra.w   loc_E5E2
loc_E5B4:
                
                clr.w   d7
                clr.w   d2
                move.b  #0,(a1,d4.w)
loc_E5BE:
                
                move.b  (a3,d7.w),d0
                bsr.w   sub_CDEA
                cmpi.w  #$D,d6
                bne.s   loc_E5D4
loc_E5CC:
                
                move.b  #1,(a1,d4.w)
                addq.w  #1,(a4)
loc_E5D4:
                
                add.w   d6,d2
                addi.w  #4,d2
                addi.w  #1,d7
                subq.w  #1,d5
                bne.s   loc_E5BE
loc_E5E2:
                
                move.b  d2,(a2,d4.w)
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   loc_E598
                bra.w   *+4
                move.w  ((word_FF8806-$1000000)).w,d1
                cmpi.w  #1,d1
                bgt.s   loc_E600
                bra.w   loc_E654
loc_E600:
                
                subq.w  #2,d1
                clr.w   d2
                move.b  #0,d2
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((byte_FF895E-$1000000)).w,a1
loc_E610:
                
                tst.b   d2
                bpl.s   loc_E618
                bra.w   loc_E654
loc_E618:
                
                move.b  #$FF,d2
                clr.w   d3
loc_E61E:
                
                move.b  1(a1,d3.w),d4
                cmp.b   (a1,d3.w),d4
                ble.s   loc_E646
                move.b  1(a1,d3.w),d4
                move.b  (a1,d3.w),1(a1,d3.w)
                move.b  d4,(a1,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
loc_E646:
                
                tst.w   d1
                beq.s   loc_E650
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   loc_E61E
loc_E650:
                
                move.w  d2,d1
                bra.s   loc_E610
loc_E654:
                
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                clr.w   d6
                lea     ((byte_FF883E-$1000000)).w,a0
loc_E660:
                
                cmpi.b  #ITEM_NOTHING,var_2(a6) 
                beq.s   loc_E66C
                bra.w   loc_E6C0
loc_E66C:
                
                move.b  (a0,d6.w),d0
                move.b  var_4(a6),d1
                move.b  var_1(a6),d4
                bsr.w   sub_CD68        
                cmpi.b  #$FF,d2
                bne.s   loc_E686
                bra.w   loc_E6FC
loc_E686:
                
                tst.b   d2
                bne.s   loc_E6B0
                cmp.b   d0,d1
                beq.s   loc_E6B0
                move.b  var_4(a6),d0
                bsr.w   GetCurrentMP
                cmpi.b  #$B,d1
                blt.s   loc_E6B0
                move.b  var_1(a6),d0
                lsr.b   #6,d0
                andi.b  #3,d0
                cmpi.b  #2,d0
                blt.s   loc_E6B0
                move.b  #1,d2
loc_E6B0:
                
                move.b  var_1(a6),d0
                lsl.b   #6,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d0 
                or.b    d2,d0
                move.b  d0,var_1(a6)
loc_E6C0:
                
                clr.w   d0
                move.b  (a0,d6.w),d0
                cmpi.b  #ITEM_NOTHING,var_2(a6) 
                beq.s   loc_E6DA
                clr.w   d1
                move.b  var_2(a6),d1
                bsr.w   GetItemRange
                bra.s   loc_E6E4
loc_E6DA:
                
                clr.w   d1
                move.b  var_1(a6),d1
                bsr.w   GetSpellRange
loc_E6E4:
                
                bsr.w   GetYPos
                move.w  d1,d2
                bsr.w   GetXPos
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_E6FC
                bra.w   loc_E70A
loc_E6FC:
                
                addi.w  #1,d6
                subq.w  #1,d5
                bne.w   loc_E660
                bra.w   loc_E776
loc_E70A:
                
                move.b  d1,d0
                move.b  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (byte_FF4400).l,a3
                bsr.w   sub_DD10
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a1
                cmpi.b  #ITEM_NOTHING,var_2(a6) 
                bne.s   loc_E748
                move.w  #BATTLEACTION_CAST_SPELL,(a1)
                clr.w   d0
                move.b  var_1(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                clr.w   d0
                move.b  (a0,d6.w),d0
                move.w  d0,BATTLEACTION_OFFSET_4(a1)
                bra.s   loc_E772
loc_E748:
                
                move.w  #BATTLEACTION_USE_ITEM,(a1)
                clr.w   d0
                move.b  var_3(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_SLOT(a1)
                clr.w   d0
                move.b  (a0,d6.w),d0
                move.w  d0,BATTLEACTION_OFFSET_4(a1)
                clr.w   d0
                move.b  var_4(a6),d0
                move.b  var_3(a6),d1
                bsr.w   GetItemAndNumberHeld
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
loc_E772:
                
                bra.w   loc_E782
loc_E776:
                
                move.w  #$FFFF,d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts
loc_E782:
                
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_E3EE


; =============== S U B R O U T I N E =======================================


sub_E78C:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d0,d7
                move.w  d1,d6
                bsr.w   sub_C958
                bsr.w   sub_EDD6
                cmpi.b  #3,d2
                bne.s   loc_E7B6
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_E97C
loc_E7B6:
                
                movem.l d0-d3,-(sp)
                move.w  d0,d1
                move.w  d7,d0
                bsr.w   sub_C27A
                tst.w   d3
                beq.s   loc_E7DE
                movem.l (sp)+,d0-d3
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #5,(a0)         ; Muddle ?
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_E984
loc_E7DE:
                
                movem.l (sp)+,d0-d3
                cmpi.b  #2,d2
                bne.w   loc_E86C
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #BATTLEACTION_USE_ITEM,(a0)
                lea     ((word_FF880A-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_SLOT(a0)
                move.w  d0,BATTLEACTION_OFFSET_4(a0)
                move.w  d7,d0
                move.w  (a1),d1
                bsr.w   GetItemAndNumberHeld
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a2
                move.w  d7,d1
                btst    #7,d1
                beq.s   loc_E81E
                andi.b  #$7F,d1 
                move.b  d0,(a2,d1.w)
loc_E81E:
                
                lea     ((word_FF880A-$1000000)).w,a1
                move.w  (a1),d1
                move.w  d7,d0
                bsr.w   GetItemAndNumberHeld
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                bsr.w   GetSpellRange
                bsr.w   MakeTargetListEverybody
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  4(a0),d0
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
                bra.w   loc_E984
loc_E86C:
                
                cmpi.b  #1,d2
                bne.s   loc_E8D0
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                lea     ((word_FF880C-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_4(a0)
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a2
                move.w  d7,d1
                btst    #7,d1
                beq.s   loc_E89A
                andi.b  #$7F,d1 
                move.b  d0,(a2,d1.w)
loc_E89A:
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0),d1
                bsr.w   GetSpellRange
                bsr.w   MakeTargetListEverybody
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
                bra.w   loc_E984
loc_E8D0:
                
                tst.b   d2
                bne.w   loc_E97C
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #0,(a0)
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a2
                move.w  d7,d1
                btst    #7,d1
                beq.s   loc_E8F6
                andi.b  #$7F,d1 
                move.b  d0,(a2,d1.w)
loc_E8F6:
                
                move.l  d0,-(sp)
                move.w  d7,d0
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   loc_E93C
                clr.l   d3
                clr.l   d4
                jsr     GetSomethingClassType
                cmpi.b  #ENEMY_KRAKEN_ARM,d1 ; BUGGED When getting Claude's class type, the previous routine 
                                        ;  returns a value in the byte area that happens to be the same
                                        ;  as the Kraken Arm's index, causing the former to perform 
                                        ;  a ranged attack when controlled by the AI.
                                        ;                                                 
                                        ; That can be fixed by using a word-sized CMPI instruction
                bne.s   loc_E922
                move.w  #2,d3
                move.w  #1,d4
                bra.w   loc_E938
loc_E922:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   loc_E934
                move.w  #3,d3
                move.w  #1,d4
                bra.w   loc_E938
loc_E934:
                
                moveq   #1,d3
                moveq   #0,d4
loc_E938:
                
                bra.w   loc_E94C
loc_E93C:
                
                jsr     GetItemDefAddress
                moveq   #0,d3
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
loc_E94C:
                
                move.l  (sp)+,d0
                bsr.w   MakeTargetListEverybody
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
                bra.w   loc_E984
loc_E97C:
                
                moveq   #$FFFFFFFF,d1
                movem.l (sp)+,d0/d2-a6
                rts
loc_E984:
                
                moveq   #0,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_E78C


; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_E98C:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                btst    #7,d0
                bne.s   loc_E9B2
                move.b  #$FF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EB7A
loc_E9B2:
                
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetCurrentMOV
                tst.b   d1
                bne.s   loc_E9DE
                move.b  #$FF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EB7A
loc_E9DE:
                
                bsr.w   GetEnemyAISetting3233
                cmpi.b  #$FF,d1
                bne.s   loc_EA00
                move.b  #$FF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EB7A
loc_EA00:
                
                move.b  d1,var_3(a6)
                btst    #6,d1
                bne.s   loc_EA2E
                clr.w   d0
                move.b  d1,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_EA2E
                move.b  #$FF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EB7A
loc_EA2E:
                
                move.b  var_2(a6),d0
                tst.b   d0
                bne.w   loc_EAE6
                move.b  var_1(a6),d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetListAllies
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                clr.w   d3
                bsr.w   UpdateTargetListAllies
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   sub_CE96
                tst.b   d1
                bne.s   loc_EA78
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                bra.w   loc_EB7A
loc_EA78:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   sub_E78C
                tst.b   d1
                bne.s   loc_EA9C
                clr.w   d1
                bra.w   loc_EB7A
loc_EA9C:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EAD4
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
                bra.s   loc_EAE2
loc_EAD4:
                
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                clr.w   d1
                bra.w   loc_EB7A
loc_EAE2:
                
                bra.w   loc_EB7A
loc_EAE6:
                
                clr.w   d0
                move.b  var_1(a6),d0
                move.b  var_2(a6),d1
                bsr.w   sub_D430
                tst.b   d1
                bne.s   loc_EB10
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                bra.w   loc_EB7A
loc_EB10:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   sub_E78C
                tst.b   d1
                bne.s   loc_EB34
                clr.w   d1
                bra.w   loc_EB7A
loc_EB34:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EB6C
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
                bra.s   loc_EB7A
loc_EB6C:
                
                clr.w   d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                bra.w   *+4
loc_EB7A:
                
                clr.w   d2
                move.b  var_4(a6),d2
                tst.w   d2
                beq.s   loc_EB9C
                cmpi.w  #1,d2
                bne.s   loc_EB90
                jsr     j_GetMoveListForEnemyTarget
loc_EB90:
                
                cmpi.w  #2,d2
                bne.s   loc_EB9C
                jsr     sub_1AC030      
loc_EB9C:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_E98C


; =============== S U B R O U T I N E =======================================

; In: D0 = character index


sub_EBA4:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d0,d7
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_EBC8
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EBC8:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_EBE8
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EBE8:
                
                move.w  d7,d0
                clr.w   d3
                bsr.w   GetNextStatusSpell
                cmpi.w  #SPELL_NOTHING,d1 
                bne.s   loc_EC0E
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EC0E:
                
                cmpi.w  #$47,d1 
                bne.s   loc_EC18
                bra.w   loc_EC3A
loc_EC18:
                
                cmpi.w  #6,d1
                bne.s   loc_EC22
                bra.w   loc_EC3A
loc_EC22:
                
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EC3A:
                
                move.w  d1,d6
                bsr.w   FindSpellDefAddress
                clr.w   d2
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d2
                move.b  SPELLDEF_OFFSET_PROPS(a0),d5
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetCurrentMP
                cmp.b   d2,d1
                bge.s   loc_EC6E
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EC6E:
                
                clr.w   d0
                btst    #6,d5
                move.w  #$FFFF,d3
                bne.s   loc_EC80
                bsr.w   UpdateTargetListEnemies
                bra.s   loc_EC84
loc_EC80:
                
                bsr.w   UpdateTargetListAllies
loc_EC84:
                
                move.b  d7,d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                btst    #6,d5
                clr.w   d3
                bne.s   loc_ECA0
                bsr.w   UpdateTargetListEnemies
                bsr.w   MakeTargetListAllies
                bra.s   loc_ECA8
loc_ECA0:
                
                bsr.w   UpdateTargetListAllies
                bsr.w   MakeTargetListEnemies
loc_ECA8:
                
                clr.w   d1
                move.b  d6,d1
                clr.w   d0
                move.b  d7,d0
                cmpi.w  #5,d1
                bne.s   loc_ECBE
                bsr.w   sub_D460
                bra.w   loc_ED00
loc_ECBE:
                
                cmpi.w  #$43,d1 
                bne.s   loc_ECCC
                bsr.w   sub_D4E0
                bra.w   loc_ED00
loc_ECCC:
                
                cmpi.w  #$47,d1 
                bne.s   loc_ECDA
                bsr.w   sub_D62C
                bra.w   loc_ED00
loc_ECDA:
                
                cmpi.w  #6,d1
                bne.s   loc_ECE8
                bsr.w   sub_D560
                bra.w   loc_ED00
loc_ECE8:
                
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_ED00:
                
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                tst.w   d5
                bne.s   loc_ED22
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_ED22:
                
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((byte_FF895E-$1000000)).w,a1
                move.b  #$FF,d0
                clr.w   d1
                clr.w   d2
loc_ED36:
                
                clr.w   d3
                move.b  (a1,d2.w),d3
                cmp.b   d1,d3
                blt.s   loc_ED46
                move.b  (a0,d2.w),d0
                move.b  d3,d1
loc_ED46:
                
                addi.w  #1,d2
                dbf     d5,loc_ED36
                cmpi.b  #$FF,d0
                bne.s   loc_ED6C
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_ED6C:
                
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                move.w  d6,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_4(a0)
                move.w  d6,d1
                bsr.w   GetSpellRange
                move.w  BATTLEACTION_OFFSET_4(a0),d0
                bsr.w   MakeTargetListEverybody
loc_ED8A:
                
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                cmpi.w  #$FF,d1
                bne.s   loc_EDBA
                move.w  #$FFFF,d1
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a0
                move.w  #3,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_EDD0
loc_EDBA:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
                clr.w   d1
loc_EDD0:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_EBA4


; =============== S U B R O U T I N E =======================================

var_196 = -196
var_195 = -195
var_194 = -194
var_193 = -193
var_192 = -192
var_144 = -144
var_96 = -96
var_48 = -48

sub_EDD6:
                
                movem.l d3-a5,-(sp)
                link    a6,#-198
                move.b  d0,var_193(a6)
                move.b  #0,var_194(a6)
                move.b  #0,var_195(a6)
                clr.w   d3
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0
                tst.w   (a0)
                beq.s   loc_EDFC
                bset    #0,d3
loc_EDFC:
                
                lea     ((word_FF8806-$1000000)).w,a0
                tst.w   (a0)
                beq.s   loc_EE08
                bset    #1,d3
loc_EE08:
                
                lea     ((byte_FF8808-$1000000)).w,a0
                tst.w   (a0)
                beq.s   loc_EE14
                bset    #2,d3
loc_EE14:
                
                tst.b   d3
                bne.s   loc_EE24
                moveq   #3,d2
                move.w  #$FFFF,d0
                moveq   #0,d1
                bra.w   loc_F1CC
loc_EE24:
                
                move.b  d3,d4
                andi.b  #6,d4
                tst.b   d4
                bne.s   loc_EE48
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
                lea     ((byte_FF889E-$1000000)).w,a2
                lea     ((byte_FF892E-$1000000)).w,a3
                move.b  #0,var_195(a6)
                bra.w   loc_EF2E
loc_EE48:
                
                move.w  d4,d1
                andi.b  #6,d1
                cmpi.b  #6,d1
                beq.w   loc_EEC6
                btst    #1,d4
                beq.s   loc_EE9A
                lea     ((word_FF880C-$1000000)).w,a1
                move.w  (a1),d1
                cmpi.w  #$28,d1 
                bne.s   loc_EE6C
                bra.w   loc_EEFA
loc_EE6C:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #2,d7
                bne.s   loc_EE7E
                bra.w   loc_EEFA
loc_EE7E:
                
                cmpi.b  #4,d7
                bne.s   loc_EE88
                bra.w   loc_EEFA
loc_EE88:
                
                btst    #0,d3
                bne.s   loc_EE94
                bra.w   loc_EEFA
                bra.s   loc_EE98
loc_EE94:
                
                bra.w   loc_EEE0
loc_EE98:
                
                bra.s   loc_EEC6
loc_EE9A:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #3,d7
                bne.s   loc_EEAC
                bra.w   loc_EF14
loc_EEAC:
                
                cmpi.b  #5,d7
                bne.s   loc_EEB6
                bra.w   loc_EF14
loc_EEB6:
                
                btst    #0,d3
                bne.s   loc_EEC2
                bra.w   loc_EF14
                bra.s   loc_EEC6
loc_EEC2:
                
                bra.w   loc_EEE0
loc_EEC6:
                
                move.b  #2,d6
                jsr     j_RandomUnderD6
                cmpi.b  #1,d7
                bne.s   loc_EEDC
                bra.w   loc_EF14
                bra.s   loc_EEE0
loc_EEDC:
                
                bra.w   loc_EEFA
loc_EEE0:
                
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
                lea     ((byte_FF889E-$1000000)).w,a2
                lea     ((byte_FF892E-$1000000)).w,a3
                move.b  #0,var_195(a6)
                bra.w   loc_EF2E
loc_EEFA:
                
                lea     ((word_FF8806-$1000000)).w,a0
                lea     ((byte_FF883E-$1000000)).w,a1
loc_EF02:
                
                lea     ((byte_FF88CE-$1000000)).w,a2
                lea     ((byte_FF895E-$1000000)).w,a3
                move.b  #1,var_195(a6)
                bra.w   loc_EF2E
loc_EF14:
                
                lea     ((byte_FF8808-$1000000)).w,a0
                lea     ((byte_FF886E-$1000000)).w,a1
                lea     ((byte_FF88FE-$1000000)).w,a2
                lea     ((byte_FF898E-$1000000)).w,a3
                move.b  #2,var_195(a6)
                bra.w   *+4
loc_EF2E:
                
                move.w  (a0),d3
                subi.w  #1,d3
                clr.b   d4
loc_EF36:
                
                cmp.b   (a3,d3.w),d4
                bgt.s   loc_EF40
                move.b  (a3,d3.w),d4
loc_EF40:
                
                dbf     d3,loc_EF36
                move.b  d4,var_194(a6)
                cmpi.b  #$F,d4
                bge.s   loc_EF52
                bra.w   loc_EF8E
loc_EF52:
                
                move.b  #$F,var_194(a6)
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3
                subi.w  #1,d3
                clr.w   d5
loc_EF64:
                
                cmp.b   (a3,d3.w),d4
                bgt.s   loc_EF80
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),var_144(a6)
                movea.l (sp)+,a6
                addi.w  #1,d5
loc_EF80:
                
                dbf     d3,loc_EF64
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)
                bra.w   loc_EFC0
loc_EF8E:
                
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3
                subi.w  #1,d3
                clr.w   d5
loc_EF9A:
                
                cmp.b   (a3,d3.w),d4
                bne.s   loc_EFB6
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),var_144(a6)
                movea.l (sp)+,a6
                addi.w  #1,d5
loc_EFB6:
                
                dbf     d3,loc_EF9A
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)
loc_EFC0:
                
                cmpi.b  #1,d5
                bne.s   loc_EFD8
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.b  (a4),d0
                move.b  var_194(a6),d1
                move.b  var_195(a6),d2
                bra.w   loc_F1CC
loc_EFD8:
                
                clr.l   d0
                move.b  var_193(a6),d0
                btst    #7,d0
                bne.w   loc_F008
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,var_196(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_EFFA:
                
                move.b  (a5)+,var_48(a6,d5.w)
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_EFFA
                bra.w   loc_F172
loc_F008:
                
                move.b  var_194(a6),d0
                cmpi.b  #$F,d0
                bge.s   loc_F034
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,var_196(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_F026:
                
                move.b  (a5)+,var_48(a6,d5.w)
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_F026
                bra.w   loc_F172
loc_F034:
                
                clr.l   d0
                move.b  var_193(a6),d0
                jsr     GetUpperMoveType
                clr.l   d3
                move.b  d1,d3
                lea     (off_D982).l,a4 
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
                cmpi.b  #1,var_195(a6)
                bne.s   loc_F05E
                lea     (byte_D921).l,a4
loc_F05E:
                
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_F06E:
                
                move.b  (a5)+,var_48(a6,d5.w)
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_F06E
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  #0,(a5)
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_F086:
                
                clr.l   d4
loc_F088:
                
                clr.l   d0
                move.b  var_48(a6,d4.w),d0
                btst    #7,d0
                beq.s   loc_F098
                bra.w   loc_F0D8
loc_F098:
                
                jsr     GetClass        
                cmp.b   (a4,d5.w),d1
                beq.s   loc_F0A8
                bra.w   loc_F0D8
loc_F0A8:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d2
                lea     ((TARGETS_LIST-$1000000)).w,a5
                move.b  d0,(a5,d2.w)
                move.b  d1,var_96(a6,d2.w)
                move.l  a6,-(sp)
                adda.w  d4,a6
                move.b  var_144(a6),d0
                movea.l (sp)+,a6
                move.l  a6,-(sp)
                adda.w  d2,a6
                move.b  d0,var_192(a6)
                movea.l (sp)+,a6
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d2
                addq.w  #1,d2
                move.w  d2,(a5)
loc_F0D8:
                
                addq.b  #1,d4
                cmpi.b  #$30,d4 
                blt.s   loc_F0EE
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F0EE:
                
                cmp.b   d4,d6
                beq.s   loc_F0F4
                bra.s   loc_F088
loc_F0F4:
                
                addq.b  #1,d5
                cmpi.b  #$20,d5 
                bge.s   loc_F0FE
                bra.s   loc_F086
loc_F0FE:
                
                move.b  #0,var_196(a6)
                clr.l   d6
                clr.l   d2
                move.b  var_96(a6,d2.w),d2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d7
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d4
loc_F118:
                
                move.b  var_96(a6,d4.w),d5
                cmp.b   d5,d2
                bne.s   loc_F13C
                move.b  (a5,d4.w),var_48(a6,d6.w)
                move.l  a6,-(sp)
                adda.w  d4,a6
                move.b  var_192(a6),d0
                movea.l (sp)+,a6
                move.l  a6,-(sp)
                adda.w  d6,a6
                move.b  d0,var_144(a6)
                movea.l (sp)+,a6
                addq.w  #1,d6
loc_F13C:
                
                addi.w  #1,d4
                cmpi.w  #$30,d4 
                blt.s   loc_F154
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F154:
                
                subq.w  #1,d7
                bne.s   loc_F118
                move.b  d6,var_196(a6)
                cmpi.b  #1,d6
                bne.s   loc_F172
                move.b  var_48(a6),d0
                move.b  var_194(a6),d1
                move.b  var_195(a6),d2
                bra.w   loc_F1CC
loc_F172:
                
                clr.l   d2
                move.b  #$FF,d2
                clr.w   d3
                move.b  var_196(a6),d3
                cmpi.w  #$30,d3 
                ble.s   loc_F192
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F192:
                
                clr.l   d4
                clr.l   d6
loc_F196:
                
                movea.l a6,a5
                adda.w  d4,a5
                move.b  -$90(a5),d5
                cmp.b   d5,d2
                bgt.s   loc_F1A8
                move.b  d5,d2
                move.b  var_48(a6,d4.w),d6
loc_F1A8:
                
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   loc_F196
                cmpi.b  #$FF,d2
                bne.s   loc_F1C2
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.s   loc_F1CC
loc_F1C2:
                
                move.b  d6,d0
                move.b  var_194(a6),d1
                move.b  var_195(a6),d2
loc_F1CC:
                
                unlk    a6
                movem.l (sp)+,d3-a5
                rts

    ; End of function sub_EDD6


; =============== S U B R O U T I N E =======================================

var_98 = -98
var_96 = -96
var_95 = -95
var_48 = -48
var_47 = -47

sub_F1D4:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-100
                move.w  d0,d7
                move.b  d1,var_98(a6)
                tst.b   d1
                beq.s   loc_F1FE
                cmpi.b  #1,d1
                bne.s   loc_F1F2
                jsr     j_GetMoveListForEnemyTarget
loc_F1F2:
                
                cmpi.b  #2,d1
                bne.s   loc_F1FE
                jsr     sub_1AC030      
loc_F1FE:
                
                bsr.w   GetMoveInfo     
                move.w  #$80,d0 
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetListEverybody
                move.w  d7,d0
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_F22C
                btst    #7,d0
                bne.s   loc_F222
                clr.w   d6
                bra.s   loc_F228
loc_F222:
                
                clr.w   d6
                move.w  #$80,d6 
loc_F228:
                
                bra.w   loc_F39E
loc_F22C:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_F23E
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d6
                bra.s   loc_F244
loc_F23E:
                
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d6
loc_F244:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d2
loc_F24A:
                
                bsr.w   GetCurrentHP    ; iterate through combatants
                tst.w   d1
                bne.s   loc_F256
                bra.w   loc_F276
loc_F256:
                
                bsr.w   GetXPos
                tst.b   d1
                bpl.s   loc_F262
                bra.w   loc_F276
loc_F262:
                
                bsr.w   GetYPos
                tst.b   d1
                bpl.s   loc_F26E
                bra.w   loc_F276
loc_F26E:
                
                move.b  d0,(a0,d2.w)    ; add to targets if alive and on map
                addi.w  #1,d2
loc_F276:
                
                addq.w  #1,d0
                dbf     d6,loc_F24A
                move.w  d2,((TARGETS_LIST_LENGTH-$1000000)).w
                move.w  d2,d6
                clr.w   d2
loc_F284:
                
                clr.w   d0
                move.b  (a0,d2.w),d0
                bsr.w   GetMoveCostToEntity
                move.b  d0,var_96(a6,d2.w)
                addi.w  #1,d2
                subq.w  #1,d6
                bne.s   loc_F284
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                cmpi.w  #1,d1
                bgt.s   loc_F2A8
                bra.w   loc_F39A
loc_F2A8:
                
                subq.w  #2,d1
                move.b  #0,d2
                lea     ((TARGETS_LIST-$1000000)).w,a0
loc_F2B2:
                
                tst.b   d2
                bpl.s   loc_F2BA
                bra.w   loc_F2F6
loc_F2BA:
                
                move.b  #$FF,d2
                clr.w   d3
loc_F2C0:
                
                move.b  var_95(a6,d3.w),d4
                cmp.b   var_96(a6,d3.w),d4
                bcc.s   loc_F2E8
                move.b  var_95(a6,d3.w),d4
                move.b  var_96(a6,d3.w),var_95(a6,d3.w)
                move.b  d4,var_96(a6,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
loc_F2E8:
                
                tst.w   d1
                beq.s   loc_F2F2
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   loc_F2C0
loc_F2F2:
                
                move.w  d2,d1
                bra.s   loc_F2B2
loc_F2F6:
                
                btst    #7,d0
                bne.s   loc_F300
                bra.w   loc_F39A
loc_F300:
                
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetUpperMoveType
                lea     (off_D982).l,a1 
                lsl.l   #2,d1
                movea.l (a1,d1.l),a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                clr.w   d5
loc_F31A:
                
                clr.w   d0
                move.b  (a0,d5.w),d0
                bsr.w   GetClass        
                move.b  d1,d4
                clr.w   d3
                move.w  #$20,d2 
loc_F32C:
                
                cmp.b   (a1,d3.w),d4
                bne.s   loc_F33A
                move.b  d3,var_48(a6,d5.w)
                bra.w   loc_F340
loc_F33A:
                
                addq.b  #1,d3
                subq.w  #1,d2
                bne.s   loc_F32C
loc_F340:
                
                addq.b  #1,d5
                subq.w  #1,d6
                bne.s   loc_F31A
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                subi.w  #2,d6
                clr.w   d5
loc_F350:
                
                move.b  var_48(a6,d5.w),d0
                move.b  var_47(a6,d5.w),d1
                sub.b   d1,d0
                bpl.s   loc_F35E
                neg.b   d0
loc_F35E:
                
                cmpi.b  #1,d0
                bgt.s   loc_F392
                move.b  (a0,d5.w),d0
                sub.b   1(a0,d5.w),d0
                bpl.s   loc_F370
                neg.b   d0
loc_F370:
                
                cmpi.b  #3,d0
                bgt.s   loc_F392
                move.b  var_48(a6,d5.w),d0
                move.b  d0,var_47(a6,d5.w)
                move.b  d1,var_48(a6,d5.w)
                move.b  (a0,d5.w),d0
                move.b  1(a0,d5.w),d1
                move.b  d0,1(a0,d5.w)
                move.b  d1,(a0,d5.w)
loc_F392:
                
                addi.w  #1,d5
                dbf     d6,loc_F350
loc_F39A:
                
                clr.w   d6
                move.b  (a0),d6
loc_F39E:
                
                clr.w   d0
                move.b  d7,d0
                btst    #7,d0
                beq.w   loc_F404
                bsr.w   GetEnemyIndex   
                cmpi.b  #ENEMY_KRAKEN_LEG,d1 ; HARDCODED enemy indexes
                bne.s   loc_F3B8
                bra.w   loc_F3D0
loc_F3B8:
                
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   loc_F3C2
                bra.w   loc_F3D0
loc_F3C2:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   loc_F3CC
                bra.w   loc_F3D0
loc_F3CC:
                
                bra.w   loc_F404
loc_F3D0:
                
                jsr     j_ClearTerrainListObstructions
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     tbl_KrakenMoveCosts(pc), a5
                nop
                bra.w   loc_F43A
loc_F404:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d0
                move.b  d7,d0
                bsr.w   MemorizePath
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COST_LIST-$1000000)).w,a5
loc_F43A:
                
                bsr.w   MakeRangeLists
                move.b  d7,d0
                bsr.w   GetXPos
                move.w  d1,d2
                move.w  #4,d3
                bsr.w   GetYPos
                move.w  d2,d0
                bsr.w   j_makeEnemyMoveOrder
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F476
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #3,(a0)
                bra.w   loc_F512
loc_F476:
                
                move.b  var_98(a6),d1
                tst.b   d1
                beq.s   loc_F49A
                cmpi.b  #1,d1
                bne.s   loc_F48C
                move.b  d7,d0
                jsr     j_GetMoveListForEnemyTarget
loc_F48C:
                
                cmpi.b  #2,d1
                bne.s   loc_F49A
                move.b  d7,d0
                jsr     sub_1AC030      
loc_F49A:
                
                move.w  d7,d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetList
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetListEverybody
                move.w  #0,d3
                move.w  d7,d0
                bsr.w   UpdateTargetList
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                lea     (BATTLESCENE_ACTION_TYPE).l,a0
                move.w  #3,(a0)
                bra.w   loc_F512
loc_F4FE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
loc_F512:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_F1D4


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
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #$FF,(a2)
                bra.w   loc_F782
loc_F554:
                
                cmpi.b  #4,d7
                bne.s   loc_F570
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #$FF,(a2)
                bra.w   loc_F782
loc_F570:
                
                cmpi.b  #6,d7
                bne.s   loc_F58C
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #$FF,(a2)
                bra.w   loc_F782
loc_F58C:
                
                bsr.w   sub_F8EA
                tst.b   d1
                beq.s   loc_F5AA
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #$FF,(a2)
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
                bsr.w   GetEnemyAISetting3233
                move.w  d1,d0
                jsr     j_GetEnemyAITargetPosition
                move.b  d1,var_1(a6)
                move.b  d1,var_2(a6)
loc_F5DE:
                
                move.b  var_3(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetListEverybody
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #$7F,d0 
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
                andi.b  #$7F,d0 
                adda.w  d0,a0
                move.b  #0,(a0)
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #$FF,(a2)
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
                andi.b  #$7F,d0 
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
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
                lea     (BATTLESCENE_ACTION_TYPE).l,a2
                move.w  #3,(a2)
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
                jsr     j_GetEnemyAITargetPosition
                move.w  d1,d3
                move.w  d2,d4
                move.w  #$80,d0 
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COST_LIST-$1000000)).w,a5
                bsr.w   MakeRangeLists
                move.w  #$FFFF,d3
                bsr.w   sub_C900
                bsr.w   MakeTargetListEverybody
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
                bsr.w   UpdateTargetListAllies
                move.b  var_1(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                move.w  #0,d3
                bsr.w   UpdateTargetListAllies
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
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   sub_DD10
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
                bsr.w   GetEnemyAISetting3233
                move.b  d1,var_3(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetEnemyAISetting36
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

