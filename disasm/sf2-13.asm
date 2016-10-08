
; GAME SECTION 13 :
; Battle setup functions, battle terrains, battle entity setups, end kiss graphics

; FREE SPACE : 133 bytes.



; =============== S U B R O U T I N E =======================================

j_LoadBattleTerrainData:
										
										jmp     LoadBattleTerrainData(pc)

	; End of function j_LoadBattleTerrainData


; =============== S U B R O U T I N E =======================================

j_InitAllForceBattlePositions:
										
										jmp     InitAllForceBattlePositions(pc)

	; End of function j_InitAllForceBattlePositions


; =============== S U B R O U T I N E =======================================

j_InitAllEnemyBattlePositions:
										
										jmp     InitAllEnemyBattlePositions(pc)

	; End of function j_InitAllEnemyBattlePositions


; =============== S U B R O U T I N E =======================================

j_RespawnEnemyIfOpen:
										
										jmp     UpdateEnemyStatsForRespawn(pc)

	; End of function j_RespawnEnemyIfOpen


; =============== S U B R O U T I N E =======================================

sub_1AC010:
										
										jmp     sub_1B14D8(pc)

	; End of function sub_1AC010


; =============== S U B R O U T I N E =======================================

j_getEnemyAITargetPos:
										
										jmp     GetEnemyAITargetPos(pc)

	; End of function j_getEnemyAITargetPos


; =============== S U B R O U T I N E =======================================

j_getAddrOfBattleCombatants:
										
										jmp     GetAddrOfBattleDataSection(pc)

	; End of function j_getAddrOfBattleCombatants


; =============== S U B R O U T I N E =======================================

sub_1AC01C:
										
										jmp     sub_1B120A(pc)

	; End of function sub_1AC01C


; =============== S U B R O U T I N E =======================================

j_GetMonsterStartPos:
										
										jmp     GetMonsterStartPos(pc)

	; End of function j_GetMonsterStartPos


; =============== S U B R O U T I N E =======================================

sub_1AC024:
										
										jmp     sub_1AC38E(pc)

	; End of function sub_1AC024


; =============== S U B R O U T I N E =======================================

sub_1AC028:
										
										jmp     sub_1AC69A(pc)

	; End of function sub_1AC028


; =============== S U B R O U T I N E =======================================

j_getMoveListForEnemyTarget:
										
										jmp     GetEnemyAITargetMoveList(pc)

	; End of function j_getMoveListForEnemyTarget


; =============== S U B R O U T I N E =======================================

sub_1AC030:
										
										jmp     sub_1AC4F0(pc)  

	; End of function sub_1AC030


; =============== S U B R O U T I N E =======================================

j_clearTerrainListObstructions:
										
										jmp     ClearTerrainListObstructions(pc)

	; End of function j_clearTerrainListObstructions


; =============== S U B R O U T I N E =======================================

sub_1AC038:
										
										jmp     sub_1AC9FC(pc)

	; End of function sub_1AC038


; =============== S U B R O U T I N E =======================================

j_UpdateTriggeredRegionsAndAI:
										
										jmp     UpdateTriggeredRegionsAndAI(pc)

	; End of function j_UpdateTriggeredRegionsAndAI


; =============== S U B R O U T I N E =======================================

j_GetListOfSpawningEnemies:
										
										jmp     GetListOfSpawningEnemies(pc)

	; End of function j_GetListOfSpawningEnemies


; =============== S U B R O U T I N E =======================================

j_randomLessThanD6:
										
										jmp     RandomLessThanD6(pc)

	; End of function j_randomLessThanD6


; =============== S U B R O U T I N E =======================================

j_IsSpecialBattle:
										
										jmp     DoesBattleUpgrade(pc)

	; End of function j_IsSpecialBattle


; =============== S U B R O U T I N E =======================================

sub_1AC04C:
										
										jmp     sub_1B17BC(pc)

	; End of function sub_1AC04C


; =============== S U B R O U T I N E =======================================

j_ShouldBattleUpgrade:
										
										jmp     ShouldBattleUpgrade(pc)

	; End of function j_ShouldBattleUpgrade


; =============== S U B R O U T I N E =======================================

sub_1AC054:
										
										jmp     sub_1B16FE(pc)

	; End of function sub_1AC054


; =============== S U B R O U T I N E =======================================

j_CheckTriggerRegionFlag:
										
										jmp     CheckTriggerRegionFlag(pc)

	; End of function j_CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

sub_1AC05C:
										
										jmp     sub_1AC8A0(pc)

	; End of function sub_1AC05C

p_plt_endKiss:      dc.l plt_EndKiss
p_endKissPicture:   dc.l EndKissPicture

; =============== S U B R O U T I N E =======================================

sub_1AC068:
										
										jmp     *+4(pc)
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										jsr     (WaitForVInt).w 
										jsr     (DisableDisplayAndVInt).w
										jsr     (ClearVsramAndSprites).w
										jsr     (EnableDisplayAndInterrupts).w
										jsr     (InitDisplay).w 
										bsr.w   sub_1AC1CC
										jsr     (DisableDisplayAndVInt).w
										bsr.w   sub_1AC29C
										lea     (byte_FFE000).l,a1
										move.w  #$27C0,d1
										moveq   #7,d7
loc_1AC09C:
										
										moveq   #5,d6
