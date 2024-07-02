
; ASM FILE code\common\scripting\entity\entityscriptengine_2.asm :
; 0x4EC6..0x6260 : Entity script engine, part 2

; =============== S U B R O U T I N E =======================================


InitializeExplorationSpritesFrameCounter:
                
                move.b  #2,((SPRITES_FRAME_COUNTER_START-$1000000)).w
                clr.b   ((SPRITES_FRAME_COUNTER-$1000000)).w
                move.b  #1,((SPRITES_FRAME_BLINKING_THRESHOLD-$1000000)).w
                rts

    ; End of function InitializeExplorationSpritesFrameCounter


; =============== S U B R O U T I N E =======================================


InitializeBattlefieldSpritesFrameCounter:
                
                move.b  #20,((SPRITES_FRAME_COUNTER_START-$1000000)).w
                clr.b   ((SPRITES_FRAME_COUNTER-$1000000)).w
                move.b  #15,((SPRITES_FRAME_BLINKING_THRESHOLD-$1000000)).w
                rts

    ; End of function InitializeBattlefieldSpritesFrameCounter


; =============== S U B R O U T I N E =======================================


VInt_UpdateEntities:
                
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                lea     ((ENTITY_DATA-$1000000)).w,a0
                moveq   #ENTITIES_COUNTER,d7 ; do that for each entity
loc_4EF4:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                cmpi.w  #$7000,d0       ; check if slot is empty
                bge.w   UpdateNextEntity
                bsr.w   UpdateEntityData
loc_4F06:
                
                move.l  ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0),d0
                movea.l d0,a1
                beq.w   UpdateNextEntity
                move.w  (a1),d2
                add.w   d2,d2
                move.w  rjt_EntityScriptCommands(pc,d2.w),d2
                jmp     rjt_EntityScriptCommands(pc,d2.w)

    ; End of function VInt_UpdateEntities

rjt_EntityScriptCommands:
                dc.w esc00_wait-rjt_EntityScriptCommands ; esc for Entity Script Command
                dc.w esc01_waitUntilDestination-rjt_EntityScriptCommands
                dc.w esc02_controlCharacter-rjt_EntityScriptCommands
                dc.w esc03_follow-rjt_EntityScriptCommands
                dc.w esc04_moveToRelativeDest-rjt_EntityScriptCommands
                dc.w esc05_moveToAbsoluteDest-rjt_EntityScriptCommands
                dc.w esc06_walkRandomly-rjt_EntityScriptCommands
                dc.w esc07_controlRaft-rjt_EntityScriptCommands
                dc.w esc08_controlCaravan-rjt_EntityScriptCommands
                dc.w esc09_moveToFacingRelativePosition-rjt_EntityScriptCommands
                dc.w esc0A_updateSprite-rjt_EntityScriptCommands
                dc.w esc0B_setSpriteSize-rjt_EntityScriptCommands
                dc.w esc0C_setPosition-rjt_EntityScriptCommands
                dc.w esc0D_clonePosition-rjt_EntityScriptCommands
                dc.w esc0E_moveToEntityFacingRelativePosition-rjt_EntityScriptCommands
                dc.w esc0F_waitUntilOtherEntityReachesDest-rjt_EntityScriptCommands
                dc.w esc10_setSpeed-rjt_EntityScriptCommands
                dc.w esc11_setAccelerationFactors-rjt_EntityScriptCommands
                dc.w esc12_activateAcceleration-rjt_EntityScriptCommands
                dc.w esc13_activateDeceleration-rjt_EntityScriptCommands
                dc.w esc14_setAnimationCounter-rjt_EntityScriptCommands
                dc.w esc15_setAutoFacing-rjt_EntityScriptCommands
                dc.w esc16_setEntityNumber-rjt_EntityScriptCommands
                dc.w esc17_setSpriteNumber-rjt_EntityScriptCommands
                dc.w esc18_setEntityObstructable-rjt_EntityScriptCommands
                dc.w esc19_setMapCollidable-rjt_EntityScriptCommands
                dc.w esc1A_setEntityCollidable-rjt_EntityScriptCommands
                dc.w esc1B_setEntityOrientation-rjt_EntityScriptCommands
                dc.w esc1C_setEntityTransparency-rjt_EntityScriptCommands
                dc.w esc1D_setEntityGhost-rjt_EntityScriptCommands
                dc.w esc1E_setEntityAnimSpeedx2-rjt_EntityScriptCommands
                dc.w esc1F_setResizable-rjt_EntityScriptCommands
                dc.w esc20_setImmersed-rjt_EntityScriptCommands
                dc.w esc21_set1Cbit4-rjt_EntityScriptCommands
                dc.w esc22_setEntityFacing-rjt_EntityScriptCommands
                dc.w esc23_sendSoundCommand-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc30_branch-rjt_EntityScriptCommands
                dc.w esc31_branchIfFlagSet-rjt_EntityScriptCommands
                dc.w esc32_branchIfFlagClear-rjt_EntityScriptCommands
                dc.w esc33_randomBranch-rjt_EntityScriptCommands
                dc.w esc34_jump-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc40_checkMapBlockCopy-rjt_EntityScriptCommands
                dc.w esc41_pass-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands
                dc.w esc_goToNextEntity-rjt_EntityScriptCommands

; =============== S U B R O U T I N E =======================================

; clear timer and parse next command


esc00_wait:
                
                move.w  2(a1),d2        ; timer for next movescript read
                cmp.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0),d2
                ble.s   loc_4FCE
                addq.b  #1,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)
                bra.w   esc_goToNextEntity
loc_4FCE:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc00_wait


; =============== S U B R O U T I N E =======================================

; wait until entity has reached its destination


esc01_waitUntilDestination:
                
                move.w  (a0),d0         ; pos
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d2 ; dest
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
                move.w  d2,d4
                move.w  d3,d5
                sub.w   d0,d4           ; difference to x destination
                sub.w   d1,d5           ; difference to y destination
                move.w  d5,d6
                or.w    d4,d6
                bne.w   esc_clearTimerGoToNextEntity
                addq.l  #2,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc01_waitUntilDestination


; =============== S U B R O U T I N E =======================================

; update next entity

currentPlayerInput = -10
mapAreaLayerOneEndX = -8
mapAreaLayerOneEndY = -6
mapAreaLayerOneStartX = -4
mapAreaLayerOneStartY = -2

esc02_controlCharacter:
                
                link    a6,#-10
                move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,mapAreaLayerOneStartX(a6)
                move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,mapAreaLayerOneEndX(a6)
                tst.w   d7
                bne.s   loc_502C
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,currentPlayerInput(a6)
                addi.w  #MAP_TILE_SIZE,mapAreaLayerOneStartX(a6)
                addi.w  #MAP_TILE_SIZE,mapAreaLayerOneStartY(a6)
                subi.w  #MAP_TILE_SIZE,mapAreaLayerOneEndX(a6)
                subi.w  #MAP_TILE_SIZE,mapAreaLayerOneEndY(a6)
                bra.s   loc_5032
loc_502C:
                
                move.b  ((PLAYER_1_INPUT-$1000000)).w,currentPlayerInput(a6)
loc_5032:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                moveq   #-1,d6
loc_5042:
                
                btst    #INPUT_BIT_UP,currentPlayerInput(a6)
                beq.s   loc_505E
                cmp.w   mapAreaLayerOneStartY(a6),d1
                ble.s   loc_505E
                move.w  #MAP_TILE_MINUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                neg.w   d3
                moveq   #UP,d6
loc_505E:
                
                btst    #INPUT_BIT_DOWN,currentPlayerInput(a6)
                beq.s   loc_5078
                cmp.w   mapAreaLayerOneEndY(a6),d1
                bge.s   loc_5078
                move.w  #MAP_TILE_SIZE,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                moveq   #DOWN,d6
loc_5078:
                
                btst    #INPUT_BIT_LEFT,currentPlayerInput(a6)
                beq.s   loc_5094
                cmp.w   mapAreaLayerOneStartX(a6),d0
                ble.s   loc_5094
                move.w  #MAP_TILE_MINUS,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                neg.w   d2
                moveq   #LEFT,d6
loc_5094:
                
                btst    #INPUT_BIT_RIGHT,currentPlayerInput(a6)
                beq.s   loc_50AE
                cmp.w   mapAreaLayerOneEndX(a6),d0
                bge.s   loc_50AE
                move.w  #MAP_TILE_SIZE,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                clr.w   d6              ; RIGHT
loc_50AE:
                
                unlk    a6
                tst.w   d6
                bge.w   loc_50BC
                addq.l  #2,a1
                bra.w   esc_goToNextEntity
