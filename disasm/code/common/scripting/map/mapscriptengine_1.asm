
; ASM FILE code\common\scripting\map\mapscriptengine_1.asm :
; 0x46506..0x47102 : Mapscript engine, part 1

; =============== S U B R O U T I N E =======================================


csc32_setCameraDestInTiles:
                
                move.b  #-1,((VIEW_TARGET_ENTITY-$1000000)).w
                nop
                move.w  (a6)+,d2
                move.w  (a6)+,d3
                jsr     j_SetCameraDestination
                jsr     (WaitForViewScrollEnd).w
                rts

    ; End of function csc32_setCameraDestInTiles


; =============== S U B R O U T I N E =======================================


csc33_setQuakeAmount:
                
                move.w  (a6)+,d0
                move.w  d0,d3
                andi.w  #$3FFF,d0
                move.w  d0,d7
                subq.w  #1,d7
                btst    #$F,d3
                beq.s   loc_46538
                moveq   #0,d1
                move.w  #1,d2
                bra.s   loc_46550
loc_46538:
                
                btst    #$E,d3
                beq.s   loc_46546
                move.w  d0,d1
                move.w  #-1,d2
                bra.s   loc_46550
loc_46546:
                
                move.w  d0,(QUAKE_AMPLITUDE).l
                bra.w   return_46564
loc_46550:
                
                move.w  #$28,d0 
loc_46554:
                
                add.w   d2,d1
                move.w  d1,(QUAKE_AMPLITUDE).l
                jsr     (Sleep).w       
                dbf     d7,loc_46554
return_46564:
                
                rts

    ; End of function csc33_setQuakeAmount


; =============== S U B R O U T I N E =======================================


csc34_setBlocks:
                
                move.w  (a6)+,d0
                move.w  (a6)+,d1
                move.w  (a6)+,d2
                jsr     (CopyMapBlocks).w
                bset    #0,(VIEW_PLANE_UPDATE_TOGGLE_BITFIELD).l
                bset    #1,(VIEW_PLANE_UPDATE_TOGGLE_BITFIELD).l
                rts

    ; End of function csc34_setBlocks


; =============== S U B R O U T I N E =======================================

; similar to setBlocks


csc35_setBlocksVar:
                
                move.w  (a6)+,d0
                move.w  (a6)+,d1
                move.w  (a6)+,d2
                jsr     (CopyMapBlocks).w
                rts

    ; End of function csc35_setBlocksVar


; =============== S U B R O U T I N E =======================================

; related to loading a map


csc36_resetMap:
                
                move.l  a6,-(sp)
            if (STANDARD_BUILD=1)
                jsr     (ReloadCurrentMap).w
            else
                jsr     (ResetCurrentMap).l
            endif
                movea.l (sp)+,a6
                rts

    ; End of function csc36_resetMap


; =============== S U B R O U T I N E =======================================


csc37_loadMapAndFadeIn:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   (FADING_TIMER_WORD).l
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w

    ; End of function csc37_loadMapAndFadeIn


; =============== S U B R O U T I N E =======================================


csc48_loadMap:
                
                move.b  #-1,((VIEW_TARGET_ENTITY-$1000000)).w
                nop
                move.w  (a6),d1
                jsr     (LoadMapTilesets).w
loc_465C4:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_465C4
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                clr.l   d0
                move.w  (a6)+,d1
                move.w  (a6)+,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.w  (a6)+,d2
                andi.w  #BYTE_MASK,d2
                or.w    d2,d0
                mulu.w  #3,d0
                move.l  a6,-(sp)
                jsr     (LoadMap).w     
                movea.l (sp)+,a6
                jsr     (EnableDisplayAndInterrupts).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                jsr     (WaitForVInt).w
                rts

    ; End of function csc48_loadMap


; =============== S U B R O U T I N E =======================================


csc39_fadeInFromBlack:
                
                jsr     (FadeInFromBlack).w
                rts

    ; End of function csc39_fadeInFromBlack


; =============== S U B R O U T I N E =======================================


csc3A_fadeOutToBlack:
                
                jsr     (FadeOutToBlack).w
                rts

    ; End of function csc3A_fadeOutToBlack


; =============== S U B R O U T I N E =======================================


csc3B_slowFadeInFromBlack:
                
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,d0
                move.b  #6,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (FadeInFromBlack).w
                move.b  d0,((FADING_COUNTER_MAX-$1000000)).w
                rts

    ; End of function csc3B_slowFadeInFromBlack


; =============== S U B R O U T I N E =======================================


csc3C_slowFadeOutToBlack:
                
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,d0
                move.b  #6,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (FadeOutToBlack).w
                move.b  d0,((FADING_COUNTER_MAX-$1000000)).w
                rts

    ; End of function csc3C_slowFadeOutToBlack


; =============== S U B R O U T I N E =======================================


csc3D_tintMap:
                
                moveq   #1,d0
                moveq   #6,d1
                moveq   #HALF_OUT_TO_BLACK,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc3D_tintMap


; =============== S U B R O U T I N E =======================================


csc3E_FlickerOnce:
                
                moveq   #1,d0
                moveq   #6,d1
                moveq   #FLICKER_ONCE,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc3E_FlickerOnce


; =============== S U B R O U T I N E =======================================


csc3F_fadeMapOutToWhite:
                
                moveq   #1,d0
                moveq   #1,d1
                moveq   #OUT_TO_WHITE,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc3F_fadeMapOutToWhite


; =============== S U B R O U T I N E =======================================


