
; ASM FILE code\common\scripting\entity\entityfunctions_1.asm :
; 0x444A2..0x448C4 : Entity functions

; =============== S U B R O U T I N E =======================================

battleEntity = -4

sub_444A2:
                
                link    a6,#-16
                move.w  d0,battleEntity(a6)
                movem.l d0-d7,-(sp)
                jsr     j_GetYPos
                move.w  d1,d2
                jsr     j_GetXPos
                move.w  d1,-(sp)
                jsr     j_GetUpperMoveType
                clr.w   d6
                cmpi.b  #5,d1
                bne.s   loc_444CE
                addq.w  #1,d6
loc_444CE:
                
                cmpi.b  #6,d1
                bne.s   loc_444D6
                addq.w  #1,d6
loc_444D6:
                
                swap    d6
                move.w  (sp)+,d1
                andi.w  #$3F,d1 
                muls.w  #$180,d1
                andi.w  #$3F,d2 
                muls.w  #$180,d2
                moveq   #3,d3
                move.l  #eas_Idle,d5
                bsr.w   GetCombatantMapSprite
                bsr.w   sub_44536
                movem.l a0-a1,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a0
                move.l  a0,-(sp)
                move.w  #$8F,d7 
loc_4450A:
                
                clr.l   (a0)+
                dbf     d7,loc_4450A
                movea.l (sp)+,a0
                lea     ($7000).w,a1
                mulu.w  #$240,d6
                adda.w  d6,a1
                move.w  #$120,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                movem.l (sp)+,a0-a1
                movem.l (sp)+,d0-d7
                unlk    a6
                rts

    ; End of function sub_444A2


; =============== S U B R O U T I N E =======================================


sub_44536:
                
                movem.l d0-d5/d7-a0,-(sp)
                move.w  d0,-(sp)
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                clr.w   d0
                moveq   #$3F,d7 
loc_44544:
                
                cmp.b   (a0),d0
                bge.s   loc_4454A
                move.b  (a0),d0
loc_4454A:
                
                addq.l  #1,a0
                dbf     d7,loc_44544
                addq.w  #1,d0
                move.w  (sp)+,d7
                tst.b   d7
                bpl.s   loc_4455C
                subi.w  #$60,d7 
loc_4455C:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                move.b  d0,(a0,d7.w)
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                movem.l (sp)+,d0-d5/d7-a0
                rts

    ; End of function sub_44536


; =============== S U B R O U T I N E =======================================


InitializeNewEntity:
                
                movem.l d0-a0,-(sp)
                move.w  d0,-(sp)
                tst.b   d0
                blt.s   loc_4457E
                bsr.w   GetAllyMapSprite
loc_4457E:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                clr.w   d0
                moveq   #$3E,d7 
loc_44586:
                
                cmp.b   (a0),d0
                bge.s   loc_4458C
                move.b  (a0),d0
loc_4458C:
                
                addq.l  #1,a0
                dbf     d7,loc_44586
                addq.w  #1,d0
                move.w  (sp)+,d7
                move.w  d7,-(sp)
                tst.b   d7
                bpl.s   loc_445A0
                subi.w  #$60,d7 
loc_445A0:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                adda.w  d7,a0
                move.w  (sp)+,d7
                move.b  d0,(a0)
                clr.l   d6
                move.w  d0,d6
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                bsr.w   DeclareNewEntity
                move.w  d3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).w
                movem.l (sp)+,d0-a0
                rts

    ; End of function InitializeNewEntity


; =============== S U B R O U T I N E =======================================


DeclareNewEntity:
                
                move.l  a0,-(sp)
                move.w  d0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lsl.w   #5,d0
                adda.w  d0,a0
                move.w  (sp)+,d0
                move.w  d1,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                clr.l   4(a0)
                clr.l   8(a0)
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  d3,ENTITYDEF_OFFSET_FACING(a0)
                move.b  d6,ENTITYDEF_OFFSET_ENTNUM(a0)
                swap    d6
                move.b  d6,$11(a0)
                swap    d6
                move.b  d4,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                tst.l   d5
                bpl.s   loc_4463C
                move.l  (ENTITY_WALKING_PARAMS).l,-(sp)
                movem.l d0-d4,-(sp)
                move.w  d5,d2
                move.b  d5,d3
                ext.w   d3
                asr.w   #8,d2
                swap    d5
                move.w  d5,d4
                asr.w   #8,d4
                move.b  d5,d1
                ext.w   d1
                swap    d5
                cmpi.b  #$FF,d4
                bne.s   loc_44630
                bsr.w   SetWalkingActscript
                bra.s   loc_44634
loc_44630:
                
                bsr.w   sub_44D0E
loc_44634:
                
                movem.l (sp)+,d0-d4
                movem.l (sp)+,d5
loc_4463C:
                
                move.l  d5,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                clr.l   $18(a0)
                move.w  #$E040,ENTITYDEF_OFFSET_FLAGS_A(a0)
                move.b  d0,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
                move.b  d0,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)
                addq.b  #1,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
                movea.l (sp)+,a0
                rts

    ; End of function DeclareNewEntity


; =============== S U B R O U T I N E =======================================


ClearEntities:
                
                movem.l d7-a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  #$30,d7 