loc_50BC:
                
                btst    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.w   loc_51A8
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   loc_50D6
                btst    #INPUT_BIT_B,((PLAYER_1_INPUT-$1000000)).w
                bne.w   loc_51A8
loc_50D6:
                
                btst    #0,d6
                bne.w   loc_51A8
                movem.w d0-d1,-(sp)
                movem.w d2-d3,-(sp)
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  d2,d0
                movem.w (sp)+,d2-d3
                move.w  (a4,d0.w),d1
                andi.w  #$C000,d1
                btst    #$F,d1
                beq.s   loc_514E
                tst.w   d6
                bne.w   loc_5124
                addi.w  #-$7E,d0
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_5124
                move.w  #MAP_TILE_MINUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                neg.w   d3
                bra.w   loc_51A4
loc_5124:
                
                cmpi.w  #2,d6
                bne.w   loc_514A
                addi.w  #$7E,d0 
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_514A
                move.w  #MAP_TILE_SIZE,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                bra.w   loc_51A4
loc_514A:
                
                bra.w   loc_51A4
loc_514E:
                
                btst    #$E,d1
                beq.s   loc_51A4
                tst.w   d6
                bne.w   loc_5178
                addi.w  #$82,d0 
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_5178
                move.w  #MAP_TILE_SIZE,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                bra.w   loc_51A4
loc_5178:
                
                cmpi.w  #2,d6
                bne.w   loc_51A0
                addi.w  #-$82,d0
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_51A0
                move.w  #MAP_TILE_MINUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                neg.w   d3
                bra.w   loc_51A4
loc_51A0:
                
                bra.w   *+4
loc_51A4:
                
                movem.w (sp)+,d0-d1
loc_51A8:
                
                add.w   d4,d0
                add.w   d5,d1
                movem.w d4-d6,-(sp)
                btst    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.w   loc_5220
                moveq   #BATTLE_ALLY_ENTITIES_COUNTER,d6
                lea     ((ENTITY_DATA-$1000000)).w,a2
loc_51C0:
                
                btst    #7,ENTITYDEF_OFFSET_FLAGS_A(a2)
                beq.w   loc_5218
                move.w  (a2),d4
                move.w  ENTITYDEF_OFFSET_Y(a2),d5
                sub.w   d0,d4
                bpl.s   loc_51D6
                neg.w   d4
loc_51D6:
                
                cmpi.w  #$100,d4
                bge.w   loc_51EC
                sub.w   d1,d5
                bpl.s   loc_51E4
                neg.w   d5
loc_51E4:
                
                cmpi.w  #$100,d5
                blt.w   loc_5210
loc_51EC:
                
                move.w  ENTITYDEF_OFFSET_XDEST(a2),d4
                move.w  ENTITYDEF_OFFSET_YDEST(a2),d5
                sub.w   d0,d4
                bpl.s   loc_51FA
                neg.w   d4
loc_51FA:
                
                cmpi.w  #$100,d4
                bge.w   loc_5218
                sub.w   d1,d5
                bpl.s   loc_5208
                neg.w   d5
loc_5208:
                
                cmpi.w  #$100,d5
                bge.w   loc_5218
loc_5210:
                
                movem.w (sp)+,d4-d6
                bra.w   loc_531E
loc_5218:
                
                adda.w  #ENTITYDEF_SIZE,a2
                dbf     d6,loc_51C0
loc_5220:
                
                movem.w (sp)+,d4-d6
                movem.w d2-d3,-(sp)
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
                cmpi.w  #$3800,d3
                bne.s   loc_5256
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   loc_5256
                chkFlg  65              ; Caravan is unlocked
                beq.s   loc_5256
                move.w  #MAP_EVENT_GETINTOCARAVAN,((MAP_EVENT_TYPE-$1000000)).w
                movem.w (sp)+,d2-d3
                bra.w   loc_531E
loc_5256:
                
                cmpi.w  #$3C00,d3
                bne.s   loc_5278
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   loc_5278
                chkFlg  64              ; Raft is unlocked
                beq.s   loc_5278
                move.w  #MAP_EVENT_GETINTORAFT,((MAP_EVENT_TYPE-$1000000)).w
                movem.w (sp)+,d2-d3
                bra.w   loc_531E
loc_5278:
                
                cmpi.w  #$400,d3
                bne.s   loc_528A
                bsr.w   OpenDoor        
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
loc_528A:
                
                cmpi.w  #$1000,d3
                bne.s   loc_5294
                bsr.w   WarpIfSetAtPoint
loc_5294:
                
                cmpi.w  #$1400,d3
                bne.s   loc_52C0
                move.w  #MAP_EVENT_ZONE_EVENT,((MAP_EVENT_TYPE-$1000000)).w
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d3
                add.w   d4,d3
                ext.l   d3
                divs.w  #MAP_TILE_SIZE,d3
                move.w  d3,((MAP_EVENT_PARAM_1-$1000000)).w
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
                add.w   d5,d3
                ext.l   d3
loc_52B8:
                
                divs.w  #MAP_TILE_SIZE,d3
                move.w  d3,((MAP_EVENT_PARAM_3-$1000000)).w
loc_52C0:
                
                cmpi.w  #$C000,(a4,d2.w)
                movem.w (sp)+,d2-d3
                bcs.w   loc_52E8
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   loc_52DE
                btst    #INPUT_BIT_B,((PLAYER_1_INPUT-$1000000)).w
                bne.w   loc_52E8
loc_52DE:
                
                btst    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bne.w   loc_531E
loc_52E8:
                
                move.w  d0,-(sp)
                move.w  ((MOVE_SFX-$1000000)).w,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                move.w  (sp)+,d0
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_5300
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_5300:
                
                move.b  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
                beq.s   loc_530C
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_YTRAVEL(a0)
            else
                move.w  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_5300
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_5300:
                
                move.w  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
                beq.s   loc_530C
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_YTRAVEL(a0)
            endif
loc_530C:
                
                add.w   d4,ENTITYDEF_OFFSET_XDEST(a0)
                add.w   d5,ENTITYDEF_OFFSET_YDEST(a0)
                tst.w   ((word_FFB196-$1000000)).w
                ble.s   loc_531E
                subq.w  #1,((word_FFB196-$1000000)).w
loc_531E:
                
                bsr.w   UpdateEntitySprite
                addq.l  #2,a1
                bra.w   esc_goToNextEntity

    ; End of function esc02_controlCharacter


; =============== S U B R O U T I N E =======================================


esc03_follow:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                move.l  a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  2(a1),d2
                lsl.w   #ENTITYDEF_SIZE_BITS,d2
                adda.w  d2,a0
                move.w  (a0),d2
                move.w  ENTITYDEF_OFFSET_Y(a0),d3
                sub.w   d2,d0
                bpl.s   loc_5348
                neg.w   d0
loc_5348:
                
                sub.w   d3,d1
                bpl.s   loc_534E
                neg.w   d1
loc_534E:
                
                cmp.w   d0,d1
                ble.s   loc_5354
                move.w  d1,d0
loc_5354:
                
                cmpi.w  #$1E0,d0
                bgt.s   loc_5360
                movea.l (sp)+,a0
                bra.w   loc_53F8
loc_5360:
                
                move.b  ENTITYDEF_OFFSET_FACING(a0),d4
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                move.w  4(a1),d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                move.w  6(a1),d3
                lsl.w   #NIBBLE_SHIFT_COUNT,d3
                bsr.w   sub_5FAC
                bsr.w   ConvertMapPixelCoordinatesToOffset
                cmpi.w  #$C000,(a4,d2.w)
                bcs.s   loc_53B4
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                move.w  4(a1),d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0),d4
                bsr.w   sub_5FAC
                bsr.w   ConvertMapPixelCoordinatesToOffset
                cmpi.w  #$C000,(a4,d2.w)
                bcs.s   loc_53B4
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
loc_53B4:
                
                movea.l (sp)+,a0
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  (a0),d2
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d3
                ext.w   d3
                sub.w   d2,d0
                bne.s   loc_53C8
                clr.w   d3
loc_53C8:
                
                bpl.s   loc_53CE
                neg.w   d0
                neg.w   d3
loc_53CE:
                
                move.w  d0,ENTITYDEF_OFFSET_XTRAVEL(a0)
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d3,ENTITYDEF_OFFSET_XVELOCITY(a0)
            else
                move.w  d3,ENTITYDEF_OFFSET_XVELOCITY(a0)
            endif
                move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
                move.w  ENTITYDEF_OFFSET_Y(a0),d2
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                sub.w   d2,d1
                bne.s   loc_53EA
                clr.w   d3
loc_53EA:
                
                bpl.s   loc_53F0
                neg.w   d1
                neg.w   d3
loc_53F0:
                
                move.w  d1,ENTITYDEF_OFFSET_YTRAVEL(a0)
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            else
                move.w  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            endif