csc40_fadeMapInFromWhite:
                
                moveq   #1,d0
                moveq   #1,d1
                moveq   #IN_FROM_WHITE,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc40_fadeMapInFromWhite


; =============== S U B R O U T I N E =======================================


csc41_flashScreenWhite:
                
                move.w  (a6)+,d7
                lsr.w   #3,d7
                moveq   #$F,d0
                moveq   #1,d1
                moveq   #FLASH_QUICKLY_2,d2
loc_4667A:
                
                jsr     LaunchFading(pc)
                nop
                dbf     d7,loc_4667A
                jsr     (DuplicatePalettes).w
                rts

    ; End of function csc41_flashScreenWhite


; =============== S U B R O U T I N E =======================================


csc42_loadMapEntities:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                jsr     (DisableDisplayAndInterrupts).w
                movea.l (a6)+,a0
                move.w  (a0)+,d1
                move.w  (a0)+,d2
                move.w  (a0)+,d3
                jsr     InitializeMapEntities
                jsr     (LoadEntityMapsprites).w
                jsr     (EnableDisplayAndInterrupts).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                rts

    ; End of function csc42_loadMapEntities


; =============== S U B R O U T I N E =======================================


csc43_RoofEvent:
                
                move.w  (a6)+,d0
                move.w  (a6)+,d1
                mulu.w  #MAP_TILE_SIZE,d0
                mulu.w  #MAP_TILE_SIZE,d1
                jsr     (PerformMapBlockCopyScript).w
                rts

    ; End of function csc43_RoofEvent


; =============== S U B R O U T I N E =======================================


csc44_reloadEntities:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                moveq   #0,d0
                bsr.w   GetEntityAddressFromCharacter
                moveq   #0,d1
                move.w  (a5),d1
                divu.w  #MAP_TILE_SIZE,d1
                moveq   #0,d2
                move.w  ENTITYDEF_OFFSET_Y(a5),d2
                divu.w  #MAP_TILE_SIZE,d2
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a5),d3
                movea.l (a6)+,a0
                jsr     InitializeMapEntities
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                rts

    ; End of function csc44_reloadEntities


; =============== S U B R O U T I N E =======================================


csc45_cameraSpeed:
                
                move.w  (a6)+,((VIEW_SCROLLING_SPEED-$1000000)).w
                nop
                rts

    ; End of function csc45_cameraSpeed


; =============== S U B R O U T I N E =======================================


csc46_reloadMap:
                
                move.b  #-1,((VIEW_TARGET_ENTITY-$1000000)).w
                nop
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                clr.l   d0
                moveq   #-1,d1
                move.w  (a6)+,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.w  (a6)+,d2
                andi.w  #BYTE_MASK,d2
                or.w    d2,d0
                mulu.w  #3,d0
                move.l  a6,-(sp)
                jsr     (LoadMap).w     
                movea.l (sp)+,a6
                jsr     (EnableDisplayAndInterrupts).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                jsr     (WaitForVInt).w
                rts

    ; End of function csc46_reloadMap


; =============== S U B R O U T I N E =======================================


csc47_StepEvent:
                
                move.w  (a6)+,d0
                move.w  (a6)+,d1
                mulu.w  #MAP_TILE_SIZE,d0
                mulu.w  #MAP_TILE_SIZE,d1
                jsr     (OpenDoor).w    
                rts

    ; End of function csc47_StepEvent


; =============== S U B R O U T I N E =======================================


csc49_loadEntitiesFromMapSetup:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                jsr     (DisableDisplayAndInterrupts).w
                jsr     GetMapSetupEntityList
                move.w  (a6)+,d1
                move.w  (a6)+,d2
                move.w  (a6)+,d3
                jsr     j_InitializeMapEntities
                jsr     (LoadEntityMapsprites).w
                jsr     (EnableDisplayAndInterrupts).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                rts

    ; End of function csc49_loadEntitiesFromMapSetup


; =============== S U B R O U T I N E =======================================


csc4A_fadeInFromBlackHalf:
                
                moveq   #%1111,d0
                moveq   #6,d1
                moveq   #HALF_IN_FROM_BLACK,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc4A_fadeInFromBlackHalf


; =============== S U B R O U T I N E =======================================


csc4B_fadeOutToBlackHalf:
                
                moveq   #%1111,d0
                moveq   #6,d1
                moveq   #OUT_TO_BLACK_2,d2
                jsr     LaunchFading(pc)
                nop
                rts

    ; End of function csc4B_fadeOutToBlackHalf


; =============== S U B R O U T I N E =======================================


