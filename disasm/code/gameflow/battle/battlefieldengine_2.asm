
; ASM FILE code\gameflow\battle\battlefieldengine_2.asm :
; 0xC27A..0xDEFC : Battlefield engine

; =============== S U B R O U T I N E =======================================

sub_C27A:
                
                movem.l d0-d2/d4-a6,-(sp)
                btst    #7,d0
                bne.s   loc_C2A4
                moveq   #1,d3
                cmpi.b  #0,d1
                beq.w   loc_C2C2
                moveq   #0,d3
                cmp.b   d0,d1
                bne.w   loc_C2C2
                moveq   #2,d0
                jsr     (GetRandomOrDebugValue).w
                beq.w   loc_C2C2
                moveq   #1,d3
                bra.s   loc_C2C2
loc_C2A4:
                
                moveq   #1,d3
                cmpi.b  #$80,d1
                beq.w   loc_C2C2
                moveq   #0,d3
                cmp.b   d0,d1
                bne.w   loc_C2C2
                moveq   #2,d0
                jsr     (GetRandomOrDebugValue).w
                beq.w   loc_C2C2
                moveq   #1,d3
loc_C2C2:
                
                movem.l (sp)+,d0-d2/d4-a6
                rts

    ; End of function sub_C27A


; =============== S U B R O U T I N E =======================================

; entity D0's current MOV*2, X, Y -> D0, D3, D4

GetMoveInfo:
                
                movem.l d1-d2/d5-a1,-(sp)
                bsr.w   MemorizePath
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COST_LIST-$1000000)).w,a5
                jsr     GetXPos
                move.w  d1,d3
                jsr     GetYPos
                move.w  d1,d4
                jsr     GetCurrentMOV
                move.w  d1,d0
                add.w   d0,d0
                movem.l (sp)+,d1-d2/d5-a1
                rts

    ; End of function GetMoveInfo


; =============== S U B R O U T I N E =======================================

; get index and max/min range of current character's current weapon (D1,D3,D4)

GetWeaponRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   loc_C368
                clr.l   d3
                clr.l   d4
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_C338
                jsr     GetClass        
                cmpi.w  #CLASS_BRGN,d1
                bne.s   loc_C338
                move.w  #2,d3
                move.w  #1,d4
                bra.w   loc_C37A
loc_C338:
                
                jsr     GetEnemyIndex   
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   loc_C350
                move.w  #2,d3
                move.w  #1,d4
                bra.w   loc_C37A
loc_C350:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   loc_C362
                move.w  #3,d3
                move.w  #1,d4
                bra.w   loc_C37A
loc_C362:
                
                moveq   #1,d3
                moveq   #1,d4
                bra.s   loc_C37A
loc_C368:
                
                jsr     GetItemDefAddress
                clr.w   d3
                clr.w   d4
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
loc_C37A:
                
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetWeaponRange


; =============== S U B R O U T I N E =======================================

GetSpellRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetSpellRange


; =============== S U B R O U T I N E =======================================

GetItemRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetItemRange


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: D1 = whether combatant is inflicted with MUDDLE 2 (0=no, 1=yes)

CheckMuddled2:
                
                movem.l d0/d2-a6,-(sp)
                bsr.w   GetStatus
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_MUDDLE1,d1
                tst.w   d1
                beq.s   @NotMuddled1
                move.w  d2,d1
                andi.w  #STATUSEFFECTS_MASK_MUDDLE2,d1
                tst.w   d1
                beq.s   @NotMuddled2
                move.w  #1,d1
                bra.s   @BothMuddled1and2
@NotMuddled2:
                
                clr.w   d1
@BothMuddled1and2:
                
                bra.s   @Done
@NotMuddled1:
                
                clr.w   d1
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CheckMuddled2


; =============== S U B R O U T I N E =======================================

GenerateTargetRangeLists:
                
                movem.l d0-a6,-(sp)
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetList
                move.l  d0,-(sp)
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                move.l  (sp)+,d0
                move.w  #0,d3
                bsr.w   UpdateTargetList
                movem.l (sp)+,d0-a6
                rts

    ; End of function GenerateTargetRangeLists


; =============== S U B R O U T I N E =======================================

j_sub_C404_0:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                eori.w  #$FFFF,d0
                bsr.w   MakeTargetList
                eori.w  #$FFFF,d0
                bsr.w   GetWeaponRange  
                move.w  d3,d2
                move.w  d4,d3
                moveq   #$FFFFFFFF,d5
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                sub.b   d3,d2
loc_C43C:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordListToGrids
                subq.w  #1,d2
                bne.s   loc_C43C
                movem.l (sp)+,d0-a6
                rts

    ; End of function j_sub_C404_0


; =============== S U B R O U T I N E =======================================

; In: D0 = user combatant index
;     D1 = item index

CreateItemRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #SPELL_NOTHING,d1
                beq.s   @Done
                bsr.w   CreateSpellRangeGrid
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateItemRangeGrid


; =============== S U B R O U T I N E =======================================

; Clear and update target/movable grids based on spell properties
; 
;       In: D0 = caster combatant index
;           D1 = spell index

CreateSpellRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                jsr     GetSpellDefAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_C4AA
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4A4
                bsr.w   MakeTargetListAllies
                bra.s   loc_C4A8
loc_C4A4:
                
                bsr.w   MakeTargetListEnemies
loc_C4A8:
                
                bra.s   loc_C4BC
loc_C4AA:
                
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4B8
                bsr.w   MakeTargetListEnemies
                bra.s   loc_C4BC
loc_C4B8:
                
                bsr.w   MakeTargetListAllies
