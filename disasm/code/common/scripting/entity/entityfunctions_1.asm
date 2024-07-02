
; ASM FILE code\common\scripting\entity\entityfunctions_1.asm :
; 0x444A2..0x448C4 : Entity functions

; =============== S U B R O U T I N E =======================================

battleEntity = -4

sub_444A2:
                
                link    a6,#-16
                move.w  d0,battleEntity(a6)
                movem.l d0-d7,-(sp)
                jsr     j_GetCombatantY
                move.w  d1,d2
                jsr     j_GetCombatantX
                move.w  d1,-(sp)
                jsr     j_GetMoveType
                clr.w   d6
                cmpi.b  #MOVETYPE_LOWER_FLYING,d1
                bne.s   loc_444CE
                addq.w  #1,d6
loc_444CE:
                
                cmpi.b  #MOVETYPE_LOWER_HOVERING,d1
                bne.s   loc_444D6
                addq.w  #1,d6
loc_444D6:
                
                swap    d6
                move.w  (sp)+,d1
                andi.w  #$3F,d1 
                muls.w  #MAP_TILE_SIZE,d1
                andi.w  #$3F,d2 
                muls.w  #MAP_TILE_SIZE,d2
                moveq   #3,d3
                move.l  #eas_Idle,d5
                bsr.w   GetCombatantMapsprite
                bsr.w   GetEntityEvent  
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

; In: d0.w = battle entity


GetEntityEvent:
                
                movem.l d0-d5/d7-a0,-(sp)
                move.w  d0,-(sp)
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                clr.w   d0
                moveq   #ENTITIES_TOTAL_COUNTER,d7
@CheckEntityEvent_Loop:
                
                cmp.b   (a0),d0
                bge.s   @NextEntityEvent
                move.b  (a0),d0
@NextEntityEvent:
                
                addq.l  #1,a0
                dbf     d7,@CheckEntityEvent_Loop
                
                addq.w  #1,d0
                move.w  (sp)+,d7
                tst.b   d7
                bpl.s   @Ally
                subi.w  #ENTITY_ENEMY_INDEX_DIFFERENCE,d7
@Ally:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                move.b  d0,(a0,d7.w)
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                movem.l (sp)+,d0-d5/d7-a0
                rts

    ; End of function GetEntityEvent


; =============== S U B R O U T I N E =======================================


InitializeNewEntity:
                
                movem.l d0-a0,-(sp)
                move.w  d0,-(sp)
                tst.b   d0
                blt.s   loc_4457E
                bsr.w   GetAllyMapsprite
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
                bpl.s   @Ally
                subi.w  #ENTITY_ENEMY_INDEX_DIFFERENCE,d7
@Ally:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                adda.w  d7,a0
                move.w  (sp)+,d7
                move.b  d0,(a0)
                clr.l   d6
                move.w  d0,d6
                mulu.w  #MAP_TILE_SIZE,d1
                mulu.w  #MAP_TILE_SIZE,d2
                bsr.w   DeclareNewEntity
                move.w  d3,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                movem.l (sp)+,d0-a0
                rts

    ; End of function InitializeNewEntity


; =============== S U B R O U T I N E =======================================

; In: d0.w = index
;     d1.w = initial X
;     d2.w = initial Y
;     d3.b = initial facing
;     d4.b = mapsprite
;     d5.l = actscript address
;     d6.w = entity index (lower byte), layer (upper byte)


DeclareNewEntity:
                
                move.l  a0,-(sp)
                move.w  d0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a0
                move.w  (sp)+,d0
                move.w  d1,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                clr.w   ENTITYDEF_OFFSET_XVELOCITY(a0)
            else
                clr.l   ENTITYDEF_OFFSET_XVELOCITY(a0) ; clear both X and Y velocity words
            endif
                clr.l   ENTITYDEF_OFFSET_XTRAVEL(a0) ; clear both X and Y travel words
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  d3,ENTITYDEF_OFFSET_FACING(a0)
                move.b  d6,ENTITYDEF_OFFSET_ENTNUM(a0)
                swap    d6
                move.b  d6,ENTITYDEF_OFFSET_LAYER(a0)
                swap    d6
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.w  d4,ENTITYDEF_OFFSET_MAPSPRITE(a0)
            else
                move.b  d4,ENTITYDEF_OFFSET_MAPSPRITE(a0)
            endif
                tst.l   d5
                bpl.s   @loc_3
                move.l  (ENTITY_WALKING_PARAMETERS).l,-(sp)
                movem.l d0-d4,-(sp)
                move.w  d5,d2
                move.b  d5,d3
                ext.w   d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                swap    d5
                move.w  d5,d4
                asr.w   #BYTE_SHIFT_COUNT,d4
                move.b  d5,d1
                ext.w   d1
                swap    d5
                cmpi.b  #-1,d4
                bne.s   @loc_1
                
                bsr.w   SetWalkingActscript
                bra.s   @loc_2
