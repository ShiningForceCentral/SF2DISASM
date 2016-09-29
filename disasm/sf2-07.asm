
; GAME SECTION 07 :
; Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups

; FREE SPACE : 2931 bytes.



; =============== S U B R O U T I N E =======================================

sub_44000:
										
										jmp     sub_440D4(pc)

	; End of function sub_44000


; =============== S U B R O U T I N E =======================================

j_InitMapEntities:
										
										jmp     InitMapEntities(pc)

	; End of function j_InitMapEntities


; =============== S U B R O U T I N E =======================================

j_MoveEntitiesToBattlePositions:
										
										jmp     MoveEntitiesToBattlePositions(pc)

	; End of function j_MoveEntitiesToBattlePositions


; =============== S U B R O U T I N E =======================================

sub_4400C:
										
										jmp     sub_45634(pc)

	; End of function sub_4400C


; =============== S U B R O U T I N E =======================================

j_WaitForEntityToStopMoving:
										
										jmp     WaitForEntityToStopMoving(pc)

	; End of function j_WaitForEntityToStopMoving


; =============== S U B R O U T I N E =======================================

j_SetControlledEntityActScript:
										
										jmp     SetControlledEntityActScript(pc)

	; End of function j_SetControlledEntityActScript


; =============== S U B R O U T I N E =======================================

j_MakeEntityIdle:
										
										jmp     MakeEntityIdle(pc)

	; End of function j_MakeEntityIdle


; =============== S U B R O U T I N E =======================================

; set entity D0's movescript to 0x460ce (default? don't move?)

sub_4401C:
										
										jmp     sub_44C02(pc)   

	; End of function sub_4401C


; =============== S U B R O U T I N E =======================================

j_SetEntityMovescriptToIdle:
										
										jmp     SetEntityMovescriptToIdle(pc)

	; End of function j_SetEntityMovescriptToIdle


; =============== S U B R O U T I N E =======================================

sub_44024:
										
										jmp     sub_44B94(pc)

	; End of function sub_44024


; =============== S U B R O U T I N E =======================================

j_SetUnitCursorActscript:
										
										jmp     SetUnitCursorActscript(pc)

	; End of function j_SetUnitCursorActscript


; =============== S U B R O U T I N E =======================================

sub_4402C:
										
										jmp     sub_44BC0(pc)

	; End of function sub_4402C


; =============== S U B R O U T I N E =======================================

sub_44030:
										
										jmp     sub_44BD6(pc)

	; End of function sub_44030


; =============== S U B R O U T I N E =======================================

j_ExecuteDebugMapScript:
										
										jmp     ExecuteDebugMapScript(pc)

	; End of function j_ExecuteDebugMapScript


; =============== S U B R O U T I N E =======================================

j_nullsub_14:
										
										jmp     nullsub_14(pc)

	; End of function j_nullsub_14


; =============== S U B R O U T I N E =======================================

j_ExecuteMapScript:
										
										jmp     ExecuteMapScript(pc)

	; End of function j_ExecuteMapScript


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Intro:
										
										jmp     j_ExecuteBattleCutscene_Intro_0(pc)

	; End of function j_ExecuteBattleCutscene_Intro


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Start:
										
										jmp     ExecuteBattleCutscene_Start(pc)

	; End of function j_ExecuteBattleCutscene_Start


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Defeated:
										
										jmp     ExecuteBattleCutscene_Defeated(pc)

	; End of function j_ExecuteBattleCutscene_Defeated


; =============== S U B R O U T I N E =======================================

j_ExecuteAfterBattleCutscene:
										
										jmp     ExecuteAfterBattleCutscene(pc)

	; End of function j_ExecuteAfterBattleCutscene


; =============== S U B R O U T I N E =======================================

sub_44050:
										
										jmp     sub_47D9E(pc)

	; End of function sub_44050


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Region:
										
										jmp     ExecuteBattleCutscene_Region(pc)

	; End of function j_ExecuteBattleCutscene_Region


; =============== S U B R O U T I N E =======================================

j_LaunchFading:
										
										jmp     LaunchFading(pc)

	; End of function j_LaunchFading


; =============== S U B R O U T I N E =======================================

sub_4405C:
										
										jmp     sub_45858(pc)

	; End of function sub_4405C


; =============== S U B R O U T I N E =======================================

sub_44060:
										
										jmp     sub_45858(pc)

	; End of function sub_44060


; =============== S U B R O U T I N E =======================================

sub_44064:
										
										jmp     sub_45974(pc)

	; End of function sub_44064


; =============== S U B R O U T I N E =======================================

sub_44068:
										
										jmp     sub_45BBE(pc)

	; End of function sub_44068


; =============== S U B R O U T I N E =======================================

sub_4406C:
										
										jmp     sub_45C94(pc)

	; End of function sub_4406C


; =============== S U B R O U T I N E =======================================

sub_44070:
										
										jmp     sub_45C82(pc)

	; End of function sub_44070


; =============== S U B R O U T I N E =======================================

sub_44074:
										
										jmp     sub_45B84(pc)

	; End of function sub_44074


; =============== S U B R O U T I N E =======================================

sub_44078:
										
										jmp     sub_474EE(pc)

	; End of function sub_44078


; =============== S U B R O U T I N E =======================================

j_ExecuteEntityEvent:
										
										jmp     ExecuteEntityEvent(pc)

	; End of function j_ExecuteEntityEvent


; =============== S U B R O U T I N E =======================================

j_RunMapSetupSection3Function:
										
										jmp     RunMapSetupSection3Function(pc)

	; End of function j_RunMapSetupSection3Function


; =============== S U B R O U T I N E =======================================

j_ExecuteEntityEvent_0:
										
										jmp     ExecuteEntityEvent(pc)

	; End of function j_ExecuteEntityEvent_0


; =============== S U B R O U T I N E =======================================

; triggers a map setup function according to up to 4 criterias in d1-d4

sub_44088:
										
										jmp     sub_47586(pc)

	; End of function sub_44088


; =============== S U B R O U T I N E =======================================

j_GetMapSetupEntities:
										
										jmp     GetMapSetupEntityList(pc)

	; End of function j_GetMapSetupEntities


; =============== S U B R O U T I N E =======================================

sub_44090:
										
										jmp     sub_453C6(pc)

	; End of function sub_44090


; =============== S U B R O U T I N E =======================================

sub_44094:
										
										jmp     sub_45440(pc)

	; End of function sub_44094


; =============== S U B R O U T I N E =======================================

; related to followers maybe

sub_44098:
										
										jmp     sub_45268(pc)   

	; End of function sub_44098


; =============== S U B R O U T I N E =======================================

sub_4409C:
										
										jmp     sub_45322(pc)

	; End of function sub_4409C


; =============== S U B R O U T I N E =======================================

sub_440A0:
										
										jmp     sub_45514(pc)

	; End of function sub_440A0


; =============== S U B R O U T I N E =======================================

sub_440A4:
										
										jmp     sub_455AC(pc)   

	; End of function sub_440A4


; =============== S U B R O U T I N E =======================================

j_RunMapSetupInitFunction:
										
										jmp     RunMapSetupInitFunction(pc)

	; End of function j_RunMapSetupInitFunction


; =============== S U B R O U T I N E =======================================

sub_440AC:
										
										jmp     sub_441AA(pc)

	; End of function sub_440AC


; =============== S U B R O U T I N E =======================================

j_GetCharacterSpriteIdx:
										
										jmp     GetCharacterSpriteIdx(pc)

	; End of function j_GetCharacterSpriteIdx


; =============== S U B R O U T I N E =======================================

j_RunMapSetupFunction:
										
										jmp     RunMapSetupFunction(pc)

	; End of function j_RunMapSetupFunction


; =============== S U B R O U T I N E =======================================

sub_440B8:
										
										jmp     sub_444A2(pc)

	; End of function sub_440B8


; =============== S U B R O U T I N E =======================================

j_PlayIntroOrEndCutscene:
										
										jmp     PlayIntroOrEndCutscene(pc)

	; End of function j_PlayIntroOrEndCutscene


; =============== S U B R O U T I N E =======================================

j_ExecuteFlashScreenScript:
										
										jmp     ExecuteFlashScreenScript(pc)

	; End of function j_ExecuteFlashScreenScript


; =============== S U B R O U T I N E =======================================

j_GetEntityPortaitAndSpeechSound:
										
										jmp     GetEntityPortraitAndSpeechSound(pc)

	; End of function j_GetEntityPortaitAndSpeechSound


; =============== S U B R O U T I N E =======================================

j_ClearEntities:
										
										jmp     ClearEntities(pc)

	; End of function j_ClearEntities


; =============== S U B R O U T I N E =======================================

InitMapEntities:
										
										movem.l d0-a5,-(sp)
										bra.w   loc_440E2

	; End of function InitMapEntities


; =============== S U B R O U T I N E =======================================

sub_440D4:
										
										movem.l d0-a5,-(sp)
										lea     GetEntityPortraitAndSpeechSound(pc), a0
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0

	; End of function sub_440D4


; START OF FUNCTION CHUNK FOR InitMapEntities

loc_440E2:
										
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										bsr.w   ClearEntities   
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a1
										lea     $20(a1),a2
										lea     ((FOLLOWERS_LIST-$1000000)).w,a3
										movem.w d1-d3,-(sp)
										moveq   #1,d0
										bsr.w   sub_44298
loc_44104:
										
										move.b  (a0)+,d1
										cmpi.b  #$FF,d1
										beq.w   loc_44180
										andi.w  #$3F,d1 
										muls.w  #$180,d1
										move.b  (a0)+,d2
										andi.w  #$3F,d2 
										muls.w  #$180,d2
										move.b  (a0)+,d3
										move.b  (a0)+,d4
										cmpi.b  #$F0,d4
										bcs.s   loc_44146
										movem.w d0,-(sp)
										move.w  #$2F,d0 
										move.b  d0,(a2)+
										move.l  (a0)+,d5
										clr.l   d6
										move.w  #$20,d6 
										bsr.w   DeclareNewEntity
										movem.w (sp)+,d0
										bra.s   loc_44104
loc_44146:
										
										cmpi.b  #$1E,d4
										bcc.s   loc_44170
										ext.w   d4
										tst.b   (a1,d4.w)
										beq.s   loc_4415A
										move.l  (a0)+,d5
										bra.w   loc_4417E
loc_4415A:
										
										move.b  d0,(a1,d4.w)
										movem.w d0-d1,-(sp)
										clr.w   d0
										move.b  d4,d0
										bsr.w   GetCharacterSpriteIdx
										movem.w (sp)+,d0-d1
										bra.s   loc_44172
loc_44170:
										
										move.b  d0,(a2)+
loc_44172:
										
										move.l  (a0)+,d5
										clr.l   d6
										move.w  d0,d6
										bsr.w   DeclareNewEntity
										addq.w  #1,d0
loc_4417E:
										
										bra.s   loc_44104
loc_44180:
										
										movem.w (sp)+,d1-d3
										clr.w   d0
										clr.l   d6
										bsr.w   GetCharacterSpriteIdx
										move.l  #eas_Idle,d5    
										bsr.w   DeclareNewEntity
										move.w  #$10,((SPRITE_SIZE-$1000000)).w
										move.b  #$FF,(a3)
										bsr.w   loc_44404
										movem.l (sp)+,d0-a5
										rts

; END OF FUNCTION CHUNK FOR InitMapEntities


; =============== S U B R O U T I N E =======================================

sub_441AA:
										
										movem.l d0-a1,-(sp)
										cmpi.b  #2,((PLAYER_TYPE-$1000000)).w
										beq.w   loc_44262
										cmpi.b  #1,((PLAYER_TYPE-$1000000)).w
										beq.w   loc_441F0
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a1
loc_441D2:
										
										clr.w   d0
										move.b  (a0)+,d0
										cmpi.b  #$FF,d0
										beq.s   loc_441F0
										lsl.w   #5,d0
										move.w  d1,(a1,d0.w)
										move.w  d2,2(a1,d0.w)
										move.w  d1,$C(a1,d0.w)
										move.w  d2,$E(a1,d0.w)
										bra.s   loc_441D2
loc_441F0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $40                ; Raft is unlocked (0x05264)
										beq.w   loc_44262
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										cmp.b   ((RAM_Raft_MapIdx-$1000000)).w,d0
										bne.s   loc_44248
										move.b  ((RAM_Raft_X-$1000000)).w,d1
										move.b  ((RAM_Raft_Y-$1000000)).w,d2
										move.w  #$1F,d0
										andi.w  #$7F,d1 
										muls.w  #$180,d1
										andi.w  #$7F,d2 
										muls.w  #$180,d2
										moveq   #2,d3
										moveq   #$3D,d4 
										move.l  #eas_Standing,d5
										clr.w   d6
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										move.b  d0,$3F(a0)
										move.w  d0,d6
										bsr.w   DeclareNewEntity
										move.w  #$1F,d0
										move.w  d3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
										bra.s   loc_44262
loc_44248:
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										clr.b   $3F(a0)
										lea     ((byte_FFACE2-$1000000)).w,a0
										move.l  #$70007000,(a0)
										move.l  #$70007000,$C(a0)
loc_44262:
										
										movem.l (sp)+,d0-a1
										rts

	; End of function sub_441AA


; =============== S U B R O U T I N E =======================================

IsOverworldMap:
										
										movem.l d0-d1/a0,-(sp)
										clr.w   d1
										lea     OverworldMaps(pc), a0
loc_44272:
										
										move.b  (a0)+,d0
										bmi.w   loc_44282
										cmp.b   ((CURRENT_MAP-$1000000)).w,d0
										bne.s   loc_44280
										addq.w  #1,d1
loc_44280:
										
										bra.s   loc_44272
loc_44282:
										
										tst.w   d1
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function IsOverworldMap

OverworldMaps:      incbin "maps/global/overworldmaps.bin"

; =============== S U B R O U T I N E =======================================

sub_44298:
										
										cmpi.b  #$2E,((CURRENT_MAP-$1000000)).w 
																						; new granseal headquarters
										beq.w   return_44336
										cmpi.b  #$25,((CURRENT_MAP-$1000000)).w 
																						; nazca ship headquarters
										beq.w   return_44336
										movem.l a6,-(sp)
										lea     Followers(pc), a4
										lea     pt_eas_Followers(pc), a6
										lea     ((byte_FFAFB0-$1000000)).w,a5
										move.b  #1,(a5)
										trap    #TRAP_CHECKFLAG
										dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
										beq.s   loc_442D2
										bsr.s   IsOverworldMap
										beq.s   loc_442D2
										lea     OverworldFollowers(pc), a4
										lea     pt_eas_WorldmapFollowers(pc), a6
loc_442D2:
										
										cmpi.w  #$FFFF,(a4)
										beq.w   loc_44332
										movem.w d1,-(sp)
										clr.w   d1
										move.b  (a4),d1
										jsr     j_CheckFlag
										movem.w (sp)+,d1
										beq.s   loc_4432E
										move.w  d0,-(sp)
										clr.w   d0
										move.b  1(a4),d0
										cmpi.b  #$1E,d0
										bcc.s   loc_44302
										bsr.w   GetCharacterSpriteIdx
										bra.s   loc_44308
loc_44302:
										
										clr.w   d4
										move.b  2(a4),d4
loc_44308:
										
										move.w  (sp)+,d0
										clr.l   d6
										move.b  1(a4),d6
										tst.b   d6
										bpl.s   loc_44318
										subi.w  #$60,d6 
loc_44318:
										
										move.b  3(a4),(a5,d0.w)
										move.b  d0,(a1,d6.w)
										move.w  d0,d6
										move.l  (a6)+,d5
										bsr.w   DeclareNewEntity
										move.b  d0,(a3)+
										addq.w  #1,d0
loc_4432E:
										
										addq.l  #4,a4
										bra.s   loc_442D2
loc_44332:
										
										movem.l (sp)+,a6
return_44336:
										
										rts

	; End of function sub_44298

OverworldFollowers: incbin "data/overworldfollowers.bin"
Followers:          incbin "data/followers.bin"
pt_eas_Followers:   dc.l eas_Follower1      
										dc.l eas_Follower2      
										dc.l eas_Follower3      
										dc.l eas_Follower4      
										dc.l eas_Follower4      
pt_eas_WorldmapFollowers:
										dc.l eas_Follower1      ; when on worldmap
										dc.l eas_OverworldFollower2
										dc.l eas_OverworldFollower3
										dc.l eas_Follower2      
										dc.l eas_OverworldFollower5

; =============== S U B R O U T I N E =======================================

; initialize followers ?

sub_443B2:
										
										movem.l a6,-(sp)
										lea     Followers(pc), a4
										lea     pt_eas_Followers(pc), a6
										trap    #TRAP_CHECKFLAG
										dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
										beq.s   loc_443D2
										bsr.w   IsOverworldMap
										beq.s   loc_443D2
										lea     OverworldFollowers(pc), a4
										lea     pt_eas_WorldmapFollowers(pc), a6
loc_443D2:
										
										lea     ((byte_FFA922-$1000000)).w,a0
loc_443D6:
										
										cmpi.w  #$FFFF,(a4)
										beq.w   loc_443FE
										movem.w d1,-(sp)
										clr.w   d1
										move.b  (a4),d1
										jsr     j_CheckFlag
										movem.w (sp)+,d1
										beq.s   loc_443FA
										move.l  (a6)+,$14(a0)
										lea     $20(a0),a0
loc_443FA:
										
										addq.l  #4,a4
										bra.s   loc_443D6
loc_443FE:
										
										movem.l (sp)+,a6
										rts
loc_44404:
										
										cmpi.b  #2,((PLAYER_TYPE-$1000000)).w
										bne.s   loc_44420
										move.b  #$3D,((byte_FFA915-$1000000)).w 
										bsr.w   sub_4446C
										move.w  #$40,d1 
										move.w  d1,d2
										bra.w   loc_4443C
loc_44420:
										
										trap    #TRAP_CHECKFLAG
										dc.w $40                ; Raft is unlocked (0x05264)
										beq.w   return_4446A
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										cmp.b   ((RAM_Raft_MapIdx-$1000000)).w,d0
										bne.w   return_4446A
										move.b  ((RAM_Raft_X-$1000000)).w,d1
										move.b  ((RAM_Raft_Y-$1000000)).w,d2
loc_4443C:
										
										move.w  #$1F,d0
										andi.w  #$7F,d1 
										muls.w  #$180,d1
										andi.w  #$7F,d2 
										muls.w  #$180,d2
										moveq   #2,d3
										moveq   #$3D,d4 
										move.l  #eas_Standing,d5
										clr.w   d6
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										move.b  d0,$3F(a0)
										move.w  d0,d6
										bsr.w   DeclareNewEntity
return_4446A:
										
										rts

	; End of function sub_443B2


; =============== S U B R O U T I N E =======================================

sub_4446C:
										
										movem.l d0/a0-a1,-(sp)
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
										lea     eas_Standing(pc), a1
loc_44478:
										
										move.b  (a0)+,d0
										cmpi.b  #$FF,d0
										beq.s   loc_4449C
										movem.l a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #$60006000,(a0)
										move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										movem.l (sp)+,a0
										bra.s   loc_44478
loc_4449C:
										
										movem.l (sp)+,d0/a0-a1
										rts

	; End of function sub_4446C


; =============== S U B R O U T I N E =======================================

sub_444A2:
										
										link    a6,#-$10
										move.w  d0,-4(a6)
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
										bsr.w   GetCombatantSpriteIdx
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
										jsr     (BwahDMAstuffAgainbis).w
										jsr     (SetFFDE94b3andWait).w
										movem.l (sp)+,a0-a1
										movem.l (sp)+,d0-d7
										unlk    a6
										rts

	; End of function sub_444A2


; =============== S U B R O U T I N E =======================================

sub_44536:
										
										movem.l d0-d5/d7-a0,-(sp)
										move.w  d0,-(sp)
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
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
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										move.b  d0,(a0,d7.w)
										move.w  d0,d6
										bsr.w   DeclareNewEntity
										movem.l (sp)+,d0-d5/d7-a0
										rts

	; End of function sub_44536


; =============== S U B R O U T I N E =======================================

sub_44570:
										
										movem.l d0-a0,-(sp)
										move.w  d0,-(sp)
										tst.b   d0
										blt.s   loc_4457E
										bsr.w   GetCharacterSpriteIdx
loc_4457E:
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
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
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
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
										jsr     (sub_6052).w    
										movem.l (sp)+,d0-a0
										rts

	; End of function sub_44570


; =============== S U B R O U T I N E =======================================

; declare new entity ?

DeclareNewEntity:
										
										move.l  a0,-(sp)
										move.w  d0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
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
										move.l  (dword_FFB1A0).l,-(sp)
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

; clear entities in memory

ClearEntities:
										
										movem.l d7-a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
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
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										moveq   #$F,d7
loc_44688:
										
										clr.l   (a0)+
										dbf     d7,loc_44688
										move.l  #byte_FF5600,(dword_FFB1A0).l
										jsr     (sub_19B0).w
										movem.l (sp)+,d7-a0
										rts

	; End of function ClearEntities


; =============== S U B R O U T I N E =======================================

MoveEntitiesToBattlePositions:
										
										movem.l d0-a1,-(sp)
										link    a6,#-$10
										bsr.s   ClearEntities   
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a1
										moveq   #$1D,d7
										clr.w   -4(a6)
										clr.w   d0
loc_446B8:
										
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										jsr     j_GetYPos
										move.w  (sp)+,d0
										move.w  d1,d2
										tst.b   d2
										bmi.w   loc_44732
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										jsr     j_GetXPos
										move.w  (sp)+,d0
										tst.b   d1
										bmi.w   loc_44732
										movem.w d0-d1,-(sp)
										move.w  -4(a6),d0
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
										bsr.w   GetCombatantSpriteIdx
										move.w  d0,d6
										bsr.w   DeclareNewEntity
										move.b  d0,(a1)+
										addq.w  #1,d0
										bra.w   loc_44736
loc_44732:
										
										move.b  #$FF,(a1)+
loc_44736:
										
										addq.w  #1,-4(a6)
										dbf     d7,loc_446B8
										lea     ((byte_FFB160-$1000000)).w,a1
										moveq   #$1F,d7
										move.w  #$80,-4(a6) 
loc_4474A:
										
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										jsr     j_GetCharacterWord34
										move.w  (sp)+,d0
										andi.w  #8,d1
										bne.w   loc_447F6
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										jsr     j_GetYPos
										move.w  (sp)+,d0
										move.w  d1,d2
										tst.b   d2
										bmi.w   loc_447F6
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										jsr     j_GetXPos
										move.w  (sp)+,d0
										tst.b   d1
										bmi.w   loc_447F6
										movem.w d0-d1,-(sp)
										move.w  -4(a6),d0
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
										bsr.w   GetCombatantSpriteIdx
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
										
										addq.w  #1,-4(a6)
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
										
										move.w  #$9F,-4(a6) 
loc_4483E:
										
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_448BC
										move.w  d0,-(sp)
										move.w  -4(a6),d0
										clr.w   d1
										jsr     j_SetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_SetStatus
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
										
										subq.w  #1,-4(a6)
										bra.s   loc_4483E
loc_448BC:
										
										unlk    a6
										movem.l (sp)+,d0-a1
										rts

	; End of function MoveEntitiesToBattlePositions

   include "battles\global\battleneutralentities.asm"		; Battle entities which are not force members or enemies
   include "scripting\entityactscripts\eas_battleneutralentities.asm"		; Entity actscripts for battle entities which are not force members or enemies

; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
; Out: D4 = sprite idx
; 
; wtf I need to figure out that implementation, many strange exceptions

GetCharacterSpriteIdx:
										
										cmpi.w  #$1E,d0
										blt.s   loc_449D2
										move.w  d0,d4
										bra.w   return_44A5C