loc_C4BC:
                
                moveq   #$FFFFFFFF,d5
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d2
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d3
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                sub.b   d3,d2
loc_C4D8:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordListToGrids
                subq.w  #1,d2
                bne.s   loc_C4D8
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateSpellRangeGrid


; =============== S U B R O U T I N E =======================================

j_sub_C4E8_0:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                bsr.w   MakeTargetList
                moveq   #$FFFFFFFF,d5
                lea     SpellRange1(pc), a0
                nop
                bsr.w   ApplyRelativeCoordListToGrids
                movem.l (sp)+,d0-a6
                rts

    ; End of function j_sub_C4E8_0


; =============== S U B R O U T I N E =======================================

; Apply coord list at A0 and add any targets to target list
; 
;       In: A0 = address of relative coord list
;           D0 = current entity index
;           D1 = starting X coord
;           D2 = starting Y coord

ApplyRelativeCoordListToGrids:
                
                movem.l d0-a6,-(sp)
                jsr     GetXPos
                cmpi.w  #$FFFF,d1
                beq.w   loc_C58A
                move.w  d1,d3
                jsr     GetYPos
                move.w  d1,d4
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
loc_C532:
                
                move.w  d4,d2
                add.b   1(a0),d2
                cmpi.w  #$30,d2 
loc_C53C:
                
                bcc.w   loc_C584
                move.w  d3,d1
                add.b   (a0),d1
                cmpi.w  #$30,d1 
                bcc.w   loc_C584
                tst.b   d5
                beq.s   loc_C55E
                bsr.w   GetTerrain      
                cmpi.b  #$FF,d0
                beq.s   loc_C55E
                bsr.w   SetMovableAtCoord
loc_C55E:
                
                bsr.w   GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                beq.w   loc_C584
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C584
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a1
                adda.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a1
                move.b  d0,(a1)
                addq.w  #1,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
loc_C584:
                
                addq.l  #2,a0
                dbf     d7,loc_C532
loc_C58A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ApplyRelativeCoordListToGrids

pt_SpellRanges: dc.l SpellRange0
                dc.l SpellRange1
                dc.l SpellRange2
                dc.l SpellRange3
SpellRange0:    dc.b 1
                dc.b 0
                dc.b 0
SpellRange1:    dc.b 4
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 0
SpellRange2:    dc.b 8
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
SpellRange3:    dc.b $C
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

; =============== S U B R O U T I N E =======================================

CreateTargetGridFromUsedItem:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.s   @Done
                bsr.w   CreateTargetGridFromSpell
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateTargetGridFromUsedItem


; =============== S U B R O U T I N E =======================================

j_sub_C5FA_0:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.s   loc_C618
                bsr.w   CreateTargetGrid
loc_C618:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function j_sub_C5FA_0


; =============== S U B R O U T I N E =======================================

CreateTargetGridFromSpell:
                
                cmpi.b  #$19,d1
                bne.s   loc_C62A
                bsr.w   MakeTargetListEverybody
                bra.s   CreateTargetGrid
loc_C62A:
                
                bsr.w   MakeTargetList

    ; End of function CreateTargetGridFromSpell


; =============== S U B R O U T I N E =======================================

CreateTargetGrid:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                jsr     GetSpellDefAddress
                cmpi.b  #SPELL_AURA|SPELL_LV4,d1
                beq.w   loc_C678
                cmpi.b  #SPELL_SHINE,d1
                beq.w   loc_C678
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_RADIUS(a0),d2
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                cmpi.b  #$19,d1
                bne.s   loc_C668
                subq.b  #1,d2
loc_C668:
                
                moveq   #0,d5
loc_C66A:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordListToGrids
                subq.w  #1,d2
                bne.s   loc_C66A
                bra.w   loc_C688
loc_C678:
                
                btst    #7,d0
                bne.s   loc_C684
                bsr.w   sub_C68E
                bra.s   loc_C688
loc_C684:
                
                bsr.w   sub_C6D4
loc_C688:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateTargetGrid


; =============== S U B R O U T I N E =======================================

sub_C68E:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   loc_C6A4
loc_C6A2:
                
                addq.w  #1,d0
loc_C6A4:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   loc_C6CE
                jsr     GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_C6CC
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C6CC
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
loc_C6CC:
                
                bra.s   loc_C6A2
loc_C6CE:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_C68E


; =============== S U B R O U T I N E =======================================

sub_C6D4:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  #$80,d0 
                bra.s   loc_C6EA
loc_C6E8:
                
                addq.w  #1,d0
loc_C6EA:
                
                cmpi.w  #$9F,d0 
                bgt.s   loc_C714
                jsr     GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_C712
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C712
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
loc_C712:
                
                bra.s   loc_C6E8
loc_C714:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_C6D4


; =============== S U B R O U T I N E =======================================

; something with terrain lists and checking, look into it ???
; In: D1 = x pos
;     D2 = y pos
;     D3 = max range
;     D4 = min range
; Out: D1 = chosen x pos
;      D2 = chosen y pos

GetClosestAttackPosition:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-6
                move.b  d1,-1(a6)
                move.b  d2,-2(a6)
                move.b  #$FF,-3(a6)
                move.b  #$FF,-4(a6)
                move.b  #$FF,-5(a6)
                cmpi.b  #$30,d1 
                bcc.w   loc_C7E2
                cmpi.b  #$30,d2 
                bcc.w   loc_C7E2
                move.b  d3,d6
                neg.b   d6              ; D6 is now -max range
loc_C750:
                
                move.b  d3,d5
                move.b  d6,d0
                or.b    d0,d0
                bge.s   loc_C75A
                neg.b   d0
loc_C75A:
                
                sub.b   d0,d5
                neg.b   d5              ; D5 is now (max range - max range) ???
                move.b  d3,d0