@loc_1:
                
                bsr.w   sub_44D0E       
@loc_2:
                
                movem.l (sp)+,d0-d4
                movem.l (sp)+,d5
@loc_3:
                
                move.l  d5,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                clr.l   ENTITYDEF_OFFSET_XACCEL(a0)
                move.w  #%1110000001000000,ENTITYDEF_OFFSET_FLAGS_A(a0)
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
                move.w  #48,d7
loc_44666:
                
                move.l  #$70007000,(a0)+ ; set location off map
                clr.l   (a0)+           ; clear travel info
                clr.l   (a0)+           ; clear travel info
                move.l  #$70007000,(a0)+ ; set destination off map
                clr.l   (a0)+
                clr.l   (a0)+           ; clear actscriptaddr
                clr.l   (a0)+           ; clear accel/speed
                clr.l   (a0)+
                dbf     d7,loc_44666    
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                moveq   #15,d7
loc_44688:
                
                clr.l   (a0)+
                dbf     d7,loc_44688
                
                move.l  #FF5600_LOADING_SPACE,(ENTITY_WALKING_PARAMETERS).l
                jsr     (sub_19B0).w    
                movem.l (sp)+,d7-a0
                rts

    ; End of function ClearEntities


; =============== S U B R O U T I N E =======================================

battleEntity = -4

PositionBattleEntities:
                
                movem.l d0-a1,-(sp)
                link    a6,#-16
                bsr.s   ClearEntities
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                clr.w   battleEntity(a6)
                clr.w   d0
@PositionAllies_Loop:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetCombatantY
                move.w  (sp)+,d0
                move.w  d1,d2
                tst.b   d2
                bmi.w   @SkipAlly
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetCombatantX
                move.w  (sp)+,d0
                tst.b   d1
                bmi.w   @SkipAlly
                
                ; Is flying or hovering?
                movem.w d0-d1,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetMoveType
                clr.w   d6
                cmpi.b  #MOVETYPE_LOWER_FLYING,d1
                bne.s   @loc_2
                addq.w  #1,d6
@loc_2:
                
                cmpi.b  #MOVETYPE_LOWER_HOVERING,d1
                bne.s   @loc_3
                addq.w  #1,d6
@loc_3:
                
                swap    d6
                movem.w (sp)+,d0-d1
                
                andi.w  #$3F,d1
                muls.w  #MAP_TILE_SIZE,d1
                andi.w  #$3F,d2
                muls.w  #MAP_TILE_SIZE,d2
                moveq   #3,d3
                move.l  #eas_Standing,d5
                bsr.w   GetCombatantMapsprite
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                move.b  d0,(a1)+
                addq.w  #1,d0
                bra.w   @NextAlly
@SkipAlly:
                
                move.b  #-1,(a1)+
@NextAlly:
                
                addq.w  #1,battleEntity(a6)
                dbf     d7,@PositionAllies_Loop
                
                lea     ((ENTITY_EVENT_ENEMY_START-$1000000)).w,a1
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,battleEntity(a6)
@PositionEnemies_Loop:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetActivationBitfield
                move.w  (sp)+,d0
                andi.w  #8,d1
                bne.w   @SkipEnemy
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetCombatantY
                move.w  (sp)+,d0
                move.w  d1,d2
                tst.b   d2
                bmi.w   @SkipEnemy
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetCombatantX
                move.w  (sp)+,d0
                tst.b   d1
                bmi.w   @SkipEnemy
                
                ; Is flying or hovering?
                movem.w d0-d1,-(sp)
                move.w  battleEntity(a6),d0
                jsr     j_GetMoveType
                clr.w   d6
                cmpi.b  #MOVETYPE_LOWER_FLYING,d1
                bne.s   @loc_7
                addq.w  #1,d6