loc_44666:
                
                move.l  #$70007000,(a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                move.l  #$70007000,(a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                dbf     d7,loc_44666
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                moveq   #$F,d7
loc_44688:
                
                clr.l   (a0)+
                dbf     d7,loc_44688
                move.l  #FF5600_LOADING_SPACE,(ENTITY_WALKING_PARAMS).l
                jsr     (sub_19B0).w
                movem.l (sp)+,d7-a0
                rts

    ; End of function ClearEntities


; =============== S U B R O U T I N E =======================================

battleEntity = -4

MoveEntitiesToBattlePositions:
                
                movem.l d0-a1,-(sp)
                link    a6,#65520
                bsr.s   ClearEntities
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                clr.w   battleEntity(a6)
                clr.w   d0
loc_446B8:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetYPos
                move.w  (sp)+,d0
                move.w  d1,d2
                tst.b   d2
                bmi.w   loc_44732
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetXPos
                move.w  (sp)+,d0
                tst.b   d1
                bmi.w   loc_44732
                movem.w d0-d1,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetUpperMoveType
                clr.w   d6
                cmpi.b  #5,d1
                bne.s   loc_446FA
                addq.w  #1,d6
loc_446FA:
                
                cmpi.b  #6,d1
                bne.s   loc_44702
                addq.w  #1,d6
loc_44702:
                
                swap    d6
                movem.w (sp)+,d0-d1
                andi.w  #$3F,d1 
                muls.w  #$180,d1
                andi.w  #$3F,d2 
                muls.w  #$180,d2
                moveq   #3,d3
                move.l  #eas_Standing,d5
                bsr.w   GetCombatantMapSprite
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                move.b  d0,(a1)+
                addq.w  #1,d0
                bra.w   loc_44736
loc_44732:
                
                move.b  #$FF,(a1)+
loc_44736:
                
                addq.w  #1,battleEntity(a6)
                dbf     d7,loc_446B8
                lea     ((byte_FFB160-$1000000)).w,a1
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,battleEntity(a6)
loc_4474A:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetCharacterWord34
                move.w  (sp)+,d0
                andi.w  #8,d1
                bne.w   loc_447F6
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetYPos
                move.w  (sp)+,d0
                move.w  d1,d2
                tst.b   d2
                bmi.w   loc_447F6
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetXPos
                move.w  (sp)+,d0
                tst.b   d1
                bmi.w   loc_447F6
                movem.w d0-d1,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetUpperMoveType
                clr.w   d6
                cmpi.b  #5,d1
                bne.s   loc_447A2
                addq.w  #1,d6
loc_447A2:
                
                cmpi.b  #6,d1
                bne.s   loc_447AA
                addq.w  #1,d6
loc_447AA:
                
                swap    d6
                movem.w (sp)+,d0-d1
                andi.w  #$3F,d1 
                muls.w  #$180,d1
                andi.w  #$3F,d2 
                muls.w  #$180,d2
                moveq   #3,d3
                move.l  #eas_Standing,d5
                bsr.w   GetCombatantMapSprite
                cmpi.b  #$F0,d4
                bcs.s   loc_447E8
                move.w  d0,-(sp)
                move.w  #$2F,d0 
                move.w  #$20,d6 
                bsr.w   DeclareNewEntity
                move.b  d0,(a1)+
                move.w  (sp)+,d0
                bra.w   loc_447FA
loc_447E8:
                
                move.w  d0,d6
                move.b  d0,(a1)+
                bsr.w   DeclareNewEntity
                addq.w  #1,d0
                bra.w   loc_447FA
loc_447F6:
                
                move.b  #$FF,(a1)+
loc_447FA:
                
                addq.w  #1,battleEntity(a6)
                dbf     d7,loc_4474A
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$1F4,d1
                jsr     j_CheckFlag
                bne.w   loc_448BC
                lea     ((byte_FFB160-$1000000)).w,a1
                lea     BattleNeutralEntities(pc), a0
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
loc_44824:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_448BC
                cmp.w   (a0)+,d1
                beq.s   loc_44838
loc_44830:
                
                cmpi.w  #$FFFF,(a0)+
                beq.s   loc_44824
                bra.s   loc_44830
loc_44838:
                
                move.w  #$9F,battleEntity(a6) 
loc_4483E:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_448BC
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                clr.w   d1
                jsr     j_SetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_SetStatusEffects
                jsr     j_GetCharacterWord34
                ori.w   #8,d1
                jsr     j_SetCharacterWord34
                clr.w   d1
                move.b  (a0)+,d1
                move.w  d1,d3
                jsr     j_SetXPos
                move.b  (a0)+,d1
                move.w  d1,d2
                jsr     j_SetYPos
                move.w  (sp)+,d0
                move.w  d3,d1
                andi.w  #$3F,d1 
                muls.w  #$180,d1
                andi.w  #$3F,d2 
                muls.w  #$180,d2
                move.b  (a0)+,d3
                clr.w   d4
                move.b  (a0)+,d4
                move.l  (a0)+,d5
                clr.l   d6
                move.w  d0,d6
                move.b  d0,-(a1)
                bsr.w   DeclareNewEntity
                addq.w  #1,d0
                bra.w   loc_448B6
                move.b  #$FF,(a1)+
loc_448B6:
                
                subq.w  #1,battleEntity(a6)
                bra.s   loc_4483E
loc_448BC:
                
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function MoveEntitiesToBattlePositions