loc_C760:
                
                cmp.b   d4,d0
                bcs.w   loc_C7BE
                move.b  -1(a6),d1
                add.b   d5,d1
                cmpi.b  #$30,d1 
                bcc.w   loc_C7BE
                move.b  -2(a6),d2
                add.b   d6,d2
                cmpi.b  #$30,d2 
                bcc.w   loc_C7BE
                bsr.w   GetDestinationMoveCost
                tst.w   d0              ; already in range, so end because it can't get cheaper
                beq.w   loc_C7EA
                btst    #$F,d0
                bne.w   loc_C7BE
                cmp.b   -5(a6),d0
                bcc.w   loc_C7BE
                move.b  d0,d7
                andi.w  #$FF,d1
                andi.w  #$FF,d2
                bsr.w   GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                bne.w   loc_C7BE        ; already someone there, so it can't be chosen
                move.b  d7,-5(a6)
                move.b  d1,-3(a6)
                move.b  d2,-4(a6)
loc_C7BE:
                
                addq.b  #1,d5
                move.b  d5,d1
                or.b    d1,d1
                bge.s   loc_C7C8
                neg.b   d1
loc_C7C8:
                
                move.b  d6,d0
                or.b    d0,d0
                bge.s   loc_C7D0
                neg.b   d0
loc_C7D0:
                
                add.b   d1,d0
                cmp.b   d3,d0
                bls.s   loc_C760
                cmp.b   d3,d6
                beq.w   loc_C7E2
                addq.b  #1,d6
                bra.w   loc_C750
loc_C7E2:
                
                move.b  -3(a6),d1
                move.b  -4(a6),d2
loc_C7EA:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetClosestAttackPosition


; =============== S U B R O U T I N E =======================================

MakeTargetList:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   MakeTargetListEnemies ; generate list of targets: opposite alignment of D0

    ; End of function MakeTargetList


; =============== S U B R O U T I N E =======================================

; Clear target grid, then add allies

MakeTargetListAllies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetGrid 
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   loc_C828

    ; End of function MakeTargetListAllies


; =============== S U B R O U T I N E =======================================

MakeTargetListEnemies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetGrid 
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                bra.w   loc_C828

    ; End of function MakeTargetListEnemies


; =============== S U B R O U T I N E =======================================

MakeTargetListEverybody:
                
                movem.l d0-a0,-(sp)
                bsr.s   MakeTargetListAllies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
loc_C828:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C86E
                jsr     GetCharacterWord34
                btst    #3,d1
                beq.s   loc_C844
                bra.w   loc_C86E
loc_C844:
                
                jsr     GetYPos
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d1
                bcc.w   loc_C86E
                move.w  d1,d2
                jsr     GetXPos
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C86E
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  d0,(a0)
loc_C86E:
                
                addq.b  #1,d0
                dbf     d7,loc_C828
                movem.l (sp)+,d0-a0
                rts

    ; End of function MakeTargetListEverybody


; =============== S U B R O U T I N E =======================================

UpdateTargetList:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   UpdateTargetListEnemies

    ; End of function UpdateTargetList


; =============== S U B R O U T I N E =======================================

UpdateTargetListAllies:
                
                movem.l d0-a0,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   loc_C898

    ; End of function UpdateTargetListAllies


; =============== S U B R O U T I N E =======================================

UpdateTargetListEnemies:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
loc_C898:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C8F4
                jsr     GetYPos
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   loc_C8F4
                jsr     GetXPos
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C8F4
                lea     (BATTLE_TERRAIN).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  (a0),d4
                cmpi.b  #$FF,d4
                bne.s   loc_C8D8
                bra.w   loc_C8F4
loc_C8D8:
                
                btst    #6,d4
                beq.s   loc_C8E6
                tst.w   d3
                bne.s   loc_C8E6
                bra.w   loc_C8F4
loc_C8E6:
                
                tst.w   d3
                bne.s   loc_C8F0
                bclr    #7,(a0)
                bra.s   loc_C8F4
loc_C8F0:
                
                bset    #7,(a0)
loc_C8F4:
                
                addq.b  #1,d0
                dbf     d7,loc_C898
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateTargetListEnemies


; =============== S U B R O U T I N E =======================================

sub_C900:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
loc_C90A:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C94C
                jsr     GetYPos
                move.w  d1,d2
                cmpi.w  #$30,d2 
                bcc.w   loc_C94C
                jsr     GetXPos
                cmpi.w  #$30,d1 
                bcc.w   loc_C94C
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordToOffset
                tst.w   d3
                bne.s   loc_C948
                bclr    #7,(a0)
                bra.s   loc_C94C
loc_C948:
                
                bset    #7,(a0)
loc_C94C:
                
                addq.b  #1,d0
                dbf     d7,loc_C90A
                movem.l (sp)+,d0-a0
                rts

    ; End of function sub_C900


; =============== S U B R O U T I N E =======================================

sub_C958:
                
                movem.l d1-a2,-(sp)
                move.l  d0,-(sp)
                moveq   #$FFFFFFFF,d3
                bsr.w   UpdateTargetList
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                moveq   #0,d3
                bsr.w   UpdateTargetList
                clr.w   ((byte_FF8808-$1000000)).w
                clr.w   ((word_FF8806-$1000000)).w
                clr.w   ((FF8804_LOADING_SPACE-$1000000)).w
                move.l  (sp)+,d0
                moveq   #0,d3
                bsr.w   GetNextUsableAttackItem
                cmpi.w  #$7F,d1 
                beq.w   loc_CA02
                bsr.w   MakeTargetListEverybody