@loc_7:
                
                cmpi.b  #MOVETYPE_LOWER_HOVERING,d1
                bne.s   @loc_8
                addq.w  #1,d6
@loc_8:
                
                swap    d6
                movem.w (sp)+,d0-d1
                
                andi.w  #$3F,d1 
                muls.w  #MAP_TILE_SIZE,d1
                andi.w  #$3F,d2 
                muls.w  #MAP_TILE_SIZE,d2
                moveq   #3,d3
                move.l  #eas_Standing,d5
                bsr.w   GetCombatantMapsprite
            if (STANDARD_BUILD=1)
                move.w  d1,-(sp)        ; EXPANDED_MAPSPRITES
                move.w  d4,d1
                jsr     IsSpecialSprite ; Out: CCR carry-bit clear if true
                movem.w (sp)+,d1        ; MOVEM to pull value back from the stack without affecting the CCR
            else
                cmpi.b  #MAPSPRITES_SPECIALS_START,d4
            endif
                bcs.s   @RegularSprite
                
                ; Enemy uses a special sprite
                move.w  d0,-(sp)
                move.w  #ENTITY_SPECIAL_SPRITE,d0 
                move.w  #ENTITY_ENEMY_START,d6 
                bsr.w   DeclareNewEntity
                move.b  d0,(a1)+
                move.w  (sp)+,d0
                bra.w   @NextEnemy
@RegularSprite:
                
                move.w  d0,d6
                move.b  d0,(a1)+
                bsr.w   DeclareNewEntity
                addq.w  #1,d0
                bra.w   @NextEnemy
@SkipEnemy:
                
                move.b  #-1,(a1)+
@NextEnemy:
                
                addq.w  #1,battleEntity(a6)
                dbf     d7,@PositionEnemies_Loop
                
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.w   @Done
                
                ; Position neutral entities
            if (STANDARD_BUILD=1)
                lea     ((ENTITY_EVENT_ENEMY_END-$1000000)).w,a1 ; neutral entities occupy enemy combatant slots to accommodate expanded force members
            else
                lea     ((ENTITY_EVENT_ENEMY_START-$1000000)).w,a1
            endif
                lea     table_NeutralBattleEntities(pc), a0
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
@loc_12:
                
                cmpi.w  #-1,(a0)
                beq.w   @Done
                cmp.w   (a0)+,d1
                beq.s   @Continue
@loc_13:
                
            if (STANDARD_BUILD=1)
                adda.w  #BATTLE_NEUTRAL_ENTITY_SIZE,a0 ; EXPANDED_MAPSPRITES
                cmpi.w  #-1,(a0)
                bne.s   @loc_13
                cmp.w   (a0)+,d1
                bra.s   @loc_12
            else
                cmpi.w  #-1,(a0)+
                beq.s   @loc_12
                bra.s   @loc_13
            endif
@Continue:
                
                move.w  #159,battleEntity(a6)
@PositionNeutralEntities_Loop:
                
                cmpi.w  #-1,(a0)
                beq.w   @Done
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                clr.w   d1
                jsr     j_SetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_SetStatusEffects
                jsr     j_GetActivationBitfield
                ori.w   #8,d1
                jsr     j_SetActivationBitfield
                clr.w   d1
                move.b  (a0)+,d1
                move.w  d1,d3
                jsr     j_SetCombatantX
                move.b  (a0)+,d1
                move.w  d1,d2
                jsr     j_SetCombatantY
                move.w  (sp)+,d0
                move.w  d3,d1
                andi.w  #$3F,d1 
                muls.w  #MAP_TILE_SIZE,d1
                andi.w  #$3F,d2 
                muls.w  #MAP_TILE_SIZE,d2
            if (STANDARD_BUILD=1)
                move.w  (a0)+,d3 ; EXPANDED_MAPSPRITES
                move.w  (a0)+,d4
            else
                move.b  (a0)+,d3
                clr.w   d4
                move.b  (a0)+,d4
            endif
                move.l  (a0)+,d5
                clr.l   d6
                move.w  d0,d6
                move.b  d0,-(a1)
                bsr.w   DeclareNewEntity
                addq.w  #1,d0
                bra.w   @NextNeutralEntity
                move.b  #-1,(a1)+
@NextNeutralEntity:
                
                subq.w  #1,battleEntity(a6)
                bra.s   @PositionNeutralEntities_Loop
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function PositionBattleEntities

