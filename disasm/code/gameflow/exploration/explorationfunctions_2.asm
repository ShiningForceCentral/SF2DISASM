
; ASM FILE code\gameflow\exploration\explorationfunctions_2.asm :
; 0x257C0..0x25A94 : Exploration functions

; =============== S U B R O U T I N E =======================================


ExplorationLoop:
                
                clr.w   ((MAP_EVENT_TYPE-$1000000)).w
                subi.w  #20000,((word_FFB196-$1000000)).w
                bge.s   loc_257D0
                clr.w   ((word_FFB196-$1000000)).w
loc_257D0:
                
                jsr     HealLivingAndImmortalAllies
                jsr     FadeOutToBlackAll(pc)
                nop
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  d0,-(sp)
                cmpi.b  #$FF,d0         ; map index is $FF, not provided
                beq.s   loc_25828
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                movem.w d1-d3,-(sp)
                clr.w   d1
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                jsr     (LoadMapTilesets).w
                movem.w (sp)+,d1-d3
                bsr.w   WaitForFadeToFinish
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     j_GetMapSetupEntities
                jsr     j_InitMapEntities
                jsr     (LoadMapEntitySprites).w
                bsr.w   ClearMapTempFlags
                setFlg  80              ; Set @ loc_257D0, also set during exploration loop at 0x25824
                bra.s   loc_25836
loc_25828:
                
                bsr.w   WaitForFadeToFinish
                bsr.w   sub_258A8       
                jsr     sub_440AC
loc_25836:
                
                jsr     (sub_4EC6).w    
                move.w  (sp)+,d1
                move.w  #$FFFF,d0
                move.b  #0,((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (LoadMap).w     
                bsr.w   SetBaseVIntFunctions
                jsr     j_RunMapSetupInitFunction
                move.l  (PALETTE_1_BASE_02).l,d0
                cmp.l   (PALETTE_1_CURRENT_02).l,d0
                beq.s   loc_2586A       
                jsr     (PlayMapMusic).w
                jsr     (FadeInFromBlack).w
loc_2586A:
                
                clr.w   d0              ; MAIN EXPLORATION LOOP
                bsr.w   SetMoveSfx
                bsr.w   WaitForEvent    
                tst.w   d0
                beq.s   loc_2587E       
                bsr.w   ProcessMapEvent ; Map event
                bra.s   loc_2586A       
loc_2587E:
                
                tst.w   d1              ; Player action (A/C button)
                beq.s   loc_25888
                bsr.w   ProcessPlayerAction
                bra.s   loc_2586A       
loc_25888:
                
                bra.s   loc_2586A       

    ; End of function ExplorationLoop


; =============== S U B R O U T I N E =======================================


ClearMapTempFlags:
                
                movem.w d1/d7,-(sp)
                move.w  #$100,d1        ; Map setup temp flag start index
                move.w  #$7F,d7 ; Number of available temp flags
loc_25896:
                
                jsr     j_ClearFlag     ; Clear map setup temp flags
                addq.w  #1,d1
                dbf     d7,loc_25896    
                movem.w (sp)+,d1/d7
                rts

    ; End of function ClearMapTempFlags


; =============== S U B R O U T I N E =======================================

; update main entity properties


sub_258A8:
                
                movem.l d0-d3/a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                tst.b   d1
                blt.s   loc_258BE
                mulu.w  #$180,d1
                move.w  d1,(a0)
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a0)
loc_258BE:
                
                tst.b   d2
                blt.s   loc_258CE
                mulu.w  #$180,d2
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
loc_258CE:
                
                move.b  d3,ENTITYDEF_OFFSET_FACING(a0)
                clr.w   d0
                jsr     j_GetAllyMapSprite
                move.w  d3,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function sub_258A8


; =============== S U B R O U T I N E =======================================


FadeOutToBlackAll:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateScrollingData
                rts

    ; End of function FadeOutToBlackAll


; =============== S U B R O U T I N E =======================================


WaitForFadeToFinish:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                beq.s   return_2591A
                jsr     (WaitForVInt).w
                bra.s   WaitForFadeToFinish
return_2591A:
                
                rts

    ; End of function WaitForFadeToFinish


; =============== S U B R O U T I N E =======================================

; Wait for event OR player action (A/C button)


WaitForEvent:
                
                move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
                bne.s   loc_25930       
                move.b  #0,((VIEW_TARGET_ENTITY-$1000000)).w ; Follow main entity
                clr.w   d0
                jsr     j_SetControlledEntityActScript
loc_25930:
                
                clr.w   d0              ; SECONDARY EXPLORATION LOOP - Wait for event OR player action (A/C button)
                clr.w   d1
                move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
                beq.s   loc_2593C
                rts
loc_2593C:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.w  #INPUT_C|INPUT_A,d1 ; Check A/C buttons
                beq.s   loc_25948
                rts
loc_25948:
                
                bra.s   loc_25930       

    ; End of function WaitForEvent


; =============== S U B R O U T I N E =======================================


ProcessMapEvent:
                
                clr.w   ((MAP_EVENT_TYPE-$1000000)).w
                subq.w  #1,d0
                beq.w   ProcessMapEventType1_Warp ; Warp
                subq.w  #1,d0
                beq.w   ProcessMapEventType2_GetIntoCaravan
                subq.w  #1,d0
                beq.w   ProcessMapEventType3_GetIntoRaft
                subq.w  #1,d0
                beq.w   ProcessMapEventType4_GetOutOfCaravan
                subq.w  #1,d0
                beq.w   ProcessMapEventType5_GetOutOfRaft
                subq.w  #1,d0
                beq.w   ProcessMapEventType6_ZoneEvent
                sndCom  SFX_BATTLEFIELD_DEATH
                rts

    ; End of function ProcessMapEvent