loc_53F8:
                
                addq.l  #8,a1
                bra.w   esc_goToNextEntity

    ; End of function esc03_follow


; =============== S U B R O U T I N E =======================================

; related to moving an entity


esc04_moveToRelativeDest:
                
                move.w  2(a1),d0
                move.w  4(a1),d1
                muls.w  #MAP_TILE_SIZE,d0
                muls.w  #MAP_TILE_SIZE,d1
                add.w   (a0),d0         ; get new pos
                add.w   ENTITYDEF_OFFSET_Y(a0),d1
                bsr.w   HasSameDestinationAsOtherEntity
                bne.w   esc_goToNextEntity
                addq.l  #6,a1
                bra.w   loc_55C8

    ; End of function esc04_moveToRelativeDest


; =============== S U B R O U T I N E =======================================


esc05_moveToAbsoluteDest:
                
                move.w  2(a1),d0
                move.w  4(a1),d1
                mulu.w  #MAP_TILE_SIZE,d0
                mulu.w  #MAP_TILE_SIZE,d1
                bsr.w   HasSameDestinationAsOtherEntity
                bne.w   esc_goToNextEntity
                addq.l  #6,a1
                bra.w   loc_55C8

    ; End of function esc05_moveToAbsoluteDest


; =============== S U B R O U T I N E =======================================


esc06_walkRandomly:
                
                move.w  2(a1),d2
                move.w  4(a1),d3
                move.w  2(a1),d4
                move.w  4(a1),d5
                sub.w   6(a1),d2
                sub.w   6(a1),d3
                add.w   6(a1),d4
                add.w   6(a1),d5
                mulu.w  #MAP_TILE_SIZE,d2
                mulu.w  #MAP_TILE_SIZE,d3
                mulu.w  #MAP_TILE_SIZE,d4
                mulu.w  #MAP_TILE_SIZE,d5
                moveq   #DOWN,d6
loc_5472:
                
                move.w  d6,-(sp)
                movem.w d7,-(sp)
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                moveq   #4,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d6
                movem.w (sp)+,d7
                bne.s   loc_549A
                cmp.w   d4,d0
                bge.w   loc_55B8
                addi.w  #MAP_TILE_SIZE,d0
                bra.w   loc_54CC
loc_549A:
                
                cmpi.w  #1,d6
                bne.s   loc_54AE
                cmp.w   d3,d1
                ble.w   loc_55B8
                subi.w  #MAP_TILE_SIZE,d1
                bra.w   loc_54CC
loc_54AE:
                
                cmpi.w  #2,d6
                bne.s   loc_54C2
                cmp.w   d2,d0
                ble.w   loc_55B8
                subi.w  #MAP_TILE_SIZE,d0
                bra.w   loc_54CC
loc_54C2:
                
                cmp.w   d5,d1
                bge.w   loc_55B8
                addi.w  #MAP_TILE_SIZE,d1
loc_54CC:
                
                btst    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.w   loc_55B0
                move.w  d7,-(sp)
                clr.w   d7
                btst    #0,d6
                bne.w   loc_5596
                movem.w d0-d1,-(sp)
                movem.w d2-d3,-(sp)
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  d2,d0
                movem.w (sp)+,d2-d3
                move.w  (a4,d0.w),d1
                andi.w  #$C000,d1
                btst    #$F,d1
                beq.s   loc_554A
                tst.w   d6
                bne.w   loc_5526
                addi.w  #-$7E,d0
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                
                cmp.w   d0,d1
                bne.s   loc_5526
                move.w  #MAP_TILE_MINUS,d7
                bra.w   loc_5592
loc_5526:
                
                cmpi.w  #2,d6
                bne.w   loc_5546
                addi.w  #$7E,d0 
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_5546
                move.w  #MAP_TILE_PLUS,d7
                bra.w   loc_5592
loc_5546:
                
                bra.w   loc_5592
loc_554A:
                
                btst    #$E,d1
                beq.s   loc_5592
                tst.w   d6
                bne.w   loc_556E
                addi.w  #$82,d0 
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_556E
                move.w  #MAP_TILE_PLUS,d7
                bra.w   loc_5592
loc_556E:
                
                cmpi.w  #2,d6
                bne.w   loc_558E
                addi.w  #-$82,d0
                move.w  (a4,d0.w),d0
                andi.w  #$C000,d0
                cmp.w   d0,d1
                bne.s   loc_558E
                move.w  #MAP_TILE_MINUS,d7
                bra.w   loc_5592
loc_558E:
                
                bra.w   *+4
loc_5592:
                
                movem.w (sp)+,d0-d1
loc_5596:
                
                add.w   d7,d1
                move.w  (sp)+,d7
                movem.w d2-d3,-(sp)
                bsr.w   ConvertMapPixelCoordinatesToOffset
                cmpi.w  #$C000,(a4,d2.w)
                movem.w (sp)+,d2-d3
                bcc.w   loc_55B8
loc_55B0:
                
                bsr.w   HasSameDestinationAsOtherEntity
                beq.w   loc_55C4
loc_55B8:
                
                move.w  (sp)+,d6
                dbf     d6,loc_5472
                
                addq.l  #8,a1
                bra.w   esc_goToNextEntity
loc_55C4:
                
                move.w  (sp)+,d6
                addq.l  #8,a1
loc_55C8:
                
                clr.w   d4
                clr.w   d5
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d4
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d5
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                cmp.w   (a0),d0
                bne.s   loc_55DE
                clr.w   d4
loc_55DE:
                
                sub.w   (a0),d0
                bpl.s   loc_55E6
                neg.w   d0
                neg.w   d4
loc_55E6:
                
                move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
                cmp.w   ENTITYDEF_OFFSET_Y(a0),d1
                bne.s   loc_55F2
                clr.w   d5
loc_55F2:
                
                sub.w   ENTITYDEF_OFFSET_Y(a0),d1
                bpl.s   loc_55FC
                neg.w   d1
                neg.w   d5
loc_55FC:
                
                move.w  d0,ENTITYDEF_OFFSET_XTRAVEL(a0)
                move.w  d1,ENTITYDEF_OFFSET_YTRAVEL(a0)
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                move.b  d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
            else
                move.w  d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                move.w  d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
            endif
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc06_walkRandomly


; =============== S U B R O U T I N E =======================================

; Check if another entity has the same destination as current entity.
; 
; Out: CCR zero-bit set if true


HasSameDestinationAsOtherEntity:
                
                module
                movem.w d4-d6,-(sp)
                btst    #5,ENTITYDEF_OFFSET_FLAGS_A(a0) ; end if not obstructed by people
                beq.w   @Return
                
                moveq   #48,d6
                lea     ((ENTITY_DATA-$1000000)).w,a2
@LoopEntities:
                
                cmpi.w  #$7000,(a2)     ; test each entity
                beq.w   @NextEntity
                cmp.w   d6,d7
                beq.w   @NextEntity
                move.w  ENTITYDEF_OFFSET_XDEST(a2),d4 ; compare dests
                move.w  ENTITYDEF_OFFSET_YDEST(a2),d5
                sub.w   d0,d4
                bpl.s   @CompareX
                neg.w   d4
@CompareX:
                
                sub.w   d1,d5
                bpl.s   @CompareY
                neg.w   d5
@CompareY:
                
                add.w   d4,d5
                cmpi.w  #MAP_TILE_SIZE,d5
                bcc.w   @NextEntity
                moveq   #-1,d4
                movem.w (sp)+,d4-d6
                rts
@NextEntity:
                
                adda.w  #ENTITYDEF_SIZE,a2
                dbf     d6,@LoopEntities
@Return:
                
                clr.w   d4
                movem.w (sp)+,d4-d6
                rts

    ; End of function HasSameDestinationAsOtherEntity

                modend

; =============== S U B R O U T I N E =======================================

; related to controlling raft

playerOneInput = -10
mapAreaLayerOneEndX = -8
mapAreaLayerOneEndY = -6
mapAreaLayerOneStartX = -4
mapAreaLayerOneStartY = -2

esc07_controlRaft:
                
                link    a6,#-10
                move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,mapAreaLayerOneStartX(a6)
                move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,mapAreaLayerOneEndX(a6)
                move.b  ((PLAYER_1_INPUT-$1000000)).w,playerOneInput(a6)
                move.w  (a0),d0         ; X
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                moveq   #-1,d6
                btst    #INPUT_BIT_UP,playerOneInput(a6)
                beq.s   @CheckInput_Down
                cmp.w   mapAreaLayerOneStartY(a6),d1
                ble.s   @CheckInput_Down
                
                ; Pressed Up
                move.w  #MAP_TILE_MINUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                neg.w   d3
                moveq   #UP,d6