loc_1AC09E:
										
										move.w  d1,(a1)+
										addq.w  #1,d1
										dbf     d6,loc_1AC09E
										addq.w  #2,d1
										lea     $34(a1),a1
										dbf     d7,loc_1AC09C
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										jsr     (EnableDisplayAndInterrupts).w
										clr.w   d6
										jsr     (ClearHscrollStuff).w
										jsr     (ClearVscrollStuff).w
										jsr     (ClearOtherHscrollStuff).w
										jsr     (ClearOtherVscrollStuff).w
										jsr     (Set_FFDE94_bit3).w
										jsr     (FadeInFromBlack).w
										move.l  (p_GameStaff).l,((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_1AC1E4
										moveq   #$78,d0 
										jsr     (Sleep).w       
										jsr     j_UpdateForce
										move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
										subq.w  #1,d7
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
loc_1AC10E:
										
										movem.l d7-a0,-(sp)
										clr.w   d0
										move.b  (a0),d0
										jsr     j_GetCharPortraitIdx
										jsr     j_LoadPortrait
										lea     (PALETTE_2).l,a0; clear palette 2
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										jsr     (StoreVdpCommandster).w
										move.w  #$40,d6 
										jsr     (UpdateRandomSeed).w
										addi.w  #$80,d7 
										move.w  d7,(dword_FFD100+2).l
										move.w  #$60,d6 
										jsr     (UpdateRandomSeed).w
										addi.w  #$20,d7 
										neg.w   d7
										move.w  d7,(word_FFD502).l
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.w  #$B4,d0 
										jsr     (Sleep).w       
										move.b  #2,((FADING_SETTING-$1000000)).w
										clr.w   ((byte_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										moveq   #$2C,d0 
										jsr     (Sleep).w       
										movem.l (sp)+,d7-a0
										addq.l  #1,a0
										dbf     d7,loc_1AC10E
loc_1AC1A8:
										
										movea.l ((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w,a0
										cmpi.b  #$FF,(a0)
										bne.s   loc_1AC1A8
										bsr.w   sub_1AC1CC
										move.w  #$B4,d0 
										jsr     (Sleep).w       
										jsr     (FadeOutToBlack).w
										move.w  #$78,d0 
										jsr     (Sleep).w       
										rts

	; End of function sub_1AC068


; =============== S U B R O U T I N E =======================================

sub_1AC1CC:
										
										lea     (PALLETE_2_BIS).l,a0
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										rts

	; End of function sub_1AC1CC


; =============== S U B R O U T I N E =======================================

VInt_1AC1E4:
										
										btst    #0,((byte_FFDEA0-$1000000)).w
										bne.s   loc_1AC1F6
										subq.w  #1,(dword_FFD100+2).l
										jsr     (StoreVdpCommands).w
loc_1AC1F6:
										
										movea.l ((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w,a0
										cmpi.b  #$FF,(a0)
										beq.s   loc_1AC220
										move.b  ((byte_FFDEA0-$1000000)).w,d0
										andi.b  #1,d0
										bne.s   loc_1AC220
										move.w  (word_FFD500).l,d0
										andi.w  #$F,d0
										bne.s   loc_1AC21A
										bsr.w   sub_1AC22E
loc_1AC21A:
										
										addq.w  #1,(word_FFD500).l
loc_1AC220:
										
										jsr     (StoreVdpCommands).w
										jsr     (StoreVdpCommandsbis).w
										jsr     (Set_FFDE94_bit3).w
										rts

	; End of function VInt_1AC1E4


; =============== S U B R O U T I N E =======================================

sub_1AC22E:
										
										move.b  (a0)+,d1
										lea     (byte_FFC000).l,a1
										move.w  (word_FFD500).l,d0
										lsr.w   #3,d0
										addi.w  #$1C,d0
										andi.w  #$1F,d0
										lsl.w   #6,d0
										adda.w  d0,a1
										movem.l d7/a1,-(sp)
										moveq   #$1F,d7
loc_1AC250:
										
										clr.l   (a1)+
										dbf     d7,loc_1AC250
										movem.l (sp)+,d7/a1
										tst.b   d1
										beq.s   loc_1AC280
										lsl.w   #1,d1
										adda.w  d1,a1
loc_1AC262:
										
										clr.w   d1
										move.b  (a0)+,d1
										beq.w   loc_1AC280
										subi.w  #$20,d1 
										lsl.w   #1,d1
										ori.w   #$C100,d1
										move.w  d1,(a1)
										addq.w  #1,d1
										move.w  d1,$40(a1)
										addq.l  #2,a1
										bra.s   loc_1AC262
loc_1AC280:
										
										move.l  a0,((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (sub_119E).w    
										rts

	; End of function sub_1AC22E


; =============== S U B R O U T I N E =======================================

sub_1AC29C:
										
										movea.l (p_BaseTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadTileData).w
										lea     (byte_FF6C02).l,a0
										lea     (DMA_SPACE_FF8804).l,a1
										moveq   #$3F,d7 
loc_1AC2BA:
										
										moveq   #7,d6
loc_1AC2BC:
										
										move.l  (a0)+,d0
										andi.l  #$22222222,d0
										eori.l  #$22222222,d0
										lsr.l   #1,d0
										move.l  d0,(a1)
										addq.l  #8,a1
										dbf     d6,loc_1AC2BC
										dbf     d7,loc_1AC2BA
										lea     (byte_FF8808).l,a1
										moveq   #$3F,d7 
loc_1AC2E0:
										
										moveq   #6,d6
loc_1AC2E2:
										
										moveq   #3,d5
loc_1AC2E4:
										
										clr.b   d0
										move.b  -4(a1),d1
										andi.b  #$10,d1
										beq.w   loc_1AC302
										move.b  4(a1),d1
										andi.b  #$10,d1
										beq.w   loc_1AC302
										ori.b   #$10,d0
loc_1AC302:
										
										move.b  -4(a1),d1
										andi.b  #1,d1
										beq.w   loc_1AC31E
										move.b  4(a1),d1
										andi.b  #1,d1
										beq.w   loc_1AC31E
										ori.b   #1,d0
loc_1AC31E:
										
										move.b  d0,(a1)+
										dbf     d5,loc_1AC2E4
										addq.l  #4,a1
										dbf     d6,loc_1AC2E2
										clr.l   (a1)+
										addq.l  #4,a1
										dbf     d7,loc_1AC2E0
										lea     (DMA_SPACE_FF8804).l,a0
										lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
										clr.l   (a1)+
										move.w  #$3FE,d7
loc_1AC344:
										
										move.l  (a0)+,d0
										lsr.l   #4,d0
										mulu.w  #2,d0
										move.l  d0,(a1)+
										dbf     d7,loc_1AC344
										lea     (DMA_SPACE_FF8804).l,a0
										lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
										move.w  #$3FE,d7
loc_1AC362:
										
										move.l  (a0),d0
										andi.l  #$11111111,d0
										mulu.w  #$F,d0
										not.l   d0
										and.l   (a1)+,d0
										or.l    d0,(a0)+
										dbf     d7,loc_1AC362
										lea     (DMA_SPACE_FF8804).l,a0
										lea     ($2000).w,a1    ; ?
										move.w  #$800,d0
										moveq   #2,d1
										jsr     (sub_10DC).w    
										rts

	; End of function sub_1AC29C


; =============== S U B R O U T I N E =======================================

sub_1AC38E:
										
										movem.l d0/d5-a6,-(sp)
										jsr     j_GetXPos
										move.w  d1,d3
										jsr     j_GetYPos
										move.w  d1,d4
										jsr     j_GetEnemyAISetting3233
										cmpi.b  #$FF,d1
										bne.s   loc_1AC3C2
										cmpi.b  #$FF,d2
										bne.s   loc_1AC3BE
										move.b  #$FF,d1
										bra.w   loc_1AC434
										bra.s   loc_1AC3C0
loc_1AC3BE:
										
										move.b  d2,d0
loc_1AC3C0:
										
										bra.s   loc_1AC3C4
loc_1AC3C2:
										
										move.b  d1,d0
loc_1AC3C4:
										
										btst    #6,d0
										bne.s   loc_1AC3DC
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_1AC3DC
										move.w  #$FFFF,d5
										bra.w   loc_1AC434
loc_1AC3DC:
										
										jsr     GetEnemyAITargetPos
										clr.w   d5
										cmp.w   d3,d1
										bge.s   loc_1AC3EC
										bset    #0,d5
loc_1AC3EC:
										
										cmp.w   d4,d2
										blt.s   loc_1AC3F4
										bset    #1,d5
loc_1AC3F4:
										
										btst    #0,d5
										bne.s   loc_1AC406
										subi.w  #4,d3
										tst.w   d3
										bpl.s   loc_1AC404
										clr.w   d3
loc_1AC404:
										
										bra.s   loc_1AC414
loc_1AC406:
										
										addi.w  #4,d3
										cmpi.w  #$2F,d3 
										ble.s   loc_1AC414
										move.w  #$2F,d3 
loc_1AC414:
										
										btst    #1,d5
										beq.s   loc_1AC426
										subi.w  #4,d4
										tst.w   d4
										bpl.s   loc_1AC424
										clr.w   d4
loc_1AC424:
										
										bra.s   loc_1AC434
loc_1AC426:
										
										addi.w  #4,d4
										cmpi.w  #$2F,d4 
										ble.s   loc_1AC434
										move.w  #$2F,d4 
loc_1AC434:
										
										move.b  d5,d1
										movem.l (sp)+,d0/d5-a6
										rts

	; End of function sub_1AC38E


; =============== S U B R O U T I N E =======================================

GetEnemyAITargetMoveList:
										
										movem.l d0-a6,-(sp)
										move.b  d0,d7
										jsr     j_GetEnemyAISetting3233
										cmpi.b  #$FF,d1
										bne.s   loc_1AC454
										bra.w   loc_1AC4EA
										bra.s   loc_1AC456
loc_1AC454:
										
										move.b  d1,d0
loc_1AC456:
										
										btst    #6,d0
										bne.s   loc_1AC46A
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_1AC46A
										bra.w   loc_1AC4EA
loc_1AC46A:
										
										jsr     GetEnemyAITargetPos
										clr.l   d5
										clr.l   d6
										move.w  d1,d5
										move.w  d2,d6
										move.w  d7,d0
										jsr     j_GetMoveInfo   
										move.w  d5,d3
										move.w  d6,d4
										jsr     j_MakeRangeLists
										move.w  #$2F,d4 
										move.w  #0,d2
										lea     (TERRAIN_DATA).l,a0
										lea     ((byte_FF4A00+$300)).l,a1
loc_1AC49E:
										
										move.w  #$2F,d3 
										move.w  #0,d1
loc_1AC4A6:
										
										move.b  (a0,d1.w),d0
										cmpi.b  #$FF,d0
										bne.s   loc_1AC4B4
										bra.w   loc_1AC4D2
loc_1AC4B4:
										
										move.l  d3,-(sp)
										move.w  d0,d3
										move.b  (a1,d1.w),d0
										btst    #7,d0
										beq.s   loc_1AC4D0
										move.w  d3,d0
										bset    #7,d0
										bset    #6,d0
										move.b  d0,(a0,d1.w)
loc_1AC4D0:
										
										move.l  (sp)+,d3
loc_1AC4D2:
										
										addi.w  #1,d1
										dbf     d3,loc_1AC4A6
										adda.w  #$30,a0 
										adda.w  #$30,a1 
										addi.w  #1,d2
										dbf     d4,loc_1AC49E
loc_1AC4EA:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function GetEnemyAITargetMoveList


; =============== S U B R O U T I N E =======================================

; something with targetting grid or ???

sub_1AC4F0:
										
										movem.l d0-a6,-(sp)
										move.b  d0,d7
										clr.w   d1
										move.b  d0,d1
										lea     (ENEMY_TARGETTING_COMMAND_LIST).l,a0
										andi.b  #$7F,d1 
										move.b  (a0,d1.w),d1
										cmpi.b  #$FF,d1
										beq.s   loc_1AC516
										bsr.w   sub_1AC5AA
										bra.w   loc_1AC5A4
loc_1AC516:
										
										move.w  d7,d0
										jsr     j_GetEnemyAISetting3233
										cmpi.b  #$FF,d1
										bne.s   loc_1AC52A
										bra.w   loc_1AC5A4
										bra.s   loc_1AC52C
loc_1AC52A:
										
										move.b  d1,d0
loc_1AC52C:
										
										btst    #6,d0
										bne.s   loc_1AC540
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_1AC540
										bra.w   loc_1AC5A4
loc_1AC540:
										
										jsr     GetEnemyAITargetPos
										move.w  d1,d5
										move.w  d2,d6
										lea     (TERRAIN_DATA).l,a0
										move.w  #$2F,d4 
loc_1AC554:
										
										move.w  #$2F,d3 
										move.w  #0,d1
loc_1AC55C:
										
										move.b  (a0,d1.w),d0
										cmpi.b  #$FF,d0
										bne.s   loc_1AC56A
										bra.w   loc_1AC576
loc_1AC56A:
										
										bset    #7,d0
										bset    #6,d0
										move.b  d0,(a0,d1.w)
loc_1AC576:
										
										addi.w  #1,d1
										dbf     d3,loc_1AC55C
										adda.w  #$30,a0 
										dbf     d4,loc_1AC554
										lea     unk_1AC848(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC84B(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC854(pc), a0
										nop
										bsr.w   sub_1AC7FE
loc_1AC5A4:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1AC4F0


; =============== S U B R O U T I N E =======================================

sub_1AC5AA:
										
										movem.l d0-a6,-(sp)
										move.b  d0,d7
										jsr     j_GetEnemyAISetting3233
										cmpi.b  #$FF,d1
										bne.s   loc_1AC5C2
										bra.w   loc_1AC64E
										bra.s   loc_1AC5C4
loc_1AC5C2:
										
										move.b  d1,d0
loc_1AC5C4:
										
										btst    #6,d0
										bne.s   loc_1AC5D8
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.s   loc_1AC5D8
										bra.w   loc_1AC64E
loc_1AC5D8:
										
										bsr.w   GetEnemyAITargetPos
										move.w  d1,d5
										move.w  d2,d6
										move.w  #$2F,d4 
										lea     (TERRAIN_DATA).l,a0
loc_1AC5EA:
										
										move.w  #$2F,d3 
										move.w  #0,d1
loc_1AC5F2:
										
										move.b  (a0,d1.w),d0
										cmpi.b  #$FF,d0
										bne.s   loc_1AC600
										bra.w   loc_1AC60C
loc_1AC600:
										
										bset    #7,d0
										bset    #6,d0
										move.b  d0,(a0,d1.w)
loc_1AC60C:
										
										addi.w  #1,d1
										dbf     d3,loc_1AC5F2
										adda.w  #$30,a0 
										dbf     d4,loc_1AC5EA
										lea     unk_1AC848(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC84B(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC854(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC865(pc), a0
										nop
										bsr.w   sub_1AC7FE
										lea     unk_1AC87E(pc), a0
										nop
										bsr.w   sub_1AC7FE
loc_1AC64E:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1AC5AA


; =============== S U B R O U T I N E =======================================

; clear upper two bits from all tiles in terrain list

ClearTerrainListObstructions:
										
										movem.l d0-a6,-(sp)
										move.w  #$2F,d4 
										lea     (TERRAIN_DATA).l,a0
loc_1AC662:
										
										move.w  #$2F,d3 
										move.w  #0,d1
loc_1AC66A:
										
										move.b  (a0,d1.w),d0
										cmpi.b  #$FF,d0
										bne.s   loc_1AC678
										bra.w   loc_1AC684
loc_1AC678:
										
										bclr    #7,d0
										bclr    #6,d0
										move.b  d0,(a0,d1.w)
loc_1AC684:
										
										addi.w  #1,d1
										dbf     d3,loc_1AC66A
										adda.w  #$30,a0 
										dbf     d4,loc_1AC662
										movem.l (sp)+,d0-a6
										rts

	; End of function ClearTerrainListObstructions


; =============== S U B R O U T I N E =======================================

sub_1AC69A:
										
										movem.l d0-a6,-(sp)
										clr.l   d7
										move.b  d0,d7
										bsr.w   sub_1AC38E
										clr.l   d6
										clr.l   d5
										move.b  d1,d5
										tst.b   d5
										bne.s   loc_1AC6C8
										move.b  #1,d1
										bsr.w   sub_1AC728
										move.b  #2,d1
										bsr.w   sub_1AC728
										move.b  #3,d1
										bsr.w   sub_1AC728
loc_1AC6C8:
										
										cmpi.b  #1,d5
										bne.s   loc_1AC6E6
										move.b  #0,d1
										bsr.w   sub_1AC728
										move.b  #2,d1
										bsr.w   sub_1AC728
										move.b  #3,d1
										bsr.w   sub_1AC728
loc_1AC6E6:
										
										cmpi.b  #3,d5
										bne.s   loc_1AC704
										move.b  #0,d1
										bsr.w   sub_1AC728
										move.b  #1,d1
										bsr.w   sub_1AC728
										move.b  #3,d1
										bsr.w   sub_1AC728
loc_1AC704:
										
										cmpi.b  #2,d5
										bne.s   loc_1AC722
										move.b  #0,d1
										bsr.w   sub_1AC728
										move.b  #1,d1
										bsr.w   sub_1AC728
										move.b  #2,d1
										bsr.w   sub_1AC728
loc_1AC722:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1AC69A


; =============== S U B R O U T I N E =======================================

sub_1AC728:
										
										movem.l d0-a6,-(sp)
										link    a6,#-4
										move.w  d3,d6
										move.w  d4,d7
										cmpi.b  #0,d1
										bne.s   loc_1AC74E
										move.b  #0,-1(a6)
										move.b  d7,-2(a6)
										move.b  d6,-3(a6)
										move.b  #$2F,-4(a6) 
loc_1AC74E:
										
										cmpi.b  #1,d1
										bne.s   loc_1AC768
										move.b  #0,-1(a6)
										move.b  d7,-2(a6)
										move.b  #0,-3(a6)
										move.b  d6,-4(a6)
loc_1AC768:
										
										cmpi.b  #2,d1
										bne.s   loc_1AC782
										move.b  d7,-1(a6)
										move.b  #$2F,-2(a6) 
										move.b  #0,-3(a6)
										move.b  d6,-4(a6)
loc_1AC782:
										
										cmpi.b  #3,d1
										bne.s   loc_1AC79C
										move.b  d7,-1(a6)
										move.b  #$2F,-2(a6) 
										move.b  d6,-3(a6)
										move.b  #$2F,-4(a6) 
loc_1AC79C:
										
										clr.w   d4
										move.b  -2(a6),d4
										sub.b   -1(a6),d4
										ext.w   d4
										lea     (TERRAIN_DATA).l,a0
										move.b  -1(a6),d2
										ext.w   d2
loc_1AC7B4:
										
										move.b  -3(a6),d1
										ext.w   d1
										move.b  -4(a6),d3
										sub.b   -3(a6),d3
										ext.w   d3
loc_1AC7C4:
										
										movea.l a0,a1
										move.l  d2,-(sp)
										mulu.w  #$30,d2 
										adda.w  d2,a1
										move.l  (sp)+,d2
										move.b  (a1,d1.w),d0
										cmpi.b  #$FF,d0
										beq.s   loc_1AC7E6
										bset    #7,d0
										bset    #6,d0
										move.b  d0,(a1,d1.w)
loc_1AC7E6:
										
										addi.w  #1,d1
										dbf     d3,loc_1AC7C4
										addi.w  #1,d2
										dbf     d4,loc_1AC7B4
										unlk    a6
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1AC728


; =============== S U B R O U T I N E =======================================

sub_1AC7FE:
										
										movem.l d0-a1,-(sp)
										clr.w   d7
										move.b  (a0)+,d7
										subq.w  #1,d7
loc_1AC808:
										
										move.w  d6,d2
										add.b   1(a0),d2
										cmpi.w  #$30,d2 
										bcc.w   loc_1AC83C
										move.w  d5,d1
										add.b   (a0),d1
										cmpi.w  #$30,d1 
										bcc.w   loc_1AC83C
										jsr     j_GetTerrain
										cmpi.b  #$FF,d0
										beq.s   loc_1AC83C
										bclr    #7,d0
										bclr    #6,d0
										jsr     j_SetTerrain
loc_1AC83C:
										
										addq.l  #2,a0
										dbf     d7,loc_1AC808
										movem.l (sp)+,d0-a1
										rts

	; End of function sub_1AC7FE

unk_1AC848:         dc.b   1
										dc.b   0
										dc.b   0
unk_1AC84B:         dc.b   4
										dc.b   0
										dc.b   1
										dc.b   1
										dc.b   0
										dc.b   0
										dc.b $FF
										dc.b $FF
										dc.b   0
unk_1AC854:         dc.b   8
										dc.b   0
										dc.b $FE 
										dc.b $FF
										dc.b $FF
										dc.b $FE 
										dc.b   0
										dc.b $FF
										dc.b   1
										dc.b   0
										dc.b   2
										dc.b   1
										dc.b   1
										dc.b   2
										dc.b   0
										dc.b   1
										dc.b $FF
unk_1AC865:         dc.b  $C
										dc.b   0
										dc.b $FD 
										dc.b $FF
										dc.b $FE 
										dc.b $FE 
										dc.b $FF
										dc.b $FD 
										dc.b   0
										dc.b $FE 
										dc.b   1
										dc.b $FF
										dc.b   2
										dc.b   0
										dc.b   3
										dc.b   1
										dc.b   2
										dc.b   2
										dc.b   1
										dc.b   3
										dc.b   0
										dc.b   2
										dc.b $FF
										dc.b   1
										dc.b $FE 
unk_1AC87E:         dc.b $10
										dc.b   0
										dc.b $FC 
										dc.b $FF
										dc.b $FD 
										dc.b $FE 
										dc.b $FE 
										dc.b $FD 
										dc.b $FF
										dc.b $FC 
										dc.b   0
										dc.b $FD 
										dc.b   1
										dc.b $FE 
										dc.b   2
										dc.b $FF
										dc.b   3
										dc.b   0
										dc.b   4
										dc.b   1
										dc.b   3
										dc.b   2
										dc.b   2
										dc.b   3
										dc.b   1
										dc.b   4
										dc.b   0
										dc.b   3
										dc.b $FF
										dc.b   2
										dc.b $FE 
										dc.b   1
										dc.b $FD 
										dc.b $FF

; =============== S U B R O U T I N E =======================================

sub_1AC8A0:
										
										movem.l d0-a6,-(sp)
										move.w  d0,d7
										lea     ((CURRENT_BATTLE-$1000000)).w,a0
										clr.w   d2
										move.b  (a0),d2
										lea     unk_1AC9B8(pc), a0
										nop
										clr.w   d1
										move.b  (a0)+,d1
										subi.w  #1,d1
										clr.w   d3
loc_1AC8BE:
										
										move.b  (a0,d3.w),d0
										cmp.b   d0,d2
										bne.s   loc_1AC8CA
										bra.w   loc_1AC8D8
loc_1AC8CA:
										
										addi.w  #1,d3
										dbf     d1,loc_1AC8BE
										clr.w   d3
										bra.w   loc_1AC9AC
loc_1AC8D8:
										
										lea     off_1AC9BC(pc), a0
										nop
										lsl.w   #2,d3
										movea.l (a0,d3.w),a0
										clr.w   d0
										move.b  d7,d0
										andi.w  #$7F,d0 
										clr.w   d6
										move.b  (a0,d0.w),d6
										cmpi.b  #$FF,d6
										bne.s   loc_1AC8FE
										moveq   #0,d3
										bra.w   loc_1AC9AC
loc_1AC8FE:
										
										clr.w   d0
										move.b  d7,d0
										jsr     j_GetYPos
										move.w  d1,d2
										jsr     j_GetXPos
										jsr     j_ClearMovableGrid
										tst.w   d6
										bne.s   loc_1AC91E
										addi.w  #1,d1
loc_1AC91E:
										
										cmpi.w  #1,d6
										bne.s   loc_1AC928
										subi.w  #1,d2
loc_1AC928:
										
										cmpi.w  #2,d6
										bne.s   loc_1AC932
										subi.w  #1,d1
loc_1AC932:
										
										cmpi.w  #3,d6
										bne.s   loc_1AC93C
										addi.w  #1,d2
loc_1AC93C:
										
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										clr.w   d3
loc_1AC942:
										
										jsr     j_SetMovableAtCoord
										jsr     j_GetTargetAtCoordOffset
										cmpi.b  #$FF,d0
										bne.s   loc_1AC958
										bra.w   loc_1AC960
loc_1AC958:
										
										move.b  d0,(a0,d3.w)
										addi.w  #1,d3
loc_1AC960:
										
										tst.w   d6
										bne.s   loc_1AC972
										addi.w  #1,d1
										cmpi.w  #$2F,d1 
										ble.s   loc_1AC972
										bra.w   loc_1AC9AC
loc_1AC972:
										
										cmpi.w  #1,d6
										bne.s   loc_1AC984
										subi.w  #1,d2
										tst.w   d2
										bpl.s   loc_1AC984
										bra.w   loc_1AC9AC
loc_1AC984:
										
										cmpi.w  #2,d6
										bne.s   loc_1AC996
										subi.w  #1,d1
										tst.w   d1
										bpl.s   loc_1AC996
										bra.w   loc_1AC9AC
loc_1AC996:
										
										cmpi.w  #3,d6
										bne.s   loc_1AC9AA
										addi.w  #1,d2
										cmpi.w  #$2F,d2 
										ble.s   loc_1AC9AA
										bra.w   loc_1AC9AC
loc_1AC9AA:
										
										bra.s   loc_1AC942
loc_1AC9AC:
										
										lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a0
										move.w  d3,(a0)
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1AC8A0

unk_1AC9B8:         dc.b   3
										dc.b $24 
										dc.b $2B 
										dc.b   0
off_1AC9BC:         dc.l unk_1AC9C8
										dc.l unk_1AC9E0
										dc.l unk_1AC9F0
unk_1AC9C8:         dc.b $FF
										dc.b   3
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b   2
										dc.b   1
										dc.b   2
										dc.b   1
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
unk_1AC9E0:         dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b $FF
										dc.b $FF
										dc.b   2
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
unk_1AC9F0:         dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b   0
										dc.b   2

; =============== S U B R O U T I N E =======================================

sub_1AC9FC:
										
										movem.l d0/d2-a6,-(sp)
										cmpi.b  #$FF,d0
										bne.s   loc_1ACA0C
										clr.w   d6
										bra.w   loc_1ACA6A
loc_1ACA0C:
										
										move.w  d0,d7
										move.b  #3,d1
										bsr.w   GetAddrOfBattleDataSection
										cmp.b   d1,d7
										ble.s   loc_1ACA1E
										bra.w   loc_1ACA6A
loc_1ACA1E:
										
										move.w  d7,d0
										mulu.w  #$C,d0
										adda.w  d0,a0
										move.b  (a0),d0
										cmpi.b  #3,d0
										bne.s   loc_1ACA40
										move.w  2(a0),d2
										move.w  4(a0),d3
										move.w  6(a0),d4
										bsr.w   sub_1ACA72
										bra.s   loc_1ACA6A
loc_1ACA40:
										
										move.w  2(a0),d2
										move.w  4(a0),d3
										move.w  8(a0),d4
										bsr.w   sub_1ACA72
										cmpi.b  #0,d6
										beq.s   loc_1ACA5A
										bra.w   loc_1ACA6A
loc_1ACA5A:
										
										move.w  6(a0),d2
										move.w  4(a0),d3
										move.w  8(a0),d4
										bsr.w   sub_1ACA72
loc_1ACA6A:
										
										move.w  d6,d1
										movem.l (sp)+,d0/d2-a6
										rts

	; End of function sub_1AC9FC


; =============== S U B R O U T I N E =======================================

sub_1ACA72:
										
										movem.l d0-d5/d7-a6,-(sp)
										move.w  #$1D,d7
										clr.w   d0
loc_1ACA7C:
										
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_1ACA88
										bpl.s   loc_1ACA8C
loc_1ACA88:
										
										bra.w   loc_1ACABC
loc_1ACA8C:
										
										jsr     j_GetXPos
										tst.b   d1
										bpl.s   loc_1ACA9A
										bra.w   loc_1ACABC
loc_1ACA9A:
										
										clr.w   d5
										move.b  d1,d5
										lsl.w   #8,d5
										jsr     j_GetYPos
										tst.b   d1
										bpl.s   loc_1ACAAE
										bra.w   loc_1ACABC
loc_1ACAAE:
										
										or.b    d1,d5
										bsr.w   sub_1ACAD6
										tst.w   d6
										bne.s   loc_1ACABC
										bra.w   loc_1ACACC
loc_1ACABC:
										
										addi.w  #1,d0
										dbf     d7,loc_1ACA7C
										move.w  #0,d6
										bra.w   loc_1ACAD0
loc_1ACACC:
										
										move.w  #$FFFF,d6
loc_1ACAD0:
										
										movem.l (sp)+,d0-d5/d7-a6
										rts

	; End of function sub_1ACA72


; =============== S U B R O U T I N E =======================================

sub_1ACAD6:
										
										movem.l d0-d5/d7-a6,-(sp)
										link    a6,#-$A
										move.w  d2,d0
										andi.w  #$FF,d0
										move.b  d0,-2(a6)
										move.w  d2,d0
										lsr.w   #8,d0
										move.b  d0,-1(a6)
										move.w  d3,d0
										andi.w  #$FF,d0
										move.b  d0,-4(a6)
										move.w  d3,d0
										lsr.w   #8,d0
										move.b  d0,-3(a6)
										move.w  d4,d0
										andi.w  #$FF,d0
										move.b  d0,-6(a6)
										move.w  d4,d0
										lsr.w   #8,d0
										move.b  d0,-5(a6)
										move.w  d5,d0
										andi.w  #$FF,d0
										move.b  d0,-8(a6)
										move.w  d5,d0
										lsr.w   #8,d0
										move.b  d0,-7(a6)
										clr.w   d1
										clr.w   d2
										clr.w   d3
										clr.w   d4
										clr.w   d5
										clr.w   d6
										move.b  -1(a6),d1
										move.b  -2(a6),d2
										move.b  -3(a6),d3
										move.b  -4(a6),d4
										move.b  -7(a6),d5
										move.b  -8(a6),d6
										bsr.w   sub_1ACC26
										cmpi.b  #1,d0
										bne.s   loc_1ACB58
										bra.w   loc_1ACC10
loc_1ACB58:
										
										btst    #0,d0
										beq.s   loc_1ACB62
										bra.w   loc_1ACB7C
loc_1ACB62:
										
										move.b  d0,-9(a6)
										move.b  -5(a6),d5
										move.b  -6(a6),d6
										bsr.w   sub_1ACC26
										cmp.b   -9(a6),d0
										beq.s   loc_1ACB7C
										bra.w   loc_1ACC1A
loc_1ACB7C:
										
										move.b  -5(a6),d1
										move.b  -6(a6),d2
										move.b  -1(a6),d3
										move.b  -2(a6),d4
										move.b  -7(a6),d5
										move.b  -8(a6),d6
										bsr.w   sub_1ACC26
										cmpi.b  #1,d0
										bne.s   loc_1ACBA2
										bra.w   loc_1ACC10
loc_1ACBA2:
										
										btst    #0,d0
										beq.s   loc_1ACBAC
										bra.w   loc_1ACBC6
loc_1ACBAC:
										
										move.b  d0,-9(a6)
										move.b  -3(a6),d5
										move.b  -4(a6),d6
										bsr.w   sub_1ACC26
										cmp.b   -9(a6),d0
										beq.s   loc_1ACBC6
										bra.w   loc_1ACC1A
loc_1ACBC6:
										
										move.b  -5(a6),d1
										move.b  -6(a6),d2
										move.b  -3(a6),d3
										move.b  -4(a6),d4
										move.b  -7(a6),d5
										move.b  -8(a6),d6
										bsr.w   sub_1ACC26
										cmpi.b  #1,d0
										bne.s   loc_1ACBEC
										bra.w   loc_1ACC10
loc_1ACBEC:
										
										btst    #0,d0
										beq.s   loc_1ACBF6
										bra.w   loc_1ACC1A
loc_1ACBF6:
										
										move.b  d0,-9(a6)
										move.b  -1(a6),d5
										move.b  -2(a6),d6
										bsr.w   sub_1ACC26
										cmp.b   -9(a6),d0
										beq.s   loc_1ACC10
										bra.w   loc_1ACC1A
loc_1ACC10:
										
										clr.w   d6
										unlk    a6
										movem.l (sp)+,d0-d5/d7-a6
										rts
loc_1ACC1A:
										
										move.b  #$FF,d6
										unlk    a6
										movem.l (sp)+,d0-d5/d7-a6
										rts

	; End of function sub_1ACAD6


; =============== S U B R O U T I N E =======================================

sub_1ACC26:
										
										movem.l d1-a6,-(sp)
										link    a6,#-6
										move.b  d1,-1(a6)
										move.b  d2,-2(a6)
										move.b  d3,-3(a6)
										move.b  d4,-4(a6)
										move.b  d5,-5(a6)
										move.b  d6,-6(a6)
										move.b  -2(a6),d1
										move.b  -4(a6),d0
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										bpl.s   loc_1ACC58
										neg.w   d0
loc_1ACC58:
										
										move.b  -1(a6),d2
										move.b  -3(a6),d1
										ext.w   d1
										ext.w   d2
										sub.w   d2,d1
										bpl.s   loc_1ACC6A
										neg.w   d1
loc_1ACC6A:
										
										cmp.w   d0,d1
										bcc.s   loc_1ACC72
										bra.w   loc_1ACD60
loc_1ACC72:
										
										move.b  -4(a6),d0
										move.b  -2(a6),d1
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										move.w  d0,d6
										move.b  -3(a6),d1
										move.b  -5(a6),d0
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										ext.l   d0
										ext.l   d6
										muls.w  d0,d6
										move.b  -3(a6),d0
										move.b  -1(a6),d1
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										bne.s   loc_1ACCAA
										bra.w   loc_1ACD60
loc_1ACCAA:
										
										ext.l   d0
										ext.l   d6
										divs.w  d0,d6
										move.b  -4(a6),d0
										ext.w   d0
										add.w   d6,d0
										bpl.s   loc_1ACCBE
										bra.w   loc_1ACE22
loc_1ACCBE:
										
										move.b  -6(a6),d1
										ext.w   d1
										sub.w   d1,d0
										beq.s   loc_1ACCCC
										bra.w   loc_1ACD32
loc_1ACCCC:
										
										move.b  -1(a6),d0
										move.b  -3(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACCE0
										bra.w   loc_1ACD08
loc_1ACCE0:
										
										move.b  -5(a6),d1
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACCEE
										bra.w   loc_1ACD5A
loc_1ACCEE:
										
										move.b  -5(a6),d0
										move.b  -3(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACD02
										bra.w   loc_1ACD5A
loc_1ACD02:
										
										eor.w   d0,d0
										bra.w   loc_1ACD32
loc_1ACD08:
										
										move.b  -3(a6),d0
										move.b  -5(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACD1C
										bra.w   loc_1ACD5A
loc_1ACD1C:
										
										move.b  -5(a6),d0
										move.b  -1(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACD30
										bra.w   loc_1ACD5A
loc_1ACD30:
										
										eor.w   d0,d0
loc_1ACD32:
										
										bne.s   loc_1ACD3C
										bset    #0,d0
										bra.w   loc_1ACD40
loc_1ACD3C:
										
										bclr    #0,d0
loc_1ACD40:
										
										bcc.s   loc_1ACD4A
										bset    #1,d0
										bra.w   loc_1ACD4E
loc_1ACD4A:
										
										bclr    #1,d0
loc_1ACD4E:
										
										andi.w  #3,d0
										unlk    a6
										movem.l (sp)+,d1-a6
										rts
loc_1ACD5A:
										
										move    #1,ccr
										bra.s   loc_1ACD32
loc_1ACD60:
										
										move.b  -3(a6),d0
										move.b  -1(a6),d1
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										move.w  d0,d6
										move.b  -6(a6),d0
										move.b  -4(a6),d1
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										ext.l   d0
										ext.l   d6
										muls.w  d0,d6
										move.b  -4(a6),d0
										move.b  -2(a6),d1
										ext.w   d0
										ext.w   d1
										sub.w   d1,d0
										bne.s   loc_1ACD98
										bra.w   loc_1ACE2A
loc_1ACD98:
										
										ext.l   d0
										ext.l   d6
										divs.w  d0,d6
										move.b  -3(a6),d0
										ext.w   d0
										add.w   d6,d0
										bpl.s   loc_1ACDAC
										bra.w   loc_1ACE22
loc_1ACDAC:
										
										move.b  -5(a6),d1
										ext.w   d1
										sub.w   d1,d0
										beq.s   loc_1ACDBA
										bra.w   loc_1ACD32
loc_1ACDBA:
										
										move.b  -2(a6),d0
										move.b  -4(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACDCE
										bra.w   loc_1ACDF4
loc_1ACDCE:
										
										move.b  -6(a6),d1
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACDDA
										bra.s   loc_1ACD5A
loc_1ACDDA:
										
										move.b  -6(a6),d0
										move.b  -4(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACDEE
										bra.w   loc_1ACD5A
loc_1ACDEE:
										
										eor.w   d0,d0
										bra.w   loc_1ACD32
loc_1ACDF4:
										
										move.b  -4(a6),d0
										move.b  -6(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACE08
										bra.w   loc_1ACD5A
loc_1ACE08:
										
										move.b  -6(a6),d0
										move.b  -2(a6),d1
										ext.w   d0
										ext.w   d1
										cmp.w   d1,d0
										bcc.s   loc_1ACE1C
										bra.w   loc_1ACD5A
loc_1ACE1C:
										
										eor.w   d0,d0
										bra.w   loc_1ACD32
loc_1ACE22:
										
										move    #1,ccr
										bra.w   loc_1ACD32
loc_1ACE2A:
										
										ori     #1,ccr
										bra.w   loc_1ACD32

	; End of function sub_1ACC26


; =============== S U B R O U T I N E =======================================

; In: D1 = region #

CheckTriggerRegionFlag:
										
										movem.l d0-a6,-(sp)
										clr.w   d1
										move.b  d0,d1
										addi.w  #$5A,d1 
										jsr     j_CheckFlag
										movem.l (sp)+,d0-a6
										rts

	; End of function CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

UpdateTriggeredRegionsAndAI:
										
										movem.l d0-a6,-(sp)
										move.w  d0,d7
										move.w  #3,d1
										bsr.w   GetAddrOfBattleDataSection
										tst.w   d1
										bne.s   loc_1ACE60
										bra.w   loc_1ACF2A
loc_1ACE60:
										
										move.w  d1,d2
										subi.w  #1,d2
										clr.w   d0
loc_1ACE68:
										
										lea     (byte_FFB20C).l,a0
										move.w  (a0),d1
										btst    d0,d1
										bne.s   loc_1ACE8A
										bsr.w   sub_1AC9FC
										tst.b   d1
										beq.s   loc_1ACE8A
										clr.w   d1
										move.b  d0,d1
										addi.w  #$5A,d1 
										jsr     j_SetFlag
loc_1ACE8A:
										
										move.w  (a0),d1
										bset    d0,d1
										move.w  d1,(a0)
										addi.w  #1,d0
										dbf     d2,loc_1ACE68
										move.w  d7,d0
										jsr     j_GetEnemyAISetting36
										cmpi.w  #$F,d1
										bne.s   loc_1ACEB0
										cmpi.w  #$F,d2
										bne.s   loc_1ACEB0
										bra.w   loc_1ACF2A
loc_1ACEB0:
										
										move.b  d0,d7
										move.b  d2,d6
										move.b  d1,d5
										cmpi.b  #$F,d5
										bne.s   loc_1ACEC0
										bra.w   loc_1ACEF0
loc_1ACEC0:
										
										clr.w   d1
										move.b  d5,d1
										addi.w  #$5A,d1 
										jsr     j_CheckFlag
										bne.s   loc_1ACED4
										bra.w   loc_1ACEF0
loc_1ACED4:
										
										clr.w   d0
										move.w  d7,d0
										jsr     j_GetCharacterWord34
										andi.w  #$FFFE,d1
										bset    #0,d1
										jsr     j_SetCharacterWord34
										bra.w   loc_1ACF2A
loc_1ACEF0:
										
										cmpi.b  #$F,d6
										bne.s   loc_1ACEFA
										bra.w   loc_1ACF2A
loc_1ACEFA:
										
										clr.w   d1
										move.b  d6,d1
										addi.w  #$5A,d1 
										jsr     j_CheckFlag
										bne.s   loc_1ACF0E
										bra.w   loc_1ACF2A
loc_1ACF0E:
										
										clr.w   d0
										move.w  d7,d0
										jsr     j_GetCharacterWord34
										andi.w  #$FFFC,d1
										bset    #0,d1
										bset    #1,d1
										jsr     j_SetCharacterWord34
loc_1ACF2A:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function UpdateTriggeredRegionsAndAI


; =============== S U B R O U T I N E =======================================

; adds respawning enemy #s to target list in RAM

GetListOfSpawningEnemies:
										
										movem.l d0-a6,-(sp)
										move.w  #$20,d7 
										move.w  #$80,d4 
										move.w  d4,d0
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										clr.w   d5
loc_1ACF44:
										
										jsr     j_GetCharacterWord34
										andi.w  #$F00,d1
										tst.w   d1
										bne.s   loc_1ACF56      
										bra.w   loc_1ACFEA
loc_1ACF56:
										
										cmpi.w  #$200,d1        ; 0x200 - region-triggered spawn - check if triggered and if not spawned yet
										bne.w   loc_1ACF92      
										bsr.w   UpdateEnemyActivationIfDead
										tst.w   d0
										beq.s   loc_1ACF6A
										bra.w   loc_1ACFEA
loc_1ACF6A:
										
										move.w  d4,d0
										jsr     j_GetMaxHP
										tst.w   d1
										beq.s   loc_1ACF7A
										bra.w   loc_1ACFEA
loc_1ACF7A:
										
										move.w  d4,d0
										jsr     j_GetCharacterWord34
										bsr.w   UpdateEnemyStatsForRespawn
										bcs.w   loc_1ACFEA
										move.b  d4,(a0,d5.w)
										addi.w  #1,d5
loc_1ACF92:
										
										cmpi.w  #$100,d1        ; 0x100 - respawn - check if dead
										bne.w   loc_1ACFC0      
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_1ACFA8
										bra.w   loc_1ACFEA
loc_1ACFA8:
										
										move.w  d4,d0
										jsr     j_GetCharacterWord34
										bsr.w   UpdateEnemyStatsForRespawn
										bcs.w   loc_1ACFEA
										move.b  d4,(a0,d5.w)
										addi.w  #1,d5
loc_1ACFC0:
										
										cmpi.w  #$300,d1        ; 0x300 - region-triggered respawn - check if dead and triggered
										bne.s   loc_1ACFEA
										bsr.w   UpdateEnemyActivationIfDead
										tst.w   d0
										beq.s   loc_1ACFD2
										bra.w   loc_1ACFEA
loc_1ACFD2:
										
										move.w  d4,d0
										jsr     j_GetCharacterWord34
										bsr.w   UpdateEnemyStatsForRespawn
										bcs.w   loc_1ACFEA
										move.b  d4,(a0,d5.w)
										addi.w  #1,d5
loc_1ACFEA:
										
										addi.w  #1,d4
										move.w  d4,d0
										subq.w  #1,d7
										bne.w   loc_1ACF44
										lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a0
										move.w  d5,(a0)
										movem.l (sp)+,d0-a6
										rts

	; End of function GetListOfSpawningEnemies


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D4 = char idx (same as D0)
; Out: D0 = 0000 if activated and dead, FFFF if not

UpdateEnemyActivationIfDead:
										
										movem.l d1-a6,-(sp)
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_1AD014
										bra.w   loc_1AD07E
loc_1AD014:
										
										jsr     j_GetEnemyAISetting36
										cmpi.b  #$F,d1
										beq.s   loc_1AD044
										move.w  d1,d6
										addi.w  #$5A,d1 
										jsr     j_CheckFlag
										beq.s   loc_1AD044
										move.w  d4,d0
										jsr     j_GetCharacterWord34
										bset    #0,d1
										jsr     j_SetCharacterWord34
										bra.w   loc_1AD088
loc_1AD044:
										
										move.w  d4,d0
										jsr     j_GetEnemyAISetting36
										cmpi.b  #$F,d2
										beq.w   loc_1AD07E
										move.w  d2,d6
										move.w  d2,d1
										addi.w  #$5A,d1 
										jsr     j_CheckFlag
										beq.s   loc_1AD07E
										move.w  d4,d0
										jsr     j_GetCharacterWord34
										bset    #0,d1
										bset    #1,d1
										jsr     j_SetCharacterWord34
										bra.w   loc_1AD088
loc_1AD07E:
										
										move.w  #$FFFF,d0
										movem.l (sp)+,d1-a6
										rts
loc_1AD088:
										
										clr.w   d0
										movem.l (sp)+,d1-a6
										rts

	; End of function UpdateEnemyActivationIfDead


; =============== S U B R O U T I N E =======================================

GetRandomValueSigned:
										
										movem.l d0-d5/a0-a6,-(sp)
										lea     (RANDOM_WAITING_FOR_INPUT).l,a0
										clr.w   d7
										move.b  (a0),d7
										ext.w   d7
										mulu.w  #$21D,d7
										addi.w  #$3039,d7
										andi.w  #$FF,d7
										move.b  d7,(a0)
										movem.l (sp)+,d0-d5/a0-a6
										rts

	; End of function GetRandomValueSigned


; =============== S U B R O U T I N E =======================================

RandomLessThanD6:
										
										movem.l d0-d5/a0-a6,-(sp)
										move.b  d6,d1
loc_1AD0BA:
										
										bsr.s   GetRandomValueSigned
										cmpi.b  #1,d1
										beq.s   loc_1AD0C4
										bpl.s   loc_1AD0C8
loc_1AD0C4:
										
										bra.w   loc_1AD0D4
loc_1AD0C8:
										
										cmp.b   d1,d7
										bcs.s   loc_1AD0CE
										bra.s   loc_1AD0BA
loc_1AD0CE:
										
										movem.l (sp)+,d0-d5/a0-a6
										rts
loc_1AD0D4:
										
										clr.b   d7
										movem.l (sp)+,d0-d5/a0-a6
										rts

	; End of function RandomLessThanD6


; =============== S U B R O U T I N E =======================================

; loads terrain data for current battle

LoadBattleTerrainData:
										
										movem.l d0-d6/a0-a5,-(sp)
										lea     pt_BattleTerrainData(pc), a0
										nop
										lea     ((CURRENT_BATTLE-$1000000)).w,a1
										clr.l   d1
										move.b  (a1),d1
										lsl.l   #2,d1
										movea.l (a0,d1.w),a0
										lea     (TERRAIN_DATA).l,a1
										jsr     (LoadTileData).w
										movem.l (sp)+,d0-d6/a0-a5
										rts

	; End of function LoadBattleTerrainData

pt_BattleTerrainData:
										dc.l BattleTerrain00
										dc.l BattleTerrain01
										dc.l BattleTerrain02
										dc.l BattleTerrain03
										dc.l BattleTerrain03
										dc.l BattleTerrain05
										dc.l BattleTerrain06
										dc.l BattleTerrain07
										dc.l BattleTerrain08
										dc.l BattleTerrain09
										dc.l BattleTerrain10
										dc.l BattleTerrain11
										dc.l BattleTerrain12
										dc.l BattleTerrain13
										dc.l BattleTerrain14
										dc.l BattleTerrain15
										dc.l BattleTerrain16
										dc.l BattleTerrain17
										dc.l BattleTerrain18
										dc.l BattleTerrain19
										dc.l BattleTerrain20
										dc.l BattleTerrain21
										dc.l BattleTerrain22
										dc.l BattleTerrain23
										dc.l BattleTerrain24
										dc.l BattleTerrain25
										dc.l BattleTerrain26
										dc.l BattleTerrain27
										dc.l BattleTerrain28
										dc.l BattleTerrain29
										dc.l BattleTerrain30
										dc.l BattleTerrain31
										dc.l BattleTerrain27
										dc.l BattleTerrain33
										dc.l BattleTerrain34
										dc.l BattleTerrain35
										dc.l BattleTerrain36
										dc.l BattleTerrain37
										dc.l BattleTerrain38
										dc.l BattleTerrain39
										dc.l BattleTerrain40
										dc.l BattleTerrain41
										dc.l BattleTerrain42
										dc.l BattleTerrain43
										dc.l BattleTerrain44
BattleTerrain00:    incbin "battles/entries/battle00/terrain.bin"
BattleTerrain01:    incbin "battles/entries/battle01/terrain.bin"
BattleTerrain02:    incbin "battles/entries/battle02/terrain.bin"
BattleTerrain03:    incbin "battles/entries/battle03/terrain.bin"
BattleTerrain05:    incbin "battles/entries/battle05/terrain.bin"
BattleTerrain06:    incbin "battles/entries/battle06/terrain.bin"
BattleTerrain07:    incbin "battles/entries/battle07/terrain.bin"
BattleTerrain08:    incbin "battles/entries/battle08/terrain.bin"
BattleTerrain09:    incbin "battles/entries/battle09/terrain.bin"
BattleTerrain10:    incbin "battles/entries/battle10/terrain.bin"
BattleTerrain11:    incbin "battles/entries/battle11/terrain.bin"
BattleTerrain12:    incbin "battles/entries/battle12/terrain.bin"
BattleTerrain13:    incbin "battles/entries/battle13/terrain.bin"
BattleTerrain14:    incbin "battles/entries/battle14/terrain.bin"
BattleTerrain15:    incbin "battles/entries/battle15/terrain.bin"
BattleTerrain16:    incbin "battles/entries/battle16/terrain.bin"
BattleTerrain17:    incbin "battles/entries/battle17/terrain.bin"
BattleTerrain18:    incbin "battles/entries/battle18/terrain.bin"
BattleTerrain19:    incbin "battles/entries/battle19/terrain.bin"
BattleTerrain20:    incbin "battles/entries/battle20/terrain.bin"
BattleTerrain21:    incbin "battles/entries/battle21/terrain.bin"
BattleTerrain22:    incbin "battles/entries/battle22/terrain.bin"
BattleTerrain23:    incbin "battles/entries/battle23/terrain.bin"
BattleTerrain24:    incbin "battles/entries/battle24/terrain.bin"
BattleTerrain25:    incbin "battles/entries/battle25/terrain.bin"
BattleTerrain26:    incbin "battles/entries/battle26/terrain.bin"
BattleTerrain27:    incbin "battles/entries/battle27/terrain.bin"
BattleTerrain28:    incbin "battles/entries/battle28/terrain.bin"
BattleTerrain29:    incbin "battles/entries/battle29/terrain.bin"
BattleTerrain30:    incbin "battles/entries/battle30/terrain.bin"
BattleTerrain31:    incbin "battles/entries/battle31/terrain.bin"
BattleTerrain33:    incbin "battles/entries/battle33/terrain.bin"
BattleTerrain34:    incbin "battles/entries/battle34/terrain.bin"
BattleTerrain35:    incbin "battles/entries/battle35/terrain.bin"
BattleTerrain36:    incbin "battles/entries/battle36/terrain.bin"
BattleTerrain37:    incbin "battles/entries/battle37/terrain.bin"
BattleTerrain38:    incbin "battles/entries/battle38/terrain.bin"
BattleTerrain39:    incbin "battles/entries/battle39/terrain.bin"
BattleTerrain40:    incbin "battles/entries/battle40/terrain.bin"
BattleTerrain41:    incbin "battles/entries/battle41/terrain.bin"
BattleTerrain42:    incbin "battles/entries/battle42/terrain.bin"
BattleTerrain43:    incbin "battles/entries/battle43/terrain.bin"
BattleTerrain44:    incbin "battles/entries/battle44/terrain.bin"

; =============== S U B R O U T I N E =======================================

sub_1B120A:
										
										moveq   #4,d1
										jsr     j_AddItemToCaravan
										moveq   #7,d1
										jsr     j_AddItemToCaravan
										moveq   #4,d1
										jsr     j_RemoveItemFromCaravan
										moveq   #0,d1
										jsr     j_RemoveItemFromCaravan
										moveq   #0,d1
										jsr     j_RemoveItemFromCaravan
										moveq   #0,d1
										jsr     j_RemoveItemFromCaravan
										moveq   #0,d0
										jsr     j_JoinForce
										move.b  #0,((CURRENT_BATTLE-$1000000)).w
										jsr     sub_1AC010      ; init some enemy list ?
										bsr.w   InitAllForceBattlePositions
										bsr.w   InitAllEnemyBattlePositions
										move.b  #$80,d0
										moveq   #0,d1
										jsr     j_SetXPos
										move.w  #$AAAA,d1
										bsr.w   UpdateEnemyStatsForRespawn
										bsr.w   GetEnemyAITargetPos
loc_1B126E:
										
										bra.s   loc_1B126E
										rts

	; End of function sub_1B120A


; =============== S U B R O U T I N E =======================================

InitAllForceBattlePositions:
										
										movem.l d0-a6,-(sp)
										moveq   #0,d0
										moveq   #$1D,d7
										move.w  #$FFFF,d1
loc_1B127E:
										
										jsr     j_SetXPos
										addq.b  #1,d0
										dbf     d7,loc_1B127E
										jsr     j_UpdateForce
										lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a1
										move.w  ((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w,d6
										subq.w  #1,d6
										moveq   #0,d1
										bsr.w   GetAddrOfBattleDataSection
										clr.w   d7
										move.b  (a0),d7
										subq.w  #1,d7
										bcs.w   loc_1B12EC
										lea     4(a0),a0
loc_1B12AE:
										
										move.b  (a1),d0
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   loc_1B12D4
										clr.w   d1
										move.b  1(a0),d1
										jsr     j_SetXPos
										move.b  2(a0),d1
										jsr     j_SetYPos
										lea     $C(a0),a0
loc_1B12D4:
										
										addq.l  #1,a1
										subq.w  #1,d6
										bcs.w   loc_1B12EC
										dbf     d7,loc_1B12AE
loc_1B12E0:
										
										move.b  (a1)+,d0
										jsr     j_LeaveBattleParty
										dbf     d6,loc_1B12E0
loc_1B12EC:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function InitAllForceBattlePositions


; =============== S U B R O U T I N E =======================================

InitAllEnemyBattlePositions:
										
										movem.l d0/d7,-(sp)
										move.b  #$80,d0
										moveq   #$1F,d7
loc_1B12FC:
										
										bsr.w   InitEnemyBattlePosition
										addq.b  #1,d0
										dbf     d7,loc_1B12FC
										movem.l (sp)+,d0/d7
										rts

	; End of function InitAllEnemyBattlePositions


; =============== S U B R O U T I N E =======================================

; (also checks for Jaro)

InitEnemyBattlePosition:
										
										movem.l d0-a6,-(sp)
										lea     ((CURRENT_BATTLE-$1000000)).w,a0
										move.b  (a0),d1
										cmpi.b  #$20,d1 
										bne.s   loc_1B132E
										cmpi.b  #$8F,d0
										bne.s   loc_1B132E
										bsr.w   sub_1B1A28
										tst.w   d1
										beq.s   loc_1B132E
										bra.w   loc_1B139A
loc_1B132E:
										
										moveq   #2,d1
										bsr.w   GetAddrOfBattleDataSection
										move.w  d1,d2
										bset    #7,d2
										clr.w   d1
										cmp.b   d2,d0
										bcc.w   loc_1B1368
										move.b  d0,d1
										andi.l  #$7F,d1 
										mulu.w  #$C,d1
										adda.w  d1,a0
										move.w  $A(a0),d1
										andi.w  #$F,d1
										cmpi.w  #2,d1
										bge.w   loc_1B1368
										bsr.w   InitEnemyStats  
										bra.w   loc_1B139A
loc_1B1368:
										
										lsl.w   #8,d1
										jsr     j_SetCharacterWord34
										clr.w   d1
										jsr     j_SetMaxHP
										jsr     j_SetCurrentHP
										move.w  #$FFFF,d1
										jsr     j_SetXPos
										clr.w   d1
										clr.w   d2
										move.b  7(a0),d1
										move.b  9(a0),d2
										jsr     j_SetDefeats
loc_1B139A:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function InitEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = char word 34 (AI stuff)
; Out: carry = 0 if respawn, 1 if not

UpdateEnemyStatsForRespawn:
										
										movem.l d0-a6,-(sp)
										move.w  d1,d2
										moveq   #2,d1
										bsr.w   GetAddrOfBattleDataSection
										bset    #7,d1
										cmp.b   d1,d0
										bcc.w   loc_1B13E8
										move.b  d0,d1
										andi.l  #$7F,d1 
										mulu.w  #$C,d1
										adda.w  d1,a0
										clr.w   d3
										clr.w   d4
										move.b  1(a0),d3
										move.b  2(a0),d4
										bsr.w   GetEnemyOriginalPosOccupied
										bcs.w   loc_1B13E8
										bsr.w   InitEnemyStats  
										move.w  d2,d1
										jsr     j_SetCharacterWord34
										bra.w   loc_1B1404
loc_1B13E8:
										
										clr.w   d1
										jsr     j_SetMaxHP
										jsr     j_SetCurrentHP
										move.w  #$FFFF,d1
										jsr     j_SetXPos
										ori     #1,ccr
loc_1B1404:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function UpdateEnemyStatsForRespawn


; =============== S U B R O U T I N E =======================================

; In: A0 = address of current combatant from battle def

InitEnemyStats:
										
										movem.l d0-a1,-(sp)
										clr.l   d1
										move.b  (a0),d1
										bsr.w   UpgradeUnitIdx  
										move.w  d1,d6
										mulu.w  #$38,d1 
										lea     EnemyData(pc), a1
										adda.w  d1,a1
										move.l  a0,-(sp)
										jsr     j_GetCharacterRAMAddress_0
										moveq   #$D,d7
loc_1B142C:
										
										move.l  (a1)+,(a0)+
										dbf     d7,loc_1B142C
										movea.l (sp)+,a0
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetMaxMP
										jsr     j_SetCurrentMP
										clr.w   d1
										move.b  1(a0),d1
										jsr     j_SetXPos
										move.b  2(a0),d1
										jsr     j_SetYPos
										jsr     j_GetUpperMoveType
										lsl.w   #4,d1
										andi.w  #$F0,d1 
										move.b  3(a0),d2
										andi.w  #$F,d2
										or.w    d2,d1
										jsr     j_SetMoveType
										move.b  d6,d1
										jsr     j_SetEnemyID
										move.b  7(a0),d1
										move.b  9(a0),d2
										jsr     j_SetDefeats
										move.b  6(a0),d1
										move.b  8(a0),d2
										jsr     j_SetKills
										move.w  4(a0),d1
										bsr.w   sub_1B1504      
										jsr     j_GetCharacterWord34
										move.w  d1,d2
										andi.w  #$F000,d2
										move.w  $A(a0),d1
										ror.w   #8,d1
										andi.w  #$FFF,d1
										or.w    d2,d1
										jsr     j_SetCharacterWord34
										bsr.w   SetEnemyBaseATK 
										jsr     j_ApplyStatusAndItemsOnStats
										movem.l (sp)+,d0-a1
										rts

	; End of function InitEnemyStats


; =============== S U B R O U T I N E =======================================

sub_1B14D8:
										
										movem.l d1/a0-a1,-(sp)
										lea     ((byte_FFB6A2-$1000000)).w,a1
										moveq   #7,d1
loc_1B14E2:
										
										clr.l   (a1)+
										dbf     d1,loc_1B14E2
										moveq   #2,d1
										bsr.w   GetAddrOfBattleDataSection
										subq.w  #1,d1
										lea     ((byte_FFB6A2-$1000000)).w,a1
loc_1B14F4:
										
										move.b  (a0),(a1)+
										adda.w  #$C,a0
										dbf     d1,loc_1B14F4
										movem.l (sp)+,d1/a0-a1
										rts

	; End of function sub_1B14D8


; =============== S U B R O U T I N E =======================================

; handle custom item idx of monster list entry starting at A0 -> ???

sub_1B1504:
										
										movem.l d0-a0,-(sp)
										cmpi.w  #ITEMIDX_NOTHING,d1
										beq.w   loc_1B154E
										jsr     j_AddItem
										btst    #7,d1
										beq.s   loc_1B154E
										move.w  d1,d3
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										subi.w  #1,d2
										move.w  d2,d4
										clr.w   d5
loc_1B152E:
										
										move.w  d5,d1
										jsr     j_GetItemAndNumberOfItems
										cmp.b   d1,d3
										bne.s   loc_1B1546
										move.w  d5,d1
										jsr     j_EquipItem
										bra.w   loc_1B154E
loc_1B1546:
										
										addi.w  #1,d5
										dbf     d4,loc_1B152E
loc_1B154E:
										
										movem.l (sp)+,d0-a0
										rts

	; End of function sub_1B1504


; =============== S U B R O U T I N E =======================================

; In: D3 = enemy starting tile x (from battle def)
;     D4 = enemy starting tile y (from battle def)
; Out: carry = if anyone is on D3/D4

GetEnemyOriginalPosOccupied:
										
										movem.l d0-d2/d7,-(sp)
										moveq   #0,d0
										moveq   #$1D,d7
loc_1B155C:
										
										jsr     j_GetXPos
										cmp.w   d1,d3
										bne.s   loc_1B1576
										jsr     j_GetYPos
										cmp.w   d1,d4
										ori     #1,ccr
										beq.w   loc_1B15A4
loc_1B1576:
										
										addq.w  #1,d0
										dbf     d7,loc_1B155C
										move.w  #$80,d0 
										moveq   #$1F,d7
loc_1B1582:
										
										jsr     j_GetXPos
										cmp.w   d1,d3
										bne.s   loc_1B159C
										jsr     j_GetYPos
										cmp.w   d1,d4
										ori     #1,ccr
										beq.w   loc_1B15A4
loc_1B159C:
										
										addq.w  #1,d0
										dbf     d7,loc_1B1582
										tst.b   d0
loc_1B15A4:
										
										movem.l (sp)+,d0-d2/d7
										rts

	; End of function GetEnemyOriginalPosOccupied


; =============== S U B R O U T I N E =======================================

; sets Enemy ATK according to difficulty

SetEnemyBaseATK:
										
										move.l  d1,-(sp)
										jsr     j_GetDifficulty
										cmpi.w  #2,d1
										beq.s   loc_1B15BC
										beq.w   loc_1B15F4
loc_1B15BC:
										
										clr.l   d1
										jsr     j_GetBaseATK
										mulu.w  #5,d1
										lsr.l   #2,d1
										jsr     j_SetBaseATK
										jsr     j_GetDifficulty
										cmpi.w  #2,d1
										beq.s   loc_1B15E0
										bra.w   loc_1B15F4
loc_1B15E0:
										
										clr.l   d1
										jsr     j_GetBaseATK
										mulu.w  #5,d1
										lsr.l   #2,d1
										jsr     j_SetBaseATK
loc_1B15F4:
										
										move.l  (sp)+,d1
										rts

	; End of function SetEnemyBaseATK


; =============== S U B R O U T I N E =======================================

; coords of anchor point used in AI byte D0 -> D1, D2

GetEnemyAITargetPos:
										
										movem.l d0/a0,-(sp)
										btst    #6,d0
										bne.s   loc_1B1612
										jsr     j_GetYPos
										move.w  d1,d2
										jsr     j_GetXPos
										bra.s   loc_1B162A
loc_1B1612:
										
										moveq   #4,d1
										bsr.w   GetAddrOfBattleDataSection
										andi.w  #$F,d0
										add.w   d0,d0
										adda.w  d0,a0
										clr.w   d1
										clr.w   d2
										move.b  (a0),d1
										move.b  1(a0),d2
loc_1B162A:
										
										movem.l (sp)+,d0/a0
										rts

	; End of function GetEnemyAITargetPos


; =============== S U B R O U T I N E =======================================

; get address of subsection D1 (list sizes, force defs, enemy defs, region defs, point defs) of current battle -> A0
;       
;                     if D1 = 2, size of monster list -> D1

GetAddrOfBattleDataSection:
										
										movem.l d0/d2/a1,-(sp)
										move.b  d1,d2
										clr.w   d1
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										lsl.w   #2,d0
										lea     pt_BattleSpriteSets(pc), a0
										nop
										movea.l (a0,d0.w),a0
										tst.b   d2
										beq.w   loc_1B1698
										movea.l a0,a1
										move.b  (a1),d1
										lea     4(a0),a0
										subq.b  #1,d2
										beq.w   loc_1B1698
										clr.l   d0
										move.b  1(a1),d1
										move.b  (a1),d0
										mulu.w  #$C,d0
										adda.l  d0,a0
										subq.b  #1,d2
										beq.w   loc_1B1698
										clr.l   d0
										move.b  2(a1),d1
										move.b  1(a1),d0
										mulu.w  #$C,d0
										adda.l  d0,a0
										subq.b  #1,d2
										beq.w   loc_1B1698
										clr.l   d0
										move.b  3(a1),d1
										move.b  2(a1),d0
										mulu.w  #$C,d0
										adda.l  d0,a0
loc_1B1698:
										
										movem.l (sp)+,d0/d2/a1
										rts

	; End of function GetAddrOfBattleDataSection


; =============== S U B R O U T I N E =======================================

; starting X and Y of monster (D0 - 0x80) -> D1, D2

GetMonsterStartPos:
										
										movem.l d0/d3-a6,-(sp)
										btst    #7,d0
										bne.s   loc_1B16CA
										move.w  #1,d1
										bsr.s   GetAddrOfBattleDataSection
										cmp.b   d0,d1
										bge.s   loc_1B16BE
										move.w  #$FFFF,d1
										move.w  #$FFFF,d2
										bra.w   loc_1B16F8
loc_1B16BE:
										
										andi.w  #$FF,d0
										mulu.w  #$C,d0
										adda.w  d0,a0
										bra.s   loc_1B16EC
loc_1B16CA:
										
										move.w  #2,d1
										bsr.w   GetAddrOfBattleDataSection
										cmp.b   d0,d1
										bge.s   loc_1B16E2
										move.w  #$FFFF,d1
										move.w  #$FFFF,d2
										bra.w   loc_1B16F8
loc_1B16E2:
										
										andi.w  #$7F,d0 
										mulu.w  #$C,d0
										adda.w  d0,a0
loc_1B16EC:
										
										clr.w   d1
										clr.w   d2
										move.b  1(a0),d1
										move.b  2(a0),d2
loc_1B16F8:
										
										movem.l (sp)+,d0/d3-a6
										rts

	; End of function GetMonsterStartPos


; =============== S U B R O U T I N E =======================================

sub_1B16FE:
										
										movem.l d1-a6,-(sp)
										move.w  d2,d7
										move.w  d1,d6
										move.w  #2,d1
										bsr.w   GetAddrOfBattleDataSection
										move.w  d1,d5
										subi.w  #1,d5
										move.w  #$80,d0 
										tst.w   d1
										bne.s   loc_1B1724
										move.w  #$FFFF,d0
										bra.w   loc_1B177A
loc_1B1724:
										
										move.b  1(a0),d1
										move.b  2(a0),d2
										cmp.b   d1,d6
										bne.s   loc_1B176A
										cmp.b   d2,d7
										bne.s   loc_1B176A
										jsr     j_GetCharacterWord34
										cmpi.w  #$200,d1
										bne.s   loc_1B176A
										jsr     j_GetEnemyAISetting36
										cmpi.w  #$F,d1
										bne.s   loc_1B176A
										cmpi.w  #$F,d2
										bne.s   loc_1B176A
										jsr     j_GetMaxHP
										tst.w   d1
										bne.s   loc_1B176A
										jsr     j_GetCharacterWord34
										bsr.w   UpdateEnemyStatsForRespawn
										bra.w   loc_1B177A
loc_1B176A:
										
										addi.w  #1,d0
										adda.w  #$C,a0
										dbf     d5,loc_1B1724
										move.w  #$FFFF,d0
loc_1B177A:
										
										movem.l (sp)+,d1-a6
										rts

	; End of function sub_1B16FE


; =============== S U B R O U T I N E =======================================

; check if battle can be upgraded based on index in RAM:f712 (0x0000=no, 0xffff=yes) -> D1

DoesBattleUpgrade:
										
										movem.l d0/d2-a6,-(sp)
										clr.w   d1              ; clear d1 for "false"
										lea     ((CURRENT_BATTLE-$1000000)).w,a0
																						; point to battle index in RAM
										clr.w   d7
										move.b  (a0),d7         ; d7 contains battle index
										clr.w   d6
										lea     SpecialBattles(pc), a0
																						; point to length of table
										nop
										move.b  (a0)+,d6        ; put length of table in d6
										tst.b   d6
										bne.s   loc_1B17A0      ; if d6 not zero
										bra.w   loc_1B17B6      ; else
loc_1B17A0:
										
										subi.w  #1,d6           ; d6--
loc_1B17A4:
										
										move.b  (a0)+,d0        ; put next byte in d0
										cmp.b   d7,d0
										bne.s   loc_1B17B2      ; while d0 not battle index
										move.w  #$FFFF,d1       ; else, battle index is in the list, put FFFF ind d1, for "true"
										bra.w   loc_1B17B6
loc_1B17B2:
										
										dbf     d6,loc_1B17A4   
loc_1B17B6:
										
										movem.l (sp)+,d0/d2-a6
										rts

	; End of function DoesBattleUpgrade


; =============== S U B R O U T I N E =======================================

sub_1B17BC:
										
										movem.l d0-a6,-(sp)
										lea     ((CURRENT_BATTLE-$1000000)).w,a0
										move.b  (a0),d7
										lea     SpecialBattles(pc), a1
										nop
										clr.w   d2
										move.b  (a1),d2
										subi.w  #1,d2
										adda.w  #1,a1
										clr.w   d3
loc_1B17DA:
										
										move.b  (a1,d3.w),d1
										cmp.b   d1,d7
										bne.s   loc_1B17F0
										addi.w  #$1F4,d1
										jsr     j_SetFlag
										bra.w   loc_1B17F8
loc_1B17F0:
										
										addi.w  #1,d3
										dbf     d2,loc_1B17DA
loc_1B17F8:
										
										movem.l (sp)+,d0-a6
										rts

	; End of function sub_1B17BC


; =============== S U B R O U T I N E =======================================

; check if battle should be upgraded based on index in RAM:f712 and if normal battle was done (0=no, 1=yes) -> D1

ShouldBattleUpgrade:
										
										movem.l d0/d2-a6,-(sp)
										lea     ((CURRENT_BATTLE-$1000000)).w,a0
										move.b  (a0),d7
										lea     SpecialBattles(pc), a1
										nop
										clr.w   d2
										move.b  (a1),d2
										subi.w  #1,d2
										adda.w  #1,a1
										clr.w   d3
loc_1B181C:
										
										clr.w   d1
										move.b  (a1,d3.w),d1
										cmp.b   d1,d7
										bne.s   loc_1B183E
										addi.w  #$1F4,d1
										jsr     j_CheckFlag
										bne.s   loc_1B1836
										clr.w   d1
										bra.s   loc_1B183A
loc_1B1836:
										
										move.w  #1,d1
loc_1B183A:
										
										bra.w   loc_1B1846
loc_1B183E:
										
										addi.w  #1,d3
										dbf     d2,loc_1B181C
loc_1B1846:
										
										movem.l (sp)+,d0/d2-a6
										rts

	; End of function ShouldBattleUpgrade


; =============== S U B R O U T I N E =======================================

; In: D1 = original unit idx
; Out: D1 = upgraded unit idx

UpgradeUnitIdx:
										
										movem.l d0/d2-a6,-(sp)
										move.w  d1,d5
										bsr.w   DoesBattleUpgrade
										tst.w   d1
										bne.s   loc_1B1860
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B1860:
										
										bsr.s   ShouldBattleUpgrade
										tst.w   d1
										bne.s   loc_1B186C
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B186C:
										
										clr.w   d4
										clr.l   d1
										move.b  d5,d1
										mulu.w  #$38,d1 
										lea     EnemyData(pc), a1
										adda.w  d1,a1
										move.b  $31(a1),d2
										lsr.w   #4,d2
										andi.b  #$F,d2
										cmpi.b  #1,d2
										bne.s   loc_1B1896
										lea     unk_1B6DBC(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B1896:
										
										cmpi.b  #2,d2
										bne.s   loc_1B18A6
										lea     unk_1B6DBC(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18A6:
										
										cmpi.b  #3,d2
										bne.s   loc_1B18B6
										lea     unk_1B6DBC(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18B6:
										
										cmpi.b  #4,d2
										bne.s   loc_1B18C6
										lea     unk_1B6DBC(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18C6:
										
										cmpi.b  #5,d2
										bne.s   loc_1B18D6
										lea     unk_1B6DC6(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18D6:
										
										cmpi.b  #6,d2
										bne.s   loc_1B18E6
										lea     unk_1B6DC6(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18E6:
										
										cmpi.b  #8,d2
										bne.s   loc_1B18F6
										lea     unk_1B6DCA(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B18F6:
										
										cmpi.b  #9,d2
										bne.s   loc_1B1906
										lea     unk_1B6DCA(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B1906:
										
										cmpi.b  #$A,d2
										bne.s   loc_1B1916
										lea     unk_1B6DCA(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B1916:
										
										cmpi.b  #$B,d2
										bne.s   loc_1B1926
										lea     unk_1B6DD0(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B1926:
										
										cmpi.b  #$C,d2
										bne.s   loc_1B1936
										lea     unk_1B6DD5(pc), a0
										nop
										bra.w   loc_1B193C
loc_1B1936:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B193C:
										
										clr.w   d3
										move.b  d5,d3
										clr.w   d2
										clr.w   d0
										jsr     j_GetCurrentLevel
										move.w  d1,d2
										jsr     j_GetClass      
										cmpi.b  #$B,d1
										ble.s   loc_1B195C
										addi.w  #$14,d2
loc_1B195C:
										
										lea     ((CURRENT_BATTLE-$1000000)).w,a1
										clr.w   d1
										move.b  (a1),d1
										sub.w   d1,d2
										bne.s   loc_1B197A
										tst.w   d4
										bne.s   loc_1B1974
										move.w  #1,d4
										bra.s   loc_1B193C
										bra.s   loc_1B197A
loc_1B1974:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B197A:
										
										bpl.s   loc_1B198E
										tst.w   d4
										bne.s   loc_1B1988
										move.w  #1,d4
										bra.s   loc_1B193C
										bra.s   loc_1B198E
loc_1B1988:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B198E:
										
										divu.w  #$A,d2
										andi.l  #$FF,d2
										tst.w   d2
										bne.s   loc_1B19A2
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B19A2:
										
										clr.w   d6
										move.b  (a0),d6
										cmpi.b  #5,d6
										bne.s   loc_1B19B0
										mulu.w  d6,d2
										subq.w  #5,d2
loc_1B19B0:
										
										add.w   d2,d3
										move.w  d3,d2
										addi.w  #1,d6
loc_1B19B8:
										
										jsr     (UpdateRandomSeed).w
										add.w   d7,d3
										cmp.b   1(a0),d3
										bge.s   loc_1B19D8
										tst.w   d4
										bne.s   loc_1B19D2
										move.w  #1,d4
										move.w  d2,d3
										bra.s   loc_1B19B8
										bra.s   loc_1B19D8
loc_1B19D2:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B19D8:
										
										cmp.b   2(a0),d3
										ble.s   loc_1B19F2
										tst.w   d4
										bne.s   loc_1B19EC
										move.w  #1,d4
										move.w  d2,d3
										bra.s   loc_1B19B8
										bra.s   loc_1B19F2
loc_1B19EC:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B19F2:
										
										movea.l a0,a1
										adda.w  #3,a1
										clr.w   d1
										move.b  (a1)+,d1
										subi.w  #1,d1
loc_1B1A00:
										
										move.b  (a1)+,d0
										cmp.b   d0,d3
										bne.s   loc_1B1A1A
										tst.w   d4
										bne.s   loc_1B1A14
										move.w  #1,d4
										move.w  d2,d3
										bra.s   loc_1B19B8
										bra.s   loc_1B1A1A
loc_1B1A14:
										
										move.w  d5,d1
										bra.w   loc_1B1A22
loc_1B1A1A:
										
										dbf     d1,loc_1B1A00
										clr.w   d1
										move.b  d3,d1
loc_1B1A22:
										
										movem.l (sp)+,d0/d2-a6
										rts

	; End of function UpgradeUnitIdx


; =============== S U B R O U T I N E =======================================

sub_1B1A28:
										
										movem.l d0/d2-a6,-(sp)
										jsr     j_UpdateForce
										lea     ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,a0
										move.w  (a0),d7
										subi.w  #1,d7
										lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
										clr.l   d6
loc_1B1A42:
										
										clr.w   d0
										move.b  (a0,d6.w),d0
										cmpi.b  #$17,d0
										bne.s   loc_1B1A56
										move.w  #1,d1
										bra.w   loc_1B1A60
loc_1B1A56:
										
										addi.w  #1,d6
										dbf     d7,loc_1B1A42
										clr.w   d1
loc_1B1A60:
										
										movem.l (sp)+,d0/d2-a6
										rts

	; End of function sub_1B1A28

EnemyData:          incbin "battles/global/enemydata.bin"
pt_BattleSpriteSets:dc.l BattleSpriteSet00  ; battle entity data
										dc.l BattleSpriteSet01
										dc.l BattleSpriteSet02
										dc.l BattleSpriteSet03
										dc.l BattleSpriteSet04
										dc.l BattleSpriteSet05
										dc.l BattleSpriteSet06
										dc.l BattleSpriteSet07
										dc.l BattleSpriteSet08
										dc.l BattleSpriteSet09
										dc.l BattleSpriteSet10
										dc.l BattleSpriteSet11
										dc.l BattleSpriteSet12
										dc.l BattleSpriteSet13
										dc.l BattleSpriteSet14
										dc.l BattleSpriteSet15
										dc.l BattleSpriteSet16
										dc.l BattleSpriteSet17
										dc.l BattleSpriteSet18
										dc.l BattleSpriteSet19
										dc.l BattleSpriteSet20
										dc.l BattleSpriteSet21
										dc.l BattleSpriteSet22
										dc.l BattleSpriteSet23
										dc.l BattleSpriteSet24
										dc.l BattleSpriteSet25
										dc.l BattleSpriteSet26
										dc.l BattleSpriteSet27
										dc.l BattleSpriteSet28
										dc.l BattleSpriteSet29
										dc.l BattleSpriteSet30
										dc.l BattleSpriteSet31
										dc.l BattleSpriteSet32
										dc.l BattleSpriteSet33
										dc.l BattleSpriteSet34
										dc.l BattleSpriteSet35
										dc.l BattleSpriteSet36
										dc.l BattleSpriteSet37
										dc.l BattleSpriteSet38
										dc.l BattleSpriteSet39
										dc.l BattleSpriteSet40
										dc.l BattleSpriteSet41
										dc.l BattleSpriteSet42
										dc.l BattleSpriteSet43
										dc.l BattleSpriteSet44
BattleSpriteSet00:  incbin "battles/entries/battle00/spriteset.bin"
BattleSpriteSet01:  incbin "battles/entries/battle01/spriteset.bin"
BattleSpriteSet02:  incbin "battles/entries/battle02/spriteset.bin"
BattleSpriteSet03:  incbin "battles/entries/battle03/spriteset.bin"
BattleSpriteSet04:  incbin "battles/entries/battle04/spriteset.bin"
BattleSpriteSet05:  incbin "battles/entries/battle05/spriteset.bin"
BattleSpriteSet06:  incbin "battles/entries/battle06/spriteset.bin"
BattleSpriteSet07:  incbin "battles/entries/battle07/spriteset.bin"
BattleSpriteSet08:  incbin "battles/entries/battle08/spriteset.bin"
BattleSpriteSet09:  incbin "battles/entries/battle09/spriteset.bin"
BattleSpriteSet10:  incbin "battles/entries/battle10/spriteset.bin"
BattleSpriteSet11:  incbin "battles/entries/battle11/spriteset.bin"
BattleSpriteSet12:  incbin "battles/entries/battle12/spriteset.bin"
BattleSpriteSet13:  incbin "battles/entries/battle13/spriteset.bin"
BattleSpriteSet14:  incbin "battles/entries/battle14/spriteset.bin"
BattleSpriteSet15:  incbin "battles/entries/battle15/spriteset.bin"
BattleSpriteSet16:  incbin "battles/entries/battle16/spriteset.bin"
BattleSpriteSet17:  incbin "battles/entries/battle17/spriteset.bin"
BattleSpriteSet18:  incbin "battles/entries/battle18/spriteset.bin"
BattleSpriteSet19:  incbin "battles/entries/battle19/spriteset.bin"
BattleSpriteSet20:  incbin "battles/entries/battle20/spriteset.bin"
BattleSpriteSet21:  incbin "battles/entries/battle21/spriteset.bin"
BattleSpriteSet22:  incbin "battles/entries/battle22/spriteset.bin"
BattleSpriteSet23:  incbin "battles/entries/battle23/spriteset.bin"
BattleSpriteSet24:  incbin "battles/entries/battle24/spriteset.bin"
BattleSpriteSet25:  incbin "battles/entries/battle25/spriteset.bin"
BattleSpriteSet26:  incbin "battles/entries/battle26/spriteset.bin"
BattleSpriteSet27:  incbin "battles/entries/battle27/spriteset.bin"
BattleSpriteSet28:  incbin "battles/entries/battle28/spriteset.bin"
BattleSpriteSet29:  incbin "battles/entries/battle29/spriteset.bin"
BattleSpriteSet30:  incbin "battles/entries/battle30/spriteset.bin"
BattleSpriteSet31:  incbin "battles/entries/battle31/spriteset.bin"
BattleSpriteSet32:  incbin "battles/entries/battle32/spriteset.bin"
BattleSpriteSet33:  incbin "battles/entries/battle33/spriteset.bin"
BattleSpriteSet34:  incbin "battles/entries/battle34/spriteset.bin"
BattleSpriteSet35:  incbin "battles/entries/battle35/spriteset.bin"
BattleSpriteSet36:  incbin "battles/entries/battle36/spriteset.bin"
BattleSpriteSet37:  incbin "battles/entries/battle37/spriteset.bin"
BattleSpriteSet38:  incbin "battles/entries/battle38/spriteset.bin"
BattleSpriteSet39:  incbin "battles/entries/battle39/spriteset.bin"
BattleSpriteSet40:  incbin "battles/entries/battle40/spriteset.bin"
BattleSpriteSet41:  incbin "battles/entries/battle41/spriteset.bin"
BattleSpriteSet42:  incbin "battles/entries/battle42/spriteset.bin"
BattleSpriteSet43:  incbin "battles/entries/battle43/spriteset.bin"
BattleSpriteSet44:  incbin "battles/entries/battle44/spriteset.bin"
SpecialBattles:     incbin "battles/global/specialbattles.bin"
unk_1B6DBC:         dc.b   5
										dc.b   0
										dc.b $23 
										dc.b   6
										dc.b  $A
										dc.b  $D
										dc.b  $E
										dc.b  $F
										dc.b $20
										dc.b $26 
unk_1B6DC6:         dc.b   2
										dc.b $28 
										dc.b $34 
										dc.b   0
unk_1B6DCA:         dc.b   2
										dc.b $38 
										dc.b $41 
										dc.b   2
										dc.b $3B 
										dc.b $3D 
unk_1B6DD0:         dc.b   1
										dc.b $43 
										dc.b $4A 
										dc.b   1
										dc.b $47 
unk_1B6DD5:         dc.b   2
										dc.b $4C 
										dc.b $54 
										dc.b   1
										dc.b $50 
plt_EndKiss:        incbin "graphics/specialscreens/endingkiss/endingkisspalette.bin"
EndKissPicture:     incbin "graphics/specialscreens/endingkiss/endingkisstiles.bin"
										align $4000
