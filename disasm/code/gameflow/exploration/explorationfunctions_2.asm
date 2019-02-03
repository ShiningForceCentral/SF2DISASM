
; ASM FILE code\gameflow\exploration\explorationfunctions_2.asm :
; 0x257C0..0x25A94 : Exploration functions

; =============== S U B R O U T I N E =======================================

ExecuteExplorationLoop:
                
                clr.w   ((MAP_EVENT_TYPE-$1000000)).w
                subi.w  #$4E20,((word_FFB196-$1000000)).w
                bge.s   loc_257D0
                clr.w   ((word_FFB196-$1000000)).w
loc_257D0:
                
                jsr     HealAliveCharsAndImmortals
                jsr     sub_258EA(pc)
                nop
                move.b  #$FF,((CAMERA_ENTITY-$1000000)).w
                move.w  d0,-(sp)
                cmpi.b  #$FF,d0         ; map idx is FF, not provided
                beq.s   loc_25828
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  #$FF,((CURRENT_BATTLE-$1000000)).w
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
                bsr.w   loc_2588A
                setFlg  $50             ; set @ loc_257D0, also set during exploration loop at 0x25824
                bra.s   loc_25836
loc_25828:
                
                bsr.w   WaitForFadeToFinish
                bsr.w   sub_258A8
                jsr     sub_440AC
loc_25836:
                
                jsr     (sub_4EC6).w
                move.w  (sp)+,d1
                move.w  #$FFFF,d0
                move.b  #0,((CAMERA_ENTITY-$1000000)).w
                jsr     (LoadMap).w     
                bsr.w   SetBattleVIntFunctions
                jsr     j_RunMapSetupInitFunction
                move.l  (dword_FFD084).l,d0
                cmp.l   (PALETTE_1_0F).l,d0
                beq.s   loc_2586A       
                jsr     (LoadBattleMusic).w
                jsr     (FadeInFromBlack).w
loc_2586A:
                
                clr.w   d0              ; MAIN MAP LOOP
                bsr.w   UpdateMoveSound
                bsr.w   WaitForEvent
                tst.w   d0
                beq.s   loc_2587E
                bsr.w   ProcessMapEvent ; map event
                bra.s   loc_2586A       
loc_2587E:
                
                tst.w   d1
                beq.s   loc_25888
                bsr.w   SetExplorationVIntFunctions; A or C button pushed
                bra.s   loc_2586A       
loc_25888:
                
                bra.s   loc_2586A       
loc_2588A:
                
                movem.w d1/d7,-(sp)
                move.w  #$100,d1
                move.w  #$7F,d7 
loc_25896:
                
                jsr     j_ClearFlag
                addq.w  #1,d1
                dbf     d7,loc_25896
                movem.w (sp)+,d1/d7
                rts

	; End of function ExecuteExplorationLoop


; =============== S U B R O U T I N E =======================================

sub_258A8:
                
                movem.l d0-d3/a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                tst.b   d1
                blt.s   loc_258BE
                mulu.w  #$180,d1
                move.w  d1,(a0)
                move.w  d1,$C(a0)
loc_258BE:
                
                tst.b   d2
                blt.s   loc_258CE
                mulu.w  #$180,d2
                move.w  d2,2(a0)
                move.w  d2,$E(a0)
loc_258CE:
                
                move.b  d3,$10(a0)
                clr.w   d0
                jsr     j_GetForceMemberSpriteIdx
                move.w  d3,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (sub_6052).w    
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function sub_258A8


; =============== S U B R O U T I N E =======================================