@CheckInput_Down:
                
                btst    #INPUT_BIT_DOWN,playerOneInput(a6)
                beq.s   @CheckInput_Left
                cmp.w   mapAreaLayerOneEndY(a6),d1
                bge.s   @CheckInput_Left
                move.w  #MAP_TILE_PLUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                moveq   #DOWN,d6
@CheckInput_Left:
                
                btst    #INPUT_BIT_LEFT,playerOneInput(a6)
                beq.s   @CheckInput_Right
                cmp.w   mapAreaLayerOneStartX(a6),d0
                ble.s   @CheckInput_Right
                move.w  #MAP_TILE_MINUS,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                neg.w   d2
                moveq   #LEFT,d6
@CheckInput_Right:
                
                btst    #INPUT_BIT_RIGHT,playerOneInput(a6)
                beq.s   loc_56FA
                cmp.w   mapAreaLayerOneEndX(a6),d0
                bge.s   loc_56FA
                move.w  #MAP_TILE_PLUS,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                clr.w   d6              ; RIGHT
loc_56FA:
                
                unlk    a6
                tst.w   d6
                bge.w   loc_5708        ; no facing change
                addq.l  #2,a1
                bra.w   esc_goToNextEntity
loc_5708:
                
                add.w   d4,d0
                add.w   d5,d1
                movem.w d4-d6,-(sp)
                btst    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.w   loc_575C
                moveq   #BATTLE_ALLY_ENTITIES_COUNTER,d6
                lea     ((ENTITY_DATA-$1000000)).w,a2
loc_5720:
                
                btst    #7,ENTITYDEF_OFFSET_FLAGS_A(a2)
                beq.w   loc_5754
                move.w  (a2),d4
                move.w  ENTITYDEF_OFFSET_Y(a2),d5
                sub.w   d0,d4
                bpl.s   loc_5736
                neg.w   d4
loc_5736:
                
                cmpi.w  #$100,d4
                bge.w   loc_5754
                sub.w   d1,d5
                bpl.s   loc_5744
                neg.w   d5
loc_5744:
                
                cmpi.w  #$100,d5
                bge.w   loc_5754
                movem.w (sp)+,d4-d6
                bra.w   loc_57E0
loc_5754:
                
                adda.w  #ENTITYDEF_SIZE,a2
                dbf     d6,loc_5720
loc_575C:
                
                movem.w (sp)+,d4-d6
                movem.w d2-d3,-(sp)
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
                cmpi.w  #$400,d3
                bne.s   loc_5782
                bsr.w   OpenDoor        
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
loc_5782:
                
                cmpi.w  #$1000,d3
                bne.s   loc_5794
                bsr.w   WarpIfSetAtPoint
                movem.w (sp)+,d2-d3
                bra.w   loc_57C0
loc_5794:
                
                cmpi.w  #$3800,d3
                bne.s   loc_57A2
                movem.w (sp)+,d2-d3
                bra.w   loc_57C0
loc_57A2:
                
                cmpi.w  #$C000,(a4,d2.w)
                bcc.s   loc_57B8
                move.w  #MAP_EVENT_GETOUTOFRAFT,((MAP_EVENT_TYPE-$1000000)).w
                movem.w (sp)+,d2-d3
                bra.w   loc_57E0
loc_57B8:
                
                movem.w (sp)+,d2-d3
                bra.w   loc_57E0
loc_57C0:
                
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_57CC
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_57CC:
                
                move.b  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            else
                move.w  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_57CC
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_57CC:
                
                move.w  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            endif
                beq.s   loc_57D8
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_YTRAVEL(a0)
loc_57D8:
                
                add.w   d4,ENTITYDEF_OFFSET_XDEST(a0)
                add.w   d5,ENTITYDEF_OFFSET_YDEST(a0)
loc_57E0:
                
                bsr.w   UpdateEntitySprite
                addq.l  #2,a1
                bra.w   esc_goToNextEntity

    ; End of function esc07_controlRaft


; =============== S U B R O U T I N E =======================================

; related to controlling caravan

playerOneInput = -10
mapAreaLayerOneEndX = -8
mapAreaLayerOneEndY = -6
mapAreaLayerOneStartX = -4
mapAreaLayerOneStartY = -2

esc08_controlCaravan:
                
                link    a6,#-10
                move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,mapAreaLayerOneStartX(a6)
                move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,mapAreaLayerOneEndX(a6)
                move.b  ((PLAYER_1_INPUT-$1000000)).w,playerOneInput(a6)
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                moveq   #-1,d6
                btst    #INPUT_BIT_UP,playerOneInput(a6)
                beq.s   @CheckInput_Down
                cmp.w   mapAreaLayerOneStartY(a6),d1
                ble.s   @CheckInput_Down
                
                move.w  #MAP_TILE_MINUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                neg.w   d3
                moveq   #UP,d6
@CheckInput_Down:
                
                btst    #INPUT_BIT_DOWN,playerOneInput(a6)
                beq.s   @CheckInput_Left
                cmp.w   mapAreaLayerOneEndY(a6),d1
                bge.s   @CheckInput_Left
                move.w  #MAP_TILE_PLUS,d5
                move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
                ext.w   d3
                moveq   #DOWN,d6
@CheckInput_Left:
                
                btst    #INPUT_BIT_LEFT,playerOneInput(a6)
                beq.s   @CheckInput_Right
                cmp.w   mapAreaLayerOneStartX(a6),d0
                ble.s   @CheckInput_Right
                move.w  #MAP_TILE_MINUS,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                neg.w   d2
                moveq   #LEFT,d6
@CheckInput_Right:
                
                btst    #INPUT_BIT_RIGHT,playerOneInput(a6)
                beq.s   loc_587C
                cmp.w   mapAreaLayerOneEndX(a6),d0
                bge.s   loc_587C
                move.w  #MAP_TILE_PLUS,d4
                move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
                ext.w   d2
                clr.w   d6              ; RIGHT
loc_587C:
                
                unlk    a6
                tst.w   d6
                bge.w   loc_588A
                addq.l  #2,a1
                bra.w   esc_goToNextEntity
loc_588A:
                
                add.w   d4,d0
                add.w   d5,d1
                movem.w d4-d6,-(sp)
                btst    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.w   loc_58DE
                moveq   #BATTLE_ALLY_ENTITIES_COUNTER,d6
                lea     ((ENTITY_DATA-$1000000)).w,a2
loc_58A2:
                
                btst    #7,ENTITYDEF_OFFSET_FLAGS_A(a2)
                beq.w   loc_58D6
                move.w  (a2),d4
                move.w  ENTITYDEF_OFFSET_Y(a2),d5
                sub.w   d0,d4
                bpl.s   loc_58B8
                neg.w   d4
loc_58B8:
                
                cmpi.w  #$100,d4
                bge.w   loc_58D6
                sub.w   d1,d5
                bpl.s   loc_58C6
                neg.w   d5
loc_58C6:
                
                cmpi.w  #$100,d5
                bge.w   loc_58D6
                movem.w (sp)+,d4-d6
                bra.w   loc_5962
loc_58D6:
                
                adda.w  #ENTITYDEF_SIZE,a2
                dbf     d6,loc_58A2
loc_58DE:
                
                movem.w (sp)+,d4-d6
                movem.w d2-d3,-(sp)
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
                cmpi.w  #$400,d3
                bne.s   loc_5904
                bsr.w   OpenDoor        
                move.w  (a4,d2.w),d3
                andi.w  #$3C00,d3
loc_5904:
                
                cmpi.w  #$1000,d3
                bne.s   loc_5916
                bsr.w   WarpIfSetAtPoint
                movem.w (sp)+,d2-d3
                bra.w   loc_5942
loc_5916:
                
                cmpi.w  #$3C00,d3
                bne.s   loc_5924
                movem.w (sp)+,d2-d3
                bra.w   loc_5942
loc_5924:
                
                cmpi.w  #$C000,(a4,d2.w)
                bcc.s   loc_593A
                move.w  #MAP_EVENT_GETOUTOFCARAVAN,((MAP_EVENT_TYPE-$1000000)).w
                movem.w (sp)+,d2-d3
                bra.w   loc_5962
loc_593A:
                
                movem.w (sp)+,d2-d3
                bra.w   loc_5962
loc_5942:
                
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_594E
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_594E:
                
                move.b  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            else
                move.w  d2,ENTITYDEF_OFFSET_XVELOCITY(a0)
                beq.s   loc_594E
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_594E:
                
                move.w  d3,ENTITYDEF_OFFSET_YVELOCITY(a0)
            endif
                beq.s   loc_595A
                move.w  #MAP_TILE_SIZE,ENTITYDEF_OFFSET_YTRAVEL(a0)