LaunchFading:
                
                move.b  d3,-(sp)
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,d3
                clr.w   (FADING_TIMER_WORD).l
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  d0,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.b  d1,((FADING_COUNTER_MAX-$1000000)).w
                move.b  d2,((FADING_SETTING-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
loc_467C6:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_467C6
                jsr     (WaitForVInt).w
                move.b  d3,((FADING_COUNTER_MAX-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.b  (sp)+,d3
                rts

    ; End of function LaunchFading


; =============== S U B R O U T I N E =======================================


csc2D_entityActionSequence:
                
                move.b  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  d0,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a5)
                andi.b  #$9F,ENTITYDEF_OFFSET_FLAGS_A(a5)
                move.b  (a6)+,d4
                move.l  (dword_FFB1A4).l,d0
                movea.l d0,a0
loc_467FC:
                
                move.b  (a6)+,d1
                bmi.w   loc_46928
                move.b  (a6)+,d2
                ext.w   d2
                move.w  d2,d3
                neg.w   d3
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                add.w   d1,d1
                move.w  rjt_EntityMoveCommands(pc,d1.w),d1
                jsr     rjt_EntityMoveCommands(pc,d1.w)
                bra.s   loc_467FC

    ; End of function csc2D_entityActionSequence

rjt_EntityMoveCommands:
                dc.w csc2D_0_moveRight-rjt_EntityMoveCommands
                dc.w csc2D_1_moveUp-rjt_EntityMoveCommands
                dc.w csc2D_2_moveLeft-rjt_EntityMoveCommands
                dc.w csc2D_3_moveDown-rjt_EntityMoveCommands
                dc.w csc2D_4_moveUpRight-rjt_EntityMoveCommands
                dc.w csc2D_5_moveUpLeft-rjt_EntityMoveCommands
                dc.w csc2D_6_moveDownLeft-rjt_EntityMoveCommands
                dc.w csc2D_7_moveDownRight-rjt_EntityMoveCommands
                dc.w csc2D_8_faceRight-rjt_EntityMoveCommands
                dc.w csc2D_9_faceUp-rjt_EntityMoveCommands
                dc.w csc2D_A_faceLeft-rjt_EntityMoveCommands
                dc.w csc2D_B_faceDown-rjt_EntityMoveCommands
                dc.w loc_468F2-rjt_EntityMoveCommands ; related to face down
                dc.w csc2D_D_jump-rjt_EntityMoveCommands
                dc.w csc2D_E_jumpRight-rjt_EntityMoveCommands
                dc.w csc2D_F_jumpLeft-rjt_EntityMoveCommands

; =============== S U B R O U T I N E =======================================


csc2D_0_moveRight:
                
                move.w  #4,(a0)+
                move.w  d2,(a0)+
                clr.w   (a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_0_moveRight


; =============== S U B R O U T I N E =======================================


csc2D_1_moveUp:
                
                move.w  #4,(a0)+
                clr.w   (a0)+
                move.w  d3,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_1_moveUp


; =============== S U B R O U T I N E =======================================


csc2D_2_moveLeft:
                
                move.w  #4,(a0)+
                move.w  d3,(a0)+
                clr.w   (a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_2_moveLeft


; =============== S U B R O U T I N E =======================================


csc2D_3_moveDown:
                
                move.w  #4,(a0)+
                clr.w   (a0)+
                move.w  d2,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_3_moveDown


; =============== S U B R O U T I N E =======================================


csc2D_4_moveUpRight:
                
                move.w  #4,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_4_moveUpRight


; =============== S U B R O U T I N E =======================================


csc2D_5_moveUpLeft:
                
                move.w  #4,(a0)+
                move.w  d3,(a0)+
                move.w  d3,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_5_moveUpLeft


; =============== S U B R O U T I N E =======================================


csc2D_6_moveDownLeft:
                
                move.w  #4,(a0)+
                move.w  d3,(a0)+
                move.w  d2,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_6_moveDownLeft


; =============== S U B R O U T I N E =======================================


csc2D_7_moveDownRight:
                
                move.w  #4,(a0)+
                move.w  d2,(a0)+
                move.w  d2,(a0)+
                move.w  #1,(a0)+
                rts

    ; End of function csc2D_7_moveDownRight


; =============== S U B R O U T I N E =======================================


csc2D_8_faceRight:
                
                move.w  #$22,(a0)+ 
                move.w  #0,(a0)+
                move.w  #$A,(a0)+
                move.w  #0,(a0)+
                move.w  d2,(a0)+
                rts

    ; End of function csc2D_8_faceRight


; =============== S U B R O U T I N E =======================================


csc2D_9_faceUp:
                
                move.w  #$22,(a0)+ 
                move.w  #1,(a0)+
                move.w  #$A,(a0)+
                move.w  #0,(a0)+
                move.w  d2,(a0)+
                rts

    ; End of function csc2D_9_faceUp


; =============== S U B R O U T I N E =======================================


csc2D_A_faceLeft:
                
                move.w  #$22,(a0)+ 
                move.w  #2,(a0)+
                move.w  #$A,(a0)+
                move.w  #0,(a0)+
                move.w  d2,(a0)+
                rts

    ; End of function csc2D_A_faceLeft


; =============== S U B R O U T I N E =======================================


csc2D_B_faceDown:
                
                move.w  #$22,(a0)+ 
                move.w  #3,(a0)+
                move.w  #$A,(a0)+
loc_468F2:
                
                move.w  #0,(a0)+
                move.w  d2,(a0)+
                rts

    ; End of function csc2D_B_faceDown


; =============== S U B R O U T I N E =======================================


csc2D_D_jump:
                
                lea     (eas_Jump).l,a1
                bra.w   loc_46914
csc2D_E_jumpRight:
                
                lea     (eas_JumpRight).l,a1
                bra.w   loc_46914
csc2D_F_jumpLeft:
                
                lea     (eas_JumpLeft).l,a1
loc_46914:
                
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)+
                rts

    ; End of function csc2D_D_jump


; START OF FUNCTION CHUNK FOR csc2D_entityActionSequence

loc_46928:
                
                move.w  #$34,(a0)+ 
                move.l  #eas_Idle,(a0)+
                addq.l  #1,a6
                move.l  a0,(dword_FFB1A4).l
                move.l  d0,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                tst.b   d4
                beq.w   return_4694E
loc_46944:
                
                cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                bne.s   loc_46944
return_4694E:
                
                rts

; END OF FUNCTION CHUNK FOR csc2D_entityActionSequence


; =============== S U B R O U T I N E =======================================


csc14_setEntityActscriptManual:
                
                move.b  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  d0,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a5) ; timer for next actscript read
                move.b  (a6)+,d0
                move.l  a6,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5) ; address of new actscript
                tst.b   d0
                beq.w   loc_46970
loc_46966:
                
                cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                bne.s   loc_46966
loc_46970:
                
                cmpi.w  #$8080,(a6)+
                bne.s   loc_46970
                rts

    ; End of function csc14_setEntityActscriptManual


; =============== S U B R O U T I N E =======================================

; x y zzzz : actscript read timer, wait for entity idle or not, actscript


csc15_setEntityActscript:
                
                move.b  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  d0,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a5)
                move.b  (a6)+,d0
                move.l  (a6)+,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                tst.b   d0
                beq.w   return_46998
loc_4698E:
                
                cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                bne.s   loc_4698E
return_46998:
                
                rts

    ; End of function csc15_setEntityActscript


; =============== S U B R O U T I N E =======================================

; xxxx


csc16_waitUntilEntityIdle:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
loc_469A0:
                
                cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
                bne.s   loc_469A0
                rts

    ; End of function csc16_waitUntilEntityIdle


; =============== S U B R O U T I N E =======================================

; make entity flash progressively faster, and set new pos-dest-facing


csc17_setEntityPosAndFacingWithFlash:
                
                move.b  (a6),d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  (a5),d1
                move.w  #MAP_TILE_MINUS,d2
                moveq   #30,d7
loc_469BA:
                
                move.w  d2,(a5)
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                move.w  d1,(a5)
                move.w  d7,d0
                subi.w  #15,d0
                bhi.s   loc_469D0
                moveq   #1,d0
loc_469D0:
                
                add.w   d0,d0
                jsr     (Sleep).w       
                dbf     d7,loc_469BA
                
                bra.w   csc19_setEntityPosAndFacing

    ; End of function csc17_setEntityPosAndFacingWithFlash


; =============== S U B R O U T I N E =======================================


csc18_flashEntityWhite:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  (a6)+,d7
                lsr.w   #2,d7
loc_469E8:
                
                ori.b   #4,ENTITYDEF_OFFSET_FLAGS_B(a5) ; set bit 2
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                andi.b  #$FB,ENTITYDEF_OFFSET_FLAGS_B(a5) ; clear bit 2
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                dbf     d7,loc_469E8    
                rts

    ; End of function csc18_flashEntityWhite


; =============== S U B R O U T I N E =======================================

; use xxxxxxxx if alive or yyyyyyyy if dead


csc19_setEntityPosAndFacing:
                
                move.b  (a6),d0
                moveq   #4,d7
                bsr.w   AdjustScriptPointerByCharacterAliveStatus
                move.b  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                moveq   #0,d0           ; set new pos-dest, and facing
                move.b  (a6)+,d0
                mulu.w  #MAP_TILE_SIZE,d0
                move.w  d0,(a5)
                move.w  d0,ENTITYDEF_OFFSET_XDEST(a5)
                moveq   #0,d0
                move.b  (a6)+,d0
                mulu.w  #MAP_TILE_SIZE,d0
                move.w  d0,ENTITYDEF_OFFSET_Y(a5)
                move.w  d0,ENTITYDEF_OFFSET_YDEST(a5)
                move.b  (a6)+,ENTITYDEF_OFFSET_FACING(a5)
                bsr.w   UpdateEntitySprite_0
                rts

    ; End of function csc19_setEntityPosAndFacing


; =============== S U B R O U T I N E =======================================


csc1A_setEntitySprite:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  (a6)+,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bcc.s   @NotAlly
                jsr     GetAllyMapsprite
                move.w  d4,d0
@NotAlly:
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.w  d0,ENTITYDEF_OFFSET_MAPSPRITE(a5)
            else
                move.b  d0,ENTITYDEF_OFFSET_MAPSPRITE(a5)
            endif
                jsr     (WaitForVInt).w
                bsr.w   UpdateEntitySprite_0
                rts

    ; End of function csc1A_setEntitySprite


; =============== S U B R O U T I N E =======================================


csc1B_startEntityAnim:
                
                move.w  (a6),d0
                moveq   #2,d7
                bsr.w   AdjustScriptPointerByCharacterAliveStatus
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  #0,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                rts

    ; End of function csc1B_startEntityAnim


; =============== S U B R O U T I N E =======================================


csc1C_stopEntityAnim:
                
                move.w  (a6),d0
                moveq   #2,d7
                bsr.w   AdjustScriptPointerByCharacterAliveStatus
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                rts

    ; End of function csc1C_stopEntityAnim


; =============== S U B R O U T I N E =======================================


csc1D_showPortrait:
                
                move.w  (a6)+,d0
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                bne.w   @Return
                moveq   #0,d3
                btst    #$F,d0
                beq.s   @loc_1
                moveq   #-1,d3
@loc_1:
                
                moveq   #0,d4
                btst    #$E,d0
                beq.s   @loc_2
                moveq   #-1,d4
@loc_2:
                
                jsr     (WaitForViewScrollEnd).w
                bsr.w   GetEntityPortaitAndSpeechSfx
                cmpi.w  #-1,d1
                beq.s   @Return
                
                move.w  d1,d0
                move.w  d3,d1
                move.w  d4,d2
                jsr     j_OpenPortraitWindow
@Return:
                
                rts

    ; End of function csc1D_showPortrait


; =============== S U B R O U T I N E =======================================


csc1E_hidePortrait:
                
                jsr     (WaitForViewScrollEnd).w
                jsr     j_ClosePortraitWindow
                rts

    ; End of function csc1E_hidePortrait


; =============== S U B R O U T I N E =======================================


csc1F_addDefeatedAlly:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
                adda.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,a1
                move.w  (a6)+,d0
                move.b  d0,(a1)
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts

    ; End of function csc1F_addDefeatedAlly


; =============== S U B R O U T I N E =======================================

; if X Pos == -1, then dead


csc20_updateDefeatedAllies:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d2
                adda.w  d2,a1
                moveq   #$FFFFFF80,d0
                moveq   #$1F,d7
loc_46AFE:
                
                jsr     j_GetCombatantX
                cmpi.w  #-1,d1
                beq.s   loc_46B0E
                
                move.b  d0,(a1)+
                addq.w  #1,d2
loc_46B0E:
                
                addq.b  #1,d0
                dbf     d7,loc_46AFE
                move.w  d2,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts

    ; End of function csc20_updateDefeatedAllies


; =============== S U B R O U T I N E =======================================


csc21_reviveAlly:
                
                move.w  (a6)+,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a2
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   return_46B40
loc_46B2E:
                
                cmp.b   (a1),d0
                bne.s   loc_46B3A
                addq.l  #1,a1
                subq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                bra.s   loc_46B3C
loc_46B3A:
                
                move.b  (a1)+,(a2)+
loc_46B3C:
                
                dbf     d7,loc_46B2E
return_46B40:
                
                rts

    ; End of function csc21_reviveAlly


; =============== S U B R O U T I N E =======================================

; 0/1 = scan down/up, 2/3 = wipe out/in, 4/5 = slide out/in, 6/7 = mosaic out/in


csc22_animateEntityFadeInOrOut:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                lea     (FF6802_LOADING_SPACE).l,a0
                move.w  (a6)+,d0
                moveq   #0,d1           ; mosaic out
                cmpi.w  #6,d0
                beq.w   loc_46BE2
                
                moveq   #-1,d1          ; mosaic in
                cmpi.w  #7,d0
                beq.w   loc_46BE2
                
                move.w  d0,d2
                lsl.w   #3,d0
                lea     table_EntityFadingDefinitions(pc,d0.w),a1
                move.w  (a1),d0
                move.w  2(a1),d1
                moveq   #22,d7
@Transistion_Loop:
                
                bsr.w   LoadMapsprite
                jsr     ApplySpriteCropEffect
                bsr.w   DmaMapsprite    
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                add.w   4(a1),d0
                add.w   6(a1),d1
                dbf     d7,@Transistion_Loop
                
                cmpi.w  #4,d2
                bne.s   @Return
                
                bsr.w   LoadMapsprite
                move.l  #$FFFF,d0
                jsr     sub_45E10
                bsr.w   DmaMapsprite    
@Return:
                
                rts

    ; End of function csc22_animateEntityFadeInOrOut

table_EntityFadingDefinitions:
                ; scan down
                dc.w 1
                dc.w 0
                dc.w 0
                dc.w 1
                
                ; scan up
                dc.w 1
                dc.w 21
                dc.w 0
                dc.w -1
                
                ; wipe out
                dc.w 1
                dc.w 0
                dc.w 1
                dc.w 0
                
                ; wipe in
                dc.w 22
                dc.w 0
                dc.w -1
                dc.w 0
                
                ; slide out
                dc.w 1
                dc.w 22
                dc.w 1
                dc.w -1
                
                ; slide in
                dc.w 22
                dc.w 1
                dc.w -1
                dc.w 1

; START OF FUNCTION CHUNK FOR csc22_animateEntityFadeInOrOut

loc_46BE2:
                
                tst.w   d1              ; manage param 6/7
                beq.s   loc_46BEE
                move.l  #$7FFF,d0
                bra.s   loc_46BF0
loc_46BEE:
                
                moveq   #1,d0
loc_46BF0:
                
                moveq   #$F,d7
loc_46BF2:
                
                bsr.w   LoadMapsprite
                jsr     sub_45E10
                bsr.w   DmaMapsprite    
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                btst    #$F,d1
                beq.s   loc_46C16
                lsr.l   #1,d0
                bra.s   loc_46C1A
loc_46C16:
                
                add.l   d0,d0
                addq.w  #1,d0
loc_46C1A:
                
                dbf     d7,loc_46BF2
                rts

; END OF FUNCTION CHUNK FOR csc22_animateEntityFadeInOrOut


; =============== S U B R O U T I N E =======================================


csc23_setEntityFacing:
                
                move.b  (a6),d0
                moveq   #2,d7
                bsr.w   AdjustScriptPointerByCharacterAliveStatus
                move.b  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  (a6)+,ENTITYDEF_OFFSET_FACING(a5)
                bsr.w   UpdateEntitySprite_0
                rts

    ; End of function csc23_setEntityFacing


; =============== S U B R O U T I N E =======================================

; set playable entity 00xx or something like that


csc24_setCameraTargetEntity:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a5
                move.w  (a6)+,d0
                bmi.w   loc_46C52
                tst.b   d0
                bpl.s   @Ally
                subi.b  #ENTITY_ENEMY_INDEX_DIFFERENCE,d0
@Ally:
                
                andi.w  #BYTE_MASK,d0
                move.b  (a5,d0.w),d0
loc_46C52:
                
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                nop
                rts

    ; End of function csc24_setCameraTargetEntity


; =============== S U B R O U T I N E =======================================


csc25_cloneEntity:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_ENTNUM(a5),d1
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  d1,ENTITYDEF_OFFSET_ENTNUM(a5)
                rts

    ; End of function csc25_cloneEntity


; =============== S U B R O U T I N E =======================================


csc26_entityNodHead:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                lea     (FF6802_LOADING_SPACE).l,a0
                moveq   #0,d7
                moveq   #10,d0
                jsr     (Sleep).w       
loc_46C8A:
                
                bsr.w   LoadMapsprite
                jsr     sub_45D70
                bsr.w   DmaMapsprite    
                moveq   #20,d0
                jsr     (Sleep).w       
                bsr.w   UpdateEntitySprite_0
                moveq   #10,d0
                jsr     (Sleep).w       
                dbf     d7,loc_46C8A
                move.b  #0,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                rts

    ; End of function csc26_entityNodHead


; =============== S U B R O U T I N E =======================================


csc27_entityShakeHead:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                lea     (FF6802_LOADING_SPACE).l,a0
                moveq   #6,d7
loc_46CC8:
                
                bsr.w   LoadMapsprite
                jsr     sub_45D1C
                bsr.w   DmaMapsprite    
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                bsr.w   LoadMapsprite
                jsr     sub_45D46
                bsr.w   DmaMapsprite    
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                dbf     d7,loc_46CC8
                move.b  #0,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                rts

    ; End of function csc27_entityShakeHead


; =============== S U B R O U T I N E =======================================


csc28_moveEntityNextToPlayer:
                
                moveq   #0,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  ENTITYDEF_OFFSET_XDEST(a5),d1
                move.w  ENTITYDEF_OFFSET_YDEST(a5),d2
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  (a6)+,d3
                tst.b   d3
                bne.s   loc_46D30
                
                ; Bring to right
                addi.w  #MAP_TILE_SIZE,d1
                bra.s   loc_46D4C
loc_46D30:
                
                cmpi.b  #UP,d3
                bne.s   loc_46D3C
                
                ; Bring to top
                subi.w  #MAP_TILE_SIZE,d2
                bra.s   loc_46D4C
loc_46D3C:
                
                cmpi.b  #LEFT,d3
                bne.s   loc_46D48       
                
                ; Bring to left
                subi.w  #MAP_TILE_SIZE,d1
                bra.s   loc_46D4C
loc_46D48:
                
                addi.w  #MAP_TILE_SIZE,d2 ; Bring to bottom
loc_46D4C:
                
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a5)
                move.w  #48,d4
                sub.w   (a5),d1
                bpl.s   loc_46D5C
                neg.w   d1
                neg.w   d4