sub_258EA:
                
                move.b  #2,((FADING_SETTING-$1000000)).w
                clr.w   ((byte_FFDFAA-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_3930          
                rts

	; End of function sub_258EA


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

WaitForEvent:
                
                move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
                bne.s   loc_25930       
                move.b  #0,((CAMERA_ENTITY-$1000000)).w
                clr.w   d0
                jsr     j_SetControlledEntityActScript
loc_25930:
                
                clr.w   d0              ; SECONDARY MAP LOOP - wait for map event
                clr.w   d1
                move.w  ((MAP_EVENT_TYPE-$1000000)).w,d0
                beq.s   loc_2593C
                rts
loc_2593C:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.w  #$60,d1 ; Check A/C buttons
                beq.s   loc_25948
                rts
loc_25948:
                
                bra.s   loc_25930       

	; End of function WaitForEvent


; =============== S U B R O U T I N E =======================================

; deal with "system" event (RAM:a84a)

ProcessMapEvent:
                
                clr.w   ((MAP_EVENT_TYPE-$1000000)).w
                subq.w  #1,d0
                beq.w   loc_25978       
                subq.w  #1,d0
                beq.w   ProcessMapEventType2
                subq.w  #1,d0
                beq.w   ProcessMapEventType3
                subq.w  #1,d0
                beq.w   ProcessMapEventType4
                subq.w  #1,d0
                beq.w   ProcessMapEventType5
                subq.w  #1,d0
                beq.w   loc_25A7C
                sndCom  SFX_BATTLEFIELD_DEATH
                rts
loc_25978:
                
                tst.b   ((MAP_EVENT_PARAM_1-$1000000)).w; Event type 1
                bne.w   loc_259CC
                movem.w d0,-(sp)        ; cutscene commands $07 go here
                move.w  ((WARP_SFX-$1000000)).w,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                clr.w   ((WARP_SFX-$1000000)).w
                movem.w (sp)+,d0
                clr.w   d0
                jsr     j_MakeEntityIdle
                movem.l (sp)+,d0
                clr.w   d0
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0
                bsr.w   UpdatePlayerPosFromMapEvent
                move.b  ((MAP_EVENT_PARAM_3-$1000000)).w,d5
                blt.s   loc_259BA
                move.b  d5,d1
loc_259BA:
                
                move.b  ((MAP_EVENT_PARAM_4-$1000000)).w,d5
                blt.s   loc_259C2
                move.b  d5,d2
loc_259C2:
                
                move.b  ((MAP_EVENT_PARAM_5-$1000000)).w,d3
                move.b  ((MAP_EVENT_PARAM_1-$1000000)).w,d4
                                                        ; 0
                rts
loc_259CC:
                
                clr.w   d0
                jsr     j_MakeEntityIdle
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0
                cmpi.b  #$47,d0 
                bne.s   loc_259E8       ; HARDCODED check if map is overworld pacalon, switch if water not restored
                chkFlg  $212            ; Battle 30 completed
                beq.s   loc_259E8
                move.w  #$4E,d0 
loc_259E8:
                
                move.b  d0,((CURRENT_MAP-$1000000)).w
                moveq   #$FFFFFFFF,d0
                jsr     (sub_25B0).w
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

	; End of function ProcessMapEvent


; =============== S U B R O U T I N E =======================================

UpdatePlayerPosFromMapEvent:
                
                move.l  a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  (a0),d1         ; X
                ext.l   d1
                divs.w  #$180,d1
                move.w  ENTITYDEF_OFFSET_Y(a0),d2; Y
                ext.l   d2
                divs.w  #$180,d2
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0),d3; Facing
                movea.l (sp)+,a0
                rts

	; End of function UpdatePlayerPosFromMapEvent


; =============== S U B R O U T I N E =======================================

; Event type 2

ProcessMapEventType2:
                
                jsr     j_MapEventType2 
                rts

	; End of function ProcessMapEventType2


; =============== S U B R O U T I N E =======================================

; Event type 3

ProcessMapEventType3:
                
                jsr     j_MapEventType3
                rts

	; End of function ProcessMapEventType3


; =============== S U B R O U T I N E =======================================

; Event type 4

ProcessMapEventType4:
                
                jsr     j_MapEventType4
                rts

	; End of function ProcessMapEventType4


; =============== S U B R O U T I N E =======================================

; Event type 5

ProcessMapEventType5:
                
                jsr     j_MapEventType5
                rts

	; End of function ProcessMapEventType5


; =============== S U B R O U T I N E =======================================

sub_25A6C:
                
                jsr     j_ShrinkInBowieAndFollowers
                rts

	; End of function sub_25A6C


; =============== S U B R O U T I N E =======================================

sub_25A74:
                
                jsr     j_GrowOutBowieAndFollowoers
                rts

	; End of function sub_25A74


; START OF FUNCTION CHUNK FOR ProcessMapEvent

loc_25A7C:
                
                clr.w   d0              ; Event type 6
                jsr     sub_4401C       
                move.w  ((MAP_EVENT_PARAM_1-$1000000)).w,d1
                move.w  ((MAP_EVENT_PARAM_3-$1000000)).w,d2
                jsr     j_RunMapSetupZoneEvent
                rts

; END OF FUNCTION CHUNK FOR ProcessMapEvent