loc_449D2:
										
										movem.w d1,-(sp)
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_449F0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_449F0
										move.w  #$BE,d4 ; dead !
										bra.w   loc_44A5A
loc_449F0:
										
										cmpi.b  #$B,d0          ; Rhode !
										bne.s   loc_44A04
										trap    #TRAP_CHECKFLAG
										dc.w $B                 ; Rohde joined
										bne.s   loc_44A04
										move.w  #$AA,d4 
										bra.w   loc_44A5A
loc_44A04:
										
										move.w  d0,d4
										andi.w  #$1F,d4
										move.b  AllySprites(pc,d4.w),d4
										jsr     j_GetClass      
										cmpi.b  #$C,d1          ; HERO
										beq.w   loc_44A5A
										cmpi.b  #0,d1
										bne.s   loc_44A28
										subq.w  #1,d4           ; if SDMN, d4 = 0 ?
										bra.w   loc_44A5A
loc_44A28:
										
										cmpi.b  #$17,d1         ; BDBT ?
										bge.w   loc_44A5A
										cmpi.b  #6,d1           ; BDMN
										blt.s   loc_44A42
										cmpi.b  #$B,d1          ; TORT
										bgt.s   loc_44A42
										subq.w  #1,d4
										bra.w   loc_44A5A
loc_44A42:
										
										cmpi.b  #5,d1
										bgt.s   loc_44A4E
										subq.w  #2,d4
										bra.w   loc_44A5A
loc_44A4E:
										
										btst    #0,d1
										beq.s   loc_44A5A
										subq.w  #1,d4
										bra.w   *+4
loc_44A5A:
										
										move.w  (sp)+,d1
return_44A5C:
										
										rts

	; End of function GetCharacterSpriteIdx

AllySprites:        incbin "data/allies/allyspriteids.bin"
																						; sprite IDs for each force character in battle

; =============== S U B R O U T I N E =======================================

; In: A6 = battle vars stack ???
; Out: D4 = sprite idx

GetCombatantSpriteIdx:
										
										movem.w d0,-(sp)
										move.w  -4(a6),d0
										tst.b   d0
										blt.s   loc_44A8E
										bsr.w   GetCharacterSpriteIdx
										bra.s   loc_44A9E
loc_44A8E:
										
										move.w  d1,-(sp)
										jsr     j_GetEnemyID
										clr.w   d4
										move.b  EnemySprites(pc,d1.w),d4
										move.w  (sp)+,d1
loc_44A9E:
										
										movem.w (sp)+,d0
										rts

	; End of function GetCombatantSpriteIdx

EnemySprites:       incbin "data/enemies/enemyspriteids.bin"

; =============== S U B R O U T I N E =======================================

SetEntityActscript:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function SetEntityActscript


; =============== S U B R O U T I N E =======================================

SetControlledEntityActScript:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										tst.b   ((PLAYER_TYPE-$1000000)).w
										beq.s   loc_44B86
										cmpi.b  #1,((PLAYER_TYPE-$1000000)).w
										bne.s   loc_44B7C
										move.l  #eas_Raft,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										bra.s   loc_44B84
loc_44B7C:
										
										move.l  #eas_Caravan,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
loc_44B84:
										
										bra.s   loc_44B8E
loc_44B86:
										
										move.l  #eas_ControlledCharacter,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
loc_44B8E:
										
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function SetControlledEntityActScript


; =============== S U B R O U T I N E =======================================

sub_44B94:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_UnitCursorSpeedx2,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function sub_44B94


; =============== S U B R O U T I N E =======================================

SetUnitCursorActscript:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_UnitCursor,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function SetUnitCursorActscript


; =============== S U B R O U T I N E =======================================