loc_46D5C:
                
                move.w  d1,ENTITYDEF_OFFSET_XTRAVEL(a5)
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.b  d4,ENTITYDEF_OFFSET_XVELOCITY(a5)
            else
                move.w  d4,ENTITYDEF_OFFSET_XVELOCITY(a5)
            endif
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a5)
                move.w  #48,d5
                sub.w   ENTITYDEF_OFFSET_Y(a5),d2
                bpl.s   loc_46D76
                neg.w   d2
                neg.w   d5
loc_46D76:
                
                move.w  d2,ENTITYDEF_OFFSET_YTRAVEL(a5)
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.b  d5,ENTITYDEF_OFFSET_YVELOCITY(a5)
            else
                move.w  d5,ENTITYDEF_OFFSET_YVELOCITY(a5)
            endif
                bsr.w   WaitForEntityToStopMoving
                addq.w  #2,d3           ; entity has opposite facing
                andi.b  #DIRECTION_MASK,d3
                move.b  d3,ENTITYDEF_OFFSET_FACING(a5)
                bsr.w   UpdateEntitySprite_0
                moveq   #0,d0
                bsr.w   WaitForEntityToStopMoving
                rts

    ; End of function csc28_moveEntityNextToPlayer


; =============== S U B R O U T I N E =======================================