loc_595A:
                
                add.w   d4,ENTITYDEF_OFFSET_XDEST(a0)
                add.w   d5,ENTITYDEF_OFFSET_YDEST(a0)
loc_5962:
                
                bsr.w   UpdateEntitySprite
                addq.l  #2,a1
                bra.w   esc_goToNextEntity

    ; End of function esc08_controlCaravan


; =============== S U B R O U T I N E =======================================


esc09_moveToFacingRelativePosition:
                
                movem.l d2-d3,-(sp)
                move.w  2(a1),d2
                move.w  4(a1),d3
                move.b  ENTITYDEF_OFFSET_FACING(a0),d0 ; facing
                move.w  d0,d1
                andi.w  #4,d0
                andi.w  #3,d1
                add.w   d1,d2
                andi.w  #3,d2
                or.w    d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                move.w  table_59AC(pc,d2.w),d0
                move.w  table_59AE(pc,d2.w),d1
                muls.w  d3,d0
                muls.w  d3,d1
                add.w   (a0),d0
                add.w   ENTITYDEF_OFFSET_Y(a0),d1
                movem.l (sp)+,d2-d3
                addq.l  #6,a1
                bra.w   loc_55C8
table_59AC:
                
                dc.w MAP_TILE_PLUS
table_59AE:
                
                dc.w 0
                dc.w 0
                dc.w MAP_TILE_MINUS
                dc.w MAP_TILE_MINUS
                dc.w 0
                dc.w 0
                dc.w MAP_TILE_PLUS
                dc.w MAP_TILE_PLUS
                dc.w MAP_TILE_MINUS
                dc.w MAP_TILE_MINUS
                dc.w MAP_TILE_MINUS
                dc.w MAP_TILE_MINUS
                dc.w MAP_TILE_PLUS
                dc.w MAP_TILE_PLUS
                dc.w MAP_TILE_PLUS

    ; End of function esc09_moveToFacingRelativePosition


; =============== S U B R O U T I N E =======================================


esc0E_moveToEntityFacingRelativePosition:
                
                movem.l d2-d3/a1,-(sp)
                move.w  4(a1),d2
                move.w  6(a1),d3
                move.w  2(a1),d0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a1
                adda.w  d0,a1
                move.b  ENTITYDEF_OFFSET_FACING(a1),d0 ; other entity facing
                move.w  d0,d1
                andi.w  #4,d0
                andi.w  #3,d1
                add.w   d1,d2
                andi.w  #3,d2
                or.w    d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                move.w  table_59AC(pc,d2.w),d0
                move.w  table_59AE(pc,d2.w),d1
                muls.w  d3,d0
                muls.w  d3,d1
                add.w   (a1),d0
                add.w   ENTITYDEF_OFFSET_Y(a1),d1
                movem.l (sp)+,d2-d3/a1
                addq.l  #8,a1
                bra.w   loc_55C8

    ; End of function esc0E_moveToEntityFacingRelativePosition


; =============== S U B R O U T I N E =======================================


esc0A_updateSprite:
                
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                bgt.w   esc_goToNextEntity
                move.b  ENTITYDEF_OFFSET_FACING(a0),d6
                bsr.w   ChangeEntityMapsprite
                addq.l  #2,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc0A_updateSprite


; =============== S U B R O U T I N E =======================================


esc0B_setSpriteSize:
                
                move.w  2(a1),((SPRITE_SIZE-$1000000)).w
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc0B_setSpriteSize


; =============== S U B R O U T I N E =======================================

; set new pos/dest, clear offset


esc0C_setPosition:
                
                move.w  2(a1),d0
                move.w  4(a1),d1
                muls.w  #MAP_TILE_SIZE,d0
                muls.w  #MAP_TILE_SIZE,d1
                move.w  d0,(a0)
                move.w  d1,ENTITYDEF_OFFSET_Y(a0)
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
                clr.l   ENTITYDEF_OFFSET_XTRAVEL(a0)
                addq.l  #6,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc0C_setPosition


; =============== S U B R O U T I N E =======================================

; set same X pos, dest, offset and facing as other entity


esc0D_clonePosition:
                
                move.l  a1,-(sp)
                move.w  2(a1),d0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a1
                adda.w  d0,a1
                move.l  (a1),(a0)
                move.l  ENTITYDEF_OFFSET_XDEST(a1),ENTITYDEF_OFFSET_XDEST(a0)
                move.l  ENTITYDEF_OFFSET_XTRAVEL(a1),ENTITYDEF_OFFSET_XTRAVEL(a0)
                move.b  ENTITYDEF_OFFSET_FACING(a1),d6
                move.b  d6,ENTITYDEF_OFFSET_FACING(a0)
                bsr.w   ChangeEntityMapsprite
                movea.l (sp)+,a1
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc0D_clonePosition


; =============== S U B R O U T I N E =======================================


esc0F_waitUntilOtherEntityReachesDest:
                
                move.l  a0,-(sp)
                move.w  2(a1),d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a0
                move.w  (a0),d0         ; pos
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d2 ; dest
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
                move.w  d2,d4
                move.w  d3,d5
                sub.w   d0,d4
                sub.w   d1,d5
                move.w  d5,d6
                or.w    d4,d6
                movea.l (sp)+,a0
                bne.w   esc_clearTimerGoToNextEntity
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc0F_waitUntilOtherEntityReachesDest


; =============== S U B R O U T I N E =======================================


esc10_setSpeed:
                
                move.w  2(a1),ENTITYDEF_OFFSET_XSPEED(a0)
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc10_setSpeed


; =============== S U B R O U T I N E =======================================


esc11_setAccelerationFactors:
                
                move.w  2(a1),ENTITYDEF_OFFSET_XACCEL(a0)
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc11_setAccelerationFactors


; =============== S U B R O U T I N E =======================================


esc12_activateAcceleration:
                
                tst.b   2(a1)
                bne.s   loc_5AEE
                bclr    #0,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5AF4
loc_5AEE:
                
                bset    #0,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5AF4:
                
                tst.b   3(a1)
                bne.s   loc_5B02
                bclr    #1,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5B08
loc_5B02:
                
                bset    #1,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5B08:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc12_activateAcceleration


; =============== S U B R O U T I N E =======================================


esc13_activateDeceleration:
                
                tst.b   2(a1)
                bne.s   loc_5B1C
                bclr    #2,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5B22
loc_5B1C:
                
                bset    #2,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5B22:
                
                tst.b   3(a1)
                bne.s   loc_5B30
                bclr    #3,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5B36
loc_5B30:
                
                bset    #3,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5B36:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc13_activateDeceleration


; =============== S U B R O U T I N E =======================================


esc14_setAnimationCounter:
                
                tst.w   2(a1)
                beq.s   loc_5B4A
                move.b  #1,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
                bra.s   loc_5B50
loc_5B4A:
                
                move.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_5B50:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc14_setAnimationCounter


; =============== S U B R O U T I N E =======================================


esc15_setAutoFacing:
                
                tst.w   2(a1)
                bne.s   loc_5B64
                bclr    #6,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5B6A
loc_5B64:
                
                bset    #6,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5B6A:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc15_setAutoFacing


; =============== S U B R O U T I N E =======================================


esc16_setEntityNumber:
                
                move.b  3(a1),ENTITYDEF_OFFSET_ENTNUM(a0)
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc16_setEntityNumber


; =============== S U B R O U T I N E =======================================


esc17_setSpriteNumber:
                
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.w  2(a1),ENTITYDEF_OFFSET_MAPSPRITE(a0)
            else
                move.b  3(a1),ENTITYDEF_OFFSET_MAPSPRITE(a0)
            endif
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc17_setSpriteNumber


; =============== S U B R O U T I N E =======================================



esc18_setEntityObstructable:
                
                tst.w   2(a1)
                bne.s   loc_5B96
                bclr    #7,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5B9C
loc_5B96:
                
                bset    #7,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5B9C:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc18_setEntityObstructable


; =============== S U B R O U T I N E =======================================


esc19_setMapCollidable:
                
                tst.w   2(a1)
                bne.s   loc_5BB0
                bclr    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5BB6
loc_5BB0:
                
                bset    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5BB6:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc19_setMapCollidable


; =============== S U B R O U T I N E =======================================


esc1A_setEntityCollidable:
                
                tst.w   2(a1)
                bne.s   loc_5BCA
                bclr    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5BD0
loc_5BCA:
                
                bset    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5BD0:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1A_setEntityCollidable


; =============== S U B R O U T I N E =======================================


esc1B_setEntityOrientation:
                
                move.w  2(a1),d0
                andi.w  #3,d0
                andi.b  #$FC,ENTITYDEF_OFFSET_FLAGS_B(a0)
                or.b    d0,ENTITYDEF_OFFSET_FLAGS_B(a0)
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1B_setEntityOrientation