sub_44BC0:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_44EF6,$14(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function sub_44BC0


; =============== S U B R O U T I N E =======================================

sub_44BD6:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_44F16,$14(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function sub_44BD6


; =============== S U B R O U T I N E =======================================

MakeEntityIdle:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_Idle,$14(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function MakeEntityIdle


; =============== S U B R O U T I N E =======================================

; set entity D0's movescript to 0x460ce (default? don't move?)

sub_44C02:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_Init,$14(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function sub_44C02


; =============== S U B R O U T I N E =======================================

SetEntityMovescriptToIdle:
										
										move.w  d0,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #eas_Standing,$14(a0)
										movea.l (sp)+,a0
										move.w  (sp)+,d0
										rts

	; End of function SetEntityMovescriptToIdle


; =============== S U B R O U T I N E =======================================

sub_44C2E:
										
										movem.l a0-a1,-(sp)
										move.w  d0,-(sp)
										bsr.w   GetEntityRAMAddress
										movea.l (dword_FFB1A0).l,a1
										move.l  a1,$14(a0)
										lea     eas_Follower1(pc), a0
										move.w  #$2A,d7 
										jsr     (CopyBytes).w   
										addi.l  #$2A,(dword_FFB1A0).l 
										move.w  d1,$1E(a1)
										move.w  d2,$20(a1)
										move.w  d3,$22(a1)
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
										move.w  (sp)+,d0
loc_44C6A:
										
										cmp.b   (a0),d0
										beq.w   loc_44C7E
										cmpi.b  #$FF,(a0)+
										bne.s   loc_44C6A
										move.b  d0,-1(a0)
										move.b  #$FF,(a0)
loc_44C7E:
										
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_44C2E


; =============== S U B R O U T I N E =======================================

sub_44C84:
										
										movem.l a0-a1,-(sp)
										move.w  d0,-(sp)
										bsr.w   GetEntityRAMAddress
										move.l  #$70007000,(a0)
										move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
										move.w  (sp)+,d0
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
										moveq   #$3F,d7 
loc_44CA0:
										
										cmp.b   (a0)+,d0
										bne.s   loc_44CAA
										move.b  #$FF,-1(a0)
loc_44CAA:
										
										dbf     d7,loc_44CA0
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
loc_44CB2:
										
										cmpi.b  #$FF,(a0)
										beq.w   loc_44CCA
										cmp.b   (a0)+,d0
										bne.s   loc_44CB2
loc_44CBE:
										
										move.b  (a0),-1(a0)
										bmi.w   loc_44CCA
										addq.l  #1,a0
										bra.s   loc_44CBE
loc_44CCA:
										
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_44C84


; =============== S U B R O U T I N E =======================================

SetWalkingActscript:
										
										move.w  d0,-(sp)
										movem.l a0-a1,-(sp)
										bsr.w   GetEntityRAMAddress
										movea.l (dword_FFB1A0).l,a1
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										lea     eas_Walking(pc), a0
										move.w  #$32,d7 
										jsr     (CopyBytes).w   
										addi.l  #$32,(dword_FFB1A0).l 
										move.w  d1,$22(a1)
										move.w  d2,$24(a1)
										move.w  d3,$26(a1)
										movem.l (sp)+,a0-a1
										move.w  (sp)+,d0
										rts

	; End of function SetWalkingActscript


; =============== S U B R O U T I N E =======================================

sub_44D0E:
										
										andi.l  #$FFFFFF,d5
										move.w  d0,-(sp)
										movem.l a0-a2,-(sp)
										bsr.w   GetEntityRAMAddress
										movea.l (dword_FFB1A0).l,a1
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										lea     eas_Walking(pc), a0
										move.w  #$20,d7 
										jsr     (CopyBytes).w   
										addi.l  #$20,(dword_FFB1A0).l 
										movea.l (dword_FFB1A0).l,a1
										movea.l d5,a2
										move.l  a1,d5
loc_44D48:
										
										clr.w   d1
										move.b  (a2)+,d1
										bmi.w   loc_44D90
										move.w  #4,(a1)+
										tst.b   d1
										bne.s   loc_44D5E
										move.l  #$10000,(a1)+
loc_44D5E:
										
										cmpi.b  #1,d1
										bne.s   loc_44D6A
										move.l  #$FFFF,(a1)+
loc_44D6A:
										
										cmpi.b  #2,d1
										bne.s   loc_44D76
										move.l  #$FFFF0000,(a1)+
loc_44D76:
										
										cmpi.b  #3,d1
										bne.s   loc_44D82
										move.l  #1,(a1)+
loc_44D82:
										
										move.w  #1,(a1)+
										move.w  #0,(a1)+
										move.w  #$A,(a1)+
										bra.s   loc_44D48
loc_44D90:
										
										move.w  #$34,(a1)+ 
										move.l  d5,(a1)+
										move.l  a1,(dword_FFB1A0).l
										movem.l (sp)+,a0-a2
										move.w  (sp)+,d0
										rts

	; End of function sub_44D0E


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx

WaitForEntityToStopMoving:
										
										movem.w d0-d7,-(sp)
										move.l  a0,-(sp)
										bsr.w   GetEntityRAMAddress
loc_44DAE:
										
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
										move.w  d2,d4
										move.w  d3,d5
										sub.w   d0,d4
										sub.w   d1,d5
										move.w  d5,d6
										or.w    d4,d6
										beq.s   loc_44DD0
										jsr     (WaitForVInt).w 
										bra.s   loc_44DAE
loc_44DD0:
										
										movea.l (sp)+,a0
										movem.w (sp)+,d0-d7
										rts

	; End of function WaitForEntityToStopMoving


; =============== S U B R O U T I N E =======================================

; location in memory of entity # D0 -> A0

GetEntityRAMAddress:
										
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
																						; start of entity information
										adda.w  d0,a0
										rts

	; End of function GetEntityRAMAddress

   include "scripting\entityactscripts\eas_main.asm"		; Main entity actscripts
										dc.w eas_Idle+$10000-word_45200

; =============== S U B R O U T I N E =======================================

; still to confirm

WaitForFollowersStopped:
										
										lea     ((byte_FFAF23-$1000000)).w,a0
										bsr.w   WaitForPartyEntitiesIdle
										rts

	; End of function WaitForFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm

WaitForHeroAndFollowersStopped:
										
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
										bsr.w   WaitForPartyEntitiesIdle
										rts

	; End of function WaitForHeroAndFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm

WaitForPartyEntitiesIdle:
										
										cmpi.b  #$FF,(a0)+
										beq.w   return_4524A
										jsr     (WaitForVInt).w 
loc_45224:
										
										cmpi.b  #$FF,(a0)+
										bne.s   loc_45224
										clr.w   d0
										move.b  -2(a0),d0
										movem.l d0/a0,-(sp)
										bsr.w   GetEntityRAMAddress
loc_45238:
										
										jsr     (WaitForVInt).w 
										cmpi.l  #eas_Idle,$14(a0)
										bne.s   loc_45238
										movem.l (sp)+,d0/a0
return_4524A:
										
										rts

	; End of function WaitForPartyEntitiesIdle


; =============== S U B R O U T I N E =======================================

; might be related to followers

ApplyActscriptToHeroAndFollowers:
										
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
										bra.w   ApplyActscriptToPartyEntities

	; End of function ApplyActscriptToHeroAndFollowers


; =============== S U B R O U T I N E =======================================

; to confirm

ApplyActscriptToFollowers:
										
										lea     ((byte_FFAF23-$1000000)).w,a0

	; End of function ApplyActscriptToFollowers


; START OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers

ApplyActscriptToPartyEntities:
										
										move.b  (a0)+,d0
										cmpi.b  #$FF,d0
										beq.s   return_45266
										bsr.w   SetEntityActscript
										bra.s   ApplyActscriptToPartyEntities
return_45266:
										
										rts

; END OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers


; =============== S U B R O U T I N E =======================================

; related to Caravan ... warp into Caravan ?

sub_45268:
										
										clr.w   d0
										bsr.w   MakeEntityIdle
										lea     byte_45284(pc), a0
										trap    #6
										lea     word_45316(pc), a1
										bsr.s   ApplyActscriptToFollowers
										bsr.s   WaitForFollowersStopped
										move.b  #1,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_45268

   include "scripting\mapscripts\ms_caravanin.asm"		; Mapscript for getting into Caravan ?

; =============== S U B R O U T I N E =======================================

sub_45322:
										
										clr.w   d0
										bsr.w   MakeEntityIdle
										lea     word_45348(pc), a0
										trap    #6
										lea     word_45368(pc), a1
										bsr.w   ApplyActscriptToFollowers
										bsr.w   WaitForFollowersStopped
										jsr     sub_443B2       
										move.b  #0,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_45322

   include "scripting\mapscripts\ms_caravanout.asm"		; Mapscript for getting out of Caravan ?

; =============== S U B R O U T I N E =======================================

sub_453C6:
										
										bsr.w   sub_454AC
										bne.w   return_453F0
										clr.w   d0
										bsr.w   MakeEntityIdle
										clr.b   ((byte_FFAFB0-$1000000)).w
										lea     byte_453F2(pc), a0
										trap    #6
										lea     word_45434(pc), a1
										bsr.w   ApplyActscriptToHeroAndFollowers
										bsr.w   WaitForHeroAndFollowersStopped
										move.b  #2,((PLAYER_TYPE-$1000000)).w
return_453F0:
										
										rts

	; End of function sub_453C6

   include "scripting\mapscripts\ms_raftin.asm"		; Mapscript for getting into Raft ?

; =============== S U B R O U T I N E =======================================

sub_45440:
										
										bsr.w   sub_454E4
										clr.w   d0
										bsr.w   MakeEntityIdle
										move.b  #1,((byte_FFAFB0-$1000000)).w
										lea     byte_45470(pc), a0
										trap    #6
										lea     word_45488(pc), a1
										bsr.w   ApplyActscriptToHeroAndFollowers
										bsr.w   WaitForHeroAndFollowersStopped
										jsr     sub_443B2       
										move.b  #0,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_45440

   include "scripting\mapscripts\ms_raftout.asm"		; Mapscript for getting out of Raft ?

; =============== S U B R O U T I N E =======================================

sub_454AC:
										
										movem.l d0-d1/a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										move.w  $C(a0),d0
										move.w  $E(a0),d1
										clr.w   d3
										move.b  $10(a0),d3
										lsl.w   #2,d3
										add.w   word_4549C(pc,d3.w),d0
										add.w   word_4549E(pc,d3.w),d1
										sub.w   $3EC(a0),d0
										bpl.s   loc_454D4
										neg.w   d0
loc_454D4:
										
										sub.w   $3EE(a0),d1
										bpl.s   loc_454DC
										neg.w   d1
loc_454DC:
										
										add.w   d1,d0
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function sub_454AC


; =============== S U B R O U T I N E =======================================

sub_454E4:
										
										movem.l d0-d1/a0,-(sp)
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a0
										move.w  $C(a0),d0
										move.w  $E(a0),d1
										ext.l   d0
										ext.l   d1
										divs.w  #$180,d0
										divs.w  #$180,d1
										move.b  ((CURRENT_MAP-$1000000)).w,((RAM_Raft_MapIdx-$1000000)).w
										move.b  d0,((RAM_Raft_X-$1000000)).w
										move.b  d1,((RAM_Raft_Y-$1000000)).w
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function sub_454E4


; =============== S U B R O U T I N E =======================================

sub_45514:
										
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										clr.w   d0
										bsr.w   MakeEntityIdle
										moveq   #1,d0
										bsr.w   MakeEntityIdle
										lea     byte_45546(pc), a0
										trap    #6
										lea     eas_ShrinkIn(pc), a1
										bsr.w   ApplyActscriptToFollowers
										bsr.w   WaitForFollowersStopped
										move.b  #1,((PLAYER_TYPE-$1000000)).w
										moveq   #3,d0
										jsr     (Sleep).w       
										rts

	; End of function sub_45514

   include "scripting\mapscripts\ms_shrinkin.asm"		; Mapscript for shrinking in ?

; =============== S U B R O U T I N E =======================================

; warp out ?

sub_455AC:
										
										clr.w   d0
										bsr.w   MakeEntityIdle
										lea     byte_455D2(pc), a0
										trap    #6
										lea     eas_GrowOut(pc), a1
										bsr.w   ApplyActscriptToFollowers
										bsr.w   WaitForFollowersStopped
										jsr     sub_443B2       
										move.b  #0,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_455AC

   include "scripting\mapscripts\ms_growout.asm"		; Mapscript for growing out ?

; =============== S U B R O U T I N E =======================================

sub_45634:
										
										clr.w   d0
										rts

	; End of function sub_45634


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
; Out: D1 = portrait idx
;      D2 = speech sound idx

GetEntityPortraitAndSpeechSound:
										
										movem.l d0/a0/a5,-(sp)
										andi.w  #$FF,d0
										clr.w   d1
										clr.w   d2
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  $13(a5),d0      ; sprite number
										lea     SpriteToPortraitnBlip(pc), a0
loc_45650:
										
										cmp.b   (a0),d0         ; get sprite's owner (it implies that each force member has a unique sprite !!)
										bne.s   loc_45662
										move.b  1(a0),d1        ; get portrait index
										ext.w   d1
										move.b  2(a0),d2        ; get blip sound index
										bra.w   loc_45674
loc_45662:
										
										adda.w  #4,a0
										cmpi.w  #$FFFF,(a0)
										bne.s   loc_45650       
										move.w  #$FFFF,d1       ; default portrait and blip
										move.w  #$4A,d2 
loc_45674:
										
										movem.l (sp)+,d0/a0/a5
										rts

	; End of function GetEntityPortraitAndSpeechSound

SpriteToPortraitnBlip:
										incbin "data/spritedialogdefs.bin"
																						; bowie

; =============== S U B R O U T I N E =======================================

sub_45858:
										
										movem.l d0-d1/d5-a0,-(sp)
										link    a6,#-$240
										move.w  #1,d7
loc_45864:
										
										move.w  #8,d6
loc_45868:
										
										move.w  #3,d5
loc_4586C:
										
										move.b  3(a0),d0
										lsl.b   #4,d0
										move.b  7(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.w   #8,d0
										move.b  $B(a0),d0
										lsl.b   #4,d0
										move.b  $F(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $13(a0),d0
										lsl.b   #4,d0
										move.b  $17(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $1B(a0),d0
										lsl.b   #4,d0
										move.b  $1F(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										move.l  d0,-(a6)
										move.b  3(a0),d0
										andi.b  #$F0,d0
										move.b  7(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.w   #8,d0
										move.b  $B(a0),d0
										andi.b  #$F0,d0
										move.b  $F(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $13(a0),d0
										andi.b  #$F0,d0
										move.b  $17(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $1B(a0),d0
										andi.b  #$F0,d0
										move.b  $1F(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										move.l  d0,-(a6)
										subq.l  #1,a0
										dbf     d5,loc_4586C
										adda.l  #$24,a0 
										dbf     d6,loc_45868
										dbf     d7,loc_45864
										move.w  #1,d7
loc_45914:
										
										move.l  #$E0,d0 
										bsr.w   sub_45B0E
										move.l  #$80,d0 
										bsr.w   sub_45B0E
										moveq   #$20,d0 
										bsr.w   sub_45B0E
										move.l  #$100,d0
										bsr.w   sub_45B0E
										move.l  #$A0,d0 
										bsr.w   sub_45B0E
										moveq   #$40,d0 
										bsr.w   sub_45B0E
										move.l  #$120,d0
										bsr.w   sub_45B0E
										move.l  #$C0,d0 
										bsr.w   sub_45B0E
										moveq   #$60,d0 
										bsr.w   sub_45B0E
										adda.l  #$120,a6
										dbf     d7,loc_45914
										unlk    a6
										movem.l (sp)+,d0-d1/d5-a0
										rts

	; End of function sub_45858


; =============== S U B R O U T I N E =======================================

sub_45974:
										
										movem.l d0-d1/d5-a0,-(sp)
										link    a6,#-$240
										move.w  #1,d7
loc_45980:
										
										move.w  #8,d6
loc_45984:
										
										move.w  #3,d5
loc_45988:
										
										move.b  $1C(a0),d0
										andi.b  #$F0,d0
										move.b  $18(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.w   #8,d0
										move.b  $14(a0),d0
										andi.b  #$F0,d0
										move.b  $10(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $C(a0),d0
										andi.b  #$F0,d0
										move.b  8(a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  4(a0),d0
										andi.b  #$F0,d0
										move.b  (a0),d1
										lsr.b   #4,d1
										or.b    d1,d0
										move.l  d0,-(a6)
										move.b  $1C(a0),d0
										lsl.b   #4,d0
										move.b  $18(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.w   #8,d0
										move.b  $14(a0),d0
										lsl.b   #4,d0
										move.b  $10(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  $C(a0),d0
										lsl.b   #4,d0
										move.b  8(a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										lsl.l   #8,d0
										move.b  4(a0),d0
										lsl.b   #4,d0
										move.b  (a0),d1
										andi.b  #$F,d1
										or.b    d1,d0
										move.l  d0,-(a6)
										addq.l  #1,a0
										dbf     d5,loc_45988
										adda.l  #$1C,a0
										dbf     d6,loc_45984
										dbf     d7,loc_45980
										move.w  #1,d7
loc_45A2C:
										
										moveq   #$60,d0 
										bsr.w   sub_45B0E
										move.l  #$C0,d0 
										bsr.w   sub_45B0E
										move.l  #$120,d0
										bsr.w   sub_45B0E
										moveq   #$40,d0 
										bsr.w   sub_45B0E
										move.l  #$A0,d0 
										bsr.w   sub_45B0E
										move.l  #$100,d0
										bsr.w   sub_45B0E
										moveq   #$20,d0 
										bsr.w   sub_45B0E
										move.l  #$80,d0 
										bsr.w   sub_45B0E
										move.l  #$E0,d0 
										bsr.w   sub_45B0E
										adda.l  #$120,a6
										dbf     d7,loc_45A2C
										unlk    a6
										movem.l (sp)+,d0-d1/d5-a0
										rts

	; End of function sub_45974


; =============== S U B R O U T I N E =======================================

sub_45A8C:
										
										movem.l d0-a0,-(sp)
										link    a6,#-$240
										move.w  #$8F,d7 
loc_45A98:
										
										move.l  (a0)+,-(a6)
										dbf     d7,loc_45A98
										move.w  #1,d7
loc_45AA2:
										
										moveq   #$20,d0 
										bsr.w   sub_45B0E
										bsr.w   sub_45B30
										moveq   #$40,d0 
										bsr.w   sub_45B0E
										moveq   #$60,d0 
										bsr.w   sub_45B0E
										move.l  #$80,d0 
										bsr.w   sub_45B0E
										bsr.w   sub_45B64
										move.l  #$A0,d0 
										bsr.w   sub_45B0E
										move.l  #$C0,d0 
										bsr.w   sub_45B0E
										move.l  #$E0,d0 
										bsr.w   sub_45B0E
										bsr.w   sub_45B30
										move.l  #$100,d0
										bsr.w   sub_45B0E
										move.l  #$120,d0
										bsr.w   sub_45B0E
										adda.l  #$120,a6
										dbf     d7,loc_45AA2
										unlk    a6
										movem.l (sp)+,d0-a0
										rts

	; End of function sub_45A8C


; =============== S U B R O U T I N E =======================================

sub_45B0E:
										
										move.l  -$20(a6,d0.l),-(a0)
										move.l  -$1C(a6,d0.l),-(a0)
										move.l  -$18(a6,d0.l),-(a0)
										move.l  -$14(a6,d0.l),-(a0)
										move.l  -$10(a6,d0.l),-(a0)
										move.l  -$C(a6,d0.l),-(a0)
										move.l  -8(a6,d0.l),-(a0)
										move.l  -4(a6,d0.l),-(a0)
										rts

	; End of function sub_45B0E


; =============== S U B R O U T I N E =======================================

sub_45B30:
										
										movem.l a0,-(sp)
										move.w  #$1F,d6
loc_45B38:
										
										move.b  (a0),d1
										andi.b  #$F0,d1
										cmpi.b  #$20,d1 
										bne.s   loc_45B48
										andi.b  #$F,(a0)
loc_45B48:
										
										move.b  (a0),d1
										andi.b  #$F,d1
										cmpi.b  #2,d1
										bne.s   loc_45B58
										andi.b  #$F0,(a0)
loc_45B58:
										
										addq.l  #1,a0
										dbf     d6,loc_45B38
										movem.l (sp)+,a0
										rts

	; End of function sub_45B30


; =============== S U B R O U T I N E =======================================

sub_45B64:
										
										movem.l a0,-(sp)
										move.w  #$F,d6
loc_45B6C:
										
										move.w  (a0),d1
										cmpi.w  #$2222,d1
										bne.s   loc_45B78
										andi.w  #0,(a0)
loc_45B78:
										
										addq.l  #2,a0
										dbf     d6,loc_45B6C
										movem.l (sp)+,a0
										rts

	; End of function sub_45B64


; =============== S U B R O U T I N E =======================================

sub_45B84:
										
										movem.l d0-d1/d7-a0,-(sp)
										move.w  #$23F,d7
loc_45B8C:
										
										move.b  (a0),d0
										move.b  d0,d1
										andi.b  #$F,d0
										cmpi.b  #2,d0
										bne.s   loc_45B9E
										moveq   #1,d0
										bra.s   loc_45BA0
loc_45B9E:
										
										clr.w   d0
loc_45BA0:
										
										andi.b  #$F0,d1
										cmpi.b  #$20,d1 
										bne.s   loc_45BAE
										moveq   #$10,d1
										bra.s   loc_45BB0
loc_45BAE:
										
										clr.w   d1
loc_45BB0:
										
										move.b  d0,(a0)
										or.b    d1,(a0)+
										dbf     d7,loc_45B8C
										movem.l (sp)+,d0-d1/d7-a0
										rts

	; End of function sub_45B84


; =============== S U B R O U T I N E =======================================

sub_45BBE:
										
										movem.l d0-a5,-(sp)
										link    a6,#-$240
										movea.l a6,a1
										move.w  #$8F,d7 
										moveq   #0,d1
loc_45BCE:
										
										move.l  d1,-(a1)
										dbf     d7,loc_45BCE
										movea.l a0,a4
										movea.l a1,a5
										tst.w   d0
										bne.s   loc_45BDE
										addq.w  #1,d0
loc_45BDE:
										
										move.l  #$1800,d4
										divu.w  d0,d4
										move.w  #$18,d5
										sub.w   d0,d5
										lsr.w   #1,d5
										move.w  d5,d6
										add.w   d0,d6
										lea     byte_45C6A(pc), a0
										moveq   #1,d7
loc_45BF8:
										
										move.w  d5,d2
loc_45BFA:
										
										move.w  d2,d0
										sub.w   d5,d0
										mulu.w  d4,d0
										lsr.w   #6,d0
										andi.w  #$FFFC,d0
										movea.l a4,a2
										adda.w  d0,a2
										move.w  d2,d0
										add.w   d5,d0
										lsl.w   #2,d0
										movea.l a5,a3
										adda.w  d0,a3
										clr.w   d0
										move.w  d5,d1
loc_45C18:
										
										move.w  d1,d3
										sub.w   d5,d3
										mulu.w  d4,d3
										lsr.w   #8,d3
										move.b  (a0,d3.w),d3
										move.b  (a0,d1.w),d0
										move.b  (a2,d3.w),d3
										btst    #0,d1
										bne.s   loc_45C38
										andi.b  #$F0,d3
										bra.s   loc_45C3C
loc_45C38:
										
										andi.b  #$F,d3
loc_45C3C:
										
										or.b    d3,(a3,d0.w)
										addq.w  #1,d1
										cmp.w   d6,d1
										bcs.s   loc_45C18
										addq.w  #1,d2
										cmp.w   d6,d2
										bcs.s   loc_45BFA
										adda.w  #$120,a4
										adda.w  #$120,a5
										dbf     d7,loc_45BF8
										move.w  #$8F,d7 
loc_45C5C:
										
										move.l  -(a5),-(a4)
										dbf     d7,loc_45C5C
										unlk    a6
										movem.l (sp)+,d0-a5
										rts

	; End of function sub_45BBE

byte_45C6A:         dc.b 0
										dc.b   0
										dc.b   1
										dc.b   1
										dc.b   2
										dc.b   2
										dc.b   3
										dc.b   3
										dc.b $60 
										dc.b $60 
										dc.b $61 
										dc.b $61 
										dc.b $62 
										dc.b $62 
										dc.b $63 
										dc.b $63 
										dc.b $C0 
										dc.b $C0 
										dc.b $C1 
										dc.b $C1 
										dc.b $C2 
										dc.b $C2 
										dc.b $C3 
										dc.b $C3 

; =============== S U B R O U T I N E =======================================

sub_45C82:
										
										movem.l d0-d1,-(sp)
										moveq   #$A,d0
										moveq   #$B,d1
										bsr.w   sub_45CA6
										movem.l (sp)+,d0-d1
										rts

	; End of function sub_45C82


; =============== S U B R O U T I N E =======================================

sub_45C94:
										
										movem.l d0-d1,-(sp)
										moveq   #1,d0
										moveq   #$B,d1
										bsr.w   sub_45CA6
										movem.l (sp)+,d0-d1
										rts

	; End of function sub_45C94


; =============== S U B R O U T I N E =======================================

sub_45CA6:
										
										movem.l d7-a1,-(sp)
										move.w  d1,d7
										lsl.w   #2,d7
										adda.w  d7,a0
										movea.l a0,a1
										move.w  d0,d7
										lsl.w   #2,d7
										adda.w  d7,a1
										move.w  d1,d7
										bmi.w   loc_45D16
loc_45CBE:
										
										move.l  (a0),(a1)
										move.l  $60(a0),$60(a1)
										move.l  $C0(a0),$C0(a1)
										move.l  $120(a0),$120(a1)
										move.l  $180(a0),$180(a1)
										move.l  $1E0(a0),$1E0(a1)
										suba.l  #4,a0
										suba.l  #4,a1
										dbf     d7,loc_45CBE
										move.w  d0,d7
										subq.w  #1,d7
										bcs.w   loc_45D16
loc_45CF6:
										
										clr.l   (a1)
										clr.l   $60(a1)
										clr.l   $C0(a1)
										clr.l   $120(a1)
										clr.l   $180(a1)
										clr.l   $1E0(a1)
										suba.l  #4,a1
										dbf     d7,loc_45CF6
loc_45D16:
										
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_45CA6


; =============== S U B R O U T I N E =======================================

sub_45D1C:
										
										movem.l d1-d7,-(sp)
										moveq   #0,d2
										moveq   #0,d4
										moveq   #$B,d7
loc_45D26:
										
										moveq   #8,d1
										moveq   #7,d3
										moveq   #7,d6
loc_45D2C:
										
										bsr.w   sub_45DA4
										addq.w  #1,d1
										addq.w  #1,d3
										dbf     d6,loc_45D2C
										addq.w  #1,d2
										addq.w  #1,d4
										dbf     d7,loc_45D26
										movem.l (sp)+,d1-d7
										rts

	; End of function sub_45D1C


; =============== S U B R O U T I N E =======================================

sub_45D46:
										
										movem.l d1-d7,-(sp)
										moveq   #0,d2
										moveq   #0,d4
										moveq   #$B,d7
loc_45D50:
										
										moveq   #$F,d1
										moveq   #$10,d3
										moveq   #7,d6
loc_45D56:
										
										bsr.w   sub_45DA4
										subq.w  #1,d1
										subq.w  #1,d3
										dbf     d6,loc_45D56
										addq.w  #1,d2
										addq.w  #1,d4
										dbf     d7,loc_45D50
										movem.l (sp)+,d1-d7
										rts

	; End of function sub_45D46


; =============== S U B R O U T I N E =======================================

sub_45D70:
										
										movem.l d1-d7,-(sp)
										moveq   #$B,d2
										moveq   #$C,d4
										moveq   #$B,d7
loc_45D7A:
										
										moveq   #7,d1
										moveq   #7,d3
										moveq   #9,d6
loc_45D80:
										
										bsr.w   sub_45DA4
										addq.w  #1,d1
										addq.w  #1,d3
										dbf     d6,loc_45D80
										subq.w  #1,d2
										subq.w  #1,d4
										dbf     d7,loc_45D7A
										clr.l   (a0)
										clr.l   $60(a0)
										clr.l   $C0(a0)
										movem.l (sp)+,d1-d7
										rts

	; End of function sub_45D70


; =============== S U B R O U T I N E =======================================

sub_45DA4:
										
										movem.l d1-d4/a1-a3,-(sp)
										lea     byte_45C6A(pc), a3
										movea.l a0,a1
										lsl.w   #2,d2
										adda.w  d2,a1
										move.b  (a3,d1.w),d2
										adda.w  d2,a1
										movea.l a0,a2
										lsl.w   #2,d4
										adda.w  d4,a2
										move.b  (a3,d3.w),d4
										adda.w  d4,a2
										move.b  (a1),d2
										move.b  $120(a1),d4
										btst    #0,d1
										bne.s   loc_45DD6
										lsr.w   #4,d2
										lsr.w   #4,d4
										bra.s   loc_45DDE
loc_45DD6:
										
										andi.b  #$F,d2
										andi.b  #$F,d4
loc_45DDE:
										
										btst    #0,d3
										bne.s   loc_45DFA
										lsl.w   #4,d2
										andi.b  #$F,(a2)
										add.b   d2,(a2)
										lsl.w   #4,d4
										andi.b  #$F,$120(a2)
										add.b   d4,$120(a2)
										bra.s   loc_45E0A
loc_45DFA:
										
										andi.b  #$F0,(a2)
										add.b   d2,(a2)
										andi.b  #$F0,$120(a2)
										add.b   d4,$120(a2)
loc_45E0A:
										
										movem.l (sp)+,d1-d4/a1-a3
										rts

	; End of function sub_45DA4


; =============== S U B R O U T I N E =======================================

sub_45E10:
										
										movem.l d0-d3/d7-a0,-(sp)
										moveq   #$FFFFFFFF,d1
										moveq   #$FFFFFFFF,d2
										move.l  #$FFFFFFF,d3
loc_45E1E:
										
										lsr.w   #1,d0
										bcc.s   loc_45E24
										and.l   d3,d1
loc_45E24:
										
										btst    #7,d0
										beq.s   loc_45E2C
										and.l   d3,d2
loc_45E2C:
										
										ror.l   #4,d3
										tst.w   d0
										bne.s   loc_45E1E
										move.w  #$8F,d7 
loc_45E36:
										
										and.l   d1,(a0)+
										and.l   d2,(a0)+
										dbf     d7,loc_45E36
										movem.l (sp)+,d0-d3/d7-a0
										rts

	; End of function sub_45E10

   include "scripting\entityactscripts\eas_actions.asm"		; Entity scripts for cutscene actions

; =============== S U B R O U T I N E =======================================

csc32_setCameraDestInTiles:
										
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										nop
										move.w  (a6)+,d2
										move.w  (a6)+,d3
										jsr     j_SetCameraDestInTiles
										jsr     (WaitForCameraToCatchUp).w
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
										move.w  #$FFFF,d2
										bra.s   loc_46550
loc_46546:
										
										move.w  d0,(word_FFA80C).l
										bra.w   return_46564
loc_46550:
										
										move.w  #$28,d0 
loc_46554:
										
										add.w   d2,d1
										move.w  d1,(word_FFA80C).l
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
										jsr     (sub_3DB0).w
										bset    #0,(byte_FFA82D).l
										bset    #1,(byte_FFA82D).l
										rts

	; End of function csc34_setBlocks


; =============== S U B R O U T I N E =======================================

; similar to setBlocks

csc35_:
										move.w  (a6)+,d0
										move.w  (a6)+,d1
										move.w  (a6)+,d2
										jsr     (sub_3DB0).w
										rts

	; End of function csc35_


; =============== S U B R O U T I N E =======================================

; related to loading a map

csc36_:
										move.l  a6,-(sp)
										jsr     (sub_3E06).l
										movea.l (sp)+,a6
										rts

	; End of function csc36_


; =============== S U B R O U T I N E =======================================

csc37_loadMapAndFadeIn:
										
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   (unk_FFDFAA).l  
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w

	; End of function csc37_loadMapAndFadeIn


; =============== S U B R O U T I N E =======================================

csc48_loadMap:
										
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										nop
										move.w  (a6),d1
										jsr     (LoadMapTilesets).w
loc_465C4:
										
										jsr     (WaitForVInt).w 
										tst.b   ((FADING_SETTING-$1000000)).w
										bne.s   loc_465C4
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										clr.l   d0
										move.w  (a6)+,d1
										move.w  (a6)+,d0
										lsl.w   #8,d0
										move.w  (a6)+,d2
										andi.w  #$FF,d2
										or.w    d2,d0
										mulu.w  #3,d0
										move.l  a6,-(sp)
										jsr     (LoadMap).w     
										movea.l (sp)+,a6
										jsr     (EnableDisplayAndInterrupts).w
										trap    #TRAP_VINTFUNCTIONS
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
										moveq   #9,d2
										jsr     LaunchFading(pc)
										nop
										rts

	; End of function csc3D_tintMap


; =============== S U B R O U T I N E =======================================

csc3E_:
										moveq   #1,d0
										moveq   #6,d1
										moveq   #$A,d2
										jsr     LaunchFading(pc)
										nop
										rts

	; End of function csc3E_


; =============== S U B R O U T I N E =======================================

csc3F_fadeMapOutToWhite:
										
										moveq   #1,d0
										moveq   #1,d1
										moveq   #4,d2
										jsr     LaunchFading(pc)
										nop
										rts

	; End of function csc3F_fadeMapOutToWhite


; =============== S U B R O U T I N E =======================================

csc40_fadeMapInFromWhite:
										
										moveq   #1,d0
										moveq   #1,d1
										moveq   #3,d2
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
										moveq   #$B,d2
loc_4667A:
										
										jsr     LaunchFading(pc)
										nop
										dbf     d7,loc_4667A
										jsr     (DuplicatePalettes).w
										rts

	; End of function csc41_flashScreenWhite


; =============== S U B R O U T I N E =======================================

csc42_:
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										jsr     (DisableDisplayAndVInt).w
										movea.l (a6)+,a0
										move.w  (a0)+,d1
										move.w  (a0)+,d2
										move.w  (a0)+,d3
										jsr     InitMapEntities
										jsr     (LoadMapEntitySprites).w
										jsr     (EnableDisplayAndInterrupts).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l 0
										rts

	; End of function csc42_


; =============== S U B R O U T I N E =======================================

csc43_:
										move.w  (a6)+,d0
										move.w  (a6)+,d1
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										jsr     (PerformMapBlockCopyScript).w
										rts

	; End of function csc43_


; =============== S U B R O U T I N E =======================================

csc44_:
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										moveq   #0,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										moveq   #0,d1
										move.w  (a5),d1
										divu.w  #$180,d1
										moveq   #0,d2
										move.w  ENTITYDEF_OFFSET_Y(a5),d2
										divu.w  #$180,d2
										clr.w   d3
										move.b  ENTITYDEF_OFFSET_FACING(a5),d3
										movea.l (a6)+,a0
										jsr     InitMapEntities
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l 0
										rts

	; End of function csc44_


; =============== S U B R O U T I N E =======================================

; related to camera adjust to lpayer

csc45_:
										move.w  (a6)+,((word_FFB194-$1000000)).w
										nop
										rts

	; End of function csc45_


; =============== S U B R O U T I N E =======================================

csc46_:
										move.b  #$FF,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										nop
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										clr.l   d0
										moveq   #$FFFFFFFF,d1
										move.w  (a6)+,d0
										lsl.w   #8,d0
										move.w  (a6)+,d2
										andi.w  #$FF,d2
										or.w    d2,d0
										mulu.w  #3,d0
										move.l  a6,-(sp)
										jsr     (LoadMap).w     
										movea.l (sp)+,a6
										jsr     (EnableDisplayAndInterrupts).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l 0
										jsr     (WaitForVInt).w 
										rts

	; End of function csc46_


; =============== S U B R O U T I N E =======================================

csc47_:
										move.w  (a6)+,d0
										move.w  (a6)+,d1
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										jsr     (sub_3E40).w
										rts

	; End of function csc47_


; =============== S U B R O U T I N E =======================================

csc49_:
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										jsr     (DisableDisplayAndVInt).w
										jsr     GetMapSetupEntityList
										move.w  (a6)+,d1
										move.w  (a6)+,d2
										move.w  (a6)+,d3
										jsr     j_InitMapEntities
										jsr     (LoadMapEntitySprites).w
										jsr     (EnableDisplayAndInterrupts).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l 0
										rts

	; End of function csc49_


; =============== S U B R O U T I N E =======================================

csc4A_fadeInFromBlackHalf:
										
										moveq   #$F,d0
										moveq   #6,d1
										moveq   #$E,d2
										jsr     LaunchFading(pc)
										nop
										rts

	; End of function csc4A_fadeInFromBlackHalf


; =============== S U B R O U T I N E =======================================

csc4B_fadeOutToBlackHalf:
										
										moveq   #$F,d0
										moveq   #6,d1
										moveq   #$F,d2
										jsr     LaunchFading(pc)
										nop
										rts

	; End of function csc4B_fadeOutToBlackHalf


; =============== S U B R O U T I N E =======================================

LaunchFading:
										
										move.b  d3,-(sp)
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,d3
										clr.w   (unk_FFDFAA).l  
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  d0,((FADING_PALETTE_FLAGS-$1000000)).w
										move.b  d1,((FADING_COUNTER_MAX-$1000000)).w
										move.b  d2,((FADING_SETTING-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
loc_467C6:
										
										jsr     (WaitForVInt).w 
										tst.b   ((FADING_SETTING-$1000000)).w
										bne.s   loc_467C6
										jsr     (WaitForVInt).w 
										move.b  d3,((FADING_COUNTER_MAX-$1000000)).w
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										move.b  (sp)+,d3
										rts

	; End of function LaunchFading


; =============== S U B R O U T I N E =======================================

csc2D_moveEntity:
										
										move.b  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
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
										andi.w  #$F,d1
										add.w   d1,d1
										move.w  rjt_EntityMoveCommands(pc,d1.w),d1
										jsr     rjt_EntityMoveCommands(pc,d1.w)
										bra.s   loc_467FC

	; End of function csc2D_moveEntity

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
										dc.w loc_468F2-rjt_EntityMoveCommands
																						; related to face down
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


; START OF FUNCTION CHUNK FOR csc2D_moveEntity

loc_46928:
										
										move.w  #$34,(a0)+ 
										move.l  #eas_Idle,(a0)+ 
										addq.l  #1,a6
										move.l  a0,(dword_FFB1A4).l
										move.l  d0,$14(a5)
										tst.b   d4
										beq.w   return_4694E
loc_46944:
										
										cmpi.l  #eas_Idle,$14(a5)
										bne.s   loc_46944
return_4694E:
										
										rts

; END OF FUNCTION CHUNK FOR csc2D_moveEntity


; =============== S U B R O U T I N E =======================================

csc14_setEntityActscriptManual:
										
										move.b  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  d0,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a5)
																						; timer for next actscript read
										move.b  (a6)+,d0
										move.l  a6,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
																						; address of new actscript
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
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
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
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
loc_469A0:
										
										cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a5)
										bne.s   loc_469A0
										rts

	; End of function csc16_waitUntilEntityIdle


; =============== S U B R O U T I N E =======================================

; make entity flash progressively faster, and set new pos-dest-facing

csc17_setEntityPosAndFacingWithFlash:
										
										move.b  (a6),d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  (a5),d1
										move.w  #$FE80,d2
										moveq   #$1E,d7
loc_469BA:
										
										move.w  d2,(a5)
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										move.w  d1,(a5)
										move.w  d7,d0
										subi.w  #$F,d0
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
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  (a6)+,d7
										lsr.w   #2,d7
loc_469E8:
										
										ori.b   #4,ENTITYDEF_OFFSET_FLAGS_B(a5)
										bsr.w   UpdateEntitySprite_0
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										andi.b  #$FB,ENTITYDEF_OFFSET_FLAGS_B(a5)
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
										bsr.w   AdjustScriptPointerByCharAliveStatus
										move.b  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										moveq   #0,d0           ; set new pos-dest, and facing
										move.b  (a6)+,d0
										mulu.w  #$180,d0
										move.w  d0,(a5)
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a5)
										moveq   #0,d0
										move.b  (a6)+,d0
										mulu.w  #$180,d0
										move.w  d0,ENTITYDEF_OFFSET_Y(a5)
										move.w  d0,ENTITYDEF_OFFSET_YDEST(a5)
										move.b  (a6)+,ENTITYDEF_OFFSET_FACING(a5)
										bsr.w   UpdateEntitySprite_0
										rts

	; End of function csc19_setEntityPosAndFacing


; =============== S U B R O U T I N E =======================================

csc1A_setEntitySprite:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  (a6)+,d0
										cmpi.w  #$1E,d0
										bcc.s   loc_46A5E
										jsr     GetCharacterSpriteIdx
										move.w  d4,d0
loc_46A5E:
										
										move.b  d0,$13(a5)
										jsr     (WaitForVInt).w 
										bsr.w   UpdateEntitySprite_0
										rts

	; End of function csc1A_setEntitySprite


; =============== S U B R O U T I N E =======================================

; if character xxxx dead, then do it to entity yyyy ?!

csc1B_startEntityAnim:
										
										move.w  (a6),d0
										moveq   #2,d7
										bsr.w   AdjustScriptPointerByCharAliveStatus
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  #0,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
										rts

	; End of function csc1B_startEntityAnim


; =============== S U B R O U T I N E =======================================

; if character xxxx dead, then do it to entity yyyy ?!

csc1C_stopEntityAnim:
										
										move.w  (a6),d0
										moveq   #2,d7
										bsr.w   AdjustScriptPointerByCharAliveStatus
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  #$FF,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
										rts

	; End of function csc1C_stopEntityAnim


; =============== S U B R O U T I N E =======================================

csc1D_showPortrait:
										
										move.w  (a6)+,d0
										tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
										bne.w   return_46AD0    ; do nothing if ther's already a portrait ?
										moveq   #0,d3
										btst    #$F,d0
										beq.s   loc_46AAC
										moveq   #$FFFFFFFF,d3
loc_46AAC:
										
										moveq   #0,d4
										btst    #$E,d0
										beq.s   loc_46AB6
										moveq   #$FFFFFFFF,d4
loc_46AB6:
										
										jsr     (WaitForCameraToCatchUp).w
										bsr.w   GetEntityPortraitAndSpeechSound
										cmpi.w  #$FFFF,d1
										beq.s   return_46AD0
										move.w  d1,d0
										move.w  d3,d1
										move.w  d4,d2
										jsr     j_InitPortraitWindow
return_46AD0:
										
										rts

	; End of function csc1D_showPortrait


; =============== S U B R O U T I N E =======================================

csc1E_hidePortrait:
										
										jsr     (WaitForCameraToCatchUp).w
										jsr     j_HidePortraitWindow
										rts

	; End of function csc1E_hidePortrait


; =============== S U B R O U T I N E =======================================

csc1F_declareForceMemberDead:
										
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
										adda.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,a1
										move.w  (a6)+,d0
										move.b  d0,(a1)
										addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										rts

	; End of function csc1F_declareForceMemberDead


; =============== S U B R O U T I N E =======================================

csc20_addForceMembersOnMapToList:
										
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d2
										adda.w  d2,a1
										moveq   #$FFFFFF80,d0
										moveq   #$1F,d7
loc_46AFE:
										
										jsr     j_GetXPos
										cmpi.w  #$FFFF,d1
										beq.s   loc_46B0E
										move.b  d0,(a1)+
										addq.w  #1,d2
loc_46B0E:
										
										addq.b  #1,d0
										dbf     d7,loc_46AFE
										move.w  d2,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										rts

	; End of function csc20_addForceMembersOnMapToList


; =============== S U B R O U T I N E =======================================

csc21_removeForceMemberFromList:
										
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

	; End of function csc21_removeForceMemberFromList


; =============== S U B R O U T I N E =======================================

; 0/1 = scan down/up, 2/3 = wipe out/in, 4/5 = slide out/in, 6/7 = mosaic out/in

csc22_animateEntityFadeInOrOut:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										lea     (FF6802_LOADING_SPACE).l,a0
										move.w  (a6)+,d0
										moveq   #0,d1
										cmpi.w  #6,d0
										beq.w   loc_46BE2
										moveq   #$FFFFFFFF,d1
										cmpi.w  #7,d0
										beq.w   loc_46BE2
										move.w  d0,d2
										lsl.w   #3,d0
										lea     byte_46BB2(pc,d0.w),a1
										move.w  (a1),d0
										move.w  2(a1),d1
										moveq   #$16,d7
loc_46B74:
										
										bsr.w   sub_470CA
										jsr     sub_45CA6
										bsr.w   sub_4709E
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										add.w   4(a1),d0
										add.w   6(a1),d1
										dbf     d7,loc_46B74
										cmpi.w  #4,d2
										bne.s   return_46BB0
										bsr.w   sub_470CA
										move.l  #$FFFF,d0
										jsr     sub_45E10
										bsr.w   sub_4709E
return_46BB0:
										
										rts

	; End of function csc22_animateEntityFadeInOrOut

byte_46BB2:         dc.b 0
										dc.b   1
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b   0
										dc.b   1
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b   0
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b   1
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $16
										dc.b   0
										dc.b   0
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b   0
										dc.b $16
										dc.b   0
										dc.b   1
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b $16
										dc.b   0
										dc.b   1
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b   1

; START OF FUNCTION CHUNK FOR csc22_animateEntityFadeInOrOut

loc_46BE2:
										
										tst.w   d1
										beq.s   loc_46BEE
										move.l  #$7FFF,d0
										bra.s   loc_46BF0
loc_46BEE:
										
										moveq   #1,d0
loc_46BF0:
										
										moveq   #$F,d7
loc_46BF2:
										
										bsr.w   sub_470CA
										jsr     sub_45E10
										bsr.w   sub_4709E
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

; set entity yyyy facing zzzz according to character's xxxx alive status ?!

csc23_setEntityFacing:
										
										move.b  (a6),d0
										moveq   #2,d7
										bsr.w   AdjustScriptPointerByCharAliveStatus
										move.b  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  (a6)+,ENTITYDEF_OFFSET_FACING(a5)
										bsr.w   UpdateEntitySprite_0
										rts

	; End of function csc23_setEntityFacing


; =============== S U B R O U T I N E =======================================

; set playable entity 00xx or something like that

csc24_setCameraTargetEntity:
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a5
										move.w  (a6)+,d0
										bmi.w   loc_46C52
										tst.b   d0
										bpl.s   loc_46C4A
										subi.b  #$60,d0 
loc_46C4A:
										
										andi.w  #$FF,d0
										move.b  (a5,d0.w),d0
loc_46C52:
										
										move.b  d0,((RAM_Battle_CurrentMovingEntity-$1000000)).w
										nop
										rts

	; End of function csc24_setCameraTargetEntity


; =============== S U B R O U T I N E =======================================

; wtf, copy entity number of entity 00xx into entity number of entity 00yy ?!

csc25_cloneEntity:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  ENTITYDEF_OFFSET_ENTNUM(a5),d1
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  d1,ENTITYDEF_OFFSET_ENTNUM(a5)
										rts

	; End of function csc25_cloneEntity


; =============== S U B R O U T I N E =======================================

csc26_entityNodHead:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  #$FF,$1E(a5)
										lea     (FF6802_LOADING_SPACE).l,a0
										moveq   #0,d7
										moveq   #$A,d0
										jsr     (Sleep).w       
loc_46C8A:
										
										bsr.w   sub_470CA
										jsr     sub_45D70
										bsr.w   sub_4709E
										moveq   #$14,d0
										jsr     (Sleep).w       
										bsr.w   UpdateEntitySprite_0
										moveq   #$A,d0
										jsr     (Sleep).w       
										dbf     d7,loc_46C8A
										move.b  #0,$1E(a5)
										rts

	; End of function csc26_entityNodHead


; =============== S U B R O U T I N E =======================================

csc27_entityShakeHead:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.b  #$FF,$1E(a5)
										lea     (FF6802_LOADING_SPACE).l,a0
										moveq   #6,d7
loc_46CC8:
										
										bsr.w   sub_470CA
										jsr     sub_45D1C
										bsr.w   sub_4709E
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										bsr.w   UpdateEntitySprite_0
										jsr     (WaitForVInt).w 
										bsr.w   sub_470CA
										jsr     sub_45D46
										bsr.w   sub_4709E
										jsr     (WaitForVInt).w 
										jsr     (WaitForVInt).w 
										bsr.w   UpdateEntitySprite_0
										jsr     (WaitForVInt).w 
										dbf     d7,loc_46CC8
										move.b  #0,$1E(a5)
										rts

	; End of function csc27_entityShakeHead


; =============== S U B R O U T I N E =======================================

csc28_moveEntityNextToPlayer:
										
										moveq   #0,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  ENTITYDEF_OFFSET_XDEST(a5),d1
										move.w  ENTITYDEF_OFFSET_YDEST(a5),d2
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  (a6)+,d3
										tst.b   d3
										bne.s   loc_46D30
										addi.w  #$180,d1
										bra.s   loc_46D4C
loc_46D30:
										
										cmpi.b  #1,d3
										bne.s   loc_46D3C
										subi.w  #$180,d2
										bra.s   loc_46D4C
loc_46D3C:
										
										cmpi.b  #2,d3
										bne.s   loc_46D48
										subi.w  #$180,d1
										bra.s   loc_46D4C
loc_46D48:
										
										addi.w  #$180,d2
loc_46D4C:
										
										move.w  d1,ENTITYDEF_OFFSET_XDEST(a5)
										move.w  #$30,d4 
										sub.w   (a5),d1
										bpl.s   loc_46D5C
										neg.w   d1
										neg.w   d4
loc_46D5C:
										
										move.w  d1,8(a5)
										move.w  d4,4(a5)
										move.w  d2,ENTITYDEF_OFFSET_YDEST(a5)
										move.w  #$30,d5 
										sub.w   2(a5),d2
										bpl.s   loc_46D76
										neg.w   d2
										neg.w   d5
loc_46D76:
										
										move.w  d2,$A(a5)
										move.w  d5,6(a5)
										bsr.w   WaitForEntityToStopMoving
										addq.w  #2,d3
										andi.b  #3,d3
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
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										moveq   #0,d1
										moveq   #0,d2
										move.w  (a6)+,d1
										move.w  (a6)+,d2
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										move.w  d1,ENTITYDEF_OFFSET_XDEST(a5)
										move.w  d2,ENTITYDEF_OFFSET_YDEST(a5)
										move.w  #$20,d3 
										sub.w   (a5),d1
										bpl.s   loc_46DC4
										neg.w   d1
										neg.w   d3
loc_46DC4:
										
										move.w  d1,8(a5)
										move.w  d3,4(a5)
										move.w  #$20,d3 
										sub.w   2(a5),d2
										bpl.s   loc_46DDA
										neg.w   d2
										neg.w   d3
loc_46DDA:
										
										move.w  d2,$A(a5)
										move.w  d3,6(a5)
										btst    #$F,d6
										bne.s   return_46DEC
										bsr.w   WaitForEntityToStopMoving
return_46DEC:
										
										rts

	; End of function csc29_setEntityDest


; =============== S U B R O U T I N E =======================================

csc2A_entityShiver:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  ((SPRITE_SIZE-$1000000)).w,d6
										move.w  #$15,((SPRITE_SIZE-$1000000)).w
										move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a5),d5
										move.b  #$FF,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
										moveq   #2,d7
loc_46E0A:
										
										ori.b   #8,ENTITYDEF_OFFSET_FLAGS_B(a5)
										bsr.w   UpdateEntitySprite_0
										moveq   #5,d0
										jsr     (Sleep).w       
										andi.b  #$F7,ENTITYDEF_OFFSET_FLAGS_B(a5)
										bsr.w   UpdateEntitySprite_0
										moveq   #5,d0
										jsr     (Sleep).w       
										dbf     d7,loc_46E0A
										move.b  d5,ENTITYDEF_OFFSET_ANIMCOUNTER(a5)
										move.w  d6,((SPRITE_SIZE-$1000000)).w
										rts

	; End of function csc2A_entityShiver


; =============== S U B R O U T I N E =======================================

csc2B_:
										move.w  (a6)+,d0
										clr.w   d1
										clr.w   d2
										clr.w   d3
										clr.w   d4
										move.b  (a6)+,d1
										move.b  (a6)+,d2
										move.b  (a6)+,d3
										move.b  (a6)+,d4
										move.l  #eas_Init,d5    
										jsr     sub_44570
										rts

	; End of function csc2B_


; =============== S U B R O U T I N E =======================================

csc2C_followEntity:
										
										move.b  (a6),d0
										moveq   #6,d7
										bsr.w   AdjustScriptPointerByCharAliveStatus
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  d0,d3
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  d0,d1
										move.w  d3,d0
										move.w  (a6)+,d2
										add.w   d2,d2
										lea     unk_46E8A(pc,d2.w),a0
										move.b  (a0)+,d2
										move.b  (a0)+,d3
										ext.w   d2
										ext.w   d3
										jsr     sub_44C2E
										rts

	; End of function csc2C_followEntity

unk_46E8A:          dc.b $18
										dc.b   0
										dc.b   0
										dc.b $E8 
										dc.b $E8 
										dc.b   0
										dc.b   0
										dc.b $18
										dc.b $18
										dc.b $E8 
										dc.b $E8 
										dc.b $E8 
										dc.b $E8 
										dc.b $18

; =============== S U B R O U T I N E =======================================

sub_46E98:
										
										move.b  (a0)+,d4
csc2E_hideEntity:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										jsr     sub_44C84
										rts

	; End of function sub_46E98


; =============== S U B R O U T I N E =======================================

csc2F_:
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  (a6)+,d0
										bne.s   loc_46EB8
										clr.b   $11(a5)
										bra.s   return_46EBE
loc_46EB8:
										
										move.b  #$10,$11(a5)
return_46EBE:
										
										rts

	; End of function csc2F_


; =============== S U B R O U T I N E =======================================

csc30_removeEntityShadow:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										lea     (FF6802_LOADING_SPACE).l,a0
										bsr.w   sub_470CA
										jsr     sub_45A8C
										bsr.w   sub_4709E
										jsr     (WaitForVInt).w 
										rts

	; End of function csc30_removeEntityShadow


; =============== S U B R O U T I N E =======================================

csc50_setEntitySize:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  ((SPRITE_SIZE-$1000000)).w,d6
										move.w  (a6)+,((SPRITE_SIZE-$1000000)).w
										ori.b   #8,ENTITYDEF_OFFSET_FLAGS_B(a5)
										bsr.w   UpdateEntitySprite_0
										jsr     (WaitForVInt).w 
										move.w  d6,((SPRITE_SIZE-$1000000)).w
										rts

	; End of function csc50_setEntitySize


; =============== S U B R O U T I N E =======================================

csc51_:
										move.w  #$FFFF,((RAM_Dialogue_NameIdx1-$1000000)).w
										nop
										move.w  (a6)+,d0
										jsr     j_IsInBattleParty
										bne.w   return_46F56
										move.w  d0,d6
										jsr     j_UpdateForce
										lea     ((RAM_Force_CurrentList-$1000000)).w,a0
										nop
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d7
										nop
										subq.w  #2,d7
loc_46F2C:
										
										move.b  (a0),d0
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_46F40
										addq.l  #1,a0
										dbf     d7,loc_46F2C
loc_46F40:
										
										move.b  (a0),d0
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										nop
										jsr     j_LeaveBattleParty
										move.b  d6,d0
										jsr     j_JoinBattleParty
return_46F56:
										
										rts

	; End of function csc51_


; =============== S U B R O U T I N E =======================================

; related to 2 entities

csc52_:
										move.w  (a6)+,d7
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  ENTITYDEF_OFFSET_XDEST(a5),d1
										move.w  ENTITYDEF_OFFSET_YDEST(a5),d2
										move.w  d7,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  d1,d3
										sub.w   ENTITYDEF_OFFSET_XDEST(a5),d3
										or.w    d3,d3
										bge.s   loc_46F7A
										neg.w   d3
loc_46F7A:
										
										move.w  d2,d4
										sub.w   ENTITYDEF_OFFSET_YDEST(a5),d4
										or.w    d4,d4
										bge.s   loc_46F86
										neg.w   d4
loc_46F86:
										
										cmp.w   d3,d4
										bcc.s   loc_46FA0
										cmp.w   ENTITYDEF_OFFSET_XDEST(a5),d1
										bcs.s   loc_46F98
										move.b  #0,ENTITYDEF_OFFSET_FACING(a5)
										bra.s   loc_46F9E
loc_46F98:
										
										move.b  #2,ENTITYDEF_OFFSET_FACING(a5)
loc_46F9E:
										
										bra.s   loc_46FB4
loc_46FA0:
										
										cmp.w   ENTITYDEF_OFFSET_YDEST(a5),d2
										bcs.s   loc_46FAE
										move.b  #3,ENTITYDEF_OFFSET_FACING(a5)
										bra.s   loc_46FB4
loc_46FAE:
										
										move.b  #1,ENTITYDEF_OFFSET_FACING(a5)
loc_46FB4:
										
										bsr.w   UpdateEntitySprite_0
										jsr     (WaitForVInt).w 
										rts

	; End of function csc52_


; =============== S U B R O U T I N E =======================================

csc53_:
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
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

	; End of function csc53_


; =============== S U B R O U T I N E =======================================

csc54_:
										move.w  (a6)+,d0
										jsr     j_GetCharacterWord34
										move.w  (a6)+,d2
										bne.s   loc_46FEE
										andi.w  #$FFFB,d1
										bra.s   loc_46FF8
loc_46FEE:
										
										ori.w   #4,d1
										jsr     j_JoinForce
loc_46FF8:
										
										jsr     j_SetCharacterWord34
										rts

	; End of function csc54_


; =============== S U B R O U T I N E =======================================

csc55_resetCharacterBattleStats:
										
										jsr     sub_478C6
										rts

	; End of function csc55_resetCharacterBattleStats


; =============== S U B R O U T I N E =======================================

; xx character

csc56_:
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										moveq   #0,d1
										lea     ((FOLLOWERS_LIST-$1000000)).w,a0
loc_47014:
										
										cmpi.b  #$FF,(a0)
										beq.w   loc_47020       ; gets last value before an FF
										move.b  (a0)+,d1        ; get last follower ?
										bra.s   loc_47014
loc_47020:
										
										move.w  #$FFE8,d2
										move.w  #0,d3
										jsr     sub_44C2E
										rts

	; End of function csc56_


; =============== S U B R O U T I N E =======================================

csc31_moveEntityAboveEntity:
										
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										move.w  d0,d1
										move.w  (a6)+,d0
										bsr.w   GetEntityAddressFromPlayableCharacterIdx
										moveq   #$FFFFFFE8,d2
										moveq   #0,d3
										jsr     sub_44C2E
										rts

	; End of function csc31_moveEntityAboveEntity


; =============== S U B R O U T I N E =======================================

;     Get address of entity information. Could be a force member or an opponent
;     In: D0 = playable character from FFB140
;     Out: A5 = entity info address in RAM

GetEntityAddressFromPlayableCharacterIdx:
										
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a5
										andi.w  #$FF,d0
										tst.b   d0
										bpl.s   loc_4705A
										subi.b  #$60,d0 
loc_4705A:
										
										move.b  (a5,d0.w),d0
										move.l  d0,-(sp)
										lsl.w   #5,d0
										lea     ((RAM_Entity_StructOffset_XAndStart-$1000000)).w,a5
										adda.w  d0,a5
										move.l  (sp)+,d0
										rts

	; End of function GetEntityAddressFromPlayableCharacterIdx


; =============== S U B R O U T I N E =======================================

UpdateEntitySprite_0:
										
										movem.l d6/a0,-(sp)
										move.b  ENTITYDEF_OFFSET_FACING(a5),d6
										movea.l a5,a0
										jsr     (ChangeEntitySprite).w
										movem.l (sp)+,d6/a0
										rts

	; End of function UpdateEntitySprite_0


; =============== S U B R O U T I N E =======================================

; move script pointer d7 forward if character dead

AdjustScriptPointerByCharAliveStatus:
										
										btst    #7,d0
										bne.s   return_4709C
										cmpi.b  #$1E,d0
										bge.s   return_4709C    ; it must be a force member
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   return_4709C
										adda.w  d7,a6
										movem.l (sp)+,d7
return_4709C:
										
										rts

	; End of function AdjustScriptPointerByCharAliveStatus


; =============== S U B R O U T I N E =======================================

sub_4709E:
										
										movem.l d0-d1/a0-a1,-(sp)
										clr.w   d1
										move.b  $12(a5),d1
										move.w  d1,d0
										lsl.w   #3,d1
										add.w   d0,d1
										lsl.w   #6,d1
										lea     ($7000).w,a1
										adda.w  d1,a1
										move.w  #$120,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgainbis).w
										jsr     (Set_FFDE94_bit3).w
										movem.l (sp)+,d0-d1/a0-a1
										rts

	; End of function sub_4709E


; =============== S U B R O U T I N E =======================================

sub_470CA:
										
										movem.l d0-d1/d6/a1,-(sp)
										movea.l a0,a1
										clr.w   d6
										move.b  $10(a5),d6
										bne.s   loc_470DA
										moveq   #2,d6
loc_470DA:
										
										clr.w   d1
										move.b  $13(a5),d1
										move.w  d1,d0
										add.w   d1,d1
										add.w   d0,d1
										add.w   d6,d1
										subq.w  #1,d1
										lsl.w   #2,d1
										lea     (pt_MapSprites).l,a0
										movea.l (a0,d1.w),a0
										jsr     (LoadSpriteData).w
										movea.l a1,a0
										movem.l (sp)+,d0-d1/d6/a1
										rts

	; End of function sub_470CA

DebugMapScripts:    dc.l word_4931C         
										dc.l bbcs_08            
										dc.l abcs_battle08      

; =============== S U B R O U T I N E =======================================

ExecuteDebugMapScript:
										
										clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
										moveq   #0,d0
										moveq   #0,d1
										moveq   #$A,d2
										jsr     j_NumberPrompt
										lsl.w   #2,d0
										movea.l DebugMapScripts(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										rts

	; End of function ExecuteDebugMapScript


; =============== S U B R O U T I N E =======================================

nullsub_14:
										
										rts

	; End of function nullsub_14


; =============== S U B R O U T I N E =======================================

; In: A0 = script address

ExecuteMapScript:
										
										move.l  #byte_FF9004,(dword_FFB1A4).l
										movem.l d0-a6,-(sp)
										movea.l a0,a6
										clr.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
loc_47140:
										
										btst    #7,((RAM_Input_Player2_StateA-$1000000)).w
																						; if P2 START and DEBUG MODE, DEACTIVATE DIALOGS
										beq.s   loc_47156
										tst.b   (RAM_DebugModeActivated).l
										beq.s   loc_47156
										move.b  #$FF,((AVOID_CUTSCENE_DIALOGS-$1000000)).w
loc_47156:
										
										move.w  (a6)+,d0
										cmpi.w  #$FFFF,d0
										beq.w   loc_47234
										tst.w   d0
										bpl.s   loc_47174
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_47172       ; if cmd > $8000 and dialogs activated, SLEEP CMD
										andi.w  #$FF,d0
										jsr     (Sleep).w       
loc_47172:
										
										bra.s   loc_47140       
loc_47174:
										
										add.w   d0,d0
										move.w  rjt_cutsceneScriptCommands(pc,d0.w),d0
										jsr     rjt_cutsceneScriptCommands(pc,d0.w)
										bra.s   loc_47140       
rjt_cutsceneScriptCommands:
										
										dc.w csc00_displaySingleTextbox-rjt_cutsceneScriptCommands
																						; csc for Cutscene Script Command
										dc.w csc01_displaySingleTextboxWithVars-rjt_cutsceneScriptCommands
										dc.w csc02_displayTextbox-rjt_cutsceneScriptCommands
										dc.w csc03_displayTextboxWithVars-rjt_cutsceneScriptCommands
										dc.w csc04_setTextIndex-rjt_cutsceneScriptCommands
										dc.w csc05_playSound-rjt_cutsceneScriptCommands
										dc.w csc06_doNothing-rjt_cutsceneScriptCommands
										dc.w csc07_executeMapSystemEvent-rjt_cutsceneScriptCommands
										dc.w csc08_joinForce-rjt_cutsceneScriptCommands
										dc.w csc09_hideTextBoxAndPortrait-rjt_cutsceneScriptCommands
										dc.w csc0A_executeSubroutine-rjt_cutsceneScriptCommands
																						; execute subroutine xxxxxxxx
										dc.w csc0B_jump-rjt_cutsceneScriptCommands
										dc.w csc0C_jumpIfFlagSet-rjt_cutsceneScriptCommands
										dc.w csc0D_jumpIfFlagClear-rjt_cutsceneScriptCommands
										dc.w csc0E_jumpIfForceMemberInList-rjt_cutsceneScriptCommands
										dc.w csc0F_jumpIfCharacterAlive-rjt_cutsceneScriptCommands
										dc.w csc10_setOrClearFlag-rjt_cutsceneScriptCommands
										dc.w csc11_promptYesNoForStoryFlow-rjt_cutsceneScriptCommands
										dc.w csc12_executeContextMenu-rjt_cutsceneScriptCommands
										dc.w csc13_setStoryFlag-rjt_cutsceneScriptCommands
										dc.w csc14_setEntityActscriptManual+$10000-rjt_cutsceneScriptCommands
										dc.w csc15_setEntityActscript+$10000-rjt_cutsceneScriptCommands
										dc.w csc16_waitUntilEntityIdle+$10000-rjt_cutsceneScriptCommands
										dc.w csc17_setEntityPosAndFacingWithFlash+$10000-rjt_cutsceneScriptCommands
										dc.w csc18_flashEntityWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc19_setEntityPosAndFacing+$10000-rjt_cutsceneScriptCommands
										dc.w csc1A_setEntitySprite+$10000-rjt_cutsceneScriptCommands
										dc.w csc1B_startEntityAnim+$10000-rjt_cutsceneScriptCommands
										dc.w csc1C_stopEntityAnim+$10000-rjt_cutsceneScriptCommands
										dc.w csc1D_showPortrait+$10000-rjt_cutsceneScriptCommands
										dc.w csc1E_hidePortrait+$10000-rjt_cutsceneScriptCommands
										dc.w csc1F_declareForceMemberDead+$10000-rjt_cutsceneScriptCommands
										dc.w csc20_addForceMembersOnMapToList+$10000-rjt_cutsceneScriptCommands
										dc.w csc21_removeForceMemberFromList+$10000-rjt_cutsceneScriptCommands
										dc.w csc22_animateEntityFadeInOrOut+$10000-rjt_cutsceneScriptCommands
										dc.w csc23_setEntityFacing+$10000-rjt_cutsceneScriptCommands
										dc.w csc24_setCameraTargetEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc25_cloneEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc26_entityNodHead+$10000-rjt_cutsceneScriptCommands
										dc.w csc27_entityShakeHead+$10000-rjt_cutsceneScriptCommands
										dc.w csc28_moveEntityNextToPlayer+$10000-rjt_cutsceneScriptCommands
										dc.w csc29_setEntityDest+$10000-rjt_cutsceneScriptCommands
										dc.w csc2A_entityShiver+$10000-rjt_cutsceneScriptCommands
										dc.w csc2B_+$10000-rjt_cutsceneScriptCommands
										dc.w csc2C_followEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2D_moveEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2E_hideEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2F_+$10000-rjt_cutsceneScriptCommands
										dc.w csc30_removeEntityShadow+$10000-rjt_cutsceneScriptCommands
										dc.w csc31_moveEntityAboveEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc32_setCameraDestInTiles+$10000-rjt_cutsceneScriptCommands
										dc.w csc33_setQuakeAmount+$10000-rjt_cutsceneScriptCommands
										dc.w csc34_setBlocks+$10000-rjt_cutsceneScriptCommands
										dc.w csc35_+$10000-rjt_cutsceneScriptCommands
										dc.w csc36_+$10000-rjt_cutsceneScriptCommands
										dc.w csc37_loadMapAndFadeIn+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc39_fadeInFromBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3A_fadeOutToBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3B_slowFadeInFromBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3C_slowFadeOutToBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3D_tintMap+$10000-rjt_cutsceneScriptCommands
										dc.w csc3E_+$10000-rjt_cutsceneScriptCommands
										dc.w csc3F_fadeMapOutToWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc40_fadeMapInFromWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc41_flashScreenWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc42_+$10000-rjt_cutsceneScriptCommands
										dc.w csc43_+$10000-rjt_cutsceneScriptCommands
										dc.w csc44_+$10000-rjt_cutsceneScriptCommands
										dc.w csc45_+$10000-rjt_cutsceneScriptCommands
										dc.w csc46_+$10000-rjt_cutsceneScriptCommands
										dc.w csc47_+$10000-rjt_cutsceneScriptCommands
										dc.w csc48_loadMap+$10000-rjt_cutsceneScriptCommands
										dc.w csc49_+$10000-rjt_cutsceneScriptCommands
										dc.w csc4A_fadeInFromBlackHalf+$10000-rjt_cutsceneScriptCommands
										dc.w csc4B_fadeOutToBlackHalf+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc50_setEntitySize+$10000-rjt_cutsceneScriptCommands
										dc.w csc51_+$10000-rjt_cutsceneScriptCommands
										dc.w csc52_+$10000-rjt_cutsceneScriptCommands
										dc.w csc53_+$10000-rjt_cutsceneScriptCommands
										dc.w csc54_+$10000-rjt_cutsceneScriptCommands
										dc.w csc55_resetCharacterBattleStats+$10000-rjt_cutsceneScriptCommands
										dc.w csc56_+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
loc_47234:
										
										tst.w   ((TEXT_WINDOW_INDEX-$1000000)).w
										beq.s   loc_4723E
										jsr     (WaitForCameraToCatchUp).w
loc_4723E:
										
										clr.w   ((word_FFB194-$1000000)).w
										movem.l (sp)+,d0-a6
										rts

	; End of function ExecuteMapScript


; =============== S U B R O U T I N E =======================================

csc_doNothing:
										
										rts

	; End of function csc_doNothing


; =============== S U B R O U T I N E =======================================

csc00_displaySingleTextbox:
										
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_47298
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4726A
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSound
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47270
loc_4726A:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47270:
										
										adda.w  #2,a6
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
																						; increment script number (move forward in script bank)
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										bra.s   return_4729C
loc_47298:
										
										adda.w  #2,a6
return_4729C:
										
										rts

	; End of function csc00_displaySingleTextbox


; =============== S U B R O U T I N E =======================================

csc01_displaySingleTextboxWithVars:
										
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_472B8
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSound
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_472BE
loc_472B8:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_472BE:
										
										adda.w  #2,a6
										move.w  (a6)+,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  (a6)+,((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc01_displaySingleTextboxWithVars


; =============== S U B R O U T I N E =======================================

csc02_displayTextbox:
										
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_4732C
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4730E
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSound
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47314
loc_4730E:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47314:
										
										adda.w  #2,a6
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										bra.s   return_47330
loc_4732C:
										
										adda.w  #2,a6
return_47330:
										
										rts

	; End of function csc02_displayTextbox


; =============== S U B R O U T I N E =======================================

csc03_displayTextboxWithVars:
										
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4734C
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSound
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47352
loc_4734C:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47352:
										
										adda.w  #2,a6
										move.w  (a6)+,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  (a6)+,((RAM_Dialogue_NameIdx2-$1000000)).w
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										rts

	; End of function csc03_displayTextboxWithVars


; =============== S U B R O U T I N E =======================================

; set cutscene dialogue index

csc04_setTextIndex:
										
										move.w  (a6)+,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										rts

	; End of function csc04_setTextIndex


; =============== S U B R O U T I N E =======================================

; play sound of index 00xx

csc05_playSound:
										
										move.w  (a6)+,d0
										trap    #TRAP_SOUNDCOM
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										rts

	; End of function csc05_playSound


; =============== S U B R O U T I N E =======================================

csc06_doNothing:
										
										rts

	; End of function csc06_doNothing


; =============== S U B R O U T I N E =======================================

csc07_executeMapSystemEvent:
										
										lea     ((RAM_MapEventType-$1000000)).w,a0
										move.w  #1,(a0)+
										move.b  #0,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										rts

	; End of function csc07_executeMapSystemEvent


; =============== S U B R O U T I N E =======================================

; make 00xx character join force with bit F set for sad join music

csc08_joinForce:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     (WaitForCameraToCatchUp).w
										move.w  (a6)+,d0
										bclr    #$F,d0
										bne.s   loc_473B0
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_JOIN         ; join music
										bra.s   loc_473B4
loc_473B0:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_SAD_JOIN     ; sad join music
loc_473B4:
										
										cmpi.w  #$80,d0 
										bne.s   loc_473D4
										move.w  #1,d0           ; make sarah and chester join at the same time
										jsr     j_JoinForce
										move.w  #2,d0
										jsr     j_JoinForce
										trap    #TRAP_TEXTBOX
										dc.w $1BF               ; "{NAME;1} the PRST and{N}{NAME;2} the KNTE{N}have joined the force."
										bra.s   loc_473EC
loc_473D4:
										
										jsr     j_JoinForce
										jsr     j_GetClass      
										move.w  d0,((RAM_Dialogue_NameIdx1-$1000000)).w
										move.w  d1,((RAM_Dialogue_NameIdx2-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1BE               ; "{NAME} the {CLASS} {N}has joined the force."
loc_473EC:
										
										jsr     j_FadeOut_WaitForP2Input
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc08_joinForce


; =============== S U B R O U T I N E =======================================

; related to portrait window

csc09_hideTextBoxAndPortrait:
										
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										rts

	; End of function csc09_hideTextBoxAndPortrait


; =============== S U B R O U T I N E =======================================

csc0A_executeSubroutine:
										
										movea.l (a6)+,a1
										move.l  a0,-(sp)
										jsr     (a1)
										movea.l (sp)+,a0
										rts

	; End of function csc0A_executeSubroutine


; =============== S U B R O U T I N E =======================================

csc0B_jump:
										
										movea.l (a6),a6
										rts

	; End of function csc0B_jump


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0C_jumpIfFlagSet:
										
										move.w  (a6)+,d1
										jsr     j_CheckFlag
										beq.w   loc_47428
										movea.l (a6),a6
										bra.s   return_4742A
loc_47428:
										
										addq.w  #4,a6
return_4742A:
										
										rts

	; End of function csc0C_jumpIfFlagSet


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0D_jumpIfFlagClear:
										
										move.w  (a6)+,d1
										jsr     j_CheckFlag
										bne.w   loc_4743C
										movea.l (a6),a6
										bra.s   return_4743E
loc_4743C:
										
										addq.w  #4,a6
return_4743E:
										
										rts

	; End of function csc0D_jumpIfFlagClear


; =============== S U B R O U T I N E =======================================

; branch if something

csc0E_jumpIfForceMemberInList:
										
										move.w  (a6)+,d0
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
										bcs.w   return_47462
loc_47450:
										
										cmp.b   (a1)+,d0
										beq.w   loc_47460
										dbf     d7,loc_47450
										addq.w  #4,a6
										bra.w   return_47462
loc_47460:
										
										movea.l (a6),a6
return_47462:
										
										rts

	; End of function csc0E_jumpIfForceMemberInList


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0F_jumpIfCharacterAlive:
										
										move.w  (a6)+,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.w   loc_47476
										movea.l (a6),a6
										bra.s   return_47478
loc_47476:
										
										addq.w  #4,a6
return_47478:
										
										rts

	; End of function csc0F_jumpIfCharacterAlive


; =============== S U B R O U T I N E =======================================

; xxxx yyyy

csc10_setOrClearFlag:
										
										move.w  (a6)+,d1
										move.w  (a6)+,d0
										bne.s   loc_47488
										jsr     j_ClearFlag
										bra.s   return_4748E
loc_47488:
										
										jsr     j_SetFlag
return_4748E:
										
										rts

	; End of function csc10_setOrClearFlag


; =============== S U B R O U T I N E =======================================

csc11_promptYesNoForStoryFlow:
										
										move.l  a6,-(sp)
										jsr     j_YesNoPrompt
										movea.l (sp)+,a6
										moveq   #$59,d1 ; flag index : last answer to story-related yes/no question
										tst.w   d0
										bne.s   loc_474A8
										jsr     j_SetFlag
										bra.s   loc_474AE
loc_474A8:
										
										jsr     j_ClearFlag
loc_474AE:
										
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc11_promptYesNoForStoryFlow


; =============== S U B R O U T I N E =======================================

csc12_executeContextMenu:
										
										move.w  (a6)+,d0
										move.l  a6,-(sp)
										tst.w   d0
										bne.s   loc_474C4
										jsr     j_ChurchActions ; xxxx = 0
loc_474C4:
										
										cmpi.w  #1,d0
										bne.s   loc_474D0
										jsr     j_ShopActions   ; xxxx = 1
loc_474D0:
										
										cmpi.w  #2,d0
										bne.s   loc_474DC
										jsr     j_BlacksmithActions
																						; xxxx = 2
loc_474DC:
										
										movea.l (sp)+,a6
										rts

	; End of function csc12_executeContextMenu


; =============== S U B R O U T I N E =======================================

; xxxx

csc13_setStoryFlag:
										
										move.w  (a6)+,d1
										addi.w  #$190,d1
										jsr     j_SetFlag
										rts

	; End of function csc13_setStoryFlag


; =============== S U B R O U T I N E =======================================

sub_474EE:
										
										moveq   #0,d0
										move.b  #$11,((CURRENT_MAP-$1000000)).w
																						; Mt Volcanon Shrine ?
										bsr.w   ExecuteEntityEvent
										rts

	; End of function sub_474EE


; =============== S U B R O U T I N E =======================================

RunMapSetupInitFunction:
										
										movem.l d0-a1,-(sp)
										bsr.w   GetCurrentMapSetup
										cmpi.w  #$FFFF,(a0)
										bne.s   loc_4750E
										bra.w   loc_47514
loc_4750E:
										
										movea.l $14(a0),a0
										jsr     (a0)
loc_47514:
										
										movem.l (sp)+,d0-a1
										rts

	; End of function RunMapSetupInitFunction


; =============== S U B R O U T I N E =======================================

RunMapSetupSection3Function:
										
										movem.l d0-a1,-(sp)
										bsr.w   GetCurrentMapSetup
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_47576
										movea.l 8(a0),a0
										clr.w   d7
loc_47530:
										
										cmpi.b  #$FD,(a0,d7.w)
										bne.s   loc_4753E
										adda.w  2(a0,d7.w),a0
										bra.s   loc_4756A
loc_4753E:
										
										cmpi.b  #$FF,(a0,d7.w)
										beq.w   loc_47550
										cmp.b   (a0,d7.w),d1
										bne.w   loc_47562
loc_47550:
										
										cmpi.b  #$FF,1(a0,d7.w)
										beq.w   loc_47566
										cmp.b   1(a0,d7.w),d2
										beq.w   loc_47566
loc_47562:
										
										addq.w  #4,d7
										bra.s   loc_47530
loc_47566:
										
										adda.w  2(a0,d7.w),a0
loc_4756A:
										
										jsr     (a0)
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
loc_47576:
										
										jsr     (WaitForVInt).w 
										moveq   #0,d0
										bsr.w   WaitForEntityToStopMoving
										movem.l (sp)+,d0-a1
										rts

	; End of function RunMapSetupSection3Function


; =============== S U B R O U T I N E =======================================

sub_47586:
										
										movem.l d0-d5/d7-a1,-(sp)
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										andi.w  #ITEM_MASK_IDX,d4
										move.b  d2,((byte_FFB651-$1000000)).w
										moveq   #0,d6
										bsr.w   GetCurrentMapSetup
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_4760A
										movea.l $10(a0),a0
										clr.w   d7
loc_475AA:
										
										cmpi.b  #$FD,(a0,d7.w)
										bne.s   loc_475B8
										adda.w  4(a0,d7.w),a0
										bra.s   loc_475FE
loc_475B8:
										
										cmpi.b  #$FF,(a0,d7.w)
										beq.w   loc_475CA
										cmp.b   (a0,d7.w),d1
										bne.w   loc_475F6
loc_475CA:
										
										cmpi.b  #$FF,1(a0,d7.w)
										beq.w   loc_475DC
										cmp.b   1(a0,d7.w),d2
										bne.w   loc_475F6
loc_475DC:
										
										cmpi.b  #$FF,2(a0,d7.w)
										beq.w   loc_475EE
										cmp.b   2(a0,d7.w),d3
										bne.w   loc_475F6
loc_475EE:
										
										cmp.b   3(a0,d7.w),d4
										beq.w   loc_475FA
loc_475F6:
										
										addq.w  #6,d7
										bra.s   loc_475AA
loc_475FA:
										
										adda.w  4(a0,d7.w),a0
loc_475FE:
										
										jsr     (a0)
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
loc_4760A:
										
										jsr     (WaitForVInt).w 
										moveq   #0,d0
										bsr.w   WaitForEntityToStopMoving
										movem.l (sp)+,d0-d5/d7-a1
										rts

	; End of function sub_47586


; =============== S U B R O U T I N E =======================================

; In: D0 = entity event idx

ExecuteEntityEvent:
										
										movem.l d0-a1,-(sp)
										move.b  d2,((byte_FFB651-$1000000)).w
										bsr.w   GetCurrentMapSetup
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_476D6
										movem.w d1-d2,-(sp)
										movea.l 4(a0),a0
										clr.w   d7
loc_47638:
										
										cmpi.b  #$FD,(a0,d7.w)
										bne.s   loc_4764A       ; not default case
										move.b  1(a0,d7.w),d6
										adda.w  2(a0,d7.w),a0
										bra.s   loc_4765E
loc_4764A:
										
										cmp.b   (a0,d7.w),d0
										bne.s   loc_4765A       ; not the right event
										move.b  1(a0,d7.w),d6
										adda.w  2(a0,d7.w),a0
										bra.s   loc_4765E
loc_4765A:
										
										addq.w  #4,d7
										bra.s   loc_47638
loc_4765E:
										
										bsr.w   GetEntityPortraitAndSpeechSound
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										blt.s   loc_47670
										bsr.w   LoadAndDisplayCurrentPortrait
loc_47670:
										
										movem.w (sp)+,d1-d2
										lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a1
										tst.b   d0
										bpl.s   loc_47680
										subi.b  #$60,d0 
loc_47680:
										
										andi.w  #$FF,d0
										move.b  (a1,d0.w),d0
										movem.w d0-d2/d6,-(sp)
										btst    #0,d6
										beq.s   loc_476A8
										jsr     (WaitForVInt).w 
										addi.w  #2,d2
										andi.w  #3,d2
										move.w  d2,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
loc_476A8:
										
										trap    #TRAP_VINTFUNCTIONS
										dc.w TRAP_CLEARFLAG
										dc.l VInt_UpdateEntities
										jsr     (a0)
										movem.w (sp)+,d0-d2/d6
										btst    #1,d6
										beq.s   loc_476C4
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
loc_476C4:
										
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_UpdateEntities
loc_476D6:
										
										movem.l (sp)+,d0-a1
										rts

	; End of function ExecuteEntityEvent


; =============== S U B R O U T I N E =======================================

sub_476DC:
										
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_UpdateEntities
										bra.w   ExecuteMapScript

	; End of function sub_476DC


; =============== S U B R O U T I N E =======================================

;     Get index of current portrait for textbox and load it.

LoadAndDisplayCurrentPortrait:
										
										movem.w d0-d2,-(sp)
										move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
										blt.s   loc_476FC
										clr.w   d1
										clr.w   d2
										jsr     j_InitPortraitWindow
loc_476FC:
										
										movem.w (sp)+,d0-d2
										rts

	; End of function LoadAndDisplayCurrentPortrait


; =============== S U B R O U T I N E =======================================

RunMapSetupFunction:
										
										movem.l d0-a1,-(sp)
										bsr.w   GetCurrentMapSetup
										clr.w   d7
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_4771A
										movea.l $C(a0),a0
										jsr     (a0)
loc_4771A:
										
										tst.w   d7
										movem.l (sp)+,d0-a1
										rts

	; End of function RunMapSetupFunction


; =============== S U B R O U T I N E =======================================

sub_47722:
										
										lsl.w   #8,d0
										andi.w  #$FF,d1
										or.w    d1,d0
										clr.w   d7
loc_4772C:
										
										cmpi.b  #$FD,(a0,d7.w)
										bne.s   loc_47738
										clr.w   d7
										rts
loc_47738:
										
										cmp.w   (a0,d7.w),d0
										bne.w   loc_4778C
										tst.b   2(a0,d7.w)
										beq.s   loc_4774C
										tst.w   d6
										bne.w   loc_4778C
loc_4774C:
										
										tst.b   3(a0,d7.w)
										bne.s   loc_4777C
										clr.w   d0
										move.b  4(a0,d7.w),d0
										clr.w   d1
										move.b  5(a0,d7.w),d1
										addi.w  #$1A7,d0
										jsr     (DisplayText).w 
										move.w  d1,d0
										add.w   d3,d0
										jsr     (DisplayText).w 
loc_4776E:
										
										jsr     j_HidePortraitWindow
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #$FFFFFFFF,d7
										rts
loc_4777C:
										
										adda.w  4(a0,d7.w),a0
										movem.w d6,-(sp)
										jsr     (a0)
										movem.w (sp)+,d6
										bra.s   loc_4776E
loc_4778C:
										
										addq.w  #6,d7
										bra.s   loc_4772C

	; End of function sub_47722


; =============== S U B R O U T I N E =======================================

; returns entity list of map setup in a0

GetMapSetupEntityList:
										
										bsr.w   GetCurrentMapSetup
										cmpi.w  #$FFFF,(a0)
										beq.s   return_4779C
										movea.l (a0),a0
return_4779C:
										
										rts

	; End of function GetMapSetupEntityList


; =============== S U B R O U T I N E =======================================

; returns map setup address in a0

GetCurrentMapSetup:
										
										movem.l d0-d1/a1,-(sp)
										clr.w   d0
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										lea     MapSetups(pc), a1
loc_477AC:
										
										cmpi.w  #$FFFF,(a1)
										bne.s   loc_477BA
										lea     ms_Void(pc), a0
										bra.w   loc_477E2
loc_477BA:
										
										cmp.w   (a1)+,d0
										bne.s   loc_477DA
										movea.l (a1)+,a0
loc_477C0:
										
										move.w  (a1)+,d1
										cmpi.w  #$FFFD,d1
										beq.w   loc_477E2
										jsr     j_CheckFlag
										beq.s   loc_477D4
										movea.l (a1),a0
loc_477D4:
										
										adda.w  #4,a1
										bra.s   loc_477C0
loc_477DA:
										
										cmpi.w  #$FFFD,(a1)+
										bne.s   loc_477DA
										bra.s   loc_477AC
loc_477E2:
										
										movem.l (sp)+,d0-d1/a1
										rts

	; End of function GetCurrentMapSetup

ms_Void:            dc.w $FFFF

; =============== S U B R O U T I N E =======================================

MoveEntityOutOfMap:
										
										movem.l d0-d3,-(sp)
										jsr     j_GetEntityIndex
										move.w  #$7000,d1
										move.w  #$7000,d2
										jsr     j_SetEntityPosition
										movem.l (sp)+,d0-d3
										rts

	; End of function MoveEntityOutOfMap


; =============== S U B R O U T I N E =======================================

sub_47808:
										
										move.l  d0,-(sp)
										jsr     j_GetEntityIndex
										jsr     SetWalkingActscript
										move.l  (sp)+,d0
										rts

	; End of function sub_47808


; =============== S U B R O U T I N E =======================================

sub_4781A:
										
										movem.l d0-d3,-(sp)
										jsr     j_GetEntityIndex
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
										movem.l (sp)+,d0-d3
										rts

	; End of function sub_4781A


; =============== S U B R O U T I N E =======================================

sub_47832:
										
										movem.l d0-d3,-(sp)
										jsr     j_GetEntityIndex
										move.b  ((byte_FFB651-$1000000)).w,d1
										addi.w  #2,d1
										andi.w  #3,d1
										moveq   #$FFFFFFFF,d2
										moveq   #$FFFFFFFF,d3
										jsr     (sub_6052).w    
										movem.l (sp)+,d0-d3
										rts

	; End of function sub_47832


; =============== S U B R O U T I N E =======================================

sub_47856:
										
										movem.l d1/d6-d7,-(sp)
										move.w  #$1F4,d1
										add.w   d0,d1
										jsr     j_CheckFlag
										bne.s   loc_4786E
										moveq   #$FFFFFFFF,d1
										bra.w   loc_47896
loc_4786E:
										
										tst.w   ((word_FFB196-$1000000)).w
										beq.s   loc_4787A
										clr.w   d1
										bra.w   loc_47896
loc_4787A:
										
										moveq   #8,d6
										jsr     (UpdateRandomSeed).w
										tst.w   d7
										bne.s   loc_47888
										moveq   #$FFFFFFFF,d1
										bra.s   loc_47896
loc_47888:
										
										clr.w   d1
										moveq   #4,d6
										jsr     (UpdateRandomSeed).w
										addq.l  #2,d7
										move.w  d7,((word_FFB196-$1000000)).w
loc_47896:
										
										tst.w   d1
										beq.s   loc_478C0
										move.w  #$190,d1
										add.w   d0,d1
										jsr     j_SetFlag
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
										move.w  #$7530,((word_FFB196-$1000000)).w
										jsr     (WaitForCameraToCatchUp).w
										trap    #TRAP_SOUNDCOM
										dc.w SFX_BOOST          ; boost effect ?
										bsr.w   ExecuteFlashScreenScript
loc_478C0:
										
										movem.l (sp)+,d1/d6-d7
										rts

	; End of function sub_47856


; =============== S U B R O U T I N E =======================================

sub_478C6:
										
										movem.l d0-d7,-(sp)
										clr.w   d0
										moveq   #$1D,d7
loc_478CE:
										
										jsr     j_GetCurrentHP
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetMaxMP
										jsr     j_SetCurrentMP
										jsr     j_GetStatus
										andi.w  #7,d1
										jsr     j_SetStatus
										jsr     j_ApplyStatusAndItemsOnStats
										addq.w  #1,d0
										dbf     d7,loc_478CE
										movem.l (sp)+,d0-d7
										rts

	; End of function sub_478C6


; =============== S U B R O U T I N E =======================================

sub_4790E:
										
										jsr     sub_100AC
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_47924
										move.w  #1,d0
										bra.s   loc_4793C
loc_47924:
										
										move.w  d0,d1
										addi.w  #$20,d1 
										jsr     j_CheckFlag
										beq.s   loc_47938
										addi.w  #$DC3,d0
										bra.s   loc_4793C
loc_47938:
										
										addi.w  #$DE1,d0
loc_4793C:
										
										jsr     (DisplayText).w 
										jsr     sub_100B0
										rts

	; End of function sub_4790E


; =============== S U B R O U T I N E =======================================

sub_47948:
										
										movem.l d0-a2,-(sp)
										moveq   #1,d0
										moveq   #$1C,d7
										lea     ((byte_FFA922-$1000000)).w,a0
										lea     byte_47A38(pc), a2
loc_47958:
										
										move.w  d0,d1
										jsr     j_CheckFlag
										bne.s   loc_47982
										move.w  #$5E80,d2
										move.w  d2,(a0)
										move.w  d2,2(a0)
										move.w  d2,$C(a0)
										move.w  d2,$E(a0)
										move.b  #3,$10(a0)
										move.l  #eas_Idle,$14(a0)
loc_47982:
										
										addq.w  #1,d0
										lea     $20(a0),a0
										dbf     d7,loc_47958
										movem.l (sp)+,d0-a2
										rts

	; End of function sub_47948


; =============== S U B R O U T I N E =======================================

sub_47992:
										
										movem.l d0-a2,-(sp)
										moveq   #1,d0
										moveq   #$1C,d7
										lea     ((byte_FFA922-$1000000)).w,a0
										lea     byte_47A38(pc), a2
loc_479A2:
										
										move.w  d0,d1
										jsr     j_CheckFlag
										bne.s   loc_479D0
										move.w  #$5E80,d2
										move.w  d2,(a0)
										move.w  d2,2(a0)
										move.w  d2,$C(a0)
										move.w  d2,$E(a0)
										move.w  #3,$10(a0)
										move.l  #eas_Idle,$14(a0)
										bra.w   loc_47A28
loc_479D0:
										
										move.w  d0,d1
										addi.w  #$20,d1 
										jsr     j_CheckFlag
										beq.s   loc_47A28
										clr.w   d2
										move.b  (a2)+,d2
										mulu.w  #$180,d2
										clr.w   d3
										move.b  (a2)+,d3
										mulu.w  #$180,d3
										move.w  d2,(a0)
										move.w  d3,2(a0)
										move.w  d2,$C(a0)
										move.w  d3,$E(a0)
										move.b  #3,$10(a0)
										move.l  #eas_Idle,$14(a0)
										movem.w d0-d4,-(sp)
										jsr     j_GetCharacterSpriteIdx
										move.w  #3,d1
										moveq   #$FFFFFFFF,d2
										move.w  d4,d3
										jsr     (sub_6052).w    
										jsr     (WaitForVInt).w 
										movem.w (sp)+,d0-d4
loc_47A28:
										
										addq.w  #1,d0
										lea     $20(a0),a0
										dbf     d7,loc_479A2
										movem.l (sp)+,d0-a2
										rts

	; End of function sub_47992

byte_47A38:         dc.b $11
										dc.b   7
										dc.b $12
										dc.b   7
										dc.b $14
										dc.b   7
										dc.b $15
										dc.b   7
										dc.b $11
										dc.b  $A
										dc.b $12
										dc.b  $A
										dc.b $14
										dc.b  $A
										dc.b $15
										dc.b  $A
										dc.b $12
										dc.b  $D
										dc.b $13
										dc.b  $D
										dc.b $14
										dc.b  $D
cs_Nothing:         dc.w $FFFF

; =============== S U B R O U T I N E =======================================

; cutscene before the battle begins

j_ExecuteBattleCutscene_Intro_0:
										
										movem.l d1,-(sp)
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$1C2,d1
										jsr     j_CheckFlag
										bne.w   loc_47AE8
										movem.l d0/a0,-(sp)
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										add.w   d0,d0
										move.w  rpt_BeforeBattleCutscenes(pc,d0.w),d0
																						; rpt_BattleCutscenes
										lea     rpt_BeforeBattleCutscenes(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										movem.l (sp)+,d0/a0
										bra.w   loc_47AE8
   include "battles\global\beforebattlecutscenes.asm"		; Before battle cutscenes
loc_47AE8:
										
										movem.l (sp)+,d1
										rts

	; End of function j_ExecuteBattleCutscene_Intro_0


; =============== S U B R O U T I N E =======================================

; cutscene at the start of battle (after units are placed and battle officially begins)
; 
; only seems to happen in first "above Pacalon" battle

ExecuteBattleCutscene_Start:
										
										movem.l d1,-(sp)
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$1C2,d1
										jsr     j_CheckFlag
										bne.w   loc_47B8C
										jsr     j_SetFlag
										movem.l d0/a0,-(sp)
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										add.w   d0,d0
										move.w  rpt_BattleStartCutscenes(pc,d0.w),d0
										lea     rpt_BattleStartCutscenes(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										movem.l (sp)+,d0/a0
										bra.w   loc_47B8C
   include "battles\global\battlestartcutscenes.asm"		; Battle start cutscenes
loc_47B8C:
										
										movem.l (sp)+,d1
										rts

	; End of function ExecuteBattleCutscene_Start


; =============== S U B R O U T I N E =======================================

ExecuteBattleCutscene_Defeated:
										
										movem.l d0-d1/d7-a0,-(sp)
										moveq   #0,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_47C88
										move.w  #$80,d0 
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.w   loc_47C88
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$1F4,d1
										jsr     j_CheckFlag
										bne.w   loc_47C48
										movem.l d0/a0,-(sp)
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										add.w   d0,d0
										move.w  rpt_EnemyDefeatedCutscenes(pc,d0.w),d0
										lea     rpt_EnemyDefeatedCutscenes(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										movem.l (sp)+,d0/a0
										bra.w   loc_47C48

	; End of function ExecuteBattleCutscene_Defeated

   include "battles\global\battleendcutscenes.asm"		; Enemy defeated cutscenes

; START OF FUNCTION CHUNK FOR ExecuteBattleCutscene_Defeated

loc_47C48:
										
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										move.b  EnemyLeaderPresence(pc,d0.w),d0
										tst.b   d0
										beq.s   loc_47C88
										move.w  #$80,d0 
										moveq   #$1F,d7
										lea     (DEAD_COMBATANTS_LIST).l,a0
loc_47C62:
										
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_47C82
										move.w  (DEAD_COMBATANTS_LIST_LENGTH).l,d1
										move.b  d0,(a0,d1.w)
										move.b  #$FF,1(a0,d1.w)
										addq.w  #1,(DEAD_COMBATANTS_LIST_LENGTH).l
loc_47C82:
										
										addq.w  #1,d0
										dbf     d7,loc_47C62
loc_47C88:
										
										movem.l (sp)+,d0-d1/d7-a0
										rts

; END OF FUNCTION CHUNK FOR ExecuteBattleCutscene_Defeated

EnemyLeaderPresence:incbin "battles/global/enemyleaderpresence.bin"

; =============== S U B R O U T I N E =======================================

ExecuteAfterBattleCutscene:
										
										movem.l d0-d1,-(sp)
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										addi.w  #$1F4,d1
										jsr     j_CheckFlag
										bne.w   loc_47D54
										movem.l d0/a0,-(sp)
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										add.w   d0,d0
										move.w  rpt_AfterBattleCutscenes(pc,d0.w),d0
										lea     rpt_AfterBattleCutscenes(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										movem.l (sp)+,d0/a0
										bra.w   loc_47D54

	; End of function ExecuteAfterBattleCutscene

   include "battles\global\afterbattlecutscenes.asm"		; After battle cutscenes

; START OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

loc_47D54:
										
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										move.b  byte_47D6A(pc,d0.w),d0
										jsr     j_JoinForce
										movem.l (sp)+,d0-d1
										rts

; END OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

byte_47D6A:         dc.b 0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0

; =============== S U B R O U T I N E =======================================

sub_47D9E:
										
										movem.l d0-d1/d7-a0,-(sp)
										moveq   #0,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.w   loc_47E66
										move.w  #$80,d0 
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.w   loc_47E66
										lea     word_47E6C(pc), a0
										clr.w   d1
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
loc_47DCA:
										
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_47E66
										cmp.w   (a0),d1
										beq.w   loc_47DEE
										adda.w  #6,a0
										bra.s   loc_47DCA
										move.w  #$80FF,(DEAD_COMBATANTS_LIST).l
										move.w  #1,(DEAD_COMBATANTS_LIST_LENGTH).l
loc_47DEE:
										
										moveq   #0,d0
										moveq   #$1D,d7
loc_47DF2:
										
										move.w  #$FFFF,d1
										jsr     j_SetXPos
										ori.b   #$80,d0
										jsr     j_SetXPos
										moveq   #0,d1
										jsr     j_SetCurrentHP
										andi.b  #$7F,d0 
										addq.w  #1,d0
										dbf     d7,loc_47DF2
										move.w  #$9E,d0 
										jsr     j_SetXPos
										addq.w  #1,d0
										jsr     j_SetXPos
										movea.l 2(a0),a0
										clr.w   d1
loc_47E30:
										
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_47E66
										move.b  (a0),d0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_47E4C
										cmpi.b  #$80,d0
										bne.w   loc_47E60
loc_47E4C:
										
										move.b  1(a0),d1
										jsr     j_SetXPos
										move.b  2(a0),d1
										jsr     j_SetYPos
loc_47E60:
										
										adda.w  #4,a0
										bra.s   loc_47E30
loc_47E66:
										
										movem.l (sp)+,d0-d1/d7-a0
										rts

	; End of function sub_47D9E

word_47E6C:         dc.w 5
										dc.w 4
										dc.w $7E74
										dc.w $FFFF
										dc.w $10
										dc.w $4FF
										dc.w $511
										dc.w $4FF
										dc.w $8011
										dc.w $2FF
										dc.w $FFFF

; =============== S U B R O U T I N E =======================================

; executes cutscenes activated by regions

ExecuteBattleCutscene_Region:
										
										movem.l d0-d1/a0,-(sp)
										lea     loc_47EC0(pc), a0
loc_47E8A:
										
										addq.w  #8,a0
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_47EC2
										move.b  ((CURRENT_BATTLE-$1000000)).w,d1
										cmp.b   (a0),d1
										bne.s   loc_47E8A
										move.w  2(a0),d1
										jsr     j_CheckFlag
										bne.s   loc_47E8A
										clr.w   d0
										move.b  1(a0),d0
										jsr     j_CheckTriggerRegionFlag
										beq.s   loc_47E8A
										jsr     j_SetFlag
										movea.l 4(a0),a0
loc_47EC0:
										
										trap    #6
loc_47EC2:
										
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function ExecuteBattleCutscene_Region

   include "battles\global\regionactivatedcutscenes.asm"		; Region-activated cutscenes

; =============== S U B R O U T I N E =======================================

ExecuteFlashScreenScript:
										
										lea     cs_FlashScreen(pc), a0
										trap    #6
										rts

	; End of function ExecuteFlashScreenScript

cs_FlashScreen:     dc.w $41
										dc.w $1E
										dc.w $FFFF
   include "scripting\cutscenes\cs_introendroutine.asm"		; Subroutine launching intro and end cutscenes
   include "scripting\cutscenes\cs_intro1.asm"		; Intro cutscene 1
   include "scripting\cutscenes\cs_intro2.asm"		; Intro cutscene 2
   include "scripting\cutscenes\cs_intro3.asm"		; Intro cutscene 3
   include "scripting\cutscenes\cs_intro4.asm"		; Intro cutscene 4

; =============== S U B R O U T I N E =======================================

sub_48FE2:
										
										movem.l d0/a0-a1,-(sp)
										lea     (PALETTE_1).l,a0
										lea     ((byte_FFDF2A-$1000000)).w,a1
										moveq   #7,d0
loc_48FF2:
										
										move.l  (a0)+,(a1)+
										dbf     d0,loc_48FF2
										lea     plt_2toFigureOut(pc), a0
										nop
										lea     (PALETTE_1).l,a1
										moveq   #7,d0
loc_49006:
										
										move.l  (a0)+,(a1)+
										dbf     d0,loc_49006
										jsr     (StoreVdpCommandster).w
										moveq   #$A,d0
										jsr     (Sleep).w       
										lea     ((byte_FFDF2A-$1000000)).w,a0
										lea     (PALETTE_1).l,a1
										moveq   #7,d0
loc_49022:
										
										move.l  (a0)+,(a1)+
										dbf     d0,loc_49022
										jsr     (StoreVdpCommandster).w
										moveq   #$A,d0
										jsr     (Sleep).w       
										movem.l (sp)+,d0/a0-a1
										rts

	; End of function sub_48FE2

plt_2toFigureOut:   dc.w 0
										dc.w $C40
										dc.w $E84
										dc.w $24
										dc.w $48
										dc.w $48C
										dc.w $688
										dc.w $AAC
										dc.w 0
										dc.w $222
										dc.w $666
										dc.w $AAA
										dc.w $20E
										dc.w $6AE
										dc.w $AEE
										dc.w $EEE
   include "scripting\cutscenes\cs_end.asm"		; End cutscene

; =============== S U B R O U T I N E =======================================

sub_493EC:
										
										move.w  #$18A,d0
										jsr     (DisplayText).l 
										moveq   #$78,d0 
										rts

	; End of function sub_493EC

										dc.w $20
										dc.w $1F
										dc.w 7
										dc.w $1F
										dc.w 1
										dc.w $1F
										dc.w 2
										dc.w $1F
										dc.w 6
										dc.w $21
										dc.w $80
										dc.w $21
										dc.w $96
										dc.w $1F
										dc.w 3
										dc.w $1D
										dc.w 0
										dc.w $FFFF
										dc.w $24
										dc.w $FFFF
										dc.w $18
										dc.w 0
										dc.w $28
										dc.w $2E
										dc.w 0
										dc.w $19
										dc.w $60D
										dc.w $1703
										dc.w $18
										dc.w 6
										dc.w $28
										dc.w $22
										dc.w 6
										dc.w 7
										dc.w 5
										dc.w 4
										dc.w $FFFF
										dc.w 4
										dc.w $18A
										dc.w $1D
										dc.w 0
										dc.w 3
										dc.w 0
										dc.w 3
										dc.w $A
										dc.w 1
										dc.w 0
										dc.w 4
										dc.w $14
										dc.w $1D
										dc.w 0
										dc.w $8078
										dc.w $1E
										dc.w 4
										dc.w $142
										dc.w 2
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w $FFFF
										dc.w $14
										dc.w $501
										dc.w $15
										dc.w 0
										dc.w $11
										dc.w 1
										dc.w $10
										dc.b 0
										dc.b $20
										dc.w $12
										dc.w 0
										dc.w $13
										dc.w $FFFF
										dc.w 4
										dc.w 0
										dc.w $FFFF
										dc.w 0
										dc.w 5
										dc.w 4
										dc.w 0
										dc.w 1
										dc.w 0
										dc.w 5
										dc.w 4
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w 5
										dc.w $15
										dc.w $FFFF
										dc.w $30
										dc.w $BD50
										dc.b $80
										dc.b $80
										dc.b 0
										dc.b $1D
										dc.b 0
										dc.b 0
										dc.b $80
										dc.b $3C
										dc.b 0
										dc.b $1E
										dc.b $FF
										dc.b $FF
   include "battles\entries\battle01\cs_beforebattle.asm"		; Cutscene before battle 1
   include "battles\entries\battle01\cs_afterbattle.asm"		; Cutscene after battle 1
   include "battles\entries\battle03\cs_beforebattle.asm"		; Cutscene before battle 3
   include "battles\entries\battle04\cs_beforebattle.asm"		; Cutscene before battle 4
   include "battles\entries\battle04\cs_afterbattle.asm"		; Cutscene after battle 4
   include "battles\entries\battle05\cs_battleend.asm"		; Enemy defeated cutscene for battle 5
   include "battles\entries\battle05\cs_afterbattle.asm"		; Cutscene after battle 5
   include "battles\entries\battle06\cs_beforebattle.asm"		; Cutscene before battle 6
   include "battles\entries\battle07\cs_beforebattle.asm"		; Cutscene before battle 7
   include "battles\entries\battle07\cs_afterbattle.asm"		; Cutscene after battle 7
   include "battles\entries\battle08\cs_beforebattle.asm"		; Cutscene before battle 8
   include "battles\entries\battle08\cs_afterbattle.asm"		; Cutscene after battle 8
   include "battles\entries\battle11\cs_beforebattle.asm"		; Cutscene before battle 11
   include "battles\entries\battle12\cs_battleend.asm"		; Enemy defeated cutscene for battle 12
   include "battles\entries\battle12\cs_afterbattle.asm"		; Cutscene after battle 12
   include "battles\entries\battle13\cs_afterbattle.asm"		; Cutscene after battle 13
   include "battles\entries\battle15\cs_beforebattle.asm"		; Cutscene before battle 15
   include "battles\entries\battle15\cs_afterbattle.asm"		; Cutscene after battle 15
   include "battles\entries\battle16\cs_beforebattle.asm"		; Cutscene before battle 16
   include "battles\entries\battle16\cs_afterbattle.asm"		; Cutscene after battle 16
   include "battles\entries\battle18\cs_beforebattle.asm"		; Cutscene before battle 18
   include "battles\entries\battle18\cs_afterbattle.asm"		; Cutscene after battle 18
   include "battles\entries\battle20\cs_afterbattle.asm"		; Cutscene after battle 20
   include "battles\entries\battle21\cs_beforebattle.asm"		; Cutscene before battle 21
   include "battles\entries\battle21\cs_afterbattle.asm"		; Cutscene after battle 21
   include "battles\entries\battle26\cs_beforebattle.asm"		; Cutscene before battle 26
   include "battles\entries\battle26\cs_afterbattle.asm"		; Cutscene after battle 26
   include "battles\entries\battle27\cs_battlestart.asm"		; Start cutscene for battle 27
   include "battles\entries\battle28\cs_beforebattle.asm"		; Cutscene before battle 28
   include "battles\entries\battle28\cs_afterbattle.asm"		; Cutscene after battle 28
   include "battles\entries\battle29\cs_beforebattle.asm"		; Cutscene before battle 29
   include "battles\entries\battle30\cs_beforebattle.asm"		; Cutscene before battle 30
   include "battles\entries\battle30\cs_afterbattle.asm"		; Cutscene after battle 30
   include "battles\entries\battle31\cs_beforebattle.asm"		; Cutscene before battle 31
   include "battles\entries\battle32\cs_beforebattle.asm"		; Cutscene before battle 32
   include "battles\entries\battle32\cs_regiontriggered_1.asm"		; Region-activated cutscene for battle 32
   include "battles\entries\battle32\cs_afterbattle.asm"		; Cutscene after battle 32
   include "battles\entries\battle33\cs_beforebattle.asm"		; Cutscene before battle 33
   include "battles\entries\battle33\cs_afterbattle.asm"		; Cutscene after battle 33
   include "battles\entries\battle34\cs_beforebattle.asm"		; Cutscene before battle 34
   include "battles\entries\battle34\cs_afterbattle.asm"		; Cutscene after battle 34
   include "battles\entries\battle35\cs_beforebattle.asm"		; Cutscene before battle 35
   include "battles\entries\battle36\cs_beforebattle.asm"		; Cutscene before battle 36
   include "battles\entries\battle36\cs_afterbattle.asm"		; Cutscene after battle 36
   include "battles\entries\battle37\cs_beforebattle.asm"		; Cutscene before battle 37
   include "battles\entries\battle37\cs_afterbattle.asm"		; Cutscene after battle 37
   include "battles\entries\battle38\cs_beforebattle.asm"		; Cutscene before battle 38
   include "battles\entries\battle38\cs_afterbattle.asm"		; Cutscene after battle 38
   include "battles\entries\battle39\cs_beforebattle.asm"		; Cutscene before battle 39
   include "battles\entries\battle40\cs_beforebattle.asm"		; Cutscene before battle 40
   include "battles\entries\battle40\cs_regiontriggered_1.asm"		; Region-activated cutscene 1 for battle 40
   include "battles\entries\battle40\cs_regiontriggered_2.asm"		; Region-activated cutscene 2 for battle 40
   include "battles\entries\battle40\cs_afterbattle.asm"		; Cutscene after battle 40
   include "battles\entries\battle41\cs_beforebattle.asm"		; Cutscene before battle 41
   include "battles\entries\battle42\cs_beforebattle.asm"		; Cutscene before battle 42
   include "battles\entries\battle42\cs_afterbattle.asm"		; Cutscene after battle 42
   include "battles\entries\battle43\cs_battleend.asm"		; Enemy defeated cutscene for battle 43
   include "battles\entries\battle43\cs_afterbattle.asm"		; Cutscene after battle 43
   include "battles\entries\battle00\cs_afterbattle.asm"		; Cutscene after battle 0

; =============== S U B R O U T I N E =======================================

sub_4F48A:
										
										movem.l d1-d5/a0,-(sp)
										move.w  d0,d4
										move.w  d1,d5
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d3
										subq.w  #1,d3
loc_4F4A2:
										
										clr.w   d0
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmpi.w  #4,d2
										bcs.w   loc_4F510
										dbf     d3,loc_4F4A2
										moveq   #1,d0
										tst.w   d5
										beq.w   loc_4F53C
										move.w  d4,(RAM_Dialogue_NameIdx1).l
										trap    #TRAP_TEXTBOX
										dc.w $D6                ; "Found the {ITEM}, but{N}can't carry it.{N}You must discard something.{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										movem.w d4,-(sp)
										bsr.w   sub_4F570
										movem.w (sp)+,d1
										move.w  d0,(RAM_Dialogue_NameIdx1).l
										move.w  d2,(RAM_Dialogue_NameIdx2).l
										jsr     j_AddItem
										move.w  d1,(RAM_Dialogue_NameIdx3).l
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_ITEM
										trap    #TRAP_TEXTBOX
										dc.w $D7                ; "{NAME} discarded{N}the {ITEM} and{N}picked up the {ITEM}."
										jsr     j_FadeOut_WaitForP2Input
										jsr     (WaitForPlayerInput).w
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										moveq   #2,d0
										bra.w   loc_4F53C
loc_4F510:
										
										move.w  d4,d1
										jsr     j_AddItem
										move.w  d0,(RAM_Dialogue_NameIdx1).l
										move.w  d1,(RAM_Dialogue_NameIdx2).l
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_ITEM
										trap    #TRAP_TEXTBOX
										dc.w $D5                ; "{NAME} received the{N}{ITEM}."
										jsr     j_FadeOut_WaitForP2Input
										jsr     (WaitForPlayerInput).w
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										clr.w   d0
loc_4F53C:
										
										movem.l (sp)+,d1-d5/a0
										rts

	; End of function sub_4F48A


; =============== S U B R O U T I N E =======================================

sub_4F542:
										
										movem.w d1-d2,-(sp)
										move.w  d0,d1
										jsr     j_sub_9146
										cmpi.w  #$FFFF,d0
										beq.w   loc_4F56A
										jsr     j_RemoveItemBySlot
										move.w  #$FFFF,d0
										cmpi.w  #3,d2
										beq.w   loc_4F56A
										clr.w   d0
loc_4F56A:
										
										movem.w (sp)+,d1-d2
										rts

	; End of function sub_4F542


; =============== S U B R O U T I N E =======================================

sub_4F570:
										
										movem.l d7-a1,-(sp)
										link    a6,#-$C
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     (byte_FFB0AE).l,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,(word_FFB12E).l
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #1,d7
loc_4F596:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_4F596
loc_4F59C:
										
										move.b  #1,(byte_FFB13C).l
										jsr     sub_10044
										cmpi.w  #$FFFF,d0
										bne.w   loc_4F5B6
										bra.w   loc_4F6CA
loc_4F5B6:
										
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										move.l  8(a0),-$A(a6)
										move.b  -$A(a6),d1
										andi.b  #$10,d1
										cmpi.b  #0,d1
										beq.s   loc_4F5F0
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #TRAP_TEXTBOX
										dc.w $25                ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
										bra.w   loc_4F6CA
loc_4F5F0:
										
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #TRAP_TEXTBOX
										dc.w $2C                ; "The {ITEM} will be{N}discarded.  Are you sure?"
										jsr     j_YesNoChoiceBox
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										cmpi.w  #0,d0
										beq.w   loc_4F610
										bra.s   loc_4F59C
loc_4F610:
										
										move.w  -4(a6),d1
										jsr     j_GetItemType
										cmpi.w  #1,d2
										bne.s   loc_4F65C
										move.w  -2(a6),d0
										jsr     j_GetEquippedWeapon
										cmpi.w  #$FFFF,d1
										beq.w   loc_4F69C
										cmp.w   -6(a6),d2
										bne.w   loc_4F69C
										move.w  -4(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_4F69C
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #TRAP_TEXTBOX
										dc.w $1E                ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										bra.w   loc_4F6CA
loc_4F65C:
										
										cmpi.w  #0,d2
										beq.w   loc_4F69C
										move.w  -2(a6),d0
										jsr     j_GetEquippedRing
										cmpi.w  #$FFFF,d1
										beq.w   loc_4F69C
										cmp.w   -6(a6),d2
										bne.w   loc_4F69C
										move.w  -4(a6),d1
										jsr     j_IsItemCursed
										bcc.w   loc_4F69C
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #TRAP_TEXTBOX
										dc.w $1E                ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
										bra.w   loc_4F6CA
loc_4F69C:
										
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										move.b  -$A(a6),d1
										andi.b  #8,d1
										cmpi.b  #0,d1
										beq.s   loc_4F6CE
										move.w  -4(a6),d1
										jsr     j_AddItemToDeals
loc_4F6CA:
										
										bra.w   loc_4F59C
loc_4F6CE:
										
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										move.w  -4(a6),d2
										unlk    a6
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_4F570

   include "maps\global\mapsetups.asm"		; Map setups table
   include "maps\entries\map66\mapsetups\pt.asm"		; 
   include "maps\entries\map66\mapsetups\s1.asm"		; 
   include "maps\entries\map66\mapsetups\s2.asm"		; 
   include "maps\entries\map66\mapsetups\s3.asm"		; 
   include "maps\entries\map66\mapsetups\s4.asm"		; 
   include "maps\entries\map66\mapsetups\s5.asm"		; 
   include "maps\entries\map66\mapsetups\s6.asm"		; 
   include "maps\entries\map67\mapsetups\pt.asm"		; 
   include "maps\entries\map67\mapsetups\s1.asm"		; 
   include "maps\entries\map67\mapsetups\s2.asm"		; 
   include "maps\entries\map67\mapsetups\s3.asm"		; 
   include "maps\entries\map67\mapsetups\s4.asm"		; 
   include "maps\entries\map67\mapsetups\s5.asm"		; 
   include "maps\entries\map67\mapsetups\s6.asm"		; 
   include "maps\entries\map68\mapsetups\pt.asm"		; 
   include "maps\entries\map68\mapsetups\s1.asm"		; 
   include "maps\entries\map68\mapsetups\s2.asm"		; 
   include "maps\entries\map68\mapsetups\s3.asm"		; 
   include "maps\entries\map68\mapsetups\s4.asm"		; 
   include "maps\entries\map68\mapsetups\s5.asm"		; 
   include "maps\entries\map68\mapsetups\s6.asm"		; 
   include "maps\entries\map69\mapsetups\pt.asm"		; 
   include "maps\entries\map69\mapsetups\s1.asm"		; 
   include "maps\entries\map69\mapsetups\s3.asm"		; 
   include "maps\entries\map69\mapsetups\s2.asm"		; 
   include "maps\entries\map69\mapsetups\s4.asm"		; 
   include "maps\entries\map69\mapsetups\s5.asm"		; 
   include "maps\entries\map69\mapsetups\s6.asm"		; 
   include "maps\entries\map70\mapsetups\pt.asm"		; 
   include "maps\entries\map70\mapsetups\s1.asm"		; 
   include "maps\entries\map70\mapsetups\s3.asm"		; 
   include "maps\entries\map70\mapsetups\s2.asm"		; 
   include "maps\entries\map70\mapsetups\s4.asm"		; 
   include "maps\entries\map70\mapsetups\s5.asm"		; 
   include "maps\entries\map70\mapsetups\s6.asm"		; 
   include "maps\entries\map72\mapsetups\pt.asm"		; 
   include "maps\entries\map72\mapsetups\s1.asm"		; 
   include "maps\entries\map72\mapsetups\s2.asm"		; 
   include "maps\entries\map72\mapsetups\s3.asm"		; 
   include "maps\entries\map72\mapsetups\s4.asm"		; 
   include "maps\entries\map72\mapsetups\s5.asm"		; 
   include "maps\entries\map72\mapsetups\s6.asm"		; 
   include "maps\entries\map73\mapsetups\pt.asm"		; 
   include "maps\entries\map73\mapsetups\s1.asm"		; 
   include "maps\entries\map73\mapsetups\s3.asm"		; 
   include "maps\entries\map73\mapsetups\s2.asm"		; 
   include "maps\entries\map73\mapsetups\s4.asm"		; 
   include "maps\entries\map73\mapsetups\s5.asm"		; 
   include "maps\entries\map73\mapsetups\s6.asm"		; 
   include "maps\entries\map74\mapsetups\pt.asm"		; 
   include "maps\entries\map74\mapsetups\s1.asm"		; 
   include "maps\entries\map74\mapsetups\s3.asm"		; 
   include "maps\entries\map74\mapsetups\s2.asm"		; 
   include "maps\entries\map74\mapsetups\s4.asm"		; 
   include "maps\entries\map74\mapsetups\s5.asm"		; 
   include "maps\entries\map74\mapsetups\s6.asm"		; 
   include "maps\entries\map75\mapsetups\pt.asm"		; 
   include "maps\entries\map75\mapsetups\s1.asm"		; 
   include "maps\entries\map75\mapsetups\s3.asm"		; 
   include "maps\entries\map75\mapsetups\s2.asm"		; 
   include "maps\entries\map75\mapsetups\s4.asm"		; 
   include "maps\entries\map75\mapsetups\s5.asm"		; 
   include "maps\entries\map75\mapsetups\s6.asm"		; 
   include "maps\entries\map76\mapsetups\pt.asm"		; 
   include "maps\entries\map76\mapsetups\s1.asm"		; 
   include "maps\entries\map76\mapsetups\s3.asm"		; 
   include "maps\entries\map76\mapsetups\s2.asm"		; 
   include "maps\entries\map76\mapsetups\s4.asm"		; 
   include "maps\entries\map76\mapsetups\s5.asm"		; 
   include "maps\entries\map76\mapsetups\s6.asm"		; 
   include "maps\entries\map77\mapsetups\pt.asm"		; 
   include "maps\entries\map77\mapsetups\s1.asm"		; 
   include "maps\entries\map77\mapsetups\s3.asm"		; 
   include "maps\entries\map77\mapsetups\s2.asm"		; 
   include "maps\entries\map77\mapsetups\s4.asm"		; 
   include "maps\entries\map77\mapsetups\s5.asm"		; 
   include "maps\entries\map77\mapsetups\s6.asm"		; 
   include "maps\entries\map03\mapsetups\pt.asm"		; 
   include "maps\entries\map03\mapsetups\pt_261.asm"		; 
   include "maps\entries\map03\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map03\mapsetups\s1.asm"		; 
   include "maps\entries\map03\mapsetups\s1_261.asm"		; 
   include "maps\entries\map03\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map03\mapsetups\s3.asm"		; 
   include "maps\entries\map03\mapsetups\s3_261.asm"		; 
   include "maps\entries\map03\mapsetups\s3_1FA.asm"		; 
   include "maps\entries\map03\mapsetups\s2.asm"		; 
   include "maps\entries\map03\mapsetups\s2_261.asm"		; 
   include "maps\entries\map03\mapsetups\s2_1FA.asm"		; 
   include "maps\entries\map03\mapsetups\s4.asm"		; 
   include "maps\entries\map03\mapsetups\s5.asm"		; 
   include "maps\entries\map03\mapsetups\s6_1FA.asm"		; 
   include "maps\entries\map03\mapsetups\s6.asm"		; 
   include "maps\entries\map03\mapsetups\s6_261.asm"		; 
   include "maps\entries\map04\mapsetups\pt.asm"		; 
   include "maps\entries\map04\mapsetups\s1.asm"		; 
   include "maps\entries\map04\mapsetups\s3.asm"		; 
   include "maps\entries\map04\mapsetups\s2.asm"		; 
   include "maps\entries\map04\mapsetups\s4.asm"		; 
   include "maps\entries\map04\mapsetups\s5.asm"		; 
   include "maps\entries\map04\mapsetups\s6.asm"		; 
   include "maps\entries\map05\mapsetups\pt.asm"		; 
   include "maps\entries\map05\mapsetups\pt_28A.asm"		; 
   include "maps\entries\map05\mapsetups\s1.asm"		; 
   include "maps\entries\map05\mapsetups\s1_28A.asm"		; 
   include "maps\entries\map05\mapsetups\s2.asm"		; 
   include "maps\entries\map05\mapsetups\s2_28A.asm"		; 
   include "maps\entries\map05\mapsetups\s3.asm"		; 
   include "maps\entries\map05\mapsetups\s4.asm"		; 
   include "maps\entries\map05\mapsetups\s5.asm"		; 
   include "maps\entries\map05\mapsetups\s6.asm"		; 
   include "maps\entries\map16\mapsetups\pt_297.asm"		; 
   include "maps\entries\map16\mapsetups\pt.asm"		; 
   include "maps\entries\map16\mapsetups\s1_297.asm"		; 
   include "maps\entries\map16\mapsetups\s1.asm"		; 
   include "maps\entries\map16\mapsetups\s2_297.asm"		; 
   include "maps\entries\map16\mapsetups\s2.asm"		; 
   include "maps\entries\map16\mapsetups\s3.asm"		; 
   include "maps\entries\map16\mapsetups\s4.asm"		; 
   include "maps\entries\map16\mapsetups\s5.asm"		; 
   include "maps\entries\map16\mapsetups\s6.asm"		; 
   include "maps\entries\map17\mapsetups\pt.asm"		; 
   include "maps\entries\map17\mapsetups\pt_1F9.asm"		; 
   include "maps\entries\map17\mapsetups\s1.asm"		; 
   include "maps\entries\map17\mapsetups\s1_1F9.asm"		; 
   include "maps\entries\map17\mapsetups\s2.asm"		; 
   include "maps\entries\map17\mapsetups\s3.asm"		; 
   include "maps\entries\map17\mapsetups\s3_1F9.asm"		; 
   include "maps\entries\map17\mapsetups\s4.asm"		; 
   include "maps\entries\map17\mapsetups\s5.asm"		; 
   include "maps\entries\map17\mapsetups\s6.asm"		; 
   include "maps\entries\map18\mapsetups\pt.asm"		; 
   include "maps\entries\map18\mapsetups\s1.asm"		; 
   include "maps\entries\map18\mapsetups\s2.asm"		; 
   include "maps\entries\map18\mapsetups\s3.asm"		; 
   include "maps\entries\map18\mapsetups\s4.asm"		; 
   include "maps\entries\map18\mapsetups\s5.asm"		; 
   include "maps\entries\map18\mapsetups\s6.asm"		; 
   include "maps\entries\map19\mapsetups\pt.asm"		; 
   include "maps\entries\map19\mapsetups\pt_1F5.asm"		; 
   include "maps\entries\map19\mapsetups\pt_261.asm"		; 
   include "maps\entries\map19\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map19\mapsetups\pt_1FB.asm"		; 
   include "maps\entries\map19\mapsetups\s1.asm"		; 
   include "maps\entries\map19\mapsetups\s1_1F5.asm"		; 
   include "maps\entries\map19\mapsetups\s1_261.asm"		; 
   include "maps\entries\map19\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map19\mapsetups\s1_1FB.asm"		; 
   include "maps\entries\map19\mapsetups\s3.asm"		; 
   include "maps\entries\map19\mapsetups\s3_1FA.asm"		; 
   include "maps\entries\map19\mapsetups\s3_1FB.asm"		; 
   include "maps\entries\map19\mapsetups\s2.asm"		; 
   include "maps\entries\map19\mapsetups\s2_1F5.asm"		; 
   include "maps\entries\map19\mapsetups\s2_261.asm"		; 
   include "maps\entries\map19\mapsetups\s2_1FA.asm"		; 
   include "maps\entries\map19\mapsetups\s2_1FB.asm"		; 
   include "maps\entries\map19\mapsetups\s4.asm"		; 
   include "maps\entries\map19\mapsetups\s5.asm"		; 
   include "maps\entries\map19\mapsetups\s6.asm"		; 
   include "maps\entries\map19\mapsetups\s6_261.asm"		; 
   include "maps\entries\map19\mapsetups\s6_1FA.asm"		; 
   include "maps\entries\map19\mapsetups\s6_1FB.asm"		; 
   include "maps\entries\map20\mapsetups\pt.asm"		; 
   include "maps\entries\map20\mapsetups\pt_1F5.asm"		; 
   include "maps\entries\map20\mapsetups\pt_261.asm"		; 
   include "maps\entries\map20\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map20\mapsetups\s1.asm"		; 
   include "maps\entries\map20\mapsetups\s1_1F5.asm"		; 
   include "maps\entries\map20\mapsetups\s1_261.asm"		; 
   include "maps\entries\map20\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map20\mapsetups\s3.asm"		; 
   include "maps\entries\map20\mapsetups\s3_1F5.asm"		; 
   include "maps\entries\map20\mapsetups\s2.asm"		; 
   include "maps\entries\map20\mapsetups\s2_1F5.asm"		; 
   include "maps\entries\map20\mapsetups\s2_261.asm"		; 
   include "maps\entries\map20\mapsetups\s2_1FA.asm"		; 
   include "maps\entries\map20\mapsetups\s4.asm"		; 
   include "maps\entries\map20\mapsetups\s5.asm"		; 
   include "maps\entries\map20\mapsetups\s6.asm"		; 
   include "maps\entries\map21\mapsetups\pt.asm"		; 
   include "maps\entries\map21\mapsetups\pt_1F5.asm"		; 
   include "maps\entries\map21\mapsetups\pt_261.asm"		; 
   include "maps\entries\map21\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map21\mapsetups\s1.asm"		; 
   include "maps\entries\map21\mapsetups\s1_261.asm"		; 
   include "maps\entries\map21\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map21\mapsetups\s3.asm"		; 
   include "maps\entries\map21\mapsetups\s2.asm"		; 
   include "maps\entries\map21\mapsetups\s2_1F5.asm"		; 
   include "maps\entries\map21\mapsetups\s2_261.asm"		; 
   include "maps\entries\map21\mapsetups\s2_1FA.asm"		; 
   include "maps\entries\map21\mapsetups\s4.asm"		; 
   include "maps\entries\map21\mapsetups\s5.asm"		; 
   include "maps\entries\map21\mapsetups\s6.asm"		; 
   include "maps\entries\map40\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map40\mapsetups\pt.asm"		; 
   include "maps\entries\map40\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map40\mapsetups\s1.asm"		; 
   include "maps\entries\map40\mapsetups\s2.asm"		; 
   include "maps\entries\map40\mapsetups\s3.asm"		; 
   include "maps\entries\map40\mapsetups\s4.asm"		; 
   include "maps\entries\map40\mapsetups\s5.asm"		; 
   include "maps\entries\map40\mapsetups\s6.asm"		; 
   include "maps\entries\map43\mapsetups\pt.asm"		; 
   include "maps\entries\map43\mapsetups\pt_264.asm"		; 
   include "maps\entries\map43\mapsetups\s1.asm"		; 
   include "maps\entries\map43\mapsetups\s1_264.asm"		; 
   include "maps\entries\map43\mapsetups\s3.asm"		; 
   include "maps\entries\map43\mapsetups\s2.asm"		; 
   include "maps\entries\map43\mapsetups\s5.asm"		; 
   include "maps\entries\map43\mapsetups\s4.asm"		; 
   include "maps\entries\map43\mapsetups\s6.asm"		; 
   include "maps\entries\map44\mapsetups\pt.asm"		; 
   include "maps\entries\map44\mapsetups\pt_261.asm"		; 
   include "maps\entries\map44\mapsetups\pt_1FA.asm"		; 
   include "maps\entries\map44\mapsetups\pt_1FB.asm"		; 
   include "maps\entries\map44\mapsetups\s1.asm"		; 
   include "maps\entries\map44\mapsetups\s1_261.asm"		; 
   include "maps\entries\map44\mapsetups\s1_1FA.asm"		; 
   include "maps\entries\map44\mapsetups\s1_1FB.asm"		; 
   include "maps\entries\map44\mapsetups\s3.asm"		; 
   include "maps\entries\map44\mapsetups\s2.asm"		; 
   include "maps\entries\map44\mapsetups\s2_261.asm"		; 
   include "maps\entries\map44\mapsetups\s2_1FA.asm"		; 
   include "maps\entries\map44\mapsetups\s2_1FB.asm"		; 
   include "maps\entries\map44\mapsetups\s5.asm"		; 
   include "maps\entries\map44\mapsetups\s4.asm"		; 
   include "maps\entries\map44\mapsetups\s6_1FB.asm"		; 
   include "maps\entries\map06\mapsetups\pt_2BE.asm"		; 
   include "maps\entries\map06\mapsetups\pt.asm"		; 
   include "maps\entries\map06\mapsetups\pt_2BD.asm"		; 
   include "maps\entries\map06\mapsetups\s1_2BE.asm"		; 
   include "maps\entries\map06\mapsetups\s1.asm"		; 
   include "maps\entries\map06\mapsetups\s1_2BD.asm"		; 
   include "maps\entries\map06\mapsetups\s2_2BE.asm"		; 
   include "maps\entries\map06\mapsetups\s2.asm"		; 
   include "maps\entries\map06\mapsetups\s2_2BD.asm"		; 
   include "maps\entries\map06\mapsetups\s3.asm"		; 
   include "maps\entries\map06\mapsetups\s4_2BE.asm"		; 
   include "maps\entries\map06\mapsetups\s4.asm"		; 
   include "maps\entries\map06\mapsetups\s5.asm"		; 
   include "maps\entries\map06\mapsetups\s6.asm"		; 
   include "maps\entries\map07\mapsetups\pt.asm"		; 
   include "maps\entries\map07\mapsetups\pt_2BD.asm"		; 
   include "maps\entries\map07\mapsetups\pt_325.asm"		; 
   include "maps\entries\map07\mapsetups\s1.asm"		; 
   include "maps\entries\map07\mapsetups\s1_2BD.asm"		; 
   include "maps\entries\map07\mapsetups\s1_325.asm"		; 
   include "maps\entries\map07\mapsetups\s2.asm"		; 
   include "maps\entries\map07\mapsetups\s2_2BD.asm"		; 
   include "maps\entries\map07\mapsetups\s2_325.asm"		; 
   include "maps\entries\map07\mapsetups\s3.asm"		; 
   include "maps\entries\map07\mapsetups\s4.asm"		; 
   include "maps\entries\map07\mapsetups\s5.asm"		; 
   include "maps\entries\map07\mapsetups\s6.asm"		; 
   include "maps\entries\map08\mapsetups\pt_2C4.asm"		; 
   include "maps\entries\map08\mapsetups\pt.asm"		; 
   include "maps\entries\map08\mapsetups\s1_2C4.asm"		; 
   include "maps\entries\map08\mapsetups\s1.asm"		; 
   include "maps\entries\map08\mapsetups\s2_2C4.asm"		; 
   include "maps\entries\map08\mapsetups\s2.asm"		; 
   include "maps\entries\map08\mapsetups\s3.asm"		; 
   include "maps\entries\map08\mapsetups\s4.asm"		; 
   include "maps\entries\map08\mapsetups\s5.asm"		; 
   include "maps\entries\map08\mapsetups\s6.asm"		; 
   include "maps\entries\map09\mapsetups\pt.asm"		; 
   include "maps\entries\map09\mapsetups\pt_206.asm"		; 
   include "maps\entries\map09\mapsetups\s1.asm"		; 
   include "maps\entries\map09\mapsetups\s1_206.asm"		; 
   include "maps\entries\map09\mapsetups\s2.asm"		; 
   include "maps\entries\map09\mapsetups\s3.asm"		; 
   include "maps\entries\map09\mapsetups\s4.asm"		; 
   include "maps\entries\map09\mapsetups\s5.asm"		; 
   include "maps\entries\map09\mapsetups\s6.asm"		; 
   include "maps\entries\map10\mapsetups\pt.asm"		; 
   include "maps\entries\map10\mapsetups\pt_2D2.asm"		; 
   include "maps\entries\map10\mapsetups\s1.asm"		; 
   include "maps\entries\map10\mapsetups\s1_2D2.asm"		; 
   include "maps\entries\map10\mapsetups\s2.asm"		; 
   include "maps\entries\map10\mapsetups\s2_2D2.asm"		; 
   include "maps\entries\map10\mapsetups\s3.asm"		; 
   include "maps\entries\map10\mapsetups\s3_2D2.asm"		; 
   include "maps\entries\map10\mapsetups\s4.asm"		; 
   include "maps\entries\map10\mapsetups\s5.asm"		; 
   include "maps\entries\map10\mapsetups\s6.asm"		; 
   include "maps\entries\map10\mapsetups\s6_2D2.asm"		; 
   include "maps\entries\map11\mapsetups\pt.asm"		; 
   include "maps\entries\map11\mapsetups\s1.asm"		; 
   include "maps\entries\map11\mapsetups\s2.asm"		; 
   include "maps\entries\map11\mapsetups\s3.asm"		; 
   include "maps\entries\map11\mapsetups\s4.asm"		; 
   include "maps\entries\map11\mapsetups\s5.asm"		; 
   include "maps\entries\map11\mapsetups\s6.asm"		; 
   include "maps\entries\map12\mapsetups\pt.asm"		; 
   include "maps\entries\map12\mapsetups\s1.asm"		; 
   include "maps\entries\map12\mapsetups\s2.asm"		; 
   include "maps\entries\map12\mapsetups\s3.asm"		; 
   include "maps\entries\map12\mapsetups\s4.asm"		; 
   include "maps\entries\map12\mapsetups\s5.asm"		; 
   include "maps\entries\map12\mapsetups\s6.asm"		; 
   include "maps\entries\map13\mapsetups\pt.asm"		; 
   include "maps\entries\map13\mapsetups\pt_2C6.asm"		; 
   include "maps\entries\map13\mapsetups\pt_31F.asm"		; 
   include "maps\entries\map13\mapsetups\pt_201.asm"		; 
   include "maps\entries\map13\mapsetups\s1.asm"		; 
   include "maps\entries\map13\mapsetups\s1_2C6.asm"		; 
   include "maps\entries\map13\mapsetups\s1_31F.asm"		; 
   include "maps\entries\map13\mapsetups\s1_201.asm"		; 
   include "maps\entries\map13\mapsetups\s2.asm"		; 
   include "maps\entries\map13\mapsetups\s2_201.asm"		; 
   include "maps\entries\map13\mapsetups\s3.asm"		; 
   include "maps\entries\map13\mapsetups\s4.asm"		; 
   include "maps\entries\map13\mapsetups\s5.asm"		; 
   include "maps\entries\map13\mapsetups\s6.asm"		; 
   include "maps\entries\map14\mapsetups\pt.asm"		; 
   include "maps\entries\map14\mapsetups\pt_1CA.asm"		; 
   include "maps\entries\map14\mapsetups\s3.asm"		; 
   include "maps\entries\map14\mapsetups\s2.asm"		; 
   include "maps\entries\map14\mapsetups\s1.asm"		; 
   include "maps\entries\map14\mapsetups\s4.asm"		; 
   include "maps\entries\map14\mapsetups\s6.asm"		; 
   include "maps\entries\map14\mapsetups\s1_1CA.asm"		; 
   include "maps\entries\map14\mapsetups\s2_1CA.asm"		; 
   include "maps\entries\map14\mapsetups\s3_1CA.asm"		; 
   include "maps\entries\map14\mapsetups\s6_1CA.asm"		; 
   include "maps\entries\map14\mapsetups\s5.asm"		; 
   include "maps\entries\map22\mapsetups\pt.asm"		; 
   include "maps\entries\map22\mapsetups\pt_20A.asm"		; 
   include "maps\entries\map22\mapsetups\s1.asm"		; 
   include "maps\entries\map22\mapsetups\s1_20A.asm"		; 
   include "maps\entries\map22\mapsetups\s2.asm"		; 
   include "maps\entries\map22\mapsetups\s3.asm"		; 
   include "maps\entries\map22\mapsetups\s4.asm"		; 
   include "maps\entries\map22\mapsetups\s5.asm"		; 
   include "maps\entries\map22\mapsetups\s6.asm"		; 
   include "maps\entries\map23\mapsetups\pt.asm"		; 
   include "maps\entries\map23\mapsetups\pt_2FA.asm"		; 
   include "maps\entries\map23\mapsetups\s1.asm"		; 
   include "maps\entries\map23\mapsetups\s1_2FA.asm"		; 
   include "maps\entries\map23\mapsetups\s2.asm"		; 
   include "maps\entries\map23\mapsetups\s2_2FA.asm"		; 
   include "maps\entries\map23\mapsetups\s3.asm"		; 
   include "maps\entries\map23\mapsetups\s4.asm"		; 
   include "maps\entries\map23\mapsetups\s5.asm"		; 
   include "maps\entries\map23\mapsetups\s6.asm"		; 
   include "maps\entries\map24\mapsetups\pt.asm"		; 
   include "maps\entries\map24\mapsetups\s1.asm"		; 
   include "maps\entries\map24\mapsetups\s2.asm"		; 
   include "maps\entries\map24\mapsetups\s3.asm"		; 
   include "maps\entries\map24\mapsetups\s4.asm"		; 
   include "maps\entries\map24\mapsetups\s5.asm"		; 
   include "maps\entries\map24\mapsetups\s6.asm"		; 
   include "maps\entries\map26\mapsetups\pt.asm"		; 
   include "maps\entries\map26\mapsetups\s1.asm"		; 
   include "maps\entries\map26\mapsetups\s2.asm"		; 
   include "maps\entries\map26\mapsetups\s3.asm"		; 
   include "maps\entries\map26\mapsetups\s4.asm"		; 
   include "maps\entries\map26\mapsetups\s5.asm"		; 
   include "maps\entries\map26\mapsetups\s6.asm"		; 
   include "maps\entries\map27\mapsetups\pt.asm"		; 
   include "maps\entries\map27\mapsetups\pt_20B.asm"		; 
   include "maps\entries\map27\mapsetups\s1.asm"		; 
   include "maps\entries\map27\mapsetups\s1_20B.asm"		; 
   include "maps\entries\map27\mapsetups\s2.asm"		; 
   include "maps\entries\map27\mapsetups\s3.asm"		; 
   include "maps\entries\map27\mapsetups\s4.asm"		; 
   include "maps\entries\map27\mapsetups\s5.asm"		; 
   include "maps\entries\map27\mapsetups\s6.asm"		; 
   include "maps\entries\map29\mapsetups\pt.asm"		; 
   include "maps\entries\map29\mapsetups\s1.asm"		; 
   include "maps\entries\map29\mapsetups\s2.asm"		; 
   include "maps\entries\map29\mapsetups\s3.asm"		; 
   include "maps\entries\map29\mapsetups\s4.asm"		; 
   include "maps\entries\map29\mapsetups\s5.asm"		; 
   include "maps\entries\map29\mapsetups\s6.asm"		; 
   include "maps\entries\map30\mapsetups\pt.asm"		; 
   include "maps\entries\map30\mapsetups\pt_311.asm"		; 
   include "maps\entries\map30\mapsetups\pt_2F9.asm"		; 
   include "maps\entries\map30\mapsetups\s1.asm"		; 
   include "maps\entries\map30\mapsetups\s1_311.asm"		; 
   include "maps\entries\map30\mapsetups\s1_2F9.asm"		; 
   include "maps\entries\map30\mapsetups\s2.asm"		; 
   include "maps\entries\map30\mapsetups\s3.asm"		; 
   include "maps\entries\map30\mapsetups\s4.asm"		; 
   include "maps\entries\map30\mapsetups\s5.asm"		; 
   include "maps\entries\map30\mapsetups\s6.asm"		; 
   include "maps\entries\map33\mapsetups\pt.asm"		; 
   include "maps\entries\map33\mapsetups\pt_20B.asm"		; 
   include "maps\entries\map33\mapsetups\pt_310.asm"		; 
   include "maps\entries\map33\mapsetups\pt_312.asm"		; 
   include "maps\entries\map33\mapsetups\s1.asm"		; 
   include "maps\entries\map33\mapsetups\s1_20B.asm"		; 
   include "maps\entries\map33\mapsetups\s1_310.asm"		; 
   include "maps\entries\map33\mapsetups\s1_312.asm"		; 
   include "maps\entries\map33\mapsetups\s2.asm"		; 
   include "maps\entries\map33\mapsetups\s3.asm"		; 
   include "maps\entries\map33\mapsetups\s4.asm"		; 
   include "maps\entries\map33\mapsetups\s5.asm"		; 
   include "maps\entries\map33\mapsetups\s6.asm"		; 
   include "maps\entries\map33\mapsetups\s6_312.asm"		; 
   include "maps\entries\map34\mapsetups\pt.asm"		; 
   include "maps\entries\map34\mapsetups\pt_310.asm"		; 
   include "maps\entries\map34\mapsetups\s1.asm"		; 
   include "maps\entries\map34\mapsetups\s1_310.asm"		; 
   include "maps\entries\map34\mapsetups\s2.asm"		; 
   include "maps\entries\map34\mapsetups\s3.asm"		; 
   include "maps\entries\map34\mapsetups\s4.asm"		; 
   include "maps\entries\map34\mapsetups\s5.asm"		; 
   include "maps\entries\map34\mapsetups\s6.asm"		; 
   include "maps\entries\map46\mapsetups\pt.asm"		; 
   include "maps\entries\map46\mapsetups\s1.asm"		; 
   include "maps\entries\map46\mapsetups\s2.asm"		; 
   include "maps\entries\map46\mapsetups\s3.asm"		; 
   include "maps\entries\map46\mapsetups\s4.asm"		; 
   include "maps\entries\map46\mapsetups\s5.asm"		; 
   include "maps\entries\map46\mapsetups\s6.asm"		; 
   include "maps\entries\map51\mapsetups\pt.asm"		; 
   include "maps\entries\map51\mapsetups\pt_208.asm"		; 
   include "maps\entries\map51\mapsetups\s1.asm"		; 
   include "maps\entries\map51\mapsetups\s1_208.asm"		; 
   include "maps\entries\map51\mapsetups\s2.asm"		; 
   include "maps\entries\map51\mapsetups\s3.asm"		; 
   include "maps\entries\map51\mapsetups\s4.asm"		; 
   include "maps\entries\map51\mapsetups\s5.asm"		; 
   include "maps\entries\map51\mapsetups\s6.asm"		; 
   include "maps\entries\map52\mapsetups\pt.asm"		; 
   include "maps\entries\map52\mapsetups\pt_200.asm"		; 
   include "maps\entries\map52\mapsetups\s1.asm"		; 
   include "maps\entries\map52\mapsetups\s1_200.asm"		; 
   include "maps\entries\map52\mapsetups\s2.asm"		; 
   include "maps\entries\map52\mapsetups\s3.asm"		; 
   include "maps\entries\map52\mapsetups\s4.asm"		; 
   include "maps\entries\map52\mapsetups\s5.asm"		; 
   include "maps\entries\map52\mapsetups\s6.asm"		; 
   include "maps\entries\map61\mapsetups\pt_2D9.asm"		; 
   include "maps\entries\map61\mapsetups\pt.asm"		; 
   include "maps\entries\map61\mapsetups\s1.asm"		; 
   include "maps\entries\map61\mapsetups\s1_2D9.asm"		; 
   include "maps\entries\map61\mapsetups\s2.asm"		; 
   include "maps\entries\map61\mapsetups\s3.asm"		; 
   include "maps\entries\map61\mapsetups\s4.asm"		; 
   include "maps\entries\map61\mapsetups\s5.asm"		; 
   include "maps\entries\map61\mapsetups\s6.asm"		; 
   include "maps\entries\map62\mapsetups\pt.asm"		; 
   include "maps\entries\map62\mapsetups\pt_4D.asm"		; 
   include "maps\entries\map62\mapsetups\s1.asm"		; 
   include "maps\entries\map62\mapsetups\s1_4D.asm"		; 
   include "maps\entries\map62\mapsetups\s2.asm"		; 
   include "maps\entries\map62\mapsetups\s3.asm"		; 
   include "maps\entries\map62\mapsetups\s4.asm"		; 
   include "maps\entries\map62\mapsetups\s5.asm"		; 
   include "maps\entries\map62\mapsetups\s6.asm"		; 
   include "maps\entries\map63\mapsetups\pt_1D.asm"		; 
   include "maps\entries\map63\mapsetups\pt.asm"		; 
   include "maps\entries\map63\mapsetups\s1.asm"		; 
   include "maps\entries\map63\mapsetups\s1_1D.asm"		; 
   include "maps\entries\map63\mapsetups\s2.asm"		; 
   include "maps\entries\map63\mapsetups\s3.asm"		; 
   include "maps\entries\map63\mapsetups\s4.asm"		; 
   include "maps\entries\map63\mapsetups\s5.asm"		; 
   include "maps\entries\map63\mapsetups\s6.asm"		; 
   include "maps\entries\map15\mapsetups\pt.asm"		; 
   include "maps\entries\map15\mapsetups\pt_212.asm"		; 
   include "maps\entries\map15\mapsetups\s1.asm"		; 
   include "maps\entries\map15\mapsetups\s1_212.asm"		; 
   include "maps\entries\map15\mapsetups\s2.asm"		; 
   include "maps\entries\map15\mapsetups\s2_212.asm"		; 
   include "maps\entries\map15\mapsetups\s3.asm"		; 
   include "maps\entries\map15\mapsetups\s3_212.asm"		; 
   include "maps\entries\map15\mapsetups\s4.asm"		; 
   include "maps\entries\map15\mapsetups\s5.asm"		; 
   include "maps\entries\map15\mapsetups\s6.asm"		; 
   include "maps\entries\map25\mapsetups\pt.asm"		; 
   include "maps\entries\map25\mapsetups\s1.asm"		; 
   include "maps\entries\map25\mapsetups\s2.asm"		; 
   include "maps\entries\map25\mapsetups\s3.asm"		; 
   include "maps\entries\map25\mapsetups\s4.asm"		; 
   include "maps\entries\map25\mapsetups\s5.asm"		; 
   include "maps\entries\map25\mapsetups\s6.asm"		; 
   include "maps\entries\map31\mapsetups\pt.asm"		; 
   include "maps\entries\map31\mapsetups\pt_33E.asm"		; 
   include "maps\entries\map31\mapsetups\s1.asm"		; 
   include "maps\entries\map31\mapsetups\s1_33E.asm"		; 
   include "maps\entries\map31\mapsetups\s2.asm"		; 
   include "maps\entries\map31\mapsetups\s2_33E.asm"		; 
   include "maps\entries\map31\mapsetups\s3.asm"		; 
   include "maps\entries\map31\mapsetups\s3_33E.asm"		; 
   include "maps\entries\map31\mapsetups\s4.asm"		; 
   include "maps\entries\map31\mapsetups\s5.asm"		; 
   include "maps\entries\map31\mapsetups\s5_33E.asm"		; 
   include "maps\entries\map31\mapsetups\s6.asm"		; 
   include "maps\entries\map31\mapsetups\s6_33E.asm"		; 
   include "maps\entries\map36\mapsetups\pt.asm"		; 
   include "maps\entries\map36\mapsetups\pt_212.asm"		; 
   include "maps\entries\map36\mapsetups\s1.asm"		; 
   include "maps\entries\map36\mapsetups\s1_212.asm"		; 
   include "maps\entries\map36\mapsetups\s2.asm"		; 
   include "maps\entries\map36\mapsetups\s2_212.asm"		; 
   include "maps\entries\map36\mapsetups\s3.asm"		; 
   include "maps\entries\map36\mapsetups\s4.asm"		; 
   include "maps\entries\map36\mapsetups\s5.asm"		; 
   include "maps\entries\map36\mapsetups\s6.asm"		; 
   include "maps\entries\map38\mapsetups\pt.asm"		; 
   include "maps\entries\map38\mapsetups\s1.asm"		; 
   include "maps\entries\map38\mapsetups\s2.asm"		; 
   include "maps\entries\map38\mapsetups\s3.asm"		; 
   include "maps\entries\map38\mapsetups\s4.asm"		; 
   include "maps\entries\map38\mapsetups\s5.asm"		; 
   include "maps\entries\map38\mapsetups\s6.asm"		; 
   include "maps\entries\map39\mapsetups\pt.asm"		; 
   include "maps\entries\map39\mapsetups\pt_33E.asm"		; 
   include "maps\entries\map39\mapsetups\s1.asm"		; 
   include "maps\entries\map39\mapsetups\s1_33E.asm"		; 
   include "maps\entries\map39\mapsetups\s2.asm"		; 
   include "maps\entries\map39\mapsetups\s3.asm"		; 
   include "maps\entries\map39\mapsetups\s3_33E.asm"		; 
   include "maps\entries\map39\mapsetups\s4.asm"		; 
   include "maps\entries\map39\mapsetups\s5.asm"		; 
   include "maps\entries\map39\mapsetups\s6.asm"		; 
   include "maps\entries\map39\mapsetups\s6_33E.asm"		; 
   include "maps\entries\map55\mapsetups\pt.asm"		; 
   include "maps\entries\map55\mapsetups\s1.asm"		; 
   include "maps\entries\map55\mapsetups\s2.asm"		; 
   include "maps\entries\map55\mapsetups\s3.asm"		; 
   include "maps\entries\map55\mapsetups\s4.asm"		; 
   include "maps\entries\map55\mapsetups\s5.asm"		; 
   include "maps\entries\map55\mapsetups\s6.asm"		; 
   include "maps\entries\map00\mapsetups\pt.asm"		; 
   include "maps\entries\map00\mapsetups\s1.asm"		; 
   include "maps\entries\map00\mapsetups\s2.asm"		; 
   include "maps\entries\map00\mapsetups\s3.asm"		; 
   include "maps\entries\map00\mapsetups\s4.asm"		; 
   include "maps\entries\map00\mapsetups\s5.asm"		; 
   include "maps\entries\map00\mapsetups\s6.asm"		; 
   include "maps\entries\map01\mapsetups\pt.asm"		; 
   include "maps\entries\map01\mapsetups\s1.asm"		; 
   include "maps\entries\map01\mapsetups\s2.asm"		; 
   include "maps\entries\map01\mapsetups\s3.asm"		; 
   include "maps\entries\map01\mapsetups\s4.asm"		; 
   include "maps\entries\map01\mapsetups\s5.asm"		; 
   include "maps\entries\map01\mapsetups\s6.asm"		; 
   include "maps\entries\map02\mapsetups\pt.asm"		; 
   include "maps\entries\map02\mapsetups\pt_212.asm"		; 
   include "maps\entries\map02\mapsetups\s1.asm"		; 
   include "maps\entries\map02\mapsetups\s1_212.asm"		; 
   include "maps\entries\map02\mapsetups\s2.asm"		; 
   include "maps\entries\map02\mapsetups\s2_212.asm"		; 
   include "maps\entries\map02\mapsetups\s3.asm"		; 
   include "maps\entries\map02\mapsetups\s4.asm"		; 
   include "maps\entries\map02\mapsetups\s4_212.asm"		; 
   include "maps\entries\map02\mapsetups\s5.asm"		; 
   include "maps\entries\map02\mapsetups\s6.asm"		; 
   include "maps\entries\map59\mapsetups\pt.asm"		; 
   include "maps\entries\map59\mapsetups\s1.asm"		; 
   include "maps\entries\map59\mapsetups\s2.asm"		; 
   include "maps\entries\map59\mapsetups\s3.asm"		; 
   include "maps\entries\map59\mapsetups\s4.asm"		; 
   include "maps\entries\map59\mapsetups\s5.asm"		; 
   include "maps\entries\map59\mapsetups\s6.asm"		; 
   include "maps\entries\map28\mapsetups\pt.asm"		; 
   include "maps\entries\map28\mapsetups\s1.asm"		; 
   include "maps\entries\map28\mapsetups\s2.asm"		; 
   include "maps\entries\map28\mapsetups\s3.asm"		; 
   include "maps\entries\map28\mapsetups\s4.asm"		; 
   include "maps\entries\map28\mapsetups\s5.asm"		; 
   include "maps\entries\map28\mapsetups\s6.asm"		; 
   include "maps\entries\map41\mapsetups\pt.asm"		; 
   include "maps\entries\map41\mapsetups\s1.asm"		; 
   include "maps\entries\map41\mapsetups\s2.asm"		; 
   include "maps\entries\map41\mapsetups\s3.asm"		; 
   include "maps\entries\map41\mapsetups\s4.asm"		; 
   include "maps\entries\map41\mapsetups\s5.asm"		; 
   include "maps\entries\map41\mapsetups\s6.asm"		; 
   include "maps\entries\map37\mapsetups\pt.asm"		; 
   include "maps\entries\map37\mapsetups\pt_3E7.asm"		; 
   include "maps\entries\map37\mapsetups\s1.asm"		; 
   include "maps\entries\map37\mapsetups\s1_3E7.asm"		; 
   include "maps\entries\map37\mapsetups\s2.asm"		; 
   include "maps\entries\map37\mapsetups\s2_3E7.asm"		; 
   include "maps\entries\map37\mapsetups\s3.asm"		; 
   include "maps\entries\map37\mapsetups\s4.asm"		; 
   include "maps\entries\map37\mapsetups\s5.asm"		; 
   include "maps\entries\map37\mapsetups\s6.asm"		; 
   include "maps\entries\map37\mapsetups\s6_3E7.asm"		; 
   include "maps\entries\map42\mapsetups\pt.asm"		; 
   include "maps\entries\map42\mapsetups\s1.asm"		; 
   include "maps\entries\map42\mapsetups\s2.asm"		; 
   include "maps\entries\map42\mapsetups\s3.asm"		; 
   include "maps\entries\map42\mapsetups\s4.asm"		; 
   include "maps\entries\map42\mapsetups\s5.asm"		; 
   include "maps\entries\map42\mapsetups\s6.asm"		; 
   include "maps\entries\map45\mapsetups\pt.asm"		; 
   include "maps\entries\map45\mapsetups\s1.asm"		; 
   include "maps\entries\map45\mapsetups\s2.asm"		; 
   include "maps\entries\map45\mapsetups\s3.asm"		; 
   include "maps\entries\map45\mapsetups\s4.asm"		; 
   include "maps\entries\map45\mapsetups\s5.asm"		; 
   include "maps\entries\map45\mapsetups\s6.asm"		; 
   include "maps\entries\map05\mapsetups\pt_212.asm"		; 
   include "maps\entries\map05\mapsetups\pt_1C.asm"		; 
   include "maps\entries\map05\mapsetups\s1_212.asm"		; 
   include "maps\entries\map05\mapsetups\s1_1C.asm"		; 
   include "maps\entries\map05\mapsetups\s2_212.asm"		; 
   include "maps\entries\map05\mapsetups\s3_212.asm"		; 
   include "maps\entries\map05\mapsetups\s4_212.asm"		; 
   include "maps\entries\map05\mapsetups\s5_212.asm"		; 
   include "maps\entries\map05\mapsetups\s6_212.asm"		; 
   include "maps\entries\map16\mapsetups\pt_212.asm"		; 
   include "maps\entries\map16\mapsetups\s1_212.asm"		; 
   include "maps\entries\map16\mapsetups\s2_212.asm"		; 
   include "maps\entries\map16\mapsetups\s3_212.asm"		; 
   include "maps\entries\map16\mapsetups\s4_212.asm"		; 
   include "maps\entries\map16\mapsetups\s5_212.asm"		; 
   include "maps\entries\map16\mapsetups\s6_212.asm"		; 
   include "maps\entries\map17\mapsetups\pt_212.asm"		; 
   include "maps\entries\map17\mapsetups\s1_212.asm"		; 
   include "maps\entries\map17\mapsetups\s2_212.asm"		; 
   include "maps\entries\map17\mapsetups\s3_212.asm"		; 
   include "maps\entries\map17\mapsetups\s4_212.asm"		; 
   include "maps\entries\map17\mapsetups\s5_212.asm"		; 
   include "maps\entries\map17\mapsetups\s6_212.asm"		; 
   include "maps\entries\map18\mapsetups\pt_212.asm"		; 
   include "maps\entries\map18\mapsetups\s1_212.asm"		; 
   include "maps\entries\map18\mapsetups\s2_212.asm"		; 
   include "maps\entries\map18\mapsetups\s3_212.asm"		; 
   include "maps\entries\map18\mapsetups\s4_212.asm"		; 
   include "maps\entries\map18\mapsetups\s5_212.asm"		; 
   include "maps\entries\map18\mapsetups\s6_212.asm"		; 
   include "maps\entries\map56\mapsetups\pt.asm"		; 
   include "maps\entries\map56\mapsetups\s1.asm"		; 
   include "maps\entries\map56\mapsetups\s2.asm"		; 
   include "maps\entries\map56\mapsetups\s3.asm"		; 
   include "maps\entries\map56\mapsetups\s4.asm"		; 
   include "maps\entries\map56\mapsetups\s5.asm"		; 
   include "maps\entries\map56\mapsetups\s6.asm"		; 
   include "maps\entries\map59\mapsetups\pt_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s1_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s2_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s3_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s4_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s5_21F.asm"		; 
   include "maps\entries\map59\mapsetups\s6_21F.asm"		; 
   include "maps\entries\map03\mapsetups\pt_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s1_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s2_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s3_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s4_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s5_21F.asm"		; 
   include "maps\entries\map03\mapsetups\s6_21F.asm"		; 
   include "maps\entries\map19\mapsetups\pt_21F.asm"		; 
   include "maps\entries\map19\mapsetups\pt_3D6.asm"		; 
   include "maps\entries\map19\mapsetups\s1_21F.asm"		; 
   include "maps\entries\map19\mapsetups\s1_3D6.asm"		; 
   include "maps\entries\map19\mapsetups\s2_21F.asm"		; 
   include "maps\entries\map19\mapsetups\s2_3D6.asm"		; 
   include "maps\entries\map19\mapsetups\s3_21F.asm"		; 
   include "maps\entries\map19\mapsetups\s4_21F.asm"		; 
   include "maps\entries\map19\mapsetups\s5_21F.asm"		; 
   include "maps\entries\map19\mapsetups\s6_21F.asm"		; 
   include "maps\entries\map20\mapsetups\pt_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s1_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s2_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s3_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s4_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s5_21F.asm"		; 
   include "maps\entries\map20\mapsetups\s6_21F.asm"		; 
   include "maps\entries\map21\mapsetups\pt_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s1_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s2_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s3_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s4_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s5_21F.asm"		; 
   include "maps\entries\map21\mapsetups\s6_21F.asm"		; 
										align $4000