csc29_setEntityDest:
                
                move.w  (a6)+,d0
                move.w  d0,d6
                bsr.w   GetEntityAddressFromCharacter
                moveq   #0,d1
                moveq   #0,d2
                move.w  (a6)+,d1
                move.w  (a6)+,d2
                mulu.w  #MAP_TILE_SIZE,d1
                mulu.w  #MAP_TILE_SIZE,d2
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a5)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a5)
                move.w  #32,d3
                sub.w   (a5),d1
                bpl.s   loc_46DC4
                neg.w   d1
                neg.w   d3
loc_46DC4:
                
                move.w  d1,ENTITYDEF_OFFSET_XTRAVEL(a5)
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.b  d3,ENTITYDEF_OFFSET_XVELOCITY(a5)
            else
                move.w  d3,ENTITYDEF_OFFSET_XVELOCITY(a5)
            endif
                move.w  #32,d3
                sub.w   ENTITYDEF_OFFSET_Y(a5),d2
                bpl.s   loc_46DDA
                neg.w   d2
                neg.w   d3
loc_46DDA:
                
                move.w  d2,ENTITYDEF_OFFSET_YTRAVEL(a5)
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.b  d3,ENTITYDEF_OFFSET_YVELOCITY(a5)
            else
                move.w  d3,ENTITYDEF_OFFSET_YVELOCITY(a5)
            endif
                btst    #$F,d6
                bne.s   return_46DEC
                bsr.w   WaitForEntityToStopMoving