; =============== S U B R O U T I N E =======================================


esc1C_setEntityTransparency:
                
                tst.w   2(a1)
                bne.s   loc_5BFC
                bclr    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5C02
loc_5BFC:
                
                bset    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C02:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1C_setEntityTransparency


; =============== S U B R O U T I N E =======================================


esc1D_setEntityGhost:
                
                tst.w   2(a1)
                bne.s   loc_5C16
                bclr    #2,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5C1C
loc_5C16:
                
                bset    #2,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C1C:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1D_setEntityGhost


; =============== S U B R O U T I N E =======================================


esc1E_setEntityAnimSpeedx2:
                
                tst.w   2(a1)
                bne.s   loc_5C30
                bclr    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5C36
loc_5C30:
                
                bset    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C36:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1E_setEntityAnimSpeedx2


; =============== S U B R O U T I N E =======================================


esc1F_setResizable:
                
                tst.w   2(a1)
                bne.s   loc_5C4A
                bclr    #3,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5C50
loc_5C4A:
                
                bset    #3,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C50:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc1F_setResizable


; =============== S U B R O U T I N E =======================================


esc20_setImmersed:
                
                tst.w   2(a1)
                bne.s   loc_5C64
                bclr    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5C6A
loc_5C64:
                
                bset    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C6A:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc20_setImmersed


; =============== S U B R O U T I N E =======================================

; unused command


esc21_set1Cbit4:
                
                tst.w   2(a1)
                bne.s   loc_5C7E
                bclr    #4,ENTITYDEF_OFFSET_FLAGS_A(a0)
                bra.s   loc_5C84
loc_5C7E:
                
                bset    #4,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5C84:
                
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc21_set1Cbit4


; =============== S U B R O U T I N E =======================================


esc22_setEntityFacing:
                
                move.w  2(a1),d0
                move.b  d0,ENTITYDEF_OFFSET_FACING(a0)
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc22_setEntityFacing


; =============== S U B R O U T I N E =======================================


esc23_sendSoundCommand:
                
                move.w  2(a1),d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                addq.l  #4,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc23_sendSoundCommand


; =============== S U B R O U T I N E =======================================

; parse from current offset + xxxx


esc30_branch:
                
                adda.w  2(a1),a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc30_branch


; =============== S U B R O U T I N E =======================================


esc31_branchIfFlagSet:
                
                movem.w d1,-(sp)
                move.w  2(a1),d1
                bsr.w   j_CheckFlag
                movem.w (sp)+,d1
                beq.s   loc_5CC6
                adda.w  4(a1),a1
                bra.s   loc_5CC8
loc_5CC6:
                
                addq.l  #6,a1
loc_5CC8:
                
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc31_branchIfFlagSet


; =============== S U B R O U T I N E =======================================


esc32_branchIfFlagClear:
                
                movem.w d1,-(sp)
                move.w  2(a1),d1
                bsr.w   j_CheckFlag
                movem.w (sp)+,d1
                bne.s   loc_5CE4
                adda.w  4(a1),a1
                bra.s   loc_5CE6
loc_5CE4:
                
                addq.l  #6,a1
loc_5CE6:
                
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc32_branchIfFlagClear


; =============== S U B R O U T I N E =======================================


esc33_randomBranch:
                
                movem.w d6-d7,-(sp)
                move.w  #2,d6
                bsr.w   GenerateRandomNumber
                tst.w   d7
                movem.w (sp)+,d6-d7
                bne.s   loc_5D04
                adda.w  4(a1),a1
                bra.s   loc_5D06
loc_5D04:
                
                addq.l  #6,a1
loc_5D06:
                
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc33_randomBranch


; =============== S U B R O U T I N E =======================================


esc34_jump:
                
                movea.l 2(a1),a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc34_jump


; =============== S U B R O U T I N E =======================================


esc40_checkMapBlockCopy:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_5D42
                move.w  (a0),d0         ; get player's pixel position from entity info
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  (a4,d2.w),d3    ; copy block index under player from RAM
                move.w  d3,d2
                andi.w  #$3C00,d2
                cmpi.w  #$800,d2        ; check for block copy "show" flag
                bne.s   loc_5D38        
                bsr.w   PerformMapBlockCopyScript
                bra.s   loc_5D42
loc_5D38:
                
                cmpi.w  #$C00,d2        ; check for bock copy "hide" flag
                bne.s   loc_5D42
loc_5D3E:
                
                bsr.w   csub_40F2
loc_5D42:
                
                addq.l  #2,a1
                bra.w   esc_clearTimerGoToNextCommand

    ; End of function esc40_checkMapBlockCopy


; =============== S U B R O U T I N E =======================================

; directly go to next command 4 bytes forward


esc41_pass:
                
                addq.l  #4,a1
                bra.w   *+4

    ; End of function esc41_pass


; =============== S U B R O U T I N E =======================================


esc_clearTimerGoToNextCommand:
                
                clr.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                bra.w   loc_4F06

    ; End of function esc_clearTimerGoToNextCommand


; =============== S U B R O U T I N E =======================================

; clear timer and update next entity


esc_clearTimerGoToNextEntity:
                
                clr.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)

    ; End of function esc_clearTimerGoToNextEntity


; =============== S U B R O U T I N E =======================================


esc_goToNextEntity:
                
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
UpdateNextEntity:
                
                adda.w  #ENTITYDEF_SIZE,a0
                dbf     d7,loc_4EF4
                
                rts

    ; End of function esc_goToNextEntity


; =============== S U B R O U T I N E =======================================


UpdateEntityData:
                
                move.w  (a0),d0         ; X position
                move.w  ENTITYDEF_OFFSET_Y(a0),d1 ; Y position
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d2 ; X destination
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3 ; Y destination
                move.w  d2,d4           ; keep X destination
                move.w  d3,d5           ; keep Y destination
                sub.w   d0,d4           ; get X dest - X pos
                sub.w   d1,d5           ; get Y dest - Y pos
                move.w  d5,d6
                or.w    d4,d6
                beq.w   loc_5F8E        ; if there is no difference between pos and dest, end function
                movem.w d4-d5,-(sp)     ; keep dest
                clr.w   d4
                clr.w   d5
                movem.w d0-d1/d6-d7,-(sp) ; keep pos
                sub.w   d2,d0
                beq.w   loc_5DD2
                bpl.s   loc_5DA0        
                neg.w   d0              ; get positive X distance
loc_5DA0:
                
                move.w  ENTITYDEF_OFFSET_XTRAVEL(a0),d7 ; manage X pos
                move.w  d7,d6
                lsl.w   #2,d7           ; X offset * 4
                sub.w   d6,d7
                lsr.w   #2,d6
                lsr.w   #2,d7           ; ok so d7 = 3/4 * original X offset, and d6 = original X offset / 4
                clr.w   d4
                btst    #0,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.s   loc_5DC0
                cmp.w   d7,d0
                blt.s   loc_5DC0
                move.b  ENTITYDEF_OFFSET_XACCEL(a0),d4
loc_5DC0:
                
                btst    #2,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.s   loc_5DD2
                cmp.w   d6,d0
                bge.s   loc_5DD2
                move.b  ENTITYDEF_OFFSET_XACCEL(a0),d4
                neg.w   d4
loc_5DD2:
                
                sub.w   d3,d1
                beq.w   loc_5E0E
                bpl.s   loc_5DDC        
                neg.w   d1
loc_5DDC:
                
                move.w  ENTITYDEF_OFFSET_YTRAVEL(a0),d7 ; manage Y pos
                move.w  d7,d6
                lsl.w   #2,d7
                sub.w   d6,d7
                lsr.w   #2,d6
                lsr.w   #2,d7
                clr.w   d5
                btst    #1,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.s   loc_5DFC
                cmp.w   d7,d1
                blt.s   loc_5DFC
                move.b  ENTITYDEF_OFFSET_YACCEL(a0),d5
loc_5DFC:
                
                btst    #3,ENTITYDEF_OFFSET_FLAGS_A(a0)
                beq.s   loc_5E0E
                cmp.w   d6,d1
                bge.s   loc_5E0E
                move.b  ENTITYDEF_OFFSET_YACCEL(a0),d5
                neg.w   d5
loc_5E0E:
                
                movem.w (sp)+,d0-d1/d6-d7
                cmp.w   d2,d0
                beq.s   loc_5E2E
                bge.s   loc_5E24
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                add.b   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                bne.s   loc_5E22
                sub.b   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
loc_5E22:
                
                bra.s   loc_5E2E
loc_5E24:
                
                sub.b   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                bne.s   loc_5E2E
                add.b   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
