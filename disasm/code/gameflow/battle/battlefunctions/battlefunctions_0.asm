
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_0.asm :
; 0x22BC2..0x2379A : Battle functions

; =============== S U B R O U T I N E =======================================


FieldItem_LevelUp:
                
                moveq   #0,d1
                jsr     j_SetCurrentExp
                jsr     j_LevelUp
                lea     ((LEVELUP_ARGUMENTS-$1000000)).w,a5
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                clr.l   d1
                move.b  (a5)+,d1
                cmpi.b  #$FF,d1
                bne.s   loc_22BEA
                txt     148             ; "It has no use.{W2}"
                bra.w   byte_22C5A      
loc_22BEA:
                
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     244             ; "{NAME} became{N}level {#}!"
                move.b  (a5)+,d1
                beq.s   loc_22BFE
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     266             ; "{D1}HP increased by {#}!"
loc_22BFE:
                
                move.b  (a5)+,d1
                beq.s   loc_22C0A
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     267             ; "{D1}MP increased by {#}!"
loc_22C0A:
                
                move.b  (a5)+,d1
                beq.s   loc_22C16
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     268             ; "{D1}Attack increased by {#}!"
loc_22C16:
                
                move.b  (a5)+,d1
                beq.s   loc_22C22
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     269             ; "{D1}Defense increased by {#}!"
loc_22C22:
                
                move.b  (a5)+,d1
                beq.s   loc_22C2E
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     270             ; "{D1}Agility increased by {#}!"
loc_22C2E:
                
                move.b  (a5)+,d1
                cmpi.b  #$FF,d1
                beq.w   byte_22C5A      
                move.l  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2
                lsr.w   #SPELLENTRY_OFFSET_LV,d1
                bne.s   loc_22C4C
                move.w  d2,((TEXT_NAME_INDEX_2-$1000000)).w
                txt     271             ; "{D1}{NAME} learned the new{N}magic spell {SPELL}!"
                bra.s   byte_22C5A      
loc_22C4C:
                
                addq.w  #1,d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                move.w  d2,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     272             ; "{D1}{SPELL} increased to{N}level {#}!"
byte_22C5A:
                
                txt     3523            ; "{W1}"
                rts

    ; End of function FieldItem_LevelUp


; =============== S U B R O U T I N E =======================================

; Get first entity's X, Y and facing -> d1.l, d2.l, d3.w


GetPlayerEntityPosition:
                
                move.w  (ENTITY_DATA).l,d1
                move.w  (ENTITY_Y).l,d2
                move.b  (ENTITY_FACING).l,d3
                ext.l   d1
                divu.w  #384,d1
                ext.l   d2
                divu.w  #384,d2
                andi.w  #3,d3
                rts

    ; End of function GetPlayerEntityPosition


; =============== S U B R O U T I N E =======================================


CreatePulsatingBlocksRange:
                
                movem.l d6-a1,-(sp)
                bsr.w   GetBattleMapProperties
@OuterLoop:
                
                movem.l d6/a0-a1,-(sp)
@InnerLoop:
                
                tst.b   (a0)+
                bpl.s   @MovableSpace
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                bra.s   @Continue
@MovableSpace:
                
                andi.w  #$3FFF,(a1)+
@Continue:
                
                dbf     d6,@InnerLoop
                
                movem.l (sp)+,d6/a0-a1
                lea     MAP_SIZE_MAXWIDTH(a0),a0
                lea     128(a1),a1
                dbf     d7,@OuterLoop
                
                movem.l (sp)+,d6-a1
                movem.l d0/a0,-(sp)
                lea     (PALLETE_2_BASE).l,a0
                moveq   #7,d0
@CopyPalette_Loop:
                
                move.l  -NEXT_PALETTE(a0),(a0)+
                dbf     d0,@CopyPalette_Loop
                
                movem.l (sp)+,d0/a0
                move.b  #%10,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.b  #PULSATING_1,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  #1,((FADING_COUNTER-$1000000)).w
                bra.w   CheckMapLayerType

    ; End of function CreatePulsatingBlocksRange


; =============== S U B R O U T I N E =======================================

; Out: a0 = pointer to movable grid array
;      a1 = pointer to start of battle map vdptile layout
;      d6.w, d7.w = width, height of battle map