loc_C992:
                
                bsr.w   GetTargetsReachableByItem
                move.w  ((byte_FF8808-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_CA02
                move.l  d1,-(sp)
                btst    #7,d0
                bne.s   loc_C9BC
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_C9B6
                bsr.w   MakeTargetListEnemies
                bra.s   loc_C9BA
loc_C9B6:
                
                bsr.w   MakeTargetListAllies
loc_C9BA:
                
                bra.s   loc_C9CE
loc_C9BC:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_C9CA
                bsr.w   MakeTargetListAllies
                bra.s   loc_C9CE
loc_C9CA:
                
                bsr.w   MakeTargetListEnemies
loc_C9CE:
                
                move.l  (sp)+,d1
                lea     (word_FF880A).l,a0
                move.w  d2,(a0)
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                lea     ((byte_FF886E-$1000000)).w,a0
                lea     ((byte_FF88FE-$1000000)).w,a1
                lea     ((byte_FF898E-$1000000)).w,a2
loc_C9EE:
                
                move.b  (a0,d7.w),d2
                move.b  (a1,d7.w),d5
                bsr.w   sub_CAEA
                move.b  d6,(a2,d7.w)
                dbf     d7,loc_C9EE
loc_CA02:
                
                moveq   #0,d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #$3F,d1 
                beq.w   loc_CA7A
                bsr.w   MakeTargetListEverybody
                bsr.w   GetTargetsReachableBySpell
                move.w  ((word_FF8806-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_CA7A
                move.l  d1,-(sp)
                btst    #7,d0
                bne.s   loc_CA3E
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_CA38
                bsr.w   MakeTargetListEnemies
                bra.s   loc_CA3C
loc_CA38:
                
                bsr.w   MakeTargetListAllies
loc_CA3C:
                
                bra.s   loc_CA50
loc_CA3E:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_CA4C
                bsr.w   MakeTargetListAllies
                bra.s   loc_CA50
loc_CA4C:
                
                bsr.w   MakeTargetListEnemies
loc_CA50:
                
                move.l  (sp)+,d1
                lea     (word_FF880C).l,a0
                move.w  d1,(a0)
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((byte_FF88CE-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
loc_CA66:
                
                move.b  (a0,d7.w),d2
                move.b  (a1,d7.w),d5
                bsr.w   sub_CAEA
                move.b  d6,(a2,d7.w)
                dbf     d7,loc_CA66
loc_CA7A:
                
                bsr.w   MakeTargetListEverybody
                bsr.w   GetTargetsReachableByAttack
                move.w  ((FF8804_LOADING_SPACE-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_CAE4
                move.l  d1,-(sp)
                btst    #7,d0
                bne.s   loc_CAA8
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_CAA2
                bsr.w   MakeTargetListEnemies
                bra.s   loc_CAA6
loc_CAA2:
                
                bsr.w   MakeTargetListAllies
loc_CAA6:
                
                bra.s   loc_CABA
loc_CAA8:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   loc_CAB6
                bsr.w   MakeTargetListAllies
                bra.s   loc_CABA
loc_CAB6:
                
                bsr.w   MakeTargetListEnemies
loc_CABA:
                
                move.l  (sp)+,d1
                lea     ((byte_FF880E-$1000000)).w,a0
                lea     ((byte_FF889E-$1000000)).w,a1
                lea     ((byte_FF892E-$1000000)).w,a2
loc_CAC8:
                
                move.b  (a0,d7.w),d2
                move.b  (a1,d7.w),d5
                move.b  #$3F,d1 
                bsr.w   sub_CAEA
                move.b  d6,(a2,d7.w)
                dbf     d7,loc_CAC8
                bsr.w   MakeTargetListEverybody
loc_CAE4:
                
                movem.l (sp)+,d1-a2
                rts

    ; End of function sub_C958


; =============== S U B R O U T I N E =======================================

sub_CAEA:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #0,d6
                cmpi.b  #$3F,d1 
                bne.s   loc_CAFE
                move.b  d2,d1
                bsr.w   sub_CB18
                bra.s   loc_CB12
loc_CAFE:
                
                move.b  d0,d3
                move.b  d2,d0
                bsr.w   CreateTargetGrid
                tst.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                beq.s   loc_CB12
                move.b  d3,d0
                bsr.w   sub_CBA2
loc_CB12:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CAEA


; =============== S U B R O U T I N E =======================================

sub_CB18:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.b  d1,d3
                move.b  d0,d4
                bsr.w   sub_CC0C
                btst    #7,d0
                beq.s   loc_CB3A
                jsr     GetCharacterWord34
                move.w  d1,d2
                rol.w   #4,d2
                andi.w  #$F,d2
                bra.s   loc_CB3E
loc_CB3A:
                
                move.w  #2,d2
loc_CB3E:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #2,d2
                movea.l off_CB62(pc,d2.w),a0
                move.b  d3,d0
                bsr.w   sub_CC8A
                clr.w   d7
                jsr     (a0)
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CB18

off_CB62:       dc.l sub_CCA0
                dc.l sub_CCD4
                dc.l sub_CD18
                dc.l sub_CD4C
                dc.l sub_CCA0
                dc.l sub_CCD4
                dc.l sub_CCA0
                dc.l sub_CD4C
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4
                dc.l sub_CCD4

; =============== S U B R O U T I N E =======================================

sub_CBA2:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  d0,d4
                move.b  d1,d3
                btst    #7,d0
                beq.s   loc_CBC0
                jsr     GetCharacterWord34
                move.w  d1,d2
                rol.w   #4,d2
                andi.w  #3,d2
                bra.s   loc_CBC4
loc_CBC0:
                
                move.w  #2,d2
loc_CBC4:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #2,d2
                movea.l off_CB62(pc,d2.w),a0
                move.b  d3,d1
                moveq   #0,d3
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a1
loc_CBE0:
                
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_CC04
loc_CBEA:
                
                move.b  (a1)+,d0
                bsr.w   GetSpellPowerAdjustedForResistance
                bsr.w   sub_CC8A
                move.l  d7,-(sp)
                move.w  #1,d7
                jsr     (a0)
                move.l  (sp)+,d7
                add.w   d6,d3
                dbf     d7,loc_CBEA
loc_CC04:
                
                move.w  d3,d6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CBA2


; =============== S U B R O U T I N E =======================================

sub_CC0C:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.b  d1,d2
                jsr     GetCurrentATT
                move.b  d2,d0
                move.w  d1,d2
                jsr     GetCurrentDEF
                sub.w   d1,d2
                bhi.s   loc_CC28
                moveq   #1,d2
loc_CC28:
                
                move.w  d2,d6
                jsr     GetLandEffectSetting
                move.w  #$100,d2
                tst.b   d1
                beq.w   loc_CC4A
                move.w  #$E6,d2 
                cmpi.b  #1,d1
                beq.w   loc_CC4A
                move.w  #$CD,d2 
loc_CC4A:
                
                mulu.w  d2,d6
                lsr.w   #8,d6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CC0C


; =============== S U B R O U T I N E =======================================

; In: D0 = target combatant index
;     D1 = spell index
; 
; Out: D6 = adjusted power

GetSpellPowerAdjustedForResistance:
                
                movem.l d0-d5/d7-a0,-(sp)
                bsr.w   GetResistanceToSpell
                jsr     GetSpellDefAddress
                moveq   #0,d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                move.w  d6,d3
                lsr.w   #2,d3           ; D3 = spellPower/4
                cmpi.b  #RESISTANCESETTING_MINOR,d2 ; check if target has minor resistance
                bne.s   @CheckMajorResistance
                sub.w   d3,d6           ; -25% spell power
@CheckMajorResistance:
                
                cmpi.b  #RESISTANCESETTING_MAJOR,d2
                bne.s   @CheckWeakness
                lsr.w   #1,d6           ; -50% spell power
@CheckWeakness:
                
                cmpi.b  #RESISTANCESETTING_WEAKNESS,d2
                bne.s   @Done
                add.w   d3,d6           ; +25% spell power
@Done:
                
                movem.l (sp)+,d0-d5/d7-a0
                rts

    ; End of function GetSpellPowerAdjustedForResistance


; =============== S U B R O U T I N E =======================================

sub_CC8A:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetCurrentHP
                sub.w   d6,d1
                bcc.s   loc_CC9A
                moveq   #0,d1
loc_CC9A:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_CC8A


; =============== S U B R O U T I N E =======================================

sub_CCA0:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CCAE
                addi.w  #$F,d6
loc_CCAE:
                
                lea     (ENEMY_TARGETTING_COMMAND_LIST).l,a1
                clr.w   d5
                move.b  d4,d5
                andi.b  #$7F,d5 
                clr.w   d7
                move.b  (a1,d5.w),d7
                cmp.b   d0,d7
                bne.s   loc_CCCA
                addi.w  #2,d6
loc_CCCA:
                
                bsr.w   sub_CE36
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CCA0


; =============== S U B R O U T I N E =======================================

sub_CCD4:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CCE2
                addi.w  #$F,d6
loc_CCE2:
                
                bsr.w   sub_D2F8
                bcs.s   loc_CCEA
                addq.w  #1,d6
loc_CCEA:
                
                bsr.w   sub_D362
                bcs.s   loc_CCF2
                addq.w  #1,d6
loc_CCF2:
                
                lea     (ENEMY_TARGETTING_COMMAND_LIST).l,a1
                clr.w   d5
                move.b  d4,d5
                andi.b  #$7F,d5 
                clr.w   d7
                move.b  (a1,d5.w),d7
                cmp.b   d0,d7
                bne.s   loc_CD0E
                addi.w  #2,d6
loc_CD0E:
                
                bsr.w   sub_CE36
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CCD4


; =============== S U B R O U T I N E =======================================

sub_CD18:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #3,d6
                jsr     j_RandomUnderD6
                tst.b   d7
                beq.w   loc_CD3C
                move.b  d5,d0
                add.b   d0,d0
                moveq   #$12,d6
                sub.b   d0,d6
                bcc.s   loc_CD36
                moveq   #0,d6
loc_CD36:
                
                addq.w  #1,d6
                bra.w   loc_CD46
loc_CD3C:
                
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CD46
                addi.w  #$F,d6
loc_CD46:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CD18


; =============== S U B R O U T I N E =======================================

sub_CD4C:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CD5A
                addi.w  #$F,d6
loc_CD5A:
                
                bsr.w   sub_D362
                bcs.s   loc_CD62
                addq.w  #1,d6
loc_CD62:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CD4C


; =============== S U B R O U T I N E =======================================

; In: D0 = heal target character index
;     D4 = heal spell index

sub_CD68:
                
                movem.l d0-d1/d3-a6,-(sp)
                clr.w   d5
                move.b  d4,d5
                lsr.w   #6,d5
                andi.w  #3,d5
                move.w  d1,d3
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                sub.w   d2,d1           ; d1 = max HP - current HP
                moveq   #$FFFFFFFF,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL1,d1
                bls.w   loc_CDDC
                moveq   #0,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL2,d1
                bls.w   loc_CDB8
                cmpi.w  #2,d5
                bcs.w   loc_CDB8
                moveq   #2,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL3,d1
                bls.w   loc_CDB8
                cmpi.w  #3,d5
loc_CDB2:
                
                bcs.w   loc_CDB8
                moveq   #3,d2
loc_CDB8:
                
                move.w  d3,d0
                jsr     GetCurrentMP
                move.w  d1,d3
loc_CDC2:
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #5,d1
                add.w   d4,d1
                jsr     GetSpellDefAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3 ; check if spell cost is more than current MP
                bcc.w   loc_CDDC
                dbf     d2,loc_CDC2
loc_CDDC:
                
                cmpi.b  #1,d2
                bne.s   loc_CDE4
                moveq   #0,d2
loc_CDE4:
                
                movem.l (sp)+,d0-d1/d3-a6
                rts

    ; End of function sub_CD68


; =============== S U B R O U T I N E =======================================

sub_CDEA:
                
                movem.l d0-d5/d7-a6,-(sp)
                bsr.w   GetLowerMoveType
                cmpi.w  #$D,d1
                bne.s   loc_CE00
                move.w  #$D,d6
                bra.w   loc_CE30
loc_CE00:
                
                cmpi.w  #$E,d1
                bne.s   loc_CE0E
                move.w  #$D,d6
                bra.w   loc_CE30
loc_CE0E:
                
                bsr.w   GetUpperMoveType
                lea     (byte_D8F4).l,a0
                move.w  #$D,d6
                clr.w   d0
loc_CE1E:
                
                cmp.b   (a0,d0.w),d1
                bne.s   loc_CE28
                bra.w   loc_CE30
loc_CE28:
                
                addi.w  #1,d0
                subq.w  #1,d6
                bne.s   loc_CE1E
loc_CE30:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CDEA


; =============== S U B R O U T I N E =======================================

sub_CE36:
                
                movem.l d0-d5/d7-a6,-(sp)
                clr.w   d5
                move.b  d0,d5
                move.w  d4,d0
                btst    #7,d0
                beq.s   loc_CE4A
                bra.w   loc_CE90
loc_CE4A:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_CE56
                bra.w   loc_CE90
loc_CE56:
                
                cmpi.b  #1,d7
                bne.s   loc_CE66
                lea     (byte_DA22).l,a4
                bra.w   loc_CE80
loc_CE66:
                
                clr.l   d0
                move.b  d4,d0
                jsr     GetUpperMoveType
                clr.l   d3
                move.b  d1,d3
                lea     (off_D9C2).l,a4 
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
loc_CE80:
                
                clr.w   d0
                move.b  d5,d0
                bsr.w   GetClass        
                clr.w   d2
                move.b  (a4,d1.w),d2
                add.w   d2,d6
loc_CE90:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_CE36


; =============== S U B R O U T I N E =======================================

sub_CE96:
                
                movem.l d0/d3-a6,-(sp)
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   MakeTargetListEverybody
                moveq   #0,d3
                moveq   #0,d4
                move.w  d1,d5
                move.w  d2,d6
                bsr.w   GetClosestAttackPosition
                cmpi.w  #$FFFF,d1
                bne.w   loc_CECC
                moveq   #1,d3
                moveq   #1,d4
                move.w  d5,d1
                move.w  d6,d2
                bsr.w   GetClosestAttackPosition
loc_CECC:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_CE96


; =============== S U B R O U T I N E =======================================

; Get highest usable level of spell D1, considering current MP and highest known level
; 
;       In: D0 = combatant index
;           D1 = spell index
; 
;       Out: D1 = spell index

GetHighestUsableSpellLevel:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMP
                move.w  d1,d3
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsr.w   #6,d2
                andi.w  #3,d2
loc_CEEC:
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #6,d1
                add.w   d4,d1
                jsr     GetSpellDefAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3
                bcc.w   loc_CF08
                dbf     d2,loc_CEEC
                moveq   #SPELL_NOTHING,d1
loc_CF08:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetHighestUsableSpellLevel


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = spell index
; 
; Out: D1 = spell index
;      D2 = slot

GetSlotContainingSpell:
                
                movem.l d0/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  d1,d4
                moveq   #0,d3
loc_CF1A:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d2
                cmp.b   d4,d2
                beq.w   loc_CF38
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF1A
                moveq   #SPELL_NOTHING,d1
loc_CF38:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingSpell


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item index
; 
; Out: D1 = item index
;      D2 = slot

GetSlotContainingItem:
                
                movem.l d0/d3-a6,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d4
                moveq   #0,d3
loc_CF4C:
                
                move.w  d3,d1
                jsr     GetItemAndNumberOfItems
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmp.w   d4,d2
                beq.w   loc_CF6C
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF4C
                move.w  #ITEM_NOTHING,d1
loc_CF6C:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingItem


; =============== S U B R O U T I N E =======================================

GetNextUsableAttackSpell:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d7
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_CF88
                move.w  #1,d7
loc_CF88:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_CFA0
                bra.w   loc_CFFC
loc_CFA0:
                
                tst.b   d7
                beq.s   loc_CFEA
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5
                bne.s   loc_CFB4
                bra.w   loc_CFEA
loc_CFB4:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   loc_CFBE
                bra.w   loc_CFEA
loc_CFBE:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   loc_CFC8
                bra.w   loc_CFEA
loc_CFC8:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   loc_CFD2
                bra.w   loc_CFEA
loc_CFD2:
                
                cmpi.b  #SPELL_KATON,d5
                bne.s   loc_CFDC
                bra.w   loc_CFEA
loc_CFDC:
                
                cmpi.b  #SPELL_RAIJIN,d5
                bne.s   loc_CFE6
                bra.w   loc_CFEA
loc_CFE6:
                
                bra.w   loc_CFFC
loc_CFEA:
                
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                beq.w   loc_D00C
loc_CFFC:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   loc_CF88
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D012
loc_D00C:
                
                bsr.w   GetHighestUsableSpellLevel
                move.w  d3,d2
loc_D012:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackSpell


; =============== S U B R O U T I N E =======================================

; Get next healing spell known by combatant
; 
;       In: D0 = entity index
;           D3 = starting spell slot
; 
;       Out: D1 = spell index
;            D2 = spell slot

GetNextHealingSpell:
                
                movem.l d0/d3-a6,-(sp)
loc_D01C:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_D034
                bra.w   loc_D04A
loc_D034:
                
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.w   loc_D05A
loc_D04A:
                
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_D01C
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D05C
loc_D05A:
                
                move.w  d3,d2
loc_D05C:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextHealingSpell


; =============== S U B R O U T I N E =======================================

GetNextStatusSpell:
                
                movem.l d0/d3-a6,-(sp)
loc_D066:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_D07E
                bra.w   loc_D094
loc_D07E:
                
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_STATUS,d2
                beq.w   loc_D0A4
loc_D094:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   loc_D066
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D0A6
loc_D0A4:
                
                move.w  d3,d2
loc_D0A6:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextStatusSpell


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast BLAZE/FREEZE/BOLT/BLAST
; <HARDCODED>
; 
;       In: D0 = combatant index
;           D3 = starting item slot
; 
;       Out: D1 = item index
;            D2 = item slot

GetNextUsableAttackItem:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_D0C0
                move.w  #1,d6
loc_D0C0:
                
                move.w  d3,d1
                jsr     GetItemAndNumberOfItems
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   loc_D0D2
                bra.w   loc_D0DC
loc_D0D2:
                
                jsr     IsItemUsableInBattle
                bcs.w   loc_D0E8
loc_D0DC:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   loc_D0C0
                bra.w   loc_D156
loc_D0E8:
                
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                bne.w   loc_D0F8
                btst    #ITEMENTRY_BIT_ENEMYUSE,d1
                beq.w   loc_D156
loc_D0F8:
                
                jsr     GetItemDefAddress
                move.w  d1,d7
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                tst.b   d6
                beq.s   loc_D13C
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5
                bne.s   loc_D11A
                bra.w   loc_D13C
loc_D11A:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   loc_D124
                bra.w   loc_D13C
loc_D124:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   loc_D12E
                bra.w   loc_D13C
loc_D12E:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   loc_D138
                bra.w   loc_D13C
loc_D138:
                
                bra.w   loc_D156
loc_D13C:
                
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.w   loc_D156
                move.w  d3,d2
                move.w  d7,d1
                bra.w   loc_D15A
loc_D156:
                
                move.w  #ITEM_NOTHING,d1
loc_D15A:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackItem


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast a healing spell
; <HARDCODED>
; 
;       In: D0 = combatant index
;           D3 = starting item slot
; 
;       Out: D1 = item index
;            D2 = item slot

GetNextUsableHealingItem:
                
                movem.l d0/d3-a6,-(sp)
loc_D164:
                
                move.w  d3,d1
                jsr     GetItemAndNumberOfItems
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   loc_D176
                bra.w   loc_D1BA
loc_D176:
                
                move.w  d1,d7
                jsr     IsItemUsableInBattle
                bcc.s   loc_D1BA
                cmpi.b  #8,d7
                beq.s   loc_D18E
                btst    #ITEMENTRY_BIT_ENEMYUSE,d1
                beq.w   loc_D1BA
loc_D18E:
                
                jsr     GetItemDefAddress
                move.w  d1,d7
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                bne.w   loc_D1BA
                move.w  d3,d2
                move.w  d7,d1
                bra.w   loc_D1C6
loc_D1BA:
                
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_D164
                move.w  #ITEM_NOTHING,d1
loc_D1C6:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableHealingItem


; =============== S U B R O U T I N E =======================================

GetTargetsReachableByAttack:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a1
                lea     ((byte_FF880E-$1000000)).w,a2
                lea     ((byte_FF889E-$1000000)).w,a3
                bsr.w   GetWeaponRange  
                bra.w   loc_D22E

    ; End of function GetTargetsReachableByAttack


; =============== S U B R O U T I N E =======================================

GetTargetsReachableByItem:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((byte_FF8808-$1000000)).w,a1
                lea     ((byte_FF886E-$1000000)).w,a2
                lea     ((byte_FF88FE-$1000000)).w,a3
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                bra.w   loc_D22E

    ; End of function GetTargetsReachableByItem


; =============== S U B R O U T I N E =======================================

GetTargetsReachableBySpell:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((word_FF8806-$1000000)).w,a1
                lea     ((byte_FF883E-$1000000)).w,a2
                lea     ((byte_FF88CE-$1000000)).w,a3
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
loc_D22E:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_D23A
                eori.b  #COMBATANT_MASK_ENEMY_BIT,d0 ; flip enemy bit, to get the opposite type when muddled
loc_D23A:
                
                btst    #7,d0
                beq.s   loc_D248
                moveq   #COMBATANT_ALLIES_START,d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                bra.s   loc_D250
loc_D248:
                
                move.b  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
loc_D250:
                
                move.w  #0,(a1)
loc_D254:
                
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_D262
                bra.w   loc_D28A        ; combatant is dead, so skip
loc_D262:
                
                jsr     GetYPos
                move.b  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.w   loc_D28A
                addq.w  #1,(a1)
                move.b  d0,(a2)+
                move.b  d0,d5
                bsr.w   GetDestinationMoveCost
                move.b  d0,(a3)+
                move.b  d5,d0
loc_D28A:
                
                addq.b  #1,d0
                dbf     d7,loc_D254
                movem.l (sp)+,d0-d5/d7-a3
                rts

    ; End of function GetTargetsReachableBySpell


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; 
; Out: carry clear if true

IsCombatantAtLessThanHalfHP:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
@Continue:
                
                add.w   d2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsCombatantAtLessThanHalfHP


; =============== S U B R O U T I N E =======================================

sub_D2D2:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
loc_D2E4:
                
                bra.w   loc_D304
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D304

    ; End of function sub_D2D2


; =============== S U B R O U T I N E =======================================

sub_D2F8:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D304:
                
                mulu.w  #3,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D2F8


; =============== S U B R O U T I N E =======================================

sub_D310:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D342

    ; End of function sub_D310


; =============== S U B R O U T I N E =======================================

sub_D326:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D342

    ; End of function sub_D326


; =============== S U B R O U T I N E =======================================

sub_D336:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP

    ; End of function sub_D336


; START OF FUNCTION CHUNK FOR sub_D310

loc_D342:
                
                lsl.w   #2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

; END OF FUNCTION CHUNK FOR sub_D310


; =============== S U B R O U T I N E =======================================

sub_D34C:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D37E

    ; End of function sub_D34C


; =============== S U B R O U T I N E =======================================

sub_D362:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D37E
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D37E:
                
                mulu.w  #5,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D362


; =============== S U B R O U T I N E =======================================

sub_D38A:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D3BC
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D3BC
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D3BC:
                
                mulu.w  #3,d2
                add.w   d1,d1
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D38A


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

    ; End of function sub_D3F0


; START OF FUNCTION CHUNK FOR sub_D3CA

loc_D3FC:
                
                mulu.w  #3,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

; END OF FUNCTION CHUNK FOR sub_D3CA


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

sub_D430:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-2
                move.b  d0,-1(a6)
                move.b  d1,-2(a6)
                clr.w   d0
                move.b  -1(a6),d0
                bsr.w   GetCurrentTerrainType
                btst    #7,d0
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

sub_D460:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #5,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D47C
                bra.w   loc_D4DA
loc_D47C:
                
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
loc_D48E:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D48E
                lea     ((byte_FF895E-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
                lea     ((byte_FF883E-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((word_FF8806-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
loc_D4AE:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
loc_D4B4:
                
                move.w  #$46,d1 
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

sub_D4E0:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #$46,d1 
                bsr.w   GetTargetsReachableBySpell
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D4FC
                bra.w   loc_D55A
loc_D4FC:
                
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
loc_D50E:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D50E
                lea     ((byte_FF895E-$1000000)).w,a0
                lea     ((byte_FF880E-$1000000)).w,a1
                lea     ((byte_FF883E-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((word_FF8806-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
loc_D52E:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
                move.w  #$46,d1 
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

sub_D560:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #6,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D57C
                bra.w   loc_D626
loc_D57C:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a4
loc_D592:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  #6,d1
                bsr.w   CreateTargetGrid
                bsr.w   sub_D6F2
                move.b  d1,(a2)+
                dbf     d5,loc_D592
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a1
loc_D5BA:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D5BA
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a4
                lea     ((byte_FF892E-$1000000)).w,a5
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
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   loc_D614
                bra.w   loc_D626
loc_D614:
                
                subi.w  #1,d4
                lea     ((byte_FF892E-$1000000)).w,a0
                lea     ((byte_FF895E-$1000000)).w,a1
loc_D620:
                
                move.b  (a0)+,(a1)+
                dbf     d4,loc_D620
loc_D626:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_D560


; =============== S U B R O U T I N E =======================================

sub_D62C:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #$47,d1 
                bsr.w   GetTargetsReachableBySpell
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D648
                bra.w   loc_D6EC
loc_D648:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
loc_D65A:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  #$47,d1 
                bsr.w   CreateTargetGrid
                move.w  (a3),d2
                move.b  d2,(a2)+
                dbf     d5,loc_D65A
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a0
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a1
loc_D680:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D680
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((byte_FF883E-$1000000)).w,a1
                lea     ((byte_FF895E-$1000000)).w,a2
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a4
                lea     ((byte_FF892E-$1000000)).w,a5
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
                
                lea     ((word_FF8806-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   loc_D6DA
                bra.w   loc_D6EC
loc_D6DA:
                
                subi.w  #1,d4
                lea     ((byte_FF892E-$1000000)).w,a0
                lea     ((byte_FF895E-$1000000)).w,a1
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
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a0
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a1
                move.w  (a0),d7
                subi.w  #1,d7
                clr.w   d6
                clr.w   d5
loc_D708:
                
                clr.w   d0
                move.b  (a1,d5.w),d0
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #$3F,d1 
                beq.s   loc_D722
                addi.w  #1,d6
                bra.w   loc_D732
loc_D722:
                
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #$3F,d1 
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
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a2
                clr.w   d4
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
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
                cmpi.b  #$3F,d1 
                bne.s   loc_D792
                andi.b  #$7F,d0 
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
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a2
                clr.w   d4
                clr.w   d5
                lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a3
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
                cmpi.b  #$3F,d1 
                bne.s   loc_D814
                andi.b  #$7F,d0 
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

MoveTypeTerrainCosts:
                incbin "data/battles/global/movetypeterraincosts.bin"
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

MakeRangeLists:
                
                movem.l d0-a5,-(sp)
                link    a6,#-$40
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
                move.w  -$40(a6,d1.w),d5
                btst    #$E,d5
                bne.s   loc_DB38
                move.b  (a3,d5.w),-$40(a6,d1.w)
                move.b  (a2,d5.w),-$3F(a6,d1.w)
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
                move.b  -$40(a6,d1.w),(a3,d5.w)
                move.b  -$3F(a6,d1.w),(a2,d5.w)
                move.w  d5,-$40(a6,d1.w)
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

; unused, pointless

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