; =============== S U B R O U T I N E =======================================


ProcessMapEventType1_Warp:
                
                tst.b   ((MAP_EVENT_PARAM_1-$1000000)).w
                bne.w   loc_259CC
                movem.w d0,-(sp)        ; cutscene commands $07 go here
                move.w  ((WARP_SFX-$1000000)).w,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                clr.w   ((WARP_SFX-$1000000)).w
                movem.w (sp)+,d0
                clr.w   d0
                jsr     j_MakeEntityIdle
                movem.l (sp)+,d0        ; Alter stack pointer to exit from exploration loop and return to MainLoop
                clr.w   d0
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0 ; map
                bsr.w   UpdatePlayerPosFromMapEvent
                move.b  ((MAP_EVENT_PARAM_3-$1000000)).w,d5 ; X
                blt.s   loc_259BA       
                move.b  d5,d1
loc_259BA:
                
                move.b  ((MAP_EVENT_PARAM_4-$1000000)).w,d5 ; Y
                blt.s   loc_259C2       
                move.b  d5,d2
loc_259C2:
                
                move.b  ((MAP_EVENT_PARAM_5-$1000000)).w,d3 ; Facing
                move.b  ((MAP_EVENT_PARAM_1-$1000000)).w,d4 ; 0
                rts                     ; Directly goes back to MainLoop
loc_259CC:
                
                clr.w   d0
                jsr     j_MakeEntityIdle
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0
                cmpi.b  #MAP_OVERWORLD_AROUND_PACALON,d0
                bne.s   loc_259E8       ; HARDCODED check if map is overworld pacalon, switch if water not restored
                chkFlg  530             ; Battle 30 completed - BATTLE_VERSUS_ZALBARD              
                beq.s   loc_259E8
                move.w  #MAP_OVERWORLD_PACALON_2,d0
loc_259E8:
                
                move.b  d0,((CURRENT_MAP-$1000000)).w
                moveq   #$FFFFFFFF,d0
                jsr     (ProcessMapTransition).w
                move.b  ((MAP_EVENT_PARAM_3-$1000000)).w,d0
                blt.s   loc_25A04
                mulu.w  #$180,d0
                move.w  d0,((ENTITY_DATA-$1000000)).w
                move.w  d0,((ENTITY_X_DEST-$1000000)).w
loc_25A04:
                
                clr.w   d0
                move.b  ((MAP_EVENT_PARAM_4-$1000000)).w,d0
                blt.s   loc_25A18
                mulu.w  #$180,d0
                move.w  d0,((ENTITY_Y-$1000000)).w
                move.w  d0,((ENTITY_Y_DEST-$1000000)).w
loc_25A18:
                
                clr.w   d1
                clr.w   d2
                clr.w   d3
                bsr.w   UpdatePlayerPosFromMapEvent
                jsr     sub_440AC
                rts

    ; End of function ProcessMapEventType1_Warp


; =============== S U B R O U T I N E =======================================


UpdatePlayerPosFromMapEvent:
                
                move.l  a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  (a0),d1         ; X
                ext.l   d1
                divs.w  #$180,d1
                move.w  ENTITYDEF_OFFSET_Y(a0),d2 ; Y
                ext.l   d2
                divs.w  #$180,d2
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0),d3
                movea.l (sp)+,a0
                rts

    ; End of function UpdatePlayerPosFromMapEvent


; =============== S U B R O U T I N E =======================================


ProcessMapEventType2_GetIntoCaravan:
                
                jsr     j_MapEventType2 
                rts

    ; End of function ProcessMapEventType2_GetIntoCaravan


; =============== S U B R O U T I N E =======================================


ProcessMapEventType3_GetIntoRaft:
                
                jsr     j_MapEventType3
                rts

    ; End of function ProcessMapEventType3_GetIntoRaft


; =============== S U B R O U T I N E =======================================


ProcessMapEventType4_GetOutOfCaravan:
                
                jsr     j_MapEventType4
                rts

    ; End of function ProcessMapEventType4_GetOutOfCaravan


; =============== S U B R O U T I N E =======================================


ProcessMapEventType5_GetOutOfRaft:
                
                jsr     j_MapEventType5
                rts

    ; End of function ProcessMapEventType5_GetOutOfRaft


; =============== S U B R O U T I N E =======================================


j_j_ShrinkInBowieAndFollowers:
                
                jsr     j_ShrinkInBowieAndFollowers
                rts

    ; End of function j_j_ShrinkInBowieAndFollowers


; =============== S U B R O U T I N E =======================================


j_j_GrowOutBowieAndFollowers:
                
                jsr     j_GrowOutBowieAndFollowers
                rts

    ; End of function j_j_GrowOutBowieAndFollowers


; =============== S U B R O U T I N E =======================================


ProcessMapEventType6_ZoneEvent:
                
                clr.w   d0
                jsr     j_ApplyInitActscript
                move.w  ((MAP_EVENT_PARAM_1-$1000000)).w,d1 ; X
                move.w  ((MAP_EVENT_PARAM_3-$1000000)).w,d2 ; Y
                jsr     j_RunMapSetupZoneEvent
                rts

    ; End of function ProcessMapEventType6_ZoneEvent