GetBattleMapProperties:
                
                lea     (FF4D00_LOADING_SPACE).l,a0
                move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d7
                lsl.w   #6,d7
                add.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d7
                add.w   d7,d7
                lea     (FF0000_RAM_START).l,a1
                adda.w  d7,a1
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d6
                sub.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d6
                ext.l   d6
                divs.w  #$180,d6
                move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d7
                sub.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d7
                ext.l   d7
                divs.w  #$180,d7
                rts

    ; End of function GetBattleMapProperties


; =============== S U B R O U T I N E =======================================


ClearPulsatingBlocksRange:
                
                movem.l d6-a1,-(sp)
                bsr.s   GetBattleMapProperties
@OuterLoop:
                
                movem.l d6/a1,-(sp)
@InnerLoop:
                
                andi.w  #$3FFF,(a1)+
                dbf     d6,@InnerLoop
                
                movem.l (sp)+,d6/a1
                lea     128(a1),a1
                dbf     d7,@OuterLoop
                
                movem.l (sp)+,d6-a1
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                clr.b   ((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  #1,((FADING_COUNTER-$1000000)).w
CheckMapLayerType:
                
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @SetForegroundUpdate
                bset    #0,((VIEW_PLANE_UPDATE_TRIGGERS-$1000000)).w
                move.b  #$FF,((byte_FFA8FF-$1000000)).w
                bra.s   @Return
@SetForegroundUpdate:
                
                bset    #1,((VIEW_PLANE_UPDATE_TRIGGERS-$1000000)).w
@Return:
                
                rts

    ; End of function ClearPulsatingBlocksRange


; =============== S U B R O U T I N E =======================================


HideUnitCursor:
                
                movem.l d0/a0,-(sp)
                lea     ((ENTITY_UNIT_CURSOR_DATA-$1000000)).w,a0
                move.w  #$6F00,d0
                move.w  d0,(a0)
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function HideUnitCursor


; =============== S U B R O U T I N E =======================================


ControlUnitCursor:
                
                bsr.w   LoadUnitCursorTileData
                clr.w   d2
                clr.w   d3
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d2
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d3
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                moveq   #ENTITY_UNIT_CURSOR,d0
                jsr     j_SetUnitCursorSpeedx2
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                move.w  d2,(a0)
                move.w  d3,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d3,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #$FF,((CONTROLLING_UNIT_CURSOR-$1000000)).w
                move.b  #ENTITY_UNIT_CURSOR,((VIEW_TARGET_ENTITY-$1000000)).w
@WaitForPlayerInput:
                
                jsr     (WaitForVInt).w
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
                andi.w  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.s   @WaitForPlayerInput
                
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
                ext.l   d2
                ext.l   d3
                divs.w  #$180,d2
                divs.w  #$180,d3
                move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                moveq   #ENTITY_UNIT_CURSOR,d0
                jsr     j_SetEntityMovescriptToIdle
                move.w  #$6F00,(a0)
                move.w  #$6F00,ENTITYDEF_OFFSET_XDEST(a0)
                clr.b   ((CONTROLLING_UNIT_CURSOR-$1000000)).w
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                rts

    ; End of function ControlUnitCursor


; =============== S U B R O U T I N E =======================================

; Out: d2.b = chosen X
;      d3.b = chosen Y
;      d4.w = copied P1 input state bitfield

battleEntity = -2

ControlBattleEntity:
                
                movem.l d0-d1/a0-a1,-(sp)
                link    a6,#-2
                lea     ((ENTITY_DATA-$1000000)).w,a1
                bsr.w   GetEntityIndexForCombatant_0
                move.w  d0,battleEntity(a6)
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a1
                move.b  ENTITYDEF_OFFSET_ENTNUM(a1),d0
                move.w  d0,-(sp)
                move.b  ENTITYDEF_OFFSET_LAYER(a1),d0
                lsl.b   #4,d0
                move.b  d0,ENTITYDEF_OFFSET_LAYER(a1)
                jsr     (WaitForVInt).w
                move.b  #33,ENTITYDEF_OFFSET_ENTNUM(a1)
                bsr.w   UpdateBattleEntitySprite
                move.w  battleEntity(a6),d0
                jsr     j_SetControlledEntityActScript
                addi.w  #$10,d0
                lea     ((byte_FFAFA0-$1000000)).w,a0
                move.b  #1,(a0,d0.w)
@Loop:
                
                bsr.w   UpdateBattleEntityPosition
                jsr     (WaitForVInt).w
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d4
                andi.w  #INPUT_B|INPUT_C|INPUT_A,d4
                beq.s   @Loop
                
                clr.b   (a0,d0.w)
                move.b  ENTITYDEF_OFFSET_LAYER(a1),d0
                lsr.b   #4,d0
                move.b  d0,ENTITYDEF_OFFSET_LAYER(a1)
                move.w  (sp)+,d0
                move.b  d0,ENTITYDEF_OFFSET_ENTNUM(a1)
                bsr.w   UpdateBattleEntitySprite
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  ENTITYDEF_OFFSET_XDEST(a1),d2
                ext.l   d2
                divs.w  #$180,d2
                move.w  ENTITYDEF_OFFSET_YDEST(a1),d3
                ext.l   d3
                divs.w  #$180,d3
                move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                move.w  battleEntity(a6),d0
                jsr     j_SetEntityMovescriptToIdle
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                unlk    a6
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function ControlBattleEntity


; =============== S U B R O U T I N E =======================================


UpdateBattleEntityPosition:
                
                movem.w d0-d3,-(sp)
                move.w  (a1),d2
                addi.w  #$C0,d2 
                ext.l   d2
                divs.w  #$180,d2
                move.w  ENTITYDEF_OFFSET_Y(a1),d3
                addi.w  #$C0,d3 
                ext.l   d3
                divs.w  #$180,d3
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCombatantX
                move.w  d1,-(sp)
                jsr     j_GetCombatantY
                move.w  d1,-(sp)
                move.w  d2,d1
                jsr     j_SetCombatantX
                move.w  d3,d1
                jsr     j_SetCombatantY
                jsr     sub_10070
                move.w  (sp)+,d1
                jsr     j_SetCombatantY
                move.w  (sp)+,d1
                jsr     j_SetCombatantX
                movem.w (sp)+,d0-d3
                rts

    ; End of function UpdateBattleEntityPosition


; =============== S U B R O U T I N E =======================================

; Pointless wrapper (should instead directly branch to subroutine below)


GetEntityIndexForCombatant_0:
                
                bsr.w   GetEntityIndexForCombatant
                rts

    ; End of function GetEntityIndexForCombatant_0


; =============== S U B R O U T I N E =======================================

; Get entity index for combatant D0 -> D0


GetEntityIndexForCombatant:
                
                move.l  a0,-(sp)
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                tst.b   d0              ; test if D0 represents an enemy index
                bpl.s   @Ally
                subi.b  #$60,d0 
@Ally:
                
                andi.w  #COMBATANT_MASK_ALL,d0
                move.b  (a0,d0.w),d0
                movea.l (sp)+,a0
                rts

    ; End of function GetEntityIndexForCombatant


; =============== S U B R O U T I N E =======================================

; In: D0 = entity index
; Out: D0 = entity event index


GetEntityEventIndex:
                
                movem.l d1/d7-a0,-(sp)
                moveq   #ENTITY_TOTAL,d7
                move.w  d0,d1
                clr.w   d0
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
@GetIndex_Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @EntityHasEvent
                addq.w  #1,d0
                cmpi.w  #ENTITY_ALLY_COUNT,d0
                bne.s   @Ally
                move.w  #$80,d0 
@Ally:
                
                dbf     d7,@GetIndex_Loop
                
                clr.w   d0
@EntityHasEvent:
                
                movem.l (sp)+,d1/d7-a0
                rts

    ; End of function GetEntityEventIndex

word_22F76:     dc.w 384
                dc.w 0
                dc.w 0
                dc.w -384
                dc.w -384
                dc.w 0
                dc.w 0
                dc.w 384

; =============== S U B R O U T I N E =======================================

battleEntity = -2

MoveBattleEntityByMoveString:
                
                movem.l d1/a0,-(sp)
                link    a6,#-2
                move.b  -1(a0),d1
                movem.l d1/a0,-(sp)
                move.b  #$FF,-1(a0)
                lea     ((ENTITY_DATA-$1000000)).w,a1
                bsr.s   GetEntityIndexForCombatant_0
                move.w  d0,battleEntity(a6)
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a1
                move.b  ENTITYDEF_OFFSET_ENTNUM(a1),d0
                move.w  d0,-(sp)
                move.b  ENTITYDEF_OFFSET_LAYER(a1),d0
                lsl.b   #4,d0
                move.b  d0,ENTITYDEF_OFFSET_LAYER(a1)
                jsr     (WaitForVInt).w
                move.b  #33,ENTITYDEF_OFFSET_ENTNUM(a1)
                bsr.w   UpdateBattleEntitySprite
                move.w  battleEntity(a6),d0
                jsr     sub_44030
                move.l  a0,-(sp)
                addi.w  #$10,d0
                lea     ((byte_FFAFA0-$1000000)).w,a0
                move.b  #1,(a0,d0.w)
                movea.l (sp)+,a0
loc_22FE8:
                
                move.b  (a0)+,d0
                cmpi.b  #$FF,d0
                beq.w   loc_2308E
                andi.w  #3,d0
                lsl.w   #2,d0
                move.l  a0,-(sp)
                lea     word_22F76(pc), a0
                move.w  (a0,d0.w),d1
                add.w   d1,ENTITYDEF_OFFSET_XDEST(a1)
                move.w  2(a0,d0.w),d1
                add.w   d1,ENTITYDEF_OFFSET_YDEST(a1)
                movea.l (sp)+,a0
                clr.w   d4
                clr.w   d5
                move.b  ENTITYDEF_OFFSET_XSPEED(a1),d4
                move.b  ENTITYDEF_OFFSET_YSPEED(a1),d5
                move.w  ENTITYDEF_OFFSET_XDEST(a1),d0
                cmp.w   (a1),d0
                bne.s   @CalculateTravel_X
                clr.w   d4
@CalculateTravel_X:
                
                sub.w   (a1),d0
                bpl.s   @CheckTravel_Y
                neg.w   d0
                neg.w   d4
@CheckTravel_Y:
                
                move.w  ENTITYDEF_OFFSET_YDEST(a1),d1
                cmp.w   ENTITYDEF_OFFSET_Y(a1),d1
                bne.s   @CalculateTravel_Y
                clr.w   d5
@CalculateTravel_Y:
                
                sub.w   ENTITYDEF_OFFSET_Y(a1),d1
                bpl.s   loc_23044
                neg.w   d1
                neg.w   d5
loc_23044:
                
                move.w  d0,ENTITYDEF_OFFSET_XTRAVEL(a1)
                move.w  d1,ENTITYDEF_OFFSET_YTRAVEL(a1)
                andi.b  #$F0,ENTITYDEF_OFFSET_FLAGS_A(a1)
                move.b  -1(a0),d0
                cmp.b   -2(a0),d0
                beq.s   loc_2306A
                move.w  d4,ENTITYDEF_OFFSET_XVELOCITY(a1)
                move.w  d5,ENTITYDEF_OFFSET_YVELOCITY(a1)
                ori.b   #3,ENTITYDEF_OFFSET_FLAGS_A(a1)
loc_2306A:
                
                cmp.b   (a0),d0
                beq.s   loc_23074
                ori.b   #$C,ENTITYDEF_OFFSET_FLAGS_A(a1)
loc_23074:
                
                move.w  ((MOVE_SFX-$1000000)).w,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                bsr.w   UpdateBattleEntityPosition
                move.w  battleEntity(a6),d0
                jsr     j_WaitForEntityToStopMoving
                bra.w   loc_22FE8
loc_2308E:
                
                move.b  ENTITYDEF_OFFSET_LAYER(a1),d0
                lsr.b   #4,d0
                move.b  d0,ENTITYDEF_OFFSET_LAYER(a1)
                move.w  (sp)+,d0
                move.b  d0,ENTITYDEF_OFFSET_ENTNUM(a1)
                bsr.w   UpdateBattleEntitySprite
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  (a1),d2
                ext.l   d2
                divs.w  #$180,d2
                move.w  ENTITYDEF_OFFSET_Y(a1),d3
                ext.l   d3
                divs.w  #$180,d3
                move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                move.w  battleEntity(a6),d0
                addi.w  #$10,d0
                lea     ((byte_FFAFA0-$1000000)).w,a0
                clr.b   (a0,d0.w)
                movem.l (sp)+,d1/a0
                move.b  d1,-1(a0)
                unlk    a6
                movem.l (sp)+,d1/a1
                rts

    ; End of function MoveBattleEntityByMoveString


; =============== S U B R O U T I N E =======================================


sub_230E2:
                
                movem.l d1-a0,-(sp)
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bne.s   loc_230F2
                moveq   #-1,d0
                bra.w   byte_2321E
loc_230F2:
                
                jsr     (WaitForVInt).w
                move.w  d0,d6
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d1
                bra.w   loc_23110
loc_23102:
                
                jsr     (WaitForVInt).w
                jsr     (WaitForViewScrollEnd).w
                jsr     j_RemoveMiniStatusWindow
loc_23110:
                
                clr.w   d0
                move.b  (a0,d1.w),d0
                movem.l d1-a0,-(sp)
                move.w  d0,-(sp)
                clr.w   d0
                move.b  (a0,d1.w),d0
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3
                move.w  d6,d0
                jsr     j_GetCombatantX
                sub.w   d1,d2
                blt.s   loc_23142
                moveq   #RIGHT,d4
                bra.s   loc_23146
loc_23142:
                
                moveq   #LEFT,d4
                neg.w   d2
loc_23146:
                
                jsr     j_GetCombatantY
                sub.w   d1,d3
                blt.s   loc_23154
                moveq   #DOWN,d5
                bra.s   loc_23158
loc_23154:
                
                moveq   #UP,d5
                neg.w   d3
loc_23158:
                
                cmp.w   d2,d3
                blt.s   loc_2315E
                move.w  d5,d4
loc_2315E:
                
                bsr.w   GetEntityIndexForCombatant
                move.w  d4,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).w
                move.w  (sp)+,d0
                bsr.w   sub_2322C
                move.b  #1,((IS_TARGETING-$1000000)).w
                jsr     (WaitForViewScrollEnd).w
                jsr     j_CreateBattlefieldMiniStatusWindow
                movem.l (sp)+,d1-a0
loc_23186:
                
                jsr     (WaitForVInt).w
                cmpi.w  #1,d7
                beq.s   loc_231E0
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_231A4
                subq.w  #1,d1
                bge.s   loc_231A0
                move.w  d7,d1
                subq.w  #1,d1
loc_231A0:
                
                bra.w   loc_23102
loc_231A4:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_231B8
                subq.w  #1,d1
                bge.s   loc_231B4
                move.w  d7,d1
                subq.w  #1,d1
loc_231B4:
                
                bra.w   loc_23102
loc_231B8:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_231CC
                addq.w  #1,d1
                cmp.w   d7,d1
                blt.s   loc_231C8
                clr.w   d1
loc_231C8:
                
                bra.w   loc_23102
loc_231CC:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_231E0
                addq.w  #1,d1
                cmp.w   d7,d1
                blt.s   loc_231DC
                clr.w   d1
loc_231DC:
                
                bra.w   loc_23102
loc_231E0:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_231F6
                jsr     j_RemoveMiniStatusWindow
                move.w  #$FFFF,d0
                bra.w   byte_2321E
loc_231F6:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_23208
                clr.w   d0
                move.b  (a0,d1.w),d0
                bra.w   byte_2321E
loc_23208:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_2321A
                clr.w   d0
                move.b  (a0,d1.w),d0
                bra.w   byte_2321E
loc_2321A:
                
                bra.w   loc_23186
byte_2321E:
                
                sndCom  SFX_VALIDATION
                bsr.w   HideUnitCursor
                movem.l (sp)+,d1-a0
                rts

    ; End of function sub_230E2


; =============== S U B R O U T I N E =======================================


sub_2322C:
                
                movem.l d0-a0,-(sp)
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (WaitForVInt).w
                bsr.w   sub_23256
                movem.l (sp)+,d0-a0
                rts

    ; End of function sub_2322C


; =============== S U B R O U T I N E =======================================


sub_23256:
                
                bsr.w   LoadUnitCursorTileData
                clr.w   d4
                clr.w   d5
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d4
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d5
                move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                mulu.w  #$180,d4
                mulu.w  #$180,d5
                moveq   #ENTITY_UNIT_CURSOR,d0
                jsr     sub_4402C
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                move.w  d4,(a0)
                move.w  d5,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d3,ENTITYDEF_OFFSET_YDEST(a0)
                bsr.w   sub_23414
                bsr.w   WaitForUnitCursor
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                rts

    ; End of function sub_23256


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


SetUnitCursorDestinationToNextCombatant:
                
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3

    ; End of function SetUnitCursorDestinationToNextCombatant


; =============== S U B R O U T I N E =======================================

; In: d2.w, d3.w = entity X,Y coordinates


SetUnitCursorDestinationToNextBattleEntity:
                
                jsr     (WaitForVInt).w
                bsr.w   LoadUnitCursorTileData
                clr.w   d4
                clr.w   d5
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d4
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d5
                move.b  d2,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.b  d3,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                mulu.w  #$180,d4
                mulu.w  #$180,d5
                moveq   #ENTITY_UNIT_CURSOR,d0
                jsr     j_SetUnitCursorActscript
                jsr     (WaitForVInt).w
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                move.w  d4,(a0)
                move.w  d5,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d3,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #$40,ENTITYDEF_OFFSET_XSPEED(a0) 
                move.b  #$40,ENTITYDEF_OFFSET_YSPEED(a0) 
                tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
                beq.s   loc_23328
                move.b  #$60,ENTITYDEF_OFFSET_XSPEED(a0) 
                move.b  #$60,ENTITYDEF_OFFSET_YSPEED(a0) 
loc_23328:
                
                bsr.w   sub_23414
                move.w  ENTITYDEF_OFFSET_XTRAVEL(a0),d0
                move.w  ENTITYDEF_OFFSET_YTRAVEL(a0),d1
                lsr.w   #7,d0
                lsr.w   #7,d1
                addi.w  #$10,d0
                addi.w  #$10,d1
                cmpi.w  #$50,d0 
                bge.s   loc_2334A
                move.w  #$50,d0 
loc_2334A:
                
                cmpi.w  #$70,d0 
                ble.s   loc_23354
                move.w  #$70,d0 
loc_23354:
                
                cmpi.w  #$50,d1 
                bge.s   loc_2335E
                move.w  #$50,d1 
loc_2335E:
                
                cmpi.w  #$70,d1 
                ble.s   loc_23368
                move.w  #$70,d1 
loc_23368:
                
                tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
                beq.s   loc_23376
                move.w  #$80,d0 
                move.w  #$80,d1 
loc_23376:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_23388
                move.w  d0,d7
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d7
                lsr.w   #8,d7
                move.w  d7,((word_FFA820-$1000000)).w
loc_23388:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
                bne.s   loc_2339A
                move.w  d1,d7
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d7
                lsr.w   #8,d7
                move.w  d7,((word_FFA822-$1000000)).w
loc_2339A:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_233AC
                move.w  d0,d7
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d7
                lsr.w   #8,d7
                move.w  d7,((word_FFA824-$1000000)).w
loc_233AC:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                bne.s   loc_233BE
                move.w  d1,d7
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d7
                lsr.w   #8,d7
                move.w  d7,((word_FFA826-$1000000)).w
loc_233BE:
                
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                move.w  d0,d2
                move.w  d1,d3
                subi.w  #$780,d0
                subi.w  #$780,d1
                addi.w  #$780,d2
                addi.w  #$600,d3
                cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                bge.s   loc_233E4
                move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
loc_233E4:
                
                cmp.w   ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d2
                ble.s   loc_233F2
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
                subi.w  #$F00,d0
loc_233F2:
                
                cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
                bge.s   loc_233FC
                move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
loc_233FC:
                
                cmp.w   ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d3
                ble.s   loc_2340A
                move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d1
                subi.w  #$D80,d1
loc_2340A:
                
                move.w  d0,d2
                move.w  d1,d3
                jsr     (SetViewDest).w
                rts

    ; End of function SetUnitCursorDestinationToNextBattleEntity


; =============== S U B R O U T I N E =======================================


sub_23414:
                
                clr.w   d4
                clr.w   d5
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d4
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d5
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                cmp.w   (a0),d0
                bne.s   loc_2342A
                clr.w   d4
loc_2342A:
                
                sub.w   (a0),d0
                bpl.s   loc_23432
                neg.w   d0
                neg.w   d4
loc_23432:
                
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                cmp.w   ENTITYDEF_OFFSET_Y(a0),d1
                bne.s   loc_2343E
                clr.w   d5
loc_2343E:
                
                sub.w   ENTITYDEF_OFFSET_Y(a0),d1
                bpl.s   loc_23448
                neg.w   d1
                neg.w   d5
loc_23448:
                
                move.w  d0,ENTITYDEF_OFFSET_XTRAVEL(a0)
                move.w  d1,ENTITYDEF_OFFSET_YTRAVEL(a0)
                move.w  d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                move.w  d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
                rts

    ; End of function sub_23414


; =============== S U B R O U T I N E =======================================


SetEntityBlinkingFlag:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetEntityIndexForCombatant
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                bset    #7,ENTITYDEF_OFFSET_FLAGS_B(a0,d0.w)
                movem.l (sp)+,d0/a0
                rts

    ; End of function SetEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================


ClearEntityBlinkingFlag:
                
                movem.l d0/a0,-(sp)
                bsr.w   GetEntityIndexForCombatant
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                bclr    #7,ENTITYDEF_OFFSET_FLAGS_B(a0,d0.w)
                movem.l (sp)+,d0/a0
                rts

    ; End of function ClearEntityBlinkingFlag


; =============== S U B R O U T I N E =======================================


SetCameraDestInTiles:
                
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                movem.w d2-d3,-(sp)
                movem.w (sp)+,d0-d1
                jsr     (SetViewDest).w
                rts

    ; End of function SetCameraDestInTiles


; =============== S U B R O U T I N E =======================================


LoadUnitCursorTileData:
                
                movem.l d0-a1,-(sp)
                jsr     (WaitForVInt).w
                lea     UnitCursorTiles(pc), a0
                lea     ($D000).l,a1
                move.w  #$800,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function LoadUnitCursorTileData


; =============== S U B R O U T I N E =======================================

; In: a1 = pointer to entity data
;     d6.b = facing direction


UpdateBattleEntitySprite:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.b  ENTITYDEF_OFFSET_FACING(a1),d6
                ext.w   d6
                move.b  tbl_FacingValues_3(pc,d6.w),d6
                bne.s   @Continue
                addq.w  #2,d6
@Continue:
                
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a1),d1
                cmpi.b  #MAPSPRITES_SPECIALS_START,d1
                bcc.s   @Done
                move.b  ENTITYDEF_OFFSET_ENTNUM(a1),d1
                cmpi.b  #$20,d1 
                beq.s   @Done
                move.w  d1,-(sp)
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a1),d1
                move.w  d1,d0
                add.w   d1,d1
                add.w   d0,d1
                add.w   d6,d1
                subq.w  #1,d1
                lsl.w   #2,d1
                lea     (pt_MapSprites).l,a0
                movea.l (a0,d1.w),a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadSpriteData).w
                movea.l a1,a0
                move.w  (sp)+,d1
                move.w  d1,d0
                lsl.w   #3,d1
                add.w   d0,d1
                lsl.w   #6,d1
                lea     ($7000).w,a1
                adda.w  d1,a1
                move.w  #$120,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