loc_5E2E:
                
                cmp.w   d3,d1
                beq.s   loc_5E4A
                bge.s   loc_5E40
                add.b   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
                bne.s   loc_5E3E
                sub.b   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
loc_5E3E:
                
                bra.s   loc_5E4A
loc_5E40:
                
                sub.b   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
                bne.s   loc_5E4A
                add.b   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
loc_5E4A:
                
                move.b  ENTITYDEF_OFFSET_XVELOCITY(a0),d4
                move.b  ENTITYDEF_OFFSET_YVELOCITY(a0),d5
                ext.w   d4
                ext.w   d5
            else
                add.w   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                bne.s   loc_5E22
                sub.w   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
loc_5E22:
                
                bra.s   loc_5E2E
loc_5E24:
                
                sub.w   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
                bne.s   loc_5E2E
                add.w   d4,ENTITYDEF_OFFSET_XVELOCITY(a0)
loc_5E2E:
                
                cmp.w   d3,d1
                beq.s   loc_5E4A
                bge.s   loc_5E40
                add.w   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
                bne.s   loc_5E3E
                sub.w   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
loc_5E3E:
                
                bra.s   loc_5E4A
loc_5E40:
                
                sub.w   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
                bne.s   loc_5E4A
                add.w   d5,ENTITYDEF_OFFSET_YVELOCITY(a0)
loc_5E4A:
                
                move.w  ENTITYDEF_OFFSET_XVELOCITY(a0),d4
                move.w  ENTITYDEF_OFFSET_YVELOCITY(a0),d5
            endif
                tst.w   ENTITYDEF_OFFSET_XTRAVEL(a0)
                beq.s   loc_5E5A
                add.w   d4,(a0)
loc_5E5A:
                
                tst.w   ENTITYDEF_OFFSET_YTRAVEL(a0)
                beq.s   loc_5E64
                add.w   d5,ENTITYDEF_OFFSET_Y(a0)
loc_5E64:
                
                movem.w d2-d3,-(sp)
                clr.w   d2
                clr.w   d3
                move.w  ENTITYDEF_OFFSET_XTRAVEL(a0),d0
                beq.s   loc_5E82
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  ENTITYDEF_OFFSET_XVELOCITY(a0),d0
                ext.w   d0
            else
                move.w  ENTITYDEF_OFFSET_XVELOCITY(a0),d0
            endif
                move.w  d0,d2
                bge.s   loc_5E80
                moveq   #-1,d0
                neg.w   d2
                bra.s   loc_5E82
loc_5E80:
                
                moveq   #1,d0
loc_5E82:
                
                move.w  ENTITYDEF_OFFSET_YTRAVEL(a0),d1
                beq.s   loc_5E98
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.b  ENTITYDEF_OFFSET_YVELOCITY(a0),d1
                ext.w   d1
            else
                move.w  ENTITYDEF_OFFSET_YVELOCITY(a0),d1
            endif
                move.w  d1,d3
                bge.s   loc_5E96
                moveq   #-1,d1
                neg.w   d3
                bra.s   loc_5E98
loc_5E96:
                
                moveq   #1,d1
loc_5E98:
                
                sub.w   d2,d3
                cmpi.w  #$FFF8,d3
                bge.s   loc_5EA2
                clr.w   d1
loc_5EA2:
                
                cmpi.w  #8,d3
                ble.s   loc_5EAA
                clr.w   d0
loc_5EAA:
                
                addq.w  #1,d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                addq.w  #1,d1
                add.w   d1,d0
                movem.w (sp)+,d2-d3
                move.l  a1,-(sp)
                lea     table_5F9C(pc), a1
                nop
                move.b  (a1,d0.w),d6
                bpl.s   loc_5EC8
                move.b  ENTITYDEF_OFFSET_FACING(a0),d6
loc_5EC8:
                
                movea.l (sp)+,a1
                move.w  d4,d0
                bpl.s   loc_5ED0
                neg.w   d0
loc_5ED0:
                
                move.w  d5,d1
                bpl.s   loc_5ED6
                neg.w   d1
loc_5ED6:
                
                cmpi.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
                beq.s   loc_5EE6
                add.w   d1,d0
                lsr.w   #5,d0
                add.b   d0,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_5EE6:
                
                bsr.w   UpdateEntitySprite
                movem.w (sp)+,d4-d5
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                sub.w   d0,d2
                bne.s   loc_5F00
                move.w  ENTITYDEF_OFFSET_XDEST(a0),(a0)
                clr.w   ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_5F00:
                
                eor.w   d2,d4
                bpl.s   loc_5F0C
                move.w  ENTITYDEF_OFFSET_XDEST(a0),(a0)
                clr.w   ENTITYDEF_OFFSET_XTRAVEL(a0)
loc_5F0C:
                
                sub.w   d1,d3
                bne.s   loc_5F1A
                move.w  ENTITYDEF_OFFSET_YDEST(a0),ENTITYDEF_OFFSET_Y(a0)
                clr.w   ENTITYDEF_OFFSET_YTRAVEL(a0)
loc_5F1A:
                
                eor.w   d3,d5
                bpl.s   loc_5F28
                move.w  ENTITYDEF_OFFSET_YDEST(a0),ENTITYDEF_OFFSET_Y(a0)
                clr.w   ENTITYDEF_OFFSET_YTRAVEL(a0)
loc_5F28:
                
                tst.l   ENTITYDEF_OFFSET_XTRAVEL(a0)
                bne.w   loc_5F8E
                movem.w d0-d3,-(sp)
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                bsr.w   ConvertMapPixelCoordinatesToOffset
                move.w  (a4,d2.w),d0
                andi.w  #$3C00,d0
                cmpi.w  #$2000,d0
                bne.s   loc_5F54
                move.b  #2,ENTITYDEF_OFFSET_LAYER(a0)
loc_5F54:
                
                cmpi.w  #$2400,d0
                bne.s   loc_5F5E
                clr.b   ENTITYDEF_OFFSET_LAYER(a0)
loc_5F5E:
                
                move.b  ENTITYDEF_OFFSET_FLAGS_B(a0),d1
                cmpi.w  #$3400,d0
                bne.s   loc_5F70
                bset    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
                bra.s   loc_5F76
loc_5F70:
                
                bclr    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5F76:
                
                move.b  ENTITYDEF_OFFSET_FLAGS_B(a0),d2
                eor.b   d2,d1
                btst    #5,d1
                beq.s   loc_5F8A
                move.b  ENTITYDEF_OFFSET_FACING(a0),d6
                bsr.w   ChangeEntityMapsprite
loc_5F8A:
                
                movem.w (sp)+,d0-d3
loc_5F8E:
                
                cmpi.b  #$1E,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
                ble.s   return_5F9A
                clr.b   ENTITYDEF_OFFSET_ANIMCOUNTER(a0) ; reset animation counter if it reached max value
return_5F9A:
                
                rts

    ; End of function UpdateEntityData

table_5F9C:     dc.b 5
                dc.b 2
                dc.b 6
                dc.b -1
                dc.b 1
                dc.b -1
                dc.b 3
                dc.b -1
                dc.b 4
                dc.b 0
                dc.b 7
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1

; =============== S U B R O U T I N E =======================================


sub_5FAC:
                
                tst.b   d4
                bne.w   @FacingUp_Frame1
                
                ; Facing right frame 1
                add.w   d2,d0
                add.w   d3,d1
                bra.w   @Return
@FacingUp_Frame1:
                
                subq.b  #1,d4
                bne.w   @FacingLeft_Frame1
                add.w   d3,d0
                sub.w   d2,d1
                bra.w   @Return
@FacingLeft_Frame1:
                
                subq.b  #1,d4
                bne.w   @FacingDown_Frame1
                sub.w   d2,d0
                sub.w   d3,d1
                bra.w   @Return
@FacingDown_Frame1:
                
                subq.b  #1,d4
                bne.w   @FacingRight_Frame2
                sub.w   d3,d0
                add.w   d2,d1
                bra.w   @Return
@FacingRight_Frame2:
                
                subq.b  #1,d4
                bne.w   @FacingUp_Frame2
                add.w   d3,d0
                sub.w   d3,d1
                add.w   d2,d0
                sub.w   d2,d1
                bra.w   @Return
@FacingUp_Frame2:
                
                subq.b  #1,d4
                bne.w   @FacingLeft_Frame2
                sub.w   d2,d0
                sub.w   d2,d1
                sub.w   d3,d0
                sub.w   d3,d1
                bra.w   @Return
@FacingLeft_Frame2:
                
                subq.b  #1,d4
                bne.w   @FacingDown_Frame2
                sub.w   d3,d0
                add.w   d3,d1
                sub.w   d2,d0
                add.w   d2,d1
                bra.w   @Return