return_46DEC:
                
                rts

    ; End of function csc29_setEntityDest


; =============== S U B R O U T I N E =======================================


csc2A_entityShiver:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  ((SPRITE_SIZE-$1000000)).w,d6
                move.w  #21,((SPRITE_SIZE-$1000000)).w
                move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a5),d5
                move.b  #-1,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                moveq   #2,d7
@Loop:
                
                ori.b   #8,ENTITYDEF_OFFSET_FLAGS_B(a5)
                bsr.w   UpdateEntitySprite_0
                moveq   #5,d0
                jsr     (Sleep).w       
                andi.b  #%11110111,ENTITYDEF_OFFSET_FLAGS_B(a5)
                bsr.w   UpdateEntitySprite_0
                moveq   #5,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                move.b  d5,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
                move.w  d6,((SPRITE_SIZE-$1000000)).w
                rts

    ; End of function csc2A_entityShiver


; =============== S U B R O U T I N E =======================================


csc2B_initializeNewEntity:
                
                move.w  (a6)+,d0
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                move.b  (a6)+,d1
                move.b  (a6)+,d2
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.w  (a6)+,d3
                move.w  (a6)+,d4
            else
                move.b  (a6)+,d3
                move.b  (a6)+,d4
            endif
                move.l  #eas_Init,d5
                jsr     InitializeNewEntity
                rts

    ; End of function csc2B_initializeNewEntity