@Done:
                
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function UpdateBattleEntitySprite

tbl_FacingValues_3:
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b 2
                dc.b 0

; =============== S U B R O U T I N E =======================================


WaitForUnitCursor:
                
                move.l  d0,-(sp)
                moveq   #ENTITY_UNIT_CURSOR,d0
                jsr     j_WaitForEntityToStopMoving
                move.l  (sp)+,d0
                rts

    ; End of function WaitForUnitCursor


; =============== S U B R O U T I N E =======================================


UpdateUnitCursorSprites:
                
                movem.l d0-d2/d7-a1,-(sp)
                lea     spr_UnitCursor(pc), a0
                clr.w   d2
                move.b  ((UNIT_CURSOR_RADIUS-$1000000)).w,d2
                andi.w  #$F,d2
                lsl.w   #6,d2
                adda.w  d2,a0
                lea     (SPRITE_08).l,a1
                moveq   #7,d7
loc_23572:
                
                move.w  (a0)+,d2
                add.w   d1,d2
                move.w  d2,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,d2
                add.w   d0,d2
                move.w  d2,(a1)+
                dbf     d7,loc_23572
                movem.l (sp)+,d0-d2/d7-a1
                rts

    ; End of function UpdateUnitCursorSprites

spr_UnitCursor: ; Syntax        vdpSprite y, [VDPSPRITESIZE_]bitfield|link, vdpTile, x
;
;      vdpTile: [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                ; Cursor radius 0
                vdpSprite 116, V4|H4|16, 1664|PALETTE3, 124
                vdpSprite 1, V4|H4|10, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|11, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|12, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|13, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|14, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|15, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|16, 1664|PALETTE3, 1
                
                ; Cursor radius 1
                vdpSprite 86, V4|H4|9, 1680|PALETTE3, 124
                vdpSprite 116, V4|H4|10, 1696|PALETTE3, 100
                vdpSprite 146, V4|H4|11, 1680|FLIP|PALETTE3, 124
                vdpSprite 116, V4|H4|16, 1696|MIRROR|PALETTE3, 148
                vdpSprite 1, V4|H4|13, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|14, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|15, 1664|PALETTE3, 1
                vdpSprite 1, V4|H4|16, 1664|PALETTE3, 1
                
                ; Cursor radius 2
                vdpSprite 62, V4|H4|9, 1680|PALETTE3, 124
                vdpSprite 116, V4|H4|10, 1696|PALETTE3, 76
                vdpSprite 170, V4|H4|11, 1680|FLIP|PALETTE3, 124
                vdpSprite 116, V4|H4|12, 1696|MIRROR|PALETTE3, 172
                vdpSprite 86, V4|H4|13, 1712|PALETTE3, 95
                vdpSprite 86, V4|H4|14, 1712|MIRROR|PALETTE3, 153
                vdpSprite 146, V4|H4|15, 1712|FLIP|PALETTE3, 95
                vdpSprite 146, V4|H4|16, 1712|MIRROR|FLIP|PALETTE3, 153
                
            if (STANDARD_BUILD&EXPANDED_RANGES=1)
                ; Cursor radius 3
                vdpSprite 38, V4|H4|9, 1680|PALETTE3, 124
                vdpSprite 116, V4|H4|10, 1696|PALETTE3, 52
                vdpSprite 200, V4|H4|11, 1680|FLIP|PALETTE3, 124
                vdpSprite 116, V4|H4|12, 1696|MIRROR|PALETTE3, 196
                vdpSprite 56, V4|H4|13, 1712|PALETTE3, 95
                vdpSprite 56, V4|H4|14, 1712|MIRROR|PALETTE3, 153
                vdpSprite 176, V4|H4|15, 1712|FLIP|PALETTE3, 95
                vdpSprite 176, V4|H4|16, 1712|MIRROR|FLIP|PALETTE3, 153
                
                ; Cursor radius 4
                vdpSprite 14, V4|H4|9, 1680|PALETTE3, 124
                vdpSprite 116, V4|H4|10, 1696|PALETTE3, 28
                vdpSprite 230, V4|H4|11, 1680|FLIP|PALETTE3, 124
                vdpSprite 116, V4|H4|12, 1696|MIRROR|PALETTE3, 220
                vdpSprite 56, V4|H4|13, 1712|PALETTE3, 71
                vdpSprite 56, V4|H4|14, 1712|MIRROR|PALETTE3, 177
                vdpSprite 176, V4|H4|15, 1712|FLIP|PALETTE3, 71
                vdpSprite 176, V4|H4|16, 1712|MIRROR|FLIP|PALETTE3, 177
            endif

; =============== S U B R O U T I N E =======================================


sub_2364C:
                
                move.l  #$10F10,(SPRITE_08).l ; y = 1, size and link = V4|H4|16
                rts

    ; End of function sub_2364C

UnitCursorTiles:incbin "data/graphics/tech/unitcursortiles.bin"

; =============== S U B R O U T I N E =======================================


FadeOut_WaitForP1Input:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function FadeOut_WaitForP1Input


; =============== S U B R O U T I N E =======================================

; In: D0 = entity index
;     D1 = x pos
;     D2 = y pos


SetEntityPosition:
                
                movem.l d0/a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a0
                move.w  d1,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                movem.l (sp)+,d0/a0
                rts

    ; End of function SetEntityPosition

tbl_PixelOffsets_X:
                dc.w 384
tbl_PixelOffsets_Y:
                dc.w 0
                dc.w 0
                dc.w -384
                dc.w -384
                dc.w 0
                dc.w 0
                dc.w 384