@FacingDown_Frame2:
                
                sub.w   d3,d0
                sub.w   d3,d1
                add.w   d2,d1
                add.w   d2,d0
@Return:
                
                rts

    ; End of function sub_5FAC


; =============== S U B R O U T I N E =======================================


LoadEntityMapsprites:
                
                bsr.w   DisableDisplayAndInterrupts
                lea     ((ENTITY_DATA-$1000000)).w,a0
                moveq   #ENTITIES_COUNTER_MINUS_ONE,d7
@Loop:
                
                cmpi.w  #$7000,(a0)
                beq.s   @Next
                move.w  d7,-(sp)
                bsr.w   DmaEntityMapsprite
                move.w  (sp)+,d7
@Next:
                
                adda.w  #ENTITYDEF_SIZE,a0
                dbf     d7,@Loop
                
                bsr.w   EnableDisplayAndInterrupts
                rts

    ; End of function LoadEntityMapsprites

table_FacingValues_1:
                dc.b RIGHT
                dc.b UP
                dc.b LEFT
                dc.b DOWN
                dc.b RIGHT
                dc.b LEFT
                dc.b LEFT
                dc.b RIGHT

; =============== S U B R O U T I N E =======================================

; In: d0.b = entity index
;     d1.w = new facing direction
;     d2.b = new B flags (keep current if = -1)
;     d3.b = new map sprite index (keep current if = -1)


UpdateEntityProperties:
                
                movem.l d0-a2,-(sp)
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                cmpi.b  #-1,d2
                beq.s   @CheckMapsprite
                andi.w  #$7F,d2 
                andi.b  #$80,ENTITYDEF_OFFSET_FLAGS_B(a0)
                or.b    d2,ENTITYDEF_OFFSET_FLAGS_B(a0)
@CheckMapsprite:
                
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                cmpi.w  #-1,d3
                beq.s   @ChangeDirection
                move.w  d3,ENTITYDEF_OFFSET_MAPSPRITE(a0)
            else
                cmpi.b  #-1,d3
                beq.s   @ChangeDirection
                move.b  d3,ENTITYDEF_OFFSET_MAPSPRITE(a0)
            endif
@ChangeDirection:
                
                move.w  d1,d6
                andi.w  #3,d6
                bsr.w   ChangeEntityMapsprite
                movem.l (sp)+,d0-a2
                rts

    ; End of function UpdateEntityProperties


; =============== S U B R O U T I N E =======================================


UpdateEntitySprite:
                
                module
                btst    #6,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.w   return_6180
                cmp.b   ENTITYDEF_OFFSET_FACING(a0),d6
                beq.w   return_6180
                cmpi.b  #7,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                bge.w   return_6180

    ; End of function UpdateEntitySprite


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to entity data
;     d6.b = facing direction


ChangeEntityMapsprite:
                
                move.b  d6,ENTITYDEF_OFFSET_FACING(a0)
                ext.w   d6
                move.b  table_FacingValues_1(pc,d6.w),d6
                bne.s   loc_60B6
                addq.w  #2,d6
loc_60B6:
                
                movem.l a0-a1,-(sp)
            if (STANDARD_BUILD=1)
              if (EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              endif
                jsr     IsSpecialSprite ; Out: CCR carry-bit clear if true
            else
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
                cmpi.b  #MAPSPRITES_SPECIALS_START,d1
            endif
                bcc.w   @Done           ; skip changing facing direction if special sprite
                
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_ENTNUM(a0),d1
                cmpi.b  #32,d1 
                beq.w   @Done
                
                move.w  d1,-(sp)        ; push entnum
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_FLAGS_B(a0),d1
                move.w  d1,-(sp)        ; push flags B
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
            else
              if (STANDARD_BUILD=1)
                clr.w   d1
              endif
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
            endif
                move.w  d1,d0
                add.w   d1,d1
                add.w   d0,d1
                add.w   d6,d1
                subq.w  #1,d1
                lsl.w   #INDEX_SHIFT_COUNT,d1
                lea     (pt_Mapsprites).l,a0
                movea.l (a0,d1.w),a0
                lea     (FF8002_LOADING_SPACE).l,a1
                clr.w   d0
                move.b  ((SPRITES_TO_LOAD_NUMBER-$1000000)).w,d0
                addq.b  #1,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                mulu.w  #$240,d0        ; two sprites to load for the walking animation
                lea     (a1,d0.w),a1
                jsr     (LoadBasicCompressedData).w
                movea.l a1,a0
                move.w  (sp)+,d1        ; pull flags B
                btst    #5,d1
                beq.s   loc_6124
                jsr     j_ApplySpriteImmersedEffect
loc_6124:
                
                btst    #3,d1
                beq.s   loc_6134
                move.w  ((SPRITE_SIZE-$1000000)).w,d0
                jsr     j_ResizeSprite
loc_6134:
                
                btst    #2,d1
                beq.s   loc_6140
                jsr     j_ApplySpriteGhostEffect
loc_6140:
                
                andi.w  #3,d1
                cmpi.w  #1,d1
                bne.s   loc_6152
                jsr     j_OrientSpriteLeft
                bra.s   loc_615E
loc_6152:
                
                cmpi.w  #3,d1
                bne.s   loc_615E
                jsr     j_OrientSpriteRight
loc_615E:
                
                move.w  (sp)+,d1        ; pull entnum
                move.w  d1,d0
                lsl.w   #3,d1
                add.w   d0,d1
                lsl.w   #6,d1
                lea     ($7000).w,a1
                adda.w  d1,a1
                move.w  #$120,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
@Done:
                
                movem.l (sp)+,a0-a1
return_6180:
                
                rts

    ; End of function ChangeEntityMapsprite

                modend
                
table_FacingValues_2:
                dc.b RIGHT              ; 8 bytes holding facing values for sprites
                dc.b UP
                dc.b LEFT
                dc.b DOWN
                dc.b RIGHT
                dc.b LEFT
                dc.b LEFT
                dc.b RIGHT

; =============== S U B R O U T I N E =======================================


DmaEntityMapsprite:
                
                clr.w   d6
                move.b  ENTITYDEF_OFFSET_FACING(a0),d6
                move.b  table_FacingValues_2(pc,d6.w),d6
                bne.s   @Continue
                addq.w  #2,d6
@Continue:
                
                movem.l a0-a1,-(sp)
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_ENTNUM(a0),d1
                move.w  d1,-(sp)
            if (STANDARD_BUILD=1)
              if (EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              endif
                jsr     IsSpecialSprite ; Out: CCR carry-bit clear if true
                bcs.s   @LoadRegularSprite
            else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
                cmpi.w  #MAPSPRITES_SPECIALS_START,d1 ; HARDCODED special mapsprites start index
                blt.s   @LoadRegularSprite
            endif
                jsr     j_LoadSpecialSprite
                move.w  (sp)+,d1
                bra.s   @Done
@LoadRegularSprite:
                
                move.w  d1,d0
                add.w   d1,d1
                add.w   d0,d1
                add.w   d6,d1
                subq.w  #1,d1
                lsl.w   #INDEX_SHIFT_COUNT,d1
                lea     (pt_Mapsprites).l,a0
                movea.l (a0,d1.w),a0
                lea     (FF8002_LOADING_SPACE).l,a1
                jsr     (LoadBasicCompressedData).w
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
                bsr.w   ApplyImmediateVramDma
@Done:
                
                movem.l (sp)+,a0-a1
                rts

    ; End of function DmaEntityMapsprite


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w = X, Y pixel coordinates
; Out: d2.w = offset from start of map VDP tile layout


ConvertMapPixelCoordinatesToOffset:
                
                movem.w d0-d1,-(sp)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   @InBattle       
                tst.b   ENTITYDEF_OFFSET_LAYER(a0)
                beq.s   @InBattle       
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                
                move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d2
                move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d3
                bra.s   @Continue
@MapOnForeground:
                
                move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d2
                move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d3
@Continue:
                
                lsl.w   #7,d2
                lsl.w   #7,d3
                add.w   d2,d0
                add.w   d3,d1
@InBattle:
                
                lea     table_MapOffsetHash(pc), a3 ; jump here if in battle
                lea     (FF0000_RAM_START).l,a4
                move.w  d0,d2
                move.w  d1,d3
                lsr.w   #7,d2
                lsr.w   #7,d3
                add.w   d2,d2
                move.b  (a3,d2.w),d2
                andi.w  #$3F,d2 
                add.w   d3,d3
                move.b  (a3,d3.w),d3
                andi.w  #$3F,d3 
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                movem.w (sp)+,d0-d1
                rts

    ; End of function ConvertMapPixelCoordinatesToOffset