; =============== S U B R O U T I N E =======================================


csc2C_followEntity:
                
                move.b  (a6),d0
                moveq   #6,d7
                bsr.w   AdjustScriptPointerByCharacterAliveStatus
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  d0,d3
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  d0,d1
                move.w  d3,d0
                move.w  (a6)+,d2
                add.w   d2,d2
                lea     table_FollowerPositions(pc,d2.w),a0
                move.b  (a0)+,d2
                move.b  (a0)+,d3
                ext.w   d2
                ext.w   d3
                jsr     AddFollower
                rts

    ; End of function csc2C_followEntity

table_FollowerPositions:
                dc.b 24
                dc.b 0
                dc.b 0
                dc.b -24
                dc.b -24
                dc.b 0
                dc.b 0
                dc.b 24
                dc.b 24
                dc.b -24
                dc.b -24
                dc.b -24
                dc.b -24
                dc.b 24
                dc.b 24
                dc.b 24

; =============== S U B R O U T I N E =======================================


csc2E_hideEntity:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                jsr     HideEntity      
                rts

    ; End of function csc2E_hideEntity


; =============== S U B R O U T I N E =======================================

; specific entity behaviour for skreech join cutscene


csc2F_fly:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  (a6)+,d0
                bne.s   loc_46EB8
                clr.b   ENTITYDEF_OFFSET_LAYER(a5)
                bra.s   return_46EBE
loc_46EB8:
                
                move.b  #16,ENTITYDEF_OFFSET_LAYER(a5)
return_46EBE:
                
                rts

    ; End of function csc2F_fly


; =============== S U B R O U T I N E =======================================


csc30_removeEntityShadow:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                lea     (FF6802_LOADING_SPACE).l,a0
                bsr.w   LoadMapsprite
                jsr     sub_45A8C
                bsr.w   DmaMapsprite    
                jsr     (WaitForVInt).w
                rts

    ; End of function csc30_removeEntityShadow


; =============== S U B R O U T I N E =======================================


csc50_setEntitySize:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  ((SPRITE_SIZE-$1000000)).w,d6
                move.w  (a6)+,((SPRITE_SIZE-$1000000)).w
                ori.b   #8,ENTITYDEF_OFFSET_FLAGS_B(a5)
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                move.w  d6,((SPRITE_SIZE-$1000000)).w
                rts

    ; End of function csc50_setEntitySize


; =============== S U B R O U T I N E =======================================

; force join to active party


csc51_joinBattleParty:
                
                move.w  #-1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                nop
                move.w  (a6)+,d0
                jsr     j_IsInBattleParty
                bne.w   @Return
                move.w  d0,d6
                jsr     j_UpdateForce
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                nop
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                nop
                subq.w  #2,d7
@Loop:
                
                move.b  (a0),d0
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @ReplaceLastActiveMember
                
                ; Replace dead member
                addq.l  #1,a0
                dbf     d7,@Loop
@ReplaceLastActiveMember:
                
                move.b  (a0),d0
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                nop
                jsr     j_LeaveBattleParty
                move.b  d6,d0
                jsr     j_JoinBattleParty
@Return:
                
                rts

    ; End of function csc51_joinBattleParty


; =============== S U B R O U T I N E =======================================


csc52_faceEntity:
                
                move.w  (a6)+,d7
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  ENTITYDEF_OFFSET_XDEST(a5),d1
                move.w  ENTITYDEF_OFFSET_YDEST(a5),d2
                move.w  d7,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  d1,d3
                sub.w   ENTITYDEF_OFFSET_XDEST(a5),d3
                or.w    d3,d3
                bge.s   @GetDistance_Y
                neg.w   d3
@GetDistance_Y:
                
                move.w  d2,d4
                sub.w   ENTITYDEF_OFFSET_YDEST(a5),d4
                or.w    d4,d4
                bge.s   @CompareDistances
                neg.w   d4
@CompareDistances:
                
                cmp.w   d3,d4
                bcc.s   @Face_Vertically
                cmp.w   ENTITYDEF_OFFSET_XDEST(a5),d1
                bcs.s   @Face_Left
                move.b  #RIGHT,ENTITYDEF_OFFSET_FACING(a5)
                bra.s   @Goto_Done
@Face_Left:
                
                move.b  #LEFT,ENTITYDEF_OFFSET_FACING(a5)
@Goto_Done:
                
                bra.s   @Done
@Face_Vertically:
                
                cmp.w   ENTITYDEF_OFFSET_YDEST(a5),d2
                bcs.s   @Face_Up
                move.b  #DOWN,ENTITYDEF_OFFSET_FACING(a5)
                bra.s   @Done
@Face_Up:
                
                move.b  #UP,ENTITYDEF_OFFSET_FACING(a5)
@Done:
                
                bsr.w   UpdateEntitySprite_0
                jsr     (WaitForVInt).w
                rts

    ; End of function csc52_faceEntity


; =============== S U B R O U T I N E =======================================


csc53_setPriority:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                lea     ((byte_FFAFB0-$1000000)).w,a0
                nop
                move.w  (a6)+,d1
                bne.s   loc_46FD4
                clr.b   (a0,d0.w)
                bra.s   return_46FDA
loc_46FD4:
                
                move.b  #1,(a0,d0.w)
return_46FDA:
                
                rts

    ; End of function csc53_setPriority


; =============== S U B R O U T I N E =======================================


csc54_joinForceAI:
                
                move.w  (a6)+,d0
                jsr     j_GetActivationBitfield
                move.w  (a6)+,d2
                bne.s   loc_46FEE
                andi.w  #$FFFB,d1
                bra.s   loc_46FF8
loc_46FEE:
                
                ori.w   #4,d1
                jsr     j_JoinForce
loc_46FF8:
                
                jsr     j_SetActivationBitfield
                rts

    ; End of function csc54_joinForceAI


; =============== S U B R O U T I N E =======================================


csc55_resetCharacterBattleStats:
                
                jsr     ResetAlliesBattleStats
                rts

    ; End of function csc55_resetCharacterBattleStats


; =============== S U B R O U T I N E =======================================


csc56_addFollower:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                moveq   #0,d1
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
@FindFollower_Loop:
                
                cmpi.b  #-1,(a0)
                beq.w   @Break          ; get last follower
                move.b  (a0)+,d1
                bra.s   @FindFollower_Loop
@Break:
                
                move.w  #$FFE8,d2
                move.w  #0,d3
                jsr     AddFollower
                rts

    ; End of function csc56_addFollower


; =============== S U B R O U T I N E =======================================


csc31_moveEntityAboveEntity:
                
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                move.w  d0,d1
                move.w  (a6)+,d0
                bsr.w   GetEntityAddressFromCharacter
                moveq   #$FFFFFFE8,d2
                moveq   #0,d3
                jsr     AddFollower     
                rts

    ; End of function csc31_moveEntityAboveEntity


; =============== S U B R O U T I N E =======================================

;     Get address of entity information. Could be a force member or an opponent
;     In: D0 = playable character from FFB140
;     Out: A5 = entity info address in RAM


GetEntityAddressFromCharacter:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a5
                andi.w  #COMBATANT_MASK_ALL,d0
                tst.b   d0
                bpl.s   @Ally
                subi.b  #ENTITY_ENEMY_INDEX_DIFFERENCE,d0
@Ally:
                
                move.b  (a5,d0.w),d0
                move.l  d0,-(sp)
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a5
                adda.w  d0,a5
                move.l  (sp)+,d0
                rts

    ; End of function GetEntityAddressFromCharacter


; =============== S U B R O U T I N E =======================================


UpdateEntitySprite_0:
                
                movem.l d6/a0,-(sp)
                move.b  ENTITYDEF_OFFSET_FACING(a5),d6
                movea.l a5,a0
                jsr     (ChangeEntityMapsprite).w
                movem.l (sp)+,d6/a0
                rts

    ; End of function UpdateEntitySprite_0


; =============== S U B R O U T I N E =======================================

; Move script pointer d7.w bytes forward if character is dead.


AdjustScriptPointerByCharacterAliveStatus:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Return
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
                bge.s   @Return
                
                jsr     j_GetCurrentHp  ; it must be a force member
                tst.w   d1
                bne.s   @Return
                adda.w  d7,a6
                movem.l (sp)+,d7
@Return:
                
                rts

    ; End of function AdjustScriptPointerByCharacterAliveStatus


; =============== S U B R O U T I N E =======================================

; In: a5 = entity data pointer


DmaMapsprite:
                
                movem.l d0-d1/a0-a1,-(sp)
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_ENTNUM(a5),d1
                move.w  d1,d0
                lsl.w   #3,d1
                add.w   d0,d1
                lsl.w   #6,d1
                lea     ($7000).w,a1
                adda.w  d1,a1
                move.w  #288,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function DmaMapsprite


; =============== S U B R O U T I N E =======================================


LoadMapsprite:
                
                movem.l d0-d1/d6/a1,-(sp)
                movea.l a0,a1
                clr.w   d6
                move.b  ENTITYDEF_OFFSET_FACING(a5),d6
                bne.s   @Continue
                moveq   #2,d6
@Continue:
                
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a5),d1
            else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d1
            endif
                move.w  d1,d0
                add.w   d1,d1
                add.w   d0,d1
                add.w   d6,d1
                subq.w  #1,d1
                lsl.w   #INDEX_SHIFT_COUNT,d1
                lea     (pt_Mapsprites).l,a0
                movea.l (a0,d1.w),a0
                jsr     (LoadBasicCompressedData).w
                movea.l a1,a0
                movem.l (sp)+,d0-d1/d6/a1
                rts

    ; End of function LoadMapsprite

